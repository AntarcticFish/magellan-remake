local assets = {
    Asset("ANIM", "anim/mgl_mapper.zip"),
    Asset("ANIM", "anim/swap_mgl_mapper.zip"),
    Asset("ANIM", "anim/mgl_mapper_itemfx.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_mapper_item.xml"),
}

local function PlayTurnOnSound(inst)
    if inst._soundtask ~= nil then
        inst._soundtask:Cancel()
        inst._soundtask = nil
    else
        inst._light.SoundEmitter:PlaySound("dontstarve/wilson/lantern_on")
    end
end

local function fuelupdate(inst)
    if inst._light ~= nil then
        local fuelpercent = inst.components.finiteuses and inst.components.finiteuses:GetPercent() or
            inst.components.fueled and inst.components.fueled:GetPercent()
        inst._light.Light:SetIntensity(Lerp(.4, .6, fuelpercent))
        inst._light.Light:SetRadius(Lerp(3, 5, fuelpercent))
        inst._light.Light:SetFalloff(.9)
    end
end

local function onremovelight(light)
    light._lantern._light = nil
end

local function turnoff(inst)
    if inst._light ~= nil then
        inst._light:Remove()
        inst._light = nil
    end

    inst.AnimState:Hide("glow")

    if inst._task ~= nil then
        inst._task:Cancel()
        inst._task = nil
    end

    inst:PushEvent("onturnoff")

    inst.SoundEmitter:KillSound("lp")
end

local function light_on(inst)
    if inst.components.fueled:GetPercent() > 0.1 then
        if inst._light == nil then
            inst._light = SpawnPrefab("lanternlight")
            inst._light._lantern = inst
            inst:ListenForEvent("onremove", onremovelight, inst._light)
            fuelupdate(inst)
            PlayTurnOnSound(inst)
        end
        inst._light.entity:SetParent(inst.entity)

        inst:PushEvent("lantern_on")
        inst.components.fueled:StartConsuming()

        if inst._task == nil then
            inst._task = inst:DoTaskInTime(1, function()
                fuelupdate(inst)
            end)
        end
    end
end

local function turnon(inst)
    if inst.components.finiteuses:GetUses() > 0 then
        local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner

        if inst._light == nil then
            inst._light = SpawnPrefab("lanternlight")
            inst._light._lantern = inst
            inst:ListenForEvent("onremove", onremovelight, inst._light)
            fuelupdate(inst)
            PlayTurnOnSound(inst)
        end
        inst._light.entity:SetParent((owner or inst).entity)
        if owner ~= nil and inst.components.equippable:IsEquipped() then
            owner.AnimState:Show("LANTERN_OVERLAY")
        end

        inst:PushEvent("lantern_on")

        if inst._task == nil then
            inst._task = inst:DoPeriodicTask(1.92, function()
                local itemlevel = inst.components.mgl_mapper.level
                if itemlevel >= 1 then
                    inst.components.finiteuses:Use(0.075)
                else
                    inst.components.finiteuses:Use(0.1)
                end
                fuelupdate(inst)
                if inst.components.finiteuses:GetUses() <= 0 then
                    turnoff(inst)
                end
            end)
        end
    end
end

local weapon_data = {
    [0] = {
        damage = 30, range = 15,
    },
    [1] = {
        damage = 40, range = 21,
    },
    [2] = {
        damage = 50, range = 21,
    },
}

local function OnAttack(inst, doer)
    local owner = doer or inst.components.inventoryitem.owner or nil
    if not owner then
        return
    end

    if inst.components.finiteuses:GetUses() <= 0 then
        return
    end

    owner.components.combat.min_attack_period = 1.6

    local mgl_system = owner.components.mgl_system
    local level = owner.mgl_level:value()
    local module = mgl_system.module
    local itemlevel = inst.components.mgl_mapper.level
    local moerdamage = itemlevel >= 1 and 15 or 0
    inst.components.weapon:SetRange(weapon_data[level].range)
    inst.components.planardamage:SetBaseDamage(weapon_data[level].damage + moerdamage)

    if inst.components.finiteuses:GetUses() <= 0 and owner then
        owner.AnimState:OverrideSymbol("swap_object", "swap_mgl_mapper", "broken")
    end
