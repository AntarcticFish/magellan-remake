local Widget = require "widgets/widget"
local Image = require "widgets/image"

local mgl_widget =
    Class(Widget, function(self, owner)
        Widget._ctor(self, "mgl_widget", owner)
        self.owner = owner

        self:SetHAnchor(0)
        self:SetVAnchor(0)
        self:SetPosition(0, 0, 0)
        self:SetScaleMode(SCALEMODE_PROPORTIONAL)

        self.image = self:AddChild(Image())

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
    self.image:SetPosition(-410, -280, 0)
    self.image:SetScale(0.72)
end

return mgl_widget
