local assets = {
    Asset("ANIM", "anim/mgl_chargerfuel.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_chargerfuel.xml")
}

local function useitem(inst, doer)
    local item = doer and doer.components.mgl_system and doer.components.mgl_system.mobilecharger
    if item then
        item.components.mgl_mobilecharger:ChargerFuel()
        inst:Remove()
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mgl_chargerfuel")
    inst.AnimState:SetBuild("mgl_chargerfuel")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_chargerfuel.xml"

    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(
        useitem
    )

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_chargerfuel", fn, assets)
