local function on_mgl_communication_data(self, data)
    if self.inst.communication_data then
        -- 序列化数据
        local data_str = json.encode(data)
        -- 更新网络变量
        self.inst.communication_data:set(data_str)
    end
end

local mgl_communication_data = Class(function(self, inst)
    self.inst = inst
    
    -- 初始化数据
    self.data = {
        friends = {}, -- 好友列表
        friend_requests = {}, -- 好友申请
        chat_records = {} -- 聊天记录
    }
    
    -- 注册网络事件
    if TheWorld.ismastersim then
        -- 服务器端：注册replica数据同步
        inst:AddTag("mgl_communication_data")
    end
end, nil, {
    data = on_mgl_communication_data
})

-- 获取所有数据
function mgl_communication_data:GetAllData()
    return self.data
end

-- 获取好友列表
function mgl_communication_data:GetFriends()
    return self.data.friends or {}
end

-- 获取好友申请
function mgl_communication_data:GetFriendRequests()
    return self.data.friend_requests or {}
end

-- 获取特定好友的聊天记录
function mgl_communication_data:GetChatRecords(friend_id)
    return self.data.chat_records[friend_id] or {}
end


-- 添加好友
function mgl_communication_data:AddFriend(friend_id, friend_name)
    if TheWorld.ismastersim then
        -- 检查是否已经是好友
        for i, friend in ipairs(self.data.friends) do
            if friend.id == friend_id then
                return false
            end
        end
        
        -- 添加到当前玩家的好友列表
        table.insert(self.data.friends, {id = friend_id, name = friend_name})
        
        -- 从当前玩家的好友申请列表中移除
        for i, request in ipairs(self.data.friend_requests) do
            if request.id == friend_id and request.type == "received" then
                table.remove(self.data.friend_requests, i)
                break
            end
        end
        
        -- 找到对方玩家并添加到其好友列表
        local current_player_id = self.inst.userid
        local current_player_name = self.inst.name or "未知玩家"
        for _, player in pairs(AllPlayers) do
            if player and player.userid == friend_id and player.components.mgl_communication_data then
                local friend_component = player.components.mgl_communication_data
                
                -- 检查对方是否已经将当前玩家添加为好友
                local is_already_friend = false
                for i, friend in ipairs(friend_component.data.friends) do
                    if friend.id == current_player_id then
                        is_already_friend = true
                        break
                    end
                end
                
                if not is_already_friend then
                    -- 添加当前玩家到对方的好友列表
                    table.insert(friend_component.data.friends, {id = current_player_id, name = current_player_name})
                end
                
                -- 从对方的好友申请列表中移除"sent"类型的申请（对方发送的）
                for i, request in ipairs(friend_component.data.friend_requests) do
                    if request.id == current_player_id and request.type == "sent" then
                        table.remove(friend_component.data.friend_requests, i)
                        break
                    end
                end
                
                break
            end
        end
        
        
        return true
    end
    return false
end

-- 发送好友申请
function mgl_communication_data:SendFriendRequest(target_id, target_name)
    if TheWorld.ismastersim then
        -- 检查是否已经发送过申请
        for i, request in ipairs(self.data.friend_requests) do
            if request.id == target_id and request.type == "sent" then
                return false
            end
        end
        
        -- 添加到发送方的好友申请列表
        table.insert(self.data.friend_requests, {id = target_id, name = target_name, type = "sent"})
        
        -- 找到目标玩家并添加到其接收申请列表
        local sender_id = self.inst.userid
        local sender_name = self.inst.name or "未知玩家"
        
        -- 处理添加自己为好友的情况
        if target_id ~= sender_id then
            -- 遍历所有玩家，寻找目标玩家
            for _, player in pairs(AllPlayers) do
                if player and player.userid == target_id and player.components.mgl_communication_data then
                    -- 调用目标玩家的接收好友申请方法
                    player.components.mgl_communication_data:ReceiveFriendRequest(sender_id, sender_name)
                    break
                end
            end
        else
            -- 自己添加自己为好友，直接生成接收申请
            self:ReceiveFriendRequest(sender_id, sender_name)
        end

        
        return true
    end
    return false
end

-- 接收好友申请
function mgl_communication_data:ReceiveFriendRequest(sender_id, sender_name)
    if TheWorld.ismastersim then
        -- 检查是否已经收到过申请
        for i, request in ipairs(self.data.friend_requests) do
            if request.id == sender_id and request.type == "received" then
                return false
            end
        end
        
        -- 添加到好友申请列表
        table.insert(self.data.friend_requests, {id = sender_id, name = sender_name, type = "received"})
        
        
        return true
    end
    return false
end

-- 拒绝好友申请
function mgl_communication_data:RejectFriendRequest(request_id)
    if TheWorld.ismastersim then
        for i, request in ipairs(self.data.friend_requests) do
            if request.id == request_id and request.type == "received" then
                table.remove(self.data.friend_requests, i)
                return true
            end
        end
    end
    return false
end

