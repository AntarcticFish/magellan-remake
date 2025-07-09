-- 转换为电能
local function AddPower(self,num)
    self.mult = math.min(self.mult + 0.1, 1)
    self.power = math.clamp(self.power + num * self.mult, 0, self.maxpower)
    self.inst.components.finiteuses:SetUses(self.power)
end

local Mgl_MobileCharger = Class(function(self, inst)
    self.inst = inst
    self.maxpower = 100
    self.maxcapacity = 20
    self.power = 100
    self.mult = 0
    -- 燃料容量
    self.capacity = 0
    self.chargerfuel = false
    self._task = self.inst:DoPeriodicTask(5,function()
        -- 如果白天且在地面时,恢复1点能量
        if self.chargerfuel and TheWorld.state.isday then
            self.power = math.clamp(self.power + 1, 0, self.maxpower)
            self.inst.components.finiteuses:SetUses(self.power)
        end
        -- 有燃料时每5s消耗1个燃料并转化为对应的能量
        if self.capacity > 0 and self.power <= self.maxpower-10 then
            self.capacity = math.clamp(self.capacity - 1, 0, self.maxcapacity)
            AddPower(self, 1)
        end
    end)
end)

-- 是否可以填充
function Mgl_MobileCharger:CanFill()
    -- 燃料容量未满
    if self.capacity < self.maxcapacity then
        return true
    end
    return false
end

-- 填充燃料
function Mgl_MobileCharger:Fill(prefabName)
    if prefabName == "log" then
        -- print("添加燃料："..self.capacity)
        self.capacity = math.clamp(self.capacity + 1, 0, self.maxcapacity)
    end
end

-- 获取当前能量
function Mgl_MobileCharger:GetPower()
    return self.power
end

-- 消耗能量
function Mgl_MobileCharger:Cost()
    if self.power > 0 then
        self.power = math.clamp(self.power - 1, 0, self.maxpower)
        self.inst.components.finiteuses:SetUses(self.power)
    end
end

-- 升级装置
function Mgl_MobileCharger:ChargerFuel()
    if self.chargerfuel == false then
        self.chargerfuel = true
        self.maxcapacity = self.maxcapacity + 20
    end
end

function Mgl_MobileCharger:OnLoad(data)
    self.power = data.power or 0
    self.mult = data.mult or 0
    self.capacity = data.capacity or 0
    self.maxcapacity = data.maxcapacity or 20
    self.chargerfuel = data.chargerfuel or false
    self.inst.components.finiteuses:SetUses(self.power)
end

function Mgl_MobileCharger:OnSave()
    return { power = self.power, mult = self.mult, capacity = self.capacity, maxcapacity = self.maxcapacity, chargerfuel = self.chargerfuel }
end

return Mgl_MobileCharger
