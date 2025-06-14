AddPlayerPostInit(function(inst)
    if not inst.components.mgl_level then
        inst:AddComponent("mgl_level")
    end
    inst.mgl_level = net_smallbyte(inst.GUID, "mgl_level", "mgl_level")
    inst.mgl_level:set(0)
end)