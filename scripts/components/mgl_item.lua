local Mgl_Item = Class(function(self, inst)
    self.inst = inst
    self.userid = nil
end)

function Mgl_Item:OnLoad(data)
    self.userid = data.userid or nil
end

function Mgl_Item:OnSave()
    return { userid = self.userid }
end

return Mgl_Item
