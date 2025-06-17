local assets = {
    Asset("ANIM", "anim/mgl_module.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_module1.xml")
}

local function useitem(inst, doer, item)
    if doer and doer.components.mgl_system then
        if doer.components.mgl_system.module == 0 then
            doer.components.mgl_system.module = 1
            inst:Remove()
        elseif doer.components.mgl_system.module > 0 then
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

    inst.AnimState:SetBank("mgl_module")
    inst.AnimState:SetBuild("mgl_module")
    inst.AnimState:PlayAnimation("mgl_module1")

    inst:AddTag("mgl_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_module1.xml"

    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(
        useitem
    )

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_module1", fn, assets)
