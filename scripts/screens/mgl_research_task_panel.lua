local Screen = require "widgets/screen" -- 引入"widgets/screen"模块
local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"
local TEMPLATES = require "widgets/redux/templates"

local MglResearchTaskPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_research_task_panel")
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
    
    --------------------------内容--------------------------
    -- 先创建任务详情UI，确保在点击任务前已经初始化
    self:CreateTaskDetailUI()
    -- 然后创建任务列表
    self:CreateTaskList()
end)

-- 创建任务项组件
local function TaskItemCtor(context, index)
    local root = Widget("task_item")
    
    -- 任务项背景
    root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    root.bg:SetSize(200, 40)
    root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
    
    -- 任务标题
    root.title = root:AddChild(Text(NEWFONT, 20, ""))
    root.title:SetColour(1, 1, 1, 1) -- 白色
    root.title:SetPosition(-20, 0, 0)
    root.title:SetHAlign(ANCHOR_LEFT)
    root.title:SetRegionSize(140, 40)
    
    -- 任务状态图标 - 设置与任务项相同的高度
    root.status_icon = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    root.status_icon:SetPosition(60, 0, 0)
    
    return root
end

-- 应用数据到任务项组件
local function ApplyDataToTaskItem(context, widget, data, index)
    if not data then
        widget:Hide()
        return
    end
    
    widget:Show()
    widget.data = data
    
    -- 设置任务标题
    widget.title:SetString(data.title)
    
    -- 设置任务状态图标
    if data.completed then
        widget.status_icon:SetTexture("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex")
        widget.status_icon:SetSize(40, 40)
        widget.status_icon:SetTint(0, 1, 0, 1) -- 绿色
    else
        widget.status_icon:SetTexture("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex")
        widget.status_icon:SetSize(40, 40)
        widget.status_icon:SetTint(0.5, 0.5, 0.5, 0.5) -- 灰色
    end
    
    -- 添加点击事件
    widget.OnMouseButton = function(self, button, down, x, y)
        if button == MOUSEBUTTON_LEFT and not down then
            -- 更新主显示区的任务详情
            -- 通过全局引用获取面板实例
            local panel = TheFrontEnd:GetActiveScreen()
            if panel and panel.UpdateTaskDetail then
                panel:UpdateTaskDetail(data)
            end
            print("Task clicked:", data.title)
        end
    end
end

-- 创建任务详情显示UI
function MglResearchTaskPanel:CreateTaskDetailUI()
    -- 任务详情容器
    self.task_detail = self.main_display:AddChild(Widget("task_detail"))
    
    -- 任务标题
    self.detail_title = self.task_detail:AddChild(Text(NEWFONT, 32, "选择一个任务"))
    self.detail_title:SetColour(1, 0.9, 0.4, 1) -- 更明亮的金色
    self.detail_title:SetPosition(0, 200, 0)
    self.detail_title:SetRegionSize(500, 50)
    self.detail_title:SetHAlign(ANCHOR_MIDDLE)
    
    -- 任务描述背景 - 增加对比度
    self.detail_bg = self.task_detail:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.detail_bg:SetSize(520, 300)
    self.detail_bg:SetTint(0.1, 0.1, 0.1, 0.9) -- 更暗的背景，增加对比度
    
    -- 任务要求
    self.requirement_title = self.task_detail:AddChild(Text(NEWFONT, 24, "任务要求:"))
    self.requirement_title:SetColour(1, 1, 1, 1) -- 白色
    self.requirement_title:SetPosition(-200, 140, 0)  -- 上移10单位
    self.requirement_title:SetHAlign(ANCHOR_LEFT)
    
    self.requirement_text = self.task_detail:AddChild(Text(NEWFONT, 22, "选择右侧任务查看详细要求"))
    self.requirement_text:SetColour(0.8, 0.8, 0.8, 1) -- 更明亮的灰色，提高可读性
    self.requirement_text:SetPosition(0, 70, 0)  -- 下移20单位，显著增加与标题的间距
    self.requirement_text:SetRegionSize(480, 100)
    self.requirement_text:SetHAlign(ANCHOR_LEFT)
    self.requirement_text:SetVAlign(ANCHOR_TOP)
    self.requirement_text:EnableWordWrap(true)
    
    -- 任务奖励
    self.reward_title = self.task_detail:AddChild(Text(NEWFONT, 24, "任务奖励:"))
    self.reward_title:SetColour(1, 1, 1, 1) -- 白色
    self.reward_title:SetPosition(-200, 0, 0)
    self.reward_title:SetHAlign(ANCHOR_LEFT)
    
    self.reward_text = self.task_detail:AddChild(Text(NEWFONT, 22, "选择右侧任务查看奖励"))
    self.reward_text:SetColour(0.8, 0.8, 0.8, 1) -- 更明亮的灰色，提高可读性
    self.reward_text:SetPosition(0, -50, 0)
    self.reward_text:SetRegionSize(480, 80)
    self.reward_text:SetHAlign(ANCHOR_LEFT)
    self.reward_text:SetVAlign(ANCHOR_TOP)
    self.reward_text:EnableWordWrap(true)
    
    -- 提交任务按钮 - 调整为更醒目的大小和位置
    self.submit_button = self.task_detail:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.submit_button:SetScale(1.5, 0.75)  -- 增大按钮尺寸，使其更醒目
    self.submit_button:SetPosition(0, -120, 0)
    self.submit_button:SetTextSize(26)
    self.submit_button:SetText("提交任务")
    self.submit_button.text:SetColour(1, 0.84, 0, 1) -- 金色
    self.submit_button:SetOnClick(function()
        -- 提交任务功能，暂时只打印信息
        print("提交任务按钮被点击")
    end)
    
    -- 默认禁用提交按钮
    self.submit_button:Disable()