end

local function unequipped(inst, data, fx)
    if fx ~= nil then
        fx:Remove()
    end
end

local function onequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    turnon(inst)
    OnAttack(inst, owner)

    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_mapper_item.xml"
    inst.components.inventoryitem:ChangeImageName("mgl_mapper_item")

    local fx = SpawnPrefab("mgl_mapper_itemfx")
    fx.entity:SetParent(owner.entity)
    fx.Follower:FollowSymbol(owner.GUID, "swap_object", 0, 0, 0, true)

    inst:ListenForEvent("unequipped", unequipped, fx)

    owner.mgl_fx = fx
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    owner.AnimState:ClearOverrideSymbol("swap_object")

    if inst._task ~= nil then
        inst._task:Cancel()
        inst._task = nil
    end
    turnoff(inst)
    if owner.components.combat ~= nil then
        owner.components.combat.min_attack_period = TUNING.WILSON_ATTACK_PERIOD
    end

    inst:RemoveEventCallback("unequipped", unequipped)
    if owner.mgl_fx ~= nil then
        owner.mgl_fx:Remove()
    end
end

local function spawnfxs(inst)
    local pos = inst:GetPosition()
    local x, y, z = TheWorld.Map:GetTileCenterPoint(pos:Get())
    inst._fx = {}

    for x1 = x - 6, x + 6, 0.5 do
        for z1 = z - 6, z + 6, 0.5 do
            local fx = SpawnAt("mgl_mapper_fx", Vector3(x1, y, z1), Vector3(0.5, 0.5, 0.5))
            table.insert(inst._fx, fx)
            fx:ListenForEvent("onremove", function()
                if fx:IsValid() then
                    fx:Remove()
                end
            end, inst)
        end
    end
end

local function OnFinished(inst)
    inst.components.weapon:SetRange(0)
    inst.components.planardamage:SetBaseDamage(0)
end

