local function OnUpdate(self, uav_type)
    self.inst.uav_type:set(uav_type)
end

local Mgl_System = Class(function(self, inst)
    self.inst = inst
    self.tool = nil
    self.module = 0
    -- 移动电源
    self.mobilecharger = nil
    -- 测绘仪
    self.mgl_mapper = nil
    -- 龙腾无人机装置
    self.mgl_uav_item = nil
    -- 跟随者
    self.follower = {}
    -- D99解锁
    self.d99_lock = false
    self.call_cd = false
    self.uav_type = 1
    self._task = self.inst:DoPeriodicTask(1, function()

        self.mgl_mapper = nil
        local table = self.inst.components.inventory:GetItemsWithTag("mgl_mapper_item")
        for k, v in pairs(table) do
            if v then
                self.mgl_mapper = v
                break
            end
        end

        self.mobilecharger = nil
        local table = self.inst.components.inventory:GetItemsWithTag("mgl_mobilecharger_item")
        for k, v in pairs(table) do
            if v then
                self.mobilecharger = v
                break
            end
        end
        
        self.mgl_uav_item = nil
        local table = self.inst.components.inventory:GetItemsWithTag("mgl_uav_item")
        for k, v in pairs(table) do
            if v then
                self.mgl_uav_item = v
                break
            end
        end

        if self.mgl_mapper ~= nil and self.mgl_mapper.components.finiteuses and self.mobilecharger then --给测图仪自动充电
            local mgl_mapper_power = self.mgl_mapper.components.finiteuses:GetUses()
            if self.mobilecharger.components.mgl_mobilecharger:GetPower() > 0 and mgl_mapper_power < 91 and (self.mgl_mapper.components.equippable and not self.mgl_mapper.components.equippable:IsEquipped()) then
                self.mgl_mapper.components.finiteuses:Repair(10)
                self.mobilecharger.components.mgl_mobilecharger:Cost()
                if self.mgl_mapper.FixFn ~= nil then
                    self.mgl_mapper:FixFn(self.inst)
                end
            end
        end

        if self.mgl_uav_item ~= nil and self.mgl_uav_item.components.finiteuses then --给无人机自动充电
            if self.mobilecharger then
                local mgl_uav_item_power = self.mgl_uav_item.components.finiteuses:GetUses()
                if self.mobilecharger.components.mgl_mobilecharger:GetPower() > 0 and mgl_uav_item_power < 91 then
                    self.mgl_uav_item.components.finiteuses:Repair(10)
                    self.mobilecharger.components.mgl_mobilecharger:Cost()
                end
            end
            if self.mgl_uav_item.components.finiteuses:GetUses() > 0 then
                local power = self.mgl_uav_item.components.finiteuses:GetUses()
                local cost = #self.follower * 0.04
                if power >= cost then
                    if self.module >= 2 then
                        cost = cost * 0.75
                    end
                    self.mgl_uav_item.components.finiteuses:Use(cost)
                else
                    self.mgl_uav_item.components.finiteuses:SetUses(0)
                end
            end
            if self.mgl_uav_item.components.finiteuses:GetUses() == 0 then
                self:RemoveFollower()
            end
        end

    end)
end, nil, {
    uav_type = OnUpdate,
})

function Mgl_System:OnRemoveFromEntity()
    if self._task then
        self._task:Cancel()
        self._task = nil
    end
    if self.follower ~= nil then
        for k, v in pairs(self.follower) do
            if v and v:IsValid() then
                if v.sg then
                    v.sg:GoToState("disappear")
                else
                    v:Remove()
                end
            end
        end
    end
end



local function onhit(inst, target, damage, stimuli, weapon, damageresolved, spdamage, damageredirecttarget)
    if target and not inst.aoe_processing then
        if inst.aoe then
            inst.aoe_processing = true
            inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/p_atk_uavlaser_skill")
            -- 使用官方DoAreaAttack函数替代自定义实现
            local exclude_tags = { "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" }
            inst.components.combat:DoAreaAttack(inst, 2, nil, nil, stimuli, exclude_tags)
            inst.aoe_processing = false
        end
    end

