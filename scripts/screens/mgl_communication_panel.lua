local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"
local TEMPLATES = require "widgets/redux/templates"
local Screen = require "widgets/screen"
local TextEdit = require "widgets/textedit"

local MglCommunicationPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_communication_panel")
    self.owner = owner
    self.current_friend = nil
    self.on_data_changed = nil
    
    ---------------------------基本布局--------------------------
    --画一个背景
    self.root = self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.root:SetMaxPropUpscale(MAX_HUD_SCALE)
    --添加一个背景
    self.bg = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.bg:SetSize(900, 600)
    self.bg:SetPosition(0, 0)
    --实际屏幕
    self.screen = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.screen:SetSize(780, 520)
    self.screen:SetPosition(0, 0)
    --上部状态条，位置为屏幕最上方
    self.top_bar = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.top_bar:SetSize(780, 35)
    self.top_bar:SetPosition(0, 260 - 35/2)
    --右侧选项栏，位置为屏幕右侧
    self.right_bar = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.right_bar:SetSize(220, 485)
    self.right_bar:SetPosition(390 - 220/2, -35/2)
    --中间剩余为主显示区（聊天区域）
    self.main_display = self.root:AddChild(Widget("main_display"))
    self.main_display:SetPosition(-110, -35/2)
    
    -- 添加一个按钮，用来显示关闭放于右上角
    self.exit_button = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.exit_button:SetPosition(470, 320)
    self.exit_button:SetScale(0.5, 0.5)
    self.exit_button:SetOnClick(function()
        self:Close()
    end)
    
    --------------------------内容--------------------------
    -- 上部状态栏标题
    self.top_title = self.root:AddChild(Text(BODYTEXTFONT, 24))
    self.top_title:SetString("通讯")
    self.top_title:SetColour(1, 1, 1, 1)
    self.top_title:SetPosition(0, 260 - 35/2)
    
    -- 右侧好友列表区域
    self:CreateFriendList()
    
    -- 左侧聊天区域
    self:CreateChatArea()
    
    -- 监听数据变化事件
    self:ListenForDataChanges()
end)

-- 创建好友列表
function MglCommunicationPanel:CreateFriendList()
    -- 好友列表容器
    self.friend_list_container = self.right_bar:AddChild(Widget("friend_list_container"))
    
    -- 添加好友按钮
    self.add_friend_button = self.friend_list_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.add_friend_button:SetScale(0.8, 0.4)
    self.add_friend_button:SetPosition(0, 200)
    self.add_friend_button:SetTextSize(18)
    self.add_friend_button:SetText("添加好友")
    self.add_friend_button.text:SetColour(1, 1, 1, 1)
    self.add_friend_button:SetOnClick(function()
        self:ShowAddFriendUI()
    end)
    
    -- 好友申请按钮
    self.friend_request_button = self.friend_list_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.friend_request_button:SetScale(0.8, 0.4)
    self.friend_request_button:SetPosition(0, 160)
    self.friend_request_button:SetTextSize(18)
    self.friend_request_button:SetText("好友申请")
    self.friend_request_button.text:SetColour(1, 1, 1, 1)
    self.friend_request_button:SetOnClick(function()
        self:ShowFriendRequestUI()
    end)
    
    -- 好友滚动列表
    local widget_width = 180
    local widget_height = 40
    local num_visible_rows = 8
    
    self.friend_scroll_list = self.friend_list_container:AddChild(TEMPLATES.ScrollingGrid(
        {},
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(_, index)
                local root = Widget("friend_item")
                
                -- 好友项背景
                root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.bg:SetSize(180, 40)
                root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                
                -- 好友名称
                root.name = root:AddChild(Text(NEWFONT, 20, ""))
                root.name:SetColour(1, 1, 1, 1)
                root.name:SetPosition(-20, 0, 0)
                root.name:SetHAlign(ANCHOR_LEFT)
                root.name:SetRegionSize(120, 40)
                
                -- 未读消息数（默认隐藏）
                root.unread_bg = root:AddChild(Image("images/ui.xml", "button.tex"))
                root.unread_bg:SetSize(20, 20)
                root.unread_bg:SetPosition(70, 0, 0)
                root.unread_bg:SetTint(1, 0, 0, 1)
                root.unread_bg:Hide()
                
                root.unread_count = root:AddChild(Text(NEWFONT, 16, ""))
                root.unread_count:SetColour(1, 1, 1, 1)
                root.unread_count:SetPosition(70, 0, 0)
                root.unread_count:Hide()
                
                return root
            end,
            apply_fn = function(_, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 设置好友名称
                widget.name:SetString(data.name)
                
                -- 高亮显示当前选中的好友
                if self.current_friend and self.current_friend.id == data.id then
                    widget.bg:SetTint(0.2, 0.3, 0.5, 0.8)
                    widget.name:SetColour(1, 0.9, 0.4, 1)
                else
                    widget.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                    widget.name:SetColour(1, 1, 1, 1)
                end
                
                -- 添加点击事件
                widget.OnMouseButton = function(_, button, down, x, y)
                    if button == MOUSEBUTTON_LEFT and not down then
                        self:SelectFriend(data)
                    end
                end
            end,
            scrollbar_offset = 7,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8
        }
    ))
    
    -- 设置好友滚动列表位置
    self.friend_scroll_list:SetPosition(0, 0)
    
    -- 返回终端按钮
    self.back_button = self.friend_list_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(1.4, 0.7)
    self.back_button:SetPosition(0, -220)
    self.back_button:SetTextSize(20)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)
    
    -- 刷新好友列表
    self:RefreshFriendList()
