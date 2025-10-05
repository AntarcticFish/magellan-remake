-- 任务系统组件
-- 负责处理任务的检测、提交和奖励逻辑

-- 获取表的所有键
local function GetTableKeys(tbl)
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, tostring(k))
    end
    return keys
end

local mgl_task_system = Class(function(self, inst)
    self.inst = inst
    
    -- 加载任务数据
    self.task_data = require "core_magellan_remake/data/mgl_task_data"
    
    -- 任务完成状态存储
    self.completed_tasks = {}
    -- 监听周期变化（天数变化）
    self:WatchWorldState("cycles", function()
        -- 只在主机（服务器）端执行任务重置逻辑
        if TheWorld.ismastersim then
            -- 获取已完成的任务ID列表
            local completed_task_ids = {}
            for task_id, _ in pairs(self.completed_tasks) do
                table.insert(completed_task_ids, task_id)
            end
            
            -- 只有当有已完成的任务时才进行随机选择和重置
            if #completed_task_ids > 0 then
                -- 随机选择一个已完成的任务ID
                local random_index = math.random(1, #completed_task_ids)
                local task_id_to_reset = completed_task_ids[random_index]
                
                -- 从已完成任务列表中移除该任务ID，将其状态重置为未完成
                self.completed_tasks[task_id_to_reset] = nil
                
                -- 保存任务状态并同步
                self:SaveTaskStatus()
                self:PushTaskStatusEvent()
            end
        end
    end)
    -- 初始化时从存档加载任务状态
    self:LoadTaskStatus()
    
end)

-- 加载任务状态
function mgl_task_system:LoadTaskStatus()
    -- 这里应该从存档加载任务完成状态
    -- 暂时使用默认值
    for _, task in ipairs(self.task_data) do
        if task.completed then
            self.completed_tasks[task.id] = true
        end
    end
end

-- 保存任务状态
function mgl_task_system:SaveTaskStatus()
    -- 这里应该将任务完成状态保存到存档
    
    -- 将完成的任务ID转换为字符串格式进行存储
    -- 这种方式适合同步任务状态给客机，只传输必要的ID信息
    local completed_tasks_str = table.concat(GetTableKeys(self.completed_tasks), ",")
    
    -- 更新网络变量
    if TheWorld.ismastersim and self.inst.replica.mgl_task_system then
        self.inst.replica.mgl_task_system.completed_tasks_str:set(completed_tasks_str)
    end
end

-- 获取所有任务列表
function mgl_task_system:GetAllTasks()
    local tasks = {}
    for _, task in ipairs(self.task_data) do
        local task_copy = shallowcopy(task)
        task_copy.completed = self.completed_tasks[task.id] or false
        table.insert(tasks, task_copy)
    end
    return tasks
end

-- 检查玩家是否满足任务要求
function mgl_task_system:CheckTaskRequirements(player, task_id)
    local task = self:GetTaskById(task_id)
    if not task or self.completed_tasks[task_id] then
        return false
    end
    
    -- 如果是收集物品类型的任务
    if task.required_items and #task.required_items > 0 then
        return self:CheckItemRequirements(player, task.required_items)
    end
    
    -- 其他类型的任务检查（这里可以扩展其他任务类型的检查逻辑）
    return false
end

-- 检查玩家物品栏是否满足物品要求
function mgl_task_system:CheckItemRequirements(player, required_items)
    if not player or not player.components or not player.components.inventory then
        return false
    end
    
    local inventory = player.components.inventory
    
    -- 检查每种物品是否满足数量要求
    for _, item_requirement in ipairs(required_items) do
        -- 使用官方的Has方法检查物品数量
        local has_enough, num_found = inventory:Has(item_requirement.item, item_requirement.amount)
        
        -- 如果数量不足，返回false
        if not has_enough then
            return false
        end
    end
    
    -- 所有物品都满足要求
    return true
end

-- 获取玩家拥有的指定物品数量
function mgl_task_system:GetItemCount(player, item_prefab)
    if not player or not player.components or not player.components.inventory then
        return 0
    end
    
    -- 使用官方的Has方法获取物品数量
    local _, num_found = player.components.inventory:Has(item_prefab, 9999) -- 传入一个很大的数以获取实际数量
    return num_found
end

-- 根据ID获取任务
function mgl_task_system:GetTaskById(task_id)
    for _, task in ipairs(self.task_data) do
        if task.id == task_id then
            return task
        end
    end
    return nil
end

-- 提交任务
function mgl_task_system:SubmitTask(player, task_id)
    local task = self:GetTaskById(task_id)
    
    -- 检查任务是否存在
    if not task then
        return false, "任务不存在或已完成"
    end
    
    -- 检查任务是否已完成
    if self.completed_tasks[task_id] then
        return false, "任务不存在或已完成"
    end
    
    -- 检查任务要求是否满足
    if not self:CheckTaskRequirements(player, task_id) then
        return false, "未满足任务要求"
    end
    
    -- 消耗玩家物品
    if task.required_items and #task.required_items > 0 then
        -- 直接在ConsumeTaskItems方法中验证消耗是否成功
        local consume_success = self:ConsumeTaskItems(player, task.required_items)
        if not consume_success then
            return false, "物品消耗失败"
        end
    end
    
    -- 标记任务为已完成
    self.completed_tasks[task_id] = true
    
    -- 保存任务状态
    self:SaveTaskStatus()
    
    -- 发放任务奖励
    if task.reward_items and #task.reward_items > 0 then
        self:GiveTaskRewards(player, task.reward_items)
    end
    
    -- 更新网络变量并通过replica组件通知客户端任务已完成
    self:PushTaskStatusEvent()
    
    return true, "任务提交成功"
end

-- 消耗玩家物品
function mgl_task_system:ConsumeTaskItems(player, required_items)
    if not player or not player.components or not player.components.inventory then
        return false
    end
    
    local inventory = player.components.inventory
    local all_consumed = true
    
    -- 消耗每种物品
    for _, item_requirement in ipairs(required_items) do
        local item_prefab = item_requirement.item
        local amount_to_consume = item_requirement.amount
        
        -- 消耗前先检查物品数量（保留这个检查以避免不必要的消耗尝试）
        local has_enough, num_before = inventory:Has(item_prefab, amount_to_consume)
        
        if not has_enough then
            all_consumed = false
            break
        end
        
        -- 尝试使用官方提供的ConsumeByName方法
        inventory:ConsumeByName(item_prefab, amount_to_consume)
        
        -- 消耗后再次检查物品数量，确保成功消耗了足够的数量
        local _, num_after = inventory:Has(item_prefab, 9999)
        
        -- 计算实际消耗的数量
        local actual_consumed = (num_before or 0) - (num_after or 0)
        
        -- 主要依赖实际消耗数量来判断
        if actual_consumed < amount_to_consume then
            all_consumed = false
            break  -- 一旦有一种物品消耗失败，就停止消耗其他物品
        end
    end
    
    -- 返回是否所有物品都成功消耗
    return all_consumed
end

-- 发放任务奖励（支持不同类型的点数奖励）
function mgl_task_system:GiveTaskRewards(player, reward_items)
    if not player or not player.components then
        return
    end
    
    -- print("发放任务奖励:")
    for _, reward in ipairs(reward_items) do
        -- print(string.format("- %s x %d", reward.item, reward.amount))
        
        -- 根据奖励类型处理
        if reward.item == "mgl_science_points" then
            -- 科技点数奖励
            player.components.talker:Say(string.format("获得了 %d 点科技点数!", reward.amount))
        -- 这里可以添加更多奖励类型的处理
        end
    end
end

-- 更新任务状态（应该定期调用以检查非物品提交类型的任务）
function mgl_task_system:UpdateTaskStatus(player)
    -- 这里可以实现非物品提交类型任务的状态检查
    -- 例如探索任务、研究任务等
end

-- 从任务完成状态移除任务（用于测试）
function mgl_task_system:RemoveTaskCompletion(task_id)
    self.completed_tasks[task_id] = nil
    self:SaveTaskStatus()
    self:PushTaskStatusEvent()
end

-- 推送任务状态事件，通知UI更新
function mgl_task_system:PushTaskStatusEvent()
    -- 更新网络变量
    if TheWorld.ismastersim and self.inst.replica.mgl_task_system then
        -- 构建任务状态字符串，确保格式正确避免网络同步错误
        local task_keys = GetTableKeys(self.completed_tasks)
        local completed_tasks_str = #task_keys > 0 and table.concat(task_keys, ",") or ""
        
        -- 确保网络变量同步正确，防止序列化错误
        self.inst.replica.mgl_task_system.completed_tasks_str:set(completed_tasks_str)
    end
    
    -- 发送事件通知UI更新
    self.inst:PushEvent("task_status", { completed_tasks = self.completed_tasks })
end

-- 组件加载完成后的初始化
function mgl_task_system:OnInit()
    -- 确保正确推送初始状态
    self:PushTaskStatusEvent()
end

-- 组件保存功能 - 将任务状态保存到存档
function mgl_task_system:OnSave()
    -- 构建保存数据
    local data = {
        completed_tasks = self.completed_tasks
    }
    return data
end

-- 组件加载功能 - 从存档加载任务状态
function mgl_task_system:OnLoad(data)
    if data and data.completed_tasks then
        -- 从存档加载已完成任务状态
        self.completed_tasks = shallowcopy(data.completed_tasks)
    else
        -- 如果没有存档数据，使用默认值
        self.completed_tasks = {}
        self:LoadTaskStatus() -- 回退到初始加载
    end
    
    -- 加载完成后推送状态更新
    self:PushTaskStatusEvent()
end

-- 组件移除时的清理
function mgl_task_system:OnRemove()
    -- 移除相关标签
    if self.inst:HasTag("mgltaskowner") then
        self.inst:RemoveTag("mgltaskowner")
    end
    
    -- 移除对组件的直接引用
    if self.inst.task_system == self then
        self.inst.task_system = nil
    end
    
    -- 发送移除事件
    self.inst:PushEvent("task_system_removed")
end

-- 导出任务系统组件
return mgl_task_system