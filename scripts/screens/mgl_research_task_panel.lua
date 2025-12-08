local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"
local TEMPLATES = require "widgets/redux/templates"
local Screen = require "widgets/screen" -- 引入Screen类

-- 导入任务数据
local task_data = require "core_magellan_remake/data/mgl_task_data"

local MglResearchTaskPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_research_task_panel")
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
    widget.index = index
    
    -- 设置任务标题
    widget.title:SetString(data.title)
    
    -- 高亮显示当前选中的任务
    local panel = TheFrontEnd:GetActiveScreen()
    if panel and panel.current_task and data.id == panel.current_task.id then
        -- 选中状态：蓝色背景，黄色文字
        widget.bg:SetTint(0.2, 0.3, 0.5, 0.8) -- 深蓝色背景
        widget.title:SetColour(1, 0.9, 0.4, 1) -- 黄色文字
    else
        -- 未选中状态：默认灰色背景和文字
        widget.bg:SetTint(0.2, 0.2, 0.2, 0.5) -- 灰色背景
        widget.title:SetColour(1, 1, 1, 1) -- 白色文字
    end
    
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
                -- 更新选中状态
                if panel.UpdateTaskSelection then
                    panel:UpdateTaskSelection()
                end
            end
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
    self.submit_button.text:SetColour(1, 1, 1, 1) -- 统一白色字体
    self.submit_button:SetOnClick(function()
        -- 提交任务功能：使用RPC请求服务器提交任务
        if ThePlayer and self.current_task then
            -- print("客户端发送任务提交RPC请求:", self.current_task.id)
            -- 通过replica组件调用RPC方法
            if ThePlayer.replica and ThePlayer.replica.mgl_task_system then
                ThePlayer.replica.mgl_task_system:RPCSubmitTask(self.current_task.id)
            end
        end
    end)
    
    -- 默认禁用提交按钮
    self.submit_button:Disable()
end

-- 更新任务列表选中状态
function MglResearchTaskPanel:UpdateTaskSelection()
    if self.task_scroll_list then
        -- 刷新任务列表以更新选中状态
        self.task_scroll_list:RefreshView()
    end
end

-- 更新任务详情显示
function MglResearchTaskPanel:UpdateTaskDetail(task_data)
    if not task_data then
        -- 无任务选中时的默认显示
        self.detail_title:SetString("选择一个任务")
        self.requirement_text:SetString("选择右侧任务查看详细要求")
        self.reward_text:SetString("选择右侧任务查看奖励")
        self.submit_button:Disable()
        self.current_task = nil
        -- 刷新列表以清除选中状态
        self:UpdateTaskSelection()
        return
    end
    
    -- 保存当前选中的任务
    self.current_task = task_data
    -- 更新任务列表选中状态
    self:UpdateTaskSelection()
    
    -- 更新任务详情
    self.detail_title:SetString(task_data.title)
    
    -- 设置任务要求
    if task_data.requirement then
        -- 基础要求文本
        local requirement_text = task_data.requirement
        
        -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system
        
        -- 如果任务有物品提交要求，添加当前拥有数量显示
        if task_data.required_items and #task_data.required_items > 0 and task_system then
            requirement_text = requirement_text .. "\n\n需要物品："
            for i, item_req in ipairs(task_data.required_items) do
                -- 获取玩家拥有的物品数量
                local current_count = task_system:GetItemCount(ThePlayer, item_req.item)
                
                -- 获取物品的显示名称
                local item_display_name = STRINGS.NAMES[string.upper(item_req.item)] or item_req.item
                
                -- 显示格式：[数量/所需] 物品名称
                local item_line = string.format("%d/%d %s", current_count, item_req.amount, item_display_name)
                
                -- 如果不是最后一个物品，添加换行
                if i < #task_data.required_items then
                    item_line = item_line .. "\n"
                end
                
                requirement_text = requirement_text .. item_line
            end
        end
        
        self.requirement_text:SetString(requirement_text)
    else
        self.requirement_text:SetString("暂无详细要求")
    end
    
    -- 设置任务奖励
    if task_data.reward then
        self.reward_text:SetString(task_data.reward)
    else
        self.reward_text:SetString("暂无奖励信息")
    end
    
    -- 检查玩家是否满足任务要求
    local can_submit = false
    
    -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system

    
    if task_system then
        -- 先检查任务是否已完成
        if task_data.completed then
            -- 任务已完成，禁用提交按钮
            self.submit_button:Disable()
        else
            -- 任务未完成，检查是否满足要求
            can_submit = task_system:CheckTaskRequirements(ThePlayer, task_data.id)
            if can_submit then
                self.submit_button:Enable()
            else
                self.submit_button:Disable()
            end
        end
        -- 始终保持白色字体
        self.submit_button.text:SetColour(1, 1, 1, 1)
    else
        -- 如果无法访问任务系统，默认禁用按钮
        self.submit_button:Disable()
    end
end