end

local function onhitother(inst, target, damage, stimuli, weapon, damageresolved, spdamage, damageredirecttarget)
    if target and not inst.aoe_processing then
        local exclude_tags = { "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" }
        
        inst.aoe_processing = true
        if inst.aoe then
            inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/p_imp_uavvolley_hit_skill")
            -- 使用官方DoAreaAttack函数，范围3
            inst.components.combat:DoAreaAttack(target, 4, nil, nil, stimuli, exclude_tags)
        else
            inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/p_imp_uavvolley_hit")
            -- 使用官方DoAreaAttack函数，范围2
            inst.components.combat:DoAreaAttack(target, 3, nil, nil, stimuli, exclude_tags)
        end
        inst.aoe_processing = false
    end

end

-- 在给定的实例上装备武器
-- @param inst 实例对象，通常是一个角色或生物
local function EquipWeapon(inst,projectile)
    -- 检查实例是否有库存组件，并且双手没有装备任何物品
    if inst.components.inventory ~= nil and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
        -- 创建一个新的武器实体
        local weapon = CreateEntity()
        -- 添加转换组件，允许武器实体在场景中定位和朝向
        weapon.entity:AddTransform()
        -- 添加武器组件，使实体成为一个可攻击的武器
        weapon:AddComponent("weapon")
        -- 设置武器的默认伤害值
        weapon.components.weapon:SetDamage(inst.components.combat.defaultdamage)
        -- 设置武器的攻击范围
        weapon.components.weapon:SetRange(inst.components.combat.attackrange, inst.components.combat.attackrange + 4)
        -- 设置武器的弹道类型
        weapon.components.weapon:SetProjectile(projectile)
        -- 添加库存项组件，使武器可以被装备和丢弃
        weapon:AddComponent("inventoryitem")
        -- 设置武器不会永久存在，当不再需要时可以被自动销毁
        weapon.persists = false
        -- 设置当武器被丢弃时的回调函数，这里让实例自己处理武器的移除
        weapon.components.inventoryitem:SetOnDroppedFn(inst.Remove)
        -- 添加可装备组件，使武器可以被角色装备
        weapon:AddComponent("equippable")
        -- 添加一个标签，防止武器被其他角色或生物抢走
        weapon:AddTag("nosteal")

        -- 在实例的库存中装备新创建的武器
        inst.components.inventory:Equip(weapon)
    end
end


local mode = {
    [0] = 18,
    [1] = 24,
    [2] = 31
}

local fxanim = {
    [1] = {
        pre = "fx1_pre",
        loop = "fx1_loop",
        pst = "fx1_pst"
    },
    [2] = {
        pre = "fx2_pre",
        loop = "fx2_loop",
        pst = "fx2_pst"
    },
    [3] = {
        pre = "fx2_pre",
        loop = "fx2_loop",
        pst = "fx2_pst"
    },
    [4] = {
        pre = "fx2_pre",
        loop = "fx2_loop",
        pst = "fx2_pst"
    }
}

local anim = {
    [1] = "r23",
    [2] = "lrbd",
    [3] = "66",
    [4] = "yhly",
}

local function NoHoles(pt)
    return not TheWorld.Map:IsPointNearHole(pt)
end

function Mgl_System:ChangeUav(item)
    if self.follower ~= nil and #self.follower > 0 then
        self.inst.components.talker:Say(STRINGS.CHANGE_UAV_ERROR)
        return
    end

    if self.follower ~= nil and #self.follower <= 0 then
        local mgl_level = self.inst.mgl_level:value() or 0
        local maxNum = 1 + mgl_level
        local type = self.uav_type or 1
        type = type + 1
        -- 获取下一个无人机类型
        if self.d99_lock and type == maxNum+1 then
            self.uav_type = 4
        else
            self.uav_type = type > maxNum and 1 or type
        end
        self.inst.components.talker:Say(STRINGS.CHANGE_UAV_SUCCESS[self.uav_type])
    end
    if self.mgl_uav_item then
        self.mgl_uav_item.components.inventoryitem:ChangeImageName("mgl_uav_" .. anim[self.uav_type])
        self.mgl_uav_item.components.inventoryitem.atlasname = ("images/inventoryimages/mgl_uav_" .. anim[self.uav_type] .. ".xml")
    end
