local assets =
{
    Asset("ANIM", "anim/mgl_fx.zip"),
    -- Asset("SOUND", "sound/chess.fsb"),
}
local function CreateTail(bank, build, lightoverride, addcolour, multcolour)
    local inst = CreateEntity()

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    inst.Physics:ClearCollisionMask()

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("mgl_uav_66_proj_fx")
    if addcolour ~= nil then
        inst.AnimState:SetAddColour(unpack(addcolour))
    end
    if multcolour ~= nil then
        inst.AnimState:SetMultColour(unpack(multcolour))
    end
    if lightoverride > 0 then
        inst.AnimState:SetLightOverride(lightoverride)
    end
    inst.AnimState:SetFinalOffset(3)

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

local function OnUpdateProjectileTail(inst, bank, build, speed, lightoverride, addcolour, multcolour, hitfx, tails)
    local x, y, z = inst.Transform:GetWorldPosition()
    for tail, _ in pairs(tails) do
        tail:ForceFacePoint(x, y, z)
    end
    if inst.entity:IsVisible() then
        local tail = CreateTail(bank, build, lightoverride, addcolour, multcolour)
        local rot = inst.Transform:GetRotation()
        tail.Transform:SetRotation(rot)
        rot = rot * math.pi/180
        local offsangle = math.random() * math.pi*2
        local offsradius = math.random() * .2 + .2
        local hoffset = math.cos(offsangle) * offsradius
        local voffset = math.sin(offsangle) * offsradius
        tail.Transform:SetPosition(x + math.sin(rot) * hoffset, y + voffset, z + math.cos(rot) * hoffset)
        tail.Physics:SetMotorVel(speed * (.2 + math.random() * .3), 0, 0)
        tails[tail] = true
        inst:ListenForEvent("onremove", function(tail) tails[tail] = nil end, tail)
        tail:ListenForEvent("onremove", function(inst)
            tail.Transform:SetRotation(tail.Transform:GetRotation() + math.random() * 30 - 15)
        end, inst)
    end
end

local function OnHit(inst, owner, target)
    SpawnPrefab("mgl_uav_66_hit").Transform:SetPosition(inst.Transform:GetWorldPosition())
    --添加命中特效
    local fx = SpawnPrefab("mgl_fx")
    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
    fx.AnimState:PlayAnimation("mgl_uav_66_hit")
    fx:ListenForEvent("animover", function()
        fx:Remove()
    end)
    inst:Remove()
end

local function OnAnimOver(inst)
    inst:DoTaskInTime(.3, inst.Remove)
end

local function OnThrown(inst)
    inst:ListenForEvent("animover", OnAnimOver)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    -- inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst:ForceFacePoint()

    inst.AnimState:SetBank("mgl_fx")
    inst.AnimState:SetBuild("mgl_fx")
    inst.AnimState:PlayAnimation("mgl_uav_66_proj",true)
    -- inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetFinalOffset(3)

    --projectile (from projectile component) added to pristine state for optimization
    inst:AddTag("projectile")

    if not TheNet:IsDedicated() then
        inst:DoPeriodicTask(0, OnUpdateProjectileTail, nil, "mgl_fx", "mgl_fx", 15, 0, { 0, .2, .1, 0 }, nil, "mgl_uav_66_hit", {})
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(15)
    inst.components.projectile:SetHoming(false)
    inst.components.projectile:SetHitDist(2)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(inst.Remove)
    inst.components.projectile:SetOnThrownFn(OnThrown)

    return inst
end

-- local function PlayHitSound(proxy)
--     local inst = CreateEntity()

--     --[[Non-networked entity]]

--     inst.entity:AddTransform()
--     inst.entity:AddSoundEmitter()

--     inst.Transform:SetFromProxy(proxy.GUID)

--     inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/shotexplo")

--     inst:Remove()
-- end

local function hit_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    -- --Dedicated server does not need to spawn the local fx
    -- if not TheNet:IsDedicated() then
    --     --Delay one frame in case we are about to be removed
    --     inst:DoTaskInTime(0, PlayHitSound)
    -- end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    inst:DoTaskInTime(.5, inst.Remove)

    return inst
end

return Prefab("mgl_uav_armed_charge", fn, assets),
    Prefab("mgl_uav_66_hit", hit_fn)