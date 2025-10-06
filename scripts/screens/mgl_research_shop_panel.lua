local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local Screen = require "widgets/screen" -- 引入Screen类
local TEMPLATES = require "widgets/redux/templates"

-- 导入商品数据
local shop_data = require "core_magellan_remake/data/mgl_research_shop_data"

local MglResearchShopPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_research_shop_panel")
    self.owner = owner

    ---------------------------基本布局--------------------------
    --画一个背景
    self.root = self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
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
    self.title = self.root:AddChild(Text(NEWFONT, 48, "科研购置"))
    self.title:SetColour(1, 0.9, 0.4, 1) -- 金色文字
    self.title:SetPosition(0, 260 - 35/2) -- 放在顶部状态条上

    -- 显示当前科研点数
    self.science_points_label = self.top_bar:AddChild(Text(NEWFONT, 30, "科研点数: 0"))
    self.science_points_label:SetColour(0, 1, 0, 1) -- 绿色文字
    self.science_points_label:SetPosition(-300, 0)
    self:UpdateSciencePoints()

    --------------------------内容区域--------------------------
    -- 创建商品分类标签栏
    self:CreateCategoryTabs()
    
    -- 初始化商品数据
    self.all_items = shallowcopy(shop_data)
    self.current_category = "all"
    self.filtered_items = self.all_items
    
    -- 创建购买项目列表容器
    self:CreateShopItemList()
    
    -- 创建商品详情区域
    self:CreateItemDetailUI()
    
    -- 添加返回终端按钮
    self:AddBackToTerminalButton()
    
    -- 添加科研点数变化监听
    self:AddSciencePointsListener()
end)

-- 更新科研点数显示
function MglResearchShopPanel:UpdateSciencePoints()
    -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system
    
    if task_system then
        local points = task_system:GetSciencePoints() or 0
        self.science_points_label:SetString("科研点数: " .. tostring(points))
    end
end

-- 创建商品分类标签栏
function MglResearchShopPanel:CreateCategoryTabs()
    self.category_tabs = self.main_display:AddChild(Widget("category_tabs"))
    self.category_tabs:SetPosition(0, 200, 0) -- 下移分类标签栏，确保在主显示区内
    
    -- 分类数据
    local categories = {
        { id = "all", name = "全部" },
        { id = "modules", name = "模块" },
        { id = "consumables", name = "消耗品" },
        { id = "tools", name = "工具" },
        { id = "books", name = "书籍" },
        { id = "drones", name = "无人机" },
        { id = "special", name = "特殊" }
    }
    
    -- 创建分类按钮，不设置间隔，让它们连在一起
    self.category_buttons = {}
    local start_x = -210
    local button_width = 70
    
    for i, category in ipairs(categories) do
        local button = self.category_tabs:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
        button:SetScale(0.8, 0.6) -- 增大按钮尺寸
        button:SetPosition(start_x + (i-1) * button_width, 0) -- 无间隔排列
        button:SetTextSize(24) -- 增大字体大小
        button:SetText(category.name)
        button.text:SetColour(1, 1, 1, 1)
        button.category_id = category.id
        
        button:SetOnClick(function()
            self:FilterItemsByCategory(category.id)
        end)
        
        table.insert(self.category_buttons, button)
    end
    
    -- 默认选中"全部"分类
    self:UpdateCategoryButtonStates("all")
end

-- 根据分类筛选商品
function MglResearchShopPanel:FilterItemsByCategory(category_id)
    if category_id == "all" then
        self.filtered_items = self.all_items
    else
        self.filtered_items = {}
        for _, item in ipairs(self.all_items) do
            if item.category == category_id then
                table.insert(self.filtered_items, item)
            end
        end
    end
    
    self.current_category = category_id
    
    -- 更新分类按钮状态
    self:UpdateCategoryButtonStates(category_id)
    
    -- 更新商品列表
    if self.shop_item_list then
        self.shop_item_list:SetItemsData(self.filtered_items)
        -- 强制刷新UI显示
        self.shop_item_list:RefreshView()
    end
    
    -- 清除当前选中的商品
    self.current_item = nil
    self:UpdateItemDetail(nil)
end

-- 更新分类按钮状态
function MglResearchShopPanel:UpdateCategoryButtonStates(selected_id)
    for _, button in ipairs(self.category_buttons) do
        if button.category_id == selected_id then
            -- 选中状态
            button.text:SetColour(0, 1, 0, 1) -- 绿色文本
        else
            -- 未选中状态
            button.text:SetColour(1, 1, 1, 1) -- 白色文本
        end
    end
end

-- 创建商品列表项构造函数
local function ShopItemCtor(context, index)
    local root = Widget("shop_item")
    
    -- 商品项背景
    root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    root.bg:SetSize(180, 40)
    root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
    
    -- 商品名称
    root.name = root:AddChild(Text(NEWFONT, 22, "")) -- 增大字体大小
    root.name:SetColour(1, 1, 1, 1) -- 白色
    root.name:SetPosition(-20, 0, 0)
    root.name:SetHAlign(ANCHOR_LEFT)
    root.name:SetRegionSize(100, 40)
    
    -- 商品价格
    root.price = root:AddChild(Text(NEWFONT, 22, "")) -- 增大字体大小
    root.price:SetColour(0, 1, 0, 1) -- 绿色
    root.price:SetPosition(60, 0, 0)
    root.price:SetHAlign(ANCHOR_RIGHT)
    root.price:SetRegionSize(60, 40)
    
    return root
