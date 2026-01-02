local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local Screen = require "widgets/screen"
local TextEdit = require "widgets/textedit"
local json = require "json"

local MglAiAssistantPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_ai_assistant_panel")
    self.owner = owner

    ---------------------------基本布局--------------------------
    -- 根节点
    self.root = self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.root:SetMaxPropUpscale(MAX_HUD_SCALE)
    
    -- 背景
    self.bg = self.root:AddChild(Image("images/global.xml", "square.tex"))
    self.bg:SetSize(900, 600)
    self.bg:SetPosition(0, 0)
    self.bg:SetTint(0.1, 0.1, 0.1, 0.9) -- 深灰色背景，带一点透明度
    
    -- 标题
    self.title = self.root:AddChild(Text(NEWFONT, 48, "AI助手"))
    self.title:SetColour(1, 0.9, 0.4, 1) -- 金色文字
    self.title:SetPosition(0, 260)

    -- 关闭按钮
    self.exit_button = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.exit_button:SetPosition(470, 320)
    self.exit_button:SetScale(0.5, 0.5)
    self.exit_button:SetOnClick(function()
        self:Close()
    end)

    --------------------------API配置区域--------------------------
    -- API配置容器
    self.config_container = self.root:AddChild(Widget("config_container"))
    self.config_container:SetPosition(0, 180)
    
    -- API地址标题
    self.api_url_title = self.config_container:AddChild(Text(NEWFONT, 24, "API地址:"))
    self.api_url_title:SetColour(1, 1, 1, 1)
    self.api_url_title:SetPosition(-350, 30)
    
    -- API地址输入框
    self.api_url_input = self.config_container:AddChild(TextEdit(NEWFONT, 20, ""))
    self.api_url_input:SetPosition(0, 30)
    self.api_url_input:SetRegionSize(600, 40)
    self.api_url_input:SetIdleTextColour(1, 1, 1, 1)
    self.api_url_input:SetEditTextColour(1, 1, 1, 1)
    self.api_url_input:SetEditCursorColour(1, 1, 1, 1)
    
    -- API密钥标题
    self.api_key_title = self.config_container:AddChild(Text(NEWFONT, 24, "API密钥:"))
    self.api_key_title:SetColour(1, 1, 1, 1)
    self.api_key_title:SetPosition(-350, -30)
    
    -- API密钥输入框
    self.api_key_input = self.config_container:AddChild(TextEdit(NEWFONT, 20, ""))
    self.api_key_input:SetPosition(0, -30)
    self.api_key_input:SetRegionSize(600, 40)
    self.api_key_input:SetIdleTextColour(1, 1, 1, 1)
    self.api_key_input:SetEditTextColour(1, 1, 1, 1)
    self.api_key_input:SetEditCursorColour(1, 1, 1, 1)
    
    -- 保存配置按钮
    self.save_config_button = self.config_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.save_config_button:SetScale(0.8, 0.8)
    self.save_config_button:SetPosition(400, 0)
    self.save_config_button:SetText("保存配置")
    self.save_config_button.text:SetColour(1, 1, 1, 1)
    self.save_config_button:SetOnClick(function()
        self:SaveConfig()
    end)

    --------------------------聊天历史记录区域--------------------------
    -- 聊天容器
    self.chat_container = self.root:AddChild(Widget("chat_container"))
    self.chat_container:SetPosition(0, 0)
    
    -- 聊天历史记录标题
    self.chat_title = self.chat_container:AddChild(Text(NEWFONT, 24, "聊天记录:"))
    self.chat_title:SetColour(1, 1, 1, 1)
    self.chat_title:SetPosition(0, 100)
    
    -- 聊天历史记录显示
    self.chat_history = {}
    self.max_chat_messages = 10
    
    self.chat_history_text = self.chat_container:AddChild(Text(NEWFONT, 20, ""))
    self.chat_history_text:SetPosition(0, 0)
    self.chat_history_text:SetHAlign(ANCHOR_MIDDLE)
    self.chat_history_text:SetVAlign(ANCHOR_TOP)
    self.chat_history_text:SetRegionSize(800, 300)
    self.chat_history_text:EnableWordWrap(true)
    self.chat_history_text:SetColour(1, 1, 1, 1)
    
    -- 清空聊天记录按钮
    self.clear_chat_button = self.chat_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.clear_chat_button:SetScale(0.6, 0.6)
    self.clear_chat_button:SetPosition(350, 100)
    self.clear_chat_button:SetText("清空聊天")
    self.clear_chat_button.text:SetColour(1, 1, 1, 1)
    self.clear_chat_button:SetOnClick(function()
        self:ClearChatHistory()
    end)

    --------------------------聊天输入区域--------------------------
    self.chat_input_container = self.root:AddChild(Widget("chat_input_container"))
    self.chat_input_container:SetPosition(0, -180)
    
    -- 聊天输入框
    self.chat_input = self.chat_input_container:AddChild(TextEdit(NEWFONT, 20, ""))
    self.chat_input:SetPosition(-70, 0)
    self.chat_input:SetRegionSize(650, 80)
    self.chat_input:SetIdleTextColour(1, 1, 1, 1)
    self.chat_input:SetEditTextColour(1, 1, 1, 1)
    self.chat_input:SetEditCursorColour(1, 1, 1, 1)
    self.chat_input:SetAllowNewline(true)
    
    -- 发送消息按钮
    self.send_button = self.chat_input_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.send_button:SetScale(1.0, 0.8)
    self.send_button:SetPosition(370, 0)
    self.send_button:SetText("发送")
    self.send_button.text:SetColour(1, 1, 1, 1)
    self.send_button:SetOnClick(function()
        self:SendMessage()
    end)

    --------------------------返回终端按钮--------------------------
    self.back_button = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(0.8, 0.8)
    self.back_button:SetPosition(-350, 260)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)

    -- 加载配置
    self:LoadConfig()