end

-- 创建聊天区域
function MglCommunicationPanel:CreateChatArea()
    -- 聊天区域容器
    self.chat_container = self.main_display:AddChild(Widget("chat_container"))
    
    -- 聊天记录标题
    self.chat_title = self.chat_container:AddChild(Text(NEWFONT, 24))
    self.chat_title:SetString("选择一个好友开始聊天")
    self.chat_title:SetColour(1, 1, 1, 1)
    self.chat_title:SetPosition(0, 200)
    
    -- 聊天记录滚动列表
    local widget_width = 520
    local widget_height = 70
    local num_visible_rows = 7
    
    self.chat_scroll_list = self.chat_container:AddChild(TEMPLATES.ScrollingGrid(
        {},
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(_, index)
                local root = Widget("chat_item")
                
                -- 发送者名字
                root.sender_name = root:AddChild(Text(NEWFONT_OUTLINE, 14, ""))
                root.sender_name:SetPosition(0, 25)
                root.sender_name:SetRegionSize(480, 20)
                root.sender_name:EnableWordWrap(true)
                
                -- 消息气泡容器
                root.bubble_container = root:AddChild(Widget("bubble_container"))
                root.bubble_container:SetPosition(0, -5)
                
                return root
            end,
            apply_fn = function(_, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 清除之前的气泡
                widget.bubble_container:KillAllChildren()
                
                -- 设置发送者名字
                local current_userid = self.owner and self.owner.userid or "unknown"
                local is_self = data.sender == current_userid
                local sender_name = is_self and "我" or data.name or "未知玩家"
                widget.sender_name:SetString(sender_name)
                widget.sender_name:SetHAlign(is_self and ANCHOR_RIGHT or ANCHOR_LEFT)
                widget.sender_name:SetPosition(is_self and 150 or -150, 25)
                
                -- 创建消息气泡
                local bubble = widget.bubble_container:AddChild(self:CreateMessageBubble(data.content, is_self))
                
                -- 设置气泡位置
                if is_self then
                    bubble:SetPosition(150, 0)
                else
                    bubble:SetPosition(-150, 0)
                end
            end,
            scrollbar_offset = -10,
            scrollbar_height_offset = -60,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8
        }
    ))
    
    -- 设置聊天记录滚动列表位置
    self.chat_scroll_list:SetPosition(0, 0)
    
    -- 消息输入框背景
    self.input_bg = self.chat_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.input_bg:SetSize(520, 60)
    self.input_bg:SetPosition(0, -200)
    self.input_bg:SetTint(0.2, 0.2, 0.2, 0.8)
    
    -- 消息输入框
    self.message_input = self.chat_container:AddChild(TextEdit(BODYTEXTFONT, 20, ""))
    self.message_input:SetRegionSize(480, 50)
    self.message_input:SetPosition(0, -200)
    self.message_input:SetColour(1, 1, 1, 1)
    self.message_input:SetHAlign(ANCHOR_LEFT)
    self.message_input:SetVAlign(ANCHOR_MIDDLE)
    self.message_input:EnableWordWrap(true)
    
    -- 发送按钮
    self.send_button = self.chat_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.send_button:SetScale(0.5, 0.5)
    self.send_button:SetPosition(280, -200)
    self.send_button:SetTextSize(16)
    self.send_button:SetText("发送")
    self.send_button.text:SetColour(1, 1, 1, 1)
    self.send_button:SetOnClick(function()
        self:SendMessage()
    end)
end

