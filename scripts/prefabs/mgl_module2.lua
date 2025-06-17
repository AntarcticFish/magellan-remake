local assets = {
    Asset("ANIM", "anim/mgl_module.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_module2.xml")
}

local function useitem(inst, doer, item)
    if doer and doer.components.mgl_system then
        if doer.components.mgl_system.module == 0 then
            doer.components.talker:Say(STRINGS.MGL_MUST_LEVEL2)
            return
        elseif doer.components.mgl_system.module == 1 then
            local item = doer.components.mgl_system.mgl_mapper
            if item and item.components.mgl_mapper then
                item.components.mgl_mapper.level = 1
            end
            doer.components.mgl_system.module = 2
            inst:Remove()
        elseif doer.components.mgl_system.module == 2 then
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
    inst.AnimState:PlayAnimation("mgl_module2")

    inst:AddTag("mgl_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_module2.xml"

    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(
        useitem
    )

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_module2", fn, assets)
