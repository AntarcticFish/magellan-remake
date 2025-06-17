--这是主机相关的格式 以AddStategraphState("wilson", ....)为主
--Mod开发者 通常都会调用AddStategraphState 这个API函数
--在mod加载时，游戏会读取这些以AddStategraphState写好的函数
AddStategraphState(
    "wilson",
    State {
        name = "mgl_attack_prepare",
        tags = { "busy", "preparing" },
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("mapper_pre", false) -- 播放准备动画
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() and not (inst:HasTag("playerghost") and inst.components.health:IsDead()) then
                        inst.sg:GoToState("mgl_attack_attack")
                    end
                end
            )
        },
    }
)

--这是客户端相关的格式 以AddStategraphState("wilson_client", ....)为主
AddStategraphState(
    "wilson_client",
    State {
        name = "mgl_attack_prepare",
        tags = { "busy", "preparing" },
        onenter = function(inst)
            inst.components.locomotor:Stop()                  --停止移动
            inst.AnimState:PlayAnimation("mapper_pre", false) -- 播放准备动画
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() and not (inst:HasTag("playerghost") and inst.replica.health:IsDead()) then --不在死亡状态 就执行下一步
                        inst.sg:GoToState("mgl_attack_attack")
                    end
                end
            )
        },
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "mgl_attack_attack",
        tags = { "attack", "notalking", "abouttoattack" },

        onenter = function(inst)
            if inst.components.combat:InCooldown() then
                inst.sg:RemoveStateTag("abouttoattack")
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle", true)
                return
            end

            local buffaction = inst:GetBufferedAction()
            local target = buffaction ~= nil and buffaction.target or nil
            local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            --print(buffaction, buffaction and buffaction.target, "攻击反应", target, "目标")
            inst.components.combat:SetTarget(target)
            inst.components.combat:StartAttack()
            inst.components.locomotor:Stop()
            local cooldown = inst.components.combat.min_attack_period

            if equip ~= nil then --如果装备有武器
                inst.AnimState:PlayAnimation("mapper_lag", false)
                inst.AnimState:PushAnimation("mapper", false)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
                cooldown = math.max(cooldown, 13 * FRAMES)
            else
                inst.AnimState:PlayAnimation("punch")
                inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh", nil, nil, true)
                cooldown = math.max(cooldown, 24 * FRAMES)
            end

            inst.sg:SetTimeout(cooldown)

            if target ~= nil then
                inst.components.combat:BattleCry()
                if target:IsValid() then
                    inst:FacePoint(target:GetPosition())
                end
            end
        end,

        onupdate = function(inst, dt)
            if (inst.sg.statemem.projectiledelay or 0) > 0 then --如果有发射物 则判定发射延迟 否则为0
                inst.sg.statemem.projectiledelay = inst.sg.statemem.projectiledelay - dt
                if inst.sg.statemem.projectiledelay <= FRAMES then
                    if inst.sg.statemem.projectilesound ~= nil then
                        inst.SoundEmitter:PlaySound(inst.sg.statemem.projectilesound, nil, nil, true) --播放相关的发射物声音
                        inst.sg.statemem.projectilesound = nil
                    end
                    if inst.sg.statemem.projectiledelay <= 0 then
                        --inst:PerformBufferedAction() --执行此动作 必须要有
                        inst.sg:RemoveStateTag("abouttoattack")
                    end
                end
            end
        end,

        timeline = --时间轴
        {
            TimeEvent(6 * FRAMES, function(inst)
                if inst.sg.statemem.ischop then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
                end
            end),
            TimeEvent(7 * FRAMES, function(inst)
                if inst.sg.statemem.ismoose then --ismoose 这是跟大鹅相关的 可以无视掉
                    if inst.sg.statemem.ismoosesmash then
                        inst:PushMooseSmashShake()
                        inst.sg:RemoveStateTag("nointerrupt")

                        local x, y, z = inst.Transform:GetWorldPosition()
                        local rot = inst.Transform:GetRotation()

                        --V2C: first frame is blank, so no need to worry about forcing instant facing update
                        local fx = SpawnPrefab("weremoose_smash_fx")
                        fx.Transform:SetPosition(x, 0, z)
                        fx.Transform:SetRotation(rot)
                        fx._owner:set(inst)

                        inst:ClearBufferedAction()
                        inst.components.combat.ignorehitrange = true
                        inst.components.combat:SetDefaultDamage(TUNING.SKILLS.WOODIE.MOOSE_SMASH_DAMAGE)
                        local dist = 1
                        local radius = 2
                        rot = rot * DEGREES
                        x = x + dist * math.cos(rot)
                        z = z - dist * math.sin(rot)
                        for i, v in ipairs(TheSim:FindEntities(x, y, z, radius + 3, MOOSE_AOE_MUST_TAGS, MOOSE_AOE_CANT_TAGS)) do
                            if v ~= inst and v:IsValid() and not v:IsInLimbo() and not (v.components.health ~= nil and v.components.health:IsDead()) then
                                local range = radius + v:GetPhysicsRadius(0)
                                local dsq = v:GetDistanceSqToPoint(x, y, z)
                                if dsq < range * range and
                                    (v == inst.sg.statemem.attacktarget or --would mean we force attacked if needed
                                        not inst:TargetForceAttackOnly(v)
                                    ) and
                                    inst.components.combat:CanTarget(v) and
                                    not inst.components.combat:IsAlly(v)
                                then
                                    if v.components.planarentity ~= nil then
                                        inst.components.planardamage:AddBonus(inst,
                                            TUNING.SKILLS.WOODIE.MOOSE_SMASH_PLANAR_DAMAGE, "weremoose_smash")
                                    end
                                    inst.components.combat:DoAttack(v)
                                    inst.components.planardamage:RemoveBonus(inst, "weremoose_smash")
                                end
                            end
                        end
                        inst.components.combat:SetDefaultDamage(TUNING.WEREMOOSE_DAMAGE)
                        inst.components.combat.ignorehitrange = false
                    else                             --人物相关
                        inst:PerformBufferedAction() --条件通过 在这里返回true 允许执行攻击动作
                    end
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
            TimeEvent(8 * FRAMES, function(inst)
                if not inst.sg.statemem.isbeaver then --如果是熊大 那么可以直接返回true
                    inst:PerformBufferedAction()      --inst:PerformBufferedAction() 类似于return true
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
        },

        ontimeout = function(inst)
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
            -- if inst.AnimState:AnimDone() then       --动画结束了
            --     inst.sg:GoToState("mgl_attack_end") --正常的动作结束会转进idle，但是我们需要播放下一个动画，所以这里是 mgl_attack_end
            -- end
        end,

        events =
        {
            EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
                --[[if inst.AnimState:AnimDone() then --动画结束了 正常的动作结束会转进idle，但是我们需要播放下一个动画，所以注释掉
                    inst.sg:GoToState("mgl_attack_end")
                end]]
            end),
        },

        onexit = function(inst)
            inst.components.combat:SetTarget(nil)        --强行取消就取消目标
            if inst.sg:HasStateTag("abouttoattack") then --取消攻击
                inst.components.combat:CancelAttack()
            end
        end,
    }
)

