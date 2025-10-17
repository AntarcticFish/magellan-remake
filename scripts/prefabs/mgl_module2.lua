local assets = {
    Asset("ANIM", "anim/mgl_module.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_module2.xml")
}

local function useitem(inst, doer, item)
    if doer and doer.components.mgl_level:GetMglLevel() ==2 then
        if doer and doer.components.mgl_system then
            if doer.components.mgl_system.module == 0 then
                doer.components.talker:Say(STRINGS.MGL_MUST_LEVEL2)
                return
            elseif doer.components.mgl_system.module == 1 or doer.components.mgl_system.module == 2 then
                -- 将测绘仪等级迁移到人物系统上，统一管理
                doer.components.mgl_system.mgl_mapper_level = 1
                doer.components.mgl_system.module = 2
                inst:Remove()
            end
        end
    else
        doer.components.talker:Say(STRINGS.MGL_MUST_LEVEL_NEED)
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