end

function Mgl_System:RemoveFollower()
    if self.task then
        self.task:Cancel()
        self.task = nil
    end
    if self.fx21 ~= nil then
        self.fx21:Remove()
    end
    if self.fx ~= nil then
        if self.fx:IsValid() then
            self.fx.AnimState:PlayAnimation(fxanim[self.uav_type].pst)
            if self.fx.AnimState:IsCurrentAnimation(fxanim[self.uav_type].pst) then
                self.fx:Remove()
            end
            if self.fx ~= nil then
                self.fx:Remove()
                self.fx = nil
            end
        end
    end
      
    -- 技能结束后恢复原始攻速
    if self.inst.components.combat and self.inst.components.combat.RemoveAtkPeriodModifier
        and self.skill_atk_speed_source and self.skill_atk_speed_key then
        self.inst.components.combat:RemoveAtkPeriodModifier(
            self.skill_atk_speed_source, 
            self.skill_atk_speed_key
        )
        -- 清理保存的状态
        self.skill_atk_speed_source = nil
        self.skill_atk_speed_key = nil
        self.skill_atk_speed_mult = nil
    end
    
    -- 技能结束后恢复原始伤害倍率
    if self.inst.components.magellan_remake_dmg_modifier
        and self.skill_dmg_source and self.skill_dmg_key then
        self.inst.components.magellan_remake_dmg_modifier:RemoveModifierNormal(
            "physical", 
            "mult", 
            self.skill_dmg_source, 
            self.skill_dmg_key
        )
        -- 清理保存的状态
        self.skill_dmg_source = nil
        self.skill_dmg_key = nil
        self.skill_dmg_mult = nil
    end

    -- 清理周期性减速任务
    if self.skill_task_one then
        self.skill_task_one:Cancel()
        self.skill_task_one = nil
    end

    local values = {}
    for _, v in pairs(self.follower) do
        table.insert(values, v)
    end

    for _, v in pairs(values) do
        if v and v:IsValid() then
            if self.uav_type == 4 then
                v.workable = false
                for slot = 1, v.components.inventory:GetNumSlots() do
                    local item = v.components.inventory:GetItemInSlot(slot)
                    if item then
                        v.components.inventory:DropItem(item, true, true)
                        item.Transform:SetPosition(self.inst:GetPosition():Get())
                    end
                end
            end
            v.attack = false
            -- 延迟0.5秒后继续执行撤退逻辑
            v:DoTaskInTime(0.5, function()
                v.SoundEmitter:PlaySound("mgl_audio/mgl_audio/uav_remove")
                if v.sg then
                    v.sg:GoToState("disappear", true)
                else
                    v:Remove()
                end
            end)
        end
    end
    self.follower = {} -- 最终清空表
end

local NOTAGS = { "playerghost", "INLIMBO", "flight", "invisible" }
for k, v in pairs(FUELTYPE) do
    table.insert(NOTAGS, v.."_fueled")
end

local FREEZETARGET_ONEOF_TAGS = { "heatrock", "freezable", "fire", "smolder" }

