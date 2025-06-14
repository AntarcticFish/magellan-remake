local Mgl_Mapper = Class(function(self, inst)
    self.inst = inst
    self.level = 0
end)

function Mgl_Mapper:OnLoad(data)
    self.level = data.level or 0
end

function Mgl_Mapper:OnSave()
    return { level = self.level}
end

return Mgl_Mapper
