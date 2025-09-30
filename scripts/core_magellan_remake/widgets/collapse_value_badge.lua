local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Widget = require "widgets/widget"

local function OnControl(self, control, down)
    local main_widget = self:GetParent()
    if main_widget ~= nil and main_widget._OnControl ~= nil then
        main_widget:_OnControl(control, down)
    end
end

local CollapseValueBadge = Class(Widget, function(self, owner)
    Widget._ctor(self, "CollapseValueBadge")
    self.owner = owner

    self.percent = 1
    self:SetScale(1, 1, 1)

    self.anim = self:AddChild(UIAnim())
    self.anim:GetAnimState():SetBank("mgl_collapseui")
    self.anim:GetAnimState():SetBuild("mgl_collapseui")
    self.anim:GetAnimState():SetMultColour(0.85, 0.85, 0.85, 1)
    self.anim:GetAnimState():SetPercent("anim", 1)
    self.anim:SetClickable(true)
    self.anim.OnControl = OnControl

    self.num = self:AddChild(Text(BODYTEXTFONT, 33))
    self.num:SetHAlign(ANCHOR_MIDDLE)
    self.num:SetPosition(3, 0, 0)
    self.num:Hide()
    self.num:SetString("0")
    self.num:SetClickable(false)
    self.anim:SetOnGainFocus(function()
        self.num:Show()
    end)
    self.anim:SetOnLoseFocus(function()
        self.num:Hide()
    end)
end)

function CollapseValueBadge:OnSave()
    return {collapse_value = self.collapse_value}
end

function CollapseValueBadge:OnLoad(data)
    if data.collapse_value then
        self.collapse_value = data.collapse_value
    end
end

function CollapseValueBadge:SetInit()
    -- 在客户端上，我们需要使用replica来访问坍缩值
    if TheWorld.ismastersim then
        -- 服务器端：直接监听组件事件
        self.owner:ListenForEvent("collapse_value", function(inst, data)
            local value = data and data.value or 0
            local max = data and data.max or 100
            local percent = value / max
            self.anim:GetAnimState():SetPercent("anim", 1 - percent)
            self.num:SetString(tostring(math.ceil(value)))
        end)
        
        -- 初始更新一次
        if self.owner.collapse_value then
            local value = self.owner.collapse_value:value() or 0
            local max = self.owner.collapse_value.max_collapse_value or 100
            local percent = value / max
            self.anim:GetAnimState():SetPercent("anim", 1 - percent)
            self.num:SetString(tostring(math.ceil(value)))
        end
    else
        -- 客户端：使用replica组件
        local function UpdateValueFromReplica()
            if self.owner.replica.mgl_collapse_value then
                local value = self.owner.replica.mgl_collapse_value:value() or 0
                local max = self.owner.replica.mgl_collapse_value:GetMaxCollapseValue() or 100
                local percent = value / max
                self.anim:GetAnimState():SetPercent("anim", 1 - percent)
                self.num:SetString(tostring(math.ceil(value)))
            end
        end
        
        -- 监听replica组件的网络变量变化事件
        self.owner:ListenForEvent("collapse_value_changed", function()
            UpdateValueFromReplica()
        end)
        
        -- 初始更新一次
        UpdateValueFromReplica()
    end
end

function CollapseValueBadge:_OnControl(control, down)
    if self.focus and control == CONTROL_SECONDARY then
        if down then
            self:StartDrag()
        else
            self:EndDrag()
        end
    end
end

function CollapseValueBadge:StartDrag()
    if self.followhandler ~= nil then
        self.followhandler:Remove()
        self.followhandler = nil
    end
    local initial_mouse_pos = TheInput:GetScreenPosition()
    local initial_widget_pos = self:GetPosition()
    local statusdisplays = self:GetParent()
    local scale = 1
    if statusdisplays ~= nil then
        scale = statusdisplays:GetScale().x
    end
    self.followhandler = TheInput:AddMoveHandler(function(x,y)
        local pos = Vector3(x, y, 0)
        self:SetPosition(initial_widget_pos + (pos - initial_mouse_pos) / scale)
        if not Input:IsMouseDown(MOUSEBUTTON_RIGHT) then
            self:EndDrag()
        end
    end)
end

function CollapseValueBadge:EndDrag()
    if self.followhandler ~= nil then
        self.followhandler:Remove()
    end
    self.followhandler = nil
    
    -- 保存位置
    local pos = self:GetPosition()
    self:SavePosition(pos.x, pos.y)
end

-- 保存位置功能
function CollapseValueBadge:SavePosition(x, y)
    local pos_data = {x = x, y = y}
    local str = DataDumper(pos_data, nil, true)
    TheSim:SetPersistentString("collapse_value_badge_position", str, false)
end

-- 加载位置功能
function CollapseValueBadge:LoadPosition()
    self:SetPosition(-40, -100, 0) -- 默认位置
    TheSim:GetPersistentString("collapse_value_badge_position", function(load_success, data)
        if load_success and data and data ~= "" then
            local success, pos_data = RunInSandbox(data)
            if success and pos_data and pos_data.x and pos_data.y then
                self:SetPosition(pos_data.x, pos_data.y, 0)
            end
        end
    end)
end

return CollapseValueBadge