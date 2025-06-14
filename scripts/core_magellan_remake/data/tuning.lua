TUNING.MOD_MAGELLAN_REMAKE = {
    ---@type table<PrefabID,{type: 'finiteuses'|'armor'|'fueled', repair_percent: table<PrefabID,number>, cantequip_whennodurability: boolean|nil, autounequip_whennodurability: boolean|nil}>
    REPAIR_COMMON = { -- 官方的三个组件的修理, finiteuses armor fueled, 给一堆物品时, 尽可能多的消耗物品来修理
        -- spear = {
        --     type = 'finiteuses', -- 组件ID
        --     repair_percent = { -- 键为物品prefabID, 值为修理百分比
        --         flint = .2,
        --     },
        --     cantequip_whennodurability = false, -- 是否在耐久用尽时不允许装备,如果你得物品在耐久耗尽时,就直接被移除了,这个就不用填了,只有在耐久用尽,要保留物品时才填这个
        --     autounequip_whennodurability = false, -- 是否在耐久用尽时自动卸下到库存中
        -- },
    },
    ATK_SPEED_ALT = 1, -- alt写的加攻速模块所用的参数,默认1,更改这个参数,来改变攻速
}