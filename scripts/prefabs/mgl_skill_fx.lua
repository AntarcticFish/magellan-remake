local assets_front = {
    Asset("ANIM", "anim/mgl_fx_front.zip"),
}
local assets_back = {
    Asset("ANIM", "anim/mgl_fx_back.zip"),
}
local assets_side = {
    Asset("ANIM", "anim/mgl_fx_side.zip"),
}

local function OnRemove(inst)
    if inst.fx_front ~= nil then
        inst.fx_front:Remove()
    end
    if inst.fx_back ~= nil then
        inst.fx_back:Remove()
    end
    if inst.fx_side ~= nil then
        inst.fx_side:Remove()
    end
    if inst.fx_front21 ~= nil then
        inst.fx_front21:Remove()
    end
    if inst.fx_side21 ~= nil then
        inst.fx_side21:Remove()
    end
    if inst.fx_back21 ~= nil then
        inst.fx_back21:Remove()
    end
end

local function fn_main()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("NOBLOCK")

    inst.entity:SetPristine()
    inst.persists = false

    if not TheWorld.ismastersim then
        return inst
    end

    inst.OnRemove = OnRemove
    inst:ListenForEvent("onremove", inst.OnRemove)
    return inst
end

local function fn_front()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddFollower()

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("mgl_fx_front")
    inst.AnimState:SetBuild("mgl_fx_front")

    inst.entity:SetPristine()
    inst.persists = false

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst:AddTag("DECOR")

    if not TheWorld.ismastersim then
        return inst
    end

    return inst
end

local function fn_back()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddFollower()

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("mgl_fx_back")
    inst.AnimState:SetBuild("mgl_fx_back")

    inst.entity:SetPristine()
    inst.persists = false

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst:AddTag("DECOR")

    if not TheWorld.ismastersim then
        return inst
    end

    return inst
end

local function fn_side()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddFollower()

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("mgl_fx_side")
    inst.AnimState:SetBuild("mgl_fx_side")

    inst.entity:SetPristine()
    inst.persists = false

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst:AddTag("DECOR")

    if not TheWorld.ismastersim then
        return inst
    end

    return inst
end

return 
Prefab("mgl_fx_main", fn_main),
Prefab("mgl_fx_front", fn_front, assets_front),
Prefab("mgl_fx_back", fn_back, assets_back),
Prefab("mgl_fx_side", fn_side, assets_side)
