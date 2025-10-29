local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"

local function OnControl(self, control, down)
    local main_widget = self:GetParent()
    local handled = false
    
    -- 调用主widget的控制处理函数
    if main_widget ~= nil and main_widget._OnControl ~= nil then
        handled = main_widget:_OnControl(control, down)
    end
    
    -- 允许ImageButton默认处理左键点击
    if control == CONTROL_ACCEPT and not handled then
        return ImageButton.OnControl(self, control, down)
    end
    
    return handled
end

-- RPC调用函数
local function SendRPC(inst, rpc_name)
    if not TheNet:IsDedicated() and ThePlayer and ThePlayer == inst then
        SendModRPCToServer(MOD_RPC["magellan_remake"][rpc_name], inst)
        return true
    end
    return false
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
        self.is_hidden = false -- 跟踪UI是否处于隐藏状态

        -- 隐藏按钮（最左侧）
        self.hidden_button = self:AddChild(ImageButton("images/inventoryimages/mgl_hidden.xml", "mgl_hidden.tex"))
        self.hidden_button:SetScale(0.4)
        self.hidden_button:SetPosition(-175, 0, 0)
        self.hidden_button:SetTooltip(STRINGS.SKILL_UI[1])
        self.hidden_button:SetClickable(true)
        self.hidden_button:SetOnClick(function()
            self:ToggleVisibility()
        end)
        self.hidden_button.OnControl = OnControl
        
        -- 技能图标（中间）
        self.skill_image = self:AddChild(ImageButton())
        self.skill_image:SetScale(0.8)
        self.skill_image:SetPosition(35, 0, 0) -- 设置在召唤和回收按钮之间
        self.skill_image:SetTooltip(STRINGS.SKILL_UI[2])
        self.skill_image:SetClickable(true)
        self.skill_image:SetOnClick(function()
            SendRPC(self.owner, "UseSkill")
        end)
        self.skill_image.OnControl = OnControl

        --冷却灰色覆盖
        self.skill_image_grey = self:AddChild(Image("images/inventoryimages/mgl_skill_grey.xml", "mgl_skill_grey.tex"))
        self.skill_image_grey:SetScale(0.8)
        self.skill_image_grey:SetPosition(35, 0, 0) -- 设置在召唤和回收按钮之间
        self.skill_image_grey:SetClickable(false)
        self.skill_image_grey:Hide() -- 默认隐藏
        
        -- 技能冷却时间文本
        self.skill_cooldown_text = self:AddChild(Text(NUMBERFONT, 50))
        self.skill_cooldown_text:SetPosition(38, -25, 0)
        self.skill_cooldown_text:SetColour(1, 1, 1, 1) -- 设置为白色
        self.skill_cooldown_text:SetScale(0.8)
        self.skill_cooldown_text:SetString(0)
        self.skill_cooldown_text:Hide() -- 默认隐藏

        -- 切换无人机按钮（最左侧）
        self.change_uav_button = self:AddChild(ImageButton("images/inventoryimages/mgl_changeuav.xml", "mgl_changeuav.tex"))
        self.change_uav_button:SetScale(0.8)
        self.change_uav_button:SetPosition(-105, 0, 0)
        self.change_uav_button:SetTooltip(STRINGS.SKILL_UI[3])
        self.change_uav_button:SetOnClick(function()
            SendRPC(self.owner, "ChangeUav")
        end)
        self.change_uav_button.OnControl = OnControl

        -- 召唤无人机按钮（左二）
        self.call_uav_button = self:AddChild(ImageButton("images/inventoryimages/mgl_calluav.xml", "mgl_calluav.tex"))
        self.call_uav_button:SetScale(0.8)
        self.call_uav_button:SetPosition(-35, 0, 0)
        self.call_uav_button:SetTooltip(STRINGS.SKILL_UI[4])
        self.call_uav_button:SetClickable(true)
        self.call_uav_button:SetOnClick(function()
            SendRPC(self.owner, "CallUav")
        end)
        self.call_uav_button.OnControl = OnControl

        --冷却灰色覆盖
        self.call_uav_button_grey = self:AddChild(Image("images/inventoryimages/mgl_calluav_grey.xml", "mgl_calluav_grey.tex"))
        self.call_uav_button_grey:SetScale(0.8)
        self.call_uav_button_grey:SetPosition(-35, 0, 0) -- 设置在召唤和回收按钮之间
        self.call_uav_button_grey:SetClickable(false)
        self.call_uav_button_grey:Hide() -- 默认隐藏
        
        -- 召唤冷却时间文本
        self.call_cooldown_text = self:AddChild(Text(NUMBERFONT, 50))
        self.call_cooldown_text:SetPosition(-32, -25, 0)
        self.call_cooldown_text:SetColour(1, 1, 1, 1) -- 设置为白色
        self.call_cooldown_text:SetScale(0.8)
        self.call_cooldown_text:SetString(0)
        self.call_cooldown_text:Hide() -- 默认隐藏

        -- 召回无人机按钮（最右侧）
        self.recall_uav_button = self:AddChild(ImageButton("images/inventoryimages/mgl_callbackuav.xml", "mgl_callbackuav.tex"))
        self.recall_uav_button:SetScale(0.8)
        self.recall_uav_button:SetPosition(105, 0, 0)
        self.recall_uav_button:SetTooltip(STRINGS.SKILL_UI[5])
        self.recall_uav_button:SetOnClick(function()
            SendRPC(self.owner, "RecallUav")
        end)
        self.recall_uav_button.OnControl = OnControl
    end)


