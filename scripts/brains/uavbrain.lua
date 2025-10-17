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

local MIN_FOLLOW_LEADER = 0
local TARGET_FOLLOW_LEADER = 5
local MAX_FOLLOW_LEADER = 15
local AVOID_EXPLOSIVE_DIST = 5
local MAX_WORK_DIST_FROM_LEADER = 16 -- 无人机工作时与玩家的最大距离
-- 定义无人机的徘徊时机变量，包括最小等待时间和随机等待时间的范围
local WANDER_TIMING = {minwaittime = 6, randwaittime = 3}
local SEE_DIST = 15

-------------------------------------------------------------------------------
-- 工具函数
-------------------------------------------------------------------------------

local function GetLeader(inst)
    return inst.components.follower ~= nil and inst.components.follower.leader or nil
end

local function ShouldAvoidExplosive(target)
    return target.components.explosive == nil
        or target.components.burnable == nil
        or target.components.burnable:IsBurning()
end

-------------------------------------------------------------------------------
-- 工作相关函数
-------------------------------------------------------------------------------

--[[
    检查无人机是否可以工作
    @param inst 无人机实例
    @return boolean 是否可以工作
]]
local function CanWork(inst)
    local leader = GetLeader(inst)
    return leader ~= nil 
        and inst.workable 
        and inst:GetDistanceSqToInst(leader) <= MAX_WORK_DIST_FROM_LEADER * MAX_WORK_DIST_FROM_LEADER
end

--[[
    查找附近的树木目标
    @param inst 无人机实例
    @return 目标实体或nil
]]
local function FindTree(inst)
    local leader = GetLeader(inst)
    if not leader then 
        return nil 
    end
    
    local target = FindEntity(leader, SEE_DIST, function(item)
        return item:IsValid() 
            and item.components.growable 
            and item.components.growable:GetStage() >= 2
    end, { "tree", "CHOP_workable"})
    
    if target ~= nil then
        inst.tree_target = target
    end
    return target
end

--[[
    检查是否应该开始砍树
    @param inst 无人机实例
    @return boolean 是否应该开始砍树
]]
local function StartChoppingCondition(inst)
    return inst.workable ~= nil and
        (inst.tree_target ~= nil 
         or inst.sg:HasStateTag("chopping") 
         or FindTree(inst) ~= nil)
end

--[[
    检查是否应该继续砍树
    @param inst 无人机实例
    @return boolean 是否应该继续砍树
]]
local function KeepChoppingAction(inst)
    return inst.tree_target ~= nil
end

--[[
    寻找砍树动作
    @param inst 无人机实例
    @return BufferedAction 动作或false
]]
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

-------------------------------------------------------------------------------
-- 工作目标收集函数
-------------------------------------------------------------------------------

--[[
    收集挖矿目标
    @param inst 无人机实例
    @param possible_actions 可能的动作列表
]]
local function CollectMineTargets(inst, possible_actions)
    local mine_targets = {}
    FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        if item.components.workable and item.components.workable.action == ACTIONS.MINE then
            table.insert(mine_targets, item)
            return true
        end
        return false
    end)
    
    for _, target in ipairs(mine_targets) do
        if target:IsValid() then
            local action = BufferedAction(inst, target, ACTIONS.MINE)
            table.insert(possible_actions, {action = action, dist = target:GetDistanceSqToInst(inst)})
        end
    end
end

--[[
    收集砍树目标
    @param inst 无人机实例
    @param possible_actions 可能的动作列表
]]
local function CollectTreeTargets(inst, possible_actions)
    local tree_targets = {}
    FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        if item:HasTag("tree") 
           and item:HasTag("CHOP_workable") 
           and item.components.growable 
           and item.components.growable:GetStage() >= 2 then
            table.insert(tree_targets, item)
            return true
        end
        return false
    end)
    
    if inst.tree_target ~= nil then
        table.insert(tree_targets, inst.tree_target)
    end
    
    for _, target in ipairs(tree_targets) do
        if target:IsValid() then
            local action = BufferedAction(inst, target, ACTIONS.CHOP)
            table.insert(possible_actions, {action = action, dist = target:GetDistanceSqToInst(inst)})
        end
    end
end

--[[
    收集挖树桩目标
    @param inst 无人机实例
    @param possible_actions 可能的动作列表
]]
local function CollectStumpTargets(inst, possible_actions)
    local stump_targets = {}
    FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        if item:HasTag("stump") then
            table.insert(stump_targets, item)
            return true
        end
        return false
    end)
    
    for _, target in ipairs(stump_targets) do
        if target:IsValid() then
            local action = BufferedAction(inst, target, ACTIONS.DIG)
            table.insert(possible_actions, {action = action, dist = target:GetDistanceSqToInst(inst)})
        end
    end
end

--[[
    收集拾取物品目标
    @param inst 无人机实例
    @param possible_actions 可能的动作列表
]]
local function CollectPickupTargets(inst, possible_actions)
    local pickup_targets = {}
    -- 先收集无人机周围的
    FindEntity(inst, 3, function(item)
        if item.components.inventoryitem 
           and not item.components.health 
           and item:IsOnValidGround() then
            table.insert(pickup_targets, item)
            return true
        end
        return false
    end)
    
    -- 再收集领导者周围的
    FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        if item.components.inventoryitem 
           and not item.components.health 
           and item:IsOnValidGround() then
            -- 避免重复添加
            local already_added = false
            for _, added_item in ipairs(pickup_targets) do
                if added_item == item then
                    already_added = true
                    break
                end
            end
            if not already_added then
                table.insert(pickup_targets, item)
            end
            return true
        end
        return false
    end)
    
    for _, target in ipairs(pickup_targets) do
        if target:IsValid() then
            local action = BufferedAction(inst, target, ACTIONS.PICKUP)
            table.insert(possible_actions, {action = action, dist = target:GetDistanceSqToInst(inst)})
        end
    end
