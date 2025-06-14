---@class replica_components
---@field event_trigger_magellan_remake replica_event_trigger_magellan_remake

---@class replica_event_trigger_magellan_remake
---@field inst ent
---@field event_name netvar
---@field type netvar
---@field trigger netvar
local event_trigger_magellan_remake = Class(
---@param self replica_event_trigger_magellan_remake
---@param inst ent
function(self, inst)
    self.inst = inst
    self.event_name = net_string(inst.GUID, "event_trigger_magellan_remake.event_name")
    self.type = net_string(inst.GUID, "event_trigger_magellan_remake.type")
    self.trigger = net_bool(inst.GUID, "event_trigger_magellan_remake.trigger",'event_trigger_magellan_remake_triggered')
end)

function event_trigger_magellan_remake:SetEventName(event_name)
    self.event_name:set(event_name)
end

function event_trigger_magellan_remake:GetEventName()
    return self.event_name:value()
end

function event_trigger_magellan_remake:SetType(type)
    self.type:set(type)
end

function event_trigger_magellan_remake:GetType()
    return self.type:value()
end

function event_trigger_magellan_remake:Trigger(value)
    return self.trigger:set(value)
end

return event_trigger_magellan_remake