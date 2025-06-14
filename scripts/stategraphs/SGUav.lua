require("stategraphs/commonstates")

local exclude_tags = { "INLIMBO", "companion", "wall", "abigail", "wall", "player", "INLIMBO" }

local function TryRepeatAction(inst, buffaction, right)
    if buffaction ~= nil and
        buffaction:IsValid() and
        buffaction.target ~= nil and
        buffaction.target.components.workable ~= nil and
        buffaction.target.components.workable:CanBeWorked() and
        buffaction.target:IsActionValid(buffaction.action, right)
    then
        local otheraction = inst:GetBufferedAction()
        if otheraction == nil or (
                otheraction.target == buffaction.target and
                otheraction.action == buffaction.action
            ) then
            if inst.components.follower.leader and inst.components.follower.leader.components.mgl_system then
                inst.components.follower.leader.components.mgl_system.mgl_uav_item.components.finiteuses:Use((40 * 480 * 0.005))
            end
            inst.components.locomotor:Stop()
            inst:ClearBufferedAction()
            inst:PushBufferedAction(buffaction)
            return true
        end
    end
    return false
end

local actionhandlers =
{
    ActionHandler(ACTIONS.CHOP, "chop"),
    ActionHandler(ACTIONS.MINE, "mine"),
    ActionHandler(ACTIONS.DIG, "dig"),
    ActionHandler(ACTIONS.PICK, "doshortaction"),
    ActionHandler(ACTIONS.PICKUP, "doshortaction"),
    ActionHandler(ACTIONS.HARVEST, "dolongaction"),
}

local events =
{
    CommonHandlers.OnLocomote(true, false),
    CommonHandlers.OnAttacked(),
    CommonHandlers.OnDeath(),
    -- CommonHandlers.OnAttack(),

    EventHandler("doattack", function(inst) --可以进行普通攻击时，收到这个事件
        --local age = inst.components.age and inst.components.age:GetAgeInDays() or 0  inst))))
        if not inst.sg:HasStateTag("busy") and inst.attack then
            inst.sg:GoToState("attack", inst.components.combat.target)
        end
    end),
    EventHandler("doaction", function(inst, data)
        if data.action == ACTIONS.CHOP and not (inst.sg:HasStateTag("busy") or inst.components.health:IsDead()) then
            inst.sg:GoToState("chop", data.target)
        end
    end),
}

