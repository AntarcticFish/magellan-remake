local assets =
{
    Asset("ANIM", "anim/mgl_blackhole_protocol.zip"),
    Asset("ATLAS", "images/inventoryimages/mgl_blackhole_protocol.xml")
}

-- 检查位置是否有效（不在海面、避开建筑物等）
local function IsValidWormholePosition(pos)
    local check_radius = 1.5 -- 检查周围是否有建筑物的半径
    
    return TheWorld.Map:IsPassableAtPoint(pos.x, 0, pos.z) and 
           not TheWorld.Map:IsPointNearHole(pos) and
           not TheWorld.Map:IsOceanAtPoint(pos.x, 0, pos.z) and
           -- 检查周围是否有建筑物或不可穿过的物体
           #TheSim:FindEntities(pos.x, 0, pos.z, check_radius, nil, {"INLIMBO", "player"}, {"wall", "structure", "blocker", "furniture"}) == 0
end

-- 寻找随机可行走位置（范围可以调整）
local function FindRandomWalkablePosition(center, min_radius, max_radius, attempts)
    local pos = nil
    
    for i = 1, attempts do
        local angle = math.random() * 2 * math.pi
        local radius = min_radius + (math.random() * (max_radius - min_radius))
        local offset = Vector3(math.cos(angle) * radius, 0, math.sin(angle) * radius)
        local attempt_pos = Vector3(center.x + offset.x, 0, center.z + offset.z)
        
        -- 使用统一的位置有效性检查函数
        if IsValidWormholePosition(attempt_pos) then
            pos = attempt_pos
            break
        end
    end
    return pos
end


-- 创建虫洞对
local function CreateWormholes(inst, pt)
    -- 创建两个临时虫洞
    local wormhole1 = SpawnPrefab("wormhole")
    local wormhole2 = SpawnPrefab("wormhole")
    
    -- 记录虫洞引用以便后续清理
    inst.wormhole1 = wormhole1
    inst.wormhole2 = wormhole2
    
    -- 设置虫洞初始颜色为深蓝色
    wormhole1.AnimState:SetMultColour(0, 0.2, 0.8, 1) -- 深蓝色
    wormhole2.AnimState:SetMultColour(0, 0.2, 0.8, 1) -- 深蓝色
    
    -- 设置第一个虫洞在玩家选择的位置
    wormhole1.Transform:SetPosition(pt.x, 0, pt.z)
    
    -- 寻找随机位置放置第二个虫洞（在离玩家10-30距离的范围内）
    local player = inst.components.inventoryitem.owner
    local random_pos = nil
    if player then
        local player_pos = player:GetPosition()
       -- 进一步增加随机距离范围，从20-50改为40-100
         -- 将随机距离范围从40-100再扩大一倍到80-200
         random_pos = FindRandomWalkablePosition(player_pos, 80, 200, 20)
    end
    
    -- 如果找不到随机位置，就尝试在第一个虫洞旁边找合适位置
    if random_pos then
        wormhole2.Transform:SetPosition(random_pos.x, 0, random_pos.z)
    else
        -- 尝试在不同距离寻找有效的备用位置
        local backup_offsets = {80, 120, 160, 200} -- 尝试不同的偏移距离
        local valid_backup_pos = nil
        
        -- 先尝试使用FindWalkableOffset找位置
        for _, dist in ipairs(backup_offsets) do
            local offset = FindWalkableOffset(pt, math.random() * 2 * math.pi, dist, 12)
            if offset then
                local backup_pos = Vector3(pt.x + offset.x, 0, pt.z + offset.z)
                if IsValidWormholePosition(backup_pos) then
                    valid_backup_pos = backup_pos
                    break
                end
            end
        end
        
        -- 如果找到有效备用位置，使用它；否则才使用简单偏移
        if valid_backup_pos then
            wormhole2.Transform:SetPosition(valid_backup_pos.x, 0, valid_backup_pos.z)
        else
            -- 最后才使用固定距离的备用位置
            local last_resort_pos = Vector3(pt.x + 120, 0, pt.z)
            wormhole2.Transform:SetPosition(last_resort_pos.x, 0, last_resort_pos.z)
        end
    end
    
    -- 设置虫洞相互连接
    wormhole1.components.teleporter:Target(wormhole2)
    wormhole2.components.teleporter:Target(wormhole1)

    
    -- 30秒后自动销毁虫洞
    -- 提前10秒（第20秒）将虫洞设置为不可用
    local function MakeWormholeUnusable(wormhole)
        if wormhole.components.teleporter then
            wormhole.components.teleporter:SetEnabled(false)
            -- 移除标签以确保其他系统知道这个虫洞已禁用
            wormhole:RemoveTag("teleporter")
            
            -- 播放关闭动画
            if wormhole.sg:HasStateTag("open") then
                wormhole.sg:GoToState("closing")
            end
            
            -- 改变外观以表示已禁用（可选）
            wormhole.AnimState:SetMultColour(0.2, 0.2, 0.5, 1) -- 变暗蓝色
        end
    end
    
    -- 在20秒时将虫洞设置为不可用
    wormhole1:DoTaskInTime(20, function()
        MakeWormholeUnusable(wormhole1)
    end)
    wormhole2:DoTaskInTime(20, function()
        MakeWormholeUnusable(wormhole2)
    end)
    
    -- 在30秒时删除虫洞
    wormhole1:DoTaskInTime(30, function()
        if wormhole1 and wormhole1:IsValid() then
            wormhole1:Remove()
        end
    end)
    wormhole2:DoTaskInTime(30, function()
        if wormhole2 and wormhole2:IsValid() then
            wormhole2:Remove()
        end
    end)
end

-- 使用物品时的回调
local function OnUseItem(inst, doer)
    local player = doer or inst.components.inventoryitem.owner
    if player then
        -- 在玩家位置创建虫洞对
        local player_pos = player:GetPosition()
        
        -- 在玩家前方不远处创建第一个虫洞，最多尝试10次寻找有效位置
        local wormhole_pos = nil
        local attempts = 10
        local attempt = 1
        
        while not wormhole_pos and attempt <= attempts do
            local front_pos = FindWalkableOffset(player_pos, player.Transform:GetRotation() * DEGREES, 3, 12, attempt)
            if front_pos then
                local test_pos = Vector3(player_pos.x + front_pos.x, 0, player_pos.z + front_pos.z)
                if IsValidWormholePosition(test_pos) then
                    wormhole_pos = test_pos
                    break
                end
            end
            attempt = attempt + 1
        end
        
        -- 如果找到有效位置，则创建虫洞
        if wormhole_pos then
            -- 创建虫洞
            CreateWormholes(inst, wormhole_pos)
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mgl_blackhole_protocol")
    inst.AnimState:SetBuild("mgl_blackhole_protocol")
    inst.AnimState:PlayAnimation("idle")

    -- 标记为魔法物品和mgl物品
    inst:AddTag("magic")
    inst:AddTag("mgl_blackhole_protocol")
    inst:AddTag("mgl_item")
    inst:AddTag("book")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- 移除部署组件，添加可使用组件
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/mgl_blackhole_protocol.xml"
    
    inst:AddComponent("mgl_itemfn")
    inst.components.mgl_itemfn:SetFunction(OnUseItem)
    

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("mgl_blackhole_protocol", fn, assets)