local function ondeploy(inst, pt, deployer)
    if deployer.components.mgl_system == nil then
        return
    end

    deployer.components.mgl_system.tool = inst:GetSaveRecord()
    local pot = SpawnPrefab("mgl_mapper")
    local x, y, z = TheWorld.Map:GetTileCenterPoint(deployer:GetPosition():Get())
    pot.Transform:SetPosition(x, y, z)
    pot.AnimState:PlayAnimation("stand_place")
    pot.AnimState:PushAnimation("stand_idle", true)

    pot.components.mgl_mapper.level = inst.components.mgl_mapper.level
    pot.components.mgl_item.userid = deployer.userid

    light_on(pot)

    pot.components.fueled:SetPercent(inst.components.finiteuses:GetPercent())
    if pot.components.mgl_mapper.level >= 1 then
        pot.components.fueled.rate = 0.75
    else
        pot.components.fueled.rate = 1
    end

    --spawnfxs(pot
    if inst._task ~= nil then
        inst._task:Cancel()
        inst._task = nil
    end
    inst:Remove()
end

local function OnDismantle(inst, doer)
    -- print(inst.components.mgl_item.userid, doer.userid)
    if doer.components.mgl_system == nil or doer.userid ~= inst.components.mgl_item.userid then
        return
    end
    local item = doer.components.mgl_system.tool and SpawnSaveRecord(doer.components.mgl_system.tool) or
        SpawnPrefab("mgl_mapper_item")
    item.components.mgl_item.userid = doer.userid

    local pos = inst:GetPosition()
    doer.components.inventory:GiveItem(item, nil, pos)
    doer.components.mgl_system.tool = nil

    item.components.mgl_mapper.level = inst.components.mgl_mapper.level
    item.components.inventoryitem.atlasname = "images/inventoryimages/mgl_mapper_item.xml"
    item.components.inventoryitem:ChangeImageName("mgl_mapper_item")

    turnoff(inst)
    turnoff(item)

    if inst._fx then
        for k, v in pairs(inst._fx) do
            v:Remove()
        end
    end

    item.components.finiteuses:SetUses(inst.components.fueled:GetPercent() * 100)

    if inst._task ~= nil then
        inst._task:Cancel()
        inst._task = nil
    end
    inst:Remove()
end

local function UsePower(inst)
    local itemlevel = inst.components.mgl_mapper.level
    if itemlevel > 1 then
        inst.components.finiteuses:Use(0.75)
    else
        inst.components.finiteuses:Use(1)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("swap_mgl_mapper")
    inst.AnimState:SetBuild("swap_mgl_mapper")
    inst.AnimState:PlayAnimation("swap_loop")

    inst:AddTag("mgl_item")
    inst:AddTag("mgl_mapper")
    inst:AddTag("mgl_mapper_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent('mgl_mapper')

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_mapper_item.xml"
    inst.components.inventoryitem:ChangeImageName("mgl_mapper_item")
    inst.components.inventoryitem:SetOnPutInInventoryFn(function()
        turnoff(inst)
    end)

    inst:AddComponent("mgl_item")

    inst:AddComponent("machine")
    inst.components.machine.turnonfn = turnon
    inst.components.machine.turnofffn = turnoff
    inst.components.machine.cooldowntime = 0

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
    inst.components.finiteuses:SetOnFinished(OnFinished)

    inst:AddComponent('weapon')
    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(5)
    inst.components.weapon:SetOnAttack(UsePower)
    inst.components.weapon:SetProjectile("mgl_proj")
    inst.components.weapon:SetOnProjectileLaunch(function(inst, attacker, target)
        if attacker and attacker.entity then
            local castfx = SpawnPrefab("mgl_hit_fx")
            castfx.entity:SetParent(attacker.entity)
            castfx.Follower:FollowSymbol(attacker.GUID, "swap_object", -9.09978, 57, 0, true)
            castfx.AnimState:PlayAnimation("cast")
            if castfx.AnimState:AnimDone() then
                castfx:Remove()
            end
        end
    end)

    inst:AddComponent("planardamage")
    inst.components.planardamage:SetBaseDamage(30)

    inst:AddComponent("equippable") --装备组件
    inst.components.equippable.equipslot = EQUIPSLOTS.HANDS
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.restrictedtag = "mgl"
    inst.components.equippable.walkspeedmult = 1.1

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy

    inst.components.weapon:SetOnAttack(OnAttack)
    turnoff(inst)

    inst.FixFn = OnAttack

    MakeHauntableLaunch(inst)

    return inst
end

local function SanityAura(inst, observer)
    return TUNING.SANITYAURA_LARGE * 0.25
end

local function build_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mgl_mapper")
    inst.AnimState:SetBuild("mgl_mapper")
    inst.AnimState:PlayAnimation("stand_idle")

    inst:AddTag("structure")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent('mgl_mapper')

    inst:AddComponent("inspectable")

    inst:AddComponent("mgl_item")

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aura = TUNING.SANITYAURA_SMAL
    inst.components.sanityaura.aurafn = SanityAura
    inst.components.sanityaura.max_distsq = 15

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = 1920
    inst.components.fueled.currentfuel = 1920
    inst.components.fueled:SetTakeFuelFn(function()
        turnoff(inst)
    end)
    light_on(inst)

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:DoTaskInTime(0, spawnfxs)

    return inst
end

local function fxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddFollower()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("swap_mgl_mapper")
    inst.AnimState:SetBuild("swap_mgl_mapper")
    inst.AnimState:PlayAnimation("swap_loop", true)

    inst:AddTag("FX")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

return Prefab("mgl_mapper_item", fn, assets), Prefab("mgl_mapper", build_fn, assets),
    Prefab("mgl_mapper_itemfx", fxfn, assets),
    MakePlacer("mgl_mapper_item_placer", "mgl_mapper", "mgl_mapper", "stand_idle")