-- AddStategraphState(
--     "wilson",
--     State {
--         name = "mgl_attack_end",
--         tags = { "busy", "end" },
--         onenter = function(inst)
--             inst.components.locomotor:Stop()
--             inst.AnimState:PlayAnimation("mapper") --结束动画
--         end,
--         events = {
--             EventHandler(
--                 "animover",
--                 function(inst)
--                     if inst.AnimState:AnimDone() and not (inst:HasTag("playerghost") and inst.components.health:IsDead()) then
--                         inst.sg:GoToState("idle") --完成了！
--                     end
--                 end
--             )
--         },
--     }
-- )

local function DoMountSound(inst, mount, sound)
    if mount ~= nil and mount.sounds ~= nil then
        inst.SoundEmitter:PlaySound(mount.sounds[sound], nil, nil, true)
    end
end

AddStategraphState(
    "wilson_client",
    State {
        name = "mgl_attack_attack",
        tags = { "attack", "notalking" },

        onenter = function(inst)
            local combat = inst.replica.combat
            if combat:InCooldown() then
                inst.sg:RemoveStateTag("abouttoattack")
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle", true)
                return
            end

            local cooldown = combat:MinAttackPeriod()
            if inst.sg.laststate == inst.sg.currentstate then
                inst.sg.statemem.chained = true
            end
            combat:StartAttack()

            inst.components.locomotor:Stop()
            local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            local rider = inst.replica.rider
            if rider ~= nil and rider:IsRiding() then
                if equip ~= nil and (equip:HasTag("rangedweapon") or equip:HasTag("projectile")) then
                    inst.AnimState:PlayAnimation("player_atk_pre")
                    inst.AnimState:PushAnimation("player_atk", false)
                    if (equip.projectiledelay or 0) > 0 then
                        --V2C: Projectiles don't show in the initial delayed frames so that
                        --     when they do appear, they're already in front of the player.
                        --     Start the attack early to keep animation in sync.
                        inst.sg.statemem.projectiledelay = 8 * FRAMES - equip.projectiledelay
                        if inst.sg.statemem.projectiledelay > FRAMES then
                            inst.sg.statemem.projectilesound =
                                (equip:HasTag("icestaff") and "dontstarve/wilson/attack_icestaff") or
                                (equip:HasTag("firestaff") and "dontstarve/wilson/attack_firestaff") or
                                (equip:HasTag("firepen") and "wickerbottom_rework/firepen/launch") or
                                "dontstarve/wilson/attack_weapon"
                        elseif inst.sg.statemem.projectiledelay <= 0 then
                            inst.sg.statemem.projectiledelay = nil
                        end
                    end
                    if inst.sg.statemem.projectilesound == nil then
                        inst.SoundEmitter:PlaySound(
                            (equip:HasTag("icestaff") and "dontstarve/wilson/attack_icestaff") or
                            (equip:HasTag("firestaff") and "dontstarve/wilson/attack_firestaff") or
                            (equip:HasTag("firepen") and "wickerbottom_rework/firepen/launch") or
                            "dontstarve/wilson/attack_weapon",
                            nil, nil, true
                        )
                    end
                    if cooldown > 0 then
                        cooldown = math.max(cooldown, 13 * FRAMES)
                    end
                else
                    inst.AnimState:PlayAnimation("atk_pre")
                    inst.AnimState:PushAnimation("atk", false)
                    DoMountSound(inst, rider:GetMount(), "angry")
                    if cooldown > 0 then
                        cooldown = math.max(cooldown, 16 * FRAMES)
                    end
                end
            else
                if equip ~= nil then -- 如果装备有武器
                    inst.AnimState:PlayAnimation("mapper_lag")
                    inst.AnimState:PushAnimation("mapper", false)
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
                else
                    inst.AnimState:PlayAnimation("punch")
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh", nil, nil, true)
                end
            end
			local buffaction = inst:GetBufferedAction()
            if buffaction ~= nil then
                inst:PerformPreviewBufferedAction()

                if buffaction.target ~= nil and buffaction.target:IsValid() then
                    inst:FacePoint(buffaction.target:GetPosition())
                    inst.sg.statemem.attacktarget = buffaction.target
                    inst.sg.statemem.retarget = buffaction.target
                end
            end

            if cooldown > 0 then
                inst.sg:SetTimeout(cooldown)
            end
        end,

        onupdate = function(inst, dt)
            if (inst.sg.statemem.projectiledelay or 0) > 0 then
                inst.sg.statemem.projectiledelay = inst.sg.statemem.projectiledelay - dt
                if inst.sg.statemem.projectiledelay <= FRAMES then
                    if inst.sg.statemem.projectilesound ~= nil then
                        inst.SoundEmitter:PlaySound(inst.sg.statemem.projectilesound, nil, nil, true)
                        inst.sg.statemem.projectilesound = nil
                    end
                    if inst.sg.statemem.projectiledelay <= 0 then
                        inst:ClearBufferedAction()
                        inst.sg:RemoveStateTag("abouttoattack")
                    end
                end
            end
        end,

        timeline =
        {
            TimeEvent(5 * FRAMES, function(inst)
                if inst.sg.statemem.ismoose and not inst.sg.statemem.ismoosesmash then
                    inst.SoundEmitter:PlaySound("dontstarve/characters/woodie/moose/punch", nil, nil, true)
                end
            end),
            TimeEvent(6 * FRAMES, function(inst)
                if inst.sg.statemem.isbeaver then
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                elseif inst.sg.statemem.ischop then
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
                end
            end),
            TimeEvent(7 * FRAMES, function(inst)
                if inst.sg.statemem.ismoose then
					if inst.sg.statemem.ismoosesmash then
						inst:PushMooseSmashShake()

						--V2C: first frame is blank, so no need to worry about forcing instant facing update
						local x, y, z = inst.Transform:GetWorldPosition()
						local fx = SpawnPrefab("weremoose_smash_fx")
						fx.Transform:SetPosition(x, 0, z)
						fx.Transform:SetRotation(inst.Transform:GetRotation())
					end
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
            TimeEvent(8 * FRAMES, function(inst)
                if not (inst.sg.statemem.isbeaver or
                        inst.sg.statemem.ismoose or
                        inst.sg.statemem.iswhip or
						inst.sg.statemem.ispocketwatch or
                        inst.sg.statemem.isbook) and
                    inst.sg.statemem.projectiledelay == nil then
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
            TimeEvent(10 * FRAMES, function(inst)
                if inst.sg.statemem.iswhip or inst.sg.statemem.isbook or inst.sg.statemem.ispocketwatch then
                    inst:ClearBufferedAction()
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),
            TimeEvent(17*FRAMES, function(inst)
				if inst.sg.statemem.ispocketwatch then
                    inst.SoundEmitter:PlaySound(inst.sg.statemem.ispocketwatch_fueled and "wanda2/characters/wanda/watch/weapon/pst_shadow" or "wanda2/characters/wanda/watch/weapon/pst")
                end
            end),
        },

        ontimeout = function(inst)
            inst.sg:RemoveStateTag("attack")
            inst.sg:AddStateTag("idle")
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
			if inst.sg:HasStateTag("abouttoattack") then
                inst.replica.combat:CancelAttack()
            end
        end,
    }
)

