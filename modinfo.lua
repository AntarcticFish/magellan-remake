---@diagnostic disable: lowercase-global, undefined-global, trailing-space
-- 本地化
local op={{'A',97},{'B',98},{'C',99},{'D',100},{'E',101},{'F',102},{'G',103},{'H',104},{'I',105},{'J',106},{'K',107},{'L',108},{'M',109},{'N',110},{'O',111},{'P',112},{'Q',113},{'R',114},{'S',115},{'T',116},{'U',117},{'V',118},{'W',119},{'X',120},{'Y',121},{'Z',122},{'0',48},{'1',49},{'2',50},{'3',51},{'4',52},{'5',53},{'6',54},{'7',55},{'8',56},{'9',57}}
local modid = 'magellan_remake'
local LANGS = {
    ['zh'] = {
        name = '明日方舟 麦哲伦',
        description = '麦哲伦同人模组\n游戏中技能UI右键按住可拖拽\n技能按键可进入设置自行调整\n\n模组后续会有新的更新内容，有好的想法可进群交流\nBug反馈及交流Q群:763944960',
        config = {
            {'语言'},
            {modid..'_lang','语言','语言','cn',{
                {'简体中文','cn'},
                {'English','en'}
            }},
            {'功能'},
            {modid..'_key_light','测绘仪照明开关','测绘仪照明开',118,op},
            {modid..'_key_call_uav','召唤无人机按键','召唤无人机按键',122,op},
            {modid..'_key_mgl_skill','开启技能按键','开启技能按键',120,op},
            {modid..'_key_mgl_change_uav','切换无人机类型按键','切换无人机类型按键',114,op},
            -- {modid..'_enable_blackhole_protocol','是否启用黑洞协议','是否启用黑洞协议',false,{
            --     {'禁用',false},
            --     {'启用',true}
            -- }},
            {'技能参数'},
            {modid..'_skill2_atk_speed','2技能攻速缩减倍率(乘算)','2技能攻速缩减倍率(精一/精二)',0.5,{
                {'0.4x/0.5x(默认)',0.5},
                {'0.5x/0.6x',0.6},
                {'0.6x/0.7x',0.7},
                {'0.7x/0.8x',0.8}
            }},
            {modid..'_skill3_dmg_multiplier','3技能伤害倍率(乘算)','3技能伤害倍率(乘算)',2.5,{
                {'1.5x',1.5},
                {'1.75x',1.75},
                {'2x',2},
                {'2.25x',2.25},
                {'2.5x(默认)',2.5}
            }}
        }
    },
    --英文
    ['en'] = {
        name = 'Arknights Magallan',
        description = 'Magallan in Arknights.\n\nGameplay skills can be activated by right-clicking and dragging.\nSkill keys can be customized in the settings.\n\nFuture updates will include new features.\nFor any ideas or bug reports, please leave a message on the workshop page.',
        config = {
            {'Language'},
            {modid..'_lang','Language','Language','en',{
                {'Simplified Chinese','cn'},
                {'English','en'}
            }},
            {'Functions'},
            {modid..'_key_light','Surveyor Light Toggle','Surveyor light on',118,op},
            {modid..'_key_call_uav','UAV Summon Key','UAV summon key',122,op},
            {modid..'_key_mgl_skill','Skill Activation Key','Skill activation key',120,op},
            {modid..'_key_mgl_change_uav','UAV Type Switch Key','UAV type switch key',114,op},
            -- {modid..'_enable_blackhole_protocol','Enable Blackhole Protocol','Enable blackhole protocol',false,{
            --     {'Disabled',false},
            --     {'Enabled',true}
            -- }},
            {'Skill Parameters'},
            --英文
            {modid..'_skill2_atk_speed','Skill 2 Attack Speed Multiplier()','Skill 2 attack speed multiplier(Elite 1/Elite 2)',0.5,{
                {'0.4x/0.5x(Default)',0.5},
                {'0.5x/0.6x',0.6},
                {'0.6x/0.7x',0.7},
                {'0.7x/0.8x',0.8}
            }},
            --英文
            {modid..'_skill3_dmg_multiplier','Skill 3 Damage Multiplier(Multiplicative)','Skill 3 damage multiplier(Multiplicative)',2.5,{
                {'1.5x',1.5},
                {'1.75x',1.75},
                {'2x',2},
                {'2.25x',2.25},
                {'2.5x(Default)',2.5}
            }}
        }
    },
}

-- 决定当前用的语言
local cur = (locale == 'zh' or locale == 'zhr') and 'zh' or 'en'

-- mod相关信息
version = '1.0.3'
author = '玄百秋 & Cues & 亚特兰蒂斯的一条鱼'
forumthread = ''
api_version = 10
priority = 0 -- 加载优先级，越低加载越晚，默认为0

dst_compatible = true -- 联机版适配性
dont_starve_compatible = false -- 单机版适配性
reign_of_giants_compatible = false -- 单机版：巨人国适配性
all_clients_require_mod = true -- 服务端/所有端模组
-- server_only_mod = true -- 仅服务端模组
-- client_only_mod = true -- 仅客户端模组
server_filter_tags = {
    "明日方舟麦哲伦",
    "明日方舟",
    "麦哲伦",
} -- 创意工坊模组分类标签
icon_atlas = 'modicon.xml' -- 图集
icon = 'modicon.tex' -- 图标

-- 以下自动配置
name = LANGS[cur].name
description = 'version:'..version..'\n'..LANGS[cur].description

-- local op = {
--     {description='A', data = 97},
--     {description='B', data = 98},
--     {description='C', data = 99},
--     {description='D', data = 100},
--     {description='E', data = 101},
--     {description='F', data = 102},
--     {description='G', data = 103},
--     {description='H', data = 104},
--     {description='I', data = 105},
--     {description='J', data = 106},
--     {description='K', data = 107},
--     {description='L', data = 108},
--     {description='M', data = 109},
--     {description='N', data = 110},
--     {description='O', data = 111},
--     {description='P', data = 112},
--     {description='Q', data = 113},
--     {description='R', data = 114},
--     {description='S', data = 115},
--     {description='T', data = 116},
--     {description='U', data = 117},
--     {description='V', data = 118},
--     {description='W', data = 119},
--     {description='X', data = 120},
--     {description='Y', data = 121},
--     {description='Z', data = 122},

--     {description='0', data = 48},
--     {description='1', data = 49},
--     {description='2', data = 50},
--     {description='3', data = 51},
--     {description='4', data = 52},
--     {description='5', data = 53},
--     {description='6', data = 54},
--     {description='7', data = 55},
--     {description='8', data = 56},
--     {description='9', data = 57},
-- }

local config = LANGS[cur].config or {}
local _configuration_options = {}
for i = 1, #config do
    local options = {}
    if config[i][5] then
        for k = 1, #config[i][5] do
            options[k] = {description = config[i][5][k][1], data = config[i][5][k][2]}
        end
    end
    _configuration_options[i] = {
        name = config[i][1],
        label = config[i][2],
        hover = config[i][3] or '',
        default = config[i][4] or false,
        options = #options>0 and options or {{description = "", data = false}},
    }
end

configuration_options = _configuration_options