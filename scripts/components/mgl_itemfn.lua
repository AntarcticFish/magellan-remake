local Mgl_ItemFn = Class(function(self, inst)
    self.inst = inst
    self.fn = nil
end)

function Mgl_ItemFn:SetFunction(fn)
    self.fn = fn
end

function Mgl_ItemFn:RunningFunction(doer, item)
    if self.fn ~= nil then
        self.fn(self.inst, doer, item)
    end
end

return Mgl_ItemFn
