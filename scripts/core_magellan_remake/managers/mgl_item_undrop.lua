-- 检查是否启用特殊物品固定保护
local function IsItemFixProtectionEnabled()
    local modid = 'magellan_remake'
    local config_name = modid .. '_enable_item_fix_protection'
    return GetModConfigData(config_name) == true
end

AddComponentPostInit(
    "inventory",
    function(self)
        local oldDropItem = self.DropItem
        self.DropItem = function(self, item, wholestack, randomdir, pos)
            if item and item:HasTag("mgl_item_undrop") then
                return
            else
                return oldDropItem(self, item, wholestack, randomdir, pos)
            end
        end

        local oldSwapActiveItemWithSlot = self.SwapActiveItemWithSlot
        self.SwapActiveItemWithSlot = function(self, slot)
            if IsItemFixProtectionEnabled() then
                local item = self:GetItemInSlot(slot)
                if item and item:HasTag("mgl_item_undrop") then
                    return
                end
            end
            return oldSwapActiveItemWithSlot(self, slot)
        end

        local oldTakeActiveItemFromAllOfSlot = self.TakeActiveItemFromAllOfSlot
        self.TakeActiveItemFromAllOfSlot = function(self, slot)
            if IsItemFixProtectionEnabled() then
                local item = self:GetItemInSlot(slot)
                if item and item:HasTag("mgl_item_undrop") then
                    return
                end
            end
            return oldTakeActiveItemFromAllOfSlot(self, slot)
        end
    end)

