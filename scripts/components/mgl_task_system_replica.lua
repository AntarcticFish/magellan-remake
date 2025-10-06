---@field mgl_task_system replica_mgl_task_system

---@class replica_mgl_task_system
---@field inst ent
---@field completed_tasks_str netvar # 已完成任务的字符串形式，用逗号分隔
---@field completed_tasks table # 已完成任务的缓存
---@field science_points netvar # 科研点数
local mgl_task_system_replica = Class(
---@param self replica_mgl_task_system
---@param inst ent
function(self, inst)
    self.inst = inst
    
    -- 创建网络变量用于同步已完成的任务
    self.completed_tasks_str = net_string(inst.GUID, "mgl_task_system.completed_tasks_str", "task_status_changed")
    
    -- 创建网络变量用于同步科研点数
    self.science_points = net_float(inst.GUID, "mgl_task_system.science_points", "science_points_changed")
    
    -- 初始化已完成任务的缓存
    self.completed_tasks = {}
    
    -- 如果在单机模式，直接使用服务器数据
    if not TheNet:IsDedicated() and not TheNet:IsServerPaused() then
        self:LoadCompletedTasksFromServer()
    end
end)

-- 从服务器加载已完成的任务数据（单机模式）
function mgl_task_system_replica:LoadCompletedTasksFromServer()
    if self.inst.components and self.inst.components.mgl_task_system then
        self.completed_tasks = shallowcopy(self.inst.components.mgl_task_system.completed_tasks or {})
        
        -- 触发UI更新
        self.inst:PushEvent("task_status", { completed_tasks = self.completed_tasks })
    end
end

-- 获取所有任务列表（供UI使用）
function mgl_task_system_replica:GetAllTasks()
    -- 任务数据是静态的，可以直接加载
    local task_data = require "core_magellan_remake/data/mgl_task_data"
    local tasks = {}
    
    -- 解析网络变量中的已完成任务
    self:ParseCompletedTasksString()
    
    for _, task in ipairs(task_data) do
        local task_copy = shallowcopy(task)
        task_copy.completed = self.completed_tasks[task.id] or false
        table.insert(tasks, task_copy)
    end
    
    return tasks
end

-- 解析已完成任务的字符串为表格
function mgl_task_system_replica:ParseCompletedTasksString()
    local str = self.completed_tasks_str:value()
    if not str or str == "" then
        self.completed_tasks = {}
        return
    end
    
    -- 清空当前缓存
    self.completed_tasks = {}
    
    -- 解析逗号分隔的任务ID
    -- 将字符串类型的任务ID转换为数字类型，确保与任务数据中的ID类型匹配
    for task_id_str in string.gmatch(str, "([^,]+)") do
        -- 尝试将字符串转换为数字
        local task_id = tonumber(task_id_str)
        if task_id then
            -- 如果成功转换为数字，使用数字作为键
            self.completed_tasks[task_id] = true
        else
            -- 如果无法转换为数字，仍然使用字符串作为键
            self.completed_tasks[task_id_str] = true
        end
    end
end

-- 检查任务是否已完成
function mgl_task_system_replica:IsTaskCompleted(task_id)
    self:ParseCompletedTasksString()
    return self.completed_tasks[task_id] or false
end

-- 获取物品数量
function mgl_task_system_replica:GetItemCount(player, item_prefab)
    -- 在客户端上，我们可以通过玩家的inventory组件获取物品数量
    if player and player.replica.inventory then
        local count = 0
        local items = player.replica.inventory:GetItems()
        for _, item in pairs(items) do
            if item.prefab == item_prefab then
                if item.replica.stackable then
                    count = count + item.replica.stackable:StackSize()
                else
                    count = count + 1
                end
            end
        end
        return count
    end
    return 0
end

-- 服务器端调用：设置科研点数（只在主机端有效）
function mgl_task_system_replica:SetSciencePoints(points)
    if TheWorld.ismastersim then
        self.science_points:set(points)
    end
end

-- 客户端调用：获取科研点数
function mgl_task_system_replica:GetSciencePoints()
    return self.science_points:value()
end

-- 检查任务要求是否满足（客户端版本，用于UI显示）
function mgl_task_system_replica:CheckTaskRequirements(player, task_id)
    -- 加载任务数据
    local task_data = require "core_magellan_remake/data/mgl_task_data"
    
    -- 查找任务
    local task
    for _, t in ipairs(task_data) do
        if t.id == task_id then
            task = t
            break
        end
    end
    
    -- 检查任务是否存在且未完成
    if not task or self:IsTaskCompleted(task_id) then
        return false
    end
    
    -- 检查物品要求
    if task.required_items and #task.required_items > 0 then
        -- 遍历所有需要的物品
        for _, item_requirement in ipairs(task.required_items) do
            local current_count = self:GetItemCount(player, item_requirement.item)
            
            -- 如果数量不足，返回false
            if current_count < item_requirement.amount then
                return false
            end
        end
        
        -- 所有物品都满足要求
        return true
    end
    
    -- 默认返回false
    return false
end

-- RPC方法：提交任务到服务器
function mgl_task_system_replica:RPCSubmitTask(task_id)
    -- print("客户端通过RPC提交任务:", task_id)
    -- 在Don't Starve Together中，使用SendModRPCToServer函数发送RPC调用
    SendModRPCToServer(MOD_RPC["magellan_remake"]["SubmitTask"], task_id)
    return true, "任务提交请求已发送到服务器"
end

-- RPC方法：购买商店物品
function mgl_task_system_replica:RPCBuyShopItem(item_id)
    -- 在Don't Starve Together中，使用SendModRPCToServer函数发送RPC调用
    SendModRPCToServer(MOD_RPC["magellan_remake"]["BuyShopItem"], item_id)
    return true, "购买请求已发送到服务器"
end

-- 更新任务状态
function mgl_task_system_replica:UpdateTaskStatus()
    self:ParseCompletedTasksString()
    self.inst:PushEvent("task_status", { completed_tasks = self.completed_tasks })
end

return mgl_task_system_replica