end

--[[
    收集采集草和小树枝目标
    @param inst 无人机实例
    @param possible_actions 可能的动作列表
]]
local function CollectGrassTargets(inst, possible_actions)
    local grass_targets = {}
    FindEntity(inst, 3, function(item)
        -- 使用标准的可采集判断逻辑
        if item.components.pickable 
           and item:IsOnValidGround() 
           and item.components.pickable.caninteractwith 
           and item.components.pickable:CanBePicked() then
            table.insert(grass_targets, item)
            return true
        end
        return false
    end)
    
    FindEntity(inst.components.follower.leader, SEE_DIST, function(item)
        if item.components.pickable
           and item:HasTag("pickable")
           and not item:HasTag("flower")
           and item.components.pickable.caninteractwith
           and item.components.pickable:CanBePicked() then
            -- 避免重复添加
            local already_added = false
            for _, added_item in ipairs(grass_targets) do
                if added_item == item then
                    already_added = true
                    break
                end
            end
            if not already_added then
                table.insert(grass_targets, item)
            end
            return true
        end
        return false
    end)
    
    for _, target in ipairs(grass_targets) do
        if target:IsValid() then
            local action = BufferedAction(inst, target, ACTIONS.PICK)
            table.insert(possible_actions, {action = action, dist = target:GetDistanceSqToInst(inst)})
        end
    end
end

--[[
    寻找最近的工作动作
    @param inst 无人机实例
    @return BufferedAction 最近的工作动作或false
]]
local function FindNearestWorkAction(inst)
    if not CanWork(inst) then
        return false
    end
    
    -- 如果正在工作中，不执行新的工作
    if inst.sg:HasStateTag("working") then
        return false
    end
    
    -- 直接收集所有可能的工作目标并按距离排序
    local possible_actions = {}
    
    -- 收集各类工作目标
    CollectMineTargets(inst, possible_actions)
    CollectTreeTargets(inst, possible_actions)
    CollectStumpTargets(inst, possible_actions)
    CollectPickupTargets(inst, possible_actions)
    CollectGrassTargets(inst, possible_actions)
    
    -- 如果有找到工作目标，按距离排序并返回最近的
    if #possible_actions > 0 then
        table.sort(possible_actions, function(a, b) return a.dist < b.dist end)
        return possible_actions[1].action
    end
    return false
end

-------------------------------------------------------------------------------
-- 战斗相关函数
-------------------------------------------------------------------------------

--[[
    检查是否可以攻击
    @param inst 无人机实例
    @return boolean 是否可以攻击
]]
local function CanAttack(inst)
    -- 获取当前目标
    local currentTarget = inst.components.combat.target
    
    -- 获取领导者
    local leader = GetLeader(inst)
    
    -- 如果有领导者且领导者有攻击目标，优先考虑领导者的目标
    local leaderTarget = nil
    if leader and leader.components.combat and leader.components.combat.target then
        leaderTarget = leader.components.combat.target
        
        -- 如果领导者的目标有效且可攻击，设置为新目标
        if leaderTarget 
           and inst.components.combat:CanTarget(leaderTarget) 
           and inst:IsWithinAttackRange(leaderTarget) then
            inst.components.combat:SetTarget(leaderTarget)
            return true
        end
    end
    
    -- 常规目标检查逻辑
    local target = currentTarget or inst:GetTarget(inst)
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

-------------------------------------------------------------------------------
-- 主要类定义
-------------------------------------------------------------------------------

local Uav_Brain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

--[[
    初始化行为树
]]
function Uav_Brain:OnStart()
    local root = PriorityNode(
        {
            PriorityNode({
                -- 执行最近的工作动作
                WhileNode(
                    function() return CanWork(self.inst) end,
                    "WorkAction",
                    DoAction(self.inst, FindNearestWorkAction, "WorkAction", true)
                ),

                -- 砍树行为（循环执行）
                WhileNode(
                    function() return StartChoppingCondition(self.inst) end,
                    "KeepChopping",
                    WhileNode(
                        function() return KeepChoppingAction(self.inst) end,
                        "KeepChoppingAction",
                        DoAction(self.inst, FindTreeToChopAction, "ChopTree", true)
                    )
                ),

                -- 攻击行为
                WhileNode(
                    function() return CanAttack(self.inst) end,
                    "AttackIfNotInCooldown",
                    ChaseAndAttack(self.inst, 3)
                ),
                
                -- 跟随领导者
                Follow(self.inst, GetLeader, MIN_FOLLOW_LEADER, TARGET_FOLLOW_LEADER, MAX_FOLLOW_LEADER, true),
                
                -- 面向领导者
                FaceEntity(self.inst, GetLeader, GetLeader),
                
                -- 避开爆炸物
                RunAway(
                    self.inst, 
                    { fn = ShouldAvoidExplosive, tags = { "explosible" }, notags = { "INLIMBO" } },
                    AVOID_EXPLOSIVE_DIST, 
                    AVOID_EXPLOSIVE_DIST
                ),
                
                -- 随机漫游行为
                Wander(self.inst, nil, nil, WANDER_TIMING)
            }, .25)
        }, .25)

    self.bt = BT(self.inst, root)
end

return Uav_Brain