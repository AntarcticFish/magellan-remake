-- 这个组件是为hook event服务的,不要看我

---@class components
---@field event_trigger_magellan_remake component_event_trigger_magellan_remake

local function on_event_name(self, value)
    self.inst.replica.event_trigger_magellan_remake:SetEventName(value)
end

local function on_type(self, value)
    self.inst.replica.event_trigger_magellan_remake:SetType(value)
end

local function on_trigger(self, value)
    self.inst.replica.event_trigger_magellan_remake:Trigger(value)
end

-- local function on_val(self, value)
    -- self.inst.replica.event_trigger_magellan_remake:SetVal(value)
-- end

---@class component_event_trigger_magellan_remake
---@field inst ent
---@field trigger boolean
---@field event_name string
---@field type string
local event_trigger_magellan_remake = Class(
---@param self component_event_trigger_magellan_remake
---@param inst ent
function(self, inst)
    self.inst = inst
    -- self.val = 0
    self.trigger = true
    self.event_name = ''
    self.type = ''
end,
nil,
{
    -- val = on_val,
    event_name = on_event_name,
    type = on_type,
    trigger = on_trigger,
})

---comment
---@param event eventID
---@param type string
function event_trigger_magellan_remake:Push(event,type)
    self.event_name = event
    self.type = type
    self.trigger = not self.trigger
end

return event_trigger_magellan_remake