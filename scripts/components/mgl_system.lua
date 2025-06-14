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
            if self.mobilecharger.components.mgl_mobilecharger:GetPower() > 0 and mgl_mapper_power < 100 and (self.mgl_mapper.components.equippable and not self.mgl_mapper.components.equippable:IsEquipped()) then
                self.mgl_mapper.components.finiteuses:Repair(10)
                self.mobilecharger.components.mgl_mobilecharger:Cost()
                if self.mgl_mapper.FixFn ~= nil then
                    self.mgl_mapper:FixFn(self.inst)
                end
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
    local leader = inst.components.follower.leader
    if target then
        if inst.aoe then
            --inst.components.combat:DoAreaAttack(data.target, 5.5, nil, nil, nil,
            --{ "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" })
            local x, y, z = inst.Transform:GetWorldPosition()
            local ents = TheSim:FindEntities(x, y, z, 3, nil,
                { "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" })

            for k, v in ipairs(ents) do
                if v and v.components.health and v ~= target then
                    inst.components.combat:DoAttack(v)
                end
            end
        end
    end

end

local function onhitother(inst, target, damage, stimuli, weapon, damageresolved, spdamage, damageredirecttarget)
    if inst.aoe then
        local x, y, z = target.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, 3, nil,
            { "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" })
        for k, v in ipairs(ents) do
            if v and v ~= target then
                inst.components.combat:DoAttack(v)
            end
        end
    elseif not inst.aoe then
        local x, y, z = target.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, 2, nil,
            { "player", "wall", "INLIMBO", "notarget", "invisible", "noattack", "uav" })
        for k, v in ipairs(ents) do
            if v and v ~= target then
                inst.components.combat:DoAttack(v)
            end
        end
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
        weapon.components.weapon:SetRange(inst.components.combat.attackrange)
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
        return
    end

    if self.follower ~= nil and #self.follower <= 0 then
        local mgl_level = self.inst.mgl_level:value() or 0
        local maxNum = 1 + mgl_level
        local type = self.uav_type or 1
        type = type + 1
        -- 获取下一个无人机类型
        self.uav_type = type > maxNum and 1 or type
    end
    if self.mgl_uav_item then
        self.mgl_uav_item.components.inventoryitem:ChangeImageName("mgl_uav_" .. anim[self.uav_type])
        self.mgl_uav_item.components.inventoryitem.atlasname = ("images/inventoryimages/mgl_uav_" .. anim[self.uav_type] .. ".xml")
    end
end

function Mgl_System:RemoveUav()

    if self.follower ~= nil then
        for k, v in pairs(self.follower) do
            if v and v:IsValid() then
                --table.remove(self.follower, v)
                for k = 1, v.components.inventory:NumItems() do
                    local item = v.components.inventory:GetItemInSlot(k)
                    if item and item.persists then
                        v.components.inventory:DropItem(item, true, true)
                        item.Transform:SetPosition(self.inst:GetPosition():Get())
                    end
                end
                if v.sg then
                    v.sg:GoToState("disappear")
                else
                    v:Remove()
                end
            end
        end
    end
    self.follower = {} --重新读个表吧
end

function Mgl_System:RemoveFollower()
    if self.task then
        self.task:Cancel()
        self.task = nil
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

    local values = {}
    for _, v in pairs(self.follower) do
        table.insert(values, v)
    end

    for _, v in pairs(values) do
        if v and v:IsValid() then
            for k = 1, v.components.inventory:NumItems() do
                local item = v.components.inventory:GetItemInSlot(k)
                if item and item.persists then
                    v.components.inventory:DropItem(item, true, true)
                    item.Transform:SetPosition(self.inst:GetPosition():Get())
                end
            end
            if v.sg then
                v.sg:GoToState("disappear")
            else
                v:Remove()
            end
        end
    end
    self.follower = {} -- 最终清空表
end

