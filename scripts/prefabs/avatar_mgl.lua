---@diagnostic disable: undefined-global, inject-field

local MakePlayerCharacter = require 'prefabs/player_common'

local avatar_name = 'mgl'
local assets = {
	Asset('SCRIPT', 'scripts/prefabs/player_common.lua'),
	Asset('ANIM', 'anim/'..avatar_name..'.zip'),
	Asset('ANIM', 'anim/ghost_'..avatar_name..'_build.zip'),
	Asset("ANIM", "anim/mgl_act.zip"),
}

local prefabs = {}

local start_inv = {}
-- for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
-- 	start_inv[string.lower(k)] = v[string.upper(avatar_name)]
-- end
start_inv['default'] = {}
for k,v in pairs(TUNING.MGL_CUSTOM_START_INV) do
	for i = 1, v.num do 
		table.insert(start_inv['default'], k)
	end
end
for k = 1, 4 do
    table.insert(assets, Asset("ATLAS", "images/inventoryimages/mgl_skill" .. k .. ".xml"))
end

prefabs = FlattenTree({ prefabs, start_inv }, true)
---------------------------------------------------------------------------
---------------------------------------------------------------------------
local function onbecamehuman(inst, data, isloading)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, avatar_name..'_speed_mod', 1)
end

local function onbecameghost(inst, data)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, avatar_name..'_speed_mod')
	if inst.components.mgl_system then
		inst.components.mgl_system:RemoveFollower()
	end
end
---------------------------------------------------------------------------
---------------------------------------------------------------------------
local function onload(inst,data)
	inst:ListenForEvent('ms_respawnedfromghost', onbecamehuman)
	inst:ListenForEvent('ms_becameghost', onbecameghost)

	if inst:HasTag('playerghost') then
		onbecameghost(inst)
	else
		onbecamehuman(inst)
	end
end
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- 主/客机
local common_postinit = function(inst)
	inst:AddTag(avatar_name)
	inst.uav_type = net_smallbyte(inst.GUID, "uav_type")
	inst.uav_type:set(1)
	inst.MiniMapEntity:SetIcon(avatar_name..'.tex')
end
-- 主机
local master_postinit = function(inst)	
	inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	inst.soundsname = 'wendy'

	inst:AddComponent("mgl_system")
	
	-- 探索者：受到夜晚和疯狂光环的效果减弱 25%（类似温蒂）
	inst.components.sanity.night_drain_mult = TUNING.WENDY_SANITY_MULT
    inst.components.sanity.neg_aura_mult = TUNING.WENDY_SANITY_MULT

	--企鹅：耐寒（抗寒装备属性的利用率+100点，参考韦斯-30点）
	inst.components.temperature.inherentinsulation = 100
	--移除滑倒
	inst:RemoveComponent("slipperyfeet")

	--力弱：锤击的工作效率降低至原本的0.75倍。（参考旺达老年）
	inst:AddTag("slowbuilder")
    inst.components.workmultiplier:AddMultiplier(ACTIONS.HAMMER, TUNING.WANDA_OLD_HAMMER_EFFECTIVENESS, inst)

	--食物链：吃鱼及其相关的大部分料理的亲和度为1.33倍，特别中意酸橘汁腌鱼
	local foodaffinity = inst.components.foodaffinity
    foodaffinity:AddPrefabAffinity  ("fishmeat_small",             1.33)
	foodaffinity:AddPrefabAffinity  ("fishmeat_small_cooked",             1.33)
	foodaffinity:AddPrefabAffinity  ("fishmeat",             1.33)
	foodaffinity:AddPrefabAffinity  ("fishmeat_cooked",             1.33)
	foodaffinity:AddPrefabAffinity  ("eel",             1.33)
	foodaffinity:AddPrefabAffinity  ("eel_cooked",             1.33)
	foodaffinity:AddPrefabAffinity  ("fishtacos",             1.33)
	foodaffinity:AddPrefabAffinity  ("fishsticks",             1.33)
	foodaffinity:AddPrefabAffinity  ("unagi",             1.33)
	foodaffinity:AddPrefabAffinity  ("seafoodgumbo",             1.33)
	foodaffinity:AddPrefabAffinity  ("ceviche",             2)
	foodaffinity:AddPrefabAffinity  ("californiaroll",             1.33)
	foodaffinity:AddPrefabAffinity  ("surfnturf",             1.33)
	foodaffinity:AddPrefabAffinity  ("frogfishbowl",             1.33)
	foodaffinity:AddPrefabAffinity  ("moqueca",             1.33)
	foodaffinity:AddPrefabAffinity  ("barnaclestuffedfishhead",             1.33)

	inst.components.health:SetMaxHealth(TUNING[string.upper(avatar_name)..'_HEALTH'])
	inst.components.hunger:SetMax(TUNING[string.upper(avatar_name)..'_HUNGER'])
	inst.components.sanity:SetMax(TUNING[string.upper(avatar_name)..'_SANITY'])
	
	inst.OnLoad = onload
	inst.OnNewSpawn = onload
end
-- 人物皮肤
local function MakeMGLSkin(name, data, notemp, free)
	local d = {}
	d.rarity = '典藏'
	d.rarityorder = 2
	d.raritycorlor = { 0 / 255, 255 / 255, 249 / 255, 1 }
	d.release_group = -1001
	d.skin_tags = { 'BASE', avatar_name, 'CHARACTER' }
	d.skins = {
		normal_skin = name,
		ghost_skin = 'ghost_'..avatar_name..'_build'
	}
	if not free then
		d.checkfn = MGL_API.MGLSkinCheckFn
		d.checkclientfn = MGL_API.MGLSkinCheckFn
	end
	d.share_bigportrait_name = avatar_name
	d.FrameSymbol = 'Reward'
	for k, v in pairs(data) do
		d[k] = v
	end
	MGL_API.MakeCharacterSkin(avatar_name, name, d)
	if not notemp then
		local d2 = shallowcopy(d)
		d2.rarity = '限时体验'
		d2.rarityorder = 80
		d2.raritycorlor = { 0.957, 0.769, 0.188, 1 }
		d2.FrameSymbol = 'heirloom'
		d2.name = data.name .. '(限时)'
		MGL_API.MakeCharacterSkin(avatar_name, name .. '_tmp', d2)
	end
end
function MakeMGLFreeSkin(name, data)
	MakeMGLSkin(name, data, true, true)
end

MakeMGLFreeSkin(avatar_name..'_none', {
	name = '麦哲伦', -- 皮肤的名称
	des = '', -- 皮肤界面的描述
	quotes = '', -- 选人界面的描述
	rarity = '典藏', -- 珍惜度 官方不存在的珍惜度则直接覆盖字符串
	rarityorder = 2, -- 珍惜度的排序 用于按优先级排序 基本没啥用
	raritycorlor = { 189 / 255, 73 / 255, 73 / 255, 1 }, -- {R,G,B,A}
	skins = { normal_skin = avatar_name, ghost_skin = 'ghost_'..avatar_name..'_build' },
	build_name_override = avatar_name,
	share_bigportrait_name = avatar_name..'_none',
})


return MakePlayerCharacter(avatar_name, prefabs, assets, common_postinit, master_postinit, prefabs)