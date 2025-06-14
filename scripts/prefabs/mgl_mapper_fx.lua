local assets = {
  Asset("ANIM", "anim/mgl_mapper_fx.zip"),}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.AnimState:SetBank("mgl_mapper_fx")
    inst.AnimState:SetBuild("mgl_mapper_fx")
    inst.AnimState:PlayAnimation("idle")
    inst.Transform:SetFourFaced()

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

return Prefab("mgl_mapper_fx", fn, assets)