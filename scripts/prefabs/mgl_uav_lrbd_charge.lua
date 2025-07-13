local assets =
{
    Asset("ANIM", "anim/mgl_fx.zip"),
    -- Asset("SOUND", "sound/chess.fsb"),
}

-- 存储所有生成的激光片段，用于后续移除
local function CreateSeamlessLaser(owner, target)
    -- 获取起始点和终点
    local x1, y1, z1 = owner.Transform:GetWorldPosition()
    local x2, y2, z2 = target.Transform:GetWorldPosition()
    
    -- 计算激光方向和总长度
    local dx = x2 - x1
    local dz = z2 - z1
    local angle = math.atan2(dz, dx) * 180 / math.pi
    local length = math.sqrt(dx*dx + dz*dz)
    
    -- 每个片段的理想长度（根据动画调整）
    local ideal_segment_length = 0.1
    
    -- 计算实际需要的片段数量（向上取整确保覆盖全程）
    local segment_count = math.max(1, math.ceil(length / ideal_segment_length))
    -- 创建所有片段
    for i = 1, segment_count do
        local segment = SpawnPrefab("mgl_fx")
        segment.AnimState:PlayAnimation("uav_lrbd_proj_loop")
        segment.AnimState:SetFinalOffset(-1)
        
        -- 计算片段的中心点位置（关键：使用累加方式确保无缝连接）
        local segment_center_x = x1 + dx * ((i - 0.5) / segment_count)
        local segment_center_z = z1 + dz * ((i - 0.5) / segment_count)
        
        -- 设置位置和旋转
        segment.Transform:SetPosition(segment_center_x, y1+1, segment_center_z)
        segment.Transform:SetRotation(angle)
        segment.Transform:SetScale(0.5,0.5,0.5)
        segment:ListenForEvent("animover", function()
            segment:Remove()
        end)
    end
end

local function OnHit(inst, owner, target)
    CreateSeamlessLaser(owner, target)
    SpawnPrefab("uav_lrbd_attack1_hit").Transform:SetPosition(inst.Transform:GetWorldPosition())
    --添加命中特效
    local fx = SpawnPrefab("mgl_fx")
    fx.Transform:SetPosition(target.Transform:GetWorldPosition())
    -- fx.entity:SetParent(target.entity)
    fx.AnimState:PlayAnimation("uav_lrbd_attack1_hit")
    fx:ListenForEvent("animover", function()
        fx:Remove()
    end)
    inst:Remove()
end

local function OnAnimOver(inst)
    inst:DoTaskInTime(.3, inst.Remove)
end

local function OnThrown(inst)
    inst:ListenForEvent("animover", OnAnimOver)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    -- inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.Transform:SetEightFaced()

    inst.AnimState:SetBank("mgl_fx")
    inst.AnimState:SetBuild("mgl_fx")
    -- inst.AnimState:PlayAnimation("uav_lrbd_proj_cast")
    -- inst.AnimState:PlayAnimation("uav_lrbd_proj_pre")
    -- inst.AnimState:PlayAnimation("uav_lrbd_proj_loop",true)
    -- inst.AnimState:PlayAnimation("idle")

    --projectile (from projectile component) added to pristine state for optimization
    inst:AddTag("projectile")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(30)
    inst.components.projectile:SetHoming(false)
    inst.components.projectile:SetHitDist(2)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(inst.Remove)
    inst.components.projectile:SetOnThrownFn(OnThrown)

    return inst
end

-- local function PlayHitSound(proxy)
--     local inst = CreateEntity()

--     --[[Non-networked entity]]

--     inst.entity:AddTransform()
--     inst.entity:AddSoundEmitter()

--     inst.Transform:SetFromProxy(proxy.GUID)

--     inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/shotexplo")

--     inst:Remove()
-- end

local function hit_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    -- --Dedicated server does not need to spawn the local fx
    -- if not TheNet:IsDedicated() then
    --     --Delay one frame in case we are about to be removed
    --     inst:DoTaskInTime(0, PlayHitSound)
    -- end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    inst:DoTaskInTime(.5, inst.Remove)

    return inst
end

return Prefab("mgl_uav_lrbd_charge", fn, assets),
    Prefab("uav_lrbd_attack1_hit", hit_fn)