end

-- 应用数据到商品列表项
local function ApplyDataToShopItem(context, widget, data, index)
    if not data then
        widget:Hide()
        return
    end
    
    widget:Show()
    widget.data = data
    
    -- 设置商品名称
    widget.name:SetString(data.name)
    
    -- 设置商品价格
    widget.price:SetString(data.price .. "点")
    
    -- 添加点击事件
    widget.OnMouseButton = function(self, button, down, x, y)
        if button == MOUSEBUTTON_LEFT and not down then
            -- 更新主显示区的商品详情
            local panel = TheFrontEnd:GetActiveScreen()
            if panel and panel.UpdateItemDetail then
                panel:UpdateItemDetail(data)
            end
        end
    end
end

-- 创建商品列表
function MglResearchShopPanel:CreateShopItemList()
    -- 清理之前的列表（如果存在）
    if self.shop_items_container then
        self.shop_items_container:Kill()
    end
    
    -- 创建商品列表容器
    self.shop_items_container = self.right_bar:AddChild(Widget("shop_items_container"))
    
    -- 设置商品列表参数
    local widget_width = 180
    local widget_height = 40
    local num_visible_rows = 9
    
    -- 创建滚动列表
    self.shop_item_list = self.shop_items_container:AddChild(TEMPLATES.ScrollingGrid(
        self.filtered_items,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = ShopItemCtor,
            apply_fn = ApplyDataToShopItem,
            scrollbar_offset = 7,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = widget_height * num_visible_rows * 0.8
        }
    ))
    
    -- 设置容器位置
    self.shop_items_container:SetPosition(0, 30)
end

-- 创建商品详情UI
function MglResearchShopPanel:CreateItemDetailUI()
    -- 商品详情容器
    self.item_detail = self.main_display:AddChild(Widget("item_detail"))
    
    -- 商品标题
    self.detail_title = self.item_detail:AddChild(Text(NEWFONT, 40, "选择一个商品")) -- 增大字体大小
    self.detail_title:SetColour(1, 0.9, 0.4, 1) -- 金色
    self.detail_title:SetPosition(0, 160, 0) -- 上移标题，确保不超出边界
    self.detail_title:SetRegionSize(500, 50)
    self.detail_title:SetHAlign(ANCHOR_MIDDLE)

    -- 商品描述背景
    self.detail_bg = self.item_detail:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.detail_bg:SetSize(520, 280) -- 调整背景大小
    self.detail_bg:SetTint(0.1, 0.1, 0.1, 0.9) -- 深色背景
    
    -- 商品图标
    self.item_icon = self.item_detail:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.item_icon:SetSize(90, 90) -- 略微减小图标尺寸
    self.item_icon:SetPosition(0, 80, 0) -- 调整图标位置
    self.item_icon:Hide() -- 默认隐藏
    

    
    -- 商品描述
    self.item_description = self.item_detail:AddChild(Text(NEWFONT, 24, "选择右侧商品查看详细信息")) -- 略微减小字体大小
    self.item_description:SetColour(0.8, 0.8, 0.8, 1)
    self.item_description:SetPosition(0, -50, 0)
    self.item_description:SetRegionSize(480, 140) -- 调整描述区域大小
    self.item_description:SetHAlign(ANCHOR_LEFT)
    self.item_description:SetVAlign(ANCHOR_TOP)
    self.item_description:EnableWordWrap(true)
    
    -- 价格显示
    self.price_label = self.item_detail:AddChild(Text(NEWFONT, 30, "价格: -- 科研点数")) -- 略微减小字体大小
    self.price_label:SetColour(0, 1, 0, 1) -- 绿色
    self.price_label:SetPosition(0, -80, 0) -- 上移价格标签
    
    -- 购买按钮
    self.buy_button = self.item_detail:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.buy_button:SetScale(1.6, 0.8) -- 略微减小按钮尺寸
    self.buy_button:SetPosition(0, -120, 0) -- 上移购买按钮
    self.buy_button:SetTextSize(30) -- 略微减小字体大小
    self.buy_button:SetText("购买")
    self.buy_button.text:SetColour(1, 1, 1, 1)
    self.buy_button:SetOnClick(function()
        self:OnBuyItem()
    end)
    
    -- 默认禁用购买按钮
    self.buy_button:Disable()
end

