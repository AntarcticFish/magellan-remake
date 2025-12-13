local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local Screen = require "widgets/screen"
local TEMPLATES = require "widgets/redux/templates"

-- 导入更新记录数据
local update_log_data = require "core_magellan_remake/data/mgl_update_log_data"

local MglUpdateLogPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_update_log_panel")
    self.owner = owner

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
    --中间剩余为主显示区
    self.main_display = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.main_display:SetSize(560, 485)
    self.main_display:SetPosition(-110, -35/2)

    -- 添加一个按钮，用来显示关闭放于右上角
    self.exit_button = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.exit_button:SetPosition(470, 320)
    self.exit_button:SetScale(0.5, 0.5)
    self.exit_button:SetOnClick(function()
        self:Close()
    end)

    --------------------------界面标题--------------------------
    -- 设置界面标题
    self.title = self.root:AddChild(Text(NEWFONT, 48, "更新记录"))
    self.title:SetColour(1, 0.9, 0.4, 1) -- 金色文字
    self.title:SetPosition(0, 260 - 35/2) -- 放在顶部状态条上

    -------------------------- 数据初始化--------------------------
    -- 初始化更新记录数据
    self.all_updates = shallowcopy(update_log_data)
    self.current_update_index = 1
    self.current_update = self.all_updates[self.current_update_index]

    --------------------------内容区域--------------------------
    -- 实现右侧选项栏更新记录列表
    self:CreateUpdateList()
    
    -- 添加返回终端按钮
    self:AddBackToTerminalButton()
    
    -- 实现左侧主显示区
    self:CreateMainDisplay()
end)

-- 创建更新记录列表
function MglUpdateLogPanel:CreateUpdateList()
    -- 清理之前的列表（如果存在）
    if self.update_container then
        self.update_container:Kill()
    end
    
    -- 创建更新记录列表容器
    self.update_container = self.right_bar:AddChild(Widget("update_container"))
    
    -- 设置更新记录列表参数
    local widget_width = 200
    local widget_height = 45
    local num_visible_rows = 8
    
    -- 创建滚动列表
    self.update_list = self.update_container:AddChild(TEMPLATES.ScrollingGrid(
        self.all_updates,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(context, index)
                local root = Widget("update_item")
                
                -- 更新项背景
                root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.bg:SetSize(200, 45)
                root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                
                -- 版本号
                root.version = root:AddChild(Text(NEWFONT, 22, ""))
                root.version:SetColour(1, 1, 1, 1) -- 白色
                root.version:SetPosition(-40, 10, 0)
                root.version:SetHAlign(ANCHOR_LEFT)
                root.version:SetRegionSize(120, 24)
                
                -- 日期
                root.date = root:AddChild(Text(NEWFONT, 16, ""))
                root.date:SetColour(0.8, 0.8, 0.8, 1) -- 灰色
                root.date:SetPosition(-40, -10, 0)
                root.date:SetHAlign(ANCHOR_LEFT)
                root.date:SetRegionSize(120, 18)
                
                return root
            end,
            apply_fn = function(context, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 设置版本号
                widget.version:SetString(data.version)
                
                -- 设置日期
                widget.date:SetString(data.date)
                
                -- 高亮显示当前选中的更新记录
                local panel = TheFrontEnd:GetActiveScreen()
                if panel and panel.current_update_index and index == panel.current_update_index then
                    -- 选中状态：蓝色背景，黄色文字
                    widget.bg:SetTint(0.2, 0.3, 0.5, 0.8) -- 深蓝色背景
                    widget.version:SetColour(1, 0.9, 0.4, 1) -- 黄色文字
                    widget.date:SetColour(1, 1, 1, 1) -- 白色日期
                else
                    -- 未选中状态：默认灰色背景和文字
                    widget.bg:SetTint(0.2, 0.2, 0.2, 0.5) -- 灰色背景
                    widget.version:SetColour(1, 1, 1, 1) -- 白色文字
                    widget.date:SetColour(0.8, 0.8, 0.8, 1) -- 灰色日期
                end
                
                -- 添加点击事件
                widget.OnMouseButton = function(self, button, down, x, y)
                    if button == MOUSEBUTTON_LEFT and not down then
                        -- 选中当前更新记录
                        local panel = TheFrontEnd:GetActiveScreen()
                        if panel then
                            panel.current_update_index = index
                            panel.current_update = panel.all_updates[index]
                            -- 更新主显示区
                            if panel.UpdateMainDisplay then
                                panel:UpdateMainDisplay()
                            end
                            -- 更新选中状态
                            if panel.update_list then
                                panel.update_list:RefreshView()
                            end
                        end
                    end
                end
            end,
            scrollbar_offset = 7,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = widget_height * num_visible_rows * 0.9  -- 调整滚动栏高度
        }
    ))
    
    -- 设置容器位置
    self.update_container:SetPosition(0, 20)
end