function Mgl_System:CallUav()
    self.inst.components.talker:Say("正在召唤无人机")
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
            local time = {
                [0] = 0,
                [1] = 14,
                [2] = 22
            }
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

            if self.inst.components.inventory:EquipHasTag("mgl_mapper_item") then
                uav.components.follower:SetLeader(self.inst)
            end

            if self.uav_type == 1 or self.uav_type == 2 or self.uav_type == 3 then
                uav.attack = true
                if self.uav_type == 2 then
                    local moredamage = self.module >= 1 and 8 or 0
                    uav:AddComponent("planardamage")
                    uav.components.combat.onhitotherfn = onhit
                    uav.components.combat:SetRange(1,2)
                    uav.components.combat:SetAttackPeriod(1) -- 攻击间隔
                    uav.components.planardamage:SetBaseDamage(20)
                    uav.components.combat:SetDefaultDamage((mode[mgl_level] + moredamage))
                    EquipWeapon(uav,"mgl_uav_lrbd_charge")
                elseif self.uav_type == 3 then
                    local moredamage = self.module >= 1 and 9 or 0
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
                end

            end

            table.insert(self.follower, uav)

            self.inst:DoTaskInTime(
                10,
                function()
                    self.call_cd = false
                end
            )

            if time[mgl_level] > 0 then
                uav:AddTag("nocost")
                local fx = SpawnPrefab("mgl_fx")
                fx.entity:SetParent(uav.entity)
                fx.AnimState:PlayAnimation("fx3", true)
                uav:DoTaskInTime(
                    time[mgl_level],
                    function()
                        if uav and uav:IsValid() then
                            uav:RemoveTag("nocost")
                            fx:Remove()
                        end
                    end
                )
            end
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
    [4] = { cd = 30, tasktime = 15 },
}


function Mgl_System:UseSkill()
    if self.mgl_uav_item  == nil then
        return
    end
    if self.follower ~= nil and #self.follower > 0 and self.task == nil and self.mgl_uav_item.components.rechargeable:IsCharged() then

        local task = mission[self.uav_type]
        local cd = task.cd
        local mgl_level = self.inst.mgl_level:value() or 0
        local time = 0
        if type(task.cd) ~= "number" then
            cd = task.cd[mgl_level]
        end

        if self.uav_type == 1 then
            for k, v in pairs(self.follower) do
                v.skilltask = true
            end
        elseif self.uav_type == 2 then
            local min_attack_period = {
                [0] = 0.5,
                [1] = 0.5,
                [2] = 0.25
            }
            for k, v in pairs(self.follower) do
                v.aoe = true
                v.components.combat.min_attack_period = min_attack_period[mgl_level]
            end
        elseif self.uav_type == 3 then
            for k, v in pairs(self.follower) do
                v.aoe = true
                v.components.combat.damagemultiplier = 2.5
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
        
        local fx = SpawnPrefab("mgl_fx")
        fx.AnimState:SetFinalOffset(-1)
        fx.entity:AddFollower()
        -- local x1, y1, z1 = inst.Transform:GetWorldPosition()
        fx.Follower:FollowSymbol(self.inst.GUID, "swap_body", 0, 0, 0)
        fx.AnimState:PlayAnimation(fxanim[self.uav_type].pre)
        fx.AnimState:PushAnimation(fxanim[self.uav_type].loop, true)
        self.fx = fx
        

        self.task = self.inst:DoPeriodicTask(1, function()
            time = time + 1
            if time >= task.tasktime then
                if fx21 ~= nil then
                    fx21:Remove()
                end
                self:RemoveFollower()
                self.mgl_uav_item.components.rechargeable:Discharge(cd)
            end
        end)
    else
        self.inst.components.talker:Say(STRINGS.MGL_SKILLCDING)
    end
end

function Mgl_System:OnLoad(data)
    self.tool = data.tool or nil
    self.module = data.module or 0
    self.uav_type = data.uav_type or 1
end

function Mgl_System:OnSave()
    return { tool = self.tool, module = self.module, uav_type = self.uav_type }
end

return Mgl_System