-- 更新商品详情显示
function MglResearchShopPanel:UpdateItemDetail(item_data)
    if not item_data then
        -- 无商品选中时的默认显示
        self.detail_title:SetString("选择一个商品")
        self.item_icon:Hide()
        self.item_description:SetString("选择右侧商品查看详细信息")
        self.price_label:SetString("价格: -- 科研点数")
        self.buy_button:Disable()
        self.current_item = nil
        return
    end
    

    
    -- 保存当前选中的商品
    self.current_item = item_data
    
    -- 更新商品详情
    self.detail_title:SetString(item_data.name)
    
    -- 设置商品图标
    if item_data.icon_atlas and item_data.icon then
        self.item_icon:SetTexture(item_data.icon_atlas, item_data.icon)
    else
        self.item_icon:SetTexture("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex")
    end
    self.item_icon:Show()
    
    -- 设置商品描述
    self.item_description:SetString(item_data.description)
    
    -- 设置商品价格
    self.price_label:SetString("价格: " .. tostring(item_data.price) .. " 科研点数")
    
    -- 检查玩家是否有足够的科研点数购买
    self:CheckCanAffordItem()
end

-- 检查玩家是否有足够的科研点数购买当前商品
function MglResearchShopPanel:CheckCanAffordItem()
    if not self.current_item then
        self.buy_button:Disable()
        return
    end
    
    -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system
    
    if task_system then
        local points = task_system:GetSciencePoints() or 0
        if points >= self.current_item.price then
            self.buy_button:Enable()
            self.buy_button.text:SetColour(1, 1, 1, 1) -- 白色
        else
            self.buy_button:Disable()
            self.buy_button.text:SetColour(0.5, 0.5, 0.5, 0.5) -- 灰色
        end
    else
        -- 如果无法访问任务系统，默认禁用按钮
        self.buy_button:Disable()
    end
end

-- 添加返回终端按钮
function MglResearchShopPanel:AddBackToTerminalButton()
    self.back_button = self.right_bar:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(1.4, 0.7) 
    self.back_button:SetPosition(0, -190)
    self.back_button:SetTextSize(20)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)
end

-- 添加科研点数变化监听器
function MglResearchShopPanel:AddSciencePointsListener()
    if ThePlayer then
        self.science_points_listener = ThePlayer:ListenForEvent("science_points_changed", function()
            self:UpdateSciencePoints()
            self:CheckCanAffordItem()
        end)
    end
end

-- 移除科研点数变化监听器
function MglResearchShopPanel:RemoveSciencePointsListener()
    if ThePlayer and self.science_points_listener then
        ThePlayer:RemoveEventCallback("science_points_changed", self.science_points_listener)
        self.science_points_listener = nil
    end
end

-- 购买商品的处理函数
function MglResearchShopPanel:OnBuyItem()
    if not self.current_item then
        return
    end
    
    -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system
    
    if task_system then
        local points = task_system:GetSciencePoints() or 0
        
        -- 再次检查是否有足够的科研点数（防止并发问题）
        if points >= self.current_item.price then
            -- 调用RPC购买商品
            task_system:RPCBuyShopItem(self.current_item.id)
            
            -- 显示购买成功提示
            self:ShowBuySuccessMessage()
        else
            -- 显示余额不足提示
            self:ShowInsufficientFundsMessage()
        end
    end
end

-- 显示购买成功提示
function MglResearchShopPanel:ShowBuySuccessMessage()
    -- 创建提示消息
    if self.success_message then
        self.success_message:Kill()
    end
    
    self.success_message = self.root:AddChild(Text(NEWFONT, 40, "购买成功！")) -- 增大字体大小
    self.success_message:SetColour(0, 1, 0, 1) -- 绿色
    self.success_message:SetPosition(0, 0)
    
    -- 2秒后移除提示
    self.inst:DoTaskInTime(2, function()
        if self.success_message then
            self.success_message:Kill()
            self.success_message = nil
        end
    end)
end

-- 显示余额不足提示
function MglResearchShopPanel:ShowInsufficientFundsMessage()
    -- 创建提示消息
    if self.insufficient_message then
        self.insufficient_message:Kill()
    end
    
    self.insufficient_message = self.root:AddChild(Text(NEWFONT, 40, "科研点数不足！")) -- 增大字体大小
    self.insufficient_message:SetColour(1, 0, 0, 1) -- 红色
    self.insufficient_message:SetPosition(0, 0)
    
    -- 2秒后移除提示
    self.inst:DoTaskInTime(2, function()
        if self.insufficient_message then
            self.insufficient_message:Kill()
            self.insufficient_message = nil
        end
    end)
end

-- 关闭面板
function MglResearchShopPanel:Close()
    -- 移除事件监听器
    self:RemoveSciencePointsListener()
    
    -- 移除提示消息
    if self.success_message then
        self.success_message:Kill()
        self.success_message = nil
    end
    
    if self.insufficient_message then
        self.insufficient_message:Kill()
        self.insufficient_message = nil
    end
    
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数
function MglResearchShopPanel:OnShow()
    -- 刷新科研点数显示
    self:UpdateSciencePoints()
    
    -- 调用父类的OnShow
    Screen.OnShow(self)
end

-- 清理函数
function MglResearchShopPanel:OnHide()
    -- 移除事件监听器
    self:RemoveSciencePointsListener()
    
    -- 调用父类的OnHide
    Screen.OnHide(self)
end

return MglResearchShopPanel