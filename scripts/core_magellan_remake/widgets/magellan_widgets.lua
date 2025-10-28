local Widget = require "widgets/widget"
local Image = require "widgets/image"

local function OnControl(self, control, down)
    local main_widget = self:GetParent()
    if main_widget ~= nil and main_widget._OnControl ~= nil then
        main_widget:_OnControl(control, down)
    end
end

local mgl_widget =
    Class(Widget, function(self, owner)
        Widget._ctor(self, "mgl_widget", owner)
        self.owner = owner
        self:SetHAnchor(0)
        self:SetVAnchor(0)
        self:SetScaleMode(SCALEMODE_PROPORTIONAL)
        self:SetMaxPropUpscale(MAX_HUD_SCALE)
        self:SetScale(1, 1, 1)

        self.image = self:AddChild(Image())
        self.image:SetClickable(true)
        self.image.OnControl = OnControl

        -- self.owner:ListenForEvent("mgl_useskill", function()
        --     self.image:SetTint(1, 1, 1, 0.5)
        -- end)

        -- self.owner:ListenForEvent("mgl_skill_is_normal", function()
        --     self.image:SetTint(1, 1, 1, 1)
        -- end)

        self:StartUpdating()
    end)

function mgl_widget:OnUpdate()
    self.image:SetTexture("images/inventoryimages/mgl_skill" .. self.owner.uav_type:value() .. ".xml",
        "mgl_skill" .. self.owner.uav_type:value() .. ".tex")
    self.image:SetScale(0.72)
end

function mgl_widget:LoadPosition()
    self:SetPosition(-410, -280, 0)
    TheSim:GetPersistentString("mgl_widget_position", function(load_success, data)
        if load_success and data and data ~= "" then
            local success, pos_data = RunInSandbox(data)
            if success and pos_data and pos_data.x and pos_data.y then
                -- print("mgl_widget:LoadPosition加载",pos_data.x,pos_data.y)
                self:SetPosition(pos_data.x, pos_data.y, 0)        
            end
        end
    end)
end

function mgl_widget:SavePosition(x, y)
    local pos_data = {x = x, y = y}
    local str = DataDumper(pos_data, nil, true)
    TheSim:SetPersistentString("mgl_widget_position", str, false)
    -- print("mgl_widget:SavePosition保存", str)
end

function mgl_widget:_OnControl(control, down)
    if self.focus and control == CONTROL_SECONDARY then
        if down then
            self:StartDrag()
        else
            self:EndDrag()
        end
    end
end

function mgl_widget:StartDrag()
    if self.followhandler ~= nil then
        self.followhandler:Remove()
        self.followhandler = nil
    end
    local initial_mouse_pos = TheInput:GetScreenPosition()
    local initial_widget_pos = self:GetPosition()
    -- 添加移动处理器
    self.followhandler = TheInput:AddMoveHandler(function(x, y)    
        local pos = Vector3(x, y, 0)
        self:SetPosition(initial_widget_pos + (pos - initial_mouse_pos) / 1.1)
        if not TheInput:IsMouseDown(MOUSEBUTTON_RIGHT) then
            self:EndDrag()
        end
    end)
end

function mgl_widget:EndDrag()
    if self.followhandler ~= nil then
        self.followhandler:Remove()
    end
    self.followhandler = nil
    local pos = self:GetPosition()
    -- 保存位置
    self:SavePosition(pos.x, pos.y)
end

return mgl_widget