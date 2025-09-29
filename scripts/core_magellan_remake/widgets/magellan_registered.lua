AddClassPostConstruct(
    "widgets/statusdisplays",
    function(self)
        if self.owner and self.owner:HasTag("mgl") then
            local mgl_widget = require("core_magellan_remake/widgets/magellan_widgets")
            self.mgl_widget = self:AddChild(mgl_widget(self.owner))
            self.mgl_widget:LoadPosition()
            self.mgl_widget:Show()
        end

        local old_SetGhostMode = self.SetGhostMode --死亡/复活 隐藏/显示
        function self:SetGhostMode(ghostmode, ...)
            old_SetGhostMode(self, ghostmode, ...)
            if ghostmode then
                if self.mgl_widget ~= nil then
                    self.mgl_widget:Hide()
                end
            else
                if self.mgl_widget ~= nil then
                    self.mgl_widget:Show()
                end
            end
        end
    end
)
