---@diagnostic disable: lowercase-global, undefined-global, trailing-space

GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

---@type string
local modid = 'magellan_remake' -- 定义唯一modid

---@type LAN_TOOL_COORDS
COORDS_magellan_remake = require('core_'..modid..'/utils/coords')
---@type LAN_TOOL_SUGARS
SUGAR_magellan_remake = require('core_'..modid..'/utils/sugar')

rawset(GLOBAL,'COORDS_magellan_remake',COORDS_magellan_remake)
rawset(GLOBAL,'SUGAR_magellan_remake',SUGAR_magellan_remake)

PrefabFiles = {
	-- 'magellan_remake_module_buffs',
	-- 'magellan_remake_module_dishes',
	-- 'magellan_remake_module_particle',
	"mgl_book1", 
	"mgl_book2",
	"mgl_mobilecharger",
	"mgl_mapper",
	"mgl_mapper_fx",
	"mgl_proj",
	"mgl_chargerfuel",
	"mgl_uav_item",
	"mgl_uav",
	"mgl_fx",
	"mgl_uav_lrbd_charge",
	"mgl_uav_armed_charge",
	"mgl_d99",
	"mgl_module1", 
	"mgl_module2",
	"mgl_blackhole_protocol",
	"mgl_science_terminal",
}

---@type asset[]
Assets = {
	Asset("SOUNDPACKAGE", "sound/mgl_audio.fev"), 
	Asset("SOUND", "sound/mgl_audio_bank01.fsb"),
	Asset("ANIM", "anim/mgl_collapseui.zip")
}
-- 导入mod配置
for _,v in ipairs({
	'_lang',
	'_key_light',
	'_key_call_uav',
	'_key_mgl_skill',
	'_key_mgl_change_uav',
	-- '_enable_blackhole_protocol',
	'_skill2_atk_speed',
	'_skill3_dmg_multiplier',
	'_enable_zoumadeng_sound',
	'_player_skill_volume',
	'_uav_hit_volume',
}) do TUNING[string.upper('CONFIG_'..modid..v)] = GetModConfigData(modid..v) end


-- 导入常量表
modimport('scripts/core_'..modid..'/data/tuning.lua')

-- 导入工具
modimport('scripts/core_'..modid..'/utils/_register.lua')

-- 导入功能API
modimport('scripts/core_'..modid..'/api/_register.lua')

-- 导入语言文件
modimport('scripts/core_'..modid..'/languages/'..TUNING[string.upper('CONFIG_'..modid..'_LANG')]..'.lua')

-- 导入人物
modimport('scripts/data_avatar/data_avatar_mgl.lua')

-- 导入调用器
modimport('scripts/core_'..modid..'/callers/caller_attackperiod.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_badge.lua')
modimport('scripts/core_'..modid..'/callers/caller_ca.lua')
modimport('scripts/core_'..modid..'/callers/caller_changeactionsg.lua')
modimport('scripts/core_'..modid..'/callers/caller_container.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_dish.lua')
modimport('scripts/core_'..modid..'/callers/caller_keyhandler.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_onlyusedby.lua')
modimport('scripts/core_'..modid..'/callers/caller_recipes.lua')
-- modimport('scripts/core_'..modid..'/callers/caller_stack.lua')


-- 导入零散功能模块 (自用 可以无视)
modimport('scripts/core_'..modid..'/managers/mgl_item_undrop.lua')
-- modimport('scripts/core_'..modid..'/managers/atk_speed_from_alt.lua') -- 功能(无需修改): alt写的修改攻速模块
-- modimport('scripts/core_'..modid..'/managers/bugfix_aoetargeting.lua') -- 当你使用官方组件来写技能时,貌似会因为没有正确移除 reticule 组件,导致玩家的轮盘施法放不出来,本文件就是用来修复这个bug的
-- modimport('scripts/core_'..modid..'/managers/bugfix_souljump.lua') -- 当你使用官方组件来写武器技能时, 会导致和 小恶魔的灵魂跳跃 冲突, 具体我忘了, 总之这个文件就是用来修复这个bug的
modimport('scripts/core_'..modid..'/managers/build_data_transfer.lua') -- 功能(需要填写): 制作物品过程涉及数据传输
-- modimport('scripts/core_'..modid..'/managers/cantequip_whennodurability.lua') -- 功能(无需修改): 本文件用来管理,装备耐久用尽时的逻辑
-- modimport('scripts/core_'..modid..'/managers/cd_in_itemtile.lua') -- 功能(无需修改): 在物品栏以数字形式显示的cd
modimport('scripts/core_'..modid..'/managers/dmg_sys.lua') -- 管理: 用这个文件管理伤害处理吧
-- modimport('scripts/core_'..modid..'/managers/event_hook.lua') -- 功能(需要填写): 勾 event
-- modimport('scripts/core_'..modid..'/managers/invincible.lua') -- 功能(无需修改): 设置无敌的
-- modimport('scripts/core_'..modid..'/managers/is_mod_enabled.lua') -- 功能(无需修改): 判断某个mod有没有开启 的前置
-- modimport('scripts/core_'..modid..'/managers/last_atk_weapon.lua') -- 功能(无需修改): 获取攻击者上次使用的武器
modimport('scripts/core_'..modid..'/managers/participate_kill.lua') -- 功能(无需修改): 联合击杀(参与击杀), 判断生物死亡时, 某个玩家有没有贡献伤害(参与战斗)
-- modimport('scripts/core_'..modid..'/managers/quick_announce.lua') -- 功能(需要填写): alt + 左键点击库存物品宣告
-- modimport('scripts/core_'..modid..'/managers/sort_recipes.lua') -- 功能(需要填写): 给配方排序
modimport('scripts/core_'..modid..'/managers/mgl_monkey_curse_immunity.lua') -- 猴子诅咒免疫功能


