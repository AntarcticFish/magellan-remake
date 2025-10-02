require "behaviours/wander"
require "behaviours/chaseandattack"
require "behaviours/panic"
require "behaviours/attackwall"
require "behaviours/minperiod"
require "behaviours/leash"
require "behaviours/faceentity"
require "behaviours/doaction"
require "behaviours/standstill"
require "behaviours/runaway"

local Uav_Brain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local MIN_FOLLOW_LEADER = 2
local MAX_FOLLOW_LEADER = 15
local TARGET_FOLLOW_LEADER = 7
local AVOID_EXPLOSIVE_DIST = 5
-- 定义无人机的徘徊时机变量，包括最小等待时间和随机等待时间的范围
local WANDER_TIMING = {minwaittime = 6, randwaittime = 3}

local function GetLeader(inst)
    return inst.components.follower ~= nil and inst.components.follower.leader or nil
end

local function ShouldAvoidExplosive(target)
    return target.components.explosive == nil
        or target.components.burnable == nil
        or target.components.burnable:IsBurning()
end

local IsNear = 15
local SEE_DIST = 15

local function CanWork(inst)
    return inst.components.follower.leader ~= nil and inst.workable
end

local function FindTree(inst)
    local target = FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        return item.components.growable and item.components.growable:GetStage() >= 2
    end, { "tree", "CHOP_workable"})
    if target ~= nil then
        inst.tree_target = target
    end
    return target
end

local function StartChoppingCondition(inst)
    return inst.workable ~= nil and
        (inst.tree_target ~= nil or inst.sg:HasStateTag("chopping") or FindTree(inst) ~= nil)
end

local function KeepChoppingAction(inst)
    return inst.tree_target ~= nil
end

local function FindTreeToChopAction(inst)
    if inst.workable then
        local target
        if inst.tree_target ~= nil then
            target = inst.tree_target
            inst.tree_target = nil
        else
            target = FindTree(inst)
        end
        if target ~= nil then
            return BufferedAction(inst, target, ACTIONS.CHOP)
        end
    end

    return false
end

local function PickGrassTwigs(inst)
    if CanWork(inst) and not inst.sg:HasStateTag("working") and not inst.components.inventory:IsFull() and inst.workable then
        local target = FindEntity(inst, 3, function(item)
            return item.components.pickable ~= nil
                and item.components.pickable:CanBePicked() and item:IsOnValidGround()
        end)

        if target == nil then
            target = FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
                return item.components.pickable ~= nil
                    and item.components.pickable:CanBePicked() and item:HasTag("pickable") and not item:HasTag("flower")
            end)
        end
        if target ~= nil then
            return BufferedAction(inst, target, ACTIONS.PICK)
        end
    end
    return false
end

local function PickUpAction(inst)
    if CanWork(inst) and not inst.sg:HasStateTag("working") and not inst.components.inventory:IsFull() and inst.workable then
        local target = FindEntity(inst.components.follower.leader, IsNear, function(item) --搜索周边 没有就搜索其他的位置
            return item.components.inventoryitem ~= nil and not item.components.health and item:IsOnValidGround()
        end)

        if target == nil then
            FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
                return item.components.inventoryitem ~= nil and not item.components.health and item:IsOnValidGround()
            end)
        end

        if target ~= nil then
            return BufferedAction(inst, target, ACTIONS.PICKUP)
        end
    end
    return false
end

local function DigStump(inst)
    if CanWork(inst) and not inst.sg:HasStateTag("working") and inst.workable then
        local target = FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
            return item:HasTag("stump")
        end)
        if target ~= nil then
            return BufferedAction(inst, target, ACTIONS.DIG)
        end
    end
    return false
end

local function FindEntityToWorkAction(inst, action, addtltags) --挖矿
    if inst.sg:HasStateTag("working") then
        return
    end

    -- local target = FindEntity(inst, SEE_DIST,
    --     function(item) return item.components.workable and item.components.workable.action == action end)
    local target = FindEntity(inst, SEE_DIST,
        function(item) return item.components.workable and item.components.workable.action == action end,
        nil,
        addtltags,
        nil,
        function(a, b) return a:GetDistanceSqToInst(inst) < b:GetDistanceSqToInst(inst) end)

    -- print(inst, action, target)
    if target then
        return BufferedAction(inst, target, action)
    end
    return false
end

local function CanAttack(inst)
    local target = inst.components.combat.target or inst:GetTarget(inst)
    if target ~= nil then
        if inst:IsWithinAttackRange(target) then
            inst.components.combat:SetTarget(target)
            return true
        else
            inst.components.combat:GiveUp()
        end
    end
    return false
end

function Uav_Brain:OnStart()
    local root = PriorityNode(
        {
            PriorityNode({
                WhileNode( --自动挖矿
                    function()
                        return not self.inst:HasTag("working") and self.inst.workable
                    end,
                    "keep mining",
                    DoAction(self.inst, function() return FindEntityToWorkAction(self.inst, ACTIONS.MINE) end)),
                IfThenDoWhileNode(function() return StartChoppingCondition(self.inst) end,
                    function() return KeepChoppingAction(self.inst) end,
                    "Chop Tree",
                    LoopNode
                    { ChattyNode(self.inst, "SERVANT_CHOP_TREE", DoAction(self.inst, FindTreeToChopAction, "Pick Up", true)) }),
                ChattyNode(self.inst, "SERVANT_CHOP_TREE", DoAction(self.inst, DigStump, "Dig Stump", true)),
                ChattyNode(self.inst, "SERVANT_PICKUP", DoAction(self.inst, PickUpAction, "Pick Up", true)),
                ChattyNode(self.inst, "SERVANT_PICK", DoAction(self.inst, PickGrassTwigs, "Pick Grass And Twigs", true)),

                WhileNode(function()
                        return CanAttack(self.inst)
                    end,
                    "AttackIfNotInCooldown",
                    ChaseAndAttack(self.inst, 3)
                ),
                Follow(self.inst, GetLeader, MIN_FOLLOW_LEADER, TARGET_FOLLOW_LEADER, MAX_FOLLOW_LEADER, true),
                FaceEntity(self.inst, GetLeader, GetLeader),
                RunAway(self.inst, { fn = ShouldAvoidExplosive, tags = { "explosive" }, notags = { "INLIMBO" } },
                AVOID_EXPLOSIVE_DIST, AVOID_EXPLOSIVE_DIST),
                -- 随机漫游行为
                Wander(self.inst, nil, nil, WANDER_TIMING)
            }, .25)
        }, .25)

    self.bt = BT(self.inst, root)
end

return Uav_Brain
