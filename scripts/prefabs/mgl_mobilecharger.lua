local assets = {
    Asset("ATLAS", "images/inventoryimages/mgl_mobilecharger.xml")
}

local function ShouldAcceptItem(inst, item)
    if item ~= nil then
        if inst.components.mgl_mobilecharger:CanFill() then
            --木头
            if item.prefab == "log" then
                return true
            --草
            elseif item.prefab == "cutgrass" then
                return true
            --木炭
            elseif item.prefab == "charcoal" then
                return true
            --硝石
            elseif item.prefab == "nitre" then
                return true
            --噩梦燃料
            elseif item.prefab == "nightmarefuel" then
                return true
            end
        end
    end
    return false
end

local function OnGetItemFromPlayer(inst, giver, item)
    if item.prefab == "log" then
        inst.components.mgl_mobilecharger:Fill("log")
    elseif item.prefab == "cutgrass" then
        inst.components.mgl_mobilecharger:Fill("cutgrass")
    elseif item.prefab == "charcoal" then
        inst.components.mgl_mobilecharger:Fill("charcoal")
    elseif item.prefab == "nitre" then
        inst.components.mgl_mobilecharger:Fill("nitre")
    elseif item.prefab == "nightmarefuel" then
        inst.components.mgl_mobilecharger:Fill("nightmarefuel")
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("nosteal")
    inst:AddTag("mgl_item_undrop")
    inst:AddTag("mgl_mobilecharger_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_mobilecharger.xml"
    inst.components.inventoryitem.canonlygoinpocket = true

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)

    inst:AddComponent("mgl_mobilecharger")

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_mobilecharger", fn, assets)
