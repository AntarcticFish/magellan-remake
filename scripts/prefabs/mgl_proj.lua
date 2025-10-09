-- mgl_proj.lua
local assets = {
    Asset("ANIM", "anim/mgl_proj.zip"),
    Asset("ANIM", "anim/mgl_fx.zip")
}

local function onhit(inst, attacker, target)
    -- 生成独立命中特效（使用专用prefab）
    local hit_fx = SpawnPrefab("mgl_hit_fx")
    local x, y, z = target.Transform:GetWorldPosition()
    hit_fx.Transform:SetPosition(x, y, z)
    
    -- 自身移除逻辑
    inst:DoTaskInTime(.3, inst.Remove)
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("mgl_fx")
    inst.AnimState:SetBuild("mgl_fx")
    inst.AnimState:PlayAnimation("uav_lrbd_proj_cast",true)
    inst:AddTag("projectile")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(30)
    inst.components.projectile:SetHoming(true)
    inst.components.projectile:SetHitDist(2)
    inst.components.projectile:SetOnHitFn(onhit)
    inst.components.projectile:SetOnMissFn(inst.Remove)

    -- 自动清理保护
    inst.persists = false
    inst:DoTaskInTime(10, inst.Remove) -- 防止未命中时永久存在

    return inst
end

-- 独立命中特效prefab（不再复用弹药实体）
local function hit_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddFollower()

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.AnimState:SetBank("mgl_proj")
    inst.AnimState:SetBuild("mgl_proj")
    inst.AnimState:PlayAnimation("hit")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

return Prefab("mgl_proj", fn, assets),
       Prefab("mgl_hit_fx", hit_fn)