end)

-- 保存配置
function MglAiAssistantPanel:SaveConfig()
    local config = {
        api_url = self.api_url_input:GetLineEditString(),
        api_key = self.api_key_input:GetLineEditString(),
        model = "gpt-3.5-turbo"
    }
    
    local json_str = json.encode(config)
    TheSim:SetPersistentString("mgl_ai_config", json_str, false)
    
    self:AddChatMessage("assistant", "配置已保存")
end

-- 加载配置
function MglAiAssistantPanel:LoadConfig()
    TheSim:GetPersistentString("mgl_ai_config", function(load_success, str)
        if load_success and str and str ~= "" then
            local success, data = pcall(json.decode, str)
            if success and data then
                if data.api_url then
                    self.api_url_input:SetString(data.api_url)
                end
                if data.api_key then
                    self.api_key_input:SetString(data.api_key)
                end
            end
        end
    end)
end

-- 清空聊天历史
function MglAiAssistantPanel:ClearChatHistory()
    self.chat_history = {}
    self:UpdateChatDisplay()
end

-- 添加聊天消息
function MglAiAssistantPanel:AddChatMessage(role, content)
    table.insert(self.chat_history, { role = role, content = content })
    
    -- 限制聊天记录数量
    if #self.chat_history > self.max_chat_messages then
        table.remove(self.chat_history, 1)
    end
    
    self:UpdateChatDisplay()
end

-- 更新聊天显示
function MglAiAssistantPanel:UpdateChatDisplay()
    local display_text = ""
    
    for i, message in ipairs(self.chat_history) do
        if message.role == "user" then
            display_text = display_text .. "\n\n玩家: " .. message.content
        else
            display_text = display_text .. "\n\nAI: " .. message.content
        end
    end
    
    self.chat_history_text:SetString(display_text)
end

-- 发送消息
function MglAiAssistantPanel:SendMessage()
    local message = self.chat_input:GetLineEditString()
    
    if not message or message == "" then
        return
    end
    
    -- 清空输入框
    self.chat_input:SetString("")
    
    -- 添加玩家消息到聊天历史
    self:AddChatMessage("user", message)
    
    -- 构建请求数据
    local api_url = self.api_url_input:GetLineEditString()
    local api_key = self.api_key_input:GetLineEditString()
    
    if not api_url or api_url == "" then
        self:AddChatMessage("assistant", "API地址未配置")
        return
    end
    
    if not api_key or api_key == "" then
        self:AddChatMessage("assistant", "API密钥未配置")
        return
    end
    
    -- 构建请求消息列表
    local messages = {}
    
    -- 添加系统消息
    table.insert(messages, { role = "system", content = "你是一个AI助手，帮助用户解决问题。" })
    
    -- 添加聊天历史
    for _, msg in ipairs(self.chat_history) do
        table.insert(messages, msg)
    end
    
    -- 构建请求数据
    local request_data = {
        model = "gpt-3.5-turbo",
        messages = messages,
        max_tokens = 200
    }
    
    -- 将配置信息加入请求数据中，以便Python脚本使用
    request_data.api_url = api_url
    request_data.api_key = api_key
    
    local json_str = json.encode(request_data)
    
    -- 显示正在请求状态
    self:AddChatMessage("assistant", "正在处理请求...")
    
    -- 清除旧的响应
    TheSim:SetPersistentString("mgl_ai_response", "", false)
    
    -- 写入请求文件
    TheSim:SetPersistentString("mgl_ai_request", json_str, false)
    
    -- 开始轮询响应
    if self.poll_task then self.poll_task:Cancel() end
    
    local timeout = 30 -- 30秒超时
    local elapsed = 0
    
    self.poll_task = self.inst:DoPeriodicTask(1, function(inst)
        elapsed = elapsed + 1
        if elapsed > timeout then
            if self.poll_task then self.poll_task:Cancel() self.poll_task = nil end
            self:AddChatMessage("assistant", "请求超时。请检查 ai_bridge.py 是否正在运行并能访问存档目录。")
            return
        end
        
        TheSim:GetPersistentString("mgl_ai_response", function(load_success, str)
            if load_success and str and str ~= "" then
                -- 收到响应
                if self.poll_task then self.poll_task:Cancel() self.poll_task = nil end
                
                -- 尝试解析
                local success, data = pcall(json.decode, str)
                
                -- 更新聊天记录，移除正在请求状态
                if #self.chat_history > 0 and self.chat_history[#self.chat_history].content == "正在处理请求..." then
                    table.remove(self.chat_history)
                end
                
                if success and data then
                    if data.error then
                        self:AddChatMessage("assistant", "API请求失败: " .. tostring(data.code) .. "\n" .. tostring(data.message))
                    elseif data.choices and data.choices[1] and data.choices[1].message then
                        self:AddChatMessage("assistant", data.choices[1].message.content)
                        
                        -- 清除响应防止重复读取
                        TheSim:SetPersistentString("mgl_ai_response", "", false)
                    else
                        self:AddChatMessage("assistant", "收到响应但格式未知:\n" .. str)
                    end
                else
                    self:AddChatMessage("assistant", "响应解析失败:\n" .. str)
                end
            end
        end)
    end)
end

-- 关闭面板
function MglAiAssistantPanel:Close()
    if self.poll_task then
        self.poll_task:Cancel()
        self.poll_task = nil
    end
    TheFrontEnd:PopScreen(self)
end

return MglAiAssistantPanel