-- 添加返回终端按钮
function MglUpdateLogPanel:AddBackToTerminalButton()
    self.back_button = self.right_bar:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(1.4, 0.7) 
    self.back_button:SetPosition(0, -200)
    self.back_button:SetTextSize(20)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)
end

-- 创建左侧主显示区
function MglUpdateLogPanel:CreateMainDisplay()
    -- 主显示区容器
    self.main_display_container = self.main_display:AddChild(Widget("main_display_container"))
    self.main_display_container:SetPosition(0, 0)
    
    -- 当前版本信息
    self.version_info = self.main_display_container:AddChild(Widget("version_info"))
    
    -- 版本号
    self.version_title = self.version_info:AddChild(Text(NEWFONT, 32, ""))
    self.version_title:SetColour(1, 0.9, 0.4, 1) -- 金色
    self.version_title:SetPosition(0, 180)
    self.version_title:SetHAlign(ANCHOR_MIDDLE)
    
    -- 日期
    self.version_date = self.version_info:AddChild(Text(NEWFONT, 20, ""))
    self.version_date:SetColour(0.8, 0.8, 0.8, 1) -- 灰色
    self.version_date:SetPosition(0, 150)
    self.version_date:SetHAlign(ANCHOR_MIDDLE)
    
    -- 更新内容容器
    self.content_container = self.main_display_container:AddChild(Widget("content_container"))
    self.content_container:SetPosition(0, -10)
    
    -- 更新内容标题
    self.content_title = self.content_container:AddChild(Text(NEWFONT, 24, "更新内容:"))
    self.content_title:SetColour(1, 1, 1, 1) -- 白色
    self.content_title:SetPosition(0, 100)
    self.content_title:SetHAlign(ANCHOR_MIDDLE)
    
    -- 内容滚动区域
    self.content_scroll = self.content_container:AddChild(Widget("content_scroll"))
    self.content_scroll:SetPosition(0, -60) 
    
    
    self:CreateContentScrollList()
    
    -- 初始更新显示
    self:UpdateMainDisplay()
end

-- 创建内容滚动列表
function MglUpdateLogPanel:CreateContentScrollList()
    -- 清理之前的滚动列表（如果存在）
    if self.content_scroll_list then
        self.content_scroll_list:Kill()
    end
    
    -- 设置内容滚动列表参数
    local widget_width = 520
    local widget_height = 30  -- 减小行高
    local num_visible_rows = 8  -- 减少可见行数
    
    -- 创建内容项的数据结构
    self.content_data = {}
    
    -- 创建滚动列表
    self.content_scroll_list = self.content_scroll:AddChild(TEMPLATES.ScrollingGrid(
        self.content_data,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(context, index)
                local root = Widget("content_item")
                
                -- 内容文本
                root.text = root:AddChild(Text(NEWFONT, 24, ""))
                root.text:SetColour(1, 1, 1, 1) -- 白色
                root.text:SetPosition(0, 0, 0)
                root.text:SetHAlign(ANCHOR_LEFT)
                root.text:SetVAlign(ANCHOR_TOP)
                root.text:SetRegionSize(widget_width - 50, widget_height)
                root.text:EnableWordWrap(true)
                
                return root
            end,
            apply_fn = function(context, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 设置文本内容
                widget.text:SetString(data)
            end,
            scrollbar_offset = 3,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = widget_height * num_visible_rows * 0.8
        }
    ))
    
    -- 确保滚动列表正确布局
    self.content_scroll_list:SetPosition(0, 0)
end

-- 更新主显示区
function MglUpdateLogPanel:UpdateMainDisplay()
    -- 确保当前更新记录和UI元素都存在
    if not self.current_update then return end
    
    -- 更新版本号
    self.version_title:SetString("版本 " .. self.current_update.version)
    
    -- 更新日期
    self.version_date:SetString(self.current_update.date)
    
    -- 获取content内容
    local content = self.current_update.content or ""
    
    -- 重置内容数据数组
    self.content_data = {}
    
    -- 将内容添加到数据数组中
    if content and content ~= "" then
        --对一行含有换行符的字符进行处理，将每行内容作为一个条目添加
        for line in content:gmatch("[^\n]+") do
            table.insert(self.content_data, line)
        end
    end
    
    -- 更新内容滚动列表
    if self.content_scroll_list then
        -- 设置新的数据
        self.content_scroll_list:SetItemsData(self.content_data)
        -- 刷新视图以确保内容正确显示
        self.content_scroll_list:RefreshView()
    end
end

-- 关闭面板
function MglUpdateLogPanel:Close()
    -- 关闭当前屏幕
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数
function MglUpdateLogPanel:OnShow()
    -- 调用父类的OnShow
    Screen.OnShow(self)
end

-- 清理函数
function MglUpdateLogPanel:OnHide()
    -- 调用父类的OnHide
    Screen.OnHide(self)
end

return MglUpdateLogPanel