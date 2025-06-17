local assets = {
    Asset("ANIM", "anim/mgl_book.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_book2.xml")
}

local function useitem(inst, doer, item)
    if doer and doer.components.mgl_level then
        -- print("useitem book2 当前精英等级为:", doer.components.mgl_level:GetMglLevel())
        if doer.components.mgl_level:GetMglLevel() == 1 then
            doer.components.mgl_level:AddMglLevel(1)
            inst:Remove()
        elseif doer.components.mgl_level:GetMglLevel() == 2 then
            doer.components.talker:Say(STRINGS.MGL_USEANOFF)
        elseif doer.components.mgl_level:GetMglLevel() == 0 then
            doer.components.talker:Say(STRINGS.MGL_MUST_LEVEL)
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mgl_book")
    inst.AnimState:SetBuild("mgl_book")
    inst.AnimState:PlayAnimation("book2")

    inst:AddTag("mgl_item")
    inst:AddTag("book")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_book2.xml"

    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(
        useitem
    )

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_book2", fn, assets)