function Mgl_System:CallUav()
    -- self.inst.components.talker:Say("正在召唤无人机")
    if self.mgl_uav_item then
        local item = self.mgl_uav_item

        if self.follower == nil then
            self.follower = {}
        end
        local mgl_level = self.inst.mgl_level:value() or 0
        local num = 5 - 2 - #self.follower + mgl_level
        if num <= 0 then
            self.inst.components.talker:Say(STRINGS.MGL_UAV_IS_MAX)
            return
        end
        if item.components.finiteuses:GetPercent() > 0.2 and not self.call_cd then
            self.call_cd = true

            local uav = SpawnPrefab("mgl_uav")
            local pt = self.inst:GetPosition()
            local theta = math.random() * 2 * PI
            local radius = math.random(3, 6)
            local offset = FindWalkableOffset(pt, theta, radius, 12, true, true, NoHoles)
            if offset ~= nil then
                pt.x = pt.x + offset.x
                pt.z = pt.z + offset.z
            end

            if uav.Physics ~= nil then
                uav.Physics:Teleport(pt.x, 0, pt.z)
            elseif uav.Transform ~= nil then
                uav.Transform:SetPosition(pt.x, 0, pt.z)
            end

            uav.Transform:SetScale(1.25, 1.25, 1.25)
            uav.AnimState:SetBank(uav.prefab .. "_" .. anim[self.uav_type])
            if uav.sg then
                uav.sg:GoToState("enter")
            end
            uav.SoundEmitter:PlaySound("mgl_audio/mgl_audio/uav_call")


            -- if self.inst.components.inventory:EquipHasTag("mgl_mapper_item") then
            --     uav.components.follower:SetLeader(self.inst)
            -- end
            uav.components.follower:SetLeader(self.inst)

            if self.uav_type == 1 or self.uav_type == 2 or self.uav_type == 3 then
                uav.attack = true
                if self.uav_type == 2 then
                    local moredamage = self.module >= 1 and 9 or 0
                    uav:AddComponent("planardamage")
                    uav.components.combat.onhitotherfn = onhit 
                    uav.components.combat:SetRange(1,2)
                    uav.components.combat:SetAttackPeriod(1) -- 攻击间隔
                    uav.components.planardamage:SetBaseDamage(20)
                    uav.components.combat:SetDefaultDamage((mode[mgl_level] + moredamage))
                    EquipWeapon(uav,"mgl_uav_lrbd_charge")
                elseif self.uav_type == 3 then
                    local moredamage = self.module >= 1 and 15 or 0
                    uav.components.combat.onhitotherfn = onhitother
                    uav.components.combat:SetRange(6,12)
                    uav.components.combat:SetAttackPeriod(2.3) -- 攻击间隔
                    uav.components.combat:SetDefaultDamage((75 + moredamage))
                    EquipWeapon(uav,"mgl_uav_armed_charge")
                elseif self.uav_type == 1 then
                    uav:ListenForEvent("onattackother", function(data)
                        uav:Attack_Freezing()
                    end)
                    uav.components.combat:SetAttackPeriod(3)
                    uav.components.combat:SetRange(5,10)
                    uav.components.combat:SetDefaultDamage(0)
                    if self.module >= 1 then
                        --无人机附近的玩家不会过热
                        uav._moudle_task = uav:DoPeriodicTask(1, function()
                            local x, y, z = uav.Transform:GetWorldPosition()
                            -- 寻找并处理领域内的实体
                            for i, v in ipairs(TheSim:FindEntities(x, 0, z, 6, nil, NOTAGS, FREEZETARGET_ONEOF_TAGS)) do
                                -- 检查实体是否有效且未死亡
                                if v:IsValid() and not (v.components.health ~= nil and v.components.health:IsDead()) then
                                    -- 如果实体可燃烧且不可燃，尝试将其熄灭
                                    if v.components.burnable ~= nil and v.components.fueled == nil then
                                        v.components.burnable:Extinguish()
                                    end
                                    -- 如果实体有温度组件，尝试降低实体的温度
                                    if v.components.temperature ~= nil then
                                        local newtemp = math.min(v.components.temperature:GetCurrent(), 65)
                                        if newtemp < v.components.temperature:GetCurrent() then
                                            v.components.temperature:SetTemperature(newtemp)
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end

            end

            table.insert(self.follower, uav)

            self.inst:DoTaskInTime(
                10,
                function()
                    self.call_cd = false
                end
            )
        else
            if self.call_cd then
                self.inst.components.talker:Say(STRINGS.MGL_SKILLCDING)
            elseif item.components.finiteuses:GetPercent() <= 0.2 then
                self.inst.components.talker:Say(STRINGS.MGL_POWER_LOW)
            end
        end
    end
end

local mission = {
    [1] = { cd = 30, tasktime = 15 },
    [2] = {
        cd = {
            [0] = 50,
            [1] = 44,
            [2] = 38
        },
        tasktime = 15
    },
    [3] = { 
        cd = {
            [0] = 50,
            [1] = 44,
            [2] = 38
        },
        tasktime = 15 
    },
    [4] = { cd = 30, tasktime = 30 },
}


function Mgl_System:UseSkill()
    if self.mgl_uav_item  == nil then
        return
    end
    
    if self.follower ~= nil and #self.follower > 0 and self.task == nil and self.mgl_uav_item.components.rechargeable:IsCharged() then
        local uav_num = #self.follower or 0
        if self.mgl_uav_item.components.finiteuses:GetUses() -1 <= (5 * uav_num) then
            self.inst.components.talker:Say(STRINGS.MGL_POWER_LOW)
            return
        end
        if self.module>= 2 then
            self.mgl_uav_item.components.finiteuses:Use(5 * uav_num * 0.75)
        else
            self.mgl_uav_item.components.finiteuses:Use(5 * uav_num)
        end
        local task = mission[self.uav_type]
        local cd = task.cd
        local mgl_level = self.inst.mgl_level:value() or 0
        local time = 0
        if type(task.cd) ~= "number" then
            cd = task.cd[mgl_level]
        end
        if self.uav_type == 4 and self.module >=1 then
            cd = cd - 15
        end
        self.inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/mgl_skill_start")
        self.inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/mgl_voice_skill")
        if self.uav_type == 1 then
            -- 每秒减速玩家周围的敌人
            self.skill_task_one = self.inst:DoPeriodicTask(3,function()
                self.inst.SoundEmitter:PlaySound("mgl_audio/mgl_audio/p_field_uavfreeze_skill")
                if self.inst and self.inst:IsValid() then
                    -- 获取玩家周围的敌人
                    local x, y, z = self.inst.Transform:GetWorldPosition()
                    local ents = TheSim:FindEntities(x, y, z, 10, {"_combat"},
                                        {
                        "noauradamage", "INLIMBO", "notarget", "flight",
                        "invisible", "playerghost", "player", "companion", "noattack", "uav", "wall",
                        "mount", "rider", "peacefulmount", "combatmount"
                    }, nil)
                    -- 对每个敌人施加减速效果
                    for i, v in ipairs(ents) do
                        if v ~= nil and v:IsValid() and v.components.locomotor ~= nil then
                            -- 避免重复应用减速效果
                            if v._mgl_slow_debufftask == nil then
                                -- 应用减速效果
                                v.components.locomotor:SetExternalSpeedMultiplier(
                                    v, 
                                    "mgl_skill_slow_debuff", 
                                    0 -- 100%减速
                                )
                                
                                -- 添加视觉效果
                                local fx = SpawnPrefab("mgl_fx")
                                fx.entity:SetParent(v.entity)
                                fx.AnimState:PlayAnimation("uav_r23_fx", true)
                                
                                local debufftime  = 1.9 + 0.3 * mgl_level
                                v._mgl_slow_debufftask = v:DoTaskInTime(
                                    debufftime, 
                                    function(target)
                                        if target and target:IsValid() and target.components.locomotor then
                                            target.components.locomotor:RemoveExternalSpeedMultiplier(
                                                target, 
                                                "mgl_skill_slow_debuff"
                                            )
                                        end
                                        target._mgl_slow_debufftask = nil
                                        if fx and fx:IsValid() then
                                            fx:Remove()
                                        end
                                    end
                                )
                            end
                        end
                    end
                end
            end)
            for k, v in pairs(self.follower) do
                v.skilltask = true
            end
        elseif self.uav_type == 2 then
            --精一倍率
            local min_attack_period = SUGAR_magellan_remake:getModConfigDataFromTUNING("_skill2_atk_speed") or 0.5
            if mgl_level > 1 then
                min_attack_period = min_attack_period - 0.1
            end
            -- print("当前攻速加成："..min_attack_period)
            -- 为玩家添加临时攻速加成
            if self.inst.components.combat and self.inst.components.combat.SetAtkPeriodModifier then
                -- 保存原始攻速倍率，用于技能结束后恢复
                self.skill_atk_speed_source = self.inst
                self.skill_atk_speed_key = "mgl_skill_buff"
                self.skill_atk_speed_mult = 0.8 / min_attack_period  -- 攻速
                
                -- 设置攻速加成，参数分别是：来源、倍率、唯一标识
                self.inst.components.combat:SetAtkPeriodModifier(
                    self.skill_atk_speed_source, 
                    self.skill_atk_speed_mult, 
                    self.skill_atk_speed_key
                )
            end
            for k, v in pairs(self.follower) do
                v.aoe = true
                v.components.combat.min_attack_period = min_attack_period
                if v and v.entity then
                    local skillfx = SpawnPrefab("mgl_fx")
                    skillfx.entity:SetParent(v.entity)
                    skillfx.Follower:FollowSymbol(v.GUID, "wings", 0, 240, 0, true)
                    skillfx.AnimState:PlayAnimation("uav_lrbd_fx",true)
                    skillfx.AnimState:SetFinalOffset(3)
                end
            end
        elseif self.uav_type == 3 then
            local dmg_multiplier = SUGAR_magellan_remake:getModConfigDataFromTUNING("_skill3_dmg_multiplier") or 2.5
            -- print("当前伤害倍率加成："..dmg_multiplier)
            -- 为玩家添加临时伤害倍率加成
            if self.inst.components.magellan_remake_dmg_modifier then
                -- 保存伤害倍率信息，用于技能结束后恢复
                self.skill_dmg_source = self.inst
                self.skill_dmg_key = "mgl_damage_buff"
                self.skill_dmg_mult = dmg_multiplier -- 伤害倍率
                
                -- 设置物理伤害乘算加成
                self.inst.components.magellan_remake_dmg_modifier:ModifierNormal(
                    "physical", 
                    "mult", 
                    self.skill_dmg_source, 
                    self.skill_dmg_mult, 
                    self.skill_dmg_key
                )
            end
            for k, v in pairs(self.follower) do
                v.aoe = true
                v.components.combat.damagemultiplier = dmg_multiplier
                if v and v.entity then
                    local skillfx = SpawnPrefab("mgl_fx")
                    skillfx.entity:SetParent(v.entity)
                    skillfx.Follower:FollowSymbol(v.GUID, "wings", 0, 250, 0, true)
                    skillfx.AnimState:PlayAnimation("mgl_uav_66_fx",true)
                    skillfx.AnimState:SetFinalOffset(3)
                end
            end
        elseif self.uav_type == 4 then
            for k, v in pairs(self.follower) do
                v.workable = true
            end
        end
        

        local fx21 = SpawnPrefab("mgl_fx")
        fx21.AnimState:SetFinalOffset(-1)
        fx21.entity:AddFollower()
        -- local x1, y1, z1 = inst.Transform:GetWorldPosition()
        fx21.Follower:FollowSymbol(self.inst.GUID, "swap_body", 0, 0, 0)
        fx21.AnimState:PlayAnimation("fx21_loop",true)
        self.fx21 = fx21
        
        local fx = SpawnPrefab("mgl_fx")
        fx.AnimState:SetFinalOffset(-1)
        fx.entity:AddFollower()
        -- local x1, y1, z1 = inst.Transform:GetWorldPosition()
        fx.Follower:FollowSymbol(self.inst.GUID, "swap_body", 0, 0, 0)
        fx.AnimState:PlayAnimation(fxanim[self.uav_type].pre)
        fx.AnimState:PushAnimation(fxanim[self.uav_type].loop, true)
        self.fx = fx
        
        self.mgl_uav_item.components.rechargeable:Discharge(cd + task.tasktime)
        self.task = self.inst:DoPeriodicTask(1, function()
            time = time + 1
            if time >= task.tasktime then
                self:RemoveFollower()
            end
        end)
    else
        self.inst.components.talker:Say(STRINGS.MGL_SKILLCDING)
    end
end

function Mgl_System:OnLoad(data)
    self.tool = data.tool or nil
    self.module = data.module or 0
    self.d99_lock = data.d99_lock or false
end

function Mgl_System:OnSave()
    return { tool = self.tool, module = self.module, uav_type = self.uav_type, d99_lock = self.d99_lock }
end

return Mgl_System
