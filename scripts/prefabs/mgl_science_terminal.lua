local assets = {
    Asset("ANIM", "anim/mgl_book.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_book1.xml")
}

local function openterminal(inst, doer)
    if doer and doer:IsValid() and doer:HasTag("mgl") then
        -- 角色对话
        if doer.components.talker then
            doer.components.talker:Say("启动科学终端...")
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
    inst.AnimState:PlayAnimation("book1")

    inst:AddTag("mgl_item")
    inst:AddTag("mgl_science_terminal")


    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_book1.xml"
    inst.components.inventoryitem.imagename = "mgl_book1"


    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(openterminal)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_science_terminal", fn, assets)