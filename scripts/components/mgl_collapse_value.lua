-- 坍缩值组件 - 与理智按百分比成相反的状态值

local mgl_collapse_value = Class(function(self, inst)
    self.inst = inst
    self.collapse_value = 0
    self.max_collapse_value = 100 -- 默认最大坍缩值为100

    -- 添加网络变量用于同步和UI显示
    if self.inst.components.sanity then
        self.inst:AddTag("collapseowner")
    end

    -- 检查是否在服务器端
    if not TheNet:IsDedicated() then
        -- 在客户端/单机模式下，直接使用组件访问
        self.inst.collapse_value = self
    end
end)

---计算当前坍缩值（根据理智百分比计算相反值）
---@return number 当前坍缩值
function mgl_collapse_value:CalculateCollapseValue()
    if self.inst.components.sanity then
        -- 确保获取的是有效的理智百分比（0-1范围）
        local sanity_percent = math.max(0, math.min(1, self.inst.components.sanity:GetPercent()))
        -- 计算与理智百分比相反的坍缩值（理智80%对应坍缩值20%）
        local collapse_percent = 1 - sanity_percent
        -- 根据最大坍缩值计算实际数值
        self.collapse_value = collapse_percent * self.max_collapse_value
        return self.collapse_value
    else
        return 0
    end
end

---获取当前坍缩值
---@return number 当前坍缩值
function mgl_collapse_value:GetCollapseValue()
    return self.collapse_value
end

---获取坍缩值百分比
---@return number 坍缩值百分比 (0-1)
function mgl_collapse_value:GetPercent()
    return self.collapse_value / self.max_collapse_value
end

---更新坍缩值（根据当前理智状态）
function mgl_collapse_value:UpdateCollapseValue()
    self:CalculateCollapseValue()
    -- 可以在这里添加坍缩值变化时的回调或效果
    self:OnCollapseValueChanged()
end

---当坍缩值变化时的回调函数
function mgl_collapse_value:OnCollapseValueChanged()
    -- 确保坍缩值在有效范围内
    self.collapse_value = math.max(0, math.min(self.max_collapse_value, self.collapse_value))
    -- 更新网络变量（如果在服务器端）
    if TheWorld.ismastersim then
        if self.inst.replica.mgl_collapse_value then
            self.inst.replica.mgl_collapse_value.collapse_value:set(math.floor(self.collapse_value))
            self.inst.replica.mgl_collapse_value.max_collapse_value = self.max_collapse_value
        end
    end
    -- 发送事件通知UI更新
    self.inst:PushEvent("collapse_value", { value = self.collapse_value, max = self.max_collapse_value })
end

---获取当前坍缩值的网络变量方法（供UI访问）
function mgl_collapse_value:value()
    return self.collapse_value
end

---保存组件数据
---@return table 要保存的数据
function mgl_collapse_value:OnSave()
    return {
        collapse_value = self.collapse_value,
        max_collapse_value = self.max_collapse_value
    }
end

---加载组件数据
---@param data table 保存的数据
function mgl_collapse_value:OnLoad(data)
    if data then
        self.collapse_value = data.collapse_value or 0
        self.max_collapse_value = data.max_collapse_value or 100
    end
end

---当组件初始化完成后的验证
function mgl_collapse_value:OnInit()
    if self.inst.components.sanity then
        -- 再次确保监听理智变化事件
        self:UpdateCollapseValue()

        -- 将事件监听器函数保存为变量，以便后续可以精确移除
        self.sanitydelta_listener = function(inst, data) 
            if TheWorld.ismastersim then
                self:UpdateCollapseValue()
            end
        end
        
        self.inst:ListenForEvent("sanitydelta", self.sanitydelta_listener)
    end
end

---当组件需要被移除时的清理函数
---用于在黑洞协议关闭时移除坍缩值组件
function mgl_collapse_value:OnRemove()
    -- 精确移除之前保存的事件监听器，避免影响其他组件的同名事件监听
    if self.sanitydelta_listener then
        self.inst:RemoveEventCallback("sanitydelta", self.sanitydelta_listener)
        self.sanitydelta_listener = nil
    end
    
    -- 移除相关标签
    if self.inst:HasTag("collapseowner") then
        self.inst:RemoveTag("collapseowner")
    end
    
    -- 移除对组件的直接引用
    if self.inst.collapse_value == self then
        self.inst.collapse_value = nil
    end
    
    -- 发送移除事件
    self.inst:PushEvent("collapse_value_removed")
end

return mgl_collapse_value