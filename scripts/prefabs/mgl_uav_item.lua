local assets = {
    Asset("ATLAS", "images/inventoryimages/mgl_uav_item.xml"),
    Asset("ATLAS", "images/inventoryimages/mgl_uav_66.xml"),
    Asset("ATLAS", "images/inventoryimages/mgl_uav_lrbd.xml"),
    Asset("ATLAS", "images/inventoryimages/mgl_uav_r23.xml"),
    Asset("ATLAS", "images/inventoryimages/mgl_uav_yhly.xml"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    --inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("nosteal")
    inst:AddTag("mgl_item_undrop")
    inst:AddTag("mgl_uav_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_uav_item.xml"
    inst.components.inventoryitem.canonlygoinpocket = true

    inst:AddComponent("rechargeable")
    inst.components.rechargeable:SetOnChargedFn(function()
        inst.components.rechargeable.chargetime = 30
    end)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(500)
    inst.components.finiteuses:SetUses(500)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_uav_item", fn, assets)
