local assets =
{
    Asset("ANIM", "anim/mgl_fx.zip"),
    -- Asset("SOUND", "sound/chess.fsb"),
}

local function OnHit(inst, owner, target)
    SpawnPrefab("uav_lrbd_attack1_hit").Transform:SetPosition(inst.Transform:GetWorldPosition())
    --添加命中特效
    local fx = SpawnPrefab("mgl_fx")
    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
    -- fx.entity:SetParent(target.entity)
    fx.AnimState:PlayAnimation("uav_lrbd_attack1_hit")
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

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("mgl_fx")
    inst.AnimState:SetBuild("mgl_fx")
    inst.AnimState:PlayAnimation("uav_lrbd_proj_cast")
    inst.AnimState:PlayAnimation("uav_lrbd_proj_pre")
    inst.AnimState:PlayAnimation("uav_lrbd_proj_loop",true)
    -- inst.AnimState:PlayAnimation("idle")

    --projectile (from projectile component) added to pristine state for optimization
    inst:AddTag("projectile")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(30)
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

return Prefab("mgl_uav_lrbd_charge", fn, assets),
    Prefab("uav_lrbd_attack1_hit", hit_fn)