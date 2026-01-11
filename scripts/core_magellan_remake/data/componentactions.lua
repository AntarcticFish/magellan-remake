---@type data_componentaction[]
local data = {
    -- 官方的三个组件的修理, finiteuses armor fueled, 给一堆物品时, 尽可能多的消耗物品来修理, 具体数据只需填进 `TUNING.MOD_MAGELLAN_REMAKE.REPAIR_COMMON`, 此处逻辑不用动
    {
        id = 'ACTION_COMMON_REPAIR',
        str = STRINGS.MOD_MAGELLAN_REMAKE.ACTIONS.ACTION_COMMON_REPAIR,
        fn = function (act)
            local doer,item,target = act.doer,act.invobject,act.target
            if doer and item and target and doer:IsValid() and item:IsValid() and target:IsValid() then
                local compo = TUNING.MOD_MAGELLAN_REMAKE.REPAIR_COMMON[target.prefab].type
                local repair_percent = item.prefab and TUNING.MOD_MAGELLAN_REMAKE.REPAIR_COMMON[target.prefab].repair_percent[item.prefab]
                local cur_percent = target.components[compo] and target.components[compo]:GetPercent()
                if repair_percent and cur_percent then
                    if doer and doer.SoundEmitter then
                        local prefab = item.prefab
                        local sound = (prefab == 'nightmarefuel' or prefab == 'horrorfuel') and 'dontstarve/common/nightmareAddFuel' or 'aqol/new_test/metal'
                        doer.SoundEmitter:PlaySound(sound)
                    end

                    local new_percent = math.min(1,cur_percent + repair_percent)
                    target.components[compo]:SetPercent(new_percent)
                    SUGAR_magellan_remake:consumeOneItem(item)

                    while item and item:IsValid() and (target.components[compo]:GetPercent() + repair_percent) <= 1 do
                        local _cur_percent = target.components[compo]:GetPercent()
                        local _new_percent = math.min(1,_cur_percent + repair_percent)
                        target.components[compo]:SetPercent(_new_percent)
                        SUGAR_magellan_remake:consumeOneItem(item)
                    end

                    if target:HasTag(target.prefab..'_nodurability') then
                        target:RemoveTag(target.prefab..'_nodurability')
                    end
                    return true
                end
            end
            return false
        end,
        state = 'give',
        actiondata = {
            mount_valid = true,
            priority = 5,
        },
        type = "USEITEM",
        component = 'inventoryitem',
        testfn_type_USEITEM = function (inst, doer, target, actions, right)
            if right and doer:HasTag("player") and target.prefab and TUNING.MOD_MAGELLAN_REMAKE.REPAIR_COMMON[target.prefab] then
                local canrepair = inst and inst.prefab and TUNING.MOD_MAGELLAN_REMAKE.REPAIR_COMMON[target.prefab].repair_percent[inst.prefab]
                if canrepair then
                    return true
                end
            end
            return false
        end
    },
    {
        id = 'MGL_ITEM_FN',
        str = STRINGS.MGL_ITEM_FN,
        fn = function (act)
            local item = act.invobject
            if item and item.components.mgl_itemfn ~= nil then
                item.components.mgl_itemfn:RunningFunction(act.doer)
            end
            return true
        end,
        state = 'book',
        actiondata = {
            priority = 5,
        },
        type = "INVENTORY",
        component = 'mgl_itemfn',
        testfn_type_INVENTORY = function (inst, doer, actions, right)
            return true
        end
    },
    {
        id = 'MGL_ITEM_FN_CASTSPELL',
        str = STRINGS.MGL_ITEM_FN_CASTSPELL,
        fn = function (act)
            local item = act.invobject
            if item and item.components.mgl_itemfn_castspell ~= nil then
                item.components.mgl_itemfn_castspell:RunningFunction(act.doer)
            end
            return true
        end,
        state = 'castspell',
        actiondata = {
            priority = 5,
        },
        type = "INVENTORY",
        component = 'mgl_itemfn_castspell',
        testfn_type_INVENTORY = function (inst, doer, actions, right)
            return true
        end
    },
}

---@type data_componentaction_change[]
local change = {
    {
        type = "SCENE",
        component = 'machine',
        testfn = function (old_fn, ...)
            local inst = select(1, ...)
            local doer = select(2, ...)
            if inst:HasTag('mgl_mapper_structure') then
                --按住alt键使用
                if doer.components.playercontroller ~= nil and
                    doer.components.playercontroller:IsControlPressed(CONTROL_FORCE_INSPECT) then
                    return old_fn(...)
                end
                return false
            end
            return old_fn(...)
        end
    }
}

return data,change