end

-- 更新任务详情显示
function MglResearchTaskPanel:UpdateTaskDetail(task_data)
    if not task_data then
        -- 无任务选中时的默认显示
        self.detail_title:SetString("选择一个任务")
        self.requirement_text:SetString("选择右侧任务查看详细要求")
        self.reward_text:SetString("选择右侧任务查看奖励")
        self.submit_button:Disable()
        return
    end
    
    -- 更新任务详情
    self.detail_title:SetString(task_data.title)
    
    -- 设置任务要求
    if task_data.requirement then
        self.requirement_text:SetString(task_data.requirement)
    else
        self.requirement_text:SetString("暂无详细要求")
    end
    
    -- 设置任务奖励
    if task_data.reward then
        self.reward_text:SetString(task_data.reward)
    else
        self.reward_text:SetString("暂无奖励信息")
    end
    
    -- 根据任务完成状态启用或禁用提交按钮
    if task_data.completed then
        self.submit_button:Enable()
        self.submit_button.text:SetColour(0, 1, 0, 1) -- 绿色
    else
        self.submit_button:Disable()
        self.submit_button.text:SetColour(1, 0.84, 0, 1) -- 金色
    end
end

-- 创建任务滚动列表
function MglResearchTaskPanel:CreateTaskList()
    -- 测试任务数据，增加数量以确保可以滚动，并添加详细信息
    self.test_tasks = {
        {title = "收集5个木材", completed = false, requirement = "在森林中收集5个木材", reward = "50点科技点数"},
        {title = "制作科学机器", completed = true, requirement = "使用1个黄金、4个木材和4个石头制作科学机器", reward = "解锁基础科技配方"},
        {title = "研究新科技", completed = false, requirement = "使用科学机器研究至少3个新配方", reward = "100点科技点数"},
        {title = "击败蜘蛛女王", completed = false, requirement = "找到并击败蜘蛛女王", reward = "获得女王的冠冕"},
        {title = "探索洞穴", completed = true, requirement = "找到并进入地下洞穴", reward = "解锁洞穴探索相关科技"},
        {title = "制作二本科技", completed = false, requirement = "使用4个木板、2个石砖和4个黄金制作炼金引擎", reward = "解锁高级科技配方"},
        {title = "收集10个石头", completed = false, requirement = "在地面收集10个石头", reward = "30点科技点数"},
        {title = "种植浆果丛", completed = true, requirement = "种植至少3个浆果丛", reward = "稳定的食物来源"},
        {title = "制作避雷针", completed = false, requirement = "使用3个黄金制作避雷针", reward = "保护基地免受雷击"},
        {title = "制作背包", completed = true, requirement = "使用4个蜘蛛网和4个树枝制作背包", reward = "增加12格物品栏空间"},
        {title = "收集20个草", completed = false, requirement = "在草原收集20个草", reward = "20点科技点数"},
        {title = "制作木甲", completed = false, requirement = "使用8个木材制作木甲", reward = "提供基础物理防御"},
        {title = "击败巨鹿", completed = false, requirement = "在冬天找到并击败巨鹿", reward = "获得巨鹿的眼球"},
        {title = "制作火坑", completed = true, requirement = "使用3个石头、2个木材和3个草制作火坑", reward = "提供温暖和光源"},
        {title = "收集3个黄金", completed = false, requirement = "通过挖矿收集3个黄金", reward = "70点科技点数"},
    }
    
    -- 创建滚动列表 - 移到右侧选项栏
    local widget_width = 200
    local widget_height = 40
    local num_visible_rows = 10
    
    self.task_scroll_list = self.right_bar:AddChild(TEMPLATES.ScrollingGrid(
        self.test_tasks,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = TaskItemCtor,
            apply_fn = ApplyDataToTaskItem,
            scrollbar_offset = -5,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_width = 8,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8,
            scrollbar_bg_color = {0, 0, 0, 0.3},
            scrollbar_color = {0.7, 0.7, 0.7, 0.8}
        }
    ))
    
    -- 设置滚动列表位置
    self.task_scroll_list:SetPosition(0, 0)
end

function MglResearchTaskPanel:Close()
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数，创建任务详情UI
function MglResearchTaskPanel:OnShow()
    self:CreateTaskDetailUI()
end

return MglResearchTaskPanel