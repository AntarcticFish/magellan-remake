local MglCommunicationDataReplica = Class(function(self, inst) self.inst = inst
    
    -- 初始化数据
    self.friends = {}
    self.friend_requests = {}
    self.chat_records = {}
    
    -- 监听网络变量变化
    inst:ListenForEvent("communication_data_changed", function()
        -- 获取网络变量数据
        local data_str = inst.communication_data:value()
        if data_str and data_str ~= "" then
            -- 反序列化数据
            local data = json.decode(data_str)
            if data then
                self.friends = data.friends or {}
                self.friend_requests = data.friend_requests or {}
                self.chat_records = data.chat_records or {}
                
                -- 通知UI数据变化
                inst:PushEvent("mgl_communication_data_changed")
            end
        end
    end)
    
    -- 初始数据同步
    local data_str = inst.communication_data:value()
    if data_str and data_str ~= "" then
        local data = json.decode(data_str)
        if data then
            self.friends = data.friends or {}
            self.friend_requests = data.friend_requests or {}
            self.chat_records = data.chat_records or {}
        end
    end
end)

-- 获取所有数据
function MglCommunicationDataReplica:GetAllData()
    return {
        friends = self.friends,
        friend_requests = self.friend_requests,
        chat_records = self.chat_records
    }
end

-- 获取好友列表
function MglCommunicationDataReplica:GetFriends()
    return self.friends or {}
end

-- 获取好友申请
function MglCommunicationDataReplica:GetFriendRequests()
    return self.friend_requests or {}
end

-- 获取特定好友的聊天记录
function MglCommunicationDataReplica:GetChatRecords(friend_id)
    return self.chat_records[friend_id] or {}
end

-- 发送好友申请（客户端调用）
function MglCommunicationDataReplica:RPCSendFriendRequest(target_id, target_name)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["SendFriendRequest"], target_id, target_name)
end

-- 接收好友申请（客户端调用）
function MglCommunicationDataReplica:RPCReceiveFriendRequest(sender_id, sender_name)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["ReceiveFriendRequest"], sender_id, sender_name)
end

-- 接受好友申请（客户端调用）
function MglCommunicationDataReplica:RPCAcceptFriendRequest(friend_id, friend_name)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["AcceptFriendRequest"], friend_id, friend_name)
end

-- 拒绝好友申请（客户端调用）
function MglCommunicationDataReplica:RPCRejectFriendRequest(request_id)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["RejectFriendRequest"], request_id)
end

-- 取消好友申请（客户端调用）
function MglCommunicationDataReplica:RPCCancelFriendRequest(request_id)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["CancelFriendRequest"], request_id)
end

-- 发送消息（客户端调用）
function MglCommunicationDataReplica:RPCSendMessage(friend_id, content)
    local sender_id = self.inst and self.inst.userid or "unknown"
    SendModRPCToServer(MOD_RPC["magellan_remake"]["SendMessage"], friend_id, content, sender_id)
end

-- 删除好友（客户端调用）
function MglCommunicationDataReplica:RPCRemoveFriend(friend_id)
    SendModRPCToServer(MOD_RPC["magellan_remake"]["RemoveFriend"], friend_id)
end

return MglCommunicationDataReplica