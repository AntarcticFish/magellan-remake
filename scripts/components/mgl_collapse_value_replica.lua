---@class replica_components
---@field mgl_collapse_value replica_mgl_collapse_value

---@class replica_mgl_collapse_value
---@field inst ent
---@field collapse_value netvar # 当前坍缩值的网络变量
---@field max_collapse_value number # 最大坍缩值（默认为100）
local mgl_collapse_value_replica = Class(
---@param self replica_mgl_collapse_value
---@param inst ent
function(self, inst)
    self.inst = inst
    -- 创建网络变量用于同步坍缩值
    self.collapse_value = net_byte(inst.GUID, "mgl_collapse_value.collapse_value", "collapse_value_changed")
    -- 设置默认最大坍缩值
    self.max_collapse_value = 100
end)

---获取当前坍缩值（供UI组件使用）
---@return number 当前坍缩值
function mgl_collapse_value_replica:value()
    return self.collapse_value:value()
end

---获取坍缩值百分比
---@return number 坍缩值百分比 (0-1)
function mgl_collapse_value_replica:GetPercent()
    local value = self.collapse_value:value() or 0
    return value / (self.max_collapse_value or 100)
end

---获取最大坍缩值
---@return number 最大坍缩值
function mgl_collapse_value_replica:GetMaxCollapseValue()
    return self.max_collapse_value or 100
end

return mgl_collapse_value_replica