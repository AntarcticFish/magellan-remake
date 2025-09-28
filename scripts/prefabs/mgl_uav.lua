local function keeptargetfn(inst, target)
    -- 检查实例是否靠近领导者，并且能够攻击目标，并且目标不是小游戏参与者
    return inst.components.follower:IsNearLeader(20) and
           inst.components.combat:CanTarget(target) and
           target.components.minigame_participator == nil
end

local brains = require("brains/uavbrain")
local assets = {
    Asset("ANIM", "anim/mgl_uav.zip"),
}

local function Attack_Freezing(inst)
    local speedmult = 1/5
    local debufftime  = 1
    local mgl_level = inst.components.follower.leader.mgl_level:value() or 0
    local debuffkey = "drone_f_debuff"
    if inst.skilltask == true then
        local fx = SpawnPrefab("mgl_fx")
        fx.AnimState:SetFinalOffset(-1)
        fx.AnimState:PlayAnimation("fx1_pre")
        fx.AnimState:PushAnimation("fx1_loop")
        fx.AnimState:PushAnimation("fx1_pst")
        fx.entity:SetParent(inst.entity)
        -- 播放技能音效
        inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/p_field_uavfreeze_skill")
        if inst.fx == nil then
            inst.fx = fx
        end
        if inst.fx.AnimState:AnimDone() then
            inst.fx:Remove()
            inst.fx = nil
        end
        speedmult = 0
        debufftime  = 1.9 + 0.3 * mgl_level
    end
    local pos = inst:GetPosition()
    local targets = TheSim:FindEntities(pos.x, pos.y, pos.z, 10, {"_combat"},
                                        {
        "noauradamage", "INLIMBO", "notarget", "flight",
        "invisible", "playerghost", "player","companion"
    }, nil)
    for k, v in pairs(targets) do
        -- 定义降低速度效果的标识
        -- 如果目标已经受到速度降低效果，则取消该效果
        if v._drone_f_debufftask ~= nil then
            return
        end
        if v ~= nil and v:IsValid() and v.components.locomotor ~= nil then
            -- 设置速度降低效果的数值
            v.components.locomotor:SetExternalSpeedMultiplier(v, debuffkey, speedmult)
            --添加命中特效,冰冻无人机
            local fx = SpawnPrefab("mgl_fx")
            fx.entity:SetParent(v.entity)
            fx.AnimState:PlayAnimation("uav_r23_fx",true)
            v._drone_f_debufftask = v:DoTaskInTime(
            debufftime, 
            function(i) 
                if v and v:IsValid() and v.components.locomotor then
                    i.components.locomotor:RemoveExternalSpeedMultiplier(i, debuffkey) 
                end
                i._drone_f_debufftask = nil 
                if fx and fx:IsValid() then
                    fx:Remove()
                end
            end
        )
        end
    end
end

local function GetTarget(inst)
    local leader = inst.components.follower.leader
    if leader and not inst.instructionsTarget then
        if inst.targetPrefab then
            local target = FindEntity(leader, 20, function(guy)
                return guy.prefab == inst.targetPrefab and
                           inst.components.combat:CanTarget(guy)
            end, nil, {"playerghost", "INLIMBO"})
            inst.instructionsTarget = target
            if target == nil then
                inst.targetPrefab = nil
            else
                return target
            end
        end
        -- 跟随保护
        -- 查找周围攻击人物的对象
        local target = FindEntity(leader, 20, function(guy)
            return
                guy.components.combat:TargetIs(leader)
                and inst.components.combat:CanTarget(guy)
        end, {"_combat"}, {"playerghost", "INLIMBO"})
        return target
    end
    return nil
end

-- 检查目标是否在攻击范围内
-- @param inst 传入的实例对象，通常是一个AI或怪物
-- @param target 目标对象，需要检查其是否在攻击范围内
-- @return 如果目标在攻击范围内返回true，否则返回false
local function IsWithinAttackRange(inst, target)
    -- 检查实例是否有一个领导者，如果没有则直接返回false
    if inst.components.follower.leader == nil then return false end
    -- 计算目标与领导者的距离平方
    local l = inst.components.follower.leader:GetDistanceSqToInst(target)
    -- 判断距离是否小于等于一个设定值（这里暂时注释掉了打印距离的代码）
    -- print("距离为=", l)
    return l <= 300 -- 如果距离超过该值，则认为目标不在攻击范围内，大约是一屏幕的距离
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddDynamicShadow()

    MakeFlyingCharacterPhysics(inst, 3, .5)
    inst.DynamicShadow:SetSize(1.5, 1.1)

    inst.Transform:SetFourFaced(inst)
    inst.AnimState:SetBank("mgl_uav_r23")
    inst.AnimState:SetBuild("mgl_uav")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("flying")
    inst:AddTag("NOBLOCK")
    inst:AddTag("companion")
    inst:AddTag("scarytoprey")
    inst:AddTag("notarget")
    inst:AddTag("flight")
    inst:AddTag("uav")
    

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 5
    inst.components.locomotor.runspeed = 7
    inst.components.locomotor.pathcaps = { ignorecreep = true, allowocean = true}

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(1)
    inst.components.health:SetMinHealth(1)

    inst:AddComponent("combat")
    inst.components.combat:SetKeepTargetFunction(keeptargetfn)
    inst.components.combat:SetAttackPeriod(1)
    inst.components.combat:SetDefaultDamage(0)
    inst.components.combat.shouldavoidaggrofn = function(inst)
        return false
    end

    inst:AddComponent("inventory")
    inst.components.inventory.maxslots = 9

    inst:AddComponent("follower")
    inst.components.follower:KeepLeaderOnAttacked()
    inst.components.follower.keepdeadleader = true
    inst.components.follower.keepleaderduringminigame = true

    inst:SetBrain(brains)
    inst:SetStateGraph("SGUav")
    inst.GetTarget = GetTarget
    inst.Attack_Freezing = Attack_Freezing
    inst.skilltask = false
    inst.IsWithinAttackRange = IsWithinAttackRange
    inst.persists = false

    inst:DoPeriodicTask(1, function(inst)
        if inst.owner == nil then
            inst:Remove()
        end
    end)

    return inst
end


return Prefab("mgl_uav", fn, assets)