-- 取消好友申请
function mgl_communication_data:CancelFriendRequest(request_id)
    if TheWorld.ismastersim then
        for i, request in ipairs(self.data.friend_requests) do
            if request.id == request_id and request.type == "sent" then
                table.remove(self.data.friend_requests, i)
                return true
            end
        end
    end
    return false
end

-- 删除好友
function mgl_communication_data:RemoveFriend(friend_id)
    if TheWorld.ismastersim then
        for i, friend in ipairs(self.data.friends) do
            if friend.id == friend_id then
                table.remove(self.data.friends, i)
                -- 删除聊天记录
                self.data.chat_records[friend_id] = nil
                
                -- 找到对方玩家并从其好友列表中移除
                local current_player_id = self.inst.userid
                for _, player in pairs(AllPlayers) do
                    if player and player.userid == friend_id and player.components.mgl_communication_data then
                        local friend_component = player.components.mgl_communication_data
                        for j, f in ipairs(friend_component.data.friends) do
                            if f.id == current_player_id then
                                table.remove(friend_component.data.friends, j)
                                -- 删除对方的聊天记录
                                friend_component.data.chat_records[current_player_id] = nil
                                break
                            end
                        end
                        break
                    end
                end
                
                return true
            end
        end
    end
    return false
end

-- 发送消息
function mgl_communication_data:SendMessage(friend_id, content, sender_id)
    if TheWorld.ismastersim then
        -- 检查是否是好友
        local is_friend = false
        for i, friend in ipairs(self.data.friends) do
            if friend.id == friend_id then
                is_friend = true
                break
            end
        end
        
        if not is_friend then
            return false
        end
        
        -- 初始化发送方的聊天记录
        if not self.data.chat_records[friend_id] then
            self.data.chat_records[friend_id] = {}
        end
        
        -- 添加消息到发送方的聊天记录
        local message = {
            sender = sender_id,
            content = content,
            time = os.time()
        }
        table.insert(self.data.chat_records[friend_id], message)
        
        -- 限制发送方聊天记录数量为50条
        if #self.data.chat_records[friend_id] > 50 then
            table.remove(self.data.chat_records[friend_id], 1)
        end
        
        
        -- 找到接收方玩家并更新其聊天记录
        local sender_name = self.inst.name or "未知玩家"
        for _, player in pairs(AllPlayers) do
            if player and player.userid == friend_id and player.components.mgl_communication_data then
                local receiver_component = player.components.mgl_communication_data
                
                -- 初始化接收方的聊天记录
                if not receiver_component.data.chat_records[sender_id] then
                    receiver_component.data.chat_records[sender_id] = {}
                end
                
                -- 添加消息到接收方的聊天记录
                table.insert(receiver_component.data.chat_records[sender_id], message)
                
                -- 限制接收方聊天记录数量为50条
                if #receiver_component.data.chat_records[sender_id] > 50 then
                    table.remove(receiver_component.data.chat_records[sender_id], 1)
                end
                

                break
            end
        end
        
        return true
    end
    return false
end

--检查是否已经是好友
function mgl_communication_data:IsFriend(friend_id)
    for i, friend in ipairs(self.data.friends) do
        if friend.id == friend_id then
            return true
        end
    end
    return false
end

function mgl_communication_data:OnLoad(data)
    self.data = data.data or {
        friends = {}, -- 好友列表
        friend_requests = {}, -- 好友申请
        chat_records = {} -- 聊天记录
    }
end

function mgl_communication_data:OnSave()
    return { data = self.data }
end

-- RPC方法：发送好友申请
function mgl_communication_data:RPCSendFriendRequest(inst, target_id, target_name)
    if TheWorld.ismastersim then
        self:SendFriendRequest(target_id, target_name)
    end
end

-- RPC方法：接收好友申请
function mgl_communication_data:RPCReceiveFriendRequest(inst, sender_id, sender_name)
    if TheWorld.ismastersim then
        self:ReceiveFriendRequest(sender_id, sender_name)
    end
end

-- RPC方法：接受好友申请
function mgl_communication_data:RPCAcceptFriendRequest(inst, friend_id, friend_name)
    if TheWorld.ismastersim then
        self:AddFriend(friend_id, friend_name)
    end
end

-- RPC方法：拒绝好友申请
function mgl_communication_data:RPCRejectFriendRequest(inst, request_id)
    if TheWorld.ismastersim then
        self:RejectFriendRequest(request_id)
    end
end

-- RPC方法：取消好友申请
function mgl_communication_data:RPCCancelFriendRequest(inst, request_id)
    if TheWorld.ismastersim then
        self:CancelFriendRequest(request_id)
    end
end

-- RPC方法：发送消息
function mgl_communication_data:RPCSendMessage(inst, friend_id, content, sender_id)
    if TheWorld.ismastersim then
        self:SendMessage(friend_id, content, sender_id)
    end
end

-- RPC方法：删除好友
function mgl_communication_data:RPCRemoveFriend(inst, friend_id)
    if TheWorld.ismastersim then
        self:RemoveFriend(friend_id)
    end
end

return mgl_communication_data