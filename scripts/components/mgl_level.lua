local function on_mgl_level(self)
    if self.inst.mgl_level then
        self.inst.mgl_level:set(self.mgl_level)
    end
end

local  mgl_level = Class(
function(self, inst)
        self.inst = inst
        self.max = 2
        self.mgl_level = 0
end, nil, {
    mgl_level = on_mgl_level
})

-- 获取当前精英等级
function mgl_level:GetMglLevel()
    return self.mgl_level
end

-- 提升当前精英等级
function mgl_level:AddMglLevel(num)
    self.mgl_level = self.mgl_level + num
    if self.mgl_level > self.max then
        self.mgl_level = self.max
    end
end

function  mgl_level:OnSave()
    return {mgl_level = self.mgl_level}
end

function mgl_level:OnLoad(data)
    if data.mgl_level then
        self.mgl_level = data.mgl_level
    end
end


return  mgl_level