function mgl_widget:LoadPosition()
    self:SetPosition(-410, -280, 0)
    self.skill_image:SetTextures("images/inventoryimages/mgl_skill" .. self.owner.uav_type:value() .. ".xml",
    "mgl_skill" .. self.owner.uav_type:value() .. ".tex")
    TheSim:GetPersistentString("mgl_widget_position", function(load_success, data)
        if load_success and data and data ~= "" then
            local success, pos_data = RunInSandbox(data)
            if success and pos_data and pos_data.x and pos_data.y then
                -- print("mgl_widget:LoadPosition加载",pos_data.x,pos_data.y)
                self:SetPosition(pos_data.x, pos_data.y, 0)        
            end
        end
    end)
    --监听类型变化
    self.owner:ListenForEvent("uav_type", function(inst, data)
        -- 更新技能图标
        self.skill_image:SetTextures("images/inventoryimages/mgl_skill" .. self.owner.uav_type:value() .. ".xml",
        "mgl_skill" .. self.owner.uav_type:value() .. ".tex")
    end)
    -- 监听冷却事件
    self.owner:ListenForEvent("skill_cooldown", function(inst, data)
        self.skill_cooldown_text:SetString(self.owner.skill_cooldown:value())
        if self.owner.skill_cooldown:value() > 0 then
            self.skill_image_grey:Show()
            self.skill_cooldown_text:Show()
        else
            self.skill_image_grey:Hide()
            self.skill_cooldown_text:Hide()
        end
    end)
    self.owner:ListenForEvent("call_cooldown", function(inst, data)
        self.call_cooldown_text:SetString(self.owner.call_cooldown:value())
        if self.owner.call_cooldown:value() > 0 then
            self.call_uav_button_grey:Show()
            self.call_cooldown_text:Show()
            -- 冷却灰色遮盖，随时间减小覆盖
        else
            self.call_uav_button_grey:Hide()
            self.call_cooldown_text:Hide()
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
    -- 无论焦点在哪个子元素上，只要右键点击整个widget区域都可以拖拽
    if control == CONTROL_SECONDARY then
        if down then
            self:StartDrag()
        else
            self:EndDrag()
        end
        return true
    end
    -- 让子元素的OnControl也能正常工作
    return false
end

function mgl_widget:OnGainFocus()
    Widget.OnGainFocus(self)
    -- 确保整个widget都可以拖拽
    self.focus = true
end

function mgl_widget:OnLoseFocus()
    Widget.OnLoseFocus(self)
    self.focus = false
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

-- 切换UI元素的可见性
function mgl_widget:ToggleVisibility()
    self.is_hidden = not self.is_hidden
    
    -- 动态调整隐藏按钮和技能按钮的位置
    if self.is_hidden then
        -- 隐藏状态：让两个按钮紧挨着
        self.change_uav_button:Hide()
        self.call_uav_button:Hide()
        self.recall_uav_button:Hide()
        self.call_cooldown_text:Hide()
        self.skill_cooldown_text:SetPosition(-102, -25, 0)
        self.skill_image:SetPosition(-105, 0, 0)
    else
        -- 显示状态：恢复原始位置
        self.change_uav_button:Show()
        self.call_uav_button:Show()
        self.recall_uav_button:Show()
        self.call_cooldown_text:Show()
        self.skill_cooldown_text:SetPosition(38, -25, 0)
        self.skill_image:SetPosition(35, 0, 0)    -- 保持在中间位置
    end
end

return mgl_widget