-- 创建任务滚动列表
function MglResearchTaskPanel:CreateTaskList()
    -- 初始化任务列表
    self:RefreshTasksList()
    
    -- 使用简化且可靠的方式定位元素
    local right_bar_height = 485
    
    -- 创建滚动列表 - 调整参数使内容完全在右侧选项栏内
    local widget_width = 180
    local widget_height = 40
    local num_visible_rows = 9
    
    self.task_scroll_list = self.right_bar:AddChild(TEMPLATES.ScrollingGrid(
        self.tasks,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = TaskItemCtor,
            apply_fn = ApplyDataToTaskItem,
            scrollbar_offset = 7,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = (widget_height * num_visible_rows) * 0.8
        }
    ))
    
    -- 设置滚动列表位置，使其位于右侧选项栏上方区域
    self.task_scroll_list:SetPosition(0, 30)
    
    -- 添加返回按钮，位于滚动列表下方，确保在右侧选项栏内
    self.back_button = self.right_bar:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(1.4, 0.7)
    self.back_button:SetPosition(0, -180)
    self.back_button:SetTextSize(20)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        -- 关闭当前面板并打开mgl_terminal_panel
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)
    
    -- 添加任务状态变化事件监听器
    self:AddTaskStatusListeners()
end

-- 刷新任务列表
function MglResearchTaskPanel:RefreshTasksList()
    -- 基础任务数据
    self.tasks = shallowcopy(task_data)
    
    -- 始终使用replica组件访问任务系统数据
    local task_system = ThePlayer and ThePlayer.replica and ThePlayer.replica.mgl_task_system
    
    -- 如果有任务系统组件，使用它获取任务状态
    if task_system then
        local all_tasks = task_system:GetAllTasks()
        if all_tasks then
            self.tasks = all_tasks
        end
    end
end

-- 添加任务状态变化事件监听器
function MglResearchTaskPanel:AddTaskStatusListeners()
    -- 移除之前的监听器（如果有）
    self:RemoveTaskStatusListeners()
    
    if ThePlayer then
        -- 监听任务状态变化事件
        self.task_status_listener = ThePlayer:ListenForEvent("task_status", function(inst, data) self:OnTaskStatusChanged(data) end)
        
        -- 在客户端上，还需要监听replica组件的网络变量变化
        if not TheWorld.ismastersim then
            self.task_status_changed_listener = ThePlayer:ListenForEvent("task_status_changed", function(inst, data) 
                -- 当网络变量变化时，我们不直接传入数据，而是让OnTaskStatusChanged自己通过RefreshTasksList获取最新数据
                self:OnTaskStatusChanged() 
            end)
        end
    end
end

-- 移除任务状态变化事件监听器
function MglResearchTaskPanel:RemoveTaskStatusListeners()
    if ThePlayer then
        if self.task_status_listener then
            ThePlayer:RemoveEventCallback("task_status", self.task_status_listener)
            self.task_status_listener = nil
        end
        
        if self.task_status_changed_listener then
            ThePlayer:RemoveEventCallback("task_status_changed", self.task_status_changed_listener)
            self.task_status_changed_listener = nil
        end
    end
end

-- 任务状态变化时的回调
function MglResearchTaskPanel:OnTaskStatusChanged(data)
    -- 参数data是可选的，我们始终刷新任务列表获取最新数据
    self:RefreshTasksList()
    
    -- 更新滚动列表
    if self.task_scroll_list then
        self.task_scroll_list:SetItemsData(self.tasks)
        -- 强制刷新UI显示，确保状态图标正确更新
        self.task_scroll_list:RefreshView()
    end
    
    -- 如果当前有选中的任务，更新其状态
    if self.current_task then
        -- 在更新后的任务列表中查找当前选中的任务
        local updated_task = nil
        for i, task in ipairs(self.tasks) do
            if task.id == self.current_task.id then
                updated_task = task
                break
            end
        end
        
        if updated_task then
            self:UpdateTaskDetail(updated_task)
        end
    end
end



-- 更新所有任务状态
function MglResearchTaskPanel:UpdateAllTasksStatus()
    -- 刷新任务列表
    self:RefreshTasksList()
    
    -- 更新滚动列表
    if self.task_scroll_list then
        self.task_scroll_list:SetItemsData(self.tasks)
    end
end

-- 关闭面板
function MglResearchTaskPanel:Close()
    -- 移除事件监听器
    self:RemoveTaskStatusListeners()
    
    -- 移除任务完成事件监听器
    if self.task_completed_listener and ThePlayer then
            ThePlayer:RemoveEventCallback("mgl_task_completed", self.task_completed_listener)
            self.task_completed_listener = nil
        end
    
    -- 清除任务完成音效
    if self.task_complete_sound_playing then
        TheFrontEnd:GetSound():KillSound(self.task_complete_sound_playing)
        self.task_complete_sound_playing = nil
    end
    
    -- 使用标准的屏幕关闭方法
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数
function MglResearchTaskPanel:OnShow()
    -- 不要在这里再次创建任务详情UI，因为在构造函数中已经创建过了
    -- 刷新任务列表
    self:RefreshTasksList()
    
    -- 如果有选中的任务，更新其状态
    if self.current_task then
        self:UpdateTaskDetail(self.current_task)
    else
        -- 如果没有选中的任务，自动选择第一个任务
        if #self.tasks > 0 then
            self.current_task = self.tasks[1]
            self:UpdateTaskDetail(self.current_task)
        end
    end
    
end

-- 清理函数
function MglResearchTaskPanel:OnHide()
    -- 移除事件监听器
    self:RemoveTaskStatusListeners()
    
    -- 调用父类的OnHide
    Screen.OnHide(self)
end

return MglResearchTaskPanel