-- 创建消息气泡
function MglCommunicationPanel:CreateMessageBubble(content, is_self)
    local bubble = Widget("message_bubble")
    
    -- 气泡背景
    local bg = bubble:AddChild(Image("images/ui.xml", "button.tex"))
    bg:SetSize(300, 50)
    bg:SetTint(is_self and 0.2 or 0.4, is_self and 0.5 or 0.2, is_self and 0.2 or 0.2, 0.9)
    
    -- 圆角处理
    bg:SetScale(1, 0.8)
    
    -- 消息内容
    local text = bubble:AddChild(Text(NEWFONT, 20, content))
    text:SetColour(1, 1, 1, 1)
    text:SetPosition(is_self and 10 or -10, 0)  -- 调整文本位置，避免文字贴边
    text:SetHAlign(is_self and ANCHOR_LEFT or ANCHOR_RIGHT)  -- 修正对齐方向
    text:SetVAlign(ANCHOR_MIDDLE)  -- 垂直居中对齐
    text:SetRegionSize(260, 50)  -- 减小文本区域，留出边距
    text:EnableWordWrap(true)
    
    return bubble
end

-- 选择好友
function MglCommunicationPanel:SelectFriend(friend)
    self.current_friend = friend
    
    -- 更新聊天标题
    self.chat_title:SetString(friend.name)
    
    -- 刷新聊天记录
    self:RefreshChatRecords()
    
    -- 刷新好友列表选中状态
    self.friend_scroll_list:RefreshView()
end

-- 刷新好友列表
function MglCommunicationPanel:RefreshFriendList()
    local friends = {}
    
    -- 从replica获取好友列表
    if self.owner and self.owner.replica and self.owner.replica.mgl_communication_data then
        friends = self.owner.replica.mgl_communication_data:GetFriends()
    end
    
    -- 更新好友滚动列表
    self.friend_scroll_list:SetItemsData(friends)
    self.friend_scroll_list:RefreshView()
end

-- 刷新聊天记录
function MglCommunicationPanel:RefreshChatRecords()
    if not self.current_friend then
        return
    end
    
    local chat_records = {}
    
    -- 从replica获取聊天记录
    if self.owner and self.owner.replica and self.owner.replica.mgl_communication_data then
        chat_records = self.owner.replica.mgl_communication_data:GetChatRecords(self.current_friend.id)
    end
    
    -- 更新聊天滚动列表
    self.chat_scroll_list:SetItemsData(chat_records)
    self.chat_scroll_list:RefreshView()
    
end

-- 发送消息
function MglCommunicationPanel:SendMessage()
    if not self.current_friend then
        return
    end
    
    local content = self.message_input:GetString()
    if content == "" then
        return
    end
    
    -- 通过replica发送消息
    if self.owner and self.owner.replica and self.owner.replica.mgl_communication_data then
        self.owner.replica.mgl_communication_data:RPCSendMessage(self.current_friend.id, content)
    end
    
    -- 清空输入框
    self.message_input:SetString("")
    
    -- 刷新聊天记录
    self:RefreshChatRecords()
end

-- 显示添加好友UI
function MglCommunicationPanel:ShowAddFriendUI()
    -- 获取服务器所有玩家列表
    local players = {}
    
    -- 遍历所有玩家
    for _, player in pairs(AllPlayers) do
        if player and player.userid and player.name then
            table.insert(players, {id = player.userid, name = player.name})
        end
    end
    
    -- 创建添加好友界面
    self.add_friend_ui = self.root:AddChild(Widget("add_friend_ui"))
    
    -- 背景
    local bg = self.add_friend_ui:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    bg:SetSize(600, 400)
    bg:SetPosition(0, 0)
    bg:SetTint(0.1, 0.1, 0.1, 0.95)
    
    -- 标题
    local title = self.add_friend_ui:AddChild(Text(BODYTEXTFONT, 24))
    title:SetString("添加好友")
    title:SetColour(1, 1, 1, 1)
    title:SetPosition(0, 150)
    
    -- 玩家列表滚动
    local widget_width = 520
    local widget_height = 40
    local num_visible_rows = 7
    
    local player_scroll_list = self.add_friend_ui:AddChild(TEMPLATES.ScrollingGrid(
        players,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(_, index)
                local root = Widget("player_item")
                
                -- 玩家项背景
                root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.bg:SetSize(500, 40)
                root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                
                -- 玩家名称
                root.name = root:AddChild(Text(NEWFONT, 20, ""))
                root.name:SetColour(1, 1, 1, 1)
                root.name:SetPosition(-20, 0, 0)
                root.name:SetHAlign(ANCHOR_LEFT)
                root.name:SetRegionSize(400, 40)
                
                -- 添加好友按钮
                root.add_button = root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.add_button:SetScale(0.5, 0.5)
                root.add_button:SetPosition(200, 0)
                root.add_button:SetTextSize(16)
                root.add_button:SetText("添加")
                root.add_button.text:SetColour(1, 1, 1, 1)
                
                return root
            end,
            apply_fn = function(_, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 设置玩家名称
                widget.name:SetString(data.name)
                
                -- 设置添加好友按钮点击事件
                local panel = self
                widget.add_button:SetOnClick(function()
                    -- 通过replica发送好友申请
                    if panel.owner and panel.owner.replica and panel.owner.replica.mgl_communication_data then
                        panel.owner.replica.mgl_communication_data:RPCSendFriendRequest(data.id, data.name)
                        -- 关闭添加好友界面
                        panel:HideAddFriendUI()
                    end
                end)
            end,
            scrollbar_offset = -10,
            scrollbar_height_offset = -60,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8
        }
    ))
    
    -- 设置玩家列表滚动位置
    player_scroll_list:SetPosition(0, 0)
    
    -- 关闭按钮
    local close_button = self.add_friend_ui:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    close_button:SetScale(0.5, 0.5)
    close_button:SetPosition(270, 170)
    close_button:SetOnClick(function()
        self:HideAddFriendUI()
    end)
