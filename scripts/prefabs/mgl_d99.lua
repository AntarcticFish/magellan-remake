local assets = {
    Asset("ANIM", "anim/mgl_D99.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_d99.xml")
}

local function useitem(inst, doer, item)
    if doer and doer.components.mgl_system then
        if not doer.components.mgl_system.d99_lock then
            doer.components.mgl_system.d99_lock = true
            inst:Remove()
        elseif doer.components.mgl_system.d99_lock then
            doer.components.talker:Say(STRINGS.MGL_USEANOFF)
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mgl_D99")
    inst.AnimState:SetBuild("mgl_D99")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_d99.xml"

    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(
        useitem
    )

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_d99", fn, assets)