-- 导入UI
modimport "scripts/core_magellan_remake/widgets/magellan_registered.lua"
-- 注册客机组件
-- 注册任务系统组件为可复制组件
--任务系统开关
-- AddReplicableComponent("mgl_task_system")

-- 只在黑洞协议开启时注册mgl_collapse_value组件
-- local enable_blackhole = SUGAR_magellan_remake:getModConfigDataFromTUNING("_enable_blackhole_protocol")
-- if enable_blackhole then
--     AddReplicableComponent("mgl_collapse_value")
-- end

-- 导入钩子 It's my勾
---@type string[]
local files_hook = {
	'mgl_level',
	'mgl_sg',
}
for _,v in ipairs(files_hook) do
	modimport('scripts/core_'..modid..'/hooks/'..v..'.lua')
end

--修改企鹅检查组件，当玩家检查企鹅时，播放语音
local function AddPenguinInspectSound(prefab_name)
	AddPrefabPostInit(prefab_name, function(inst)
		if not TheWorld.ismastersim then
			return
		end
		
		-- 检查是否已经有 OnInspect 组件
		local old_OnInspect = inst.components.inspectable.getstatus
		if old_OnInspect then
			inst.components.inspectable.getstatus = function(self, viewer)
				-- 确保viewer是有效实体且具有SoundEmitter组件和mgl标签
				if viewer and viewer:IsValid() and viewer.SoundEmitter and viewer:HasTag("mgl") then
					viewer.SoundEmitter:PlaySound("mgl_audio/mgl_audio/gugugaga")
				end
				-- 调用原有的检查函数
				return old_OnInspect(self, viewer)
			end
		end
	end)
end

-- 添加普通企鹅和月岩企鹅的检查语音
AddPenguinInspectSound("penguin") -- 普通企鹅
AddPenguinInspectSound("mutated_penguin") -- 月岩企鹅

-- --任务系统开关
-- -- 注册RPC函数，用于客户端提交任务
-- AddModRPCHandler("magellan_remake", "SubmitTask", function(player, task_id)
--     -- print("服务器接收到RPC任务提交请求，任务ID:", task_id, "玩家:", player)
--     -- 检查玩家实体和任务系统组件是否存在
--     if player and player:IsValid() and player.components and player.components.mgl_task_system then
--         -- print("玩家实体上存在任务系统组件，正在提交任务")
--         player.components.mgl_task_system:SubmitTask(player, task_id)
--     end
-- end)
-- --任务系统开关
-- -- 注册RPC函数，用于客户端购买商店物品
-- AddModRPCHandler("magellan_remake", "BuyShopItem", function(player, item_id)
--     -- 检查玩家实体和任务系统组件是否存在
--     if player and player:IsValid() and player.components and player.components.mgl_task_system then
--         player.components.mgl_task_system:BuyShopItem(player, item_id)
--     end
-- end)

-- 注册UI按钮相关的RPC函数
AddModRPCHandler(modid, "UseSkill", function(player) 
    if player and player:IsValid() and player.components and player.components.mgl_system then 
        player.components.mgl_system:UseSkill() 
    end 
end)

AddModRPCHandler(modid, "ChangeUav", function(player) 
    if player and player:IsValid() and player.components and player.components.mgl_system then 
        player.components.mgl_system:ChangeUav() 
    end 
end)

AddModRPCHandler(modid, "CallUav", function(player) 
    if player and player:IsValid() and player.components and player.components.mgl_system then 
        player.components.mgl_system:CallUav() 
    end 
end)

AddModRPCHandler(modid, "RecallUav", function(player) 
    if player and player:IsValid() and player.components and player.components.mgl_system then 
        player.components.mgl_system:RemoveFollower() 
    end 
end)