end

-- 隐藏添加好友UI
function MglCommunicationPanel:HideAddFriendUI()
    if self.add_friend_ui then
        self.add_friend_ui:Kill()
        self.add_friend_ui = nil
    end
end

-- 显示好友申请UI
function MglCommunicationPanel:ShowFriendRequestUI()
    -- 简单实现，显示好友申请列表
    local friend_requests = {}
    
    -- 从replica获取好友申请
    if self.owner and self.owner.replica and self.owner.replica.mgl_communication_data then
        friend_requests = self.owner.replica.mgl_communication_data:GetFriendRequests()
    end
    
    -- 如果已经存在好友申请界面，先销毁它
    self:HideFriendRequestUI()
    
    -- 创建好友申请界面
    self.friend_request_ui = self.root:AddChild(Widget("friend_request_ui"))
    
    -- 背景
    local bg = self.friend_request_ui:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    bg:SetSize(600, 400)
    bg:SetPosition(0, 0)
    bg:SetTint(0.1, 0.1, 0.1, 0.95)
    
    -- 标题
    local title = self.friend_request_ui:AddChild(Text(BODYTEXTFONT, 24))
    title:SetString("好友申请")
    title:SetColour(1, 1, 1, 1)
    title:SetPosition(0, 150)
    
    -- 好友申请列表滚动
    local widget_width = 520
    local widget_height = 40
    local num_visible_rows = 7
    
    local request_scroll_list = self.friend_request_ui:AddChild(TEMPLATES.ScrollingGrid(
        friend_requests,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(_, index)
                local root = Widget("request_item")
                
                -- 申请项背景
                root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.bg:SetSize(500, 40)
                root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                
                -- 申请信息
                root.info = root:AddChild(Text(NEWFONT, 20, ""))
                root.info:SetColour(1, 1, 1, 1)
                root.info:SetPosition(-20, 0, 0)
                root.info:SetHAlign(ANCHOR_LEFT)
                root.info:SetRegionSize(300, 40)
                
                -- 操作按钮容器
                root.buttons = root:AddChild(Widget("buttons"))
                root.buttons:SetPosition(150, 0)
                
                return root
            end,
            apply_fn = function(_, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 清除之前的按钮
                widget.buttons:KillAllChildren()
                
                -- 设置申请信息
                local info_text = data.name .. " 请求添加你为好友"
                if data.type == "sent" then
                    info_text = "你请求添加 " .. data.name .. " 为好友"
                end
                widget.info:SetString(info_text)
                
                -- 添加操作按钮
                local panel = self
                if data.type == "received" then
                    -- 接受按钮
                    local accept_button = widget.buttons:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                    accept_button:SetScale(0.4, 0.4)
                    accept_button:SetPosition(-30, 0)
                    accept_button:SetTextSize(14)
                    accept_button:SetText("接受")
                    accept_button.text:SetColour(1, 1, 1, 1)
                    accept_button:SetOnClick(function()
                        -- 通过replica接受好友申请
                        if panel.owner and panel.owner.replica and panel.owner.replica.mgl_communication_data then
                            panel.owner.replica.mgl_communication_data:RPCAcceptFriendRequest(data.id, data.name)
                            -- 关闭好友申请界面
                            panel:HideFriendRequestUI()
                        end
                    end)
                    
                    -- 拒绝按钮
                    local reject_button = widget.buttons:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                    reject_button:SetScale(0.4, 0.4)
                    reject_button:SetPosition(30, 0)
                    reject_button:SetTextSize(14)
                    reject_button:SetText("拒绝")
                    reject_button.text:SetColour(1, 1, 1, 1)
                    reject_button:SetOnClick(function()
                        -- 通过replica拒绝好友申请
                        if panel.owner and panel.owner.replica and panel.owner.replica.mgl_communication_data then
                            panel.owner.replica.mgl_communication_data:RPCRejectFriendRequest(data.id)
                            -- 关闭好友申请界面
                            panel:HideFriendRequestUI()
                        end
                    end)
                elseif data.type == "sent" then
                    -- 取消按钮
                    local cancel_button = widget.buttons:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                    cancel_button:SetScale(0.4, 0.4)
                    cancel_button:SetPosition(0, 0)
                    cancel_button:SetTextSize(14)
                    cancel_button:SetText("取消")
                    cancel_button.text:SetColour(1, 1, 1, 1)
                    cancel_button:SetOnClick(function()
                        -- 通过replica取消好友申请
                        if panel.owner and panel.owner.replica and panel.owner.replica.mgl_communication_data then
                            panel.owner.replica.mgl_communication_data:RPCCancelFriendRequest(data.id)
                            -- 关闭好友申请界面
                            panel:HideFriendRequestUI()
                        end
                    end)
                end
            end,
            scrollbar_offset = -10,
            scrollbar_height_offset = -60,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8
        }
    ))
    
    -- 设置好友申请列表滚动位置
    request_scroll_list:SetPosition(0, 0)
    
    -- 关闭按钮
    local close_button = self.friend_request_ui:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    close_button:SetScale(0.5, 0.5)
    close_button:SetPosition(270, 170)
    close_button:SetOnClick(function()
        self:HideFriendRequestUI()
    end)
