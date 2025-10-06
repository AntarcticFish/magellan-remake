AddClassPostConstruct(
    "widgets/statusdisplays",
    function(self)
        if self.owner and self.owner:HasTag("mgl") then
            -- 添加原有的mgl_widget
            local mgl_widget = require("core_magellan_remake/widgets/magellan_widgets")
            self.mgl_widget = self:AddChild(mgl_widget(self.owner))
            self.mgl_widget:LoadPosition()
            self.mgl_widget:Show()   
            
            -- 检查是否启用黑洞协议设置
            -- local enable_blackhole = SUGAR_magellan_remake:getModConfigDataFromTUNING("_enable_blackhole_protocol")
            -- if enable_blackhole then
            --     -- 添加坍缩值UI组件
            --     local collapse_value_badge = require("core_magellan_remake/widgets/collapse_value_badge")
            --     self.collapse_value_badge = self:AddChild(collapse_value_badge(self.owner))
            --     self.collapse_value_badge:LoadPosition()
            --     self.collapse_value_badge:Show()
            --     self.collapse_value_badge:SetInit()
            -- end
        end

        local old_SetGhostMode = self.SetGhostMode --死亡/复活 隐藏/显示
        function self:SetGhostMode(ghostmode, ...)
            old_SetGhostMode(self, ghostmode, ...)
            if ghostmode then
                if self.mgl_widget ~= nil then
                    self.mgl_widget:Hide()
                end
                -- 只在组件存在时操作
                if self.collapse_value_badge ~= nil then
                    self.collapse_value_badge:Hide()
                end
            else
                if self.mgl_widget ~= nil then
                    self.mgl_widget:Show()
                end
                -- 只在组件存在时操作
                if self.collapse_value_badge ~= nil then
                    self.collapse_value_badge:Show()
                end
            end
        end
    end
)
-- 任务系统开关
-- local MglTerminalPanel = require "screens/mgl_terminal_panel"
-- local function AddMagellanEventScreen(self)
--     if self.owner and self.owner:HasTag("mgl") then
--         local ImageButton = require("widgets/imagebutton")
--         self.mglui = self:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex",
--             nil, nil, nil, nil, { 1, 1 }, { 0, 0 }))
--         self.mglui:SetScale(1, 1)
--         self.mglui:SetPosition(-100, 0, 0)
--         self.mglui:SetOnClick(function()
--             local screen = TheFrontEnd:GetActiveScreen()
--             if not screen or not screen.name then return true end
--             -- If the hud exists, open the UI
--             if screen.name:find("HUD") then
--                 TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
--                 return true
--             else
--                 -- If the screen is already open, close it
--                 if screen.name == "mgl_terminal_panel" then
--                     screen:Close()
--                 end
--             end
--         end)
--     end
-- end
-- AddClassPostConstruct("widgets/statusdisplays", AddMagellanEventScreen)
