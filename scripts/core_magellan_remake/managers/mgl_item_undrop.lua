AddComponentPostInit(
    "inventory",
    function(self)
        local oldfn = self.DropItem
        self.DropItem = function(self, item, wholestack, randomdir, pos)
            if item and item:HasTag("mgl_item_undrop") then
                return
            else
                return oldfn(self, item, wholestack, randomdir, pos)
            end
        end
    end)