end

-- 隐藏好友申请UI
function MglCommunicationPanel:HideFriendRequestUI()
    if self.friend_request_ui then
        self.friend_request_ui:Kill()
        self.friend_request_ui = nil
    end
end

-- 监听数据变化事件
function MglCommunicationPanel:ListenForDataChanges()
    -- 先移除旧的事件监听器（如果有的话）
    if self.on_data_changed then
        -- 先从self.owner移除（如果有的话）
        if self.owner then
            self.owner:RemoveEventCallback("mgl_communication_data_changed", self.on_data_changed)
        end
    end
    
    -- 定义事件回调函数
    self.on_data_changed = function()
        -- 刷新好友列表
        self:RefreshFriendList()
        
        -- 刷新聊天记录
        self:RefreshChatRecords()
        
        -- 刷新好友申请列表UI（如果打开的话）
        if self.friend_request_ui then
            self:ShowFriendRequestUI()
        end
    end
    
    -- 首先在self.owner上注册事件监听器（因为事件是在replica所属的实体上触发的）
    if self.owner then
        self.owner:ListenForEvent("mgl_communication_data_changed", self.on_data_changed)
    end
end

-- 关闭面板
function MglCommunicationPanel:Close()
    -- 移除事件监听器
    if self.on_data_changed then
        -- 从self.owner移除（如果有的话）
        if self.owner then
            self.owner:RemoveEventCallback("mgl_communication_data_changed", self.on_data_changed)
        end
        self.on_data_changed = nil
    end
    
    -- 关闭所有弹窗
    self:HideAddFriendUI()
    self:HideFriendRequestUI()
    
    -- 使用标准的屏幕关闭方法
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数
function MglCommunicationPanel:OnShow()
    -- 注册事件监听器
    self:ListenForDataChanges()
    
    -- 刷新好友列表
    self:RefreshFriendList()
    
    -- 如果有选中的好友，刷新聊天记录
    if self.current_friend then
        self:RefreshChatRecords()
    end
end

-- 清理函数
function MglCommunicationPanel:OnHide()
    -- 移除事件监听器
    if self.on_data_changed then
        -- 从self.owner移除（如果有的话）
        if self.owner then
            self.owner:RemoveEventCallback("mgl_communication_data_changed", self.on_data_changed)
        end
        self.on_data_changed = nil
    end
    
    -- 关闭所有弹窗
    self:HideAddFriendUI()
    self:HideFriendRequestUI()
    
    -- 调用父类的OnHide
    Screen.OnHide(self)
end

return MglCommunicationPanel