local states =
{
    State {
        name = "enter",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("enter")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State {
        name = "disappear",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("disappear")
            inst:ListenForEvent("animover", inst.Remove)
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst:Remove()
                end
            end),
        },
    },

    State {
        name = "idle",
        tags = { "idle", "canrotate" },

        onenter = function(inst, pushanim)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("idle", true)
        end,
    },

    State {
        name = "doshortaction",
        tags = { "doing", "busy" },

        onenter = function(inst, silent)
            inst.components.locomotor:Stop()
            inst.sg.statemem.action = inst.bufferedaction
            inst.sg.statemem.silent = silent
            inst.sg:SetTimeout(10 * FRAMES)
        end,

        timeline =
        {
            TimeEvent(6 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                if inst.sg.statemem.silent then
                    inst.components.talker:IgnoreAll("silentpickup")
                    inst:PerformBufferedAction()
                    inst.components.talker:StopIgnoringAll("silentpickup")
                else
                    inst:PerformBufferedAction()
                end
            end),
        },

        ontimeout = function(inst)
            --pickup_pst should still be playing
            inst.sg:GoToState("idle", true)
        end,

        onexit = function(inst)
            if inst.bufferedaction == inst.sg.statemem.action then
                inst:ClearBufferedAction()
            end
        end,
    },

    State {
        name = "dolongaction",
        tags = { "doing", "busy", "nodangle" },

        onenter = function(inst)
            inst.sg:SetTimeout(1)
            inst.components.locomotor:Stop()
            inst.SoundEmitter:PlaySound("dontstarve/wilson/make_trap", "make")
        end,

        timeline =
        {
            TimeEvent(4 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },

        ontimeout = function(inst)
            inst.SoundEmitter:KillSound("make")
            inst:PerformBufferedAction()
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
            inst.SoundEmitter:KillSound("make")
            inst:ClearBufferedAction()
        end,
    },

    State {
        name = "run_start",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            --inst.AnimState:PlayAnimation("run_pre")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("run")
                end
            end),
        },
    },

    State {
        name = "run",
        tags = { "moving", "running", "canrotate" },

        onenter = function(inst)
            inst.components.locomotor:RunForward()
            --inst.AnimState:PlayAnimation("run_loop", true)

            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("run")
        end,
    },

    State {
        name = "run_stop",
        tags = { "canrotate", "idle" },

        onenter = function(inst)
            inst.Physics:Stop()
            --inst.AnimState:PlayAnimation("run_pst")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State {
        name = "attack",
        tags = { "attack", "notalking", "abouttoattack", "busy" },

        onenter = function(inst)
            inst.sg.statemem.target = inst.components.combat.target
            inst.components.combat:StartAttack()
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("attack")

            inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_nightsword")

            if inst.components.combat.target ~= nil and inst.components.combat.target:IsValid() then
                inst:FacePoint(inst.components.combat.target.Transform:GetWorldPosition())
            end
        end,

        timeline =
        {

            TimeEvent(4 * FRAMES, function(inst)
                if inst:HasTag("Skill_X") then
                    inst.components.combat:DoAttack(inst.sg.statemem.target)
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),

            TimeEvent(5 * FRAMES, function(inst)
                if inst:HasTag("Skill_X") then
                    inst.sg:RemoveStateTag("busy")
                end
            end),

            TimeEvent(6 * FRAMES, function(inst)
                if inst:HasTag("Skill_X") then
                    inst.sg:RemoveStateTag("attack")
                end
            end),
            -----
            TimeEvent(8 * FRAMES, function(inst)
                if not inst:HasTag("Skill_X") then
                    inst.components.combat:DoAttack(inst.sg.statemem.target)
                    inst.sg:RemoveStateTag("abouttoattack")
                end
            end),

            TimeEvent(10 * FRAMES, function(inst)
                if not inst:HasTag("Skill_X") then
                    inst.sg:RemoveStateTag("busy")
                end
            end),

            TimeEvent(11 * FRAMES, function(inst)
                if not inst:HasTag("Skill_X") then
                    inst.sg:RemoveStateTag("attack")
                end
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State {
        name = "death",
        tags = { "busy" },

        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:Hide("swap_arm_carry")
            inst.AnimState:PlayAnimation("death")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    local x, y, z = inst.Transform:GetWorldPosition()
                    SpawnPrefab("shadow_despawn").Transform:SetPosition(x, y, z)
                    SpawnPrefab("statue_transition_2").Transform:SetPosition(x, y, z)
                    inst:Remove()
                end
            end),
        },
    },

    State {
        name = "hit",
        tags = { "busy" },

        onenter = function(inst)
            inst:ClearBufferedAction()
            inst.Physics:Stop()
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        timeline =
        {
            TimeEvent(3 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },
    },

    State {
        name = "stunned",
        tags = { "busy", "canrotate" },

        onenter = function(inst)
            inst:ClearBufferedAction()
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("idle_sanity_pre")
            inst.AnimState:PushAnimation("idle_sanity_loop", true)
            inst.sg:SetTimeout(5)
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("idle")
        end,
    },

    State {
        name = "chop",
        tags = { "prechop", "chopping", "working" },

        onenter = function(inst)
            inst.sg.statemem.action = inst:GetBufferedAction()
            inst.AnimState:PlayAnimation("attack")
        end,

        timeline =
        {
            TimeEvent(2 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
            TimeEvent(14 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("prechop")
                TryRepeatAction(inst, inst.sg.statemem.action)
            end),
            TimeEvent(16 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("chopping")
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State {
        name = "mine",
        tags = { "premine", "mining", "working" },

        onenter = function(inst)
            local buffaction = inst:GetBufferedAction()
            inst.sg.statemem.target = buffaction ~= nil and buffaction.target or nil

            inst.AnimState:PlayAnimation("attack")

            if inst.components.follower.leader and inst.components.follower.leader.components.mgl_system then
                inst.components.follower.leader.components.mgl_system.mgl_uav_item.components.finiteuses:Use((40 * 480 * 0.005))
            end
        end,

        timeline =
        {
            TimeEvent(7 * FRAMES, function(inst)
                local buffaction = inst:GetBufferedAction()
                if buffaction ~= nil then
                    local target = buffaction.target
                    if target ~= nil and target:IsValid() then
                        if target.Transform ~= nil then
                            SpawnPrefab("mining_fx").Transform:SetPosition(target.Transform:GetWorldPosition())
                        end
                        inst.SoundEmitter:PlaySound(target:HasTag("frozen") and "dontstarve_DLC001/common/iceboulder_hit" or
                            "dontstarve/wilson/use_pick_rock")
                    end
                    inst:PerformBufferedAction()
                end
            end),

            TimeEvent(14 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("premine")
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle", true)
                end
            end),
        },
    },

    State {
        name = "dig",
        tags = { "predig", "digging", "working" },

        onenter = function(inst)
            local buffaction = inst:GetBufferedAction()
            inst.sg.statemem.target = buffaction ~= nil and buffaction.target or nil

            inst.AnimState:PlayAnimation("attack")

            if inst.components.follower.leader and inst.components.follower.leader.components.mgl_system then
                inst.components.follower.leader.components.mgl_system.mgl_uav_item.components.finiteuses:Use((40 * 480 * 0.005))
            end
        end,

        timeline =
        {
            TimeEvent(15 * FRAMES, function(inst)
                inst:PerformBufferedAction()
                inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
            end),

            TimeEvent(35 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("predig")
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle", true)
                end
            end),
        },
    },

    State {
        name = "dance",
        tags = { "idle", "dancing" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst:ClearBufferedAction()
            if inst.AnimState:IsCurrentAnimation("run_pst") then
                inst.AnimState:PushAnimation("emoteXL_pre_dance0")
            else
                inst.AnimState:PlayAnimation("emoteXL_pre_dance0")
            end
            inst.AnimState:PushAnimation("emoteXL_loop_dance0", true)
        end,
    },

    State {
        name = "jumpout",
        tags = { "busy", "canrotate", "jumping" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("jumpout")
            inst.Physics:SetMotorVel(4, 0, 0)
            inst.Physics:ClearCollisionMask()
            inst.Physics:CollidesWith(COLLISION.GROUND)
        end,

        timeline =
        {
            TimeEvent(10 * FRAMES, function(inst)
                inst.Physics:SetMotorVel(3, 0, 0)
            end),
            TimeEvent(15 * FRAMES, function(inst)
                inst.Physics:SetMotorVel(2, 0, 0)
            end),
            TimeEvent(15.2 * FRAMES, function(inst)
                inst.sg.statemem.physicson = true
                inst.Physics:ClearCollisionMask()
                inst.Physics:CollidesWith(COLLISION.WORLD)
                inst.Physics:CollidesWith(COLLISION.CHARACTERS)
                inst.Physics:CollidesWith(COLLISION.GIANTS)
            end),
            TimeEvent(17 * FRAMES, function(inst)
                inst.Physics:SetMotorVel(1, 0, 0)
            end),
            TimeEvent(18 * FRAMES, function(inst)
                inst.Physics:Stop()
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            if not inst.sg.statemem.physicson then
                inst.Physics:ClearCollisionMask()
                inst.Physics:CollidesWith(COLLISION.WORLD)
                inst.Physics:CollidesWith(COLLISION.CHARACTERS)
                inst.Physics:CollidesWith(COLLISION.GIANTS)
            end
        end,
    },
}

return StateGraph("uav", states, events, "idle", actionhandlers)
