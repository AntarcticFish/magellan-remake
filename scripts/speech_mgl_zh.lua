return { --台词

	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "呜啊！看来并不好用呢。",--触发拟态工具，使用拟态蠕虫模仿的物品时显形脱手
        },

        ACTIVATE =
        {
            LOCKED_GATE = "大门锁住啦。",--检查带锁物品
            HOSTBUSY = "鸦先生正在忙呢。",--良羽鸦忙碌
            CARNIVAL_HOST_HERE = "鸦先生已经在附近了。",--多次召唤良羽鸦，良羽鸦已经在树旁
            NOCARNIVAL = "鸦先生的庆典已经结束了。",--鸦年华结束，良羽鸦已离开
            EMPTY_CATCOONDEN = "小家伙的家里已经空空的了。",--浣猫窝里没东西
            KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "只有这么几只的话，游戏……咳，观察实验是做不起来的！",--躲猫猫小猫过少
            KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "这里太开阔了，一眼就能望到头，根本藏不住嘛。",--缺少藏身处
            KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "今天的游戏已经玩过啦！别累坏了身体哦~",--当天已玩过
            MANNEQUIN_EQUIPSWAPFAILED = "尺寸好像不太对？……唔，先记下来。",--假人穿戴失败
            PILLOWFIGHT_NO_HANDPILLOW = "没有枕头可怎么参加“软绵绵大乱斗”呀？",--枕头大战没枕头
            NOTMYBERNIE = "这是别人的玩偶，未经允许不能乱碰哦！",--安抚不是自己的伯尼
            NOTMERM = "鱼人先生好像只接受鱼人的邀请呢。",--雇佣鱼人失败
            NOKELP = "给鱼人先生的的礼物不够呢。",--雇佣鱼人材料不够
            HASMERMLEADER = "这位鱼人先生已经有指挥官啦。",--雇佣别人已雇佣的鱼人
        },
        APPLYELIXIR =
        {
            TOO_SUPER = "唔，这应该不是给我准备的。",--试图对自己使用灵魂药
            NO_ELIXIRABLE = "必须对准特定的目标才行！",--使用灵魂药缺少阿比花
        },
        APPLYMODULE =
        {
            COOLDOWN = "还在冷却呢！耐心点~",--插入CD中的电路模块时
            NOTENOUGHSLOTS = "再挤进去系统会过载冒烟的！",--插入电路时空间不足
        },
        APPRAISE =
        {
            NOTNOW = "评委正在忙呢。",--裁判正忙
        },
        ATTUNE =
        {
            NOHEALTH = "生命体征过低……现在做那个太危险了，会晕倒的！",--附身肉块雕像但血量不够
        },
        BATHBOMB =
        {
            GLASSED = "泉水表面结晶了！就像玻璃一样！",--投球失败-已满月结成玻璃
            ALREADY_BOMBED = "虽然我想多做几次实验，但这水里已经加过料啦。",--已扔过沐浴球
        },
        BEDAZZLE =
        {
            BURNING = "着火了！再耐热的材料也顶不住啊，快灭火！",--蜘蛛巢燃烧时试图装饰
            BURNT = "都已经烧成焦炭了……我也没办法把它变好看了呀。",--装饰烧毁的蜘蛛巢
            FROZEN = "冻得硬邦邦的……这种温度下我的手都要拿不稳工具了。",--装饰已冻住的蜘蛛巢
            ALREADY_BEDAZZLED = "我觉得现在这样已经很完美啦，不需要再改动了！",--重复装饰
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "哇哇！要忙不过来啦，排队一个个来！",--试图帮助第二只小惊吓（已经在协助一只了）
        },
        BUILD =
        {
            MOUNTED = "呜啊！坐在背上太晃啦，让我先下来。",--建造失败（骑乘状态）
            HASPET = "我已经有要照顾的小伙伴了，精力可是有限的呀。",--建造失败（已经有一个宠物了）
			TICOON = "我已经有一只大猫猫了！",--尝试制作第二只大虎时（浣猫年带路大猫猫）
            BUSY_STATION = "前面的实验台正忙，我们先排队观摩一下吧~",--工作站正忙（似乎没有应用）
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "呜啊！反应太快了！跟不上了！",--喂食比赛（鸦年华）的东西，角色台词主要是形容自己慢或者对象太快
        },
		CAST_POCKETWATCH =
		{
			GENERIC = "这操作太乱来了！直觉告诉我成功率几乎是零哦！",--激活表失败
			REVIVE_FAILED = "还是……没办法挽回吗……",--第二次机会表复活失败
			WARP_NO_POINTS_LEFT = "之前的标记都用光了，这下只能靠自己走回去啦。",--倒走表溯源表使用失败？（我也不知道这两句怎么触发）
			SHARD_UNAVAILABLE = "这里的空间好像很不稳定，强行启动会把我们都卷进去的！",--使用裂缝表失败？
			NO_TELEPORT_ZONE = "这里的干扰太强了，传送信号完全发不出去！",--处于禁止传送区域使用传送的表（应该是朔源表吧，具体触发点可能是圣殿这个特殊区域）
		},
		CAST_SPELLBOOK =
		{
			NO_TOPHAT = "没有那个特定帽子做媒介，这种……神秘的暗影法术好像放不出来。",		--老麦未佩戴高礼帽时释放法术（有这回事吗？还是说有打开暗影空间的快捷键？）
		},
		CASTAOE =
		{
			NO_MAX_SANITY = "脑袋晕乎乎的……再用法术我就要分不清现实了！",		--召唤暗影傀儡无足够精神上限
            NOT_ENOUGH_EMBERS = "缺少那个发光的小东西做媒介，法术启动不了呀。",		--释放余烬技能无足够余烬
            NO_TARGETS = "周围没有坏家伙呀，烧不起来呢。",		--释放燃烧术（四余烬那个）时周围无燃烧对象
            CANT_SPELL_MOUNTED = "牛牛会被吓跑的！这种危险动作还是别在背上做了！",		--骑牛时释放燃烧术
            SPELL_ON_COOLDOWN = "技能还在充能呢！就像等信号塔重启一样，稍微等等！", 		--月火/影火在CD（没记错是这样）
			NO_BATTERY = "没有电的话，这高科技也就是块铁疙瘩嘛。",--女工遥控器没电
			NO_CATAPULTS = "唔，太远了打不到！",--超出投石机攻击范围
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "稍微等等，欲速则不达嘛。",--使用投泥带时在CD
        },
        CHANGEIN =
        {
            GENERIC = "这件衣服的剪裁……好像不太适合在野外活动呢。",--换装失败 
            BURNING = "着火了！快把衣服脱下来！这可不是耐火材料！",--换装失败-着火了
            INUSE = "更衣室有人呢，我们在外面帮忙放哨吧。",--衣橱有人占用
            NOTENOUGHSLOTS = "毛不够多呀，这怎么做造型呢？",--试图给牛换装但是牛没毛
            NOOCCUPANT = "我需要一位模特来展示我的设计，我自己可不行！",--牛年美妆比赛但没有牛
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "嗯？没反应？好像没电了。",--试图充电但对象没有电   
            CHARGE_FULL = "能量满满！感觉能一口气跑回罗德岛！",--满电时充电
        },
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "让我看看数据……嗯，这条好像没有之前那条大哦。",--试图替换海钓秤上的鱼但替换物不够重
            OVERSIZEDVEGGIES_TOO_SMALL = "更轻了……还是原来的那个更大个儿！",--试图替换农产品秤上的巨大作物但替换物不够重
		},
        CONSTRUCT =
        {
            INUSE = "啊，有人在用呢，乖乖排队吧。",--建筑有人正在使用
            NOTALLOWED = "材料成分不对哦，这样搭出来的东西绝对会塌的！",--建筑材料错误（比如给予绝望脚手架燧石）
            EMPTY = "建筑材料不够了呢，再找来一些吧。",--没有建筑材料？（官方台词主要是描写没有材料给予）
            MISMATCH = "哎呀，那个组件好像不是装在这个接口的？",--升级套件错误（目前用不到）
            NOTREADY = "现在还不是时候。",--与地震期间制作物品有关？（未在游戏内找到触发条件）
        },
        COOK =
        {
            GENERIC = "糟了！火候没控制好……变成未知物质了。",--做饭失败
            INUSE = "有人在用呢，稍微等一下，好饭不怕晚嘛。",--做饭失败-别人在用锅
            TOOFAR = "这也太远了，够不到呀！",--做饭失败-太远
        },
        DEPLOY = {
            HERMITCRAB_RELOCATE = "这里的环境好像不太适合居住，我们再找找新家吧。",--使用隐士迁居套装失败（应该吧，反正我没见过）
        },
        DIRECTCOURIER_MAP =
        {
            NOTARGET = "坐标处没人接收呀，是不是记错位置了？",--指定运送对象无效（沃比的运送对象）
        },
		DISMANTLE =
		{
			COOKING = "还在咕嘟咕嘟煮着呢，现在拆会被烫到的！",--试图收回便携锅但正在烹饪
			INUSE = "有人在用呢，再等等吧",--试图收回便携锅但有人在用
			NOTEMPTY = "里面的东西还没拿出来呢，要先清空才行。",--试图收回便携锅但内部有物品
        },
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "回溯系统还在充能呢，稍微等一下下！",--使用倒走表但正在CD（检查CD中的倒走表）
        },
        DRAW =
        {
            NOIMAGE = "没有参照物的话，光靠想象画出来会有偏差的。",--画图缺乏参照物
        },
        ENTER_GYM =
        {
            NOWEIGHT = "空载训练效果很差哦，加点重量才有挑战性！",--使用健身房时无重物
            UNBALANCED = "两边重量不一样！这样练会伤到肌肉的，快调平！",--使用健身房时只有一边有重物
            ONFIRE = "器材着火啦！现在的重点不是健身，是灭火！",--使用着火的健身房
            SMOULDER = "唔……我闻到了糊味，是不是哪里的零件烧坏了？",--使用冒烟的健身房
            HUNGRY = "肚子饿得没力气了……吃饱了才有劲训练嘛。",--饥饿时使用健身房
            FULL = "带的东西太多啦，行动都不方便，怎么用器材呀。",--貌似是背包满的时候试图使用健身房（？）
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "这种水盐分太高了，植物喝了会枯萎的，绝对不行！",--试图用海水灌满浇水壶
        },
        FISH_OCEAN =
		{
			TOODEEP = "这里的深度超标啦！我的装备不适合这种深海作业。",--使用淡水钓竿在海里钓鱼
		},
        GIVE =
        {
            GENERIC = "唔……这个好像不符合接收标准呢。",--给予失败
            DEAD = "放心吧，我会替你保管好的，等你醒来再还给你。",--给予--目标死亡
            SLEEPING = "嘘——深度睡眠很重要，悄悄放在旁边就好啦。",--给予--目标睡觉
            BUSY = "现在打扰会影响工作效率的，等他忙完吧。",--给予--目标正忙
            ABIGAILHEART = "没用吗？好吧……但值得一试。",--给阿比盖尔 救赎之心
            GHOSTHEART = "唔啊，还是不要尝试了。",--给鬼魂 救赎之心
            NOTGEM = "经检测成分不符，这不是宝石，没办法启动装置哦。",--给的不是宝石（例如使用石头启动档案馆）
            WRONGGEM = "颜色不对！我们需要另一种宝石。",--给错了宝石
			NOGENERATORSKILL = "我对这机器的内部构造还不太懂，乱动会弄坏的。",--没有对应技能的情况下塞纯粹辉煌和启迪碎片进宝石发电机
            NOTSTAFF = "接口形状不对，只有那种特定的法杖才能插进去。",--给月石祭坛的物品不是法杖       
            MUSHROOMFARM_NEEDSSHROOM = "我们需要一点孢子，或者蘑菇也行。",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "基质老化啦，给它加根活木就能焕发活力！",		--蘑菇农场需要活木
            MUSHROOMFARM_NOMOONALLOWED = "这种特殊的真菌培育技术……我还没完全学会呢，嘿嘿。",		--种植其他蘑菇但无种植对应蘑菇能力
            SLOTFULL = "展示台已经摆满啦，一点空隙都没有了。",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "祭坛上的供品已经足够啦，不用再送了。",		--暴食祭坛已有食物
            NOTDISH = "这个……好像不在食谱列表里？",		--给予暴食祭坛非正式料理物品
            DUPLICATE = "重复的数据！这个图纸我已经记录过了。",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "这种材质捏不起来呀，换一种试试？",		--给陶艺圆盘的东西不对
            NOTATRIUMKEY = "密钥不对！这把钥匙好像不是开这里门的。",		--中庭钥匙不对
            CANTSHADOWREVIVE = "没有能量反应……是不是还要再充会儿电？",		--中庭仍在CD      
            WRONGSHADOWFORM = "骨骼拼错了！这样是没办法让它站起来的。",		--给心房时骨架拼接错误
            NOMOON = "我们需要借助那个“月亮”的力量才行。",		--狗屁啊在地下换人失败了
			PIGKINGGAME_MESSY = "场地太乱啦！这样不仅影响发挥，还容易出事故！",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "周围有敌人！现在可不是玩游戏的时候！",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "猪人也要休息啦，为了明天的活动要好好养精蓄锐嘛。",		--不是白天，不能开始抢元宝
			CARNIVALGAME_INVALID_ITEM = "投币口塞不进去！只有特定的代币才行哦。",		--给予鸦年华游戏机的不是代币
			CARNIVALGAME_ALREADY_PLAYING = "游戏正在运行中，等这一轮结束再说吧！",		--重复给鸦年华游戏机代币
            SPIDERNOHAT = "背包都要撑破啦！实在塞不下两顶帽子了。",		--给包里的蜘蛛头戴物品时
            TERRARIUM_REFUSE = "它对这个没反应耶，交互实验失败。",		--给予盒中泰拉错误物品
            TERRARIUM_COOLDOWN = "生物信号正在重组，耐心等待下一个生长周期吧。",		--盒中泰拉CD时给予物品
            NOTAMONKEY = "完全听不懂它在说什么……沟通彻底失败了。",		--不确定对方是谁，反正是给猴子东西的时候触发（
            QUEENBUSY = "女王正在忙正事呢，我们还是讲点礼貌，稍等一下吧。",		--给予猴子女王物品时对方忙碌
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "数据库里已经有这份草图了，不需要重复录入啦。",--似乎是添加重复条目进入烹饪指南，不过游戏内好像没有这一行为（？）
        },
        GIVETOPLAYER =--这一栏是给予
        {
            FULL = "他的背包已经满得塞不下了，我先帮忙拿一点吧。",--给玩家一个东西 -但是背包满了
            DEAD = "这些物资我会帮你保管好的。",--给死亡的玩家一个东西
            SLEEPING = "嘘——别吵醒他，轻拿轻放就好。",--给睡觉的玩家一个东西
            BUSY = "别打扰他操作，这时候分心很危险的。",--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =--这一栏是给予全部（这俩部分貌似没有区别）
        {
            FULL = "他的背包已经满得塞不下了，我先帮忙拿一点吧。",--给人一组东西 但是背包满了
            DEAD = "这些物资我会帮你保管好的。",--给予死去的玩家一组物品
            SLEEPING = "嘘——别吵醒他，轻拿轻放就好。",--给予正在睡觉的玩家一组物品
            BUSY = "别打扰他操作，这时候分心很危险的。",--给予正在忙碌的玩家一组物品
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "这是别人的劳动成果，擅自采集是不对的哦。",--试图采集已扫描完的吉米（机器人的扫描仪）但自身没有机器人能力
        },
        HEAL =
        {
            NOT_MERM = "这种特殊的疗法……对普通人来说可能太刺激了点。",--试图给非鱼人生物使用蚊血注射液（好像是这个名字？）
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "术业有专攻，还是交给专业人士去沟通比较好。",--貌似是试图指挥已被别人雇佣的蜘蛛的台词（召集蜘蛛）
        },
        HITCHUP =
        {
            NEEDBEEF = "我们需要一只配合的皮弗娄牛来当模特哦。",--使用美妆台没有牛
            NEEDBEEF_CLOSER = "太远啦，没办法建立连接，请靠近一点！",--使用美妆台时牛牛过远
            BEEF_HITCHED = "它已经乖乖在这里了哦。",--重复绑定同一个美妆台（貌似不会触发）
            INMOOD = "受试者情绪不稳定！先想办法安抚它一下！",--使用美妆台牛在附近且在跑动或战斗中
        },
		LOOKAT = -- 近距离检查失败时的台词（女工的玫瑰眼睛检查）
		{
			ROSEGLASSES_INVALID = "没探测到任何源石技艺……啊不，魔法的波动。",--检查对象不是符合条件的检查物
			ROSEGLASSES_COOLDOWN = "设备过热啦，让它稍微休息一下……",--检查对象正在冷却
            ROSEGLASSES_DISMISS = "哎呀！信号断了……就差那么一点点！",--检查时被打断？（这两句不确定触发条件，我没怎么用过玫瑰眼镜）
            ROSEGLASSES_STUMPED = "痕迹太微弱了，连探测器都捕捉不到呢。",--检查对象痕迹微弱？
		},
        LOWER_SAIL_FAIL =
        {
            "集中注意力！别分心！",		--这里收帆失败说的话
            "拿出干劲来！一鼓作气！",		--两种帆都会触发，邪天翁是升帆慢，普通帆是收帆慢
            "跟上节奏！这就是探险家的默契！",		--慢的那一段如果没掌握好节奏就会触发这三段话
        },
        MARK =
        {
            ALREADY_MARKED = "这时候改计划可不行哦。",--选择胜出牛（我也没触发过，我没怎么玩过这种年游戏）        --名句：Do or nodo there is no try致敬
            NOT_PARTICIPANT = "我只是观察记录员，没有参赛资格呢。",--比赛开始时没有参加（多人情况下才触发）
        },
        MOUNT =
        {
            TARGETINCOMBAT = "它现在很激动，这时候靠近会被伤到的！",--骑乘（对方正在战斗）
            INUSE = "上面已经很挤了，它背不动更多东西啦。",--骑乘（对方被占据）
			SLEEPING = "醒醒啦~ 太阳都要晒到屁股了哦~",--骑乘（对方在睡觉）
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "淡水和咸水的生态不一样，这套装备用不了哦。",--使用海水钓竿在池塘/湖泊钓鱼
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "这个……是类似食品加工机的东西吗？我看不太懂说明书呢。",--使用便携研磨器（无大厨能力时）
			SHADOWMAGIC = "这种能量形式……真想记录下来带回去研究一下。",--不确定是什么物品，官方人物里对应的是暗影秘典的台词，似乎是暗影秘典作为制作站时使用（没记错应该是老麦重做前的设计）
		},
        PICK =
        {
            NOTHING_INSIDE = "空空如也！不过这也算是一种调查结果嘛。",--拾起物品且对象内部无物品？不确定是什么东西
			STUCK = "卡住了？",--远古圣殿交互失败
        },
        PICKUP =
        {
			RESTRICTION = "武器系统不兼容，我还是更习惯用我的无人机。",--熔炉模式下捡起错误的武器
			INUSE = "这种行为不符合探险家的礼仪哦，不可以！",--捡起已经打开的容器
            NOTMINE_SPIDER = "哎呀，认错目标了，你不是我的协助者呢。",--拾起别人的蜘蛛
            NOTMINE_YOTC =
            {
                "这只不是我的观察对象哦。",--已有胡萝卜鼠时绑定另一只（？）我没玩过多少年活动，除了浣猫年
                "生物特征对不上，看来不是同一只。",--拾起别人的胡萝卜鼠（？）
            },
			NO_HEAVY_LIFTING = "超出最大载重了，这种力气活还是交给专业设备吧……",--老年搬运物品（貌似只有旺达生效）
            FULL_OF_CURSES = "呃，这东西给我的感觉很不好……真的没问题吗？",--貌似是某个被删除的塞满诅咒饰品的东西
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "观察要仔细，每一个细节都不能放过！",--研究肥料
            FERTILIZER = "这种肥料我已经研究过啦，换个新的试试吧？",--研究已经研究过的肥料
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "储水罐空了！得赶快补水才行！",--使用空水壶灭火      --《荒野乱斗》露米台词致敬
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "没有水资源，怎么进行灌溉实验呢？",--使用空水壶灌溉
        },
        --wickerbottom specific action
        READ =
        {
            GENERIC = "干扰太强了……我也理解不了里面的逻辑。",		--阅读失败（原版没有不过不妥协的空san不让读书和杂草的san不够不让用秘典会用到这条）
            NOBIRDS = "周围没有鸟活动，召唤失败了。",		--在无法召唤鸟的天气阅读鸟书（似乎也是废案）
            NOWATERNEARBY = "这里没有水，鱼是没办法生存的哦。",		--读鱼书但周围无水
            TOOMANYBIRDS = "密度太高了，再召唤会破坏生态平衡的。",		--阅读鸟书但周围鸟过多
            WAYTOOMANYBIRDS = "现在的环境参数不适合进行召唤实验呢。",		--阅读鸟书但周围不符合召唤鸟的条件（未知触发条件，洞穴里读是触发默认失败台词，科雷你真懒）      --后期：海难的飓风季在地上读鸟书会触发这句，在海上就不会
            BIRDSBLOCKED = "战场上做这种实验太危险了……换个地方吧。",       --在与战争瓦器人的战斗场地中阅读鸟书（神经病啊，谁会去那鬼地方读鸟书啊）
            NOFIRES = "没检测到火源，不用启动灭火程序哦。",		--阅读控火术但周围无火情
            NOSILVICULTURE = "植物长得很好，暂时不需要人工干预。",		--阅读造林学但周围没有作用对象
            NOHORTICULTURE = "庄稼都在茁壮成长中，不用操心啦。",		--阅读园艺学但无作用对象
            NOTENTACLEGROUND = "地面太硬了，它们钻不出来的。",		--阅读触手书但无召唤点
            NOSLEEPTARGETS = "哈啊……大家的精神看起来都很不错嘛。",		--阅读睡前故事但无作用对象
            TOOMANYBEES = "蜂群有点多，为了安全起见还是离远点吧。",		--阅读养蜂笔记但蜜蜂过多
            NOMOONINCAVES = "在这里完全接收不到月光的信号呢。",		--在地下阅读月之魔典
            ALREADYFULLMOON = "月相已经满了，现在的能量超级充沛！",		--满月时读月之魔典
            --恶意接管2
            DEADBIRDS = "这样的实验……对鸟来说太残忍了。",      --月雹期间和之后阅读鸟书
        },
		REMOTE_TELEPORT =
		{
			NOSKILL = "权限不足，我得先学学怎么用这个。",--使用传送伞没有点技能点
			NODEST = "没有设定传送坐标，这是要飞去哪呀？",--使用传送伞没有传送终端
		},
        REMOVEMODULES =
        {
            NO_MODULES = "看了一圈，好像没有什么能拆的零件呀。",--拆卸模块时无已装模块        --反正只有WX能用，乱写一通得了
        },
        REPAIR =
        {
            WRONGPIECE = "接口完全对不上嘛，是不是拿错零件了？",--大理石雕像拼接错误
        },
        REPLATE =
        {
            MISMATCH = "这盘子和菜不搭呀，摆出来不好看。",--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "现在的摆盘已经很完美啦，不用换了。",--暴食-换盘子已经换了
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "注意节奏！像唱歌一样~ 1，2，1，2！",		--这里是划船失败说的话
            BAD_TIMING1 = "专心一点！只要大家心往一处想！",		--三者随机使用一句
            BAD_TIMING2 = "哎呀，刚才是不是慢了半拍？再来一次！",		--每次失败都会触发      --《荒野乱斗》露米台词致敬
        },
		RUMMAGE =
		{
			GENERIC = "打不开！好像上锁了，我可没有万能钥匙。",--打开箱子失败
			INUSE = "有人正在用呢，我们等一下他吧~",--打开箱子 正在使用
            NOTMASTERCHEF = "这个……看起来像是专业的厨具，我不会用呀。",--尝试打开大厨专属物品（自身无能力使用）
            NOTAMERM = "这是别人的东西哦，我们要讲礼貌，不能乱动。",--应该是尝试打开海带盘或者别的鱼妹专属容器时触发
            NOTSOULJARHANDLER = "这些灵魂能量……我还没学会怎么收集呢。",--打开灵魂罐但无灵魂罐技能点（没错，小恶魔也有自己专属的这句）
            RESTRICTED = "访问被拒绝？看来这个只能给特定的人用。",--打开不是自己的容器，例如其他角色打开沃尔特技能树的弹药袋
		},
        SADDLE =
        {
            TARGETINCOMBAT = "它现在很生气，这时候上去会被甩下来的！",--给战斗状态的牛上鞍
        },
		SHAVE =
		{
			AWAKEBEEFALO = "危险危险！等它睡着了再动手比较安全！",--给醒着的牛刮毛
			GENERIC = "光溜溜的，没什么东西好刮啦。",--刮毛失败（对方无毛）
			NOBITS = "毛还太短了，再刮会伤到皮肤的。",--没毛的时候刮毛
            REFUSE = "不行不行！这可是我的标志性形象！",--伍迪给自己剃胡子（或者说拒绝刮自己的胡子？）
            SOMEONEELSESBEEFALO = "这是队友的小伙伴，未经允许不能乱动哦。",--剃别人的牛
		},
        SING_FAIL =
        {
            SAMESONG = "这首歌已经唱过啦，换个新调子吧~",--演唱失败（重复演唱）
        },
        SLAUGHTER =
        {
            TOOFAR = "哎呀，跑得太快了，没追上！",--貌似是攻击对象是猎物且攻击失败（寻路失败）可以不理因为只有单机版会出现这种情况
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "选手还没入场呢，比赛怎么开始呀？",--胡萝卜鼠比赛，但没有放胡萝卜鼠
        },
		STORE =
		{
			GENERIC = "塞不下啦！我们需要整理一下库存了。",--存放东西失败
			NOTALLOWED = "这个好像不能放进去耶。",--存放东西（不被允许）
			INUSE = "没关系，刚好我可以趁机整理一下笔记~",--别人正在用容器
            NOTMASTERCHEF = "这个……我好像搞不定这个机器。",--尝试将物品放入大厨专属物品（自身无能力使用时）
            NOTSOULJARHANDLER = "这些灵魂……不听我的话呢。",--存储灵魂（自身无灵魂罐技能点或没有相关能力）
            RESTRICTED = "我好像没有权限用这个容器哦。",--尝试存放不是自己能用的容器（应该吧）
		},
        TEACH =
        {
            KNOWN = "这个我已经学会啦，难不倒我！",--学习已经知道的蓝图
            CANTLEARN = "这个……好复杂，好像超出了我的理解范围。",--学习无法学习的蓝图
            WRONGWORLD = "地图对不上？这里好像不是这张图画的地方。",--学习另外一个世界的地图
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "太暗了看不清字……有手电筒或者火把吗？",--可能是在洞穴里试图阅读漂流瓶里的藏宝图（我也不知道这是个啥，只知道是因为太黑而学习地图失败）
            STASH_MAP_NOT_FOUND = "宝藏标记在哪里呢？好像有些偏差……",--阅读T键T出来的海盗地图？（其实主要描述的是无效标记，或者宝藏已经开过了？（例如提前用船炮开宝藏再去阅读瓶中信？）    --朵拉经典名言致敬            
        },
		TELLSTORY =
		{
			GENERIC = "现在可不是讲故事的时候，大家警惕一点！",		--貌似是周围有危险时试图讲故事
			NOT_NIGHT = "到了晚上围在火堆旁讲故事才有气氛嘛~",		--非天黑试图讲故事
			NO_FIRE = "没有营火的话，感觉气氛差了一点呢。",		--缺少火堆讲故事
		},
		UNLOCK =  --锁定或解锁，用于单机探测杖，联机无效
        {
            WRONGKEY = "打不开？是不是拿错钥匙了？",--使用错误的钥匙（貌似是废案）
        },
        UPGRADE =
        {
            BEDAZZLED = "升级会破坏上面的装饰，好不容易弄好的还是算了吧。",--尝试升级已装饰的蜘蛛巢触发
        },
        USEITEMON =
        {
            BEEF_BELL_INVALID_TARGET = "连接失败。它好像不喜欢这个铃铛。",--绑定对象不是牛？（对象不是牛好像不能绑定啊）
            BEEF_BELL_ALREADY_USED = "它已经有固定的搭档了，不能强行拆散人家。",--绑定的牛已经有铃铛绑定了
            BEEF_BELL_HAS_BEEF_ALREADY = "我也只能带这一个啦，多了我会顾不过来的。",--已持有绑定牛的牛铃时再去绑定其它牛
			NOT_MINE = "这好像不是我的装备呢。",--拾起别人的个人专属物品？（不知道怎么触发，好像伍迪捡别的露西斧会触发这句）
			CANNOT_FIX_DRONE = "坏得很严重……可能得大修一波了。",--尝试修复黄莺（战争瓦器人的小飞机）      --"献出心脏"这句话我已经不知道是什么梗了，只能算个梗的致敬
        },
		USEKLAUSSACKKEY =
        {
            WRONGKEY = "钥匙不对。我们要不要换一种思路？",--使用鹿角打开赃物袋
            KLAUS = "那个……我们可以尝试和平解决吗？比如交换礼物？",--尝试用麋鹿绒开启赃物袋且克劳斯未被击败     --港漫《海虎武神》经典台词致敬
			QUAGMIRE_WRONGKEY = "虽然概率很低，但为了探险，总要试一试！",--暴食使用错误钥匙（我没玩过熔炉暴食，出的时候我还是个小学生呢）
        },
        WRAPBUNDLE =
        {
            EMPTY = "里面什么都没有呀，空气可以打包吗？",--打包空气（貌似游戏里做不到）
        },
        WRITE =
        {
            GENERIC = "手有点酸了，今天的观察日记就写到这里吧。",--写字失败
            INUSE = "你在写东西吗？那我在旁边学习一下~",--写字 正在使用中
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "裁判先生今天好像不在呢。",--裁判不上班时触发（别问我我也不知道怎么触发这句）
            ALREADYACTIVE = "其他赛区正在比赛呢，我们稍后再来。",--别的地方正在进行比赛
            NORESPONSE = "有人在吗？收到请回答~",--裁判似了？
            RIGHTTHERE = "裁判正忙，我们耐心等等结果吧。",--正忙
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "这个样式我已经记录下来了哦。",--学习已经解锁的牛礼服图纸（？没触发？学习重复还能学？）
        },
		CARVEPUMPKIN =
		{
			INUSE = "你来主刀吧，我在旁边给你打光！",--雕刻南瓜   别人正在雕刻
			BURNING = "南瓜起火了！快救火呀！",--雕刻南瓜   起火了
		},
		DECORATESNOWMAN =
		{
			INUSE = "我也想堆一个属于自己的雪人，嘿嘿！",--堆雪球   别人正在使用
			HASHAT = "它已经有帽子啦，我就不画蛇添足了。",--递给雪人帽子    已经有帽子了
			STACKEDTOOHIGH = "这也太高了！我踮起脚都够不着呀……",--堆雪球    超过层数
			MELTING = "雪人流汗了？啊不好，它在融化！",--堆雪球 正在融化
		},
        MUTATE = 
        {
            NOGHOST = "找不到目标……这个是不是给阿比盖尔用的？",--没有阿比时试图使用月晷变异
            NONEWMOON = "月相不对哦，要等新月才行。",--非新月期间试图使用月晷变异
            NOFULLMOON = "能量不够强，要等到满月的时候才可以呢。",--非满月期间试图使用月晷变异
            NOTNIGHT = "光太强了，晚上再来进行仪式吧。",--非晚上试图使用月晷变异
            CAVE = "这里看不到天空，连不上月亮的信号呢。",--在洞穴内试图使用月晷变异
        },
		MODSLINGSHOT =
		{
			NOSLINGSHOT = "改装对象呢？我的弹弓好像不见了？",--改装弹弓  未找到弹弓
		},
		POUNCECAPTURE =
		{
			MISSED = "哎呀！没抓着……下次一定要算好抛物线！",--捕捉月灵失败（幻灵捕获机）
		},
        DIVEGRAB =
        {
            MISSED = "刚才只是……测试一下设备的灵敏度，没错！",--捕捉静电失败
        },
        --2025圣诞
        SOAKIN =
		{
			NOSPACE = "这里已经挤不下了，没有我的位置啦。",--官方温泉浸泡失败（有人）
		},
        --棱镜部分
        INTOSHEATH_L = {--入鞘失败
            NOSWORD = "手里没东西呀，收纳了个寂寞。",--空手入鞘
            WRONGSWORD = "这把剑规格不对，装不进去呀。",--入鞘错误武器
        },
        INTOSHEATH_L2 = {--入鞘失败
            NOSWORD = "手里没东西呀，收纳了个寂寞。",--空手入鞘
            WRONGSWORD = "这把剑规格不对，装不进去呀。",--入鞘错误武器
        },
        ITEMINTOSHEATH_L = {--入鞘失败
            NOSWORD = "手里没东西呀，收纳了个寂寞。",--空手入鞘
            WRONGSWORD = "这把剑规格不对，装不进去呀。",--入鞘错误武器
        },
        ITEMINTOSHEATH_L2 = {--入鞘失败
            NOSWORD = "手里没东西呀，收纳了个寂寞。",--空手入鞘
            WRONGSWORD = "这把剑规格不对，装不进去呀。",--入鞘错误武器
        },
        REPAIR_LEGION = {--操作失败
            GUITAR = "琴弦的张力已经完美了，不用再调啦。",--修复吉他
            FUNGUS = "嗯？先不用管它了。",--修复竹荪帽（白蘑菇帽）
            MAT = "已经铺得很大了，不用再扩展啦。",--扩大一些地毯？
            YELLOWGEM = "已经满了，再放进去也是浪费啦。",--塞宝石，应该不止黄宝石
            ELEC = "指示灯全绿，电量已经满啦。",--子圭育满电
        },
        PLANTSOIL_LEGION = { --簇栽失败，应该吧
            NOTMATCH_C = "它俩性格不合！不能种在一起。",--不是对应作物
            ISMAXED_C = "太挤了太挤了，再种怎么长个子呀。",--最大时簇栽
        },
        GENETRANS = { --子圭育相关
            NOGENE = "咦？这是什么？得先研究一下它的基因才行。", --放入无解锁基因物品，比如不塞活性组织转化浆果从
            GROWING = "实验正在进行中，请勿触碰仪器哦。", --顾名思义已有物品
            ENERGYOUT = "没电了！反应没办法继续啦。", --无能量
            WRONGITEM = "这个东西好像没办法转化呢。", --不是可转化物品
            ENERGYMAX = "充能完毕，随时可以开始下一轮实验！", --满充能
            WRONGKEY = "这个……好像没有什么特别的地方。", --塞小土豆小茄子之类的？
            HASKEY = "放一个就够啦，不用再塞了。" --塞重复活性组织
        },
        LIFEBEND = { --Tip: 如果不给每个玩家都设置台词，失败时就会提示做不到        --诶？为啥呀？（明屎糊音）--后期：（貌似模组角色是独立的，梧大的注释是对于原版角色适配来说）
            NOLIFE = "生命很重要！不能随便拿自己冒险！",--生命不够
            GHOST = "如果科技能直接复活就好了……",--复活鬼魂
            NOTHURT = "各项指标都很正常。",--正常（应该是给玩家之类的？）
            NOWITHERED = "这株植物长得很健康呀。"--正常（对象是植物？）
        },--恢复生机（也叫以命换命）
        REMOVE_CARPET_L = {--铲起地毯
            GENERIC = "随便破坏地形可不好……"
        },
        RUB_L = { --电气石摩擦
            NOUSE = "呃，摩擦这个应该不会起电吧？", --摩擦不带电物品
            NOENERGY = "没电了……得给它充能才行。",--电气石没电
            NONEED = "已经存满电了，塞不进去啦。",--摩擦储存电物品且对象已满（比如满电子圭育）
            REFUSE = "没反应？是不是哪里接触不良？"--摩擦失败
        },
        SMEAR_L = {--涂抹
            NOUSE = "再涂一层有点太多余了吧。",--涂抹对象不对（比如给无限展示柜涂防火漆，无限展示柜本身就防火）
            NONEED = "已经有保护层了，不需要再涂啦。" --对象已涂抹
        },
    },

    ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "好像缺少关键材料呢。",--缺少材料制作物品
		NO_TECH = "这个技术我还没解锁呢。",--需要制作站制作物品
		NO_STATION = "我需要专业的实验台才能组装这个。",--需要特殊制作站制作物品（如：远古塔、年活动神龛）
	},
   
	ACTIONFAIL_GENERIC = "哎呀，操作失败了。",--动作失败
	ANNOUNCE_BOAT_LEAK = "漏水了漏水了！快启动损管作业，补洞！",--船破洞
	ANNOUNCE_BOAT_SINK = "船要沉了！大家抓紧我，别掉队！",--船血量为0（或者说要沉了）
    ANNOUNCE_PREFALLINVOID = "哇啊——这失重感是怎么回事？！",--掉入虚空（不过真掉下去也不会触发？科雷估计又写错地方了）      --小马掉下悬崖.GIF也算是个梗的致敬？
	ANNOUNCE_DIG_DISEASE_WARNING = "挖出来了！希望剩下的植物还健康。", --挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "这株好像生病了……要小心处理。", --植物生病
	ANNOUNCE_ADVENTUREFAIL = "通讯失败……我不想一个人被留在这里。",--这TM是去冒险模式死了（挑战失败）回来的台词，神TM没调用，联机没调用不代表冒险模式mod或者单机没调用
    ANNOUNCE_MOUNT_LOWHEALTH = "唔，微弱心跳反应！必须立刻让它休息！",--牛血量过低

    -- 麦斯威尔和薇克巴顿专属台词（这部分已经废弃了，貌似科雷忘记删掉了，上面已经有了读书失败部分的台词了）
    ANNOUNCE_TOOMANYBIRDS = "鸟群太多了，再叫要出乱子了。",		--读鸟书但周围鸟太多了
    ANNOUNCE_WAYTOOMANYBIRDS = "这里不适合召唤鸟呢。",		--没有鸟的地方读鸟书（貌似原版做不到）
    ANNOUNCE_NOWATERNEARBY = "没有水，鱼怎么活呀？",		--周围没水的时候读鱼书

	-- 麦斯威尔专属
	ANNOUNCE_SHADOWLEVEL_ITEM = "检测到高能暗影反应……",		--检查暗影物品的后缀分析（自身可召唤暗影角斗士时）
	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "读数有轻微波动……",		--一级暗影物品装备时
	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "有股奇怪的力量在涌动……",		--二级暗影物品装备时
	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "好强的力量！头有点晕……",		--三级暗影物品装备时
	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "这是……突破阈值的力量！",		--四级暗影物品装备时

    -- 沃尔夫冈专属
    ANNOUNCE_NORMALTOMIGHTY = "动力全开！感觉能搬起一座冰山！",		--强壮值达到最高阈值
    ANNOUNCE_NORMALTOWIMPY = "好累……身体变得好沉重……",		--强壮值达到最低阈值
    ANNOUNCE_WIMPYTONORMAL = "休息过来了，机能恢复正常！",		--强壮值从最低阈值提升到中等阈值
    ANNOUNCE_MIGHTYTONORMAL = "过载模式结束，呼，轻松多了。",		--强壮值从最高阈值降低到中等阈值
    ANNOUNCE_EXITGYM = {
        MIGHTY = "今天的体能训练非常完美！",		--强壮状态退出健身房
        NORMAL = "适当的运动有助于保持头脑清醒。",		--正常状态退出健身房
        WIMPY = "呼……体力好像透支了……",		--虚弱状态退出健身房
    },

	ANNOUNCE_BEES = "蜜蜂！快跑快跑！",--貌似是触发蜜蜂地雷时说的，不过更多用到的地方是在海钓档触发钓出来的蚊子陷阱
	ANNOUNCE_BOOMERANG = "哎呀！接球失败！",--没接住回旋镖
	ANNOUNCE_CHARLIE = "黑暗中有东西过来了！",--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "呜！被打到了！是谁偷袭？！",--被查理攻击     --学斗子哥说话呢，算个致敬吧
	ANNOUNCE_CHARLIE_MISSED = "好险！差点就被抓住了。", --闪避查理攻击
	ANNOUNCE_COLD = "好冷……和冰原比起来还差一点！但是也得添衣服了！",--过冷
	ANNOUNCE_HOT = "好热好热！散热系统要过载了……",--过热
	ANNOUNCE_CRAFTING_FAIL = "材料不够啦……",--貌似是废弃的缺少制作材料的台词
	ANNOUNCE_DEERCLOPS = "好大的震动！有超级巨大的家伙过来了！",--boss来袭
	ANNOUNCE_CAVEIN = "小心落石！快找掩护！",--地下蚁狮地震（几个简单的落石，没了）
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"地面塌陷！快离开震源！",--蚁狮地震
		"重力异常！大家散开！",--蚁狮地震
		"不要停在原地！会受伤的！",--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "这可是很珍贵的贡品哦。",--给蚁狮上供
        "希望能平息它的怒火……拜托啦！",--给蚁狮上供
        "拿去吧，顺便让我研究一下你。",--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "密码验证通过！宝箱打开了！",--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "错误提示？哎呀，看来还要再试几次密码。",--远古宝箱放满且没有正确放置物品     --我是谁？Djw   致敬
    ANNOUNCE_DUSK = "太阳下山了，我们要抓紧时间了。",--进入黄昏（现版本的联机版貌似已经没有这个了）--《咸鱼喵喵》配乐，《封印结界·里》歌词翻译致敬

    --机器人专属
    ANNOUNCE_CHARGE = "电池充满啦！感觉浑身充满了力量！",--机器人过载状态结束（现版本的联机版重进也有这句话）
	ANNOUNCE_DISCHARGE = "系统待机中，一切正常。",--未在充电状态（我只在重进游戏的单机模式见过这句话）

    -- 薇诺娜专属
    ANNOUNCE_ROSEGLASSES = 
    {
        "你好，神秘的女士。",--玫瑰检查镜（女工技能树）检查成功
        "这种能量好独特，值得记录下来。",--玫瑰检查镜（女工技能树）检查成功
        "真是很少见的源石技艺波形呢。",--玫瑰检查镜（女工技能树）检查成功
    },
    ANNOUNCE_CHARLIESAVE = 
    {
        "我也想分析一下她的行为逻辑……",--不确定什么情况下触发，可能是脆弱玫瑰？
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "发现可以升级的地方了！",--这三句是女工的升级字段？
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "唔，这个设计比我的还要精密……",--不确定游戏内怎么触发
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "虽然方案不同，但也很有参考价值。",--反正我是找不到触发条件，看看官方文档得了

	ANNOUNCE_EAT =
	{
		GENERIC = "唔，豪吃~",--吃东西
		PAINFUL = "唔……这个肚子也会抗议的……",--吃掉血食物       --《荒野乱斗》露米台词致敬
		SPOILED = "唔，味道有点怪……希望能消化得了。",--吃红色食物或者吃腐烂食物
		STALE = "虽然不新鲜了，但也不能浪费食物呀。",--吃黄色食物
		INVALID = "这个绝对不能放到嘴里！",--拒吃
        YUCKY = "无论是外观还是气味都……我有权拒绝！",--尝试吃永恒水果蛋糕或者薇克巴顿尝试吃红色食物（总之就是吃恶心的食物）

        --沃利专属的进食提示语
		COOKED = "只要加热一下，味道就好多了。",		--沃利吃烹饪过的食材(这下面几个都是沃利才会用到的)
		DRIED = "这种保存方式很聪明，方便携带。",		--沃利吃风干食物
        PREPARED = "这是什么新料理？我要写进食谱里！",		--沃利几天内第一次吃这一个料理
        RAW = "虽然是原生态……但还是建议煮熟再吃。",		--沃利吃生食（和前面两个吃食材的都是单机遗留）
		SAME_OLD_1 = "又是这个套餐吗？",		--几天内第二次吃这一个料理
		SAME_OLD_2 = "营养摄入要均衡才行哦。",		--几天内第三次吃这一个料理
		SAME_OLD_3 = "虽然我不挑食……但这已经连吃好几天了。",		--几天内第四次吃这一个料理
		SAME_OLD_4 = "我想念罗德岛食堂的饭菜了……",		--几天内第五次吃这一个料理
        SAME_OLD_5 = "再吃这个我就要罢工啦！",		--几天内第六甚至更多次吃这一个料理
		TASTY = "哇！这个味道……简直是满分！",		--吃调味料理？（不确定有没有调用）
    },

	ANNOUNCE_FOODMEMORY = "胃容量告急！真的吃不下啦！",		--拒食重复料理（应该类似于公主的拒食？）

    ANNOUNCE_ENCUMBERED =
    {
        "好重……多功能无人机，能不能帮忙抬一下？",--搬运雕像、可疑的大理石
        "这种时候……就当是负重训练吧！",--搬运雕像、可疑的大理石
        "虽然我带了很多装备，但这块石头也太沉了……",--搬运雕像、可疑的大理石
        "呜……感觉被压得长不高了……",--搬运雕像、可疑的大理石
        "唔……我可以坚持！",--搬运雕像、可疑的大理石
        "加油麦哲伦！不要输给一块石头！",--搬运雕像、可疑的大理石
        "要被压扁了……",--搬运雕像、可疑的大理石
        "这也太重了吧……",--搬运雕像、可疑的大理石
        "有人可以帮忙搬一下吗？",--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"空间读数剧烈波动！快找掩体！",--中庭击杀boss后即将刷新
		"这股能量太狂暴了！",--随机触发一句（建议写明白一点）
		"离远一点！那里很危险！",--总共有四分钟的时间
	},
    ANNOUNCE_RUINS_RESET = "古代遗迹重置完毕，一切归零。",--地下重置
    ANNOUNCE_SNARED = "被束缚住了！有没有谁能帮帮忙！",--只因者释放骨牢
    ANNOUNCE_SNARED_IVY = "别缠着我！我的设备要被弄坏了！",--针刺旋花攻击
    ANNOUNCE_REPELLED = "攻击无效？好像被什么东西挡住了！",--攻击只因者护盾状态
	ANNOUNCE_ENTER_DARK = "好黑呀……得赶紧弄点亮光才行。",--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "呼，亮起来了！安全感回来了。",--进入光源
	ANNOUNCE_FREEDOM = "哈喽，新世界！麦哲伦探险队前来报到！",--我也不知道什么地方用到这个，貌似在哪见过想不起来了，官方台词可能有线索（初步判断是冒险模式暗影王座角色被替换下来了）
	ANNOUNCE_HIGHRESEARCH = "好多未知的知识！感觉大脑在颤抖！",--触发通晓万物了（？）
	ANNOUNCE_HOUNDS = "听到了吗？好像有什么东西在叫……是猎犬！",--猎犬将至
	ANNOUNCE_WORMS = "小心脚下！地面在震动！",--蠕虫袭击
    ANNOUNCE_WORMS_BOSS = "震源很浅！有个大家伙要钻出来了！",--大蠕虫袭击，此时角色周围几格的地皮范围会触发非常小型的地震
    ANNOUNCE_ACIDBATS = "侦测到飞行生物接近！注意头顶！",--蝙蝠袭击
	ANNOUNCE_HUNGRY = "肚子咕咕叫了……该补充能量啦。",--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "根据痕迹判断，目标就在前方！",--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "线索中断了……难道它还会飞？",--脚印丢失
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "雨太大了，痕迹都被冲掉了……",--春天下雨脚印丢失
    ANNOUNCE_HUNT_START_FORK = "这个脚印……好像属于某种大家伙。",--狗牙土堆
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "全员警戒！发现目标！",--狗牙土堆追踪结束
    ANNOUNCE_HUNT_WRONG_FORK = "咦？好像找错了……这不是我们要找的那只。",--狗牙土堆找到的是躲藏座狼（cosplay座狼）
    ANNOUNCE_HUNT_AVOID_FORK = "等等，路线好像有点不对劲？",--追踪途中翻到普通脚印
	ANNOUNCE_INV_FULL = "背包装不下了！得先整理一下。",--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "唔……头好晕……刚才发生什么了？",--催眠醒来（单机烤蔓草会跳时间，这种情况会用到，貌似已经被20年的更新删掉了）
	ANNOUNCE_LOWRESEARCH = "这些资料我已经倒背如流啦。",--貌似是学了但是信息极少（看看官方台词吧，或许也有点联想）
	ANNOUNCE_MOSQUITOS = "蚊子？要是被叮了可是很痒的！",--没啥用，貌似是与蚊子有关的废案台词
    ANNOUNCE_NOWARDROBEONFIRE = "更衣室着火了！先别管形象啦，灭火要紧！",--橱柜着火
    ANNOUNCE_NODANGERGIFT = "现在拆快递太危险啦！先把周围的麻烦解决掉！",--周围有危险的情况下打开礼物
    ANNOUNCE_NODANGERSLEEP = "周围太吵了，根本睡不着呀！",--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "大白天就睡觉？这可不是探险家的作风哦。",--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "生物钟告诉我还是白天呢，赶路要紧！",--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "肚子咕咕叫根本睡不着……先找点吃的吧。",--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "床着火了！不想变成烤鸟的话就快灭火！",--营帐着火无法睡觉
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "光线太强了，不关灯我可睡不着觉。",--携带照明电路的机器人时试图睡帐篷（应该吧？）
	ANNOUNCE_NODANGERSIESTA = "现在不是午休的时候，有危险！",--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "晚上睡这里会感冒的，还是回帐篷里睡吧。",--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "探险家要有规律的作息，现在该睡觉啦。",--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "空腹午睡对胃不好哦，吃点东西吧。",--饱度不足无法午睡
	ANNOUNCE_NO_TRAP = "扫描完毕，前方安全！",--没有陷阱？？？没调用  --我也没见过，想写找找官方台词吧
	ANNOUNCE_PECKED = "哎哟！别啄我的装备！很贵的！",--被小高鸟啄
	ANNOUNCE_QUAKE = "地震了！快保护好脑袋！",--地震
	ANNOUNCE_RESEARCH = "嗯……这些知识好像有点过时了。",--没见过，可能是档案馆解密的废案吧
	ANNOUNCE_SHELTER = "大树底下好乘凉~",--得树阴蔽
	ANNOUNCE_THORNS = "好痛！",--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "呼……吓死我了。火灾真是太可怕了。",--扑灭冒烟物品
	ANNOUNCE_TORCH_OUT = "火把灭了！快换备用的！",--火把用完了
	ANNOUNCE_THURIBLE_OUT = "没燃料了，炉子熄火啦。",--香炉燃尽
	ANNOUNCE_FAN_OUT = "风停了吗？小风车不转了。",--小风车停了
    ANNOUNCE_COMPASS_OUT = "指南针坏了？糟糕，要迷路了！",--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "有什么东西被抓住了！去看看！",--触发陷阱（例如腐烂陷阱）
	ANNOUNCE_UNIMPLEMENTED = "ERROR: 404. 找不到对象？",--貌似是废案，想写看官方的去
	ANNOUNCE_WORMHOLE = "时空折跃准备……出发！",--跳虫洞
    ANNOUNCE_WORMHOLE_SAMESPOT = "坐标重叠了？怎么还在原地？",--使用自由跳虫洞（女工技能）
	ANNOUNCE_TOWNPORTALTELEPORT = "这感觉……像是在滚筒洗衣机里转了一圈……呜额……",--使用懒人塔传送
	ANNOUNCE_CANFIX = "只要有合适的零件，我就能修好它！",--物品可以修理（远古塔和墙以及齿轮堆）
	ANNOUNCE_ACCOMPLISHMENT = "成就达成！请为我欢呼！",--第一次激活奖杯
	ANNOUNCE_ACCOMPLISHMENT_DONE = "重复实验虽然枯燥，但也能发现新东西……大概吧。",--第n次激活奖杯（具体可以去搜搜，奖杯是废案以及它背后的故事）
	ANNOUNCE_INSUFFICIENTFERTILIZER = "土里的营养不够啦，还要再施点肥。",--还需要施肥（比如单机海难的咖啡移植后第二次采摘需要施肥多次）
	ANNOUNCE_TOOL_SLIP = "呀！手滑了……工具飞出去了！",--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "没被电到！嘿嘿，我的衣服可是绝缘的！",--规避闪电
	ANNOUNCE_TOADESCAPING = "它想跑！快拦住它！",--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "跟丢了……下次一定要给它装个追踪器！",--蟾蜍逃走了


	ANNOUNCE_DAMP = "好像有点潮湿……衣服变得有点重了。",		--潮湿（1级）
	ANNOUNCE_WET = "器材受潮了……早知道多做点防水措施了！",		--潮湿（2级）
	ANNOUNCE_WETTER = "呜……感觉自己像只落汤羽鸡……",		--潮湿（3级）
	ANNOUNCE_SOAKED = "不管是衣服还是设备都湿透了！我要去烤火！",		--潮湿（4级）

	ANNOUNCE_WASHED_ASHORE = "咳咳！差点就淹死在里面了……这可不是什么好实验！",--落水上岸

    ANNOUNCE_DESPAWN = "该交班了，我也要回去休息一下啦。",--什么下线，这TM是换人
	ANNOUNCE_BECOMEGHOST = "我是幽灵！呜呜呜呜呼呼呼！",--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "呜啊！感觉大脑在颤抖……",--队友死亡掉san
	ANNOUNCE_PETRIFED_TREES = "不可思议……这些树木正在变成石头！",--应该是选取石化区域时选中范围内有玩家才会触发（概率很小，应该吧？可能老早就删掉了）
	ANNOUNCE_KLAUS_ENRAGE = "它的各项指数暴涨！它生气了！",--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "复活了？它的再生能力也太强了吧！小心！",--克劳斯复活二阶段
	ANNOUNCE_KLAUS_CALLFORHELP = "它在呼叫增援！小心旁边！",--克劳斯召唤小偷

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "发掘工作中，轻拿轻放……",		--这段是挖月岛三个天体部件的台词
		GLASS_LOW = "探测显示快到底了……小心。",		--第一个是头顶尖尖的祭坛底座
		GLASS_REVEAL = "出土成功！保存得很完整！",	
		IDOL_MED = "发掘工作中，轻拿轻放……",		--第二个是头顶月牙的祭坛雕像
		IDOL_LOW = "探测显示快到底了……小心。",		
		IDOL_REVEAL = "出土成功！保存得很完整！",		
		SEED_MED = "发掘工作中，轻拿轻放……",		--第三个是脑袋圆圆的祭坛宝球
		SEED_LOW = "探测显示快到底了……小心。",		
		SEED_REVEAL = "出土成功！保存得很完整！",		
	},

    --万圣夜活动
    ANNOUNCE_SPOOKED = "噗通噗通……只是幻觉吗？",--被万圣夜砍树触发的蝙蝠特效吓到
	ANNOUNCE_BRAVERY_POTION = "精神稳定剂摄入完毕，幻觉退散！",--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "实验失败？记录数据，准备下一次尝试。",--变异失败（不确定怎么触发）

	--冬季盛宴活动
	ANNOUNCE_EATING_NOT_FEASTING = "补充能量是必须的，哪怕还没到开饭时间。",--非节日食用冬季盛宴料理（？）貌似不会触发
	ANNOUNCE_WINTERS_FEAST_BUFF = "体温开始回升了……如果能把这个配方带回莱茵生命就好了。",--获得冬季盛宴料理buff触发
	ANNOUNCE_IS_FEASTING = "麦哲伦探险队，开始用餐！",--享用冬季盛宴料理时
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "补给完成，能量满满！",--冬季盛宴料理buff结束

    --熔炉活动
    ANNOUNCE_REVIVING_CORPSE = "坚持住！医疗无人机很快就到！",--尝试复活倒地队友时
    ANNOUNCE_REVIVED_OTHER_CORPSE = "复苏成功！欢迎回来！",--复活队友成功
    ANNOUNCE_REVIVED_FROM_CORPSE = "感谢救援！我欠你一次。",--被队友复活（这三条都是倒地mod和熔炉模式用到的）

    ANNOUNCE_FLARE_SEEN = "看到了信号弹！在那边！",--远处有信号弹发射
    ANNOUNCE_MEGA_FLARE_SEEN = "那是……红色信号弹？全员警戒！",--远处有敌对信号弹发射
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "声呐探测到有大东西过来了！",--这是拖出海妖了？印象里海难貌似没有这句可能无调用

    --薇洛专属
	ANNOUNCE_LIGHTFIRE =
	{
		"控制火的技巧……很有意思。",--薇洛紧张放火台词
    },

    --薇诺娜专属
    ANNOUNCE_HUNGRY_SLOWBUILD =
    {
	    "肚子饿了，手也变慢了……",--女工饥饿状态制作物品（想和官方人物一样的话可以多写点）
    },
    ANNOUNCE_HUNGRY_FASTBUILD =
    {
	    "为了科学，这点饥饿不算什么！",--女工制作物品减饱食度触发台词
    },

   --沃姆伍德专属
    ANNOUNCE_KILLEDPLANT =
    {
        "虽然是为了生存……但破坏这些植物还是有点可惜。",--植物人砍树铲树根等操作触发台词
    },
    ANNOUNCE_GROWPLANT =
    {
        "加油生长吧！让我记录下你的生长数据！",--植物人种植触发台词
    },
    ANNOUNCE_BLOOMING =
    {
        "检测到植物激素激增……哇，开花了！",--植物人开花台词
    },

    --沃拓克斯专属
    ANNOUNCE_SOUL_EMPTY =
    {
        "灵魂能量……耗尽了。",--恶魔人用光灵魂台词
    },
    ANNOUNCE_SOUL_EMPTY_NICE =
    {
        "支援中断……必须重新充能。",--恶魔人用光灵魂台词（好孩子分支）
    },
    ANNOUNCE_SOUL_EMPTY_NAUGHTY =
    {
        "还需要更多……为了探索！",--恶魔人用光灵魂台词（淘气包分支）
    },
    ANNOUNCE_SOUL_FEW =
    {
        "力量快耗尽了……得省着点用。",--恶魔人灵魂快用光台词（默认状态）
    },
    ANNOUNCE_SOUL_FEW_NICE =
    {
        "这样做……会不会对生态造成影响？",--恶魔人灵魂快用光台词（好孩子分支）
    },
    ANNOUNCE_SOUL_FEW_NAUGHTY =
    {
        "为了探求真理，这点代价是必须的！",--恶魔人灵魂快用光台词（淘气包分支）
    },
    ANNOUNCE_SOUL_MANY =
    {
        "容器充能完毕，状态良好。",--恶魔人灵魂充足台词（默认状态）
    },
    ANNOUNCE_SOUL_MANY_NICE =
    {
        "携带这么多高能物质……稍微有点担心泄露。",--恶魔人灵魂充足台词（好孩子分支）
    },
    ANNOUNCE_SOUL_MANY_NAUGHTY =
    {
        "这种充满力量的感觉……就像推进器全开一样！",--恶魔人灵魂充足台词（淘气包分支）
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "警告！容器压力过大！由于未知原因即将失控！",--恶魔人灵魂过载（爆魂）台词（默认状态）
    },
    ANNOUNCE_SOUL_OVERLOAD_NICE =
    {
        "糟糕……操作失误了！",--恶魔人灵魂过载（爆魂）台词（好孩子分支）
    },
    ANNOUNCE_SOUL_OVERLOAD_NAUGHTY =
    {
        "哇，这股力量好强……得记下来！",--恶魔人灵魂过载（爆魂）台词（淘气包分支）
    },
    ANNOUNCE_SOUL_OVERLOAD_WARNING =
    {
        "要溢出来了！得赶紧释放掉！",--恶魔人灵魂过多警告状态台词（淘气包专属）
    },
    ANNOUNCE_SOUL_OVERLOAD_AVOIDED =
    {
        "读数回归正常范围……呼。",--恶魔人退出灵魂警告状态台词（淘气包专属）
    },
    ANNOUNCE_PANFLUTE_BUFF_ACTIVE =
    {
        "可以再吹一曲啦！",--恶魔人排箫技能CD到
    },
    ANNOUNCE_PANFLUTE_BUFF_USED =
    {
        "播放完毕，在这个距离下效果应该是最好的。",--恶魔人排箫技能使用完毕（进入CD）
    },

    --沃尔特专属
	ANNOUNCE_AMMO_SLOT_OVERSTACKED = "弹药仓容量已达上限。",--试图替换弹性升级过的弹弓内的弹药且身上放不下了
	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =--弹弓内无弹药攻击（随机触发一句）
	{
		"弹药耗尽！",
		"请求补给！",
	},
	ANNOUNCE_SLINGHSOT_NO_AMMO_SKILL = "缺乏相关的操作经验……",--无对应技能点使用弹药
	ANNOUNCE_SLINGHSOT_NO_PARTS_SKILL = "这个升级套件……我需要查阅一下说明书。",--无对应技能点使用升级套件
	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
	{
        "光源丢失，记录中止。",--讲故事讲一半火灭了
	},
	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
	{
        "天亮了，探险记录暂停。",--白天讲故事结束
	},
	ANNOUNCE_WOBY_RETURN =
	{
		"归队，探险伙伴一号！",--召唤沃比
	},
	ANNOUNCE_WOBY_SIT =
	{
		"乖乖待在这里哦。",--待命沃比
	},
	ANNOUNCE_WOBY_FOLLOW =
	{
		"探险队出发！跟紧了！",--跟随沃比
	},
	ANNOUNCE_WOBY_PRAISE =
	{
		"好孩子！回头给你找点好吃的！",--夸奖沃比
	},
	ANNOUNCE_WOBY_FORAGE =
	{
		"去帮我找点有趣的东西吧！",--给沃比下搜寻物品
	},
	ANNOUNCE_WOBY_WORK =
	{
		"这个任务就交给你了，加油哦！",--命令沃比协助开采
	},
	ANNOUNCE_WOBY_COURIER =
	{
		"跑腿任务开始！小心别弄丢了！",--给沃比下达运送命令
	},
	ANNOUNCE_WOBY_REMEMBERCHEST_FAIL =
	{
		"咦？找不到了吗？没关系。",--运送任务失败（对应容器消失）
	},

    -- 机器人专属
    ANNOUNCE_WX_SCANNER_NEW_FOUND = "探测器响了！是什么新奇的东西吗？",--周围有可被吉米扫描的物品
    ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "这个已经看过了，换一个吧。",--周围有扫描物但已经扫描过

    --暴食活动
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "这个配方……感觉有点怪怪的？",--放错食材
    QUAGMIRE_ANNOUNCE_MEALBURNT = "呀！火太大了！",--过火了
    QUAGMIRE_ANNOUNCE_LOSE = "实验失败……我们再试一次吧？",--暴食活动失败
    QUAGMIRE_ANNOUNCE_WIN = "烹饪实验大成功！大家都很棒！",--暴食活动胜利

    ANNOUNCE_ROYALTY = 
    {
        "向您致敬！",--向带着蜂王帽的队友鞠躬
        "您好！",
        "很有领袖气质！",
    },
    ANNOUNCE_ROYALTY_JOKER =
    {
        "哈哈，真有趣的伪装！",--向带着蜂王帽的队友鞠躬（小丑帽皮肤）
        "是在玩捉迷藏吗？",
        "我也想要这种神奇的帽子！",
    },
--buff相关
    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "感觉充满了能量！噼里啪啦的！",--带电效果
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "喔哦！力气变大了！",--辣粉效果
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "有了这层防护，探险就更安全了！",--蒜粉效果
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "干劲十足！工作效率提升！",--蜂蜜水晶效果
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "防水准备就绪，下雨也不怕！",--干燥（蓝带鱼排）效果
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "精神焕发！就像睡了个好觉！",--蘑菇蛋糕效果
--棱镜部分（buff相关）
    ANNOUNCE_ATTACH_BUFF_L_PLANARDEFENSE = "虽然看不见，但我感觉被保护着！",--位面稳固
    ANNOUNCE_ATTACH_BUFF_L_PLANARATTACK = "武器好像变锋利了！",--位面激进
    ANNOUNCE_ATTACH_BUFF_L_LUNARRESIST = "虽然不知道原理，但好像不怕月亮了？",--月光防御
    ANNOUNCE_ATTACH_BUFF_L_SHADOWRESIST = "这样阴影就不敢靠近了吧？",--影子防御
    ANNOUNCE_ATTACH_BUFF_L_DISSIPATESHADOW = "照明弹发射！把黑暗都赶走！",--破影
    ANNOUNCE_ATTACH_BUFF_L_DIMMOONLIGHT = "月光变得柔和了，适合观察。",--闭月
    ANNOUNCE_ATTACH_BUFF_L_BATDISGUISE = "蝙蝠伪装！我也能飞了？",--蝙蝠伪装
    ANNOUNCE_ATTACH_BUFF_L_BESTAPPETITE = "肚子饿得咕咕叫，能吃下一整头牛！",--好胃口
    ANNOUNCE_ATTACH_BUFF_L_HUNGERRETARDER = "感觉不到饿了，可以专心工作了。",--饱腹感
    --ANNOUNCE_ATTACH_BUFF_L_STRENGTHENHANCER = "" --药酒buff       --属于药酒的buff，但是药酒已经会让玩家说话了，所以这里不再重复说
    ANNOUNCE_ATTACH_BUFF_L_OILFLOW = "呜……这油的黏度有点高……",--腹得流油
    ANNOUNCE_ATTACH_BUFF_L_MERCIFUL = "这次就算了，我不喜欢无谓的争斗。",--怜悯
    ANNOUNCE_ATTACH_BUFF_L_WARM = "暖乎乎的，像在火炉边一样。",--温暖
    ANNOUNCE_ATTACH_BUFF_L_COOL = "好凉快，这里是有空调吗？",--凉爽
    ANNOUNCE_ATTACH_BUFF_L_SOFTSKIN = "皮肤变得有弹性了？嘿嘿~",--柔软皮肤
    ANNOUNCE_ATTACH_BUFF_L_SIVBLOODREDUCE = "来抓我呀！嘿嘿，骗你的。",--假弱皮肤
    ANNOUNCE_ATTACH_BUFF_L_FIREPROOF = "我不怕火啦！但还是离远点好。",--隔火皮肤（涂抹防火漆）

--buff结束相关
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "电光消失了。",--带电结束
    ANNOUNCE_DETACH_BUFF_ATTACK            = "呼……冷静下来了。",--辣粉结束
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "防御效果失效了。",--蒜粉结束
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "稍微休息一下吧。",--蜂蜜水晶结束
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "防水层磨损了，要小心受潮。",--干燥结束
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "哈欠……困意涌上来了。",--蘑菇蛋糕效果结束
--棱镜部分（buff结束相关）
    ANNOUNCE_DETACH_BUFF_L_PLANARDEFENSE = "保护的感觉消失了。",--位面稳固结束
    ANNOUNCE_DETACH_BUFF_L_PLANARATTACK = "武器恢复原样了。",--位面激进结束
    ANNOUNCE_DETACH_BUFF_L_LUNARRESIST = "那种奇怪的护盾消失了。",--月光防御结束
    ANNOUNCE_DETACH_BUFF_L_SHADOWRESIST = "中和剂好像失效了。",--影子防御结束
    ANNOUNCE_DETACH_BUFF_L_DISSIPATESHADOW = "阴影又聚过来了……注意警戒。",--破影结束      --是的，玩梗就要整全套的，CF蓝老头和小黄经典死亡音效致敬
    ANNOUNCE_DETACH_BUFF_L_DIMMOONLIGHT = "月光恢复常态了。",--闭月结束
    ANNOUNCE_DETACH_BUFF_L_BATDISGUISE = "变回来啦！",--蝙蝠伪装结束      --原作经典场面致敬
    ANNOUNCE_DETACH_BUFF_L_BESTAPPETITE = "终于吃饱了……嗝。",--好胃口
    ANNOUNCE_DETACH_BUFF_L_HUNGERRETARDER = "又开始饿了……",--饱腹感结束     --《荒野求生》德爷梗句致敬
    ANNOUNCE_DETACH_BUFF_L_STRENGTHENHANCER = "感觉体力恢复正常了。", --药酒buff结束
    ANNOUNCE_DETACH_BUFF_L_OILFLOW = "终于清理干净了……下次不要再碰这种油了。",--腹得流油结束
    ANNOUNCE_DETACH_BUFF_L_MERCIFUL = "如果是为了保护大家，我也不会手软的。",--怜悯结束
    ANNOUNCE_DETACH_BUFF_L_WARM = "暖乎乎的感觉消失了……稍微有点冷。",--温暖结束
    ANNOUNCE_DETACH_BUFF_L_COOL = "呼，凉爽的感觉没有了。",--凉爽结束
    ANNOUNCE_DETACH_BUFF_L_BATH = "清洁完成！感觉像新的一样！",--出浴（应该算结束吧，毕竟前面名称是DETACH）
    ANNOUNCE_DETACH_BUFF_L_SOFTSKIN = "皮肤变得有弹性了？嘿嘿~",--柔软皮肤结束
    ANNOUNCE_DETACH_BUFF_L_SIVBLOODREDUCE = "伪装结束，继续任务！",--假弱皮肤结束
    ANNOUNCE_DETACH_BUFF_L_FIREPROOF = "隔热层失效了，小心火源。",--隔火皮肤结束


    BUFF_L_OILFLOW = {--腹得流油触发
    "好油腻……仪器都要拿不稳了……", "这个不符合食品安全标准吧？", "肚子在抗议了……", "下次请给我准备标准的探险口粮……", "这种口感……像是在咀嚼润滑油……",
    "呕……","这简直是味觉灾难……","这是在测试我的生存极限吗！","感觉……晕头转向……","唔……希望没被无人机拍下来这副狼狈的样子……","探险家……也要学会忍受糟糕的食物……",
    "这个配方……是不是哪里搞错了？","没事的……麦哲伦可以坚持！","唔额……","只是一点油而已，我可以克服，嗯……","这只是个噩梦……",
    "我……","还没结束吗？",--最后一句是直接抄的露米台词，是的也是致敬
},
    ANNOUNCE_BUFF_L_EFFORTLUCK = {--好事多蘑
        ATTACH = "虽然科学不讲运气，但……希望能有好结果！",--食用好运物品触发
        COST = "只要尝试次数够多，总会成功的！",--好事多蘑触发（非保底）
        DETACH = "啊……好运好像用光了。",--好事多蘑触发（保底/好运结束）
        CHECK = "感觉今天也很幸运呢！" --检查好运食物后缀
    },
    SOAK_L = { --泉池浸泡提示
            NOSPACE = { "那个……我也想进去……", "挤一挤可以吗？不行吗？", "呜，没有位置了……", "大家都很喜欢这里呢。", }, --浸泡失败（无位置）
            REFUSE = { "得先把工作做完才行！" }, --拒绝泡澡，貌似没有调用吧
            REFUSE_WATER = { "等等，仪器还没做防水处理！", "虽然我很想跳下去，但是装备会坏的。", "湿漉漉的话，操作无人机会打滑的。", "先做点防水措施吧。", "整理装备优先。" }, --浸泡失败（潮湿值过高）
            DIZZY1 = { "呼……感觉像飘在云端一样……", "这就是极地考察后的最高享受……", "要在水里睡着了……", "肌肉完全放松了……好舒服。" }, --1级晕乎乎？wiki我都找不到触发的条件，实际去试又太麻烦了
            DIZZY2 = { "是不是泡太久了？有点晕……", "感觉世界在转圈圈……", "脸是不是很红？", "也许该出去了？", }, --2级晕乎乎？     --说实话这种提示部分不写点注释我真的有点难以理解
            DIZZY3 = { "（发出舒服的呼噜声……）", "眼前好多小星星……", "热乎乎的……不行了……", "呼……哈……", }, --3级（满级）晕乎乎？
            COSY = { "满血复活！", "好~舒~服~", "这才是探险的意义！", "能量充满！可以再工作三天三夜！", }, --达到出浴buff触发阈值？
            WARM = { "暖和起来了！", "感觉身体里的冰块都融化了。", "很温暖……", }, --获得温暖buff
            COOL = { "好凉快！", "思绪变得清晰了。", "很清爽。", }, --获得凉爽buff

        },

	ANNOUNCE_OCEANFISHING_LINESNAP = "哎呀！线断了！力气太大了吗？",--钓鱼断线
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "咦？鱼跑掉了？什么时候？",--鱼上钩但没有拉钩
	ANNOUNCE_OCEANFISHING_GOTAWAY = "啊，逃跑了……下次一定要抓住你！",--钓鱼期间切换手持物
	ANNOUNCE_OCEANFISHING_BADCAST = "抛投角度偏差……再试一次！",--甩杆甩到地面上
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"这比等待极地气象数据还要漫长……",--许久没有海鱼上钩
		"耐心是科研工作的必备素质，嗯。",--这四句都是一样的随机触发
		"也许我可以改装一下声呐来找鱼？",--每过15-20秒没有鱼上钩就触发一次
		"哼哼~♪",
	},

	ANNOUNCE_WEIGHT = "实测重量：{weight}。记录完毕。",--称量普通鱼
	ANNOUNCE_WEIGHT_HEAVY  = "实测重量：{weight}\n哇！这是什么深海巨兽！",--称量重鱼（蟹奶奶收的那种）

	ANNOUNCE_WINCH_CLAW_MISS = "打捞失败，什么都没抓到。",--夹夹绞盘没捞上物品（附近有可打捞物才会触发，没有不会触发）
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "声呐探测范围内无目标。",--正如上面所说的，附近没有物品的话空捞貌似不会触发这句，可能是官方代码出现了问题

    --沃特专属提示语
    ANNOUNCE_KINGCREATED = "观测到新领袖的诞生，这也属于社会学范畴吧？",--鱼人王养成
    ANNOUNCE_KINGDESTROYED = "领袖消失了，它们的社会体系会崩溃吗？",--鱼人王死亡？（我没有研究过这方面的东西，我不喜欢鱼妹也没有鱼妹）
    ANNOUNCE_CANTBUILDHERE_THRONE = "这里的地形不适合建造据点。",--制作皇家地毯的地皮不是沼泽地皮
    ANNOUNCE_CANTBUILDHERE_HOUSE = "这里太干燥了，它们不喜欢。",--制作手工鱼人屋的地方不是沼泽地皮
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "这里视野不好，不适合放哨。",--制作鱼人勇士屋的地方不是沼泽地皮
    ANNOUNCE_READ_BOOK =--暂定鱼妹的，如果有需要我会写的，感觉有点难度
    {
        BOOK_SLEEP = "催眠频率分析……哈欠……效果显著……",--楞读睡书
        BOOK_BIRDS = "《鸟类图鉴》？让我想起了以前的考察记录。",--楞读鸟书
        BOOK_TENTACLES =  "《沼泽生物生态报告》……有点重口。",--楞读触手书
        BOOK_BRIMSTONE = "那是……高能反应预警？阅读需要谨慎。",--楞读雷书（末日将至！）
        BOOK_GARDENING = "《基础植物学》，温室管理的必修课。",--楞读普通园艺学
		BOOK_SILVICULTURE = "林业生态恢复工程？值得参考。",--楞读造林学
		BOOK_HORTICULTURE = "精细化种植指南，很有研究价值。",--楞读旧版园艺学

        BOOK_FISH = "《水生生物习性记录》。",--楞读鱼书
        BOOK_FIRE = "怎么会有关于怎么放火的书……",--楞读控火术
        BOOK_WEB = "节肢动物行为学分析……我不太擅长应付这个。",--楞读蛛网书
        BOOK_TEMPERATURE = "环境温度调节……如果有对应的设备就好了。",--楞读控温学
        BOOK_LIGHT = "人造光源技术史？这个我感兴趣！",--楞读永恒之光
        BOOK_RAIN = "局部气象干预？这可是大发现！",--楞读雨书
        BOOK_MOON = "月球引力对生态的影响……记下来。",--楞读月圆书
        BOOK_BEES = "昆虫养殖规范？不知道有没有针对源石虫的。",--楞读养蜂笔记

        BOOK_HORTICULTURE_UPGRADED = "进阶植物学……数据量好大，头要晕了。",--楞读升级园艺学
        BOOK_RESEARCH_STATION = "简直是百科全书！",--楞读百科
        BOOK_LIGHT_UPGRADED = "高强度照明技术，可以改进一下探照灯。",--楞读升级永恒之光
        --棱镜部分
        BOOK_WEATHER_SUNNY = "天气控制：晴朗。要是极地也能这么方便就好了。",--晴天楞读多变的云
        BOOK_WEATHER_RAINY = "天气控制：降雨。注意防水！",--雨天楞读多变的云
    },

    ANNOUNCE_WEAK_RAT = "小家伙热量不足了吗？",--鼠子饿了？

    ANNOUNCE_CARRAT_START_RACE = "竞速开始！让我看看你们的速度！",--鼠子赛跑开始

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "方向错了！快回来！",--鼠子跑错方向了
        "我们要去的是那边！",--这句也是跑错方向了
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "比赛中不能睡觉啊！醒醒！",--比赛过程中鼠子睡着了
    ANNOUNCE_CARRAT_ERROR_WALKING = "速度太慢了，加油冲刺！",--比赛过程中鼠子慢下来
    ANNOUNCE_CARRAT_ERROR_STUNNED = "反应慢半拍？别发呆啦！",--鼠子起步慢了

    ANNOUNCE_GHOST_QUEST = "仪器探测到微弱的信号……有人在求助吗？",--帮助小惊吓
    ANNOUNCE_GHOST_HINT = "它好像想通过某种频率传达信息。",--小惊吓任务开始
    ANNOUNCE_GHOST_TOY_NEAR = {
        "信号源越来越强了。",--小惊吓玩具就在附近
        "就在这附近！",
    },
	ANNOUNCE_SISTURN_FULL = "花朵的能量让它平静下来了。",--骨灰罐填满加速阿比复活时触发
    ANNOUNCE_SISTURN_FULL_EVIL = "虽然能量性质有点……奇怪，但好像起效了。",--骨灰罐填满加速阿比复活时触发（恶魔花）
    ANNOUNCE_SISTURN_FULL_BLOSSOM = "很温暖的治愈能量，感觉很好。",--骨灰罐填满加速阿比复活时触发（月树花）
    ANNOUNCE_ABIGAIL_DEATH = "灵体消散了……别担心，我会想办法的！",--阿比趋势了
    ANNOUNCE_ABIGAIL_RETRIEVE = "先回来休息一下吧。",--召回阿比
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "它快撑不住了！快撤回来！",--阿比血量危险
    ANNOUNCE_ABIGAIL_SUMMON =--这三句都是召唤阿比盖尔，每一级都有对应的召唤台词
	{
		LEVEL1 = "灵体投射，开始！",--阿比一级时召唤
		LEVEL2 = "我们需要你的力量，出来吧！",--阿比二级时召唤
		LEVEL3 = "就像我的无人机一样可靠……甚至更强！守护我们吧！",--阿比三级时召唤
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
		LEVEL2 = "变强了，状态不错！",--阿比升级至二级
		LEVEL3 = "这就是最强状态吗？好厉害！",--阿比升级至三级
	},

    ANNOUNCE_NOINSPIRATION = "缺少必要的乐器组件。",--乐谱唱不出来
    ANNOUNCE_NOTSKILLEDENOUGH = "嗯……这段旋律太复杂了，我还需要学习。",--没有点乐谱的对应技能点
    ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "声波干扰已释放，吸引目标注意！",--粗鲁插曲
    ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "高频驱散声波发射！",--惊心独白
    ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "治疗音律覆盖全队！坚持住！",--战士重奏

    ANNOUNCE_WANDA_YOUNGTONORMAL = "这……我已经成年了吗？时间过得真快。",--时间值从青年达到中年
    ANNOUNCE_WANDA_NORMALTOOLD = "这种感觉……身体机能在衰退。",--时间值从中年达到老年
    ANNOUNCE_WANDA_OLDTONORMAL = "呼……感觉力气又回来了。",--时间值从老年达到中年
    ANNOUNCE_WANDA_NORMALTOYOUNG = "充满活力！",--时间值从中年达到青年

	ANNOUNCE_POCKETWATCH_PORTAL = "呜……这种传送方式不管几次都让人头晕……",--使用（跳入）时间裂隙（裂缝表产生）

	ANNOUNCE_POCKETWATCH_MARK = "空间坐标已记录。这里很重要。",--标记裂缝/溯源表
	ANNOUNCE_POCKETWATCH_RECALL = "启动回溯！我们要回去啦！",--使用溯源表（单人传送）
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "虽然不如我不久前提出的那个方案稳定，但通道打开了！",--开启时间裂缝（激活裂缝表）
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "要进行远距离传送了，大家抓紧！",--洞穴地上互传（激活裂缝表）

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "新知识！赶快记下来……",--获得档案馆蓝图（完成档案馆解密）
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "这个我已经知道了。",--学习重复蓝图
    ANNOUNCE_ARCHIVE_NO_POWER = "没电了……就像没充电的无人机一样动不了。",--试图激活没电的档案馆机器

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "植物图谱更新！又多认识了一种植物。",--耕地帽学习新植物
    },

    ANNOUNCE_PLANT_RANDOMSEED = "这颗种子的基因序列很特别，会种出什么呢？",--学习普通种子的种子形态

    ANNOUNCE_FERTILIZER_RESEARCHED = "原来这种肥料的效果是这样的……记住了。",--学习新的肥料

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"呜……好麻……这草有毒……",--火荨麻效果
		"好热……感觉像发烧了一样……",--两句好像是随机触发的
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "毒素代谢完了，感觉好多了。",--火荨麻效果结束

	ANNOUNCE_TALK_TO_PLANTS =--与植物对话
	{
        "一定要长得高高壮壮的哦！",--随机触发一句
        "我会定期来记录你们的身高的。",
		"如果你们有意识的话，能听到我的声音吗？",
        "在莱茵生命，我们有专门的科室研究植物呢。",
        "大家都要健康成长哦。",
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "躲猫猫吗？我一定会找到你的！",--躲猫猫开始
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "我也要玩！带我一个！",--中途加入捉迷藏
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"在这里！",--找到小猫且不是最后一个，随机触发
		"虽然你会隐身，但也逃不过我的眼睛。",
		"抓到你啦！",
		"嘿嘿，找到一只。",
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "雷达显示……啊不对，直觉告诉我还有一只！",--捉迷藏剩最后一只小猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "全部找到了！太棒了！",--找到最后一只小猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "这就是团队协作的力量！",--队友找到最后一只小猫
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "时间快到了，大家加油呀！",--捉迷藏即将结束
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "任务失败……虽然过程很有趣，但稍微有点不甘心。",--捉迷藏结束
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "离得太远了，会找不到的。",--离开躲藏区域
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "快回到游戏区域去！",--回到躲藏区域
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "野外发现可爱生物！让我摸摸……？",--在大世界中找到小猫

	ANNOUNCE_TICOON_START_TRACKING	= "这孩子好像想带我去哪里。",--大虎开始寻找
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "什么都没发现，是它搞错了吗？",--世界上没有可寻找的小浣猫
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "它停下来了，是在等我吗？",--大虎进入等待
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "它在叫我！",--大虎吸引注意？
	ANNOUNCE_TICOON_NEAR_KITCOON = "就在这附近！",--大虎发现小猫
	ANNOUNCE_TICOON_LOST_KITCOON = "已经被别人找到啦。",--大虎追踪对象被别人找到
	ANNOUNCE_TICOON_ABANDONED = "抱歉，我要先走了。",--遗弃大虎
	ANNOUNCE_TICOON_DEAD = "探测到生命体征消失……怎么会……",--大虎似了

    -- 牛年比赛
    ANNOUNCE_CALL_BEEF = "过来，大个子，乖乖的哦。",--绑定牛到某个栓牛桩
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "这里不适合搭舞台呢。",--舞台离裁判台太远
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "新的缝纫图纸！学会了！",--学习新牛服饰

    -- 恐怖之眼事件
    ANNOUNCE_EYEOFTERROR_ARRIVE = "空中出现高能生物反应！大家注意隐蔽！",--赛尔胡之眼/双胞胎出现
    ANNOUNCE_EYEOFTERROR_FLYBACK = "它又回来了！",--再次召唤泰拉BOSS
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "它走了……真是危险的生物。",--泰拉BOSS下班

    -- 猴子诅咒相关
    ANNOUNCE_CANT_ESCAPE_CURSE = "甩不掉！这是什么原理？",--试图扔掉猴子诅咒或者挪动诅咒位置
    ANNOUNCE_MONKEY_CURSE_1 = "我的手……怎么长毛了？！",--身上没有诅咒的情况下猴子诅咒进入背包并且生效
    ANNOUNCE_MONKEY_CURSE_CHANGE = "身体在变化……什么？！我变成了猴子？",--变成猴子
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "呼……终于变回来了。还是原本的身体习惯。",--解除猴子诅咒

    ANNOUNCE_PIRATES_ARRIVE = "有海盗接近！准备战斗！",--海盗袭击开始

    ANNOUNCE_BOOK_MOON_DAYTIME = "现在是白天，实验条件不满足。",--非夜晚阅读月书且生效

    ANNOUNCE_OFF_SCRIPT = "哎呀，好像演错了……",--穿着错误服装试图表演

    ANNOUNCE_COZY_SLEEP = "睡得真香……感觉精神百倍！",--穿着睡帽睡一觉

	--
	ANNOUNCE_TOOL_TOOWEAK = "这个太硬了！得换个更好的工具。",--敲柱子时工具等级不够

    ANNOUNCE_LUNAR_RIFT_MAX = "检测到高能辐射反应！请注意防护！",--月亮裂隙开始刷新亮茄？管他呢反正是裂隙闪光（就是二阶段之后一段时间，并不是开始刷新晶体）
    ANNOUNCE_SHADOW_RIFT_MAX = "暗物质浓度太高了！",--暗影裂隙发光

    ANNOUNCE_SCRAPBOOK_FULL = "数据库满了，不用再记啦。",--图鉴满了继续学习丢失图鉴

    ANNOUNCE_CHAIR_ON_FIRE = "着火了！快灭火！我不想变成烤羽兽！",--椅子着火了哈哈哈哈哈，官方台词全是This is fine.的梗哈哈哈

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "抗酸涂层失效了，还是离远点好。",--黏糊糊药膏效果消失（防酸消失）
    
    ANNOUNCE_COACH = 
    {
        "only_used_by_wolfgang",--沃尔夫冈教练技能使用时触发的台词（这玩意好像没啥人点所以存在感很低）
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "only_used_by_wolfgang",--虚弱状态吹哨
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "only_used_by_wolfgang",--强壮形态吹哨
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "only_used_by_wolfgang",--训练开始
    ANNOUNCE_WOLFGANG_END_COACHING = "only_used_by_wolfgang",--训练结束
    ANNOUNCE_WOLFGANG_NOTEAM = 
    {
        "only_used_by_wolfgang",--教练技能期间无作用对象（随机触发一句）
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },

    ANNOUNCE_YOTD_NOBOATS = "等人齐了再出发吧！",--船距离起点塔过远
    ANNOUNCE_YOTD_NOCHECKPOINTS = "应该多设几个观测点。",--龙舟活动检查点过少
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "安全第一，这里不适合继续航行。",--龙舟活动水域过小或过多障碍物

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "浮力不足，船要沉了！快回去！",--将水獭船或相似的船？划入非浅水海域（盐矿海域算浅水）总之就是船开始下沉掉血了
    ANNOUNCE_OTTERBOAT_DENBROKEN = "船坏了！糟糕！",--拆掉水獭巢导致水獭船开始漏水

    ANNOUNCE_GATHER_MERM = "可能是鱼人们的传统。",--海带盘开始生效？

    -- 裂隙 4
    ANNOUNCE_EXIT_GELBLOB = "呸呸……好多粘液……",--被恶液吐出       --u1s1我也很想看大战史莱姆
	ANNOUNCE_SHADOWTHRALL_STEALTH = "哇！被偷袭了！",--被蛇墨荒偷袭
    ANNOUNCE_RABBITKING_AGGRESSIVE = "生物攻击性极强！保持距离！",--生气兔王钻出
    ANNOUNCE_RABBITKING_PASSIVE = "它看起来可以交流……你好？",--友善兔王钻出
    ANNOUNCE_RABBITKING_LUCKY = "那是变异个体吗？好想研究一下！",--幸运兔子生成
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "抓到了！好罕见的小家伙！",--抓住幸运兔子
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "这里好像叫不出兔子来。",--在打不出洞的地方吹兔子号角

	-- 2024 万圣夜
	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "南瓜着火了！可惜了我的杰作……",--雕刻南瓜期间南瓜着火

	-- 2024 冬季盛宴
	ANNOUNCE_SNOWBALL_TOO_BIG = "雪球不能再大啦！",--雪球滚成最大
	ANNOUNCE_SNOWBALL_NO_SNOW = "雪不够多，没法做雪球。",--地上无积雪时滚雪球

    -- 元数据 5
    ANNOUNCE_WENDY_BABYSITTER_SET = "先在这里等着哦。", --给阿比下达待命命令
    ANNOUNCE_WENDY_BABYSITTER_STOP = "那里危险！快回来！",--给阿比下达撤退👎命令

	ANNOUNCE_WORTOX_REVIVER_FAILTELEPORT = "传送失败了，换个地方试试？",--双尾心传送失败（一般是恶魔人在地下时队友在地上使用触发）

    ANNOUNCE_NO_ABIGAIL_FLOWER = "这不是我能用的装备。",--使用药剂缺少阿比花
    --灵魂花冠相关
    ANNOUNCE_ELIXIR_BOOSTED = "感觉……好多回忆涌上来了。",--使用恐怖经历
    ANNOUNCE_ELIXIR_GHOSTVISION = "能看到不一样的东西了！是新的视觉波段！",--使用夜影万金油
    ANNOUNCE_ELIXIR_PLAYER_SPEED = "感觉身体轻了好多！冲呀！",--使用强健精油

    ANNOUNCE_ELIXIR_TOO_SUPER = "这个劲太大了，我承受不住！",--使用技能树精油失败（比如光之怒）

    -- 裂隙 5
    ANNOUNCE_LUNARGUARDIAN_INCOMING = "有什么东西要来了……感觉很强大！",--天体仇灵到来（瓦器人BOSS召唤前置）
    ANNOUNCE_FLOATER_HELD = "浮力测试，开始！",--使用个人漂浮装置
    ANNOUNCE_FLOATER_LETGO = "解除浮力装置。",--应该算是主动下潜？反正就是从漂浮装置上撒手的台词

    -- 电击相关（现已更新为裂隙5.1）
    ANNOUNCE_LUNARHAIL_BIRD_SOUNDS = "这种天气对鸟类来说太残酷了。",--月雹开始宰鸟
    ANNOUNCE_LUNARHAIL_BIRD_CORPSES = "这就是自然界的残酷吗……可怜的小家伙。",--落鸟（脸着陆）
    ANNOUNCE_FLOAT_SWIM_TIRED = "我游不动了……请求上岸！",--游泳累了
    ANNOUNCE_MUTATED_BIRD_ATTACK = "空中单位来袭！注意头顶！",--水晶冠秃鹫群攻击？

    -- 裂隙 6
    ANNOUNCE_WEAPON_TOOWEAK = "打不动！这也太硬了！",--武器强度不足，无法穿透
    ANNOUNCE_VAULT_TELEPORTER_DOES_NOTHING = "怎么没反应？是不是坏了？",--档案馆传送另一端未修好
    -- 裂隙 6.1
	ANNOUNCE_LIGHTSOUT_SHADOWHAND = "嗯？刚刚是不是有什么东西？",--圣殿火炬解密出现影手（捣乱还是不捣乱呢？）

    -- 2025万圣节
    ANNOUNCE_MUTATED_BUZZARD_ARRIVAL = "天上那是……变异生物？！",--变异秃鹫群出现？官方注释是：（变异秃鹫出现，会潜伏并在玩家周围盘旋）        --这是哪的懂的都懂，我反正不懂，只是听人说的，乱写了个致敬
    --2025圣诞节
    ANNOUNCE_HERMITCRAB_SHELL_BADTELEPORTPOINT = "好像去不了那里。",--海螺传送失败
    ANNOUNCE_HERMITCRAB_SHELL_ARRIVE = "传送成功！也没有头晕。",--海螺传送成功

    
	BATTLECRY =
	{
		GENERIC = "战斗开始！大家小心！",--战斗
		PIG = "猪人先生，请冷静一下！",--战斗 猪人
		PREY = "抱歉啦，我需要食物！",--战斗 小型生物（无攻击性，标签是猎物）
		SPIDER = "虽然很有趣，但现在不是观察的时候！",--战斗 蜘蛛
		SPIDER_WARRIOR = "保护大家！",--战斗 蜘蛛战士
		DEER = "请保持距离！",--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "呼……安全了吗？",--追不上对方，现版本的联机版已经没有什么用了，因为只有进行攻击才会触发攻击台词，而被对象风筝很久的情况几乎不可能
		PIG = "呼……放弃追踪。",--追不上对方 猪人
		PREY = "跑掉了……跑得真快。",--追不上对方 小型生物
		SPIDER = "危险解除。",-- 追不上对方 蜘蛛
		SPIDER_WARRIOR = "终于停下来了。",--追不上对方 蜘蛛战士
	},

    DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "这就是我们来的地方……看起来很稳定。",-- 物品名:"绚丽之门"
        MULTIPLAYER_PORTAL_MOONROCK = "加上了月岩，能量流动变得不一样了。",-- 物品名:"天体传送门"
        MOONROCKIDOL = "看起来很有历史感。",-- 物品名:"月岩雕像" 制造描述:"重要人物。"
        CONSTRUCTION_PLANS = "有了蓝图，还需要找材料才行。",-- 物品名:"传送门用具"

        ANTLION =
        {
            GENERIC = "好大的昆虫！那是触角吗？",-- 物品名:"蚁狮"->默认
            VERYHAPPY = "它看起来心情不错。",-- 物品名:"蚁狮"->友好
            UNHAPPY = "它好像生气了！",-- 物品名:"蚁狮"->不高兴
        },
        ANTLIONTRINKET = "看起来像是什么庆典的遗留物，很有趣。",-- 物品名:"沙滩玩具"
        SANDSPIKE = "地上的沙子突然刺出来了！要小心！",-- 物品名:"沙刺"
        SANDBLOCK = "我也想堆沙堡！",-- 物品名:"沙堡"
        GLASSSPIKE = "这是……沙子被高温熔化了吗？",-- 物品名:"玻璃尖刺"
        GLASSBLOCK = "晶莹剔透的，真漂亮。",-- 物品名:"玻璃城堡"
        ABIGAIL_FLOWER =
        {
            GENERIC = "花……能感觉到某种力量。",-- 查看无主的阿比盖尔花
			LEVEL1 = "并没有完全展开……",-- 查看一级阿比盖尔花
			LEVEL2 = "光芒变强了一点。",-- 查看二级阿比盖尔花
			LEVEL3 = "能量反应达到峰值！",-- 查看三级阿比盖尔花

			-- 已废弃
            LONG = "这种感觉……稍微有点让人不安。",-- 阿比盖尔花在CD？（我没怎么玩过温蒂所以不是很了解）
            MEDIUM = "拿着它感觉有点冷……",-- 阿比升至二级？（应该是拿着别人的花在自己包里升级）
            SOON = "它在震动！好像有什么要出来了！",-- 阿比升至三级？
            HAUNTED_POCKET = "也许应该把它放在地上？",-- 旧版阿比召唤时需要扔地上击杀生物，这个应该就是提示应该扔花下来
            HAUNTED_GROUND = "仪式还没完成吗？",-- 应该是旧版召唤需要击杀的生物不够？
        },

        BALLOONS_EMPTY = "乳胶材料……可以制作简易的浮空装置。",-- 物品名:"一堆气球" 制造描述:"要是有更简单的方法该多好。"
        BALLOON = "充满气体的球体，具有一定的观赏性。",-- 物品名:"气球" 制造描述:"谁不喜欢气球呢？"
		BALLOONPARTY = "节日庆典用的装饰品，能提升团队士气。",-- 物品名:"派对气球" 制造描述:"散播一点欢笑。"
		BALLOONSPEED =
        {
            DEFLATED = "气体泄漏，功能失效。",-- 迅捷气球没气了
            GENERIC = "这能提供额外的气动升力吗？",-- 迅捷气球还有气
        },
		BALLOONVEST = "填充了轻质气体的防护服，理论上能减轻负重。",-- 物品名:"充气背心" 制造描述:"划船时带上这些艳丽的气球。"
		BALLOONHAT = "作为防护装备来说，它是不是有点太显眼了？",-- 物品名:"气球帽" 制造描述:"开启对话的出色工具！"

        BERNIE_INACTIVE =
        {
            BROKEN = "它好像坏了。",-- 伯尼噶了（没耐久了）
            GENERIC = "软绵绵的填充玩偶，好可爱。",-- 伯尼正常的物品状态
        },

        BERNIE_ACTIVE = "哇，它动起来了！在保护别人呢。",-- 低san的小型伯尼（会动但是没有巨大）
        BERNIE_BIG = "它变大了！还能打架呢！",-- 伯尼巨大化

		BOOKSTATION =
		{
			GENERIC = "移动式资料库。我可以把我的考察记录也放进去吗？",-- 物品名:"书架"->默认 制造描述:"所有图书均须遵循杜威十进制分类法整理。"
			BURNT = "资料库损毁！珍贵的知识都……",-- 书架烧掉剩的骨架
		},
        BOOK_BIRDS = "《世界鸟类学》，非常有用的参考书。",-- 物品名:"世界鸟类大全" 制造描述:"涵盖1000个物种：习性、栖息地及叫声。"
        BOOK_TENTACLES = "这涉及到了深层地下生物的研究，虽然很危险。",-- 物品名:"触手的召唤" 制造描述:"让我们来了解一下地下的朋友们！"
        BOOK_GARDENING = "《应用植物学》，对温室种植很有帮助。",-- 物品名:"应用园艺学" 制造描述:"讲述培育和照料植物的相关知识。"
		BOOK_SILVICULTURE = "《林业管理规范》，虽然我不擅长砍树。",-- 物品名:"应用造林学" 制造描述:"分支管理的指引。"
		BOOK_HORTICULTURE = "基础农业知识手册。",-- 物品名:"园艺学简编版（旧版园艺学）" 制造描述:"讲述培育和照料植物的相关知识。"
        BOOK_SLEEP = "声波催眠技术的理论应用。",-- 物品名:"睡前故事" 制造描述:"送你入梦的睡前故事。"
        BOOK_BRIMSTONE = "这种力量……不应该轻易被释放。",-- 物品名:"末日将至！" 制造描述:"世界将在火焰和灾难中终结！"        --《三国杀》牢角经典台词致敬

        BOOK_FISH = "海洋生物捕获指南……也许我该给无人机加装渔网。",-- 物品名:"垂钓者生存指南" 制造描述:"让捕鱼变得简单！"
        BOOK_FIRE = "关于放热反应的控制与引导。",-- 物品名:"意念控火术详解" 制造描述:"使用这些简单的技巧来化解任何火爆的场面。"
        BOOK_WEB = "我们要学会利用一切资源，哪怕是蜘蛛。",-- 物品名:"克服蛛形纲恐惧症" 制造描述:"要在对方的网络里行走过一里路才能算真正了解一个人。"
        BOOK_TEMPERATURE = "环境适应性调节技术。",-- 物品名:"控温学" 制造描述:"通过这些简单的步骤完全控制你的个人气候。"
        BOOK_LIGHT = "人造光源技术，驱散黑暗的利器。",-- 物品名:"永恒之光" 制造描述:"阅读后能启迪出智慧的光芒。"
        BOOK_RAIN = "局部气候控制？好厉害！",-- 物品名:"实用求雨仪式" 制造描述:"留着防备雨天，你来决定哪天是雨天。"
        BOOK_MOON = "这本书似乎连接着月球的某种频率。",-- 物品名:"月之魔典" 制造描述:"召唤月亮的力量。"
        BOOK_BEES = "昆虫行为学研究笔记。",-- 物品名:"养蜂笔记" 制造描述:"学习养蜂的基本知识。"        --《荒野乱斗》贝亚台词致敬
        
        BOOK_HORTICULTURE_UPGRADED = "进阶植物学，里面有关于基因改良的内容吗？",-- 物品名:"园艺学扩展版" 制造描述:"专家分析如何进行高级农作物护理。"
        BOOK_RESEARCH_STATION = "简直就是便携式终端！里面储存了海量的知识。",-- 物品名:"万物百科" 制造描述:"万事万物从A到Z的完整指南。"
        BOOK_LIGHT_UPGRADED = "高流明照明技术。",-- 物品名:"永恒之光之复兴" 制造描述:"全本比之前的简本散发出更闪耀的光芒。"

        FIREPEN = "便携式燃烧装置，伪装成了笔的样子。",-- 物品名:"火焰笔" 制造描述:"小小的笔身中潜藏着暴躁的火焰。"

        PLAYER =--查看没有设置查看台词的人物？（应该吧）
        {
            GENERIC = "假如再也见不到你，祝你早安，午安，晚安！",-- 普通状态
            ATTACKER = "警告：%s表现出攻击性行为。",-- 攻击过玩家
            MURDERER = "极度危险！%s，你为什么要这样做？",-- 击杀过玩家
            REVIVER = "%s具备优秀的医疗急救能力，感谢你的支援。",-- 复活过玩家
            GHOST = "检测到%s的生命体征消失！急需复活手段！",-- 处于鬼魂状态
            FIRESTARTER = "检测到纵火行为，请立即制止！",-- 放火
        },
        WILSON =--之后的应该都是按照上面那个逻辑了，自己对照吧
        {
            GENERIC = "威尔逊先生，关于那个肉丸的化学成分，我们能讨论一下吗？",		-- 物品名:"威尔逊"
            ATTACKER = "威尔逊先生，暴力不是解决科学分歧的手段！",		-- 物品名:"威尔逊"
            MURDERER = "这不符合科学伦理！威尔逊先生！",		-- 物品名:"威尔逊"
            REVIVER = "感谢您的救援，威尔逊先生。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "威尔逊先生倒下了！我们需要心脏起搏器……或者那颗心。",		-- 物品名:"幽灵"
            FIRESTARTER = "小心！实验器材会被烧坏的！",		-- 物品名:"威尔逊"
        },
        WOLFGANG =
        {
            GENERIC = "多么惊人的肌肉密度！沃尔夫冈先生，可以用仪器测一下吗？",		-- 物品名:"沃尔夫冈"
            ATTACKER = "冷静点，大个子！不要滥用武力！",		-- 物品名:"沃尔夫冈"
            MURDERER = "沃尔夫冈先生失控了！全员退避！",		-- 物品名:"沃尔夫冈"
            REVIVER = "您有一颗与外表一样强大的心，沃尔夫冈先生。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "即使是最强壮的战士也会倒下吗……",		-- 物品名:"幽灵"
            FIRESTARTER = "沃尔夫冈先生，请远离火源！",		-- 物品名:"沃尔夫冈"
        },
        WAXWELL =
        {
            GENERIC = "在这个世界里，你也是“观察者”吗，麦斯威尔先生？",		-- 物品名:"麦斯威尔"
            ATTACKER = "收起你的把戏，先生。",		-- 物品名:"麦斯威尔"
            MURDERER = "这又是你写好的剧本吗？太恶劣了！",		-- 物品名:"麦斯威尔"
            REVIVER = "出乎意料……感谢你的仁慈，或者这也在你的计划之中？",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "看来你也无法完全掌控这个世界，或许我们可以合作。",		-- 物品名:"幽灵"
            FIRESTARTER = "请停止这种破坏行为！",		-- 物品名:"麦斯威尔"
        },
        WX78 =
        {
            GENERIC = "哇哦！完全自主的机械生命体！WX-78，我可以看看你的核心代码吗？",		-- 物品名:"WX-78"
            ATTACKER = "系统错误？WX-78，停止攻击友方单位！",		-- 物品名:"WX-78"
            MURDERER = "警报！机械单位发生叛变！",		-- 物品名:"WX-78"
            REVIVER = "这就是你的底层逻辑中的利他协议吗？很有趣。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "WX-78！系统故障了吗？还能重启吗？",		-- 物品名:"幽灵"
            FIRESTARTER = "WX-78！过载是很危险的！",		-- 物品名:"WX-78"
        },
        WILLOW =
        {
            GENERIC = "薇洛小姐，你的打火机很特别，可以借我看看吗？",		-- 物品名:"薇洛"
            ATTACKER = "薇洛小姐，生气对身体不好哦！",		-- 物品名:"薇洛"
            MURDERER = "不可以做这种事！",		-- 物品名:"薇洛"
            REVIVER = "我就知道，薇洛小姐是个温柔的人。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "薇洛小姐？火熄灭了……",		-- 物品名:"幽灵"
            FIRESTARTER = "那样很危险，快停下！",		-- 物品名:"薇洛"
        },
        WENDY =
        {
            GENERIC = "温蒂小姐，虽然我也经常一个人探险，但如果不开心可以说出来哦。",		-- 物品名:"温蒂"
            ATTACKER = "不要被悲伤吞噬，温蒂小姐！",		-- 物品名:"温蒂"
            MURDERER = "阿比盖尔姐姐不会希望你这么做的！",		-- 物品名:"温蒂"
            REVIVER = "你比看起来更坚强，温蒂小姐。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "别怕，我会把你带回来的。",		-- 物品名:"幽灵"
            FIRESTARTER = "这种行为很危险！",		-- 物品名:"温蒂"
        },
        WOODIE =
        {
            GENERIC = "伍迪先生，那把斧头……是某种特殊的工具吗？",		--查看普通状态伍迪
            ATTACKER = "那是斧头还是武器？请收起来！",		--查看攻击过玩家的伍迪
            MURDERER = "诅咒的影响加深了吗……",		--查看击杀过玩家的伍迪
            REVIVER = "谢谢你！伍迪先生！",		--查看复活过玩家的伍迪
            GHOST = "伍迪先生需要救援！",		--查看幽灵状态的普通伍迪
            BEAVER = "哇！伍迪先生变成了……大海狸？！这也太神奇了！",		--查看海狸形态的伍迪
            BEAVERGHOST = "变身解除了？",		--查看海狸形态的幽灵伍迪
            MOOSE = "哇！变成了这么大的鹿！冲击力看起来很强！",		--查看鹿形态的伍迪
            MOOSEGHOST = "倒下了吗……希望能没事。",		--查看鹿形态的幽灵伍迪
            GOOSE = "变成了……大鹅？跑得好快！",		--查看鹅形态的伍迪
            GOOSEGHOST = "这下真的变成烤鹅了……啊，开玩笑的。",		--查看鹅形态的幽灵伍迪
            FIRESTARTER = "作为伐木工，应该更知道森林火灾的可怕才对！",		--查看放火过的伍迪
        },
        WICKERBOTTOM =
        {
            GENERIC = "薇克巴顿女士，您那本关于量子力学的书能借我看看吗？",		-- 物品名:"薇克巴顿"->默认
            ATTACKER = "知识应该用来造福人类，而不是伤害！",		-- 物品名:"薇克巴顿"
            MURDERER = "%s奶奶，知识不应该用来伤害别人……",		-- 物品名:"薇克巴顿"
            REVIVER = "谢谢您，%s奶奶！您懂得真多！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s奶奶！您没事吧？",		-- 物品名:"幽灵"
            FIRESTARTER = "%s奶奶，图书馆里是禁止烟火的哦。",		-- 物品名:"薇克巴顿"
        },
        WES =
        {
            GENERIC = "你好，%s先生。你会变魔术吗？我想给孩子们表演！",		-- 物品名:"韦斯"->默认
            ATTACKER = "%s先生，请不要打架……",		-- 物品名:"韦斯"
            MURDERER = "%s先生……为什么要这样……",		-- 物品名:"韦斯"
            REVIVER = "谢谢你，%s先生！虽然你不说话，但我能感受到你的心意。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s先生！请坚持住！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s先生，气球碰到火会炸的！",		-- 物品名:"韦斯"
        },
        WEBBER =
        {
            GENERIC = "你好，%s。你的蜘蛛朋友们看起来很乖呢，虽然长得有点……",		-- 物品名:"韦伯"->默认
            ATTACKER = "%s，不可以欺负别人哦。",		-- 物品名:"韦伯"
            MURDERER = "%s，这样做是不对的！",		-- 物品名:"韦伯"
            REVIVER = "谢谢你，%s！你是个好孩子。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！别怕，来救你了！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，玩火会烧到毛的哦。",		-- 物品名:"韦伯"
        },
        WATHGRITHR =
        {
            GENERIC = "你好，%s。你的表演好帅气！可以教我吗？",		-- 物品名:"薇格弗德"->默认
            ATTACKER = "%s，这里不是舞台，请不要伤害大家……",		-- 物品名:"薇格弗德"
            MURDERER = "%s，真正的英雄是不会伤害同伴的！",		-- 物品名:"薇格弗德"
            REVIVER = "谢谢你，%s！你就像传说中的女武神一样！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！演出还没有结束呢！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，小心烧到戏服哦。",		-- 物品名:"薇格弗德"
        },
        WINONA =
        {
            GENERIC = "你好，%s。你在做什么发明吗？我也喜欢摆弄机械！",		-- 物品名:"薇诺娜"->默认
            ATTACKER = "%s，请冷静一下……",		-- 物品名:"薇诺娜"
            MURDERER = "%s，生命是不能被修复的……",		-- 物品名:"薇诺娜"
            REVIVER = "谢谢你，%s！你的技术真棒！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！我们需要急救包！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，工厂里要注意防火哦。",		-- 物品名:"薇诺娜"
        },
        WORTOX =
        {
            GENERIC = "你好，%s先生。你是……萨卡兹吗？感觉有点不一样。",		-- 物品名:"沃拓克斯"->默认
            ATTACKER = "%s先生，恶作剧不可以太过分哦。",		-- 物品名:"沃拓克斯"
            MURDERER = "%s先生，吞噬灵魂是不好的……",		-- 物品名:"沃拓克斯"
            REVIVER = "谢谢你，%s先生。你果然是个好人。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s先生！别玩了，快醒醒！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s先生，火不是玩具哦。",		-- 物品名:"沃拓克斯"
        },
        WORMWOOD =
        {
            GENERIC = "你好，%s先生！我也很喜欢植物！我们能交流一下吗？",		-- 物品名:"沃姆伍德"->默认
            ATTACKER = "%s先生，植物应该是爱好和平的……",		-- 物品名:"沃姆伍德"
            MURDERER = "%s先生，为什么要伤害大家……",		-- 物品名:"沃姆伍德"
            REVIVER = "谢谢你，%s先生！大自然在保护我们呢。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s先生枯萎了……需要水和阳光！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s先生！火会烧伤你的！快跑！",		-- 物品名:"沃姆伍德"
        },
        WARLY =
        {
            GENERIC = "你好，%s先生。这个香味……是探险家的一流补给！",		-- 物品名:"沃利"->默认
            ATTACKER = "%s先生，请不要用厨具打人……",		-- 物品名:"沃利"
            MURDERER = "%s先生，这可不是做菜……",		-- 物品名:"沃利"
            REVIVER = "谢谢你，%s先生！你做的饭最好吃了！恢复活力！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s先生！肚子饿了吗？",		-- 物品名:"幽灵"
            FIRESTARTER = "%s先生，小心烧焦了哦。",		-- 物品名:"沃利"
        },
        WURT =
        {
            GENERIC = "你好，%s。你的角好可爱！这也是一种适者生存的进化吗？",		-- 物品名:"沃特"->默认
            ATTACKER = "%s，不可以打架哦。",		-- 物品名:"沃特"
            MURDERER = "%s，要做个乖孩子……",		-- 物品名:"沃特"
            REVIVER = "谢谢你，%s！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！你没事吧？",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，鱼人不是喜欢水的吗？",		-- 物品名:"沃特"
        },
        WALTER =
        {
            GENERIC = "你好，%s。沃比也很可爱！它咬人吗？",		-- 物品名:"沃尔特"->默认
            ATTACKER = "%s，童子军不可以欺负人哦。",		-- 物品名:"沃尔特"
            MURDERER = "%s，这样做是不对的！",		-- 物品名:"沃尔特"
            REVIVER = "谢谢你，%s！你真勇敢！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！别怕，我们来救你了！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，要注意营火安全哦。",		-- 物品名:"沃尔特"
        },
        WANDA =
        {
            GENERIC = "你好，%s。您看起来好像……穿越了时间？",		-- 物品名:"旺达"->默认
            ATTACKER = "%s，请小心身体……",		-- 物品名:"旺达"
            MURDERER = "%s，为什么要这样做……",		-- 物品名:"旺达"
            REVIVER = "谢谢您，%s！您真是时间的魔术师！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s！时间……停止了吗？",		-- 物品名:"幽灵"
            FIRESTARTER = "%s，小心火烛。",		-- 物品名:"旺达"
        },
        WONKEY =
        {
            GENERIC = "那是……%s先生吗？变成了猴子？好神奇的变形术！",		-- 物品名:"芜猴"->默认
            ATTACKER = "%s先生，请不要像猴子一样调皮……",		-- 物品名:"芜猴"
            MURDERER = "%s先生，不可以伤害大家！",		-- 物品名:"芜猴"
            REVIVER = "谢谢你，%s先生！就算变成猴子也是好伙伴。",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
            GHOST = "%s先生！",		-- 物品名:"幽灵"
            FIRESTARTER = "%s先生，猴子玩火很危险的！",		-- 物品名:"芜猴"
        },
        --明日方舟慕斯
        MOUSSE = {
            GENERIC = "要一起做蛋糕吗，%s？"
        },
        --明日方舟史尔特尔
        SURTR = {
            GENERIC = "哇！我可以摸摸你的剑吗？好烫！"
        },
        --明日方舟夕
        DUSK = {
            GENERIC = "哇~好神奇的画！"
        },
        --明日方舟极光aurora
        AURORA = {
            GENERIC = "准备好一起参加下次科考任务了吗，%s？"
        },
        --明日方舟缪尔塞斯
        MUELSYSE = {
            GENERIC = "缪缪！好久不见~"
        },
        --明日方舟麦哲伦
        MGL = {
            GENERIC = "诶？难道说你是另一个我吗？"
        },

        MIGRATION_PORTAL =--早期绚丽之门设计“自动化朋友传送门”
        {
        --    GENERIC = "要是我有朋友的话，这个说不定能带我去找他们。",
        --    OPEN = "如果我踏过去，我还会是我自己吗？",
        --    FULL = "那边似乎很受欢迎啊。",
        },
        GLOMMER =
        {
            GENERIC = "好奇怪的小生物……也是某种变异体吗？",-- 物品名:"格罗姆"->默认
            SLEEPING = "嘘……它睡得好香。",-- 物品名:"格罗姆"->睡着了
        },
        GLOMMERFLOWER =
        {
            GENERIC = "这朵花……在吸引什么呢？",-- 物品名:"格罗姆花"->默认
            DEAD = "花枯萎了……好可惜。",-- 物品名:"格罗姆花"->死了
        },
        GLOMMERWINGS = "小小的翅膀，标本get！",-- 物品名:"格罗姆翅膀"
        GLOMMERFUEL = "这是……某种高能燃料吗？黏糊糊的。",-- 物品名:"格罗姆的黏液"
        BELL = "旧时代的召唤设备？",-- 物品名:"远古铃铛" 制造描述:"这可不是普通的铃铛。"
        STATUEGLOMMER =
        {
            GENERIC = "这个雕像……感觉在等待着什么。",-- 物品名:"格罗姆雕像"->默认
            EMPTY = "里面的东西不见了。",-- 物品名:"格罗姆雕像"->损坏
        },

        LAVA_POND_ROCK = "好烫的石头！要小心不要烫伤。",-- 物品名:"岩石"(岩浆湖旁边的岩石装饰)

		WEBBERSKULL = "这是……谁的骨头？我们要把它埋葬好。",-- 物品名:"韦伯的头骨"
		WORMLIGHT = "发光果实！如果能提取发光酶就好了。",-- 物品名:"发光浆果"
		WORMLIGHT_LESSER = "小小的光芒，也能照亮黑暗。",-- 物品名:"小发光浆果"
		WORM =
		{
		    PLANT = "那个植物……看起来不像是因自然进化而成的。",-- 物品名:"洞穴蠕虫"->伪装形态
		    DIRT = "土堆在动？是有东西在下面吗？",-- 物品名:"洞穴蠕虫"->移动土堆形态
		    WORM = "哇！深海……不，地下也有这种大家伙吗！",-- 物品名:"洞穴蠕虫"->全暴露形态
		},
        WORMLIGHT_PLANT = "这株植物……在自然发光？",-- 物品名:"神秘植物"
		MOLE =
		{
			HELD = "抓住你了，小挖掘机。",-- 物品名:"鼹鼠"->拿在手里
			UNDERGROUND = "它在地下挖洞呢，真勤劳。",-- 物品名:"鼹鼠"->钻地
			ABOVEGROUND = "它探出头来了！你好呀！",-- 物品名:"鼹鼠"->漏出地面
		},
		MOLEHILL = "这是它的基地入口吗？",-- 物品名:"鼹鼠丘"
		MOLEHAT = "生物夜视仪？原理是什么呢？",-- 物品名:"鼹鼠帽" 制造描述:"为穿戴者提供夜视能力。"

		EEL = "长长的鱼……黏糊糊的。",-- 物品名:"鳗鱼"->死了
		EEL_COOKED = "闻起来很香，补充蛋白质的好选择。",-- 物品名:"熟鳗鱼"
		UNAGI = "这是……很讲究的料理呢！",-- 物品名:"鳗鱼料理"
		EYETURRET = "生物体和机械的结合……好厉害的设计！",-- 物品名:"眼睛炮塔"放置形态
		EYETURRET_ITEM = "虽然很厉害，但是感觉有点……盯着人看。",-- 物品名:"眼睛炮塔" 制造描述:"要远离讨厌的东西，就得杀了它们。"
		MINOTAURHORN = "好大的角！不知道密度如何。",-- 物品名:"守护者之角"
		MINOTAURCHEST = "这是我们的战利品！",-- 物品名:"大号华丽箱子"
		THULECITE_PIECES = "古老的碎片，也是历史的见证。",-- 物品名:"铥矿碎片"
		POND_ALGAE = "水生植物，也许能吃？",-- 物品名:"水藻"
		GREENSTAFF = "逆熵反应？！这把法杖……不科学！",-- 物品名:"拆解魔杖" 制造描述:"干净而有效的摧毁。"        --鹿晗主演的《盗墓笔记》台词致敬
		GIFT = "补给包！不知道里面有什么？",-- 物品名:"礼物"
        GIFTWRAP = "我也想给博士和阿米娅姐姐送礼物。",-- 物品名:"礼物包装" 制造描述:"把东西打包起来，好看又可爱！"
		POTTEDFERN = "绿色的植物能让人心情变好呢。",-- 物品名:"蕨类盆栽" 制造描述:"做个花盆，里面栽上蕨类植物。"
        SUCCULENT_POTTED = "多肉植物很可爱，适合我在实验室里养。",-- 物品名:"多肉盆栽" 制造描述:"塞进陶盆的漂亮多肉植物。"
		SUCCULENT_PLANT = "它长得很健康呢。",-- 物品名:"多肉植物"->种植形态
		SUCCULENT_PICKED = "可以用来做药膏吗？或者当零食？",-- 物品名:"多肉植物"->物品形态
		SENTRYWARD = "它是我们的眼睛。",-- 物品名:"月眼守卫" 制造描述:"绘图者最有价值的武器。"
        TOWNPORTAL =
        {
			GENERIC = "空间折叠装置！虽然原理不明，但很好用！",-- 物品名:"懒人传送塔"->默认 制造描述:"用沙子的力量聚集你的朋友们。"
			ACTIVE = "我们要去哪里呢？只要和大家在一起就好。",-- 物品名:"懒人传送塔"->激活了 制造描述:"用沙子的力量聚集你的朋友们。"
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "这是……定位信标？",-- 物品名:"沙之石"->默认
			ACTIVE = "收到信号了！",-- 物品名:"沙之石"->激活了
		},
        WETPAPER = "纸湿掉了……得小心烘干才行。",-- 物品名:"纸张（湿的？）"
        WETPOUCH = "湿漉漉的……希望里面的东西没坏。",-- 物品名:"起皱的包裹"
        MOONROCK_PIECES = "月岩碎片，成分很特殊。",-- 物品名:"月亮石碎块"（月台的不可再生的月岩小鸟和花装饰）
        MOONBASE =
        {
            GENERIC = "这个底座……是用来接收某种能量的吗？",-- 物品名:"月亮石"->默认
            BROKEN = "坏掉了，得修一修才能用。",-- 物品名:"月亮石"->损坏形态（不可插入法杖）
            STAFFED = "连接建立！会有什么反应呢？",-- 物品名:"月亮石"->插入法杖
            WRONGSTAFF = "好像不匹配……",-- 物品名:"月亮石"->插错法杖
            MOONSTAFF = "月光开始变得实体化了！好神奇！",-- 物品名:"月亮石"->已经插了法杖的（月杖）
        },
        MOONDIAL =
        {
			GENERIC = "天文观测仪器！可以记录月相变化。",-- 物品名:"月晷"->默认 制造描述:"追踪月相！"
			NIGHT_NEW = "今晚是新月，观测条件一般。",-- 物品名:"月晷"->新月
			NIGHT_WAX = "月亮正在变圆，记录下来。",-- 物品名:"月晷"->上弦月
			NIGHT_FULL = "满月啦！感觉充满了力量！",-- 物品名:"月晷"->满月
			NIGHT_WANE = "满月结束了，数据开始下降。",-- 物品名:"月晷"->下弦月
			CAVE = "这里没有星空，仪器无法工作。",-- 物品名:"月晷"->洞穴
			WEREBEAVER = "伍迪先生……对这个有反应吗？",--伍迪月圆时检查月晷？
			GLASSED = "奇怪的光谱……这是幻觉吗？",-- 物品名:"月晷"->启迪月
        },
		THULECITE = "稀有矿石……也许可以用来做新装备。",--铥矿
		ARMORRUINS = "这是古代文明的技术吗？防御性能看起来很高。",--铥矿甲
		ARMORSKELETON = "虽然材料有点……但这可是高强度的骨骼外骨骼！",-- 物品名:"骨头盔甲"
		SKELETONHAT = "不仅能防御，还能调节佩戴者的精神状态？",-- 物品名:"骨头头盔"
		RUINS_BAT = "高能粒子附着在上面，攻击力很强。",-- 物品名:"铥矿棒" 制造描述:"尖钉让一切变得更好。"       --《荒野乱斗》比比台词致敬
		RUINSHAT = "力场发生器启动！这种技术……太值得研究了！",-- 物品名:"铥矿皇冠" 制造描述:"附有远古力场！"        --远古版本mod《秘封俱乐部》莲子台词致敬
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "很平静，没有危险。",		-- 物品名:"铥矿徽章"->平静期
            WARN = "读数开始波动了，注意警戒。",		-- 物品名:"铥矿徽章"->警告期
            WAXING = "干扰增强！大家小心！",		-- 物品名:"铥矿徽章"->暴动初期
            STEADY = "正在经历高强度波动！坚持住！",		-- 物品名:"铥矿徽章"->暴动中期
            WANING = "读数开始下降了，呼……",		-- 物品名:"铥矿徽章"->暴动接近尾声
            DAWN = "平稳期快到了。",		-- 物品名:"铥矿徽章"->过渡阶段
            NOMAGIC = "这里没有任何读数。",		-- 物品名:"铥矿徽章"->地面或其他非洞穴世界
		},
		BISHOP_NIGHTMARE = "受损的自动机械……虽然想修好它，但看起来它并不友好。",-- 物品名:"损坏的发条主教"
		ROOK_NIGHTMARE = "失控的机械装置！快避开！",-- 物品名:"损坏的发条战车"
		KNIGHT_NIGHTMARE = "它的脑子可能坏掉了。",-- 物品名:"损坏的发条骑士"
		MINOTAUR = "好巨大的怪物……但是麦哲伦不会退缩！",-- 物品名:"远古守护者"        --《秦安端巫》经典名句致敬
		SPIDER_DROPPER = "白色的蜘蛛……是新的亚种吗？",-- 物品名:"穴居悬蛛"
		NIGHTMARELIGHT = "这种光……波动频率让人很不舒服。",-- 物品名:"梦魇灯座"
		NIGHTSTICK = "便携式电能武器！还能照明，设计真巧妙！",-- 物品名:"晨星锤" 制造描述:"用于夜间战斗的晨光。"      --《荒野乱斗》露米台词致敬
		GREENGEM = "绿色的宝石，蕴含着生命的能量。",-- 物品名:"绿宝石"
		MULTITOOL_AXE_PICKAXE = "多功能工具！探险家的梦想装备！",-- 物品名:"多用斧镐" 制造描述:"加倍实用。"
		ORANGESTAFF = "空间折叠技术？！这可是莱茵生命还没攻克的难题！",-- 物品名:"懒人魔杖" 制造描述:"适合那些不喜欢走路的人。"
		YELLOWAMULET = "反重力装置吗？感觉轻飘飘的！",-- 物品名:"魔光护符" 制造描述:"从天堂汲取力量。"
		GREENAMULET = "物质重构优化，这样就能节省材料了！",-- 物品名:"建造护符" 制造描述:"用更少的材料合成物品！"
		SLURPERPELT = "毛茸茸的皮……发现一块！",-- 物品名:"啜食者皮"

		SLURPER = "它会吸在头上控制神经吗？不要过来！",-- 物品名:"啜食者"
		SLURPER_PELT = "虽然看起来有点恶心，但可能有用。",-- 物品名:"啜食者皮"
		ARMORSLURPER = "虽然能缓解饥饿，但是……真的要穿戴这种生物材料吗？",-- 物品名:"饥饿腰带" 制造描述:"保持肚子不饿。"
		ORANGEAMULET = "自动化捡拾装置！好乖的护符。",-- 物品名:"懒人护符" 制造描述:"适合那些不喜欢捡东西的人。"
		YELLOWSTAFF = "人造恒星实验……召唤星星照亮大家！",-- 物品名:"唤星者魔杖" 制造描述:"召唤一个小星星。"
		YELLOWGEM = "黄色的宝石，像温暖的阳光。",-- 物品名:"黄宝石"
		ORANGEGEM = "橙色的宝石，看起来很坚固。",-- 物品名:"橙宝石"
        OPALSTAFF = "冰冷的光芒……可以冷却环境温度。",-- 物品名:"唤月者魔杖"
        OPALPRECIOUSGEM = "彩虹一样的宝石！太美了！",-- 物品名:"彩虹宝石"       --官方拆解魔杖介绍吐槽，不算致敬
        TELEBASE =
		{
			VALID = "传送阵列就绪！",-- 物品名:"传送焦点"->有效 制造描述:"装上宝石试试。"
			GEMS = "供能不足，需要嵌入宝石。",-- 物品名:"传送焦点"->需要宝石 制造描述:"装上宝石试试。"
		},
		GEMSOCKET =
		{
			VALID = "宝石嵌入完成。",-- 物品名:"宝石底座"->有效
			GEMS = "这里需要嵌入一颗宝石。",-- 物品名:"宝石底座"->需要宝石
		},
		STAFFLIGHT = "暖洋洋的小星星，就像希望一样。",-- 物品名:"矮星"
        STAFFCOLDLIGHT = "冰冰凉的小星星，很安静。",-- 物品名:"极光"

        ANCIENT_ALTAR = "远古的科技站？好想研究一下它的原理！",-- 物品名:"远古伪科学站"

        ANCIENT_ALTAR_BROKEN = "它损坏得很严重……还能修复吗？",-- 物品名:"损坏的远古伪科学站"

        ANCIENT_STATUE = "这个雕像……表情好奇怪。",-- 物品名:"远古雕像"

        LICHEN = "居然能在洞穴里生长的苔藓，生命力真顽强。",-- 物品名:"洞穴苔藓"
		CUTLICHEN = "虽然不好吃，但也是应急食物。",-- 物品名:"苔藓"

		CAVE_BANANA = "洞穴里的香蕉？没有光合作用是怎么长的？",-- 物品名:"香蕉"
		CAVE_BANANA_COOKED = "烤过的香蕉，热乎乎的！",-- 物品名:"熟香蕉"
		CAVE_BANANA_TREE = "长在洞穴里的树，生态系统真神奇。",-- 物品名:"洞穴香蕉树"
		ROCKY = "硅基生物？！这可是大发现！",-- 物品名:"石虾"       --《皇室战争》提示致敬

		COMPASS =
		{
			GENERIC = "导航系统校准完毕。",-- 物品名:"指南针"->默认 制造描述:"指向北方。"     --《通天塔》台词致敬，至于是哪个通天塔，那肯定是我的童年那个了
			N = "目标方向：北方。",		-- 物品名:"指南针"->指向北方
			S = "目标方向：南方。",		-- 物品名:"指南针"->指向南方
			E = "目标方向：东方。",		-- 物品名:"指南针"->指向东方
			W = "目标方向：西方。",		-- 物品名:"指南针"->指向西方
			NE = "目标方向：东北。",		-- 物品名:"指南针"->指向东北
			SE = "目标方向：东南。",		-- 物品名:"指南针"->指向东南
			NW = "目标方向：西北。",		-- 物品名:"指南针"->指向西北
			SW = "目标方向：西南。",		-- 物品名:"指南针"->指向西南
		},

        HOUNDSTOOTH = "野兽的牙齿，很锋利。",-- 物品名:"犬牙"       --《荒野乱斗》露米台词致敬原台词为“为你带来爆裂鼓点和牙齿崩碎的体验！”
        ARMORSNURTLESHELL = "便携式掩体！躲在里面就很安全啦！",-- 物品名:"蜗壳护甲"
        BAT = "蝙蝠……要小心。",-- 物品名:"洞穴蝙蝠"
        BATBAT = "这把武器……技术原理有点像蝙蝠吸血？",-- 物品名:"蝙蝠棒" 制造描述:"所有科技都如此...耗费精神。"
        BATWING = "蝙蝠的翅膀，应该能用吧。",-- 物品名:"洞穴蝙蝠翅膀"
        BATWING_COOKED = "烤熟了……要吃吗？为了生存……",-- 物品名:"熟蝙蝠翅膀"
        BATCAVE = "蝙蝠的巢穴……通风状况很差。",-- 物品名:"蝙蝠洞"
        BEDROLL_FURRY = "毛茸茸的睡袋，在极地这可是救命装备。",-- 物品名:"毛皮铺盖" 制造描述:"舒适地一觉睡到天亮！"
        BUNNYMAN = "兔人先生！你们也喜欢胡萝卜吗？",-- 物品名:"兔人"
        FLOWER_CAVE = "发光的花朵，好美。",-- 物品名:"荧光花"
        GUANO = "这是……天然肥料。为了种植物，这点小事不算什么！",-- 物品名:"鸟粪"
        LANTERN = "提着灯笼，就不怕黑了。",-- 物品名:"提灯" 制造描述:"可加燃料、明亮、便携！"
        LIGHTBULB = "软软的发光果实。",-- 物品名:"荧光果"
        MANRABBIT_TAIL = "好软的毛球！",-- 物品名:"兔绒"
        MUSHROOMHAT = "蘑菇帽子！好可爱！",-- 物品名:"蘑菇帽"（三色的蘑菇帽都是这一句，科雷你好懒）
        MUSHROOM_LIGHT2 =
        {
            ON = "亮起来了！",-- 物品名:"菌伞灯"->开启 制造描述:"受到火山岩浆灯饰学问的激发。"
            OFF = "关掉了。",-- 物品名:"菌伞灯"->关闭 制造描述:"受到火山岩浆灯饰学问的激发。"
            BURNT = "烧焦了……",-- 物品名:"菌伞灯"->烧焦的 制造描述:"受到火山岩浆灯饰学问的激发。"
        },
        MUSHROOM_LIGHT =
        {
            ON = "像小台灯一样，好可爱。",-- 物品名:"蘑菇灯"->开启 制造描述:"任何蘑菇的完美添加物。"
            OFF = "它需要发光的东西才能亮起来。",-- 物品名:"蘑菇灯"->关闭 制造描述:"任何蘑菇的完美添加物。"
            BURNT = "烧坏了……",-- 物品名:"蘑菇灯"->烧焦的 制造描述:"任何蘑菇的完美添加物。"
        },
        SLEEPBOMB = "让大家睡个好觉的魔法。",-- 物品名:"睡袋" 制造描述:"可以扔掉的袋子睡意沉沉。"
        MUSHROOMBOMB = "小心！会爆炸的！",-- 物品名:"炸弹蘑菇"
        SHROOM_SKIN = "有点……奇怪的味道。",-- 物品名:"蘑菇皮"
        TOADSTOOL_CAP =
        {
            EMPTY = "这里有个洞。",-- 物品名:"毒菌蟾蜍"->洞
            INGROUND = "有什么东西藏在下面吗？",-- 物品名:"毒菌蟾蜍"->蟾蜍刷新？
            GENERIC = "好大的蘑菇！",-- 物品名:"毒菌蟾蜍"->有蘑菇
        },
        TOADSTOOL =
        {
            GENERIC = "巨大的蟾蜍先生！",-- 物品名:"毒菌蟾蜍"->默认状况检查
            RAGE = "它生气了！大家小心！",-- 物品名:"毒菌蟾蜍"->狂暴状态（？）
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "这是蘑菇的种子吗？",-- 物品名:"孢子帽"->默认
            BURNT = "烧焦了……",-- 物品名:"孢子帽"->烧焦的
        },
        MUSHTREE_TALL =
        {
            GENERIC = "蓝色的蘑菇树，好高啊。",-- 物品名:"蓝蘑菇树"->默认
            BLOOM = "它在散播孢子呢。",-- 物品名:"蓝蘑菇树"->释放孢子季节
            ACIDCOVERED = "它被酸雨淋到了。",-- 物品名:"蓝蘑菇树"->附着酸雨
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "红色的蘑菇树，像伞一样。",-- 物品名:"红蘑菇树"->默认
            BLOOM = "空气中飘满了红色的孢子。",-- 物品名:"红蘑菇树"->释放孢子季节
            ACIDCOVERED = "酸雨对植物不好……",-- 物品名:"红蘑菇树"->附着酸雨
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "绿色的蘑菇树，看起来很有生机。",-- 物品名:"绿蘑菇树"->默认
            BLOOM = "绿色的孢子……会让人想睡觉吗？",-- 物品名:"绿蘑菇树"->释放孢子季节
            ACIDCOVERED = "希望能快点好起来。",-- 物品名:"绿蘑菇树"->附着酸雨
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "被蜘蛛网缠住的树……",-- 物品名:"蛛网蓝蘑菇树"->默认
            ACIDCOVERED = "蜘蛛网也没能挡住酸雨。",-- 物品名:"蛛网蓝蘑菇树"->附着酸雨
        },
        SPORE_TALL =
        {
            GENERIC = "蓝色的光点，真漂亮。",-- 物品名:"蓝色孢子"->默认
            HELD = "抓到你了，小星星。",-- 物品名:"蓝色孢子"->拿在手里
        },
        SPORE_MEDIUM =
        {
            GENERIC = "红色的光点，暖暖的。",-- 物品名:"红色孢子"->默认
            HELD = "放在瓶子里会发光吗？",-- 物品名:"红色孢子"->拿在手里
        },
        SPORE_SMALL =
        {
            GENERIC = "绿色的光点，像萤火虫。",-- 物品名:"绿色孢子"->默认
            HELD = "小心不要捏碎了。",-- 物品名:"绿色孢子"->拿在手里
        },
        RABBITHOUSE =
        {
            GENERIC = "像胡萝卜一样的房子！好有趣！",-- 物品名:"兔屋"->默认 制造描述:"可容纳一只巨大的兔子及其所有物品。"
            BURNT = "房子烧掉了……兔人先生住哪里呢？",-- 物品名:"兔屋"->烧焦的 制造描述:"可容纳一只巨大的兔子及其所有物品。"
        },
        SLURTLE = "背上尖尖的蜗牛先生。",-- 物品名:"蛞蝓龟（尖壳）"
        SLURTLE_SHELLPIECES = "壳碎掉了……",-- 物品名:"外壳碎片"
        SLURTLEHAT = "戴上这个就像蜗牛先生一样了。",-- 物品名:"背壳头盔"
        SLURTLEHOLE = "这是它们的家吗？黏糊糊的。",-- 物品名:"蛞蝓龟窝"
        SLURTLESLIME = "好黏的液体……会爆炸吗？",-- 物品名:"蛞蝓龟黏液"     --这句是哪个模组人物说的应该不用猜吧《秘封俱乐部》模组梅莉台词致敬
        SNURTLE = "圆圆的蜗牛先生，很害羞吗？",-- 物品名:"蜗牛龟（圆壳）"
        SPIDER_HIDER = "它躲在壳里。",-- 物品名:"洞穴蜘蛛"
        SPIDER_SPITTER = "它会吐东西！快躲开！",-- 物品名:"喷射蜘蛛"
        SPIDERHOLE = "好多蜘蛛网……",-- 物品名:"蛛网岩"
        SPIDERHOLE_ROCK = "只是普通的石头了。",--蛛网岩不再刷新蜘蛛的状态(敲两下就没蛛网了），不过这句好像没调用？
        STALAGMITE = "尖尖的石头。",-- 物品名:"石笋"（大个的）
        STALAGMITE_TALL = "好高的石头。",-- 物品名:"石笋"（头顶尖尖的）

        TURF_CARPETFLOOR = "软软的地毯，踩上去很舒服。",-- 物品名:"地毯地板" 制造描述:"超级柔软。闻着就像皮弗娄牛。"
        TURF_CHECKERFLOOR = "像棋盘一样的地板。",-- 物品名:"棋盘地板" 制造描述:"精心制作成棋盘状的大理石地砖。"
        TURF_DIRT = "普通的泥土。",		-- 物品名:"泥土地皮"        --致敬《秦安端巫》的禁装介绍台词，毕竟这玩意正常情况获得不到
        TURF_FOREST = "森林里的泥土，有树叶的味道。",		-- 物品名:"森林地皮" 制造描述:"一块森林地皮。"
        TURF_GRASS = "草地，适合野餐呢。",		-- 物品名:"长草地皮" 制造描述:"一片草地。"
        TURF_MARSH = "沼泽的泥土，湿湿的。",		-- 物品名:"沼泽地皮" 制造描述:"沼泽在哪，家就在哪！"
        TURF_METEOR = "这是……月亮上的土吗？",		-- 物品名:"月球环形山地皮" 制造描述:"月球表面的月坑。"
        TURF_PEBBLEBEACH = "有很多小石子。",		-- 物品名:"岩石海滩地皮" 制造描述:"一块鹅卵石海滩地皮。"
        TURF_ROAD = "铺好的路，走起来很平坦。",		-- 物品名:"卵石路" 制造描述:"修建你自己的道路，通往任何地方。"
        TURF_ROCKY = "好多石头。",		-- 物品名:"岩石地皮" 制造描述:"一块石头地皮。"
        TURF_SAVANNA = "干草的味道。",		-- 物品名:"热带草原地皮" 制造描述:"一块热带草原地皮。"
        TURF_WOODFLOOR = "木头做的地板，很干净。",		-- 物品名:"木地板" 制造描述:"优质复合地板。"

		TURF_CAVE="洞穴里的地面。",		-- 物品名:"鸟粪地皮" 制造描述:"洞穴地面冰冷的岩石。"
		TURF_FUNGUS="长满真菌的地面。",		-- 物品名:"真菌地皮" 制造描述:"一块长满了真菌的洞穴地皮。"
		TURF_FUNGUS_MOON = "奇怪的真菌地面。",		-- 物品名:"变异真菌地皮" 制造描述:"一块长满了变异真菌的洞穴地皮。"
		TURF_ARCHIVE = "古老的地板，很漂亮。",		-- 物品名:"远古石刻" 制造描述:"解封档案馆中的远古石器。"
        TURF_VAULT = "神秘的地板。",--远古圣殿石刻
        TURF_VENT = "这里有裂缝。",--洞穴喷气孔地皮
		TURF_SINKHOLE="湿地地质，注意脚下防滑。",		-- 物品名:"黏滑地皮" 制造描述:"一块潮湿、沾满泥巴的草地地皮。"
		TURF_UNDERROCK="岩层裸露地表。",		-- 物品名:"洞穴岩石地皮" 制造描述:"一块乱石嶙峋的洞穴地皮。"
		TURF_MUD="全是泥巴……会弄脏靴子的。",		-- 物品名:"泥泞地皮" 制造描述:"一块泥地地皮。"

		TURF_DECIDUOUS = "落叶层，富含腐殖质。",		-- 物品名:"落叶林地皮" 制造描述:"一块落叶林地皮。"
		TURF_SANDY = "沙质土壤，保水性差。",		-- 物品名:沙子地皮？（和下面那个坐一桌）
		TURF_BADLANDS = "贫瘠的土地。",		-- 物品名:恶地地皮？（官方人物台词也没有设置，介绍都没有）
		TURF_DESERTDIRT = "干燥的沙土。",		-- 物品名:"沙漠地皮" 制造描述:"一片干燥的沙子。"
		TURF_FUNGUS_GREEN = "真菌覆盖的地面……菌丝网络很发达。",		-- 物品名:"真菌地皮" 制造描述:"一块爬满绿菌的洞穴地皮。"
		TURF_FUNGUS_RED = "红色的真菌……看起来有点危险。",		-- 物品名:"真菌地皮" 制造描述:"一块爬满红菌的洞穴地皮。"
		TURF_DRAGONFLY = "这种地砖有极佳的隔热性能。",		-- 物品名:"龙鳞地板" 制造描述:"消除火灾蔓延速度。"

        TURF_SHELLBEACH = "沉积着大量贝壳碎片。",		-- 物品名:"贝壳海滩地皮" 制造描述:"一块贝壳海岸。"

		TURF_RUINSBRICK = "古代工艺的砖块。",		-- 物品名:"远古地面" 制造描述:"远古石制地面，装饰的魔法技艺早已失传。"
		TURF_RUINSBRICK_GLOW = "这种砖块含有发光矿物。",		-- 物品名:"仿远古地面" 制造描述:"远古石制地面的复刻。"
		TURF_RUINSTILES = "工艺精湛的瓷砖。",		-- 物品名:"远古瓷砖" 制造描述:"瓷砖地面，装饰的魔法技艺早已失传。"
		TURF_RUINSTILES_GLOW = "复刻得相当不错。",		-- 物品名:"仿远古瓷砖" 制造描述:"远古瓷砖地面的复刻。"
		TURF_RUINSTRIM = "古代文明的遗留物。",		-- 物品名:"远古砖雕" 制造描述:"砖石地面，装饰的魔法技艺早已失传。"
		TURF_RUINSTRIM_GLOW = "虽然是仿制品，但也很有研究价值。",		-- 物品名:"仿远古砖雕" 制造描述:"远古砖石地面的复刻。"

        TURF_MONKEY_GROUND = "空气中检测到乙酸异戊酯……是香蕉的味道！",		-- 物品名:"月亮码头海滩地皮" 制造描述:"一片沙地，散发着淡淡的香蕉香。"

        TURF_CARPETFLOOR2 = "高密度的织物地毯，舒适度满分。",		-- 物品名:"茂盛地毯" 制造描述:"超级超级软。"
        TURF_MOSAIC_GREY = "铺设得很整齐的石子路。",		-- 物品名:"灰色马赛克地板" 制造描述:"优雅的碎石。灰色。"
        TURF_MOSAIC_RED = "红色马赛克，很有艺术感。",		-- 物品名:"红色马赛克地板" 制造描述:"优雅的碎石。红色。"
        TURF_MOSAIC_BLUE = "蓝色马赛克，像天空的颜色。",		-- 物品名:"蓝色马赛克地板" 制造描述:"优雅的碎石。蓝色。"

        TURF_BEARD_RUG = "这地毯……是生物组织做的？！",		-- 物品名:"胡须地毯" 制造描述:"有些人就是喜欢行为艺术。"


		POWCAKE = "这个蛋糕……化学成分极其稳定，永不变质？",		-- 物品名:"芝士蛋糕"
        CAVE_ENTRANCE = "检测到地下空洞，入口被堵塞了。",		-- 物品名:"被堵住的洞穴"
        CAVE_ENTRANCE_RUINS = "通往更深层的遗迹入口。",		-- 物品名:"被堵住的陷洞"->单机 洞二入口

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "光线无法穿透的深度……",-- 物品名:"洞穴"->关闭
            OPEN = "任务开始，准备突入地下区域！",-- 物品名:"洞穴"->打开
            FULL = "通道拥堵，无法通行。",-- 物品名:"洞穴"->满了
        },
        CAVE_EXIT =
        {
            GENERIC = "通道被封锁了？",-- 物品名:"楼梯"->关闭
            OPEN = "检测到地表光源！",-- 物品名:"楼梯"->打开
            FULL = "无法通过。",-- 物品名:"楼梯"->满了
        },

		MAXWELLPHONOGRAPH = "正在播放音频文件吗？", -- 物品名:"麦斯威尔的留声机"->单机 麦斯威尔留声机
		BOOMERANG = "通过空气动力学原理飞回来的武器！",-- 物品名:"回旋镖" 制造描述:"来自澳洲土著。"       --《秦安端巫》早期版本翻译致敬，飞来飞去器这名字太奇葩了
		PIGGUARD = "无论何时都要保持警惕……辛苦了，守卫先生。",-- 物品名:"猪人守卫"
		ABIGAIL =
		{
            LEVEL1 =
            {
                "你好，幽灵小姐。",--查看一级阿比盖尔
                "你是温蒂小姐的护卫吗？",--这两句第一句是本阶段第一次查看？（大概？）
            },
            LEVEL2 =
            {
                "她变强了呢。",--查看二级阿比盖尔
                "请多关照。",
            },
            LEVEL3 =
            {
                "她好厉害！",--查看三级阿比盖尔
                "我们会保护好大家的，对吧？",
            },
        },

		ADVENTURE_PORTAL = "空间传送门？通向哪个坐标？",-- 物品名:"麦斯威尔之门"->单机 麦斯威尔之门
		AMULET = "红色的项链，感觉有神奇的力量。",-- 物品名:"重生护符" 制造描述:"逃离死神的魔爪。"
		ANIMAL_TRACK = "足迹追踪……方向确认。",-- 物品名:"动物足迹"
		ARMORGRASS = "虽然只是干草编织的，但有总比没有好。",-- 物品名:"草甲" 制造描述:"提供少许防护。"
		ARMORMARBLE = "高密度大理石护甲……机动性会大幅下降。",-- 物品名:"大理石甲" 制造描述:"它很重，但能够保护你。"
		ARMORWOOD = "木制护甲，提供基础防御。",-- 物品名:"木甲" 制造描述:"为你抵御部分伤害。"
		ARMOR_SANITY = "这种护甲会产生精神干扰……",-- 物品名:"暗夜甲" 制造描述:"保护你的躯体，但无法保护你的心智。"
		ASH =
		{
			GENERIC = "燃烧残留物。",-- 物品名:"灰烬"->默认
			REMAINS_GLOMMERFLOWER = "奇特的植物变成了灰烬……",-- 物品名:"灰烬"->单机跳世界后查看格罗姆花变成的灰（单机跳世界后唯一物品会变成灰烬)
			REMAINS_EYE_BONE = "那个眼骨也消失了吗？",-- 物品名:"灰烬"->单机跳世界后查看眼骨变成的灰
			REMAINS_THINGIE = "什么都没有留下……",-- 物品名:"灰烬"->跳世界后的鱼骨？（也可能是什么模组物品摧毁后的东西）
		},
		AXE = "伐木工具。",-- 物品名:"斧头" 制造描述:"砍倒树木！"
		BABYBEEFALO =
		{
			GENERIC = "幼年体！好可爱！",-- 物品名:"小皮弗娄牛"->默认       --《荒野乱斗》露米台词致敬
		    SLEEPING = "它在睡觉呢……嘘。",-- 物品名:"小皮弗娄牛"->睡着了
        },
        BUNDLE = "物资打包完毕。",-- 物品名:"捆绑物资"
        BUNDLEWRAP = "高效的物资压缩技术。",-- 物品名:"捆绑包装" 制造描述:"打包东西的必要工具。"
		BACKPACK = "增加负重上限，探险必备装备！",-- 物品名:"背包" 制造描述:"携带更多物品。"
		BACONEGGS = "高蛋白高热量，完美的探险早餐！",-- 物品名:"培根煎蛋"
		BANDAGE = "医疗用品，用于伤口处理。",-- 物品名:"蜂蜜药膏" 制造描述:"愈合小伤口。"
		BASALT = "这种岩石硬度极高，无法破坏。",-- 物品名:"玄武岩"
		BEARDHAIR = "这是……胡子？",-- 物品名:"胡须"
		BEARGER = "这种体型的生物……是熊獾先生吗？请不要抢我们的食物！",-- 物品名:"熊獾"       --《荒野乱斗》切斯特台词致敬
		BEARGERVEST = "虽然很暖和，但这是用它的毛皮做的……",-- 物品名:"熊皮背心" 制造描述:"像熊一样的背心。"
		ICEPACK = "自带制冷系统的背包，可以延缓食物腐败。",-- 物品名:"保鲜背包" 制造描述:"保持新鲜感。"
		BEARGER_FUR = "厚实的毛皮，可以做很多东西！",-- 物品名:"熊皮" 制造描述:"毛皮再生。"
		BEDROLL_STRAW = "临时休息点，虽然条件简陋。",-- 物品名:"草席卷" 制造描述:"一觉睡到天亮。"
		BEEQUEEN = "蜂群的女王陛下！",-- 物品名:"蜂王"
		BEEQUEENHIVE =
		{
			GENERIC = "好大的蜂巢！里面住着女王吗？",-- 物品名:"蜂蜜地块"->默认
			GROWING = "它好像还在变大……",-- 物品名:"蜂蜜地块"->正在生长
		},
        BEEQUEENHIVEGROWN = "哇！这也太大了吧！",-- 物品名:"巨大蜂窝"
        BEEGUARD = "是守卫这一带的卫兵吗？",-- 物品名:"嗡嗡蜜蜂"
        HIVEHAT = "戴上这个，我就能听懂蜜蜂说话了吗？",-- 物品名:"蜂王冠"
        MINISIGN =
        {
            GENERIC = "小小的牌子，很可爱。",-- 物品名:"小木牌"->默认
            UNDRAWN = "还没画画呢，我来画个雪花吧！",-- 物品名:"小木牌"->没有画画
        },
        MINISIGN_ITEM = "可以用来标记路线，就不怕迷路啦！",-- 物品名:"小木牌" 制造描述:"用羽毛笔在这些上面画画。"
		BEE =
		{
			GENERIC = "嗡嗡嗡~ 勤劳的小家伙。",-- 物品名:"蜜蜂"->默认     --《荒野乱斗》切斯特台词致敬
			HELD = "别怕别怕，稍微配合一下观察哦。",-- 物品名:"蜜蜂"->拿在手里
		},
		BEEBOX =
		{
			READY = "好耶！有蜂蜜吃了！",     -- 物品名:"蜂箱"->准备好的 满的 制造描述:"贮存你自己的蜜蜂。"
			FULLHONEY = "蜂蜜都要溢出来了！好香啊！",		-- 物品名:"蜂箱"->蜂蜜满了
			GENERIC = "这是蜜蜂们的基地。",		-- 物品名:"蜂箱"->默认      --感觉英文版可以搞一个BEATBOX的谐音梗
			NOHONEY = "还没酿好吗？再等等吧。",		-- 物品名:"蜂箱"->没有蜂蜜
			SOMEHONEY = "蜜蜂们正在加油干活呢。",		-- 物品名:"蜂箱"->有一些蜂蜜
			BURNT = "啊！蜂箱烧坏了……",		-- 物品名:"蜂箱"->烧焦的
		},
		MUSHROOM_FARM =
		{
			STUFFED = "蘑菇长得好大！可以勉强当个伞？",		-- 物品名:"蘑菇农场"->最多（孢子种植上限六个）
			LOTS = "大丰收！今晚吃蘑菇大餐！",		-- 物品名:"蘑菇农场"->很多（达到四个，无论是孢子种的还是蘑菇种的）
			SOME = "快快长大吧~",		-- 物品名:"蘑菇农场"->有一些（种植1-3个，或种植5个）
			EMPTY = "这里可以种蘑菇，不知道能不能种出夜光蘑菇？",		-- 物品名:"蘑菇农场"->闲置
			ROTTEN = "呜……烂掉了。",		-- 物品名:"蘑菇农场"->腐烂的（需要活木）        --假装蘑菇农场在学滚木说话《皇室战争》复仇滚木音效致敬
			BURNT = "变成灰了……",		-- 物品名:"蘑菇农场"->烧焦的
			SNOWCOVERED = "太冷了，蘑菇也冬眠了吗？",		-- 物品名:"蘑菇农场"->被雪覆盖（冬天不能种）
		},
		BEEFALO =
		{
			FOLLOWER = "牛牛乖，我们是探险好搭档！",-- 物品名:"皮弗娄牛"->追随者(绑着牛铃)
			GENERIC = "你好呀大个子！能让我摸摸吗？",-- 物品名:"皮弗娄牛"->默认
			NAKED = "没毛了，看起来有点冷……",-- 物品名:"皮弗娄牛"->牛毛被刮干净了
			SLEEPING = "嘘，不要吵醒它。",-- 物品名:"皮弗娄牛"->睡着了
            -- 驯化状态：
            DOMESTICATED = "它好像很喜欢我！",-- 物品名:"皮弗娄牛"->驯化牛
            ORNERY = "看起来有点暴躁，离远点好了。",-- 物品名:"皮弗娄牛"->战斗牛
            RIDER = "呜呼！我们可以跑得更快！",-- 物品名:"皮弗娄牛"->骑行牛      --《皇室战争》野猪骑士台词致敬
            PUDGY = "圆滚滚的，一定吃了不少好东西。",-- 物品名:"皮弗娄牛"->胖牛
            MYPARTNER = "我们是最好的伙伴！",-- 物品名:"皮弗娄牛"驯化中
            DEAD = "怎么会……",-- 物品名:"皮弗娄牛"->已死亡，且主人不是自己身上的牛铃或无主人
            DEAD_MYPARTNER = "对不起……明明说好一起探险的……",-- 物品名:"皮弗娄牛"->已死亡且主人是自己身上的牛铃
		},

		BEEFALOHAT = "暖和的牛角帽！我是不是能混进牛群了？",-- 物品名:"牛角帽" 制造描述:"成为牛群中的一员！连气味也变得一样。"
		BEEFALOWOOL = "软软的毛，摸起来好舒服。",-- 物品名:"牛毛"
		BEEHAT = "全副武装！这下就不怕被蛰了。",-- 物品名:"养蜂帽" 制造描述:"防止被愤怒的蜜蜂蜇伤。"
        BEESWAX = "滑滑的，可以用来做防水处理吗？",-- 物品名:"蜂蜡" 制造描述:"一种有用的防腐蜂蜡。"
		BEEHIVE = "蜜蜂们的都在里面忙碌呢。",-- 物品名:"蜂窝"
		BEEMINE = "蜜蜂炸弹？这个想法有点……特别。",-- 物品名:"蜜蜂地雷" 制造描述:"变成武器的蜜蜂。会出什么问题？"
		BEEMINE_MAXWELL = "这种陷阱……还是要小心点。",-- 物品名:"麦斯威尔的蚊子陷阱"->单机 麦斯威尔的蚊子陷阱
		BERRIES = "红红的浆果，看起来很好吃。",-- 物品名:"浆果"     --菓酱的英文官方翻译是berries这里在玩英文双关
		BERRIES_COOKED = "不管是做果酱还是直接吃都很棒！",-- 物品名:"烤浆果"      --cooked有造假的意思
        BERRIES_JUICY = "汁水好多！小心别溅到衣服上。",-- 物品名:"多汁浆果"       --juicy的英文调侃有性感的丰满的意思，这里不想带偏所以写成这样了
        BERRIES_JUICY_COOKED = "热乎乎的果酱味，好幸福~",-- 物品名:"烤多汁浆果"      --cooked（假账）juicy（劲爆）懂？
		BERRYBUSH =
		{
			BARREN = "它好像有点累了，需要肥料。",-- 物品名:"浆果丛"
			WITHERED = "太热了，叶子都耷拉下来了。",-- 物品名:"浆果丛"->枯萎了
			GENERIC = "长出浆果来吧~",-- 物品名:"浆果丛"->默认
			PICKED = "已经被采光了，等待下一次成熟吧。",-- 物品名:"浆果丛"->被采完了
			DISEASED = "它生病了，呜，看起来好难受。",-- 物品名:"浆果丛"->生病了
			DISEASING = "叶子颜色不太对……",-- 物品名:"浆果丛"->正在生病？？（貌似是移除的一个生病状态，可能是即将生病，官方台词和生病检查是一样的）
			BURNING = "着火了！快灭火！",-- 物品名:"浆果丛"->正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "有点营养不良的样子。",		-- 物品名:"多汁浆果丛"
			WITHERED = "太热了，它也想喝水吗？",		-- 物品名:"多汁浆果丛"->枯萎了
			GENERIC = "这种浆果很好吃哦！",		-- 物品名:"多汁浆果丛"->默认
			PICKED = "空空的。",		-- 物品名:"多汁浆果丛"->被采完了
			DISEASED = "它生病了，离远一点比较好。",		-- 物品名:"多汁浆果丛"->生病了
			DISEASING = "感觉不太妙……",		-- 物品名:"多汁浆果丛"->正在生病
			BURNING = "不！我的果酱！",     -- 物品名:"多汁浆果丛"->正在燃烧        --结合一下上面的劲爆会更合适一点
		},
		BIGFOOT = "哇！这是巨人的脚印吗？！",-- 物品名:"大脚怪"->单机 大脚怪
		BIRDCAGE =
		{
			GENERIC = "给小鸟做了个新家！",-- 物品名:"鸟笼"->默认 制造描述:"为你的鸟类朋友提供一个幸福的家。"
			OCCUPIED = "只要不是关在笼子里做实验就好……",-- 物品名:"鸟笼"->被占领
			SLEEPING = "晚安，小鸟。",-- 物品名:"鸟笼"->睡着了
			HUNGRY = "它饿了，快给点吃的吧。",-- 物品名:"鸟笼"->有点饿了
			STARVING = "它看起来饿坏了！",-- 物品名:"鸟笼"->饥荒（梅老板：鸟想玩饥荒了）
			DEAD = "小鸟……不动了……",-- 物品名:"鸟笼"->死了
			SKELETON = "只剩下骨头了……",-- 物品名:"骷髅"->死很久了，尸体烂掉了
		},
		BIRDTRAP = "只是想观察一下，不会伤到你的。",-- 物品名:"捕鸟陷阱" 制造描述:"捕捉会飞的动物。"
		CAVE_BANANA_BURNT = "哎呀，树烧焦了……可惜了那些香蕉。",-- 物品名:"烧焦的香蕉树"
		BIRD_EGG = "小小的蛋，还在保温中吗？",-- 物品名:"鸟蛋"
		BIRD_EGG_COOKED = "煎蛋的味道，让我想起了早饭！",-- 物品名:"熟鸟蛋"
		BISHOP = "那个雕像……它的镜头好像一直跟着我。",-- 物品名:"发条主教"
		BLOWDART_FIRE = "便携式喷火装置！用的时候要离远点。",-- 物品名:"火焰吹箭" 制造描述:"向你的敌人喷火。"
		BLOWDART_SLEEP = "可以让坏人强制“关机”休息一会儿。",-- 物品名:"催眠吹箭" 制造描述:"催眠你的敌人。"
		BLOWDART_PIPE = "虽然做工简单，但在野外很实用！",-- 物品名:"吹箭" 制造描述:"向你的敌人喷射利齿。"
		BLOWDART_YELLOW = "带电的？射出去噬啦噬啦的！",-- 物品名:"雷电吹箭" 制造描述:"朝你的敌人放闪电。"
		BLUEAMULET = "戴上它就像随身带着空调，好凉快。",-- 物品名:"寒冰护符" 制造描述:"多么冰冷酷炫的护符。"
		BLUEGEM = "好纯净的蓝色！像极地的冰川一样。",-- 物品名:"蓝宝石"
		BLUEPRINT =
		{
            COMMON = "原来是这样组装的！我已经完全理解了！",-- 物品名:"蓝图"
            RARE = "这个设计思路……真有趣，我要记在笔记上！",-- 物品名:"蓝图"->罕见的
        },
        SKETCH = "画得真详细，我也要提升一下绘图水平了。",-- 物品名:"{item}草图"
		COOKINGRECIPECARD =
		{
			GENERIC = "一份食谱，希望能做出稍微正常点的食物……",-- 物品名:"{item}食谱卡"->默认
		},
		BLUE_CAP = "蓝色的蘑菇，颜色很特别，可能有药用价值？",-- 物品名:"采摘的蓝蘑菇"
		BLUE_CAP_COOKED = "这就是实验料理……口感还行吧。",-- 物品名:"熟蓝蘑菇"
		BLUE_MUSHROOM =
		{
			GENERIC = "这种颜色的蘑菇在极地可不常见。",-- 物品名:"蓝蘑菇"->默认
			INGROUND = "它缩回去了，在休息吗？",-- 物品名:"蓝蘑菇"->在地里面
			PICKED = "已经被采集过了，等待下一个生长周期吧。",-- 物品名:"蓝蘑菇"->被采完了
		},
		BOARDS = "平整的木板，是搭建营地的基础材料。",-- 物品名:"木板" 制造描述:"更平直的木头。"
		BONESHARD = "生物的骨骼碎片……希望能还原出它的样子。",-- 物品名:"骨头碎片"
		BONESTEW = "肉汤！能在寒冷的时候喝上一碗就太棒了！",-- 物品名:"炖肉汤"
		BUGNET = "抓虫子的必备工具！",-- 物品名:"捕虫网" 制造描述:"抓虫子用的。"
		BUSHHAT = "战术伪装！看，我是一丛灌木！",-- 物品名:"灌木丛帽" 制造描述:"很好的伪装！"
		BUTTER = "真的是黄油？蝴蝶的构造真神奇……",-- 物品名:"黄油"
		BUTTERFLY =
		{
			GENERIC = "飞舞的小精灵，飞行轨迹很优雅。",-- 物品名:"蝴蝶"->默认
			HELD = "别乱动哦，我只是想观察一下你的翅膀。",-- 物品名:"蝴蝶"->拿在手里
		},
		BUTTERFLYMUFFIN = "虽然很香，但一想到原材料是蝴蝶……呜。",-- 物品名:"蝴蝶松饼"
		BUTTERFLYWINGS = "好漂亮的鳞粉，要小心保存。",-- 物品名:"蝴蝶翅膀"
		BUZZARD = "它在盘旋……是在寻找猎物吗？",-- 物品名:"秃鹫"

		SHADOWDIGGER = "像影子一样的助手，工作效率很高呢。",-- 物品名:"暗影仆人（采集的）"
        SHADOWDANCER = "虽然看不清脸，但动作很灵活。",-- 物品名:"暗影舞者"

		CACTUS =
		{
			GENERIC = "虽然有刺，但也是为了生存进化出来的。",-- 物品名:"仙人掌"->默认
			PICKED = "采集完毕，希望能快点长出来。",-- 物品名:"仙人掌"->被采完了
		},
		CACTUS_MEAT_COOKED = "烤过后刺就没有了，味道还不错！",-- 物品名:"熟仙人掌肉"
		CACTUS_MEAT = "看起来水分很多，就是刺有点麻烦。",-- 物品名:"仙人掌肉"
		CACTUS_FLOWER = "在恶劣环境中绽放的花朵，真美。",-- 物品名:"仙人掌花"

		COLDFIRE =
		{
			EMBERS = "火光变暗了，需要补充燃料。",-- 物品名:"吸热营火（一次性的冷火）"->即将熄灭
			GENERIC = "冷冷的火，好神奇的化学反应。",-- 物品名:"吸热营火"->默认
			HIGH = "反应很剧烈！离远一点比较好。",-- 物品名:"吸热营火"->高
			LOW = "火苗变小了。",-- 物品名:"吸热营火"->低
			NORMAL = "安静燃烧的蓝色火焰，看着它感觉很平静。",-- 物品名:"吸热营火"->普通
			OUT = "熄灭了。",-- 物品名:"吸热营火"->出去？外面？
		},
		CAMPFIRE =
		{
			EMBERS = "快要熄灭了，谁去加点木头？",-- 物品名:"营火（一次性火堆）"->即将熄灭 制造描述:"燃烧时发出光亮。"
			GENERIC = "温暖的火堆，是营地的核心！",-- 物品名:"营火"->默认
			HIGH = "哇！火烧得好旺！",-- 物品名:"营火"->高
			LOW = "火有点小了，要加柴吗？",-- 物品名:"营火"->低
			NORMAL = "噼啪作响的声音，听着很舒服。",-- 物品名:"营火"->普通
			OUT = "一片漆黑……下次要记得留火种。",-- 物品名:"营火"->烧完了
		},
		CANE = "有了这个，赶路就轻松多啦！",-- 物品名:"步行手杖" 制造描述:"泰然自若地快步走。"
		CATCOON = "好可爱的猫猫！好像和普通的猫不太一样？",-- 物品名:"浣猫"
		CATCOONDEN =
		{
			GENERIC = "这是这孩子们的秘密基地吗？",-- 物品名:"空心树桩"->默认
			EMPTY = "看起来空荡荡的。",-- 物品名:"空心树桩"->猫全似了
		},
		CATCOONHAT = "虽然很暖和……但果然还是活着的猫猫更可爱。",-- 物品名:"猫帽" 制造描述:"适合那些重视温暖甚于朋友的人。"
		COONTAIL = "很蓬松的尾巴，可以做成装饰品。",-- 物品名:"猫尾"
		CARROT = "胡萝卜！极地探险补充维生素的好帮手！",-- 物品名:"胡萝卜"
		CARROT_COOKED = "变得软软甜甜的，好吃！",-- 物品名:"烤胡萝卜"
		CARROT_PLANTED = "发现野生食材！把它拔出来吧！",-- 物品名:"胡萝卜"->种在地上的形态
		CARROT_SEEDS = "把希望的种子种下去~",-- 物品名:"椭圆形种子"
		CARTOGRAPHYDESK =
		{
			GENERIC = "这里可以绘制地图！这可是探险家的看家本领！",-- 物品名:"制图桌"->默认 制造描述:"准确地告诉别人你去过哪里。"
			BURNING = "不好！资料要被烧掉了！",-- 物品名:"制图桌"->正在燃烧
			BURNT = "珍贵的记录……都没了……",-- 物品名:"制图桌"->烧焦的
		},
		WATERMELON_SEEDS = "西瓜种子，希望能种出大西瓜！",-- 物品名:"方形种子"
		CAVE_FERN = "这种植物不需要阳光也能进行光合作用吗？",-- 物品名:"蕨类植物"->种在地上的形态
		CHARCOAL = "黑黑的木炭，可以用来做燃料或者画图。",-- 物品名:"木炭"        --《卖炭翁》古文致敬
        CHESSPIECE_PAWN = "这个雕塑看起来圆头圆脑的。",-- 物品名:"卒子雕塑"
        CHESSPIECE_ROOK =
        {
            GENERIC = "像是一座迷你的塔楼。",-- 物品名:"战车雕塑"->默认
            STRUGGLE = "它在抖动！里面有什么机关吗？",-- 物品名:"战车雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "是个骑士造型，看起来很可靠！",-- 物品名:"骑士雕塑"->默认
            STRUGGLE = "它在抖，是不是想出去巡逻？",-- 物品名:"骑士雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "这个主教雕像的线条很流畅呢。",-- 物品名:"主教雕塑"->默认
            STRUGGLE = "它在晃……要动了吗？",-- 物品名:"主教雕塑"->三基佬棋子晃动
        },
        CHESSPIECE_MUSE = "好优雅的雕像，她在思考什么？",-- 物品名:"女王雕塑"
        CHESSPIECE_FORMAL = "看起来地位很高，是个大人物吧。",-- 物品名:"国王雕塑"
        CHESSPIECE_HORNUCOPIA = "丰收的象征！虽然不能吃，但看着开心。",-- 物品名:"丰饶角雕塑"
        CHESSPIECE_PIPE = "连烟圈都定格了，真有趣的工艺。",-- 物品名:"泡泡烟斗雕塑"
        CHESSPIECE_DEERCLOPS = "这大家伙……做成雕像还是挺有压迫感的。",-- 物品名:"独眼巨鹿雕塑"
        CHESSPIECE_BEARGER = "这只熊看起来憨憨的，但破坏力惊人哦。",-- 物品名:"熊獾雕塑"
        CHESSPIECE_MOOSEGOOSE =
        {
            "究竟是鹿还是鸭子？真是生物学奇迹。",-- 物品名:"麋鹿鹅雕塑"
        },
        CHESSPIECE_DRAGONFLY = "要是它的翅膀能像无人机一样转就好了。",-- 物品名:"龙蝇雕塑"
		CHESSPIECE_MINOTAUR = "这大概就是传说中的守护者吧。",-- 物品名:"远古守护者雕塑"
        CHESSPIECE_BUTTERFLY = "月光下会发光吗？",-- 物品名:"月蛾雕塑"
        CHESSPIECE_ANCHOR = "陆地行舟？用来固定什么呢。",-- 物品名:"锚雕塑"
        CHESSPIECE_MOON = "把月亮带回营地，真浪漫！",-- 物品名:"“月亮” 雕塑"
        CHESSPIECE_CARRAT = "这是什么新品种的鼠类？好想养一只。",-- 物品名:"胡萝卜鼠雕塑"
        CHESSPIECE_MALBATROSS = "看起来像是会把船弄翻的那种鸟。",-- 物品名:"邪天翁雕塑"
        CHESSPIECE_CRABKING = "海底的霸主？这钳子真大。",-- 物品名:"帝王蟹雕塑"
        CHESSPIECE_TOADSTOOL = "背上长树的蘑菇……这也太神奇了。",-- 物品名:"毒菌蟾蜍雕塑"
        CHESSPIECE_STALKER = "古老的化石生物？透着一股神秘感。",-- 物品名:"远古织影者雕塑"
        CHESSPIECE_KLAUS = "有点吓人……希望能离远点。",-- 物品名:"克劳斯雕塑"      --春天来了，我看不见。句式致敬
        CHESSPIECE_BEEQUEEN = "蜜蜂们的女王，气场十足。",-- 物品名:"蜂王雕塑"
        CHESSPIECE_ANTLION = "沙漠陷阱的制造者。",-- 物品名:"蚁狮雕塑"
        CHESSPIECE_BEEFALO = "是我们的好伙伴牛牛！",-- 物品名:"皮弗娄牛雕塑"
		CHESSPIECE_KITCOON = "小猫咪！我要把它放在显眼的地方。",-- 物品名:"小浣猫雕塑"
		CHESSPIECE_CATCOON = "大猫咪雕像，尾巴还原得很棒。",-- 物品名:"浣猫雕塑"
        CHESSPIECE_MANRABBIT = "像是童话又不全是童话的生物。",-- 物品名:"兔人雕塑"
        CHESSPIECE_GUARDIANPHASE3 = "散发着另一种文明的气息。",-- 物品名:"天体英雄雕塑"
        CHESSPIECE_EYEOFTERROR = "一直盯着它看，感觉会被反过来观察。",-- 物品名:"恐怖之眼雕塑"
        CHESSPIECE_TWINSOFTERROR = "双倍的注视……稍微有点不自在。",-- 物品名:"双子魔眼雕塑"       --二者均为原BOSS早期翻译致敬
        CHESSPIECE_DAYWALKER = "看起来能轻易折断一棵树。",-- 物品名:"噩梦猪人雕像"      --《杀猪日记》系列视频致敬
        CHESSPIECE_DAYWALKER2 = "有点像废土风格的艺术品。",-- 物品名:"拾荒猪人雕像"
        CHESSPIECE_DEERCLOPS_MUTATED = "晶体化？也许是受环境影响变异了。",-- 物品名:"晶体独眼巨鹿雕塑"
        CHESSPIECE_WARG_MUTATED = "有点像源石感染……不，只是普通的变异。",-- 物品名:"附身座狼雕塑"
        CHESSPIECE_BEARGER_MUTATED = "外壳更坚硬了，防御力应该很高。",-- 物品名:"装甲熊獾雕塑"
        CHESSPIECE_SHARKBOI = "这是海里的霸主吗？",-- 物品名:"大霜鲨雕塑"
        CHESSPIECE_WORMBOSS = "巨型的蠕虫！看起来好可怕。",-- 物品名:"巨型蠕虫雕塑"
        CHESSPIECE_YOTS = "金闪闪的，是稀有品种吗？",-- 物品名:"镀金洞穴蠕虫雕塑"
        CHESSPIECE_WAGBOSS_ROBOT = "看起来是某种古老的机械造物。",-- 物品名:"战争瓦器人雕塑"
        CHESSPIECE_WAGBOSS_LUNAR = "来自月球的生物？好神秘。",-- 物品名:"天体后裔雕塑"

        CHESSJUNK1 = "看起来像是损坏的机械部件。",-- 物品名:"损坏的发条装置"      --《毁灭公爵》杜克台词（如果不是铁皮我都不知道这句话也是致敬）
        CHESSJUNK2 = "也许拆开来看看能修好？",-- 物品名:"损坏的发条装置"
        CHESSJUNK3 = "完全坏掉了……",-- 物品名:"损坏的发条装置"
		CHESTER = "你好呀！我可以把东西放在你这里吗？",-- 物品名:"切斯特"       --《荒野乱斗》切斯特台词致敬
		CHESTER_EYEBONE =
		{
			GENERIC = "这根骨头……好像和那个移动小箱子有联系。",-- 物品名:"眼骨"->默认
			WAITING = "它不动了，是待机模式吗？",-- 物品名:"眼骨"->需要等待
		},
		COOKEDMANDRAKE = "虽然它很吵……但为了生存，抱歉啦。",-- 物品名:"熟曼德拉草"
		COOKEDMEAT = "补充能量的最佳选择！",-- 物品名:"熟肉"
		COOKEDMONSTERMEAT = "经过高温处理，但毒素可能还在……",-- 物品名:"熟怪物肉"
		COOKEDSMALLMEAT = "一口就能吃掉的小点心。",-- 物品名:"熟小肉"
		COOKPOT =
		{
			COOKING_LONG = "咕嘟咕嘟……好期待呀！",-- 物品名:"烹饪锅"->饭还需要很久      《荒野乱斗》露米台词致敬
			COOKING_SHORT = "快要好了，香味飘出来了！",-- 物品名:"烹饪锅"->饭快做好了
			DONE = "大功告成！探险队开饭啦！",-- 物品名:"烹饪锅"->完成了
			EMPTY = "今天要尝试什么新配方呢？",-- 物品名:"烹饪锅"->默认状态（空的）
			BURNT = "啊！我的锅！",-- 物品名:"烹饪锅"->烧焦的锅
		},
		CORN = "这玉米颗粒饱满，应该很好吃！",-- 物品名:"玉米"
		CORN_COOKED = "爆米花！适合围着火堆讲故事的时候吃。",-- 物品名:"爆米花"
		CORN_SEEDS = "种下去就能得到更多爆米花！",-- 物品名:"簇状种子"
        CANARY =
		{
			GENERIC = "好鲜艳的羽毛！",-- 物品名:"金丝雀"->默认
			HELD = "小家伙，别啄我呀。",-- 物品名:"金丝雀"->拿在手里
		},
        CANARY_POISONED = "它好像中毒了，得救救它！",-- 物品名:"金丝雀（中毒）"

		CRITTERLAB = "小动物们就是从这里来的吗？",-- 物品名:"岩石巢穴"
        CRITTER_GLOMLING = "虽然黏糊糊的，但看久了也挺可爱的。",-- 物品名:"小格罗姆"
        CRITTER_DRAGONLING = "小小的翅膀，真能飞起来吗？",-- 物品名:"小龙蝇"
		CRITTER_LAMB = "好像一团棉花糖！",-- 物品名:"小钢羊"
        CRITTER_PUPPY = "要乖乖长大哦，不要咬人。",-- 物品名:"小座狼"
        CRITTER_KITTEN = "咪咪~你想玩逗猫棒吗？",-- 物品名:"浣猫崽"
        CRITTER_PERDLING = "走起路来摇摇晃晃的。",-- 物品名:"小火鸡"
		CRITTER_LUNARMOTHLING = "发光的小宝宝。",-- 物品名:"小蛾子"

		CROW =
		{
			GENERIC = "黑漆漆的，有点酷。",-- 物品名:"乌鸦"->默认
			HELD = "抓到了！虽然只是普通乌鸦。",-- 物品名:"乌鸦"->拿在手里
		},
		CUTGRASS = "在这个世界，草可是重要资源！",-- 物品名:"采下的草"
		CUTREEDS = "在水边采集到的芦苇。",-- 物品名:"采下的芦苇"
		CUTSTONE = "加工过的石块，可以用来搞建设。",-- 物品名:"石砖" 制造描述:"切成正方形的石头。"
		DEADLYFEAST = "哇……这绝对不能吃吧！",-- 物品名:"致命盛宴"->致命盛宴 单机  --单机早期版本的冒险模式是在关底的王座旁边刷新一个致命盛宴（贴图是大肉汤）具体去搜一搜好一点我不细说了
		DEER =
		{
			GENERIC = "这种生物居然没有眼睛？是依靠近视或者听觉行动吗？",-- 物品名:"无眼鹿"->默认->没有角
			ANTLER = "长出角来了！是到了繁殖季节吗？",-- 物品名:"无眼鹿"->长角
		},
        DEER_ANTLER = "虽然不知道怎么弄下来的，但好像是很坚硬的材料。",-- 物品名:"鹿角"
        DEER_GEMMED = "这只鹿身上镶嵌着宝石……是被人为改造过吗？",-- 物品名:"无眼鹿"->克劳斯的宝石鹿
		DEERCLOPS = "巨大的独眼生物！要注意它的行动模式，保持距离！",-- 物品名:"独眼巨鹿"   ---丁真梗致敬
		DEERCLOPS_EYEBALL = "极其巨大的角膜和晶状体……呃，看着有点不舒服。",-- 物品名:"独眼巨鹿眼球"
		EYEBRELLAHAT = "虽然用眼球做帽子有点古怪，但防水效果令人惊讶的好。",-- 物品名:"眼球伞" 制造描述:"面向天空的眼球让你保持干燥。"
		DEPLETED_GRASS =
		{
			GENERIC = "看起来是须根系植物。",-- 物品名:"草"  --重新种下的草，貌似这句没有调用
		},
        GOGGLESHAT = "探险家的标准装备！虽然这个只是装饰用的。",-- 物品名:"时髦的护目镜" 制造描述:"你可以瞪大眼睛看装饰性护目镜。"
        DESERTHAT = "防护等级提升！这样就能在沙尘暴里自由行动了。",-- 物品名:"沙漠护目镜" 制造描述:"从你的眼睛里把沙子揉出来。"
        ANTLIONHAT = "虽然看起来有点笨重，但防撞击效果应该不错。",-- 物品名:"刮地皮头盔" 制造描述:"旧地不去，新地不来。"
		DEVTOOL = "某种调试用的终端？",-- 物品名:"开发工具"
		DEVTOOL_NODEV = "权限不足，无法操作。",-- 试图使用开发工具，我也不知道是个啥玩意，只知道角色无法使用这个，想写去官方台词看看吧
		DIRTPILE = "地上的痕迹……有大型生物经过这里，去看看吧！",-- 物品名:"可疑的土堆"
		DIVININGROD =
		{
			COLD = "没有收到信号反馈。",-- 物品名:"探测杖"->周围离目标很远
			GENERIC = "信号探测器？希望能找到好东西。",-- 物品名:"探测杖"->默认（背包内查看）
			HOT = "数值爆表了！就在这附近！",-- 物品名:"探测杖"->不远处有探测目标（发疯式蜂鸣）
			WARM = "由于信号增强了，方向应该是正确的。",-- 物品名:"探测杖"->进入目标范围
			WARMER = "很近了！保持这个方向！",-- 物品名:"探测杖"->靠近目标
		},
		DIVININGRODBASE =
		{
			GENERIC = "某种装置的底座……看起来像是古代科技。",-- 物品名:"探测杖底座"->默认
			READY = "接口吻合，可以启动了。",-- 物品名:"探测杖底座"->好像是零件不全试图插入探测杖
			UNLOCKED = "系统已激活！",-- 物品名:"探测杖底座"->解锁了
		},
		DIVININGRODSTART = "这是……给我的新手装备吗？",-- 物品名:"探测杖底座"->冒险模式开局送的探测杖（大概？）
		DRAGONFLY = "空中单位！它的体温很高，要注意闪避！",-- 物品名:"龙蝇"
		ARMORDRAGONFLY = "耐高温装甲，穿上它我就不怕烫了，嘿嘿。",-- 物品名:"鳞甲" 制造描述:"脾气火爆的盔甲。"
		DRAGON_SCALES = "很好的隔热材料，可以用来制作防护装备。",-- 物品名:"鳞片"
		DRAGONFLYCHEST =
		{
			GENERIC = "这种材质做的箱子绝对防火，重要的资料可以放里面。",-- 物品名:"龙鳞宝箱" 制造描述:"一种结实且防火的容器。"->默认情况
            UPGRADED_STACKSIZE = "内部空间很大，可以装更多东西！",-- 物品名:"龙鳞宝箱" 制造描述:"一种结实且防火的容器。"->弹性升级
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "拆卸完毕，虽然看起来像是一堆废墟。",-- 物品名:"龙鳞火炉"->被锤成废墟
			GENERIC = "全自动加热装置！冬天只要有它就不用怕了。",-- 物品名:"龙鳞火炉"->没有宝石
			NORMAL = "正在运行中，很温暖。",-- 物品名:"龙鳞火炉"->一颗宝石
			HIGH = "输出功率过高！好热啊！",-- 物品名:"龙鳞火炉"->正常状态
		},

        HUTCH = "这是……长着河豚脸的移动箱子？好有个性！",-- 物品名:"哈奇"
        HUTCH_FISHBOWL =
        {
            GENERIC = "里面的液体很清澈，还有条小鱼。",-- 物品名:"星空"->默认
            WAITING = "它是那个箱子的遥控器吗？",-- 物品名:"星空"->哈奇似了
        },
		LAVASPIT =
		{
			HOT = "极高温度的液体！小心飞溅！",-- 物品名:"龙蝇唾液（新鲜）"
			COOL = "冷却凝固后的产物。",-- 物品名:"龙蝇唾液（凝固）"
		},
		LAVA_POND = "高温警告！绝对不能靠近边缘。",-- 物品名:"岩浆池"
		LAVAE = "岩浆里诞生的小生命？体温很高，不能直接摸哦。",-- 物品名:"岩浆虫"
		LAVAE_COCOON = "进入休眠状态的虫卵。",-- 物品名:"冷冻虫卵"
		LAVAE_PET =
		{
			STARVING = "各项指标下降！它快饿坏了！",-- 物品名:"超级可爱岩浆虫"->饥荒
			HUNGRY = "它在向我索要食物。",-- 物品名:"超级可爱岩浆虫"->有点饿了
			CONTENT = "看起来心情不错。",-- 物品名:"超级可爱岩浆虫"->正常状态
			GENERIC = "虽然不能抱抱，但它好像很喜欢我！",-- 物品名:"超级可爱岩浆虫"->饱腹状态
		},
		LAVAE_EGG =
		{
			GENERIC = "正在孵化的蛋，表面温度很高。",-- 物品名:"岩浆虫卵"->默认
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "温度过低，孵化会停止的！",-- 物品名:"岩浆虫卵"->冷了
			COMFY = "环境参数适宜，等待孵化。",-- 物品名:"岩浆虫卵"->孵化中
		},
		LAVAE_TOOTH = "采集到了……一颗牙齿。",-- 物品名:"岩浆虫尖牙"

		DRAGONFRUIT = "火龙果！甜甜的，水分也很足，探险途中的美味！",-- 物品名:"火龙果"
		DRAGONFRUIT_COOKED = "烤过后更甜了！",-- 物品名:"熟火龙果"
		DRAGONFRUIT_SEEDS = "火龙果的种子，要选一块好地种下。",-- 物品名:"球茎状种子"
		DRAGONPIE = "精致的甜点！吃完感觉充满了能量！",-- 物品名:"火龙果派"
		DRUMSTICK = "普通的鸟腿，烤了吃吧。",-- 物品名:"鸟腿"
		DRUMSTICK_COOKED = "好香的烤鸟腿！",-- 物品名:"炸鸟腿"
		DUG_BERRYBUSH = "把它移植回营地吧，可持续发展很重要！",-- 物品名:"浆果丛（铲起状态）"
		DUG_BERRYBUSH_JUICY = "这种浆果水分更多，但也更难保存。",-- 物品名:"多汁浆果丛（铲起状态）"貌似这条不生效？
		DUG_GRASS = "草根，带回去种起来。",-- 物品名:"草丛（铲起状态）"
		DUG_MARSH_BUSH = "好多刺……采集的时候要戴手套。",-- 物品名:"尖刺灌木（铲起状态）"
		DUG_SAPLING = "带根的小树苗。",-- 物品名:"树苗（铲起状态）"
		DURIAN = "呃……这个味道，是不是有点过于刺激了？",-- 物品名:"榴莲"
		DURIAN_COOKED = "烤过之后气味好像稍微散了一点……不，还是好臭！",-- 物品名:"超臭榴莲"
		DURIAN_SEEDS = "虽然很不想种，但也是一种资源。",-- 物品名:"脆籽荚"
		EARMUFFSHAT = "毛茸茸的，保护耳朵不被冻伤。",-- 物品名:"兔耳罩" 制造描述:"毛茸茸的保暖物品。"
		EGGPLANT = "紫色的茄子，看起来很健康。",-- 物品名:"茄子"
		EGGPLANT_COOKED = "软糯可口的烤茄子。",-- 物品名:"烤茄子"
		EGGPLANT_SEEDS = "茄子的种子，种下去就能收获紫色的快乐！",-- 物品名:"漩涡种子"

		ENDTABLE =
		{
			BURNT = "多么可惜……",-- 物品名:"茶几"->烧焦的 制造描述:"一张装饰桌。"
			GENERIC = "很有格调的小桌子，放点花装饰一下吧。",-- 物品名:"茶几"->放置花
			EMPTY = "上面空空的，需要一点点缀。",-- 物品名:"茶几"->空的
			WILTED = "花枯萎了……需要换新的。",-- 物品名:"茶几"->枯萎的
			FRESHLIGHT = "这些花……居然在发光？是某种生物荧光反应吗？",-- 物品名:"茶几"->茶几-新的发光的
			OLDLIGHT = "光芒开始减弱了，能量耗尽？",-- 物品名:"茶几"->内容物发光但是放很久了，此时照明范围会变小
		},
		DECIDUOUSTREE =
		{
			BURNING = "着火了！这里需要灭火！",-- 物品名:"桦栗树"->正在燃烧
			BURNT = "被烧毁的树木标本。",-- 物品名:"桦栗树"->烧焦的
			CHOPPED = "采集完毕。",-- 物品名:"桦栗树"->被砍了
			POISON = "敌意反应！这棵树活过来了！",-- 物品名:"桦栗树"->树精版
			GENERIC = "这种树的叶子颜色真特别，秋天会更红吧。",-- 物品名:"桦栗树"->默认
		},
		ACORN = "坚硬的果实，里面一定有好吃的果仁。",-- 物品名:"桦栗果"
        ACORN_SAPLING = "小小的希望，快快长大。",-- 物品名:"桦栗树树苗"
		ACORN_COOKED = "经过烘烤的果实，香气扑鼻。",-- 物品名:"烤桦栗果"
		BIRCHNUTDRAKE = "小型树木守卫？体型虽小，攻击性很强！",-- 物品名:"桦栗果精"
		EVERGREEN =
		{
			BURNING = "森林大火！快跑！",-- 物品名:"常青树"->正在燃烧     --只知道这是个梗致敬，不知道出处
			BURNT = "只剩下碳化的树干了。",-- 物品名:"常青树"->烧焦的
			CHOPPED = "木材获取成功。",-- 物品名:"常青树"->被砍了
			GENERIC = "这一带常见的植被，可以提供木材和燃料。",-- 物品名:"常青树"->默认
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "它燃烧得好快！",-- 物品名:"臃肿常青树"->正在燃烧
			BURNT = "彻底烧焦了。",-- 物品名:"臃肿常青树"->烧焦的
			CHOPPED = "倒下了。",-- 物品名:"臃肿常青树"->被砍了
			GENERIC = "这棵树的生长情况似乎不太好，叶子很稀疏。",-- 物品名:"臃肿常青树"->默认
		},
		TWIGGYTREE =
		{
			BURNING = "树枝着火了！",-- 物品名:"多枝树"->正在燃烧       --《秦安端巫》凝胶描述致敬
			BURNT = "黑乎乎的树枝。",-- 物品名:"多枝树"->烧焦的
			CHOPPED = "收集到了一些树枝。",-- 物品名:"多枝树"->被砍了
			GENERIC = "这棵树不掉种子，掉树枝？真方便！",-- 物品名:"多枝树"->默认
			DISEASED = "它好像生病了，需要治疗吗？",-- 物品名:"多枝树"->生病了
		},
		TWIGGY_NUT_SAPLING = "多枝树的幼苗。",-- 物品名:"多枝树苗"
        TWIGGY_OLD = "这棵树老得掉不出树枝了。",-- 物品名:"多枝树"->枯树状态
		TWIGGY_NUT = "长得像球果的种子。",-- 物品名:"多枝树种"->多枝树果
		EYEPLANT = "这也是植物吗？它一直在盯着我看……",-- 物品名:"眼球草"
		INSPECTSELF = "装备检查完毕，状态良好，随时可以出发！",--检查自己（不确定怎么触发，貌似检视自己的时候触发，但是现版本貌似不会触发）
		FARMPLOT =--农场已经被删了，只有其他模组可能会用到，比如枝江和海传
		{
			GENERIC = "农业试验田！希望能大丰收。",-- 物品名:农场（简易农场和改良农场都算）闲置状态
			GROWING = "种子正在努力发芽。",-- 种下种子
			NEEDSFERTILIZER = "土地贫瘠，需要施肥。",-- 肥料耗尽
			BURNT = "试验田……被烧毁了。",-- 烧焦的
		},
		FEATHERHAT = "伪装道具？也许能让我和鸟类更亲近。",-- 物品名:"羽毛帽" 制造描述:"头上的装饰。"
		FEATHER_CROW = "黑色的羽毛，轻飘飘的。",-- 物品名:"黑色羽毛"
		FEATHER_ROBIN = "红色的羽毛，很鲜艳。",-- 物品名:"红色羽毛"
		FEATHER_ROBIN_WINTER = "蓝色的羽毛，像冰一样漂亮。",-- 物品名:"蓝色羽毛"
		FEATHER_CANARY = "明黄色的羽毛，真明亮。",-- 物品名:"黄色羽毛"
		FEATHERPENCIL = "用来绘制地图的工具！还可以写日记。",-- 物品名:"羽毛笔" 制造描述:"是的，羽毛是必须的。"
        COOKBOOK = "以前探险家的智慧结晶，让我看看有什么好吃的……",-- 物品名:"烹饪指南" 制造描述:"查看你收集的食谱。"
		FEM_PUPPET = "她看起来被困在这个王座上了……某种封印仪式？",--某人坐在暗影王座上，貌似这条是坐在上面的是女性？
		FIREFLIES =
		{
			GENERIC = "自然界的灯光师。虽然微弱，但很美丽。",-- 物品名:"萤火虫"->默认
			HELD = "小心轻放，我也能制造一点点光亮！",-- 物品名:"萤火虫"->拿在手里
		},
		FIREHOUND = "红色的猎犬……体表温度很高，死后可能会爆炸！",-- 物品名:"红色猎犬"
		FIREPIT =
		{
			EMBERS = "快要熄灭了，快添把柴火！",-- 物品名:"火坑(石头火坑)"->即将熄灭 制造描述:"一种更安全、更高效的营火。"
			GENERIC = "加固后的营火，不用担心引起火灾了。",-- 物品名:"火坑"->默认（貌似无调用？）
			HIGH = "火焰非常旺盛！",-- 物品名:"火坑"->高
			LOW = "火势渐微。",-- 物品名:"火坑"->低
			NORMAL = "温暖而安全的火源。",-- 物品名:"火坑"->普通
			OUT = "即使熄灭了，石头还是温热的。",-- 物品名:"火坑"->熄灭
		},
		COLDFIREPIT =
		{
			EMBERS = "要灭了。",-- 物品名:"吸热火坑（石头冰火）"->即将熄灭 制造描述:"燃烧效率更高，但仍然越烤越冷。"
			GENERIC = "蓝色的火焰，真神奇。",-- 物品名:"吸热火坑"->默认
			HIGH = "最大功率制冷！",-- 物品名:"吸热火坑"->高
			LOW = "效果减弱了。",-- 物品名:"吸热火坑"->低
			NORMAL = "吸热反应炉？原理还没完全搞懂，但很凉快。",-- 物品名:"吸热火坑"->普通
			OUT = "停止工作了。",-- 物品名:"吸热火坑"->熄灭
		},
		FIRESTAFF = "点火法杖！要是能调节火力大小就好了，可以用来烤肉。",-- 物品名:"火魔杖" 制造描述:"利用火焰的力量！"
		FIRESUPPRESSOR =
		{
			ON = "自动灭火系统正在运行！基地的安全卫士。",-- 物品名:"雪球发射器"->开启 制造描述:"拯救植物，扑灭火焰，可添加燃料。"
			OFF = "处于待机状态。",-- 物品名:"雪球发射器"->关闭
			LOWFUEL = "燃料告急！红灯在闪了！",-- 物品名:"雪球发射器"->燃料不足
		},

		FISH = "普通的鱼。",-- 物品名:"鱼" --旧版的鱼，新版的是淡水鱼
		FISHINGROD = "钓鱼不仅是为了食物，也是一种修身养性的活动。",-- 物品名:"淡水钓竿" 制造描述:"去钓鱼。为了鱼。"
		FISHSTICKS = "外酥里嫩！一定要趁热吃。",-- 物品名:"炸鱼排"
		FISHTACOS = "这种吃法真新鲜！辣味会更棒。",-- 物品名:"鱼肉玉米卷"
		FISH_COOKED = "普通的烤鱼，补充蛋白质。",-- 物品名:"熟鱼" --旧版烤鱼
		FLINT = "很锋利，是野外求生的基础工具。",-- 物品名:"燧石"
		FLOWER =
		{
            GENERIC = "很漂亮的花呀！颜色真丰富。",-- 物品名:"花"->默认
            ROSE = "小心刺！玫瑰总是带刺的。",-- 物品名:"花"->玫瑰
        },
        FLOWER_WITHERED = "由于环境问题，这朵花枯萎了。",-- 物品名:"枯萎的花"
		FLOWERHAT = "虽然不能增加防御，但闻着花香心情会变好。",-- 物品名:"花环" 制造描述:"放松神经的东西。"
		FLOWER_EVIL = "这花的气息很奇怪……最好不要长时间接触。",-- 物品名:"邪恶花"
		FOLIAGE = "普通的植物叶片。",-- 物品名:"蕨叶"
		FOOTBALLHAT = "高分子……呃，猪皮做的头盔？意外地结实。",-- 物品名:"橄榄球头盔" 制造描述:"保护你的脑壳。"
        FOSSIL_PIECE = "古生物化石碎片！这可是珍贵的标本！",-- 物品名:"化石碎片"
        FOSSIL_STALKER =
        {
			GENERIC = "还需要更多碎片才能复原它。",-- 物品名:"奇异的骨架"->默认
			FUNNY = "好像拼错了？看起来怎么怪怪的。",-- 物品名:"奇异的骨架"->组装错误  这里的FUNNY其实是招笑的意思哈哈哈，拼错了招笑
			COMPLETE = "复原完成！完美的骨架！",-- 物品名:"奇异的骨架"->组装正确
        },
        STALKER = "它动了！注意，不是简单的复苏！",-- 物品名:"复活的骨架"  貌似洞穴和地面的复活骨架都是用的同一个检查台词？
        STALKER_ATRIUM = "巨大的能量源……这就是这里的‘主人’吗？",-- 物品名:"远古织影者"
        STALKER_MINION = "小心那些干扰项！",-- 物品名:"编织暗影"
        THURIBLE = "散发着让人不安的气味，某种源石技艺的媒介吗？",-- 物品名:"暗影香炉"
        ATRIUM_OVERGROWTH = "上面刻着奇怪的符号，值得记录。",-- 物品名:"远古方尖碑"
		FROG =
		{
			DEAD = "它已经死了。",-- 物品名:"青蛙"->死了
			GENERIC = "两栖类生物。别攻击我！",-- 物品名:"青蛙"->默认
			SLEEPING = "处于休眠状态。",-- 物品名:"青蛙"->睡着了
		},
		FROGGLEBUNWICH = "看起来有点奇怪，但味道还不错。",-- 物品名:"蛙腿三明治"
		FROGLEGS = "腿部肌肉很发达。",-- 物品名:"蛙腿"
		FROGLEGS_COOKED = "味道像鸡肉！",-- 物品名:"熟蛙腿"
		FRUITMEDLEY = "水果盛宴！补充维生素的最佳选择。",-- 物品名:"水果圣代"
		FURTUFT = "黑色的毛丛。",-- 物品名:"毛丛"
		GEARS = "精密加工的机械零件，工艺很高超。",-- 物品名:"齿轮"
		GHOST = "灵体现象？没有实体，物理攻击可能无效。",-- 物品名:"幽灵"
		GOLDENAXE = "更加耐用的斧头，金灿灿的！",-- 物品名:"黄金斧头" 制造描述:"砍树也要有格调！"
		GOLDENPICKAXE = "用金子做的工具，太奢侈了吧？",-- 物品名:"黄金鹤嘴锄" 制造描述:"像大Boss一样砸碎岩石。"
		GOLDENPITCHFORK = "虽然是金子做的，但还是要用来干农活。",-- 物品名:"黄金干草叉" 制造描述:"重新布置整个世界。"
		GOLDENSHOVEL = "希望能挖到宝藏！",-- 物品名:"黄金铲子" 制造描述:"挖掘作用相同，但使用寿命更长。"
		GOLDNUGGET = "贵金属！可以用它做很多科学仪器。",-- 物品名:"金块"
		GRASS =
		{
			BARREN = "土壤肥力不足。",-- 物品名:"草"->需要肥料
			WITHERED = "环境温度过高，水分蒸发了。",-- 物品名:"草"->枯萎了
			BURNING = "燃烧反应正在进行！",-- 物品名:"草"->正在燃烧
			GENERIC = "一丛普通的草。",-- 物品名:"草"->默认
			PICKED = "已经被采集过了，等待再生。",-- 物品名:"草"->被采完了
			DISEASED = "发生病变了，要小心感染。",-- 物品名:"草"->生病了
			DISEASING = "叶片开始变色了。",-- 物品名:"草"->正在生病？？
		},
		GRASSGEKKO =
		{
			GENERIC = "拟态能力很强的生物。",-- 物品名:"草壁虎"->默认
			DISEASED = "它看起来很难受。",-- 物品名:"草壁虎"->生病了
		},
		GREEN_CAP = "未知的真菌，生吃可能会导致精神不稳定。",-- 物品名:"采摘的绿蘑菇"
		GREEN_CAP_COOKED = "经过高温处理，应该安全了……大概？",-- 物品名:"熟绿蘑菇"        --实际的裸盖素蘑菇碰都不能碰的
		GREEN_MUSHROOM =
		{
			GENERIC = "这种颜色的蘑菇通常要在特定时间采集。",-- 物品名:"绿蘑菇"->默认
			INGROUND = "它躲在地下。",-- 物品名:"绿蘑菇"->在地里面
			PICKED = "只剩下菌丝体了。",-- 物品名:"绿蘑菇"->被采完了
		},
		GUNPOWDER = "易燃易爆物品，请小心轻放！",-- 物品名:"火药" 制造描述:"一把火药。"
		HAMBAT = "虽然是武器，但看着好想吃一口……",-- 物品名:"火腿棒" 制造描述:"舍不得火腿套不着狼。"
		HAMMER = "拆解工作就交给我吧！",-- 物品名:"锤子" 制造描述:"敲碎各种东西。"
		HEALINGSALVE = "简单的急救药物，但也很有用。",-- 物品名:"治疗药膏" 制造描述:"对割伤和擦伤进行消毒杀菌。"
		HEATROCK =
		{
			FROZEN = "温度极低，小心冻伤！",-- 物品名:"暖石"->冰冷 制造描述:"储存热能供旅行途中使用。"
			COLD = "表面温度较低。",-- 物品名:"暖石"->微凉
			GENERIC = "可以储存热能的石头，原理不明。",-- 物品名:"暖石"->默认
			WARM = "正在散发热量。",-- 物品名:"暖石"->温暖
			HOT = "核心温度过高，携带时请注意。",-- 物品名:"暖石"->很烫
		},
		HOME = "这里是……某个人的家吗？",--没调用    不确定是什么东西，只确定是个家
		HOMESIGN =
		{
			GENERIC = "这是谁留下的标记？",-- 物品名:"木牌"->默认 制造描述:"在世界中留下你的标记。"
            UNWRITTEN = "需要用羽毛笔在上面记录信息。",-- 物品名:"木牌"->没有写字
			BURNT ="被火烧毁了。",-- 物品名:"木牌"->烧焦的
		},
		ARROWSIGN_POST =
		{
			GENERIC = "指示牌，跟着它走应该没错。",-- 物品名:"指路木牌"->默认 制造描述:"对这个世界指指点点。或许只是打下手势。"
            UNWRITTEN = "一片空白。",-- 物品名:"指路木牌"->没有写字
			BURNT ="烧焦的路标。",-- 物品名:"指路木牌"->烧焦的
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "指示牌，跟着它走应该没错。",-- 物品名:"指路木牌"->默认
            UNWRITTEN = "一片空白。",-- 物品名:"指路木牌"->没有写字
			BURNT ="烧焦的路标。",-- 物品名:"指路木牌"->烧焦的
		},
		HONEY = "高能量食品！而且很甜。",-- 物品名:"蜂蜜"
		HONEYCOMB = "满满的蜂蜡。",-- 物品名:"蜜脾"
		HONEYHAM = "这就是幸福的味道吗？！",-- 物品名:"蜜汁火腿"
		HONEYNUGGETS = "就像莱茵生命食堂的特供餐点，美味！",-- 物品名:"蜜汁卤肉"
		HORN = "可以发出巨大的声响，也许能用来通讯？",-- 物品名:"牛角"
		HOUND = "敌意生物接近！准备战斗！",-- 物品名:"猎犬"
		HOUNDCORPSE =
		{
			GENERIC = "已经死了……虽然有点残缺。",-- 物品名:"猎犬（尸体）"->默认
			BURNING = "经过高温处理的尸体。",-- 物品名:"猎犬（尸体）"->正在燃烧
			REVIVING = "它要复活了？！",-- 物品名:"猎犬（尸体）"->正在复活
		},
		HOUNDBONE = "被啃得很干净的骨头。",-- 物品名:"犬骨"
		HOUNDMOUND = "狗窝……得小心里面有东西冲出来。",-- 物品名:"猎犬丘"
		ICEBOX = "高效的冷藏设备，它是怎么运作的？",-- 物品名:"冰箱" 制造描述:"延缓食物变质。"
		ICEHAT = "保持冷静的好帮手！物理意义上的。",-- 物品名:"冰帽" 制造描述:"用科学技术合成的冰帽。"
		ICEHOUND = "冰元素的猎犬？死后会造成范围冻结。",-- 物品名:"蓝色猎犬"
		INSANITYROCK =
		{
			ACTIVE = "它的形态发生改变了！是因为我的精神状态吗？",-- 物品名:"方尖碑"->激活了
			INACTIVE = "现在只是一块黑色的石头。",-- 物品名:"方尖碑"->没有激活
		},
		JAMMYPRESERVES = "甜甜的果酱！虽然粘粘的但很好吃。",-- 物品名:"果酱"

		KABOBS = "把肉串起来烤，很有野外求生的感觉。",-- 物品名:"肉串"
		KILLERBEE =
		{
			GENERIC = "攻击型昆虫单位！",-- 物品名:"杀人蜂"->默认
			HELD = "它的刺依然致命，要小心。",-- 物品名:"杀人蜂"->拿在手里
		},
		KNIGHT = "它的动力源在哪里？我们要拆开看看吗？",-- 物品名:"发条骑士"
		KOALEFANT_SUMMER = "巨大的象鼻生物，看起来性格温顺。",-- 物品名:"考拉象"
		KOALEFANT_WINTER = "冬天长出了厚厚的毛，真适应环境啊。",-- 物品名:"考拉象"
		KOALEFANT_CARCASS = "生命停止了。",-- 物品名:"考拉象尸体"
		KRAMPUS = "那个带着袋子的怪人，他在偷东西！",-- 物品名:"坎普斯"
		KRAMPUS_SACK = "空间折叠技术？这个袋子能装好多东西！",-- 物品名:"坎普斯背包"
		LEIF = "树木为了自卫进化出了行动能力？",-- 物品名:"树精守卫"  普通树精
		LEIF_SPARSE = "这棵树的变异方向不太一样。",-- 物品名:"树精守卫"  松树树精
		LIGHTER  = "薇洛小姐的打火机。这对她来说很珍贵。",-- 物品名:"薇洛的打火机" 制造描述:"火焰在雨中彻夜燃烧。"
		LIGHTNING_ROD =
		{
			CHARGED = "它正在释放多余的电荷。",-- 物品名:"避雷针"->充能状态 制造描述:"防雷劈。"
			GENERIC = "把自然界的电能引导到地下，安全第一。",-- 物品名:"避雷针"->默认 制造描述:"防雷劈。"
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "你好呀，山羊先生！",-- 物品名:"伏特羊"->默认
			CHARGED = "这只山羊带电了！不要随意触碰。",-- 物品名:"伏特羊"->闪电充能状态
		},
		LIGHTNINGGOATHORN = "充满电荷的角，绝佳的导电材料。",-- 物品名:"伏特羊角"
		GOATMILK = "带电的牛奶！喝下去麻麻的，很提神！",-- 物品名:"带电的羊奶"
		LITTLE_WALRUS = "还没有长大的海象，也要学着捕猎吗？",-- 物品名:"小海象"
		LIVINGLOG = "这根木头还在‘活着’，它在看着我。",-- 物品名:"活木头" 制造描述:"投身制作，置身其中。"
		LOG =
		{
			BURNING = "正在释放热能。",-- 物品名:"木头"->正在燃烧
			GENERIC = "基础建筑材料。可以用来生火。",-- 物品名:"木头"->默认
		},
		LUCY = "这把斧头……刚才是不是说话了？",-- 物品名:"露西斧"
		LUREPLANT = "诱捕型肉食植物，它是某种防御机制吗？",-- 物品名:"食人花"
		LUREPLANTBULB = "这是植物的球茎，似乎可以移植。",-- 物品名:"食人花种子"
		MALE_PUPPET = "他被困住了……某种能量场禁锢了他。",--查看暗影王座上的人，对方是男性，与上面的女性相同

		MANDRAKE_ACTIVE = "它跑得好快！而且好吵！",-- 物品名:"曼德拉草"->跟随状态
		MANDRAKE_PLANTED = "露出地面的叶子。",-- 物品名:"曼德拉草"->地里的状态
		MANDRAKE = "终于安静下来了。",-- 物品名:"曼德拉草"->物品状态

        MANDRAKESOUP = "据说喝了这个会睡得很香。",-- 物品名:"曼德拉草汤"
        MANDRAKE_COOKED = "经过烹饪后，它失去了活性。",-- 物品名:"烤曼德拉草"
        MAPSCROLL = "制图学是很重要的技能！这样就不会迷路了。",-- 物品名:"地图卷轴" 制造描述:"向别人展示你看到什么！"
        MARBLE = "很好的建筑材料，硬度足够。",-- 物品名:"大理石"
        MARBLEBEAN = "像大理石一样的豆子。会长出石头树吗？",-- 物品名:"大理石豌豆" 制造描述:"种植一片大理石森林。"
        MARBLEBEAN_SAPLING = "破土而出的石头芽！",-- 物品名:"大理石芽（种下去的大理石豆）"
        MARBLESHRUB = "即使是灌木也是石头做的。",-- 物品名:"大理石灌木（种下去的大理石豆长出来的样子）"
        MARBLEPILLAR = "古代文明的遗迹。",-- 物品名:"大理石柱（世界中不可再生的大理石矿）"
        MARBLETREE = "完全石质化的树木，非常坚硬。",-- 物品名:"大理石树（世界中不可再生的大理石矿的另一种形态）"
        MARSH_BUSH =
        {
			BURNT = "荆棘被烧毁了。",-- 物品名:"尖刺灌木"->烧焦的
            BURNING = "危险的植物着火了！",-- 物品名:"尖刺灌木"->正在燃烧
            GENERIC = "在这片区域行动要格外小心，全是刺。",-- 物品名:"尖刺灌木"->默认
            PICKED = "采集成功，虽然被扎了一下。",-- 物品名:"尖刺灌木"->被采完了
        },
        BURNT_MARSH_BUSH = "只剩下灰烬了。",-- 物品名:"尖刺灌木"->只剩骨架状态，龙蝇领地刷新
        MARSH_PLANT = "沼泽生态系统的常见植物。",-- 物品名:"植物（池塘边植物）"
        MARSH_TREE =
        {
            BURNING = "即使着火了看起来也很危险！",-- 物品名:"针刺树"->正在燃烧
            BURNT = "现在它是黑色的刺了。",-- 物品名:"针刺树"->烧焦的
            CHOPPED = "清理完毕。",-- 物品名:"针刺树"->被砍了
            GENERIC = "尽量不要碰到它，看起来很锋利。",-- 物品名:"针刺树"->默认
        },
        MAXWELL = "看起来很有故事的绅士。",-- 物品名:"麦斯威尔"->单机 麦斯威尔
        MAXWELLHEAD = "巨大的全息投影？不，好像是实体。",-- 物品名:"麦斯威尔的头"->单机 麦斯威尔的头
        MAXWELLLIGHT = "不需要燃料的灯，很神奇。",-- 物品名:"麦斯威尔灯"->单机 麦斯威尔的灯
        MAXWELLLOCK = "需要特定的钥匙才能打开。",-- 物品名:"梦魇锁"->单机 麦斯威尔的噩梦锁
        MAXWELLTHRONE = "那把椅子散发着不祥的气息。",-- 物品名:"梦魇王座"->单机 麦斯威尔的噩梦王座
        MEAT = "未经处理的蛋白质来源。",-- 物品名:"肉"
        MEATBALLS = "简单又顶饱的料理！",-- 物品名:"肉丸"
        MEATRACK =
        {
            DONE = "肉干做好了！",-- 物品名:"晾肉架"->完成了
            DRYING = "风干是保存食物的有效手段。",-- 物品名:"晾肉架"->正在风干
            DRYINGINRAIN = "湿度太高了，干燥效率会下降。",-- 物品名:"晾肉架"->雨天风干
            GENERIC = "风干架，延长保质期的好东西。",-- 物品名:"晾肉架"->挂着物品
            BURNT = "被烧毁了，可惜。",-- 物品名:"晾肉架"->烧焦的
            DONE_NOTMEAT = "干燥完成，变得脆脆的！",-- 物品名:"晾肉架"->晾晒非肉
            DRYING_NOTMEAT = "正在脱水处理中。",-- 物品名:"晾肉架"->晾干非肉
            DRYINGINRAIN_NOTMEAT = "这种天气不适合做这个……",-- 物品名:"晾肉架"->雨天晾晒非肉
        },
        MEAT_DRIED = "肉干！虽然硬了点，但很耐饿。",-- 物品名:"肉干"
        MERM = "沼泽里的原住民？看起来不太友善。",-- 物品名:"鱼人"
        MERMHEAD =
        {
            GENERIC = "呃，腐败的气味……",-- 物品名:"鱼人头"->默认
            BURNT = "这味道简直是生化武器。",-- 物品名:"鱼人头"->烧焦的
        },
        MERMHOUSE =
        {
            GENERIC = "建得很简陋，而且还要漏雨。",-- 物品名:"漏雨的小屋"->默认
            BURNT = "彻底毁坏了。",-- 物品名:"漏雨的小屋"->烧焦的
        },
        MINERHAT = "这下我就能看清黑暗中的细节了！",-- 物品名:"矿工帽" 制造描述:"用你脑袋上的灯照亮夜晚。"
        MONKEY = "灵长类动物，小心它抢东西！",-- 物品名:"穴居猴"
        MONKEYBARREL = "那个桶……里面好像有动静？",-- 物品名:"穴居猴桶"
        MONSTERLASAGNA = "这层层叠叠的恐惧感……还是算了吧。",-- 物品名:"怪物千层饼"
        FLOWERSALAD = "花朵沙拉！不仅好看，还能缓解精神压力。",-- 物品名:"花沙拉"
        ICECREAM = "冰淇淋！耶！作为奖励我要吃两口！",-- 物品名:"冰淇淋"
        WATERMELONICLE = "透心凉！夏天的救星。",-- 物品名:"西瓜冰棍"
        TRAILMIX = "高热量补给品，恢复体力的好帮手。",-- 物品名:"什锦干果"
        HOTCHILI = "嘶——好辣！我的嘴巴要喷火了！",-- 物品名:"辣椒炖肉"
        GUACAMOLE = "这就是‘鼹鼠’的味道吗？开玩笑的。",-- 物品名:"鳄梨酱"
        MONSTERMEAT = "这种肉含有不明毒素，不能直接食用。",-- 物品名:"怪物肉"
        MONSTERMEAT_DRIED = "毒素好像减少了一点……但我还是不敢吃。",-- 物品名:"怪物肉干"
        MOOSE = "巨大的鹿鹅！生物学上的奇迹！",-- 物品名:"麋鹿鹅"
        MOOSE_NESTING_GROUND = "它是要在那里筑巢吗？",-- 物品名:"麋鹿鹅巢"
        MOOSEEGG = "巨大的蛋！我能听到里面的心跳声。",-- 物品名:"麋鹿鹅蛋"
        MOSSLING = "毛茸茸的宝宝！虽然长大了可能会很危险。",-- 物品名:"麋鹿鹅幼崽"
        FEATHERFAN = "扇一下就能产生极大的气流！",-- 物品名:"羽毛扇" 制造描述:"超柔软、超大的扇子。"
        MINIFAN = "利用风能的小工具，很有趣。",-- 物品名:"旋转的风扇" 制造描述:"你得跑起来，才能带来风！"
        GOOSE_FEATHER = "好软好蓬松！就像……",-- 物品名:"麋鹿鹅羽毛"
        STAFF_TORNADO = "气象控制装置？虽然只能制造旋风。",-- 物品名:"天气风向标" 制造描述:"把你的敌人吹走。"
        MOSQUITO =
        {
            GENERIC = "吸血昆虫！这可不是闹着玩的。",-- 物品名:"蚊子"->默认
            HELD = "抓到了！",-- 物品名:"蚊子"->拿在手里
        },
        MOSQUITOSACK = "充血的组织囊……有点恶心。",-- 物品名:"蚊子血囊"
        MOUND =
        {
            DUG = "被挖掘过了。我们是不是不该这么做？",-- 物品名:"坟墓"->被挖了
            GENERIC = "这里埋葬着谁呢？",-- 物品名:"坟墓"->默认
        },
        NIGHTLIGHT = "紫色的光……这种频率的光波很神秘。",-- 物品名:"暗夜灯" 制造描述:"用你的噩梦点亮夜晚。"
        NIGHTMAREFUEL = "这是……恐惧的实体化？不要盯着它看太久。",-- 物品名:"噩梦燃料" 制造描述:"傻子和疯子使用的邪恶残渣。"
        NIGHTSWORD = "握着它的时候，感觉有什么东西在窥视我。",-- 物品名:"暗夜剑" 制造描述:"造成噩梦般的伤害。"
        NITRE = "不稳定的化合物，小心爆炸。",-- 物品名:"硝石"
        ONEMANBAND = "一个人就是一支乐队！太酷了！",-- 物品名:"独奏乐器" 制造描述:"疯子音乐家也有粉丝。"
        OASISLAKE =
		{
			GENERIC = "沙漠绿洲！这里一定有独特的生态系统。",-- 物品名:"湖泊"->涨水期
			EMPTY = "暂时干涸了，等待雨季的到来。",-- 物品名:"湖泊"->枯水期（一般不能检查枯水绿洲）
		},
        PANDORASCHEST = "这种花纹……是哪个时代的工艺？",-- 物品名:"华丽箱子"
        PANFLUTE = "让我们来一场即兴演奏吧！",-- 物品名:"排箫" 制造描述:"抚慰凶猛野兽的音乐。"
        PAPYRUS = "古老的书写载体。",-- 物品名:"莎草纸" 制造描述:"用于书写。"
        WAXPAPER = "经过防水处理的纸。",-- 物品名:"蜡纸" 制造描述:"用于打包东西。"
        PENGUIN = "咕咕嘎嘎！",-- 物品名:"企鸥"
        PERD = "它把我的浆果都吃光了！坏火鸡！",-- 物品名:"火鸡"
        PEROGIES = "家乡的味道……虽然不太像，但很好吃！",-- 物品名:"波兰水饺"
        PETALS = "收集起来做标本吧。",-- 物品名:"花瓣"
        PETALS_EVIL = "充满了负面能量的花瓣。",-- 物品名:"深色花瓣"
        PHLEGM = "呃……某种分泌物。",-- 物品名:"脓鼻涕"
        PICKAXE = "地质勘探的好帮手！",-- 物品名:"鹤嘴锄" 制造描述:"凿碎岩石。"
        PIGGYBACK = "虽然有点重，但是能装很多东西。",-- 物品名:"猪皮包" 制造描述:"能装许多东西，但会减慢你的速度。"
        PIGHEAD =
        {
            GENERIC = "这种展示方式……太野蛮了。",-- 物品名:"猪头"->默认
            BURNT = "只剩下焦炭了。",-- 物品名:"猪头"->烧焦的
        },
        PIGHOUSE =
        {
            FULL = "灯亮着，他在家吗？",-- 物品名:"猪屋"->有猪且亮灯
            GENERIC = "可交流生物的聚居地。",--物品名:"猪屋"->默认
            LIGHTSOUT = "他好像出去了。",-- 物品名:"猪屋"->关灯了
            BURNT = "家园被毁了……",-- 物品名:"猪屋"->烧焦的
        },
        PIGKING = "这里的统治者？他看起来不需要减肥。",-- 物品名:"猪王"
        PIGMAN =
        {
            DEAD = "它已经死了……",-- 物品名:"猪人"->死了
            FOLLOWER = "我们现在是探险伙伴了！",-- 物品名:"猪人"->追随者
            GENERIC = "可交流的智慧生物。",-- 物品名:"猪人"->默认
            GUARD = "他看起来很严肃，是守卫吗？",-- 物品名:"猪人"->猪守卫
            WEREPIG = "突变！危险等级上升！",-- 物品名:"猪人"->疯猪
        },
        PIGSKIN = "虽说是皮肤，但坚韧度惊人。",-- 物品名:"猪皮"
        PIGTENT = "他们的临时住所吗？",-- 物品名:"猪人"
        PIGTORCH = "这里的燃料似乎永远烧不完。",-- 物品名:"猪火炬"
        PINECONE = "松果！里面藏着一棵大树。",-- 物品名:"松果"
        PINECONE_SAPLING = "为了森林的未来，加油生长吧！",-- 物品名:"常青树苗"
        LUMPY_SAPLING = "这棵树苗的样子有点怪。",-- 物品名:"臃肿树苗"
        PITCHFORK = "地形改造工具。",-- 物品名:"干草叉" 制造描述:"铲地用具。"
        PLANTMEAT = "这是植物组织还是肌肉组织？",-- 物品名:"叶肉"
        PLANTMEAT_COOKED = "烹饪过的叶肉……味道怪怪的。",-- 物品名:"熟叶肉"
        PLANT_NORMAL =--旧版农场中种的种子
        {
            GENERIC = "光合作用进行中。",-- 物品名:"农作物"->默认
            GROWING = "它在努力长高！",-- 物品名:"农作物"->正在生长
            READY = "熟了！可以摘啦。",-- 物品名:"农作物"->成熟
            WITHERED = "哦不，它干枯了……",-- 物品名:"农作物"->枯萎了（旧版农场作物热了直接热成干草了）
        },
        POMEGRANATE = "这水果需要剥很久，但味道值得。",-- 物品名:"石榴"
        POMEGRANATE_COOKED = "热乎乎多汁的石榴。",-- 物品名:"切片熟石榴"
        POMEGRANATE_SEEDS = "红宝石一样的种子。",-- 物品名:"风刮来的种子（石榴种子）"
        POND = "淡水资源，可能会有青蛙。",-- 物品名:"池塘"
        POOP = "有机肥料，虽然气味……",-- 物品名:"粪肥"
        FERTILIZER = "农业发展的基石！尽管它真的很臭。",-- 物品名:"便便桶" 制造描述:"少拉点在手上，多拉点在庄稼上。"
        PUMPKIN = "巨大的瓜果！能长这么大真不容易。",-- 物品名:"南瓜"
        PUMPKINCOOKIE = "南瓜饼干！甜甜的很好吃。",-- 物品名:"南瓜饼干"
        PUMPKIN_COOKED = "软糯香甜的南瓜。",-- 物品名:"烤南瓜"
        PUMPKIN_LANTERN = "在脸上刻出表情……是为了吓跑谁吗？",-- 物品名:"南瓜灯" 制造描述:"长着鬼脸的照明用具。"
        PUMPKIN_SEEDS = "可以烤来吃，也可以种下去。",-- 物品名:"尖种子(南瓜种子)"
        PURPLEAMULET = "它在侵蚀佩戴者的精神，危险物品。",-- 物品名:"梦魇护符" 制造描述:"引起精神错乱。"
        PURPLEGEM = "漂亮的紫色，蕴含着不稳定的能量。",-- 物品名:"紫宝石" 制造描述:"结合你们的颜色！"
        RABBIT =
        {
            GENERIC = "普通的兔形目生物。",-- 物品名:"兔子"->默认
            HELD = "在颤抖……别怕，我不会伤害你的。",-- 物品名:"兔子"->拿在手里
        },
        RABBITHOLE =
        {
            GENERIC = "兔子洞。它通向哪里呢？里面应该很复杂。",-- 物品名:"兔洞"->默认
            SPRING = "因为地下水位上涨被封住了吗？",-- 物品名:"兔洞"->春天
        },
        RAINOMETER =
        {
            GENERIC = "气象监测站的雏形。",-- 物品名:"雨量计"->默认 制造描述:"观测降雨机率。"
            BURNT = "设备损坏。",-- 物品名:"雨量计"->烧焦的 制造描述:"观测降雨机率。"
        },
        RAINCOAT = "用生物材料做的防水层，效果拔群。",-- 物品名:"雨衣" 制造描述:"让你保持干燥的防水外套。"
        RAINHAT = "宽大的帽檐，雨水淋不到脸了。",-- 物品名:"雨帽" 制造描述:"手感柔软，防雨必备。"
        RATATOUILLE = "蔬菜杂烩！均衡的营养。",-- 物品名:"蔬菜杂烩"
        RAZOR = "甚至可以用来给牛剃毛。",-- 物品名:"剃刀" 制造描述:"剃掉你脏脏的山羊胡子。"
        REDGEM = "像火一样的宝石。",-- 物品名:"红宝石"
        RED_CAP = "红色的伞盖。通常红色代表危险。",-- 物品名:"采摘的红蘑菇"
        RED_CAP_COOKED = "虽然煮熟了，但副作用还在吗？",-- 物品名:"熟红蘑菇"
        RED_MUSHROOM =
        {
            GENERIC = "警告：颜色鲜艳的真菌通常有毒。",-- 物品名:"红蘑菇"->默认
            INGROUND = "休眠状态的真菌。",-- 物品名:"红蘑菇"->在地里面
            PICKED = "采集完毕。",-- 物品名:"红蘑菇"->被采完了
        },
        REEDS =
        {
            BURNING = "易燃植物！",-- 物品名:"芦苇"->正在燃烧
            GENERIC = "长在水边的芦苇，是有用的材料。",-- 物品名:"芦苇"->默认
            PICKED = "已经被收割了。",-- 物品名:"芦苇"->被采完了
        },
        RELIC = "很久以前的东西，历史学价值很高。",-- 物品名:"遗物"
        RUINS_RUBBLE = "破碎的废墟。",-- 物品名:"损毁的废墟"
        RUBBLE = "建筑残骸。",-- 物品名:"碎石"
        RESEARCHLAB =
        {
            GENERIC = "基础科研设备。让我们开始解析这个世界的规则吧！",-- 物品名:"科学机器"->默认 制造描述:"解锁新的合成配方！"
            BURNT = "实验事故？不，是被烧毁了。",-- 物品名:"科学机器"->烧焦的 制造描述:"解锁新的合成配方！"
        },
        RESEARCHLAB2 =
        {
            GENERIC = "进阶版科研设备，能处理更复杂的转化。",-- 物品名:"炼金引擎"->默认 制造描述:"解锁更多合成配方！"
            BURNT = "高精密设备损坏，太可惜了。",-- 物品名:"炼金引擎"->烧焦的 制造描述:"解锁更多合成配方！"
        },
        RESEARCHLAB3 =
        {
            GENERIC = "这种装置……利用的是某种黑暗能量吗？我不喜欢。",-- 物品名:"暗影操控器"->默认 制造描述:"这还是科学吗？"
            BURNT = "黑暗消散了。",-- 物品名:"暗影操控器"->烧焦的 制造描述:"这还是科学吗？"
        },
        RESEARCHLAB4 =
        {
            GENERIC = "这究竟是科学还是魔术？",-- 物品名:"灵子分解器"->默认 制造描述:"增强高礼帽的魔力。"
            BURNT = "烧焦的帽子戏法。",-- 物品名:"灵子分解器"->烧焦的 制造描述:"增强高礼帽的魔力。"
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "用生命力换取生命力……这种等价交换太沉重了。",-- 物品名:"肉块雕像"->默认 制造描述:"以肉的力量让你重生。"
            BURNT = "它烧焦了。",-- 物品名:"肉块雕像"->烧焦的 制造描述:"以肉的力量让你重生。"
        },
        RESURRECTIONSTONE = "某种古老的复活机制，值得研究。",-- 物品名:"试金石"
        ROBIN =
        {
            GENERIC = "红色的羽毛很显眼。",-- 物品名:"红雀"->默认 --《Spring comes along》歌词致敬
            HELD = "抓到你了，小红鸟。",-- 物品名:"红雀"->拿在手里
        },
        ROBIN_WINTER =
        {
            GENERIC = "白色的羽毛是很好的伪装。",-- 物品名:"雪雀"->默认
            HELD = "像一团雪球。",-- 物品名:"雪雀"->拿在手里
        },
        ROBOT_PUPPET = "机器人看起来被困住了……",--查看暗影王座上的人，对方是机器人
        ROCK_LIGHT =
        {
            GENERIC = "熔岩坑。",-- 已移除-- 物品名:"熔岩坑"->刚生成
            OUT = "看起来很脆弱。",-- 已移除-- 物品名:"熔岩坑"->冷却
            LOW = "它在冷却。",-- 已移除-- 物品名:"熔岩坑"->低
            NORMAL = "温暖又明亮。",-- 已移除-- 物品名:"熔岩坑"->正常温度
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "大石头。",-- 物品名:"岩石（蚁狮落石）"->地面上
            RAISED = "太高了。",-- 物品名:"岩石（蚁狮落石）"->堆在一起的上方岩石
        },
        ROCK = "大石头。",-- 物品名:"岩石"
        PETRIFIED_TREE = "石头树。",-- 物品名:"石化树"这部分貌似可以自定义每种形态的石化树的查看台词？
        ROCK_PETRIFIED_TREE = "石头树。",-- 物品名:"石化树"貌似只有上面那句生效，下面这两句没有生效
        ROCK_PETRIFIED_TREE_OLD = "石头树。",-- 物品名:"石化树"
        ROCK_ICE =
        {
            GENERIC = "迷你冰川！这可是很棒的发现。",-- 物品名:"迷你冰川"->默认
            MELTED = "融化了……也还是可以用的。",-- 物品名:"迷你冰川"->融化了
        },
        ROCK_ICE_MELTED = "现在只是水了。不过也很重要。",-- 物品名:"融化的迷你冰川"
        ICE = "冰块！得赶紧用掉，不然就化了。",-- 物品名:"冰"
        ROCKS = "石头。可以用来制作基础工具。",-- 物品名:"石头"
        ROOK = "发条战车！那是相当大的动能，小心撞击！",-- 物品名:"发条战车"
        ROPE = "绳子。不仅结实，还能用来捆绑……咳，用来固定装备！",-- 物品名:"绳子" 制造描述:"紧密编成的草绳，非常有用。"
        ROTTENEGG = "腐烂的鸟蛋……呃，这种气味也是自然的一部分。",-- 物品名:"腐烂鸟蛋"
        ROYAL_JELLY = "蜂王浆！这可是非常珍贵的东西！",-- 物品名:"蜂王浆"
        JELLYBEAN = "彩虹糖豆！高热量补给，野外作业必备！",-- 物品名:"彩虹糖豆"
        SADDLE_BASIC = "鞍具。这样就可以骑皮弗娄牛进行长途考察了！",-- 物品名:"鞍具" 制造描述:"你坐在动物身上。仅仅是理论上。"
        SADDLE_RACE = "蝴蝶鞍具！多么轻盈的设计。",-- 物品名:"闪亮鞍具" 制造描述:"抵消掉完成目标所花费的时间。或许。"
        SADDLE_WAR = "看起来很坚固的鞍具。很有安全感。",-- 物品名:"战争鞍具" 制造描述:"战场首领的王位。"    
        SADDLEHORN = "用来拆卸鞍具的工具。操作时要小心。",-- 物品名:"鞍角" 制造描述:"把鞍具撬开。"
        SALTLICK = "舔盐块。可以补充动物所需的矿物质。",-- 物品名:"舔盐块" 制造描述:"好好喂养你家的牲畜。"
        BRUSH = "刷子！给皮弗娄牛梳毛可以让它们心情变好。",-- 物品名:"刷子" 制造描述:"减缓皮弗娄牛毛发的生长速度。"
		SANITYROCK =
		{
			ACTIVE = "这块黑曜石……它散发着一种令人不安的波动！",-- 物品名:"方尖碑"->激活了
			INACTIVE = "波动消失了？它看起来就像普通的障碍物。",-- 物品名:"方尖碑"->没有激活
		},
		SAPLING =
		{
			BURNING = "树苗着火了！这里需要灭火无人机！",-- 物品名:"树苗"->正在燃烧
			WITHERED = "环境温度太高了，它受不了。",-- 物品名:"树苗"->枯萎了（热的）
			GENERIC = "可爱的小树苗！不知道长大后是什么样子？",-- 物品名:"树苗"->默认
			PICKED = "采集完毕。它会再长出来的。",-- 物品名:"树苗"->被采完了
			DISEASED = "它好像被某种病菌感染了……", -- 已移除-- 物品名:"树苗"->生病了
			DISEASING = "它看起来不太舒服，需要治疗吗？", -- 已移除-- 物品名:"树苗"->正在生病？？
		},
   		SCARECROW =
   		{
			GENERIC = "你好！虽然你不会说话，但也是个不错的倾听者。",-- 物品名:"友善的稻草人"->默认 制造描述:"模仿最新的秋季时尚。"
			BURNING = "糟糕！它着火了！",-- 物品名:"友善的稻草人"->正在燃烧 制造描述:"模仿最新的秋季时尚。"
			BURNT = "只剩下灰烬了……真可惜。",-- 物品名:"友善的稻草人"->烧焦的 制造描述:"模仿最新的秋季时尚。"
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "这看起来像是一个陶轮。也许我可以尝试做点艺术品？",-- 物品名:"陶轮" 制造描述:"大理石在你手里将像黏土一样！"
			BLOCK = "石料已经就位了。准备开始雕刻！",-- 物品名:"陶轮"->上方有雕刻物品
			SCULPTURE = "一件杰作！我觉得很有艺术感。",-- 物品名:"陶轮"->雕像做好了
			BURNT = "设备损坏了。是被火烧坏的。",-- 物品名:"陶轮"->烧焦的
   		},
        SCULPTURE_KNIGHTHEAD = "骑士的头部模型。非常沉重。",-- 物品名:"可疑的大理石（骑士头）"
		SCULPTURE_KNIGHTBODY =--骑士身体
		{
			COVERED = "被石头盖住的雕像……里面是什么呢？",-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "它的头部缺失了。我们需要找到匹配的部件。",-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "修好啦！看起来完美。",-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "里面好像有什么东西在动！准备战斗！",-- 物品名:"大理石雕像"->敲开出怪
		},
        SCULPTURE_BISHOPHEAD = "主教的头部模型。很有研究价值。",-- 物品名:"可疑的大理石（主教头）"
		SCULPTURE_BISHOPBODY =--主教身体
		{
			COVERED = "被覆盖的雕像。让我看看里面是什么。",-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "它好像少了一部分。",-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "看起来很不错！",-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "我有种不好的预感……",-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_ROOKNOSE = "战车的……鼻子？或者说是撞锤。",-- 物品名:"可疑的大理石（战车角）"
		SCULPTURE_ROOKBODY =
		{
			COVERED = "一座奇怪的雕像。",-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "损坏很严重，需要那个“鼻子”部件。",-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "就像新的一样！",-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "里面好像有东西要出来！",-- 物品名:"大理石雕像"->准备好的 满的
		},
        GARGOYLE_HOUND = "用石头做的猎犬……这种工艺很奇特。",-- 物品名:"可疑的月岩（狗子）"
        GARGOYLE_WEREPIG = "石化的猪人？不，这只是雕塑。我想。",-- 物品名:"可疑的月岩（疯猪）"
		SEEDS = "种子！生命的胶囊。",-- 物品名:"种子"
		SEEDS_COOKED = "烤过的种子。虽然失去了活性，但很香脆。",-- 物品名:"烤种子"
		SEWING_KIT = "针线包。野外修补装备全靠它了。",-- 物品名:"针线包" 制造描述:"缝补受损的衣物。"
		SEWING_TAPE = "强力胶带。修补工作的快速方案。",-- 物品名:"可靠的胶布" 制造描述:"缝补受损的衣物。"
		SHOVEL = "铲子！我们要挖掘什么？",-- 物品名:"铲子" 制造描述:"挖掘各种各样的东西。"
		SILK = "蜘蛛丝。坚韧的有机纤维。",-- 物品名:"蜘蛛丝"
		SKELETON = "一具遗骸……希望你找到了平静。",-- 物品名:"骷髅"
		SCORCHED_SKELETON = "被烧焦的骨骸……多么可怕的命运。",-- 物品名:"易碎骷髅"
        SKELETON_NOTPLAYER = "这里的历史比我想象的还要久远。",-- 物品名:"骷髅"（23年情人节更新的鱼密欧和猪丽叶彩蛋）
		SKULLCHEST = "这个箱子的造型……有点令人毛骨悚然。", -- 已移除-- 物品名:"骷髅箱"
		SMALLBIRD =
		{
			GENERIC = "小高脚鸟！它的生命力很顽强。",-- 物品名:"小鸟（高鸟崽）"->默认
			HUNGRY = "你饿了吗，小家伙？稍等一下。",-- 物品名:"小鸟"->有点饿了
			STARVING = "它看起来非常饿！得赶紧喂食！",-- 物品名:"小鸟"->想玩饥荒了
			SLEEPING = "嘘……让它休息一会儿吧。",-- 物品名:"小鸟"->睡着了
		},
		SMALLMEAT = "小肉块。作为应急口粮应该没问题。",-- 物品名:"小肉"
		SMALLMEAT_DRIED = "小肉干。方便携带的蛋白质来源。",-- 物品名:"小风干肉"
		SPAT = "这生物分泌的粘液具有极强的粘性！要注意。",-- 物品名:"钢羊"
		SPEAR = "简易的长矛。防身用的基础装备。",-- 物品名:"长矛" 制造描述:"使用尖的那一端。"
		SPEAR_WATHGRITHR = "设计精良的武器，平衡性很好。",-- 物品名:"战斗长矛" 制造描述:"黄金使它更锋利。"
		WATHGRITHRHAT = "防护性能优异的头盔。",-- 物品名:"战斗头盔" 制造描述:"独角兽是你的保护神。"
		SPIDER =
		{
			DEAD = "它已经死了。",-- 物品名:"蜘蛛"->死了
			GENERIC = "是蜘蛛！它的行为模式很有趣，但最好保持距离。",-- 物品名:"蜘蛛"->默认
			SLEEPING = "处于休眠状态。小心不要惊动它。",-- 物品名:"蜘蛛"->睡着了
		},
		SPIDERDEN = "蜘蛛巢！里面肯定有很多蜘蛛。",-- 物品名:"蜘蛛巢"
		SPIDEREGGSACK = "这是蜘蛛的卵囊，小心处理。",-- 物品名:"蜘蛛卵" 制造描述:"跟你的朋友寻求点帮助。"
		SPIDERGLAND = "蜘蛛的腺体。含有某种活性医疗成分。",-- 物品名:"蜘蛛腺"
		SPIDERHAT = "蜘蛛面具。这算是一种伪装迷彩吗？",-- 物品名:"蜘蛛帽" 制造描述:"蜘蛛们会喊你\"妈妈\"。"
		SPIDERQUEEN = "那是女王级别的生物！体型数据惊人！",-- 物品名:"蜘蛛女王"
		SPIDER_WARRIOR =
		{
			DEAD = "威胁已清除。",-- 物品名:"蜘蛛战士"->死了
			GENERIC = "这种蜘蛛具有攻击性特征！注意安全！",-- 物品名:"蜘蛛战士"->默认
			SLEEPING = "即使在睡眠中，看起来也很危险。",-- 物品名:"蜘蛛战士"->睡着了
		},
		SPOILED_FOOD = "已经完全腐败了。不建议食用。",-- 物品名:"腐烂物"
        STAGEHAND =
        {
			AWAKE = "它对光线有反应！多么奇怪的生物机制。",-- 物品名:"舞台之手"->跟随光亮状态
			HIDING = "它伪装成了一张桌子。",-- 物品名:"舞台之手"->坐下
        },
        STATUE_MARBLE =
        {
            GENERIC = "精美的大理石雕刻工艺。",-- 物品名:"大理石雕像（戴着帽子像棋子但不是棋子的）"
            TYPE1 = "头部组件缺失。是战争还是时间造成的？",-- 物品名:"大理石雕像（薇格女神像.jpg)"
            TYPE2 = "面部表情刻画得很生动。",-- 物品名:"大理石雕像（没头戴面具那个）"
            TYPE3 = "这个造型……有什么象征意义吗？",-- 物品名:"大理石雕像（像罐子那种）"
        },
		STATUEHARP = "缺少头部的竖琴雕像。",-- 物品名:"竖琴雕像"
		STATUEMAXWELL = "这个雕像……给人一种压迫感。",-- 物品名:"麦斯威尔雕像"
		STEELWOOL = "钢丝绵。质地非常坚硬且粗糙。",-- 物品名:"钢丝绵"
		STINGER = "锐利的蜂针。可能有毒。",-- 物品名:"针刺"
		STRAWHAT = "草帽。在烈日下考察的好帮手。",-- 物品名:"草帽" 制造描述:"帮助你保持清凉干爽。"
		STUFFEDEGGPLANT = "酿茄子！看起来很美味的野外大餐。",-- 物品名:"酿茄子"
		SWEATERVEST = "保暖背心。虽然款式简单，但很实用。",-- 物品名:"犬牙背心" 制造描述:"粗糙，但挺时尚。"
		REFLECTIVEVEST = "反光背心。能在高温环境下作业。",-- 物品名:"清凉夏装" 制造描述:"穿上这件时尚的背心，让你神清气爽。"
		HAWAIIANSHIRT = "花衬衫！很休闲，就像度假一样！",-- 物品名:"花衬衫" 制造描述:"适合夏日穿着，或在周五便装日穿着。"
		TAFFY = "太妃糖！糖分补充完毕！",-- 物品名:"太妃糖"
		TALLBIRD = "高脚鸟。多么独特的直立行走生物！",-- 物品名:"高脚鸟"
		TALLBIRDEGG = "巨大的鸟蛋。营养成分应该很高。",-- 物品名:"高脚鸟蛋"
		TALLBIRDEGG_COOKED = "巨大的煎蛋。够我吃一整天了！",-- 物品名:"煎高脚鸟蛋"
		TALLBIRDEGG_CRACKED =
		{
			COLD = "孵化温度过低！",-- 物品名:"孵化中的高脚鸟蛋"->冷了
			GENERIC = "内部有生命活动迹象！监测中。",-- 物品名:"孵化中的高脚鸟蛋"->默认
			HOT = "孵化温度过高！它会坏掉的！",-- 物品名:"中暑"->热了
			LONG = "孵化进程还在继续……",-- 物品名:"孵化中的高脚鸟蛋"->还需要很久
			SHORT = "即将破壳！准备记录！",-- 物品名:"孵化中的高脚鸟蛋"->很快了
		},
		TALLBIRDNEST =
		{
			GENERIC = "这是高脚鸟的筑巢地。",-- 物品名:"高脚鸟巢"->默认
			PICKED = "目前是空的。",-- 物品名:"高脚鸟巢"->被采完了
		},
		TEENBIRD =--小高脚鸟这部分好像被小鸟代替了，貌似只有上面那段有用
		{
			GENERIC = "它的生长速度真惊人！",-- 物品名:"小高脚鸟"->默认
			HUNGRY = "你饿了吗，小家伙？",-- 物品名:"小高脚鸟"->有点饿了
			STARVING = "它急需食物！",-- 物品名:"小高脚鸟"->挨饿
			SLEEPING = "生长激素正在发挥作用……晚安。",-- 物品名:"小高脚鸟"->睡着了
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "它启动了！空间好像很不稳定！", -- 单人模式-- 物品名:"木制装置"->激活了
			GENERIC = "这是某种古代传送装置的基座吗？", -- 单人模式-- 物品名:"木制装置"->默认
			LOCKED = "似乎被某种机制锁定了。", -- 单人模式-- 物品名:"木制装置"->锁住了
			PARTIAL = "组件还不完整。需要寻找其他部分。", -- 单人模式-- 物品名:"木制装置"->已经有部分了
		},
		TELEPORTATO_BOX = "装有电子元件的盒子。或许是控制单元？", -- 单人模式-- 物品名:"盒状装置"
		TELEPORTATO_CRANK = "这应该是一个启动装置。", -- 单人模式-- 物品名:"曲柄装置"
		TELEPORTATO_POTATO = "奇怪的金属构造体。它是核心部件吗？", -- 单人模式-- 物品名:"金属土豆状装置"
		TELEPORTATO_RING = "看似是聚焦环的组件。", -- 单人模式-- 物品名:"环状装置"
		TELESTAFF = "空间传送魔杖！这涉及到了非常高深的源石技艺……不对，是魔法。",-- 物品名:"传送魔杖" 制造描述:"穿越空间的法杖！时间要另外收费。"
		TENT =
		{
			GENERIC = "帐篷。在漫长的考察后，休息是必要的。",-- 物品名:"帐篷"->默认 制造描述:"回复理智值，但要花费时间并导致饥饿。"
			BURNT = "营地被毁了……",-- 物品名:"帐篷"->烧焦的 制造描述:"回复理智值，但要花费时间并导致饥饿。"
		},
		SIESTAHUT =
		{
			GENERIC = "遮阳棚。可以在炎热的中午休息一下。",-- 物品名:"遮阳篷"->默认 制造描述:"躲避烈日，回复理智值。"
			BURNT = "烧毁了。",-- 物品名:"遮阳篷"->烧焦的 制造描述:"躲避烈日，回复理智值。"
		},
		TENTACLE = "小心脚下！是触手生物！",-- 物品名:"触手"
		TENTACLESPIKE = "非常有威慑力的尖刺武器。",-- 物品名:"触手尖刺"
		TENTACLESPOTS = "触手的外皮。很有韧性。",-- 物品名:"触手皮"
		TENTACLE_PILLAR = "这……这是一个巨大的生物体！",-- 物品名:"大触手"
        TENTACLE_PILLAR_HOLE = "通往地下的深坑。也许连通着另一个生态圈。",-- 物品名:"硕大的泥坑"
		TENTACLE_PILLAR_ARM = "更小的触手个体。",-- 物品名:"小触手"
		TENTACLE_GARDEN = "看起来是一株植物，但感觉很危险。",-- 物品名:"大触手"(不知道是个啥玩意，貌似和别的大触手不一样，肯定不是中庭链接那个)
		TOPHAT = "精致的高礼帽。很有古典韵味。",-- 物品名:"高礼帽" 制造描述:"最经典的帽子款式。"
		TORCH = "便携式光源。在夜间考察至关重要。",-- 物品名:"火炬" 制造描述:"可携带的光源。"
		TRANSISTOR = "精密的电子元件！或许能用来修复罗德岛的设备？",-- 物品名:"电子元件" 制造描述:"科学至上！滋滋滋！"
		TRAP = "小型生物诱捕装置。",-- 物品名:"陷阱" 制造描述:"捕捉小型生物。"
		TRAP_TEETH = "放置式防御陷阱。触发机制很灵敏。",-- 物品名:"犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		TRAP_TEETH_MAXWELL = "这陷阱散发着危险的气息。", -- 单人模式-- 物品名:"麦斯威尔的犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西。"
		TREASURECHEST =
		{
			GENERIC = "标准的物资储存箱。做好分类很重要。",-- 物品名:"箱子"->默认 制造描述:"一种结实的容器。"
			BURNT = "物资被烧毁了……",-- 物品名:"箱子"->烧焦的 制造描述:"一种结实的容器。"
            UPGRADED_STACKSIZE = "储存空间优化完毕！",-- 物品名:"箱子"->弹性空间升级 制造描述:"一种结实的容器。"
		},
		TREASURECHEST_TRAP = "看起来像箱子，但总觉得哪里不对劲。",-- 物品名:"陷阱箱？"感觉是废案
        CHESTUPGRADE_STACKSIZE = "空间压缩装置！这也是源石技艺吗？", --弹性空间制造器
		COLLAPSEDCHEST = "储存单元已损坏。",--"损坏的箱子"弹性箱子被敲掉会变成废墟
		SACRED_CHEST =
		{
			GENERIC = "神秘的古代箱子。需要特定的密钥吗？",-- 物品名:"远古宝箱"->默认
			LOCKED = "它似乎在检测放入的物品。",-- 物品名:"远古宝箱"->进行解密判定
		},
		TREECLUMP = "高密度的植被阻碍了通行。", -- 已移除-- 物品名:"远古宝箱"

		TRINKET_1 = "因高温变形的玻璃球。", --Melted Marbles		-- 物品名:"熔化的弹珠"
		TRINKET_2 = "仿制的乐器。吹起来挡简单的。", --Fake Kazoo		-- 物品名:"假卡祖笛"
		TRINKET_3 = "打的结好复杂啊，完全解不开！", --Gord's Knot		-- 物品名:"戈尔迪之结"
		TRINKET_4 = "花园装饰物。很有年代感。", --Gnome		-- 物品名:"地精爷爷"
		TRINKET_5 = "空气动力学模型！", --Toy Rocketship		-- 物品名:"迷你火箭"
		TRINKET_6 = "损坏的电路。", --Frazzled Wires		-- 物品名:"烂电线"
		TRINKET_7 = "锻炼手眼协调的小玩具。", --Ball and Cup		-- 物品名:"杯子和球"
		TRINKET_8 = "工业用橡胶塞。", --Rubber Bung		-- 物品名:"硬化橡胶塞"
		TRINKET_9 = "规格不统一的扣件。", --Mismatched Buttons		-- 物品名:"不搭的纽扣"
		TRINKET_10 = "假体……看起来曾经属于某个人。", --Dentures		-- 物品名:"二手假牙"
		TRINKET_11 = "可动的机械模型！", --Lying Robot		-- 物品名:"机器人玩偶"
		TRINKET_12 = "脱水的生物标本。", --Dessicated Tentacle		-- 物品名:"干瘪的触手"
		TRINKET_13 = "另一个花园装饰物。", --Gnomette		-- 物品名:"地精奶奶"
		TRINKET_14 = "破损的容器。", --Leaky Teacup		-- 物品名:"漏水的茶杯"
		TRINKET_15 = "主教棋子。白方的。", --Pawn		-- 物品名:"白色主教"
		TRINKET_16 = "主教棋子。黑方的。", --Pawn		-- 物品名:"黑色主教"
		TRINKET_17 = "发生塑性形变的餐具。", --Bent Spork		-- 物品名:"弯曲的叉子"
		TRINKET_18 = "木制动物模型。", --Trojan Horse		-- 物品名:"玩具木马"
		TRINKET_19 = "重心不稳的旋转体。", --Unbalanced Top		-- 物品名:"失衡陀螺"
		TRINKET_20 = "长柄抓挠工具。", --Backscratcher		-- 物品名:"痒痒挠"
		TRINKET_21 = "损坏的机械搅拌裝置。", --Egg Beater		-- 物品名:"破搅拌器"
		TRINKET_22 = "磨损的纱线。", --Frayed Yarn		-- 物品名:"磨损的纱线"
		TRINKET_23 = "辅助穿鞋的工具。", --Shoehorn		-- 物品名:"鞋拔子"
		TRINKET_24 = "某种招财图腾？看起来很喜庆。", --Lucky Cat Jar		-- 物品名:"幸运猫扎尔"
		TRINKET_25 = "散发着刺激性气味。", --Air Unfreshener		-- 物品名:"臭气制造器"
		TRINKET_26 = "有机物制作的容器？很有创意。", --Potato Cup		-- 物品名:"土豆杯"
		TRINKET_27 = "简单的金属支架。", --Coat Hanger		-- 物品名:"钢丝衣架"
		TRINKET_28 = "战车棋子。白方的。", --Rook		-- 物品名:"白色战车"
        TRINKET_29 = "战车棋子。黑方的。", --Rook		-- 物品名:"黑色战车"
        TRINKET_30 = "骑士棋子。白方的。", --Knight		-- 物品名:"白色骑士"
        TRINKET_31 = "骑士棋子。黑方的。", --Knight		-- 物品名:"黑色骑士"
        TRINKET_32 = "高折射率的球体。", -- 立方氧化锆球
        TRINKET_33 = "蜘蛛造型的指环。", -- 蜘蛛戒指
        TRINKET_34 = "灵长类动物的手部标本……呃。", -- 猴爪
        TRINKET_35 = "空的玻璃试剂瓶。", -- 空药剂瓶
        TRINKET_36 = "也是假体。", -- 假尖牙
        TRINKET_37 = "断掉的木桩。", -- 断裂的木桩
        TRINKET_38 = "光学望远镜！虽然很简单，但很有效！", -- 《欺诈之地》联动饰品：望远镜
        TRINKET_39 = "单只手套。另一只去哪了？", -- 《欺诈之地》联动饰品：单只手套
        TRINKET_40 = "腹足纲动物的外壳。", -- 《欺诈之地》联动饰品：蜗牛鳞片
        TRINKET_41 = "装在罐子里的黏液。", -- 《炽热熔岩》联动饰品：黏菌罐
        TRINKET_42 = "仿生蛇类玩具。", -- 《炽热熔岩》联动饰品：玩具眼镜蛇
        TRINKET_43= "仿生鳄鱼玩具。", -- 《炽热熔岩》联动饰品：鳄鱼玩具
        TRINKET_44 = "植物生态瓶。", -- 《缺氧》联动饰品：破损的玻璃容器
        TRINKET_45 = "接收不到信号的通讯器。", -- 《缺氧》联动饰品：古怪收音机
        TRINKET_46 = "热风发生器？", -- 《缺氧》联动饰品：吹风机

        -- 贴图和数字与上面的小玩具编号相对应。
        LOST_TOY_1  = "虽然只是个弹珠，但很有趣。",-- 物品名:"遗失的玻璃球"
        LOST_TOY_2  = "可以吹出声音。",-- 物品名:"多愁善感的卡祖笛"
        LOST_TOY_7  = "经典的物理玩具。",-- 物品名:"珍视的抽线陀螺"
        LOST_TOY_10 = "保存完好的牙齿。",-- 物品名:"缺少的牙齿"
        LOST_TOY_11 = "这也依然很可爱。",-- 物品名:"珍贵的玩具机器人"
        LOST_TOY_14 = "有着特别花纹的茶杯。",-- 物品名:"妈妈最爱的茶杯"
        LOST_TOY_18 = "做工精致的木马。",-- 物品名:"宝贵的玩具木马"
        LOST_TOY_19 = "转起来就停不下来。",-- 物品名:"最爱的陀螺"
        LOST_TOY_42 = "吓我不倒。",-- 物品名:"装错的玩具眼镜蛇"
        LOST_TOY_43 = "鳄鱼……虽然是假的。",-- 物品名:"宠爱的鳄鱼玩具"

        HALLOWEENCANDY_1 = "糖果苹果！果糖和快乐！",-- 物品名:"糖果苹果"
        HALLOWEENCANDY_2 = "糖果玉米！虽然是合成甜味，但很棒。",-- 物品名:"糖果玉米"
        HALLOWEENCANDY_3 = "这颗玉米糖甜度较低。",-- 物品名:"不太甜的玉米"
        HALLOWEENCANDY_4 = "蜘蛛造型的糖果。口感很奇特。",-- 物品名:"粘液蜘蛛"
        HALLOWEENCANDY_5 =  "浣猫造型的糖果！",-- 物品名:"浣猫糖果"
        HALLOWEENCANDY_6 = "是普通葡萄干。",-- 物品名:"\"葡萄干\""
        HALLOWEENCANDY_7 = "葡萄干糖果。",-- 物品名:"葡萄干"
        HALLOWEENCANDY_8 = "鬼魂形状的棒棒糖！",-- 物品名:"鬼魂棒棒糖"
        HALLOWEENCANDY_9 = "果冻虫！富含胶原蛋白？",-- 物品名:"果冻虫"
        HALLOWEENCANDY_10 = "触手棒棒糖……这是谁想出来的？",-- 物品名:"触手棒棒糖"
        HALLOWEENCANDY_11 = "巧克力！高热量补给！",-- 物品名:"巧克力猪"
        HALLOWEENCANDY_12 = "虱子形状的糖？独特的品味。", -- 《缺氧》主题 meal lice 糖果-- 物品名:"糖果虱"
        HALLOWEENCANDY_13 = "硬度极高。可以用来锻炼咬合力。", -- 《欺诈之地》主题糖果（也是科雷的游戏，主体好像是肉鸽吧）-- 物品名:"无敌硬糖"
        HALLOWEENCANDY_14 = "含有辣椒素的糖果！", -- 《炽热熔岩》辣椒糖果-- 物品名:"熔岩椒"
        CANDYBAG = "糖果袋！准备好收集糖果啦！",-- 物品名:"糖果袋" 制造描述:"只带万圣夜好吃的东西。"

		HALLOWEEN_ORNAMENT_1 = "鬼魂挂饰！",-- 物品名:"幽灵装饰"
		HALLOWEEN_ORNAMENT_2 = "蝙蝠挂饰！",-- 物品名:"蝙蝠装饰"
		HALLOWEEN_ORNAMENT_3 = "蜘蛛挂饰！",-- 物品名:"蜘蛛装饰"
		HALLOWEEN_ORNAMENT_4 = "触手挂饰！虽然是装饰，但看着还是有点危险。",-- 物品名:"触手装饰"
		HALLOWEEN_ORNAMENT_5 = "好多腿的装饰品！节肢动物爱好者会喜欢的。",-- 物品名:"穴居悬蛛装饰"
		HALLOWEEN_ORNAMENT_6 = "乌鸦装饰！很神秘的鸟类。",-- 物品名:"乌鸦装饰"

		HALLOWEENPOTION_DRINKS_WEAK = "基础回复合剂。纯度一般。",--小血瓶药剂
		HALLOWEENPOTION_DRINKS_POTENT = "强力回复合剂。活性很高！",--大血瓶药剂
        HALLOWEENPOTION_BRAVERY = "精神强化剂。能有效抑制恐惧感。",--勇气药剂（貌似两种都是这个统一的台词）
		HALLOWEENPOTION_MOON = "含有月岩粉末的试剂。",-- 物品名:"月亮精华液"
		HALLOWEENPOTION_FIRE_FX = "不稳定的化学混合物。会产生剧烈反应！",-- 物品名:"硫化实验"
		MADSCIENCE_LAB = "这个实验室……安全隐患太多了吧！",-- 物品名:"疯狂科学家实验室" 制造描述:"疯狂实验无极限。唯独神智有极限。"
		LIVINGTREE_ROOT = "根部检测到生命反应！",-- 物品名:"完全正常的树根"
		LIVINGTREE_SAPLING = "这株树苗……它在看我吗？",-- 物品名:"完全正常的树苗"

        DRAGONHEADHAT = "龙头造型的帽子！很有节日气氛。",-- 物品名:"幸运兽脑袋" 制造描述:"野兽装束的前端。"
        DRAGONBODYHAT = "躯干部分的装束。",-- 物品名:"幸运兽躯体" 制造描述:"野兽装束的中间部分。"
        DRAGONTAILHAT = "尾巴装饰！平衡性不错。",-- 物品名:"幸运兽尾巴" 制造描述:"野兽装束的尾端。"
        PERDSHRINE =
        {
            GENERIC = "供奉火鸡的祭坛？这种崇拜行为值得研究。",-- 物品名:"火鸡神龛"->默认 制造描述:"供奉庄严之火鸡。"
            EMPTY = "没有贡品。当前处于非激活状态。",-- 物品名:"火鸡神龛"->未激活 制造描述:"供奉庄严之火鸡。"
            BURNT = "被火烧毁的遗迹。",-- 物品名:"火鸡神龛"->烧焦的 制造描述:"供奉庄严之火鸡。"
        },
        REDLANTERN = "红灯笼！光谱很柔和。",-- 物品名:"红灯笼" 制造描述:"照亮你的路的幸运灯笼。"
        LUCKY_GOLDNUGGET = "幸运金块！含有微量的许愿成分？",-- 物品名:"幸运黄金"
        FIRECRACKERS = "爆竹！用来驱散猛兽的声学武器！",-- 物品名:"红鞭炮" 制造描述:"用爆炸来庆祝！"
        PERDFAN = "大扇子！好像能扇出好运。",-- 物品名:"幸运扇" 制造描述:"额外的运气，超级多。"
        REDPOUCH = "红包！这是龙门的传统吗？",-- 物品名:"红包"
        WARGSHRINE =
        {
            GENERIC = "座狼形态的祭坛。充满野性。",-- 物品名:"座狼神龛"->默认 制造描述:"供奉陶土之座狼。"
            EMPTY = "等待供奉中。",-- 物品名:"座狼神龛"->未激活 制造描述:"供奉陶土之座狼。"
            BURNING = "着火了！着火了！", -- 供薇洛替换用  -- 物品名:"座狼神龛"->正在燃烧 制造描述:"供奉陶土之座狼。"      --这段没有用，薇洛也没有用，感觉是想加但是懒得加的一段话
            BURNT = "已经烧成灰烬了。",-- 物品名:"座狼神龛"->烧焦的 制造描述:"供奉陶土之座狼。"
        },
        CLAYWARG =
        {
            GENERIC = "黏土构筑的生物模型。工艺很精湛。",-- 物品名:"黏土座狼"->默认
            STATUE = "它好像随时会动起来。",-- 物品名:"黏土座狼"->雕像
        },
        CLAYHOUND =
        {
            GENERIC = "黏土猎犬！注意防御。",-- 物品名:"黏土猎犬"->默认
            STATUE = "只是个雕像。解除警报。",-- 物品名:"黏土猎犬"->雕像
        },
        HOUNDWHISTLE = "高频哨子。能干扰犬类生物的听觉。",-- 物品名:"幸运哨子" 制造描述:"对野猎犬吹哨。"
        CHESSPIECE_CLAYHOUND = "猎犬造型的雕像。",-- 物品名:"猎犬雕塑"
        CHESSPIECE_CLAYWARG = "座狼造型的雕像。",-- 物品名:"座狼雕塑"

		PIGSHRINE =     --《饥荒》猪人台词、以及踏雪寻梅3124猪人骚话致敬
		{
            GENERIC = "猪人的祭祀设施。记录其社会行为。",-- 物品名:"猪神龛"->默认 制造描述:"供奉富饶之猪人。"
            EMPTY = "目前是空的。",-- 物品名:"猪神龛" 制造描述:"供奉富饶之猪人。"
            BURNT = "被破坏的设施。",-- 物品名:"猪神龛"->烧焦的 制造描述:"供奉富饶之猪人。"
		},
		PIG_TOKEN = "金色的腰带装饰。似乎象征着地位。",-- 物品名:"金腰带"
		PIG_COIN = "印有猪鼻图案的货币。",-- 物品名:"猪鼻铸币"
		YOTP_FOOD1 = "高蛋白烤肉！我也想尝尝。",-- 物品名:"贡品烤肉" 制造描述:"向猪王敬肉。"
		YOTP_FOOD2 = "馅饼！不知道是什么馅的？",-- 物品名:"八宝泥馅饼" 制造描述:"那里隐藏着什么？"
		YOTP_FOOD3 = "烤鱼串。野外生存的美味。",-- 物品名:"鱼头串" 制造描述:"棍子上的荣华富贵。"

		PIGELITE1 = "蓝色的猪人精英。看起来训练有素。", -- 蓝色-- 物品名:"韦德"->这四个是猪王召唤的抢金猪
		PIGELITE2 = "红色的猪人精英。攻击性很强。", -- 红色-- 物品名:"伊格内修斯"
		PIGELITE3 = "白色的猪人精英。注意它的战术。", -- 白色-- 物品名:"德米特里"
		PIGELITE4 = "绿色的猪人精英。像是个老手。", -- 绿色-- 物品名:"索耶"

		PIGELITEFIGHTER1 = "身着蓝色护甲的战士。", -- 蓝色-- 物品名:"韦德"->下面这四个是铸币召唤的打手猪(外观相同，作用不同)
		PIGELITEFIGHTER2 = "身着红色护甲的战士。", -- 红色-- 物品名:"伊格内修斯"
		PIGELITEFIGHTER3 = "身着白色护甲的战士。", -- 白色-- 物品名:"德米特里"
		PIGELITEFIGHTER4 = "身着绿色护甲的战士。", -- 绿色-- 物品名:"索耶"

		CARRAT_GHOSTRACER = "幽灵形态的生物？记录各种异常现象。",-- 物品名:"查理的胡萝卜鼠"

        YOTC_CARRAT_RACE_START = "竞速赛的起点线！准备起飞！",-- 物品名:"起点" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT = "检查点！保持速度！",-- 物品名:"检查点" 制造描述:"通往光荣之路上的一站。"
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "终点！我们要拿第一名！",-- 物品名:"终点线"->默认 制造描述:"你走投无路了。"       --《荒野乱斗》露米台词致敬
            BURNT = "终点被烧毁了。",-- 物品名:"终点线"->烧焦的 制造描述:"你走投无路了。"     --《荒野乱斗》露米台词致敬
            I_WON = "胜利！这是探险家的速度！",-- 物品名:"终点线"->自己胜利 制造描述:"你走投无路了。"     --《荒野乱斗》露米台词致敬
            SOMEONE_ELSE_WON = "恭喜优胜者：{winner}！值得尊重的对手。",-- 物品名:"终点线"->别人胜利 制造描述:"你走投无路了。"      --《荒野乱斗》露米台词致敬
        },

        YOTC_CARRAT_RACE_START_ITEM = "起点搭建套件。",-- 物品名:"起点套装" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "检查点搭建套件。",-- 物品名:"检查点套装" 制造描述:"通往光荣之路上的一站。"
		YOTC_CARRAT_RACE_FINISH_ITEM = "终点搭建套件。",-- 物品名:"终点线套装" 制造描述:"你走投无路了。"      --《荒野乱斗》露米台词致敬

		YOTC_SEEDPACKET = "种子包。让我们看看能种出什么植物。",-- 物品名:"种子包" 制造描述:"一包普通的混合种子。"
		YOTC_SEEDPACKET_RARE = "高级种子包！会不会有稀有的种子呢？",-- 物品名:"高级种子包" 制造描述:"一包高质量的种子。"

		MINIBOATLANTERN = "漂浮灯笼。水面作业的良好标记。",-- 物品名:"漂浮灯笼" 制造描述:"闪着暖暖的光亮。"

        YOTC_CARRATSHRINE =
        {
            GENERIC = "胡萝卜鼠的供奉台？这世界真奇妙。",-- 物品名:"胡萝卜鼠神龛"->默认 制造描述:"供奉灵巧之胡萝卜鼠。"
            EMPTY = "需要放置贡品。",-- 物品名:"胡萝卜鼠神龛" 制造描述:"供奉灵巧之胡萝卜鼠。"
            BURNT = "烧毁了。",-- 物品名:"胡萝卜鼠神龛"->烧焦的 制造描述:"供奉灵巧之胡萝卜鼠。"
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "训练方向感的设备。",-- 物品名:"方向健身房"->默认
            RAT = "保持导航！实验体正在接受训练。",-- 物品名:"方向健身房"->含有胡萝卜鼠
            BURNT = "烧坏了。",-- 物品名:"方向健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "训练速度的设备。",-- 物品名:"速度健身房"->默认
            RAT = "好快的移动速度！",-- 物品名:"速度健身房"->含有胡萝卜鼠
            BURNT = "烧坏了。",-- 物品名:"速度健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "训练反应的设备。",-- 物品名:"反应健身房"->默认
            RAT = "神经反射速度优秀！",-- 物品名:"反应健身房"->含有胡萝卜鼠
            BURNT = "烧坏了。",-- 物品名:"反应健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "训练耐力的设备。",-- 物品名:"耐力健身房"->默认
            RAT = "心肺功能良好！坚持住！",-- 物品名:"耐力健身房"
            BURNT = "烧坏了。",-- 物品名:"耐力健身房"->烧焦的
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "方向训练组件包。",-- 物品名:"方向健身房套装" 制造描述:"提高你的胡萝卜鼠的方向感。"
        YOTC_CARRAT_GYM_SPEED_ITEM = "速度训练组件包。",-- 物品名:"速度健身房套装" 制造描述:"增加你的胡萝卜鼠的速度。"
        YOTC_CARRAT_GYM_STAMINA_ITEM = "耐力训练组件包。",-- 物品名:"耐力健身房套装" 制造描述:"增强你的胡萝卜鼠的耐力。"
        YOTC_CARRAT_GYM_REACTION_ITEM = "反应训练组件包。",-- 物品名:"反应健身房套装" 制造描述:"加快你的胡萝卜鼠的反应时间。"

        YOTC_CARRAT_SCALE_ITEM = "生物称量器套件。",-- 物品名:"胡萝卜鼠秤套装" 制造描述:"看看你的胡萝卜鼠的情况。"
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "这是用来测量生物质量的。",-- 物品名:"胡萝卜鼠秤"->默认
            CARRAT = "记录数据中……嗯，很有精神。",-- 物品名:"胡萝卜鼠秤"->含有胡萝卜鼠且状态未满
            CARRAT_GOOD = "各项指标达到预期值！",-- 物品名:"胡萝卜鼠秤"->含有胡萝卜鼠且状态极佳
            BURNT = "损坏的测量仪器。",-- 物品名:"胡萝卜鼠秤"->烧焦的
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "皮弗娄牛的图腾柱。",-- 物品名:"皮弗娄牛神龛"->默认 制造描述:"供奉坚毅之皮弗娄牛。"
            EMPTY = "未激活的图腾。",-- 物品名:"皮弗娄牛神龛" 制造描述:"供奉坚毅之皮弗娄牛。"
            BURNT = "图腾被烧毁了。",-- 物品名:"皮弗娄牛神龛"->烧焦的 制造描述:"供奉坚毅之皮弗娄牛。"
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "生物清洁与修饰站。",-- 物品名:"皮弗娄牛美妆台"->默认 制造描述:"美牛原型机。"
            OCCUPIED = "哇，这只毛多快进去！毛发多漂亮啊！",-- 物品名:"皮弗娄牛美妆台"->被占领 制造描述:"美牛原型机。"
            BURNT = "设备故障。起火了。",-- 物品名:"皮弗娄牛美妆台"->烧焦的 制造描述:"美牛原型机。"
        },
        BEEFALO_GROOMER_ITEM = "修饰站搭建套件。",-- 物品名:"美妆台套装" 制造描述:"美牛原型机。"

        YOTR_RABBITSHRINE =
        {
            GENERIC = "兔人崇拜的象征物。",-- 物品名:"兔人神龛"->默认 制造描述:"供奉舒适之兔人。"
            EMPTY = "需要供品才能启动。",-- 物品名:"兔人神龛" 制造描述:"供奉舒适之兔人。"
            BURNT = "烧毁了。",-- 物品名:"兔人神龛"->烧焦的 制造描述:"供奉舒适之兔人。"
        },

        NIGHTCAPHAT = "睡帽。可以改善睡眠质量。",-- 物品名:"睡帽" 制造描述:"为你打瞌睡的脑袋准备的帽子。"

        YOTR_FOOD1 = "兔子卷。造型很别致。",-- 物品名:"兔子卷" 制造描述:"制造这个蛋糕的过程中没有兔子受到伤害。"
        YOTR_FOOD2 = "月饼！传统的节日点心！",-- 物品名:"月饼" 制造描述:"“蓝色”风味！"
        YOTR_FOOD3 = "月冻。晶莹剔透。",-- 物品名:"月冻" 制造描述:"这甜点美的让人不忍心咬一口。"
        YOTR_FOOD4 = "泡芙串！糖分和快乐的集合体！",-- 物品名:"泡芙串" 制造描述:"蓬松有嚼劲的球。"

        YOTR_TOKEN = "挑战手套。一种宣战的仪式用品。",-- 物品名:"挑战手套" 制造描述:"告诉兔人你想在枕头大战里试试手。"

        COZY_BUNNYMAN = "处于放松状态的兔人。",-- 物品名:"舒适的兔人"

        HANDPILLOW_BEEFALOWOOL = "用牛毛填充的软武器。",-- 物品名:"皮弗娄牛毛枕头" 制造描述:"打出一记带牛毛的重击。"
        HANDPILLOW_KELP = "湿漉漉的软武器。手感不太好。",-- 物品名:"海带枕头" 制造描述:"没有人喜欢盖着湿毯子睡。别以为湿枕头能好到哪去。"
        HANDPILLOW_PETALS = "带有花香的软武器。",-- 物品名:"花朵枕头" 制造描述:"枕头里装满了花的力量。"
        HANDPILLOW_STEELWOOL = "钢丝绵填充的……这真的符合安全规范吗？",-- 物品名:"钢丝绵枕头" 制造描述:"专为枕头大战的严肃参赛者准备。"

        BODYPILLOW_BEEFALOWOOL = "皮弗娄牛毛防具。缓冲性能很好。",-- 物品名:"皮弗娄牛枕头盔甲" 制造描述:"加强你的枕头防卫。"
        BODYPILLOW_KELP = "海带防具。有点粘。",-- 物品名:"海带枕头盔甲" 制造描述:"一套湿漉漉的枕头盔甲。"
        BODYPILLOW_PETALS = "鲜花防具。伪装效果……几乎没有。",-- 物品名:"花朵枕头盔甲" 制造描述:"它提供了最低限度的保护，脱下它后你身上会有玫瑰花的香味。"
        BODYPILLOW_STEELWOOL = "钢丝绵防具。防御力值得信赖。",-- 物品名:"钢丝绵枕头盔甲" 制造描述:"一个可穿戴的枕头，既有效又令人不快。"

		BISHOP_CHARGE_HIT = "遭遇能量冲击！",-- ->被主教攻击(不确定触发条件，可能是早期设计？)
		TRUNKVEST_SUMMER = "透气背心。适合温暖气候。",-- 物品名:"透气背心" 制造描述:"暖和，但算不上非常暖和。"
		TRUNKVEST_WINTER = "加厚冬装。保暖系数很高。",-- 物品名:"松软背心" 制造描述:"足以抵御冬季暴雪的保暖背心。"
		TRUNK_COOKED = "烹饪过的象鼻。可以补充大量体力。",-- 物品名:"象鼻排"
		TRUNK_SUMMER = "红色象鼻。珍贵的生物材料。",-- 物品名:"象鼻"
		TRUNK_WINTER = "冬象鼻。覆盖着厚厚的绒毛。",-- 物品名:"冬象鼻"
		TUMBLEWEED = "风滚草。根据风向追踪它的来源。",-- 物品名:"风滚草"
		TURKEYDINNER = "火鸡大餐！庆祝胜利的食物！",-- 物品名:"火鸡正餐"
		TWIGS = "小树枝。",-- 物品名:"树枝"
		UMBRELLA = "雨伞。保持干燥很重要。",-- 物品名:"雨伞" 制造描述:"遮阳挡雨！"
		GRASS_UMBRELLA = "植物编织的雨伞。轻便。",-- 物品名:"花伞" 制造描述:"漂亮轻便的保护伞。"
		UNIMPLEMENTED = "未知的图谱数据。",--检查未完成物品，相当于模组物品留白，表示物品未做完
		WAFFLES = "华夫饼！再加上一点冰淇淋就更好了。",-- 物品名:"华夫饼"
		WALL_HAY =--应该都看得出来TIEM是物品状态吧...应该吧。
		{
			GENERIC = "草墙。防御力很低。",-- 物品名:"草墙"->默认
			BURNT = "被烧毁的防御工事。",-- 物品名:"草墙"->烧焦的
		},
		WALL_HAY_ITEM = "草墙组件。只能起到心理安慰作用。",-- 物品名:"草墙" 制造描述:"草墙墙体。不太结实。"
		WALL_STONE = "石墙。可靠的防御工事。",-- 物品名:"石墙"
		WALL_STONE_ITEM = "石墙组件。用石头堆砌的防线。",-- 物品名:"石墙" 制造描述:"石墙墙体。"--《荒野乱斗》莫提斯台词致敬
		WALL_RUINS = "远古文明的遗迹。",-- 物品名:"铥墙"
		WALL_RUINS_ITEM = "虽然年代久远，但依然坚硬。",-- 物品名:"铥墙" 制造描述:"这些墙可以承受相当多的打击。"
		WALL_WOOD =
		{
			GENERIC = "木制防线。易燃物，要注意。",-- 物品名:"木墙"->默认
			BURNT = "防线被突破了。",-- 物品名:"木墙"->烧焦的
		},
		WALL_WOOD_ITEM = "尖木桩！哪怕是心理安慰也好。",-- 物品名:"木墙" 制造描述:"木墙墙体。"
		WALL_MOONROCK = "月岩墙！能反射光线。",-- 物品名:"月岩墙"
		WALL_MOONROCK_ITEM = "轻质高强度材料。",-- 物品名:"月岩墙" 制造描述:"月球疯子之墙。"
		WALL_DREADSTONE = "这种石头……能吸收光线。",-- 物品名:"绝望石墙"
		WALL_DREADSTONE_ITEM = "充满了压迫感的建筑材料。",-- 物品名:"绝望石墙" 制造描述:"将自己包围在最可怕的装饰之中。"
        WALL_SCRAP = "废料墙。资源再利用。",-- 物品名:"废料墙"
        WALL_SCRAP_ITEM = "虽然不好看，但很实用。",-- 物品名:"废料墙"->放置形态
		FENCE = "木栅栏。规划营地的好帮手。",-- 物品名:"木栅栏"
        FENCE_ITEM = "可以用来圈养小动物。",-- 物品名:"木栅栏" 制造描述:"木栅栏部分。"
        FENCE_GATE = "门。请随手关门。",-- 物品名:"木门"
        FENCE_GATE_ITEM = "这是出入口。",-- 物品名:"木门" 制造描述:"木栅栏的门。"
		WALRUS = "那是海象吗？它穿着苏格兰裙！",-- 物品名:"海象"
		WALRUSHAT = "贝雷帽。很有探险家的风格！",-- 物品名:"贝雷帽"
		WALRUS_CAMP =
		{
			EMPTY = "营地目前是空的。目标可能在巡逻。",-- 物品名:"海象营地"
			GENERIC = "海象人的定居点。",-- 物品名:"海象营地"->默认
		},
		WALRUS_TUSK = "巨大的獠牙。可以制作武器。",-- 物品名:"海象牙"
		WARDROBE =
		{
			GENERIC = "衣柜。是时候整理一下装备了。",-- 物品名:"衣柜"->默认 制造描述:"随心变换面容。"
            BURNING = "警告：衣柜着火！",-- 物品名:"衣柜"->正在燃烧 制造描述:"随心变换面容。"
			BURNT = "里面的东西都烧没了……",-- 物品名:"衣柜"->烧焦的 制造描述:"随心变换面容。"
		},
		WARG = "巨型犬科生物！极度危险！",-- 物品名:"座狼"
        WARGLET = "还未长成，但依然有威胁。",-- 物品名:"青年座狼"

		WASPHIVE = "杀人蜂的巢穴！不要靠近！",-- 物品名:"杀人蜂蜂窝"
		WATERBALLOON = "水球。便携式灭火装置。",-- 物品名:"水球" 制造描述:"球体灭火。"
		WATERMELON = "西瓜！水分充足。",-- 物品名:"西瓜"
		WATERMELON_COOKED = "这种烹饪方式……不太主流。",-- 物品名:"烤西瓜"
		WATERMELONHAT = "西瓜做的帽子？能有效降低头部温度。",-- 物品名:"西瓜帽" 制造描述:"提神醒脑，但感觉黏黏的。"
		WAXWELLJOURNAL =
		{
			GENERIC = "这本笔记里记载着危险的知识。",-- 物品名:"暗影秘典"->默认 制造描述:"这将让你大吃一惊。"
			NEEDSFUEL = "only_used_by_waxwell",-- 物品名:"暗影秘典"->没有燃料且人物可以使用秘典
		},
		WETGOOP = "实验失败的产物。粘稠的混合物。",-- 物品名:"潮湿黏糊"
        WHIP = "训练动物用的鞭子。",-- 物品名:"三尾猫鞭" 制造描述:"提出有建设性的反馈意见。"
		WINTERHAT = "保暖帽。在寒冷地区作业必备。",-- 物品名:"冬帽" 制造描述:"保持脑袋温暖。"
		WINTEROMETER =
		{
			GENERIC = "气温监测仪。现在是多少度？",-- 物品名:"温度测量仪"->默认 制造描述:"测量环境气温。"
			BURNT = "监测设备损坏。",-- 物品名:"温度测量仪"->烧焦的 制造描述:"测量环境气温。"
		},

        WINTER_TREE =
        {
            BURNT = "节日树被烧毁了。",-- 物品名:"冬季盛宴树"->烧焦的
            BURNING = "着火了！紧急情况！",-- 物品名:"冬季盛宴树"->正在燃烧
            CANDECORATE = "冬日盛宴树！多么美丽的装饰。",-- 物品名:"冬季盛宴树"->长成
            YOUNG = "它还在生长期。",-- 物品名:"冬季盛宴树"->还年轻
        },
		WINTER_TREESTAND =
		{
			GENERIC = "这是种树的盆。",-- 物品名:"盛宴树盆"->默认 制造描述:"种植并装饰一棵冬季盛宴树！"
            BURNT = "烧毁的盆。",-- 物品名:"盛宴树盆"->烧焦的 制造描述:"种植并装饰一棵冬季盛宴树！"
		},
        WINTER_ORNAMENT = "精美的饰品。",-- 物品名:"圣诞小玩意"
        WINTER_ORNAMENTLIGHT = "发光的装饰灯！通电了吗？",-- 物品名:"圣诞灯"
        WINTER_ORNAMENTBOSS = "这个装饰好像某个强大的生物。",-- 物品名:"华丽的装饰"
		WINTER_ORNAMENTFORGE = "纪念勇士的装饰。",-- 物品名:"熔炉装饰"
		WINTER_ORNAMENTGORGE = "关于食物的装饰？",-- 物品名:"暴食装饰"
        WINTER_ORNAMENTPEARL = "这不仅仅是装饰，这是回忆。",--感伤装饰（蟹奶奶给的那个）

        WINTER_FOOD1 = "姜饼人！太可爱了，舍不得吃。", -- 姜饼人饼干-- 物品名:"小姜饼"
        WINTER_FOOD2 = "糖霜饼干！糖分超标预警！", -- 糖霜饼干-- 物品名:"糖曲奇饼"
        WINTER_FOOD3 = "拐杖糖！很有节日气氛。", -- 拐杖糖-- 物品名:"拐杖糖"
        WINTER_FOOD4 = "水果蛋糕。保存期限似乎很长。", -- 水果蛋糕-- 物品名:"永远的水果蛋糕"
        WINTER_FOOD5 = "巧克力原木蛋糕！完美的补给品！", -- 圣诞木柴蛋糕-- 物品名:"巧克力原木蛋糕"
        WINTER_FOOD6 = "李子布丁！", -- 李子布丁-- 物品名:"李子布丁"
        WINTER_FOOD7 = "热苹果酒。能让身体暖和起来。", -- 热苹果酒-- 物品名:"苹果酒"
        WINTER_FOOD8 = "热可可！太棒了！我要喝一杯！", -- 热可可-- 物品名:"热可可"
        WINTER_FOOD9 = "蛋奶酒。味道很醇厚。", -- 蛋奶酒-- 物品名:"美味的蛋酒"

		WINTERSFEASTOVEN =
		{
			GENERIC = "节日烤炉！我闻到了香味。",-- 物品名:"砖砌烤炉"->默认
			COOKING = "正在加热中……耐心等待。",-- 物品名:"砖砌烤炉"->还有很长烹饪时间
			ALMOST_DONE_COOKING = "马上就好！",-- 物品名:"砖砌烤炉"->快烹饪好了
			DISH_READY = "烹饪完成！上菜！",-- 物品名:"砖砌烤炉"->烹饪完成
		},
		BERRYSAUCE = "浆果酱。酸甜可口。",-- 物品名:"快乐浆果酱"
		BIBINGKA = "米糕。口感软糯。",-- 物品名:"比宾卡米糕"    
		CABBAGEROLLS = "白菜卷？蔬菜和肉的完美结合。",-- 物品名:"白菜卷"
		FESTIVEFISH = "丰盛的鱼料理！",-- 物品名:"节庆鱼料理"
		GRAVY = "肉汁。可以浇在土豆泥上。",-- 物品名:"好肉汁"
		LATKES = "金黄色的土豆饼！",-- 物品名:"土豆饼"
		LUTEFISK = "这鱼肉……经过了特殊的化学处理？",-- 物品名:"苏打鱼"
		MULLEDDRINK = "加入了香料的酒。",-- 物品名:"香料潘趣酒"
		PANETTONE = "甜面包。很多果干。",-- 物品名:"托尼甜面包"
		PAVLOVA = "蛋白酥皮蛋糕！这就是幸福的形状！",-- 物品名:"巴甫洛娃蛋糕"
		PICKLEDHERRING = "腌鲱鱼。虽然味道重了点，但保存期很长。",-- 物品名:"腌鲱鱼"
		POLISHCOOKIE = "饼干！可以作为行动代粮。",-- 物品名:"波兰饼干"
		PUMPKINPIE = "南瓜派！热量和美味并存。",-- 物品名:"南瓜派"
		ROASTTURKEY = "烤火鸡！这顿饭真丰盛！",-- 物品名:"烤火鸡"
		STUFFING = "面包馅。吸满了肉汁的精华！",-- 物品名:"烤火鸡面包馅"
		SWEETPOTATO = "红薯焗饭！暖呼呼的。",-- 物品名:"红薯焗饭"
		TAMALES = "玉米粽子！包裹得很好。",-- 物品名:"塔马利"
		TOURTIERE = "肉馅饼！每一口都充满了能量！",-- 物品名:"饕餮馅饼"

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "盛宴餐桌！大家围在一起吃饭，这才是过节嘛。",-- 物品名:"冬季盛宴餐桌"->默认 制造描述:"一起来享用冬季盛宴吧。"
			HAS_FOOD = "食物补给已就位！准备开饭！",-- 物品名:"冬季盛宴餐桌"->放置冬季盛宴料理
			WRONG_TYPE = "这个分类好像不对。不能放在这儿。",-- 物品名:"冬季盛宴餐桌"->放置非冬季盛宴料理
			BURNT = "餐桌被毁了……太可惜了。",-- 物品名:"冬季盛宴餐桌"->烧焦的
		},

		GINGERBREADWARG = "姜饼做的座狼！哪怕是甜点也要小心被咬。",-- 物品名:"姜饼座狼"
		GINGERBREADHOUSE = "姜饼屋！简直是建筑学和烹饪学的完美结合！",-- 物品名:"姜饼猪屋"
		GINGERBREADPIG = "姜饼猪人！看起来很脆。",-- 物品名:"姜饼猪"
		CRUMBS = "只剩下碎屑了。谁偷吃了吗？",-- 物品名:"饼干屑"
		WINTERSFEASTFUEL = "这种粉末含有奇异的节日能量。",-- 物品名:"节日欢愉"

        KLAUS = "代号“克劳斯”的高威胁目标！注意规避！",-- 物品名:"克劳斯"
        KLAUS_SACK = "异常巨大的储存袋。里面装着什么？",-- 物品名:"赃物袋"
		KLAUSSACKKEY = "鹿角形状的密钥。",-- 物品名:"麋鹿茸"
		WORMHOLE =
		{
			GENERIC = "空间折跃点？还是单纯的生物消化道？",-- 物品名:"虫洞"->默认
			OPEN = "准备进行空间跳跃！3，2，1！",-- 物品名:"虫洞"->打开
		},
		WORMHOLE_LIMITED = "这个通道看起来很不稳定，处于崩溃边缘。",-- 物品名:"生病的虫洞"->一次性虫洞 --海钓可能钓出来
		ACCOMPLISHMENT_SHRINE = "这个装置……是为了某种成就感而存在的吗？",-- 物品名:"奖杯"  --废案物品，可以去搜搜这个废案
		LIVINGTREE = "完全正常的树？但它在进行……视觉追踪？",-- 物品名:"完全正常的树"
		ICESTAFF = "低温冻结魔杖！虽然不是源石技艺，但原理类似。",-- 物品名:"冰魔杖" 制造描述:"把敌人冰冻在原地。"
		REVIVER = "心脏除颤……不对，这是“告密的心”。",-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕。"
		SHADOWHEART = "被暗影污染的心脏组织。很不祥。",-- 物品名:"暗影心房"
        ATRIUM_RUBBLE =
        {
			LINE_1 = "壁画记录了某种古代仪式。",-- 物品名:"远古壁画"->第一行
			LINE_2 = "画上的人物……看起来很像我们。",-- 物品名:"远古壁画"->第二行
			LINE_3 = "发生了一场灾难？",-- 物品名:"远古壁画"->第三行
			LINE_4 = "这些描绘令人感到不安。",-- 物品名:"远古壁画"->第四行
			LINE_5 = "文明崩塌的记录。值得警惕。",-- 物品名:"远古壁画"->第五行
		},
        ATRIUM_STATUE = "古代文明的遗物。雕刻工艺很特别。",-- 物品名:"远古雕像"
        ATRIUM_LIGHT =
        {
			ON = "光源频率很奇怪，让人头晕。",-- 物品名:"远古灯柱"->开启
			OFF = "灭了。",-- 物品名:"远古灯柱"->关闭 
		},
        ATRIUM_GATE =
        {
			ON = "大门已开启！注意空间波动！",-- 物品名:"远古大门"->开启（插着钥匙）
			OFF = "处于关闭状态。",-- 物品名:"远古大门"->关闭(没插钥匙)
			CHARGING = "在充能！有什么要出来了！",-- 物品名:"远古大门"->充能中（激活只因者）
			DESTABILIZING = "要崩塌了！快撤！",-- 物品名:"远古大门"->不稳定（击败只因者，正在重置远古）
			COOLDOWN = "处于冷却周期。",-- 物品名:"远古大门"->冷却中（大门进入CD）
        },
        ATRIUM_KEY = "古代遗迹的核心密钥。",-- 物品名:"远古钥匙"
		LIFEINJECTOR = "急救强心针！副作用有点大，但是能救命。",-- 物品名:"强心针" 制造描述:"提高下你那日渐衰退的最大健康值吧。"
		SKELETON_PLAYER =
		{
			MALE = "%s的遗骸……%s，安息吧。",-- 物品名:"骷髅"->男性
			FEMALE = "%s的遗骸……%s，安息吧。",-- 物品名:"骷髅"->女性
			ROBOT = "%s的残骸……%s，机体停止运作了。",-- 物品名:"骷髅"->机器人
			DEFAULT = "%s的遗骸……%s，探索在这里终结了。",-- 物品名:"骷髅"->默认（除前三种人之外的骨架，类似于留空，任意定义的非固定骨架都会使用到这个）
		},
		HUMANMEAT = "这是……同类的肉？这绝对违反了伦理！",-- 物品名:"长猪"
		HUMANMEAT_COOKED = "我拒绝将其视为食物。",-- 物品名:"熟长猪"
		HUMANMEAT_DRIED = "这简直是噩梦……",-- 物品名:"长猪肉干"
		ROCK_MOON = "月球表面的岩石！",-- 物品名:"岩石"
		MOONROCKNUGGET = "高纯度的月岩。",-- 物品名:"月岩"
		MOONROCKCRATER = "这个凹槽似乎可以嵌入某种能量源。",-- 物品名:"带孔月岩" 制造描述:"用于划定地盘的岩石。"
		MOONROCKSEED = "光滑的球体。用途未知。",-- 物品名:"天体宝球"

        REDMOONEYE = "红色的月亮之眼。光谱分析异常。",-- 物品名:"红色月眼"
        PURPLEMOONEYE = "紫色的月亮之眼。看起来很神秘。",-- 物品名:"紫色月眼"
        GREENMOONEYE = "绿色的月亮之眼。",-- 物品名:"绿色月眼"
        ORANGEMOONEYE = "橘色的月亮之眼。",-- 物品名:"橘色月眼"
        YELLOWMOONEYE = "黄色的月亮之眼。",-- 物品名:"黄色月眼"
        BLUEMOONEYE = "蓝色的月亮之眼。",-- 物品名:"蓝色月眼"

        --熔炉
        LAVAARENA_BOARLORD = "那个猪人……战斗力数值爆表！",-- 物品名:"战斗大师普格纳"
        BOARRIOR = "重装型单位！注意它的冲撞！",-- 物品名:"大熔炉猪战士"->大熔炉猪战士
        BOARON = "小心那些战猪！",-- 物品名:"战猪"
        PEGHOOK = "这种生物带有酸性毒液！",-- 物品名:"蝎子"
        TRAILS = "那只猩猩的力量非常大！",-- 物品名:"野猪猩"
        TURTILLUS = "高防御单位。需要穿甲攻击。",-- 物品名:"坦克龟"
        SNAPPER = "它的咬合力看起来很强。",-- 物品名:"鳄鱼指挥官"
		RHINODRILL = "犀牛兄弟！看起来像双胞胎？",-- 物品名:"后扣帽犀牛兄弟"
		BEETLETAUR = "巨型独眼生物！这是最终Boss吗？",-- 物品名:"地狱独眼巨猪"

        LAVAARENA_PORTAL =--熔炉大门
        {
            ON = "传送门启动了！我们要撤离了吗？",-- 物品名:"远古大门"->开启
            GENERIC = "这是……竞技场的传送门？",-- 物品名:"远古大门"->默认
        },
        LAVAARENA_KEYHOLE = "检测到未激活的接口，需要匹配的钥匙。",-- 物品名:"远古锚"->未激活
		LAVAARENA_KEYHOLE_FULL = "连接成功，能量通路已打开！",-- 物品名:"远古锚"->激活
        LAVAARENA_BATTLESTANDARD = "战旗！能提升周围伙伴的士气。",-- 物品名:"战旗"
        LAVAARENA_SPAWNER = "高威胁目标传送门，注意警戒！",-- 物品名:"熔炉传送门"

        HEALINGSTAFF = "医疗支援单元准备就绪！我会保障大家的安全！",-- 物品名:"生命魔杖"
        FIREBALLSTAFF = "检测到高热能反应，使用时请小心。",-- 物品名:"地狱魔杖"
        HAMMER_MJOLNIR = "好大的质量！这能造成巨大的物理冲击。",-- 物品名:"锻锤"
        SPEAR_GUNGNIR = "具有极高穿透力的长矛，设计很独特。",-- 物品名:"尖齿矛"
        BLOWDART_LAVA = "吹箭。简单的气动武器。",-- 物品名:"吹箭"
        BLOWDART_LAVA2 = "接触后会产生高温的弹药。小心烫手！",-- 物品名:"熔化吹箭"
        LAVAARENA_LUCY = "这把斧头……它在说话？也许是某种语音交互系统？",-- 物品名:"暴怒的露西"
        WEBBER_SPIDER_MINION = "这种节肢生物居然能被驯化？有趣的生态记录。",-- 物品名:"蜘蛛宝宝"
        BOOK_FOSSIL = "记录了地质变化的石化技术。",-- 物品名:"石化之书"
		LAVAARENA_BERNIE = "它是某种安抚用的玩偶吗？看起来经历了很激烈的战斗。",-- 物品名:"伯尼"
		SPEAR_LANCE = "螺旋状的矛，很尖锐。",-- 物品名:"螺旋矛"
		BOOK_ELEMENTAL = "这上面的符文能召唤元素生物。",-- 物品名:"召唤之书"
		LAVAARENA_ELEMENTAL = "岩浆构成的生命体，内部温度极高。",-- 物品名:"岩浆傀儡"

   		LAVAARENA_ARMORLIGHT = "轻型防护服，虽然防御力有限，但胜在灵活。",-- 物品名:"芦苇外衣"
		LAVAARENA_ARMORLIGHTSPEED = "加装了飞羽辅助装置？移动速度提升了！",-- 物品名:"羽饰芦苇外衣"
		LAVAARENA_ARMORMEDIUM = "标准木质护甲，适合应对一般冲突。",-- 物品名:"木质护甲"
		LAVAARENA_ARMORMEDIUMDAMAGER = "外层加装了尖刺，会对接触者造成反伤。",-- 物品名:"锯齿木甲"
		LAVAARENA_ARMORMEDIUMRECHARGER = "装饰性的丝带似乎有特殊的能量传导作用。",-- 物品名:"丝带木甲"
		LAVAARENA_ARMORHEAVY = "重型石质护甲，牺牲了机动性换取防御力。",-- 物品名:"石头板条甲"
		LAVAARENA_ARMOREXTRAHEAVY = "极其坚固的防护！就像龙门近卫局的防爆盾一样可靠！",-- 物品名:"坚固的石质护甲"

		LAVAARENA_FEATHERCROWNHAT = "装饰了羽毛的头环。",-- 物品名:"羽毛头环"
        LAVAARENA_HEALINGFLOWERHAT = "花饰头带！开启医疗模式，我会照顾好伤员的！",-- 物品名:"花饰头带"
        LAVAARENA_LIGHTDAMAGERHAT = "带刺的头盔。小心不要误伤队友。",-- 物品名:"带刺头盔"
        LAVAARENA_STRONGDAMAGERHAT = "司夜女神风格的头盔，设计很有压迫感。",-- 物品名:"司夜女神头盔"
        LAVAARENA_TIARAFLOWERPETALSHAT = "用花朵编织的头环，很有节日气氛。",-- 物品名:"编织花环"
        LAVAARENA_EYECIRCLETHAT = "似乎能增强佩戴者的感知能力。",-- 物品名:"洞察皇冠"
        LAVAARENA_RECHARGERHAT = "水晶在喔喔喔地响，感觉很有活力！",-- 物品名:"水晶头饰"
        LAVAARENA_HEALINGGARLANDHAT = "花环完全盛开了！这也是生命力的体现。",-- 物品名:"绽放花环"
        LAVAARENA_CROWNDAMAGERHAT = "非常华丽的防护头盔。",-- 物品名:"华丽的司夜女神头盔"

		LAVAARENA_ARMOR_HP = "这应该能提供额外的生存保障。",--华丽系列盔甲的待定/占位台词（未明确对应具体物品）反正熔炉都不可能更新了这句大概率用不到了

		LAVAARENA_FIREBOMB = "不稳定的高爆晶石，操作时务必小心！",-- 物品名:"炉火晶石"
		LAVAARENA_HEAVYBLADE = "锻造工艺非常精湛的刀刃。",-- 物品名:"铁匠的刀刃"

        --暴食
        QUAGMIRE_ALTAR =
        {
        	GENERIC = "检测到具有极高代谢率的生物信号。它需要大量的食物补给。",-- 物品名:"饕餮祭坛"->默认
        	FULL = "它的代谢率趋于平稳，看来是吃饱了。",-- 物品名:"饕餮祭坛"->满了
    	},
		QUAGMIRE_ALTAR_STATUE1 = "是某种古老崇拜的偶像吗？",-- 物品名:"饥饿之兽"
		QUAGMIRE_PARK_FOUNTAIN = "喷泉！可惜现在不是玩水的时候。",-- 物品名:"喷泉"     --《原神》水龙王相关的外网梗以及《荒野乱斗》切斯特台词致敬

        QUAGMIRE_HOE = "锄头。挖挖东西耕耕地都很好用。",-- 物品名:"锄头"

        QUAGMIRE_TURNIP = "大芜菁！根茎非常饱满。",-- 物品名:"大萝卜（芜菁）"
        QUAGMIRE_TURNIP_COOKED = "烤芜菁。简单的加热处理。",-- 物品名:"烤大萝卜"
        QUAGMIRE_TURNIP_SEEDS = "芜菁的种子。",-- 物品名:"圆形种子"（可以与正常农作物使用相同台词，因为官方人物就这么干的）

        QUAGMIRE_GARLIC = "大蒜样品。",-- 物品名:"大蒜"
        QUAGMIRE_GARLIC_COOKED = "烤大蒜。高温激发了它的香气！",-- 物品名:"烤大蒜"
        QUAGMIRE_GARLIC_SEEDS = "大蒜种子。",-- 物品名:"种子荚"

        QUAGMIRE_ONION = "洋葱。处理的时候要防止刺激性气体熏眼睛。",-- 物品名:"洋葱"
        QUAGMIRE_ONION_COOKED = "烤洋葱。味道变甜了。",-- 物品名:"烤洋葱"
        QUAGMIRE_ONION_SEEDS = "洋葱种子。",-- 物品名:"尖形种子"

        QUAGMIRE_POTATO = "土豆！完美的淀粉来源。",-- 物品名:"土豆"
        QUAGMIRE_POTATO_COOKED = "烤土豆！在这个环境下是极好的能量补给。",-- 物品名:"烤土豆"
        QUAGMIRE_POTATO_SEEDS = "土豆块茎。",-- 物品名:"土豆种子/毛茸茸的种子（暴食版）"我也不知道文字怎么描述的，就这样“彪”吧

        QUAGMIRE_TOMATO = "番茄！红彤彤的真可爱。",-- 物品名:"番茄"
        QUAGMIRE_TOMATO_COOKED = "烤番茄。酸酸甜甜的。",-- 物品名:"烤番茄"
        QUAGMIRE_TOMATO_SEEDS = "番茄种子。",-- 物品名:"番茄种子/带刺的种子（暴食版）"

        QUAGMIRE_FLOUR = "研磨得很细的面粉。",-- 物品名:"面粉"
        QUAGMIRE_WHEAT = "小麦。谷物是文明的基础之一。",-- 物品名:"小麦"
        QUAGMIRE_WHEAT_SEEDS = "小麦种子。",-- 物品名:"蓝色种子"
        -- 注：生/熟胡萝卜使用常规胡萝卜的文本
        QUAGMIRE_CARROT_SEEDS = "胡萝卜种子。",-- 物品名:"椭圆形种子"

        QUAGMIRE_ROTTEN_CROP = "烂掉了……东西坏得好快啊。",-- 物品名:"腐烂的农作物（暴食作物通用）"

		QUAGMIRE_SALMON = "三文鱼！这种鱼的脂肪含量很丰富。",-- 物品名:"三文鱼"
		QUAGMIRE_SALMON_COOKED = "熟三文鱼。看起来很美味！",-- 物品名:"熟三文鱼"
		QUAGMIRE_CRABMEAT = "收集到的蟹肉。",-- 物品名:"蟹肉"
		QUAGMIRE_CRABMEAT_COOKED = "熟蟹肉。希望能补充蛋白质。",-- 物品名:"熟蟹肉"
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "糖木树。特殊的植被。",-- 物品名:"糖木树"->默认
			STUMP = "砍伐后的树桩。",-- 物品名:"糖木树"->暴食模式糖木树只剩树桩了
			TAPPED_EMPTY = "导管已经连接好，等待分泌。",-- 物品名:"糖木树"->暴食模式糖木树接树液未完成
			TAPPED_READY = "采集满了！可以回收了。",-- 物品名:"糖木树"->暴食模式糖木树接好了
			TAPPED_BUGS = "有昆虫附着！需要清理！",-- 物品名:"糖木树"->暴食模式糖木树上太久没收了       --对某CS:GO系列视频标题致敬     XX（武器）毁了CS2
			WOUNDED = "树体出现了病变。",-- 物品名:"糖木树"->暴食糖木树生病了
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "香料灌木。能散发出独特的香味。",-- 物品名:"带斑点的小灌木"->默认
			PICKED = "采集完毕，等待再生。",-- 物品名:"带斑点的小灌木"->被采完了      --《西游记》玉帝老儿经典台词致敬
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "香料小枝。可以作为调味品。",-- 物品名:"带斑点的小枝"
		QUAGMIRE_SPOTSPICE_GROUND = "研磨好的香料。闻起来很不错。",-- 物品名:"斑点香料"
		QUAGMIRE_SAPBUCKET = "树液采集组件。",-- 物品名:"树液采集工具包"
		QUAGMIRE_SAP = "树液。糖分含量似乎很高。",-- 物品名:"汁液"
		QUAGMIRE_SALT_RACK =
		{
			READY = "结晶完成了！",-- 物品名:"盐架"->可采集
			GENERIC = "正在利用蒸发原理提取盐分。",-- 物品名:"盐架"->正在凝结盐       --只有古代英国人会用到蒸发法
		},

		QUAGMIRE_POND_SALT = "盐度极高的水域。",-- 物品名:"盐池"
		QUAGMIRE_SALT_RACK_ITEM = "盐架组件。",-- 物品名:"盐架"     --绳上结晶法是含盐低的盐井才会用到

		QUAGMIRE_SAFE =
		{
			GENERIC = "低温储存柜。虽然结构简单，但能延缓腐败。",-- 物品名:"保险箱"->默认     --对现实中某些人“别把冰箱当保险箱的说法”致敬，以及暴食的保险箱就是个冰箱的类似物，除了不能保鲜以外
			LOCKED = "没有权限打开。",-- 物品名:"保险箱"->锁住了
		},

		QUAGMIRE_KEY = "通用的机械钥匙。",-- 物品名:"钥匙"
		QUAGMIRE_KEY_PARK = "锈迹斑斑的钥匙。",-- 物品名:"铁钥匙"
        QUAGMIRE_PORTAL_KEY = "古老的钥匙，材质无法解析。",-- 物品名:"远古钥匙"


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "蘑菇的菌丝体还在。",-- 物品名:"蘑菇"->默认
			PICKED = "已经被采集过了。",-- 物品名:"蘑菇"->被采完了
		},
		QUAGMIRE_MUSHROOMS = "蘑菇！",-- 物品名:"蘑菇"
        QUAGMIRE_MEALINGSTONE = "简易的研磨工具。",-- 物品名:"研磨石"
		QUAGMIRE_PEBBLECRAB = "这种蟹的外壳像石头一样坚硬。",-- 物品名:"石蟹"


		QUAGMIRE_RUBBLE_CARRIAGE = "交通工具的残骸。",-- 物品名:"破烂的马车"
        QUAGMIRE_RUBBLE_CLOCK = "时间停止了。",-- 物品名:"砸烂的时钟"
        QUAGMIRE_RUBBLE_CATHEDRAL = "这里曾经是某种信仰中心吗？",-- 物品名:"残破的大教堂"
        QUAGMIRE_RUBBLE_PUBDOOR = "门坏得很严重。",-- 物品名:"残破的门"
        QUAGMIRE_RUBBLE_ROOF = "坍塌的屋顶。",-- 物品名:"残破的屋顶"
        QUAGMIRE_RUBBLE_CLOCKTOWER = "虽然破损了，但还能看出往日的宏伟。",-- 物品名:"残破的钟楼"
        QUAGMIRE_RUBBLE_BIKE = "自行车已经完全报废了。",-- 物品名:"损毁的自行车"
        QUAGMIRE_RUBBLE_HOUSE =-- 物品名:"残破的房子"
        {
            "该建筑已无法居住。",--三句随机展示，应该吧？        --《荒野乱斗》格里夫台词致敬
            "没有任何生命迹象。",
            "这里发生过什么？",
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "不再冒烟的烟囱。",-- 物品名:"残破的烟囱"
        QUAGMIRE_RUBBLE_CHIMNEY2 = "排气系统损坏。",-- 物品名:"残破的烟囱"        --《三国杀》神周瑜台词致敬
        QUAGMIRE_MERMHOUSE = "这里居住着智慧生物吗？",-- 物品名:"鱼人屋"
        QUAGMIRE_SWAMPIG_HOUSE = "简陋的居住设施。",-- 物品名:"破烂的猪屋"
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "建筑废墟。",-- 物品名:"房子燧石"
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "看起来是这个群落的长者。",-- 物品名:"沼泽猪长老"->默认
            SLEEPING = "它在睡觉呢。",-- 物品名:"沼泽猪长老"->睡着
        },
        QUAGMIRE_SWAMPIG = "这里的生物和外面的猪人有亲缘关系吗？",-- 物品名:"沼泽猪"

        QUAGMIRE_PORTAL = "空间传送门。也许能通往未知的区域？",-- 物品名:"远古大门（暴食）"
        QUAGMIRE_SALTROCK = "高纯度盐晶。",-- 物品名:"盐晶"     --《荒野乱斗》切斯特台词空耳致敬
        QUAGMIRE_SALT = "盐！调味必备。",-- 物品名:"盐"
        --食物--
        QUAGMIRE_FOOD_BURNT = "碳化严重，失去了营养价值。",-- 物品名:"烧焦的食物"
        QUAGMIRE_FOOD =--暴食料理检查台词（部分观测角色触发，比如威尔逊薇克巴顿这种检查食物会有合格判断的角色）
        {
        	GENERIC = "需要根据祭坛的要求放上东西。",--通用提示（引导放置祭坛上）
            MISMATCH = "这个不太对。",--不符合要求
            MATCH = "完美符合需求！",--完全符合要求
            MATCH_BUT_SNACK = "基本符合要求。",--半符合要求
        },

        QUAGMIRE_FERN = "蕨类植物。",-- 物品名:"蕨类植物"
        QUAGMIRE_FOLIAGE_COOKED = "经过热处理的植物叶片。",-- 物品名:"熟叶子"
        QUAGMIRE_COIN1 = "已被废弃的流通货币。",-- 物品名:"旧硬币"
        QUAGMIRE_COIN2 = "某种身份证明？做工很精致。",-- 物品名:"蓝宝石徽章"
        QUAGMIRE_COIN3 = "印有红色标记的硬币。",-- 物品名:"红色马克硬币"      --希特勒五十万马克一个面包的梗致敬
        QUAGMIRE_COIN4 = "这是对此处工作的报酬。",-- 物品名:"饕餮的惠赠"
        QUAGMIRE_GOATMILK = "高营养的乳制品！",-- 物品名:"羊奶"
        QUAGMIRE_SYRUP = "浓缩糖浆。",-- 物品名:"糖浆"
        QUAGMIRE_SAP_SPOILED = "变质了，无法使用。",-- 物品名:"毁掉的汁液"
        QUAGMIRE_SEEDPACKET = "一袋混合的种子，不知道能种出什么。",-- 物品名:"XX种子包"全暴食种子包通用

        QUAGMIRE_POT = "大型烹饪容器。",-- 物品名:"大锅"
        QUAGMIRE_POT_SMALL = "小型烹饪容器。",-- 物品名:"锅"
        QUAGMIRE_POT_SYRUP = "熬制糖浆专用锅。",-- 物品名:"糖浆锅"
        QUAGMIRE_POT_HANGER = "炊具悬挂装置。",-- 物品名:"挂锅装置"
        QUAGMIRE_POT_HANGER_ITEM = "炊具悬挂组件。",-- 物品名:"挂锅装置"物品形态
        QUAGMIRE_GRILL = "大型烧烤架。适合处理大块肉类。",-- 物品名:"大烤架"
        QUAGMIRE_GRILL_ITEM = "烧烤架组件。",-- 物品名:"大烤架"物品形态
        QUAGMIRE_GRILL_SMALL = "小型烧烤架。",-- 物品名:"小烤架"
        QUAGMIRE_GRILL_SMALL_ITEM = "小型烧烤架组件。",-- 物品名:"小烤架"物品形态
        QUAGMIRE_OVEN = "烘焙箱。控温很重要。",-- 物品名:"烤箱"
        QUAGMIRE_OVEN_ITEM = "烘焙箱组件。",-- 物品名:"烤箱"物品形态
        QUAGMIRE_CASSEROLEDISH = "砂锅。适合慢炖。",-- 物品名:"法国砂锅"
        QUAGMIRE_CASSEROLEDISH_SMALL = "小型砂锅。",-- 物品名:"小法国砂锅"
        QUAGMIRE_PLATE_SILVER = "银质餐盘。很有仪式感。",-- 物品名:"银盘"
        QUAGMIRE_BOWL_SILVER = "银质餐碗。",-- 物品名:"银碗"
        QUAGMIRE_CRATE = "物资箱。",--暴食厨具套装通用检查台词（科雷甚至没有给每个人写专属台词，只给鱼妹写专属台词）              --只有鱼人沃特有对应专属台词，其他人的台词都没写，怀疑是废案或者是什么特殊物品

        QUAGMIRE_MERM_CART1 = "贸易节点？希望能交换到有用的补给。", -- 萨米的马车
        QUAGMIRE_MERM_CART2 = "大型物资补给站。库存量看起来很充足。", -- 皮普顿的推车
        QUAGMIRE_PARK_ANGEL = "这座雕像……记录了某种宗教崇拜。",-- 物品名:"饕餮敬拜者"
        QUAGMIRE_PARK_ANGEL2 = "面部特征很模糊，无法通过数据库比对。",-- 物品名:"饕餮敬拜者"
        QUAGMIRE_PARK_URN = "这是盛放骨灰的容器吗？希望能在此安息。",-- 物品名:"骨灰瓮"
        QUAGMIRE_PARK_OBELISK = "上面的铭文磨损太严重了，无法解读。",-- 物品名:"石柱"
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "通路已开放。",-- 物品名:"铁门"->打开
            LOCKED = "该区域已封锁。需要授权钥匙。",-- 物品名:"铁门"->锁住
        },
        QUAGMIRE_PARKSPIKE = "防御设施。尖刺部分虽然生锈了但依然危险。",-- 物品名:"铁栅栏"
        QUAGMIRE_CRABTRAP = "针对甲壳类生物的捕获陷阱。",-- 物品名:"螃蟹陷阱"
        QUAGMIRE_TRADER_MERM = "萨米先生，这是今天的交易清单。",-- 物品名:"萨米"      --《荒野乱斗》露米台词致敬，英文里的耐力条读音很像“萨米”
        QUAGMIRE_TRADER_MERM2 = "皮普顿先生，我对这里的货币体系很感兴趣。",-- 物品名:"皮普顿"

        QUAGMIRE_GOATMUM = "玛姆茜女士，感谢您的协助。",-- 物品名:"玛姆茜"
        QUAGMIRE_GOATKID = "幼年体山羊。很有活力。",-- 物品名:"比利"        --蕾忍梗致敬
        QUAGMIRE_PIGEON =-- 物品名:"鸽子"
        {
            DEAD = "它死了……",--似了
            GENERIC = "这只小鸟真有意思，在做什么呢？",--正常状态
            SLEEPING = "它在睡觉，轻一点说话。",--在睡觉
        },
        QUAGMIRE_LAMP_POST = "街道照明设施。能提供安全感。",-- 物品名:"街灯"

        QUAGMIRE_BEEFALO = "被驯化的皮弗娄牛。耐力看起来不错。",-- 物品名:"老皮弗娄牛"
        QUAGMIRE_SLAUGHTERTOOL = "用于肉类加工的工具……",-- 物品名:"屠宰工具"

        QUAGMIRE_SAPLING = "还是小苗呢，以后会长成大树吧。",-- 物品名:"树苗"
        QUAGMIRE_BERRYBUSH = "浆果采集完毕。需要等待再生周期。",-- 物品名:"浆果从"

        QUAGMIRE_ALTAR_STATUE2 = "这个雕像散发着一种不安的气息。",-- 物品名:"饥饿之兽"
        QUAGMIRE_ALTAR_QUEEN = "根据特征推测，这可能是他们的统治者。",-- 物品名:"女王野兽"
        QUAGMIRE_ALTAR_BOLLARD = "系船的柱子，看起来很结实。",-- 物品名:"柱子"
        QUAGMIRE_ALTAR_IVY = "这种植物的攀附能力极强。",-- 物品名:"常春藤"        --对现实中某些人的特殊癖好的致敬和农场主梗也有一些我想被普露露（超次元游戏海王星角色）抽的想法

        QUAGMIRE_LAMP_SHORT = "小型照明设施。",-- 物品名:"小街灯"

        --薇诺娜技能树（便携部分）
        WINONA_CATAPULT =
        {
        	GENERIC = "薇诺娜设计的自动投石机！弹道计算非常精准。",-- 物品名:"薇诺娜的投石机"->默认 制造描述:"向敌人投掷大石块"
        	OFF = "能源切断，处于待机状态。",-- 物品名:"薇诺娜的投石机"->没发电机状态
        	BURNING = "警告！设备过热起火！",-- 物品名:"薇诺娜的投石机"->正在燃烧
        	BURNT = "核心部件已损毁……太可惜了。",-- 物品名:"薇诺娜的投石机"->烧焦的
			SLEEP = "进入休眠模式。",-- 物品名:"薇诺娜的投石机"->休眠状态
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "高强度聚光灯！夜间作业的好帮手。",-- 物品名:"薇诺娜的聚光灯"->默认 制造描述:"白天夜里都发光"
        	OFF = "供电中断。",-- 物品名:"薇诺娜的聚光灯"->关闭
        	BURNING = "照明设备起火了！",-- 物品名:"薇诺娜的聚光灯"->正在燃烧
        	BURNT = "透镜爆裂，设备报废。",-- 物品名:"薇诺娜的聚光灯"->烧焦的
			SLEEP = "暂时不需要照明。",-- 物品名:"薇诺娜的聚光灯"->休眠状态
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "初级发电机。能将化学能转化为电能。",-- 物品名:"薇诺娜的发电机"->默认 制造描述:"要确保电力供应充足"
        	LOWPOWER = "电压下降，能量不足。",-- 物品名:"薇诺娜的发电机"->快没电了
        	OFF = "停止运转。",-- 物品名:"薇诺娜的发电机"->关闭
        	BURNING = "电池组起火！小心化学泄露！",-- 物品名:"薇诺娜的发电机"->正在燃烧
        	BURNT = "彻底损坏了。",-- 物品名:"薇诺娜的发电机"->烧焦的
        },
        WINONA_BATTERY_HIGH =
        {
			GENERIC = "高能晶体发电机！这是非常先进的能源技术。",-- 物品名:"薇诺娜的宝石发电机"->默认 制造描述:"这玩意烧宝石，所以肯定不会差。"
			LOWPOWER = "晶体能量即将耗尽。",-- 物品名:"薇诺娜的宝石发电机"->快没电了
			OFF = "需要补充晶体燃料。",-- 物品名:"薇诺娜的宝石发电机"->关闭
			BURNING = "冷却系统失效！着火了！",-- 物品名:"薇诺娜的宝石发电机"->正在燃烧
			BURNT = "核心熔毁……",-- 物品名:"薇诺娜的宝石发电机"->烧焦的
			OVERLOADED = "能量输出超过阈值！有爆炸风险！",-- 物品名:"薇诺娜的宝石发电机"->过载状态
        },
		--薇诺娜（创始人宝物猎人部分）
		WINONA_REMOTE =
		{
			GENERIC = "远程控制终端。操作手感很棒。",-- 物品名:"称手遥控器"->手持状态
			OFF = "未检测到响应信号。",-- 物品名:"称手遥控器"->扔地上了？不确定是不是没电
			CHARGING = "正在进行充电作业……",-- 物品名:"称手遥控器"->充电状态
			CHARGED = "充电完毕，随时可以介入控制。",-- 物品名:"称手遥控器"->充电完成
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "薇诺娜把传送模块集成到了伞里？天才的设计！",-- 物品名:"传送伞"->默认（手持？）状态
            MISSINGSKILL = "only_used_by_winona",-- 物品名:"传送伞"->无对应技能点
			OFF = "能源耗尽。",-- 物品名:"传送伞"->没电且未在充电状态，大概吧
			CHARGING = "在充电中……",-- 物品名:"传送伞"->充电状态
			CHARGED = "传送系统就绪！",-- 物品名:"传送伞"->充电完成
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "折跃传送板。能实现物质的空间转移。",-- 物品名:"传送运输站"->默认状态
            MISSINGSKILL = "only_used_by_winona",-- 物品名:"传送运输站"->无对应技能点
			OFF = "等待接入电源。",-- 物品名:"传送运输站"->未接通电源状态
			BURNING = "着火了！",-- 物品名:"传送运输站"->燃烧状态
			BURNT = "电路板烧毁了。",-- 物品名:"传送运输站"->烧毁状态
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "你好，作业平台辅助机器人！",-- 物品名:"薇机人"->默认状态
			OFF = "动力缺失，停止活动。",-- 物品名:"薇机人"->没电且未在充电状态
			SLEEP = "进入待机维护模式。",-- 物品名:"薇机人"->休眠状态			CHARGING = "正在补充能量……",-- 物品名:"薇机人"->充电状态
			CHARGED = "充能完毕！",-- 物品名:"薇机人"->充电完成
		},
		INSPECTACLESBOX = "only_used_by_winona",-- 物品名:"藏物箱"
		INSPECTACLESBOX2 = "only_used_by_winona",-- 物品名:"高级藏物箱"
		INSPECTACLESHAT = 
        {
            GENERIC = "能看透东西的眼镜？很有趣的技术。",-- 物品名:"检查专用镜"
            MISSINGSKILL = "only_used_by_winona",-- 物品名:"检查专用镜"->有女工能力但没有技能点
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "似乎有滤光功能。",-- 物品名:"玫瑰色眼镜"
            MISSINGSKILL = "only_used_by_winona",-- 物品名:"玫瑰色眼镜"->缺失对应技能点
        },
		CHARLIERESIDUE = "only_used_by_winona",-- 物品名:"黑暗痕迹"
		CHARLIEROSE = "only_used_by_winona",-- 物品名:"脆弱玫瑰"
        WINONA_MACHINEPARTS_1 = "only_used_by_winona",-- 物品名:"小玩意"
        WINONA_MACHINEPARTS_2 = "only_used_by_winona",-- 物品名:"小机械"
		WINONA_RECIPESCANNER = "only_used_by_winona",-- 物品名:"校准观察机"
		WINONA_HOLOTELEPAD = "only_used_by_winona",-- 物品名:"不稳定传输"（传送阵）
		WINONA_HOLOTELEBRELLA = "only_used_by_winona",-- 物品名:"不稳定传输"（传送伞）

        --沃姆伍德相关
        COMPOSTWRAP = "利用腐殖质加速植物生长，很科学的方法。",-- 物品名:"肥料包" 制造描述:"“草本”的疗法。"
        ARMOR_BRAMBLE = "生物体外骨骼？具有一定的反伤效果。",-- 物品名:"荆棘外壳" 制造描述:"让大自然告诉你什么叫“滚开”。"
        TRAP_BRAMBLE = "利用植物的棘刺制作的陷阱。",-- 物品名:"荆棘陷阱" 制造描述:"中招机会平等的扰人陷阱。"

        BOATFRAGMENT03 = "船的碎片。",-- 物品名:"船碎片"
        BOATFRAGMENT04 = "经过修复后或许还能使用。",-- 物品名:"船碎片"
        BOATFRAGMENT05 = "收集起来，也许能拼回去。",-- 物品名:"船碎片"
		BOAT_LEAK = "船体破损！必须立刻进行修补作业！",-- 物品名:"漏洞"
        MAST = "风力推进系统已部署！",-- 物品名:"桅杆" 制造描述:"乘风破浪会有时。"
        SEASTACK = "海面上的地质突起，航行时需要避让。",-- 物品名:"海蚀柱"
        FISHINGNET = "虽然是简单的网，但捕获效率取决于使用者的技巧。", --未实装-- 物品名:"渔网" 制造描述:"就是一张网。"
        ANTCHOVIES = "小鱼仔。", --未实装-- 物品名:"蚁头凤尾鱼"
        STEERINGWHEEL = "方向舵！让我来掌舵吧！",-- 物品名:"方向舵" 制造描述:"航海必备道具。"
        ANCHOR = "制动装置。用于固定船位。",-- 物品名:"锚" 制造描述:"船用刹车"
        BOATPATCH = "临时修补材料。",-- 物品名:"船补丁" 制造描述:"打补丁永远不晚。"
        DRIFTWOOD_TREE =
        {
            BURNING = "着火了！",-- 物品名:"浮木"->正在燃烧
            BURNT = "碳化了。",-- 物品名:"浮木"->烧焦的
            CHOPPED = "采集完毕。",-- 物品名:"浮木"->被砍了
            GENERIC = "这种树木长期生长在这样的环境里吗？",-- 物品名:"浮木"->默认
        },

        DRIFTWOOD_LOG = "由于环境影响，木质变得很疏松。",-- 物品名:"浮木桩"

        MOON_TREE =
        {
            BURNING = "火光升腾，不要靠近！",-- 物品名:"月树"->正在燃烧
            BURNT = "被彻底破坏了。",-- 物品名:"月树"->烧焦的
            CHOPPED = "焦壳反射着月光。",-- 物品名:"月树"->被砍了
            GENERIC = "这种植物的变异特征很明显，我没见过类似的品种。",-- 物品名:"月树"->默认
        },
		MOON_TREE_BLOSSOM = "这种花似乎能反射月光。",-- 物品名:"月树花"

        MOONBUTTERFLY =
        {
        	GENERIC = "发光的鱗翅目昆虫！非常美丽的样本！",-- 物品名:"月蛾"->默认
        	HELD = "捕获成功~",-- 物品名:"月蛾"->拿在手里
        },
		MOONBUTTERFLYWINGS = "昆虫的翅膀。可以提取成分。",-- 物品名:"月蛾翅膀"
        MOONBUTTERFLY_SAPLING = "这种植物和昆虫之间似乎存在拟态关系。",-- 物品名:"月树苗"
        ROCK_AVOCADO_FRUIT = "外壳非常坚硬的果实。",-- 物品名:"石果"
        ROCK_AVOCADO_FRUIT_RIPE = "内部已经成熟，但外壳依然坚硬。",-- 物品名:"成熟石果"
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "经过热处理，外壳破裂了。",-- 物品名:"熟石果"
        ROCK_AVOCADO_FRUIT_SPROUT = "开始发芽了。",-- 物品名:"发芽的石果"
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "土壤肥力不足。",-- 物品名:"石果灌木丛"->需要肥料
			WITHERED = "它在高温下枯萎了。",-- 物品名:"石果灌木丛"->枯萎了
			GENERIC = "看起来像是为了防御而进化出了坚硬的外壳。",-- 物品名:"石果灌木丛"->默认
			PICKED = "果实已被采集。",-- 物品名:"石果灌木丛"->被采完了
			DISEASED = "检测到病变反应。", --未实装-- 物品名:"石果灌木丛"->生病了
            DISEASING = "它看起来不太健康。", --未实装-- 物品名:"石果灌木丛"->正在生病？？
			BURNING = "正在燃烧！",-- 物品名:"石果灌木丛"->正在燃烧
		},
        DEAD_SEA_BONES = "大型海洋生物的骨骼。值得研究。",-- 物品名:"海骨"
        HOTSPRING =
        {
        	GENERIC = "检测到地热活动！是温泉。",-- 物品名:"温泉"->默认
        	BOMBED = "水温急剧升高。",-- 物品名:"温泉"->沸腾
        	GLASS = "由于温差变化，形成了结晶体！",-- 物品名:"温泉"->月圆结晶
			EMPTY = "地热活动停止了。",-- 物品名:"温泉"->挖完了
        },
        MOONGLASS = "某种未知的晶体碎片。",-- 物品名:"月亮碎片"
        MOONGLASS_CHARGED = "晶体里面似乎有东西在流动。",-- 物品名:"注能月亮碎片"
        MOONGLASS_ROCK = "这种岩石的矿物成分很特殊。",-- 物品名:"月光玻璃"
        BATHBOMB = "化学反应球。扔进去会有什么效果呢？",-- 物品名:"沐浴球" 制造描述:"春天里来百花香？这点子把地都炸碎了"
        TRAP_STARFISH =
        {
            GENERIC = "海星！很可爱的样子。",-- 物品名:"海星"->默认
            CLOSED = "受惊收缩了。",-- 物品名:"海星"
        },
        DUG_TRAP_STARFISH = "被重新安置的海星，现在是个陷阱。",-- 物品名:"海星陷阱"
        SPIDER_MOON =
        {
        	GENERIC = "这里的蜘蛛因为环境发生了变异。",-- 物品名:"破碎蜘蛛"->默认状况检查
        	SLEEPING = "呼……呼……",-- 物品名:"破碎蜘蛛"->睡着了        	DEAD = "它已经死了。",-- 物品名:"破碎蜘蛛"->死了
        },
        MOONSPIDERDEN = "哇，这里的蜘蛛巢也是晶体做的，好神奇！",-- 物品名:"破碎蜘蛛洞"
		FRUITDRAGON =
		{
			GENERIC = "这是……伪装成果实的动物？太有趣了！",-- 物品名:"沙拉蝾螈"->默认
			RIPE = "它变红了！是成熟了吗？如果是果实就可以吃了……",-- 物品名:"沙拉蝾螈"->成熟（火龙果形态）
			SLEEPING = "嘘——别吵醒这个小家伙。",-- 物品名:"沙拉蝾螈"->睡着了
		},
        PUFFIN =
        {
            GENERIC = "是海鹦鹉！这种特别的喙是为了什么进化的呢？",-- 物品名:"海鹦鹉"->默认
            HELD = "抓到你了！让我仔细看看……",-- 物品名:"海鹦鹉"->拿在手里
            SLEEPING = "睡得真香啊。",-- 物品名:"海鹦鹉"->睡着了
        },

		MOONGLASSAXE = "好漂亮的斧头！用这种特殊的晶体做成的，一定很锋利。",-- 物品名:"月光玻璃斧" 制造描述:"脆弱而有效。"
		GLASSCUTTER = "像冰块一样透明的刀！使用的时候要小心手哦。",-- 物品名:"玻璃刀" 制造描述:"尖端武器。"

        ICEBERG =
        {
            GENERIC = "好大的冰山！要是能做成超大份刨冰就好了！", --未实装-- 物品名:"迷你冰山"->默认
            MELTED = "啊，化掉了……", --未实装-- 物品名:"迷你冰山"->融化了
        },
        ICEBERG_MELTED = "只剩下一滩水了，真可惜。", --未实装-- 物品名:"融化的迷你冰山"

        MINIFLARE = "发射这个，大家就能看到我在这里啦！",-- 物品名:"信号弹" 制造描述:"为你信任的朋友照亮前路。"
        MEGAFLARE = "这可是强光信号！会把周围所有的东西都吸引过来的，包括坏人。",-- 物品名:"敌对信号弹" 制造描述:"为你的敌人点亮一束光。"

		MOON_FISSURE =
		{
			GENERIC = "这道裂缝里好像有什么东西在发光。",-- 物品名:"天体裂隙"->默认
			NOLIGHT = "光芒消失了，现在看起来只是个普通的裂缝。",-- 物品名:"天体裂隙"->月黑状态
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "还没完成呢！就像拼图一样，我们把它拼好吧！",-- 物品名:"组装一半的祭坛"
            GENERIC = "这个祭坛……是用来祭祀月亮的吗？",-- 物品名:"天体祭坛"->默认
        },

        MOON_ALTAR_IDOL = "这个造型……很有古代文明的风格。",-- 物品名:"天体祭坛雕像"
        MOON_ALTAR_GLASS = "应该是放在哪里的底座吧？",-- 物品名:"天体祭坛底座"
        MOON_ALTAR_SEED = "这个球体里面好像有能量在流动！",-- 物品名:"天体祭坛宝球"

        MOON_ALTAR_ROCK_IDOL = "这块石头里藏着什么东西！",-- 物品名:"吸引人的结构"
        MOON_ALTAR_ROCK_GLASS = "石头里包裹着人工制品？",-- 物品名:"吸引人的结构"
        MOON_ALTAR_ROCK_SEED = "这里面肯定有好东西！",-- 物品名:"吸引人的结构"

        MOON_ALTAR_CROWN = "嘿咻！钓上来啦！这是祭坛的一部分吧？",-- 物品名:"未激活天体贡品"
        MOON_ALTAR_COSMIC = "它正在发出某种信号，是在等待回应吗？",-- 物品名:"天体贡品"

        MOON_ALTAR_ASTRAL = "哇，好壮观的建筑！这是古代文明的遗迹吗？",-- 物品名:"天体圣殿"
        MOON_ALTAR_ICON = "这个符号……好像在哪里见过类似的记录。",-- 物品名:"天体圣殿象征"
        MOON_ALTAR_WARD = "它好像想回到属于它的地方去。",-- 物品名:"天体圣殿卫戍"

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "这是我的航海研究站！准备好去探索大海了吗？",-- 物品名:"智囊团"->默认 制造描述:"海上科学。"
            BURNT = "啊！我的心血！全烧毁了……",-- 物品名:"智囊团"->烧焦的 制造描述:"海上科学。"
        },
        BOAT_ITEM = "便携式船只套件！只要这——样展开就可以了！",-- 物品名:"船套装" 制造描述:"让大海成为你的领地。"
        BOAT_GRASS_ITEM = "嗯……虽然是草编的，但应该能浮起来吧？",-- 物品名:"草筏套装" 制造描述:"享受周末出游的乐趣吧。"
        STEERINGWHEEL_ITEM = "方向盘！我来掌舵，出发！",-- 物品名:"方向舵套装" 制造描述:"航海必备道具。"
        ANCHOR_ITEM = "是大船锚！停车……啊不对，停船就靠它了。",-- 物品名:"锚套装" 制造描述:"船用刹车"
        MAST_ITEM = "扬帆起航！风会指引我们方向。",-- 物品名:"桅杆套装" 制造描述:"乘风破浪会有时。"
        MUTATEDHOUND =
        {
        	DEAD = "好险……终于解决它了。",-- 物品名:"恐怖猎犬"->死了
        	GENERIC = "哇，这只猎犬变异得好厉害！甚至有点吓人。",-- 物品名:"恐怖猎犬"->默认
        	SLEEPING = "嘘——别出声，我们悄悄绕过去。",-- 物品名:"恐怖猎犬"->睡着了
        },

        MUTATED_PENGUIN =
        {
			DEAD = "希望你能安息……",-- 物品名:"月岩企鸥"->死了
			GENERIC = "咕咕嘎嘎！",-- 物品名:"月岩企鸥"->默认
			SLEEPING = "睡着了？那我们就不打扰它了。",-- 物品名:"月岩企鸥"->睡着了
		},
        CARRAT =
        {
        	DEAD = "啊，小老鼠……",-- 物品名:"胡萝卜鼠"->死了 制造描述:"灵巧机敏，富含胡萝卜素。"
        	GENERIC = "这是什么？胡萝卜？还是老鼠？长得好奇怪又好可爱！",-- 物品名:"胡萝卜鼠"->默认 制造描述:"灵巧机敏，富含胡萝卜素。"
        	HELD = "抓住你了！毛茸茸的，手感真好~",-- 物品名:"胡萝卜鼠"->拿在手里 制造描述:"灵巧机敏，富含胡萝卜素。"
        	SLEEPING = "正在做梦呢。",-- 物品名:"胡萝卜鼠"->睡着了 制造描述:"灵巧机敏，富含胡萝卜素。"
        },

		BULLKELP_PLANT =
        {
            GENERIC = "这么大的海带！带回去做汤一定很鲜美！",-- 物品名:"公牛海带"->默认
            PICKED = "采集完毕！希望能快点长出来。",-- 物品名:"公牛海带"->被采完了
        },
		BULLKELP_ROOT = "它的根系很发达，我们可以把它移植到家附近。",-- 物品名:"公牛海带茎"
        KELPHAT = "戴在头上……感觉凉凉的，有点像做SPA？",-- 物品名:"海花环" 制造描述:"让人神经焦虑的东西。"
		KELP = "滑溜溜的海带叶子。",-- 物品名:"海带叶"
		KELP_COOKED = "煮熟了！闻起来有大海的味道。",-- 物品名:"熟海带叶"
		KELP_DRIED = "晒干了，可以当零食吃吗？",-- 物品名:"干海带叶"

		GESTALT = "是某种能量体吗？它一直在盯着我看。",-- 物品名:"虚影"
        GESTALT_GUARD = "哇！它生气了！快跑！",-- 物品名:"大虚影"

		COOKIECUTTER = "它的眼睛一直在动，是在寻找猎物吗？这外壳看起来好坚硬！",-- 物品名:"饼干切割机"
		COOKIECUTTERSHELL = "只剩下壳了。这种材质很适合做防护装备呢！",-- 物品名:"饼干切割机壳"
		COOKIECUTTERHAT = "戴上这个，我就像钻头一样无坚不摧啦！",-- 物品名:"饼干切割机帽子" 制造描述:"穿着必须犀利。"
		SALTSTACK =
		{
			GENERIC = "是天然的盐柱！",-- 物品名:"盐堆"->默认
			MINED_OUT = "这里已经开采完毕了。",-- 物品名:"盐堆"
			GROWING = "新的盐晶正在慢慢析出，大自然真神奇。",-- 物品名:"盐堆"->正在生长
		},
		SALTROCK = "亮晶晶的盐块！做饭的时候加一点会更美味哦。",-- 物品名:"盐晶"      --《荒野乱斗》切斯特台词空耳致敬
		SALTBOX = "用盐来脱水防腐，这可是经典的食物保存法！",-- 物品名:"盐盒" 制造描述:"用盐来储存食物。"

		TACKLESTATION = "这是……钓鱼专用的工作台？看来这里的人很懂生活嘛！",-- 物品名:"钓具容器" 制造描述:"传统的用饵钓鱼。"
		TACKLESKETCH = "这是一张图纸。让我看看……嗯，原理我都懂了！",-- 物品名:"{item}广告"

        MALBATROSS = "哇！好巨大的海鸟！它的翼展一定很惊人……哎呀，它好像生气了！",-- 物品名:"邪天翁"
        MALBATROSS_FEATHER = "非常优质的飞羽，轻便又坚韧。",-- 物品名:"邪天翁羽毛"
        MALBATROSS_BEAK = "这鸟喙看起来很锋利，被啄一下肯定很痛。",-- 物品名:"邪天翁喙"
        MAST_MALBATROSS_ITEM = "用这个做帆的话，我们的船一定能飞起来！",-- 物品名:"飞翼风帆套装" 制造描述:"像海鸟一样航向深蓝。"
        MAST_MALBATROSS = "扬帆！利用风力，我们可以去更远的地方！",-- 物品名:"飞翼风帆" 制造描述:"像海鸟一样航向深蓝。"
		MALBATROSS_FEATHERED_WEAVE = "用这种羽毛编织的材料，防水性能一定很好。",-- 物品名:"羽毛帆布" 制造描述:"精美的羽毛布料。"

        GNARWAIL =
        {
            GENERIC = "是一角鲸！你的角好帅气呀！",-- 物品名:"一角鲸"->默认
            BROKENHORN = "哎呀，你的角断了吗？没关系，还是很有精神的！",-- 物品名:"一角鲸"->断角且非随从
            FOLLOWER = "它好像很喜欢我也？这就是所谓的“人格魅力”吗？",-- 物品名:"一角鲸"->跟随
            BROKENHORN_FOLLOWER = "别乱跑哦，你需要好好修养。",-- 物品名:"一角鲸"->断角且跟随
        },
        GNARWAIL_HORN = "这是那个很帅气的角！很有收藏价值。",-- 物品名:"一角鲸的角"

        WALKINGPLANK = "小心脚下！这木板看起来不太稳固。",-- 物品名:"跳板"(木船)
        WALKINGPLANK_GRASS = "虽然只是草编的，但也足够让我们登船了。",-- 物品名:"跳板"(草船)
        OAR = "人力推进装置？嘿咻，嘿咻，全速前进！",-- 物品名:"桨" 制造描述:"划，划，划小船。"
		OAR_DRIFTWOOD = "浮木做的桨，意外地轻便呢！",-- 物品名:"浮木桨" 制造描述:"小桨要用浮木造？"

		OCEANFISHINGROD = "海钓竿！我也要试试能不能钓到深海巨兽！",-- 物品名:"海钓竿" 制造描述:"像职业选手一样钓鱼吧。"
		OCEANFISHINGBOBBER_NONE = "还要加个浮标才能开始钓鱼哦。",-- 物品名:"鱼钩"
        OCEANFISHINGBOBBER_BALL = "最基础的木球浮标，简单又好用。",-- 物品名:"木球浮标" 制造描述:"经典设计，初学者和职业钓手两相宜。"
        OCEANFISHINGBOBBER_OVAL = "比起圆形的，这个更不容易被水流冲走吧？",-- 物品名:"硬物浮标" 制造描述:"在经典浮标的基础上融入了时尚设计。"
		OCEANFISHINGBOBBER_CROW = "黑色的羽毛浮标，很有神秘感呢。",-- 物品名:"黑羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN = "红色的羽毛在水里一定很显眼。",-- 物品名:"红羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_ROBIN_WINTER = "这种蓝色让人想到冰雪。",-- 物品名:"蔚蓝羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_CANARY = "鲜艳的黄色羽毛，希望能带来好运！",-- 物品名:"黄羽浮标" 制造描述:"深受职业钓手的喜爱。"
		OCEANFISHINGBOBBER_GOOSE = "鹅毛做的浮标，看起来很高档啊。",-- 物品名:"鹅羽浮标" 制造描述:"高级羽绒浮标。"
		OCEANFISHINGBOBBER_MALBATROSS = "有了这个大师级装备，还有什么鱼是钓不到的？",-- 物品名:"邪天翁羽浮标" 制造描述:"高级巨鸟浮标。"

		OCEANFISHINGLURE_SPINNER_RED = "亮闪闪的旋转亮片，鱼儿会被它的反光吸引吗？",-- 物品名:"日出旋转亮片" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPINNER_GREEN = "绿色的适合在光线不强的时候用。",-- 物品名:"黄昏旋转亮片" 制造描述:"低光照环境里效果最好。"
		OCEANFISHINGLURE_SPINNER_BLUE = "蓝色的亮片，是为夜钓准备的秘密武器！",-- 物品名:"夜间旋转亮片" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_SPOON_RED = "这种形状模拟了受伤的小鱼，很聪明的仿生设计。",-- 物品名:"日出匙型假饵" 制造描述:"早起的鱼儿有虫吃。"
		OCEANFISHINGLURE_SPOON_GREEN = "这个颜色也许能融入水草环境？",-- 物品名:"黄昏匙型假饵" 制造描述:"在夕阳中继续垂钓。"
		OCEANFISHINGLURE_SPOON_BLUE = "晚上钓鱼就靠它了！",-- 物品名:"夜间匙型假饵" 制造描述:"适用于夜间垂钓。"
		OCEANFISHINGLURE_HERMIT_RAIN = "专门应对雨天环境的特殊鱼饵。",-- 物品名:"雨天鱼饵" 制造描述:"留着雨天用。"
		OCEANFISHINGLURE_HERMIT_SNOW = "这是耐寒型鱼饵吗？",-- 物品名:"雪天鱼饵" 制造描述:"雪天适合用它钓鱼。"
		OCEANFISHINGLURE_HERMIT_DROWSY = "添加了镇静成分的鱼饵？这算作弊吗？",-- 物品名:"麻醉鱼饵" 制造描述:"把鱼闷住就抓住了一半。"
		OCEANFISHINGLURE_HERMIT_HEAVY = "增加了配重的鱼饵，目标是深水区的大鱼！",-- 物品名:"重量级鱼饵" 制造描述:"钓一条大鱼！"

		OCEANFISH_SMALL_1 = "是小型孔雀鱼，体型很迷你。",-- 物品名:"小孔雀鱼"
		OCEANFISH_SMALL_2 = "这种鱼的嘴好尖，像针一样。",-- 物品名:"针鼻喷墨鱼"
		OCEANFISH_SMALL_3 = "是最常见的小饵鱼，可以做鱼汤！",-- 物品名:"小饵鱼"
		OCEANFISH_SMALL_4 = "这个太小了，还不够塞牙缝呢。",-- 物品名:"三文鱼苗"
		OCEANFISH_SMALL_5 = "像爆米花一样的小鱼，名字取得真形象！",-- 物品名:"爆米花鱼"
		OCEANFISH_SMALL_6 = "伪装大师！不仔细看都发现不了。",-- 物品名:"落叶比目鱼"
		OCEANFISH_SMALL_7 = "这鲜艳的颜色，是为了警告捕食者吗？",-- 物品名:"花朵金枪鱼"
		OCEANFISH_SMALL_8 = "像小太阳一样热情的颜色！",-- 物品名:"炽热太阳鱼"
        OCEANFISH_SMALL_9 = "观察表明，它似乎会喷吐液体。",-- 物品名:"口水鱼"

		OCEANFISH_MEDIUM_1 = "看起来有点脏兮兮的，也是一种保护色吗？",-- 物品名:"泥鱼"
		OCEANFISH_MEDIUM_2 = "身上的斑点分布很有规律。",-- 物品名:"斑鱼"
		OCEANFISH_MEDIUM_3 = "这鳍张开的样子像狮子一样威风！",-- 物品名:"浮夸狮子鱼"
		OCEANFISH_MEDIUM_4 = "黑黑的，在暗处应该很难被发现。",-- 物品名:"黑鲶鱼"
		OCEANFISH_MEDIUM_5 = "玉米鳕鱼？吃起来会有爆米花的味道吗？",-- 物品名:"玉米鳕鱼"
		OCEANFISH_MEDIUM_6 = "好漂亮的锦鲤！这种花纹很少见呢。",-- 物品名:"花锦鲤"
		OCEANFISH_MEDIUM_7 = "金色的锦鲤！据说看到它会有好运哦！",-- 物品名:"金锦鲤"
		OCEANFISH_MEDIUM_8 = "摸起来冰冰凉凉的。",-- 物品名:"冰鲷鱼"
        OCEANFISH_MEDIUM_9 = "闻起来真的有甜味！这是什么特殊的物质这？",-- 物品名:"甜味鱼"

		PONDFISH = "淡水鱼！捆起来烤了吃吧。",-- 物品名:"淡水鱼"
		PONDEEL = "活鳗鱼！烤着吃一定很棒！",-- 物品名:"活鳗鱼"

        FISHMEAT = "生鱼肉。需要进行热处理才能食用。",-- 物品名:"生鱼肉"
        FISHMEAT_COOKED = "烤鱼！外焦里嫩，香气扑鼻！",-- 物品名:"鱼排"
        FISHMEAT_SMALL = "小小的鱼肉块。",-- 物品名:"小鱼块"
        FISHMEAT_SMALL_COOKED = "一口一个的小鱼干！酥酥脆脆的。",-- 物品名:"熟小鱼块"
		SPOILED_FISH = "呜……这味道太刺鼻了，已经严重腐败了。",-- 物品名:"变质的鱼"

		FISH_BOX = "这是专门用来展示战利品的盒子吗？",-- 物品名:"锡鱼罐" 制造描述:"保持鱼与网捕之日一样新鲜。"
        POCKET_SCALE = "让我来测量一下这条鱼的数据！",-- 物品名:"弹簧秤" 制造描述:"随时称鱼的重量！"

		TACKLECONTAINER = "要把钓具都整理好，这样用的时候才方便。",-- 物品名:"钓具箱" 制造描述:"整齐收纳你的钓具。"
		SUPERTACKLECONTAINER = "升级版的箱子！可以装下更多东西啦！",-- 物品名:"超级钓具箱" 制造描述:"更多收纳钓具的空间？我上钩了！"

		TROPHYSCALE_FISH =
		{
			GENERIC = "来看看今天的最佳捕获记录！",-- 物品名:"鱼类计重器"->默认
			HAS_ITEM = "当前记录：{weight}。捕获者：{owner}。",-- 物品名:"鱼类计重器"->不是重鱼且不是自己钓的
			HAS_ITEM_HEAVY = "重量：{weight}！捕获者：{owner}！哇，这是一条超级大鱼！",-- 物品名:"鱼类计重器"->重鱼且不是自己钓的
			BURNING = "着火了！设备要损坏了！",-- 物品名:"鱼类计重器"->正在燃烧
			BURNT = "坏掉了……太可惜了。",-- 物品名:"鱼类计重器"->烧焦的
			OWNER = "看！是我钓到的哦！\n重量：{weight}！\n快夸夸我！",-- 物品名:"鱼类计重器"->不是重鱼且是自己钓的
			OWNER_HEAVY = "重量：{weight}\n捕获者：{owner}\n看啊！这是我钓起来的深海巨兽！\n重量：{weight}！",-- 物品名:"鱼类计重器"->重鱼且是自己钓的
		},

		OCEANFISHABLEFLOTSAM = "水里漂着什么东西……让我用鱼竿把它捞上来看看！",-- 物品名:"海洋残骸（钓鱼能钓上来的那个沉底垃圾）"

		CALIFORNIAROLL = "哇，好精致的寿司卷！可以一口吃掉吗？",-- 物品名:"加州卷"
		SEAFOODGUMBO = "好大一碗海鲜汤！闻起来超级鲜美！",-- 物品名:"海鲜浓汤"
		SURFNTURF = "这是……传说中的海陆大餐？看起来很好吃呢！",-- 物品名:"海鲜牛排"

        WOBSTER_SHELLER = "龙虾先生，别乱动哦，我只是在做生态调查……大概？",-- 物品名:"龙虾"
        WOBSTER_DEN = "这是一个龙虾的隐蔽所，位置很隐蔽呢。",-- 物品名:"龙虾窝"
        WOBSTER_SHELLER_DEAD = "龙虾先生……它不动了。",-- 物品名:"死龙虾"
        WOBSTER_SHELLER_DEAD_COOKED = "红通通的熟龙虾！这可是很棒的蛋白质来源！",-- 物品名:"美味的龙虾"

        LOBSTERBISQUE = "浓郁的龙虾汤！喝完一定浑身充满力气！",-- 物品名:"龙虾汤"
        LOBSTERDINNER = "哇，这么丰盛的晚餐！大家一起吃吧！",-- 物品名:"龙虾正餐"

        WOBSTER_MOONGLASS = "像宝石一样晶莹剔透的龙虾！太漂亮了！",-- 物品名:"月光龙虾"
        MOONGLASS_WOBSTER_DEN = "这个窝是用晶体做的，好神奇！",-- 物品名:"月光玻璃窝"

		TRIDENT = "三叉戟诶！拿着它感觉自己像海神一样威风！",-- 物品名:"刺耳三叉戟" 制造描述:"在汹涌波涛中引领潮流吧！"     --《荒野乱斗》露米台词致敬

		WINCH =
		{
			GENERIC = "可以用这个把深海里的东西打捞上来！好耶！",-- 物品名:"夹夹绞盘"->默认 制造描述:"让它帮你捞起重的东西吧。"
			RETRIEVING_ITEM = "用力——！马上就要上来了！",-- 物品名:"夹夹绞盘"->正在打捞
			HOLDING_ITEM = "成功打捞！让我看看是什么好东西？",-- 物品名:"夹夹绞盘"->有物品
		},

        HERMITHOUSE = 
        {
            GENERIC = "这里的建筑风格很独特，是那位老奶奶的家。",-- 物品名:"隐士之家"->默认
            BUILTUP = "修缮完毕！希望老奶奶会喜欢我帮的忙。",-- 物品名:"隐士之家"->建造至少一次
        },

        SHELL_CLUSTER = "哇，真的是好多贝壳！挑几个最漂亮的带回去吧！",-- 物品名:"贝壳堆"
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "这个贝壳发出的声音低沉有力。",-- 物品名:"低音贝壳钟"->默认
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "听！这个声音正如其名，十分中正平和。",-- 物品名:"中音贝壳钟"->默认
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "好清脆的声音！像百灵鸟一样。",-- 物品名:"高音贝壳钟"->默认
        },

        CHUM = "这是特制的鱼饵！鱼儿们快来开饭啦！",-- 物品名:"鱼食" 制造描述:"鱼儿的美食。"

        SUNKENCHEST =
        {
            GENERIC = "发现沉在水底的宝箱！里面会有宝藏吗？",-- 物品名:"沉底宝箱"->这句好像没用，因为默认就是下面那句
            LOCKED = "哎呀，锁住了。得找找钥匙才行。",-- 物品名:"沉底宝箱"->锁住了
        },

        HERMIT_BUNDLE = "这是老奶奶送给我的吗？嘿嘿，谢谢！",-- 物品名:"一包谢意"这俩一个是卖的一个是任务送的
        HERMIT_BUNDLE_SHELLS = "里面装满了各种各样的贝壳！",-- 物品名:"贝壳钟包" 制造描述:"她卖的贝壳。"

        RESKIN_TOOL = "大扫除时间到！看我把这里变得焕然一新！",-- 物品名:"清洁扫把" 制造描述:"把装潢的东西清扫的干干净净。"
        MOON_FISSURE_PLUGGED = "呼，终于堵住啦。这样就不会有那个奇怪的光跑出来了。",-- 物品名:"堵住的裂隙"


		----------------------- 腐烂相关内容分隔线（我也不知道这个干啥的,管他呢） ------------------

		-- 沃尔特相关
        WOBYBIG =--大狗形态
        {
            "哇，好大的狗狗！让我骑一下好不好嘛？",-- 物品名:"沃比" 
            "毛茸茸的大狗狗！你要带我去哪里探险呀？",-- 物品名:"沃比"
        },
        WOBYSMALL =--小狗形态
        {
            "小狗狗，真乖~ 来，握手！",-- 物品名:"沃比"
            "好可爱的小家伙！摸摸头~",-- 物品名:"沃比"
        },
		WALTERHAT = "戴上这个帽子，感觉更有探险家的派头了！",-- 物品名:"松树先锋队帽子" 制造描述:"形式和功能高于时尚。"
		SLINGSHOT =
		{
			GENERIC = "是弹弓诶！我小时候也很擅长玩这个哦！",-- 物品名:"可靠的弹弓" 制造描述:"不带它千万别去冒险！"
			NOT_MINE = "only_used_by_walter", -- 物品名:"可靠的弹弓"不是自己的弹弓
		},
		SLINGSHOTAMMO_ROCK = "普通的小石子，虽然简单但是随处可见。",-- 物品名:"鹅卵石" 制造描述:"简单，低效。"  --这里是在学老麦说话
		SLINGSHOTAMMO_MARBLE = "是大理石做的弹珠！拿在手里沉甸甸的。",-- 物品名:"大理石弹" 制造描述:"可别把它们弄丢了！"
		SLINGSHOTAMMO_THULECITE = "这种弹药散发着古代咒语的气息，不知道威力如何？",-- 物品名:"诅咒弹药" 制造描述:"会出什么问题？"
        SLINGSHOTAMMO_GOLD = "金子做的弹药？太奢侈了吧！不过应该很重。",-- 物品名:"黄金弹药" 制造描述:"因为高级，所以有效。"
		SLINGSHOTAMMO_HONEY = "黏糊糊的蜂蜜弹药，被打中一定会很不舒服。",-- 物品名:"蜂蜜弹药"
        SLINGSHOTAMMO_SLOW = "这个可以减慢敌人的速度吗？控制行动是很重要的战术。",-- 物品名:"减速弹药" 制造描述:"什么是“物理定律”？"
        SLINGSHOTAMMO_FREEZE = "摸起来好冰！能把坏人冻住吗？",-- 物品名:"冰冻弹药" 制造描述:"把敌人冰冻在原地。"
		SLINGSHOTAMMO_POOP = "咦……这个味道……还是不要靠近比较好。",-- 物品名:"便便弹"
		SLINGSHOTAMMO_STINGER = "看起来很尖锐，使用的时候要小心别扎到自己。",-- 物品名:"蜂刺弹"
		SLINGSHOTAMMO_MOONGLASS = "亮晶晶的玻璃弹珠！但是边缘很锋利哦。",-- 物品名:"月亮弹"
		SLINGSHOTAMMO_GELBLOB = "黏黏糊糊的……这是什么成分？",-- 物品名:"恶液弹"
		SLINGSHOTAMMO_SCRAPFEATHER = "带着静电的羽毛？是被雷击中过吗？",-- 物品名:"电击废料弹"     --《皇室战争》闪电法师台词致敬
        SLINGSHOTAMMO_DREADSTONE = "这种石头的能量波动让人感觉不太舒服。",-- 物品名:"绝望小石"
        SLINGSHOTAMMO_GUNPOWDER = "小心！这是会爆炸的弹药！威力肯定很大！",-- 物品名:"轰轰弹"     --《荒野乱斗》露米台词致敬
        SLINGSHOTAMMO_LUNARPLANTHUSK = "如果不小心打到泥土里，会长出新的植物吗？",-- 物品名:"亮茄外壳弹药"        --攻击生成触手这点诅咒弹也有一样的效果
        SLINGSHOTAMMO_PUREBRILLIANCE = "好刺眼的光！这简直就是闪光弹嘛！",-- 物品名:"纯粹辉煌弹药"      --纯粹辉煌弹有加伤效果
        SLINGSHOTAMMO_HORRORFUEL = "这种力量……让麦哲伦背脊发凉。不太舒服呢。",-- 物品名:"纯粹恐惧弹药"
        PORTABLETENT = "可以背着走的帐篷！野外考察必备！",-- 物品名:"宿营帐篷" 制造描述:"便捷的保护设备，让你免受风吹雨打。"
        PORTABLETENT_ITEM = "我们要在这里露营吗？好期待！",-- 物品名:"帐篷卷" 制造描述:"便捷的保护设备，让你免受风吹雨打。"     --《荒野乱斗》露米台词致敬

        -- 薇格弗德相关
        BATTLESONG_DURABILITY = "这首歌……强化了武器的分子结构？好神奇的原理！",-- 物品名:"武器化的颤音" 制造描述:"让武器有更多的时间成为焦点。"
        BATTLESONG_HEALTHGAIN = "舒缓的频率加速了伤口愈合……麦哲伦记下来了！",-- 物品名:"心碎歌谣" 制造描述:"一首偷心的颂歌。"
        BATTLESONG_SANITYGAIN = "听着这首歌，心情平静下来了。",-- 物品名:"醍醐灌顶华彩" 制造描述:"用歌声慰藉你的心灵。"
        BATTLESONG_SANITYAURA = "让人充满勇气的旋律！大家冲呀！",-- 物品名:"英勇美声颂" 制造描述:"无所畏惧！"
        BATTLESONG_FIRERESISTANCE = "声波屏障可以隔绝热量吗？",-- 物品名:"防火假声" 制造描述:"抵御火辣的戏评人。"
        BATTLESONG_INSTANT_TAUNT = "嘿！看这边！……虽然有点粗鲁，但很有效！",-- 物品名:"粗鲁插曲" 制造描述:"用言语扔一个番茄。"
        BATTLESONG_INSTANT_PANIC = "坏人们都被吓跑了！是声波武器吗？",-- 物品名:"惊心独白" 制造描述:"如此出色的表演，就问你怕不怕。"

        -- 韦伯相关
        MUTATOR_WARRIOR = "蜘蛛先生……变得更强壮了！这是定向变异吗？",-- 物品名:"战士变身涂鸦" 制造描述:"做最可爱的小保镖。"
        MUTATOR_DROPPER = "蜘蛛先生学会空降了？要注意头顶哦！",-- 物品名:"悬蛛变身涂鸦" 制造描述:"味道也许会让你惊喜。"
        MUTATOR_HIDER = "拟态能力增强了？它躲起来了。",-- 物品名:"洞穴变身涂鸦" 制造描述:"外酥里嫩。"
        MUTATOR_SPITTER = "喷射器官强化完毕！",-- 物品名:"喷吐变身涂鸦" 制造描述:"喷薄而出的蜘蛛形象。"
        MUTATOR_MOON = "月亮变异！虽然很漂亮，但是……结构完全改变了呢。",-- 物品名:"破碎变身涂鸦" 制造描述:"吃到它的人会快乐到月球去！"
        MUTATOR_HEALER = "难道说……蜘蛛的毒液成分发生了逆转，变成了药剂？",-- 物品名:"护士变身涂鸦" 制造描述:"特别多的谷物，所以必须是健康的！"
        SPIDER_WHISTLE = "某种特定频率的声波控制器？可以指挥蜘蛛呢！",-- 物品名:"韦伯口哨" 制造描述:"呼叫可怕的爬行动物朋友吧。"
        SPIDERDEN_BEDAZZLER = "把蜘蛛巢装饰得漂亮一点吧，心情好工作效率也会提高！",-- 物品名:"蛛巢装饰套装" 制造描述:"一个好的家能培育出好的性格。"
        SPIDER_HEALER = "谢谢你的治疗，护士蜘蛛先生！",-- 物品名:"护士蜘蛛"
        SPIDER_REPELLENT = "这是某种生物驱避剂，蜘蛛先生不喜欢这个味道。",-- 物品名:"驱赶盒子" 制造描述:"让你的朋友知道你需要一些空间。"
        SPIDER_HEALER_ITEM = "虽然看起来黏糊糊的，但是有很好的治疗效果！",-- 物品名:"治疗黏团" 制造描述:"恶心，黏糊糊的，但对你有好处！"

		-- 温蒂相关
		GHOSTLYELIXIR_SLOWREGEN = "缓释型治疗药剂，慢慢就会好起来的。",-- 物品名:"亡者补药" 制造描述:"时间会抚平所有伤口。"       --每秒回复2点，持续480秒（一天）        幽魂花冠：每秒回复1血，持续20秒
		GHOSTLYELIXIR_FASTREGEN = "强力回复药剂！马上就能恢复活力！",-- 物品名:"灵魂万灵药" 制造描述:"治疗重伤的强力药剂。"     --快速回复600血，20血1秒，持续30秒      幽魂花冠：每秒回复5血，持续20秒
		GHOSTLYELIXIR_SHIELD = "某种能量护盾？可以保护大家！",-- 物品名:"不屈药剂" 制造描述:"保护你的姐妹不受伤害。"        --延长护盾至1秒，持续一天       幽魂花冠：50血一次性减伤，限时120秒
		GHOSTLYELIXIR_ATTACK = "战斗机能强化！感觉充满了力量！",-- 物品名:"夜影万金油" 制造描述:"召唤黑暗的力量。"        --保持1天夜晚伤害（40伤）       幽魂花冠：获得夜视一天（我的天哪，strong大人）
		GHOSTLYELIXIR_SPEED = "移动速度提升！要来比赛赛跑吗？",-- 物品名:"强健精油" 制造描述:"给你的灵魂来一剂强心针。"       --获得75%速度加成       幽魂花冠：抵消25%装备减速，免疫蛛网蜂蜜拖尾减速一天
		GHOSTLYELIXIR_REVIVE = "这朵花……蕴含着重生的奇迹吗？",-- 物品名:"恐怖经历" 制造描述:"让阿比盖尔想起自己能成为的一切。"      --使用时升级至3级，持续2秒（无持续效果）        幽魂花冠：吃下一根胡萝卜再摘朵花，随后将生命回复转为25%血上限回复，持续0.3秒（无持续效果）
		GHOSTLYELIXIR_RETALIATION = "这就是……复仇的滋味？坏人打你会后悔的哦。",		-- 物品名:"蒸馏复仇" 制造描述:"对敌人以牙还牙。"        --延长护盾至1秒，持续一天，受伤反伤20*2伤害     幽魂花冠：50血一次性减伤，限时120秒，成功触发反伤5半径内的生物20伤害

		SISTURN =
		{
			GENERIC = "这是用来纪念逝者的吗？感觉很庄重。",-- 物品名:"姐妹骨灰罐"->默认 制造描述:"让你疲倦的灵魂休息的地方。"
			SOME_FLOWERS = "再放一些花进去吧，让它看起来更温暖。",-- 物品名:"姐妹骨灰罐"->没填满
			LOTS_OF_FLOWERS = "装满了鲜花，这也是一种美丽的告别。",-- 物品名:"姐妹骨灰罐"->满花
            LOTS_OF_FLOWERS_EVIL = "这些花散发着不安的气息……",-- 物品名:"姐妹骨灰罐"->恶魔花
            LOTS_OF_FLOWERS_BLOSSOM = "发光的花，像是希望的光芒。",   -- 物品名:"姐妹骨灰罐"->月树花
		},

        -- 沃拓克斯相关
        WORTOX_SOUL = "这是……生物的能量残留？亮晶晶的。", --物品名:"灵魂"
        --WORTOX_DECOY 无需额外台词，使用沃拓克斯的默认检查文本即可。
        WORTOX_NABBAG = "空间折叠技术？不，好像是魔法呢。",-- 物品名:"强抢袋"
        WORTOX_REVIVER = "这个心脏在跳动……可以用来救人吗？",-- 物品名:"双尾心"
        WORTOX_SOULJAR = "把灵魂装在罐子里……有点吓人。",-- 物品名:"灵魂罐"      --SOULJAR读起来很像soldie但是我不知道怎么搞中文双关

        PORTABLECOOKPOT_ITEM =-- 物品名:"便携烹饪锅"
        {
            GENERIC = "便携式烹饪锅！随时随地都能做好吃的！",-- 物品名:"便携烹饪锅"->默认 制造描述:"随时随地为美食家服务。"
            DONE = "好香呀！饭做好了吗？快让我尝尝！",-- 物品名:"便携烹饪锅"->完成了 制造描述:"随时随地为美食家服务。"

			COOKING_LONG = "还要再等一会哦，美味值得等待！",-- 物品名:"便携烹饪锅"->饭还需要很久 制造描述:"随时随地为美食家服务。"
			COOKING_SHORT = "马上就可以吃啦！准备好餐具！",-- 物品名:"便携烹饪锅"->饭快做好了 制造描述:"随时随地为美食家服务。"
			EMPTY = "锅里空空的，做点什么好呢？",-- 物品名:"便携烹饪锅" 制造描述:"随时随地为美食家服务。"
        },

        PORTABLEBLENDER_ITEM = "可以把食材打碎……或者做成冰沙！",-- 物品名:"便携研磨器" 制造描述:"把原料研磨成粉状调味品。"
        PORTABLESPICER_ITEM =
        {
            GENERIC = "加点调料，让食物变得更美味！",-- 物品名:"便携香料站"->默认 制造描述:"调味让饭菜更可口。"
            DONE = "调味完成！闻起来更棒了！",-- 物品名:"便携香料站"->完成了 制造描述:"调味让饭菜更可口。"
        },
        SPICEPACK = "大厨的百宝袋，我也想要一个！",-- 物品名:"厨师袋" 制造描述:"使你的食物保持新鲜。"
        SPICE_GARLIC = "大蒜粉，味道有点重……但是很健康！",-- 物品名:"蒜粉" 制造描述:"用口臭防守是最好的进攻。"
        SPICE_SUGAR = "甜甜的蜂蜜水晶！放在刨冰里一定很好吃！",-- 物品名:"蜂蜜水晶" 制造描述:"令人心平气和的甜美。"
        SPICE_CHILI = "好辣的辣椒粉！吃完身体会暖和起来吗？",-- 物品名:"辣椒面" 制造描述:"刺激十足的粉末。"
        SPICE_SALT = "盐，是生命必需的矿物质哦。",-- 物品名:"调味盐" 制造描述:"为你的饭菜加点咸味。"
        MONSTERTARTARE = "这个……真的能吃吗？虽然看起来肉质很新鲜……",-- 物品名:"怪物鞑靼"
        FRESHFRUITCREPES = "看起来好好吃！麦哲伦想吃这个！",-- 物品名:"鲜果可丽饼"
        FROGFISHBOWL = "鱼和青蛙……这是什么奇妙的生态组合？",-- 物品名:"蓝带鱼排"
        POTATOTORNADO = "像龙卷风一样的土豆！好有趣的造型！",-- 物品名:"花式回旋块茎"
        DRAGONCHILISALAD = "看起来很辣的样子……真的没问题吗？",-- 物品名:"辣龙椒沙拉"
        GLOWBERRYMOUSSE = "发光的慕斯，太梦幻了！",-- 物品名:"发光浆果慕斯"
        VOLTGOATJELLY = "吃了舌头会麻麻的吗？像触电一样？",-- 物品名:"伏特羊肉冻"
        NIGHTMAREPIE = "黑乎乎的派……但我很好奇它的味道。",-- 物品名:"恐怖国王饼"
        BONESOUP = "骨头汤，钙质很丰富哦！",-- 物品名:"骨头汤"
        MASHEDPOTATOES = "软软的土豆泥，口感一定很棒。",-- 物品名:"奶油土豆泥"
        POTATOSOUFFLE = "蓬松的蛋奶酥，在嘴里融化的感觉！",-- 物品名:"蓬松土豆蛋奶酥"
        MOQUECA = "海鲜杂烩，好香呀！让我想起了……嗯？想起了什么呢？",-- 物品名:"海鲜杂烩"
        GAZPACHO = "凉凉的汤！夏天喝这个最舒服了！",-- 物品名:"芦笋冷汤"
        ASPARAGUSSOUP = "虽然是热汤，但是芦笋很清爽。",-- 物品名:"芦笋汤"
        VEGSTINGER = "蔬菜汁……虽然为了健康要喝，但还是更想吃甜品呢。",-- 物品名:"蔬菜鸡尾酒"
        BANANAPOP = "香蕉冰棍！这是麦哲伦的最爱！",-- 物品名:"香蕉冻"
        CEVICHE = "酸酸的腌鱼，很开胃！",-- 物品名:"酸橘汁腌鱼"
        SALSA = "好辣的酱！像是某种化学试剂……开玩笑的！",-- 物品名:"生鲜萨尔萨酱"

        TURNIP = "大头菜，很结实的感觉。",    -- 物品名:"大萝卜"
        TURNIP_COOKED = "烤熟的大头菜，味道还不错。",-- 物品名:"烤大萝卜"
        TURNIP_SEEDS = "大头菜的种子，要种在试验田里吗？",-- 物品名:"圆形种子"

        GARLIC = "大蒜，含有大蒜素，可以杀菌哦。",-- 物品名:"大蒜"
        GARLIC_COOKED = "烤过的大蒜，味道变得柔和了。",-- 物品名:"烤大蒜"        GARLIC_SEEDS = "这是大蒜的种子吗？像个小豆子。",-- 物品名:"种子荚"

        ONION = "切开会让人流眼泪的蔬菜……是含有丙硫醛氧化物吗？",-- 物品名:"洋葱"
        ONION_COOKED = "烤洋葱，甜甜的焦糖味。",-- 物品名:"烤洋葱"
        ONION_SEEDS = "小小的种子，会长出洋葱吗？",-- 物品名:"尖形种子"

        POTATO = "土豆先生，身上好多泥土。",-- 物品名:"土豆"
        POTATO_COOKED = "热乎乎的烤土豆，最好吃啦！",-- 物品名:"烤土豆"
        POTATO_SEEDS = "毛茸茸的种子，好可爱。",-- 物品名:"毛茸茸的种子"

        TOMATO = "红红的番茄，像小灯笼一样。",-- 物品名:"番茄"
        TOMATO_COOKED = "小心烫哦，里面的汁水很热的。",-- 物品名:"烤番茄"
        TOMATO_SEEDS = "带刺的种子，要小心拿。",-- 物品名:"带刺的种子"

        ASPARAGUS = "细细长长的蔬菜。",-- 物品名:"芦笋"     --发福利了（bushi）
        ASPARAGUS_COOKED = "烤芦笋，脆脆的。",-- 物品名:"烤芦笋"
        ASPARAGUS_SEEDS = "这个种子长得好奇怪呀。",-- 物品名:"筒状种子"

        PEPPER = "红红的辣椒，看起来很辣！",-- 物品名:"辣椒"
        PEPPER_COOKED = "哇，闻起来就好辣！",-- 物品名:"烤辣椒"
        PEPPER_SEEDS = "辣椒的种子也是辣的吗？",-- 物品名:"块状种子"

        WEREITEM_BEAVER = "这个雕像……感觉有奇怪的气息。",-- 物品名:"俗气海狸像" 制造描述:"唤醒海狸人的诅咒"
        WEREITEM_GOOSE = "让人感觉不太舒服的雕像，像是某种图腾。",-- 物品名:"俗气鹅像" 制造描述:"唤醒鹅人的诅咒"
        WEREITEM_MOOSE = "是被诅咒的物品吗？麦哲伦会小心保存的。",-- 物品名:"俗气鹿像" 制造描述:"唤醒鹿人的诅咒"

        MERMHAT = "伪装装置！这样我就能潜入鱼人社会进行观察了吗？",        -- 物品名:"聪明的伪装" 制造描述:"鱼人化你的朋友。"
        MERMTHRONE =
        {
            GENERIC = "这就是鱼人国王的宝座？社会阶级结构很明显呢。",-- 物品名:"皇家地毯"->默认
            BURNT = "烧坏了……文明的遗迹被破坏了。",-- 物品名:"皇家地毯"->烧焦的
        },
        MOSQUITOMUSK = "生物驱避剂的原理吗？太好了，蚊子走开！",-- 物品名:"小痒痒"
        MOSQUITOBOMB = "利用昆虫制作的炸弹？稍微有点危险呢。",-- 物品名:"蚊子炸弹"
        MOSQUITOFERTILIZER = "这种肥料……富含某种特殊的营养元素？",-- 物品名:"嗡嗡肥料"
        MOSQUITOMERMSALVE = "希望能治好大家的伤，恢复健康是最重要的！",-- 物品名:"蚊血注射器"       --《荒野乱斗》巴兹台词致敬

        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "正在建造的王座，鱼人们好像很有组织性。",-- 物品名:"皇家手工套装"->默认 制造描述:"建立一个新的鱼人王朝。"
            BURNT = "啊……建造工作中途停止了。",-- 物品名:"皇家手工套装"->烧焦的 制造描述:"建立一个新的鱼人王朝。"
        },
        MERMHOUSE_CRAFTED =
        {
            GENERIC = "鱼人先生的新家！这算是社会福利房吗？",-- 物品名:"鱼人工艺屋"->默认 制造描述:"适合鱼人的家。"
            BURNT = "房子烧坏了……得帮它们重建才行。",-- 物品名:"鱼人工艺屋"->烧焦的 制造描述:"适合鱼人的家。"
        },

        MERMWATCHTOWER_REGULAR = "守卫先生在保护大家，很有责任感呢。",-- 物品名:"鱼人工艺屋"->有鱼人王时 制造描述:"适合鱼人的家。"
        MERMWATCHTOWER_NOKING = "没有国王的指挥，守卫先生看起来有点迷茫。",-- 物品名:"鱼人工艺屋"->没有鱼人王时 制造描述:"适合鱼人的家。"
        MERMKING = "鱼人先生的国王！您好！我想申请进行学术访问！",-- 物品名:"鱼人之王"
        MERMGUARD = "看起来很强壮的守卫先生，肌肉非常发达。",-- 物品名:"忠诚鱼人守卫"
        MERM_PRINCE = "这是未来的统治者吗？还是幼年体？",-- 物品名:"过程中的皇室"

        SQUID = "会喷墨水的乌贼先生！小心不要被弄脏了衣服。",-- 物品名:"鱿鱼"

		GHOSTFLOWER = "这朵花……蕴含着某种悲伤的情感波动。",-- 物品名:"哀悼荣耀"
        SMALLGHOST = "迷路的小幽灵吗？不要怕，麦哲伦姐姐在这里哦。",-- 物品名:"小惊吓"

        CRABKING =
        {
            GENERIC = "超级巨大的甲壳类生物！那个外壳一定很坚硬！",-- 物品名:"帝王蟹"->默认
            INERT = "正在休眠吗？正好是观察的好机会。",-- 物品名:"帝王蟹"
        },
		CRABKING_CLAW = "好大的钳子！被夹住的话绝对会骨折的！",-- 物品名:"巨钳"

		MESSAGEBOTTLE = "漂流瓶！里面写着求救信号还是藏宝图呢？",-- 物品名:"瓶中信"
		MESSAGEBOTTLEEMPTY = "空瓶子，能装东西。",-- 物品名:"空瓶子"

        MEATRACK_HERMIT =--奶奶岛肉架
        {
            DONE = "肉干风干完毕！可以作为储备粮。",-- 物品名:"晾肉架"->完成了
            DRYING = "脱水处理中，还需要一点时间。",-- 物品名:"晾肉架"->正在风干
            DRYINGINRAIN = "湿度太高了，风干效率会下降的。",-- 物品名:"晾肉架"->雨天风干
            GENERIC = "老奶奶的晾肉架，生活气息很浓厚呢。",-- 物品名:"晾肉架"->默认
            BURNT = "架子烧坏了……",-- 物品名:"晾肉架"->烧焦的
            DONE_NOTMEAT = "这个也晾干了，保存期限应该延长了吧？",-- 物品名:"晾肉架"->晾晒好的非肉
            DRYING_NOTMEAT = "正在去除水分……",-- 物品名:"晾肉架"->晾晒非肉
            DRYINGINRAIN_NOTMEAT = "这种天气晾东西很容易发霉的。",-- 物品名:"晾肉架"->雨天晾晒非肉
        },
        BEEBOX_HERMIT =--奶奶岛蜂箱
        {
            READY = "好多蜂蜜！可以采集了吗？",-- 物品名:"蜂箱"->准备好的 满的
            FULLHONEY = "蜂蜜满出来了！效率真高啊！",-- 物品名:"蜂箱"->蜂蜜满了
            GENERIC = "老奶奶养的小蜜蜂，它们在某种程度上算是家畜吧？",-- 物品名:"蜂箱"->默认（空）
            NOHONEY = "还没有蜂蜜呢，蜜蜂们在偷懒吗？",-- 物品名:"蜂箱"->没有蜂蜜
            SOMEHONEY = "蜜蜂们正在努力工作，已经能看到一点蜂蜜了。",-- 物品名:"蜂箱"->有一些蜂蜜
            BURNT = "蜂箱烧坏了……蜜蜂们没事吧？",-- 物品名:"蜂箱"->烧焦的
        },

        HERMITCRAB = "独自生活在这里的老奶奶……她一定有很多故事，或者观测记录？",-- 物品名:"寄居蟹隐士"

        HERMIT_PEARL = "完美的生物矿物！老奶奶很珍惜它的样子。",-- 物品名:"珍珠的珍珠"
        HERMIT_CRACKED_PEARL = "结构完整性被破坏了……麦哲伦不是故意的！",-- 物品名:"开裂珍珠"

        -- 深海扩展相关(麻烦之海更新)
        WATERPLANT = "具有防御机制的水生植物，不要被缠住哦。",-- 物品名:"海草"
        WATERPLANT_BOMB = "小心！它发射了种子炸弹！",-- 物品名:"种壳"
        WATERPLANT_BABY = "这只是个小嫩芽，还在生长期。",-- 物品名:"海芽"
        WATERPLANT_PLANTER = "要种在石头上吗？特殊的种植基质。",-- 物品名:"海芽插穗"

        SHARK = "顶级掠食者出现！启动紧急回避方案！",-- 物品名:"岩石大白鲨"

        MASTUPGRADE_LAMP_ITEM = "辅助照明系统，这样夜间作业也很安全。",-- 物品名:"甲板照明灯" 制造描述:"桅杆照明附件。"
        MASTUPGRADE_LIGHTNINGROD_ITEM = "防雷击保护装置，在海上探险安全第一！",-- 物品名:"避雷导线" 制造描述:"为你的桅杆带来过电般的刺激。"

        WATERPUMP = "高压水泵？着火了可以用这个灭火！",-- 物品名:"消防泵" 制造描述:"水水水，到处都是水！"

        BARNACLE = "长在石头上的藤壶，附着力很强。",-- 物品名:"藤壶"
        BARNACLE_COOKED = "煮熟了，口感像贝类吗？",-- 物品名:"熟藤壶"

        BARNACLEPITA = "看起来很好吃的面饼，营养均衡！",-- 物品名:"藤壶皮塔饼"
        BARNACLESUSHI = "又是寿司！麦哲伦最喜欢这种冷加工的食物了！",-- 物品名:"藤壶握寿司"
        BARNACLINGUINE = "面条！吸溜吸溜~",-- 物品名:"藤壶中细面"
        BARNACLESTUFFEDFISHHEAD = "虽然是鱼头……但里面的馅料闻起来不错。",-- 物品名:"酿鱼头"

        LEAFLOAF = "植物蛋白凝胶？好神奇的口感。",-- 物品名:"叶肉糕"
        LEAFYMEATBURGER = "植物蛋白合成的汉堡？口感简直和肉一模一样！",-- 物品名:"素食堡"
        LEAFYMEATSOUFFLE = "软软的，像云朵一样，还是甜味的？",-- 物品名:"果冻沙拉"
        MEATYSALAD = "不仅有肉，还有很多蔬菜，很健康！",-- 物品名:"牛肉绿叶菜"

        -- 洞穴相关
		MOLEBAT = "长得像鼹鼠的蝙蝠？这在分类学上该怎么算呢？",-- 物品名:"裸鼹蝠"
        MOLEBATHILL = "它们的巢穴结构通向地下深处吗？真想钻进去看看！",-- 物品名:"裸鼹蝠丘"

        BATNOSE = "这是……那种蝙蝠的嗅觉器官？构造很有趣。",-- 物品名:"裸露鼻孔"
        BATNOSE_COOKED = "烤熟的鼻子……虽然是蛋白质，但心理上有点难以接受。",-- 物品名:"炭烤鼻孔"
        BATNOSEHAT = "用鼻子做的帽子？戴上会拥有特殊的嗅觉吗？",-- 物品名:"牛奶帽"

        MUSHGNOME = "拥有拟态能力的真菌生物？太神奇了！",-- 物品名:"蘑菇地精"

        SPORE_MOON = "发光的孢子，就像地下的星星一样。",-- 物品名:"月亮孢子"

        MOON_CAP = "月球上的蘑菇！摘一个！",-- 物品名:"月亮蘑菇"
        MOON_CAP_COOKED = "煮熟了之后荧光反应消失了呢。",-- 物品名:"熟月亮蘑菇"

        MUSHTREE_MOON = "已经完全木质化的巨型真菌，不可思议。",-- 物品名:"月亮蘑菇树"

        LIGHTFLIER = "发光的小虫子，就像会飞的灯泡一样！",-- 物品名:"球状光虫"

        GROTTO_POOL_BIG = "富含发光矿物质的地下水源，好美啊。",-- 物品名:"玻璃绿洲"
        GROTTO_POOL_SMALL = "小小的发光水池，像宝石一样。",-- 物品名:"小玻璃绿洲"

        DUSTMOTH = "以灰尘为食的小蛾子？简直就是活体吸尘器！好乖！",-- 物品名:"尘蛾"

        DUSTMOTHDEN = "它们的巢穴非常整洁，真是爱干净的好孩子。",-- 物品名:"整洁洞穴"

        ARCHIVE_LOCKBOX = "这里面储存着古代的知识吗？好想破解看看！",-- 物品名:"蒸馏的知识"
        ARCHIVE_CENTIPEDE = "自动化的防御机制！小心它的激光！",-- 物品名:"远古哨兵蜈蚣"     --《夺宝奇兵》剧情致敬
        ARCHIVE_CENTIPEDE_HUSK = "这层外壳具有很高的硬度和耐热性。",-- 物品名:"哨兵蜈蚣壳"

        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "古老的烹饪程序启动中……还需要一点时间。",-- 物品名:"远古窑"->饭还需要很久
            COOKING_SHORT = "快做好了！热力学结构依然完好！",-- 物品名:"远古窑"->饭快做好了
            DONE = "嗯！古代的美食完成了！",-- 物品名:"远古窑"->完成了
            EMPTY = "古代的锅子，还能用吗？我想试试！",-- 物品名:"远古窑"
            BURNT = "过载了吗？锅子烧坏了。",-- 物品名:"远古窑"->烧焦的
        },

        ARCHIVE_MOON_STATUE = "月亮的雕像，散发着庄严的气息。",-- 物品名:"远古月亮雕像"
        ARCHIVE_RUNE_STATUE =--符文石有三种贴图，每个贴图随机，检查文字也随机，一共有五种检查文案
        {
            LINE_1 = "这些符号……是某种古代的源石技艺记录吗？",-- 物品名:"远古月亮符文石"->第一行
            LINE_2 = "经历了这么久，它们依然没有被暗影侵蚀。",-- 物品名:"远古月亮符文石"->第二行
            LINE_3 = "这些文字……即使是麦哲伦也看不懂呢。",-- 物品名:"远古月亮符文石"->第三行
            LINE_4 = "如果博士在这里，一定能解开这个谜题吧。",-- 物品名:"远古月亮符文石"->第四行
            LINE_5 = "记载中提到的月亮……是我们看到的那个吗？",-- 物品名:"远古月亮符文石"->第五行
        },
        VAULT_RUNE = "无法解读的加密信息……博士能看懂吗？",--圣殿月符石（无面具查看）
		VAULT_STATUE =--圣殿雕像
		{
			LORE1 = "“实验结果符合预期。”……这是某种研究日志吗？",
			LORE2 = "“我清楚后果，但我无法控制变量。”……听起来像是一场失败的实验。",
			LORE3 = "“为了追求真理，不惜一切代价。”……这就是科学家的执着吗？",
		},

        ARCHIVE_RESONATOR = {
            GENERIC = "星象探测仪？这是古代人的天文台吗？",-- 物品名:"星象探测仪"->默认
            IDLE = "它处于待机状态。",-- 物品名:"星象探测仪"->无指向物品（世界上没有可发现天体贡品时）
        },

        ARCHIVE_RESONATOR_ITEM = "用来探测未知信号的装置。",-- 物品名:"星象探测仪" 制造描述:"它会出土什么秘密呢？"

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "能源切断了，无法工作。",-- 物品名:"知识饮水机"->没电状态
          GENERIC =  "系统正在运行中？",-- 物品名:"知识饮水机"->通电状态
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "中央控制终端已关闭。",-- 物品名:"远古哨所"->没电状态
            GENERIC = "看起来可以控制这里的防御系统。",-- 物品名:"远古哨所"->通电状态
        },

        ARCHIVE_SECURITY_PULSE = "跟着这个光球走！它在指引我们！",-- 物品名:"远古哨所（的能量球）"

        ARCHIVE_SWITCH = {
            VALID = "能源核心植入，系统启动！",-- 物品名:"华丽基座"->有效
            GEMS = "提示需要插入特定的晶体单元。",-- 物品名:"华丽基座"->需要宝石
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "传送门处于离线状态。",-- 物品名:"封印的传送门"->没电状态
            GENERIC = "能源供应正常，但是……门被锁死了。",-- 物品名:"封印的传送门"->通电状态
        },

        WALL_STONE_2 = "结构并没有因为时间的流逝而脆弱。",-- 物品名:"档案馆石墙"
        WALL_RUINS_2 = "古代的墙壁，记录着历史的痕迹。",-- 物品名:"档案馆铥墙"

        REFINED_DUST = "阿嚏！高密度的灰尘块……为什么要收集这个？",-- 物品名:"尘土块" 制造描述:"远古甜品的关键原料。"
        DUSTMERINGUE = "真的要吃这个吗？感觉像是在吃土……虽然看起来很精致。",-- 物品名:"琥珀美食"

        SHROOMCAKE = "用这种蘑菇做的蛋糕……吃了真的不会晕倒吗？",-- 物品名:"蘑菇蛋糕"
        SHROOMBAIT = "闻起来充满了孢子味，让人昏昏欲睡……",-- 物品名:"酿夜帽"

        NIGHTMAREGROWTH = "这些墙壁……散发着让人不舒服的波动。",-- 物品名:"梦魇城墙"

        TURFCRAFTINGSTATION = "地形改造模块！我们可以随心所欲地建设基地了！",-- 物品名:"土地夯实器" 制造描述:"一点点的改变世界。"

        MOON_ALTAR_LINK = "它在发光，似乎与某种高维能量产生了共鸣。",-- 物品名:"神秘能量"

        -- 农耕相关
        COMPOSTINGBIN =
        {
            GENERIC = "虽然有点臭，但是这是生态循环的重要一环哦！",-- 物品名:"堆肥桶"->默认 制造描述:"能让土壤变得臭烘烘和肥沃。"
            WET = "湿度过高，需要添加干料。",-- 物品名:"堆肥桶"->过湿
            DRY = "湿度不足，微生物活性会降低的。",-- 物品名:"堆肥桶"->过干
            BALANCED = "完美的配比！发酵效率最高！",-- 物品名:"堆肥桶"->干湿合适
            BURNT = "呜……变得更臭了……而且数据也没了。",-- 物品名:"堆肥桶"->烧焦的
        },
        COMPOST = "植物的营养午餐。",-- 物品名:"堆肥"
        SOIL_AMENDER =
		{
			GENERIC = "让土地变得更有营养吧！这就是科学种田！",-- 物品名:"催长剂起子"->默认 制造描述:"海里来的瓶装养分。"
			STALE = "发酵反应开始了。",-- 物品名:"催长剂起子"->发酵了（黄了）
			SPOILED = "虽然味道不好闻，但是营养价值很高哦。",-- 物品名:"催长剂起子"->腐烂了（红了）
		},

		SOIL_AMENDER_FERMENTED = "超级营养剂！植物一定会喜欢的！",-- 物品名:"超级催长剂"

        WATERINGCAN =
        {
            GENERIC = "给花花草草补充水分！要喝饱哦。",-- 物品名:"空浇水壶"->默认 制造描述:"让植物保持快乐和水分。"
            EMPTY = "水源耗尽，需要补充。",-- 物品名:"空浇水壶"->没水 --空水壶有水就成浇水壶了，所以上面那句好像没用
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "仿生设计的水壶，很有艺术感！",-- 物品名:"空鸟嘴壶"->默认 制造描述:"灌溉方面的创新!"
            EMPTY = "要喂它喝水它才能工作哦。",-- 物品名:"空鸟嘴壶" --这个好像也是上面那句没用
        },

		FARM_PLOW = "要把土翻松，植物的根系才能呼吸。",-- 物品名:"耕地机"->犁地状态
		FARM_PLOW_ITEM = "机械化耕作设备。",-- 物品名:"耕地机" 制造描述:"为你的植物犁一块地。"
		FARM_HOE = "嘿咻！嘿咻！翻土这种体力活就交给麦哲伦吧！",-- 物品名:"园艺锄" 制造描述:"翻耕，为撒播农作物做准备。"
		GOLDEN_FARM_HOE = "金闪闪的锄头！用起来感觉更有力气了！",-- 物品名:"黄金园艺锄" 制造描述:"优雅地耕地。"
		NUTRIENTSGOGGLESHAT = "戴上这个就能看到土壤的营养成分吗？好先进的设备！",-- 物品名:"高级耕作先驱帽" 制造描述:"让你看到一个成功的花园。"
		PLANTREGISTRYHAT = "带上这个，我也是专业的植物学家了！",-- 物品名:"耕作先驱帽" 制造描述:"让你的园艺专业知识得到增长。"

        FARM_SOIL_DEBRIS = "田间管理第一步，清理杂物！",-- 物品名:"农田杂物"

		FIRENETTLES = "是火荨麻！碰到会引起皮肤灼伤，要小心！",-- 物品名:"火荨麻叶"
		FORGETMELOTS = "勿忘我……麦哲伦永远不会忘记大家，也不会忘记这里的一切。",-- 物品名:"必忘我"
		SWEETTEA = "喝杯茶，整理一下实验数据吧。",-- 物品名:"舒缓茶"
		TILLWEED = "这是会和农作物争夺养分的杂草，必须清除。",-- 物品名:"犁地草"
		TILLWEEDSALVE = "痛痛飞走！……嘿嘿，这是小时候妈妈教我的咒语哦。",-- 物品名:"犁地草膏" 制造描述:"慢慢去处病痛。"      --《原神》瑶瑶台词致敬，可爱捏
        WEED_IVY = "这种植物具有缠绕性，会妨碍作物生长。",-- 物品名:"刺针旋花"
        IVY_SNARE = "不要缠住麦哲伦！放开我！",-- 物品名:"缠绕根须" --旋花产生物

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "让我看看大家的劳动成果！",-- 物品名:"农产品秤"->默认 制造描述:"称量你珍贵的水果和蔬菜。"
			HAS_ITEM = "重量：{weight}\n收获于第{day}天\n不错不错！",-- 物品名:"农产品秤"->巨大作物，但不算重
			HAS_ITEM_HEAVY = "重量：{weight}\n收获于第{day}天\n哇！超级大！",-- 物品名:"农产品秤"->重巨大作物
            HAS_ITEM_LIGHT = "虽然小小的，但也凝聚了心血呢。",-- 物品名:"农产品秤"->不够重（摆的小作物）
			BURNING = "着火了！快救火！",-- 物品名:"农产品秤"->正在燃烧
			BURNT = "珍贵的作物和秤都……",-- 物品名:"农产品秤"->烧焦的
        },

        CARROT_OVERSIZED = "好大的胡萝卜！可以吃很久！",-- 物品名:"巨型胡萝卜"
        CORN_OVERSIZED = "巨大的玉米！看起来很好吃。",-- 物品名:"巨型玉米"
        PUMPKIN_OVERSIZED = "可以做成南瓜马车吗？童话里都是骗人的吗？",-- 物品名:"巨型南瓜"
        EGGPLANT_OVERSIZED = "好大的茄子！颜色很漂亮。",-- 物品名:"巨型茄子"
        DURIAN_OVERSIZED = "虽然气味浓烈，但是体型巨大！",-- 物品名:"巨型榴莲"
        POMEGRANATE_OVERSIZED = "巨大的石榴！里面的籽一定很多。",-- 物品名:"巨型石榴"
        DRAGONFRUIT_OVERSIZED = "好大的火龙果！可以做很多派。",-- 物品名:"巨型火龙果"
        WATERMELON_OVERSIZED = "这么大的西瓜，足够开一场派对了！",-- 物品名:"巨型西瓜"        --华强买瓜名梗致敬“哎哎豪啊！”
        TOMATO_OVERSIZED = "巨大的番茄！",-- 物品名:"巨型番茄"
        POTATO_OVERSIZED = "巨大的土豆！是麦哲伦最爱的碳水化合物！",-- 物品名:"巨型土豆"
        ASPARAGUS_OVERSIZED = "巨大的芦笋！",-- 物品名:"巨型芦笋"
        ONION_OVERSIZED = "巨大的洋葱！切开的时候要戴护目镜才行。",-- 物品名:"巨型洋葱"
        GARLIC_OVERSIZED = "巨大的大蒜！",-- 物品名:"巨型大蒜"
        PEPPER_OVERSIZED = "巨大的辣椒！感觉会非常辣！",-- 物品名:"巨型辣椒"

        VEGGIE_OVERSIZED_ROTTEN = "烂掉了……可惜了这么大的作物。",-- 物品名:"烂掉的巨大作物（是个巨大作物烂掉都是用这句）"

		FARM_PLANT =
		{
			GENERIC = "快快长大吧~",-- 物品名:农作物（貌似是旧版农场的）
			SEED = "种子宝宝，要加油哦。",-- 物品名:种下的种子，新版作物种子形态都是用这句
			GROWING = "麦哲伦会好好照顾你的。",-- 物品名:农作物，种子发芽后没熟都是这句
			FULL = "成熟了！可以摘啦！",-- 物品名:长成（小型作物）
			ROTTEN = "对不起……麦哲伦太忙了，忘记照顾你……",-- 物品名:腐烂的作物
			FULL_OVERSIZED = "哇！这是什么原理？长得这么大！",-- 物品名:巨大作物(这部分都是田里的应该不用我说了吧)
			ROTTEN_OVERSIZED = "这么大的蔬菜烂掉了……真可惜。",-- 物品名:腐烂的巨大作物
			FULL_WEED = "这株植物看起来不像作物……",-- 物品名:杂草       --有时候会主动养杂草，所以后面写的是问号

			BURNING = "不要烧起来！我的实验田！",-- 物品名:植物（燃烧状态）
		},

        FRUITFLY = "是某种巨型果蝇吗？会对实验田造成威胁！",-- 物品名:"果蝇"
        LORDFRUITFLY = "果蝇群体的首领？必须优先排除！",-- 物品名:"果蝇王"      --对老爹说话的模仿，算是个致敬梗吧
        FRIENDLYFRUITFLY = "这只……好像被驯化了？可以用来照顾植物呢。",-- 物品名:"友好果蝇"
        FRUITFLYFRUIT = "它好像很喜欢这个果子，这是费洛蒙诱导吗？",-- 物品名:"友好果蝇果"

        SEEDPOUCH = "把种子分类装好，方便取用。",-- 物品名:"种子袋" 制造描述:"妥善保管好种子。"

		--鸦年华
		CARNIVAL_HOST = "乌鸦先生！庆典开始了吗？",-- 物品名:"良羽鸦"
		CARNIVAL_CROWKID = "小乌鸦，要一起玩吗？",-- 物品名:"小乌鸦"
		CARNIVAL_GAMETOKEN = "游戏代币！要把所有项目都玩一遍！",-- 物品名:"鸦年华代币" 制造描述:"购买代币，玩游戏，赢取奖品！"
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "赢到一张奖券！",-- 物品名:"奖票"->1张
			GENERIC_SMALLSTACK = "有好几张奖券！离大奖更近了一步！",-- 物品名:"奖票"->2-5张
			GENERIC_LARGESTACK = "这么多奖券！可以换那个最大的礼物吗？",-- 物品名:"奖票"->5张以上（不包括5）
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "小鸟饿了吗？张大嘴巴哦！",-- 物品名:"饥饿乌鸦"（鸦年华游戏物品）
		CARNIVALGAME_FEEDCHICKS_STATION =--上面那个是洞，这部分是出头鸟部分
		{
			GENERIC = "要投币才能启动游戏，这是规则。",-- 物品名:"鸟鸟吃虫虫"->未激活
			PLAYING = "喂食模拟开始！考验反应速度的时候到了！",-- 物品名:"鸟鸟吃虫虫"->已激活
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "搭建游戏的工具包，看起来很精密。",-- 物品名:"鸟鸟吃虫虫套装" 制造描述:"小鸟吃虫！"
		CARNIVALGAME_FEEDCHICKS_FOOD = "虽然是虫子……但是也是重要的蛋白质来源。",-- 物品名:"蛴螬" --游戏虫子（小鸟吃虫游戏的）

		CARNIVALGAME_MEMORY_KIT = "搭建游戏的工具包，记忆力训练设备。",-- 物品名:"篮中蛋套装" 制造描述:"在你的蛋孵化前数清楚数量。"
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "只要投币就能测试记忆力。",-- 物品名:"篮中蛋"->未激活
			PLAYING = "麦哲伦的记忆力可是很好的！绝对不会记错！",-- 物品名:"篮中蛋"->已激活
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "未知的变量……要翻开哪一张呢？",-- 物品名:"蛋篮"->未激活
			PLAYING = "To turn or not to turn... 这是一个问题。",-- 物品名:"蛋篮"->已激活       --《哈姆雷特》？经典名言致敬
		},

		CARNIVALGAME_HERDING_KIT = "搭建游戏的工具包，运动神经测试设备。",-- 物品名:"追蛋套装" 制造描述:"追回失控的蛋。"
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "投币后开始追踪任务。",-- 物品名:"追蛋"->未激活
			PLAYING = "目标锁定！别跑！",-- 物品名:"追蛋"->已激活
		},
		CARNIVALGAME_HERDING_CHICK = "捕捉目标确认！",-- 物品名:"追蛋" ->游戏物品

		CARNIVALGAME_SHOOTING_KIT = "搭建游戏的工具包，射击精度测试设备。",-- 物品名:"保卫鸟巢套装" 制造描述:"防止害虫进入巢穴。"
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "投币后开启靶场模式。",-- 物品名:"保卫鸟巢"->未激活
			PLAYING = "弹道计算完毕……发射！",-- 物品名:"保卫鸟巢"->已激活
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "那就是敌对目标吗？",-- 物品名:"射击靶"->未激活
			PLAYING = "发现目标！正在进行火力打击！",-- 物品名:"射击靶"->已激活
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "激活按钮。",-- 物品名:"按钮"->未激活
			PLAYING = "Fire！！",-- 物品名:"按钮"->已激活
		},

		CARNIVALGAME_WHEELSPIN_KIT = "搭建游戏的工具包，概率学实验设备。",-- 物品名:"布谷鸟转盘套装" 制造描述:"旋转然后胜利。"
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "投币来验证你的运势。",-- 物品名:"布谷鸟转盘"->未激活
			PLAYING = "这就是概率论的实践吗？转起来吧！",-- 物品名:"布谷鸟转盘"->已激活
		},

		CARNIVALGAME_PUCKDROP_KIT = "搭建游戏的工具包，物理碰撞实验设备。",-- 物品名:"鸟房落球套装" 制造描述:"把球安全地弹到它的窝里。"
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "投币开始实验。",-- 物品名:"鸟房落球"->未激活
			PLAYING = "利用重力加速度……球球进洞吧！",-- 物品名:"鸟房落球"->已激活
		},

		CARNIVAL_PRIZEBOOTH_KIT = "兑换奖励的终端！",-- 物品名:"奖品摊位套装" 制造描述:"看看有什么奖品。"
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "好多奖品！麦哲伦想要那个！还有那个！",-- 物品名:"奖品摊位"->放置状态
		},

		CARNIVALCANNON_KIT = "可以放烟花吗？虽然原理可能不太一样。",-- 物品名:"亮片大炮套装"
		CARNIVALCANNON =
		{
			GENERIC = "好大的大炮！是用来发射庆典彩带的吗？",-- 物品名:亮片大炮套装（放置）闲置状态
			COOLDOWN = "过热冷却中……请稍候。",-- 物品名:亮片大炮套装激活状态
		},

		CARNIVAL_PLAZA_KIT = "庆典的核心组件！",-- 物品名:"鸦年华树苗(物品状态)" 制造描述:"鸦年华不可或缺的中间物件。"
		CARNIVAL_PLAZA =
		{
			GENERIC = "需要更多的装饰能量才能成长。",-- 物品名:"鸦年华树"->刚种下去
			LEVEL_2 = "再装饰一下会更好看！庆典气氛渐渐浓厚了！",-- 物品名:"鸦年华树"->二级
			LEVEL_3 = "好漂亮的树！这就是庆典的完全体吗？",-- 物品名:"鸦年华树"->三级
		},

		CARNIVALDECOR_EGGRIDE_KIT = "好期待里面的奖品！会是隐藏款吗？",-- 物品名:鸦年华兑换的奖品装饰（多物品通用）
		CARNIVALDECOR_EGGRIDE = "麦哲伦会一直看着它的！它是我的骄傲！",-- 物品名:放置的奖品装饰（多物品通用）     --美队经典台词致敬

		CARNIVALDECOR_LAMP_KIT = "照明组件，可以增加氛围感。",-- 物品名:"盛夏夜灯套装" 制造描述:"夏夜的梦幻之光。"
		CARNIVALDECOR_LAMP = "亮晶晶的！像星星一样！",-- 物品名:"盛夏夜灯"
		CARNIVALDECOR_PLANT_KIT = "微型生态景观。",-- 物品名:"微型树套装" 制造描述:"一小块鸦年华。"
		CARNIVALDECOR_PLANT = "好可爱的小树！这是盆景艺术吗？",-- 物品名:"微型树"
		CARNIVALDECOR_BANNER_KIT = "光学反射装置……啊，是彩旗！",-- 物品名:"光线捕捉器套装" 制造描述:"枝头挂着闪光的小饰品。"
		CARNIVALDECOR_BANNER = "闪闪发光！",-- 物品名:"光线捕捉器"

		CARNIVALDECOR_FIGURE =
		{
			RARE = "哇！是SSR！……不对，是稀有款！",-- 物品名:未找到
			UNCOMMON = "这个也不常见呢，算好运吗？",-- 物品名:未找到
			GENERIC = "这个款式已经有很多了……",-- 物品名:鸦年华盲盒物件，貌似除了这个另外俩我没见过，可能脸太黑了
		},
		CARNIVALDECOR_FIGURE_KIT = "绿色神秘盒子，里面会有什么呢？",-- 物品名:"绿色神秘盒子" 制造描述:"这个神秘的绿盒子里会有什么呢？"
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "金色的盒子！感觉会有好东西！",-- 物品名:"金色神秘盒子" 制造描述:"这个神秘的金盒子里会有什么呢？"

        CARNIVAL_BALL = "红色的球球！弹性很好！", --unimplemented		-- 物品名:"发光红球" 制造描述:"保证你有球必应！"
		CARNIVAL_SEEDPACKET = "好吃的种子！虽然是零食，但也很有营养。",-- 物品名:"种子包" 制造描述:"鸦年华最爱的香脆小吃。"
		CARNIVALFOOD_CORNTEA = "玉米做的饮料？喝起来很清爽！",-- 物品名:"玉米泥" 制造描述:"出乎意料的清爽！"

        CARNIVAL_VEST_A = "好温暖的围巾，用树叶编织的工艺很精湛。",-- 物品名:"叽叽喳喳围巾" 制造描述:"用捡来的树叶做成的异想天开的围巾。"
        CARNIVAL_VEST_B = "穿上就像伪装成了一片树叶！",-- 物品名:"叽叽喳喳斗篷" 制造描述:"这东西确实值得称道。"
        CARNIVAL_VEST_C = "小小的披肩，适合在这个季节穿。",-- 物品名:"叽叽喳喳小披肩" 制造描述:"鸦年华游客的必备小披肩。"

        -- 皮弗娄牛年（YOTB，Year of the Beefalo）
        YOTB_SEWINGMACHINE = "纺织工程设备！通过缝纫也能创造奇迹！",-- 物品名:"缝纫机"
        YOTB_SEWINGMACHINE_ITEM = "需要进行组装才能使用。",-- 物品名:"缝纫机套装" 制造描述:"做出完美的皮弗娄牛礼服吧。"
        YOTB_STAGE = "舞台搭建完毕，这里就是检验成果的战场！",-- 物品名:"裁判席"
        YOTB_POST =  "比赛要开始了！选手请就位！",-- 物品名:"皮弗娄牛舞台"
        YOTB_STAGE_ITEM = "裁判席，要请专家来评分吗？",-- 物品名:"裁判席" 制造描述:"邀请专家出席。"
        YOTB_POST_ITEM =  "舞台组件。",-- 物品名:"皮弗娄牛舞台" 制造描述:"让你的皮弗娄牛登上舞台中央。"


        YOTB_PATTERN_FRAGMENT_1 = "可以拼成漂亮的衣服！这是设计图的一部分。",-- 物品名:"恐怖款式碎片" 制造描述:"来一点恐怖的灵感。"
        YOTB_PATTERN_FRAGMENT_2 = "可以拼成漂亮的衣服！收集碎片也是乐趣之一。",-- 物品名:"正式款式碎片" 制造描述:"来一点正式的灵感。"
        YOTB_PATTERN_FRAGMENT_3 = "可以拼成漂亮的衣服！快把剩下的找出来！",-- 物品名:"喜庆款式碎片" 制造描述:"来一点喜庆的灵感。"

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"战士皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"战士皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"娃娃皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"娃娃皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"喜庆皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"喜庆皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"花朵皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"花朵皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"铁甲皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"铁甲皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"寒霜皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"寒霜皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"正式皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"正式皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"维多利亚皮弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"维多利亚皮弗娄牛玩偶"->一般用这句
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "好软的玩偶！确认为完美的解压道具！",-- 物品名:"幸运兽弗娄牛玩偶"->默认
            YOTB = "评委老师会喜欢这种设计风格吗？",-- 物品名:"幸运兽弗娄牛玩偶"->一般用这句
        },

        WAR_BLUEPRINT = "看起来很厉害！战术风格的设计图！",-- 物品名:"战士礼服款式"
        DOLL_BLUEPRINT = "一定很可爱！这种风格我很喜欢！",-- 物品名:"娃娃礼服款式"
        FESTIVE_BLUEPRINT = "好喜庆的衣服！很有节日气氛。",-- 物品名:"节日盛装款式"
        ROBOT_BLUEPRINT = "像机器人一样！充满了科技感。",-- 物品名:"铁甲礼服款式"
        NATURE_BLUEPRINT = "用花朵做装饰！回归自然的设计。",-- 物品名:"花朵礼服款式"
        FORMAL_BLUEPRINT = "很正式的衣服呢，适合出席重要场合。",-- 物品名:"正式礼服款式"
        VICTORIAN_BLUEPRINT = "复古的风格，很有历史积淀感。",-- 物品名:"维多利亚礼服款式"
        ICE_BLUEPRINT = "看起来很冷……但是很优雅。",-- 物品名:"寒霜礼服款式"
        BEAST_BLUEPRINT = "相信这个设计一定能带来好运！",-- 物品名:"幸运兽礼服款式"

        BEEF_BELL = "摇一摇，声波会吸引皮弗娄牛。",-- 物品名:"皮弗娄牛铃" 制造描述:"与皮弗娄牛交朋友。"

		-- 浣猫年活动（YOTB Catcoon）
		KITCOONDEN =
		{
			GENERIC = "小猫咪的家！不对，是浣猫幼崽的巢穴。",-- 物品名:"小浣猫托儿所"->默认
            BURNT = "不——！观测点被破坏了！",-- 物品名:"小浣猫托儿所"->烧焦的
			PLAYING_HIDEANDSEEK = "捉迷藏开始！藏在哪里了呢？",-- 物品名:"小浣猫托儿所"->捉迷藏开始，但很久没找到猫
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "搜救任务即将超时！快出来吧！",-- 物品名:"小浣猫托儿所"->捉迷藏即将结束但还有很多没找到
		},

		KITCOONDEN_KIT = "给小猫咪盖房子，为了更好地观察它们。",-- 物品名:"小浣猫托儿所套装" 制造描述:"各种条纹浣猫的家园。"

		TICOON =
		{
			GENERIC = "大老虎！它是专业的追踪专家！",-- 物品名:"大虎"->默认
			ABANDONED = "它下班了吗？好吧，我自己也可以找到！",-- 物品名:"大虎"->大虎下班
			SUCCESS = "目标发现！干得好！",-- 物品名:"大虎"->成功找到
			LOST_TRACK = "被抢先了……下次要更快一点。",-- 物品名:"大虎"->大虎目标被别人找到
			NEARBY = "信号反应……就在附近！",-- 物品名:"大虎"->大虎到达目标附近
			TRACKING = "跟随向导，前进！",-- 物品名:"大虎"->大虎等待
			TRACKING_NOT_MINE = "它在协助其他的探员。",-- 物品名:"大虎"->大虎已有对象雇佣
			NOTHING_TO_TRACK = "附近没有搜索目标。",-- 物品名:"大虎"->无可寻找小猫
			TARGET_TOO_FAR_AWAY = "目标超出感知范围。",-- 物品名:"大虎"->目标过远
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "供奉点？该准备什么特定物资呢？",-- 物品名:"浣猫神龛"->默认 制造描述:"供奉无踪之浣猫。"
            EMPTY = "它好像需要羽毛……",-- 物品名:"浣猫神龛" 制造描述:"供奉无踪之浣猫。"
            BURNT = "糟糕……坏掉了。",-- 物品名:"浣猫神龛"->烧焦的 制造描述:"供奉无踪之浣猫。"
        },

		KITCOON_FOREST = "发现森林亚种！记录：可爱度极高！",-- 物品名:"小浣猫（绿色的）"
		KITCOON_SAVANNA = "发现热带草原亚种！毛色很鲜艳！",-- 物品名:"小浣猫（大橘）"
		KITCOON_MARSH = "发现沼泽亚种！要注意卫生哦。",-- 物品名:"小浣猫（紫色的）"
		KITCOON_DECIDUOUS = "发现桦栗林亚种！经典的配色！",-- 物品名:"小浣猫（浣熊猫配色）"
		KITCOON_GRASS = "发现草地亚种！很好的伪装色。",-- 物品名:"小浣猫（黄色）"
		KITCOON_ROCKY = "发现矿区亚种！像小石头一样。",-- 物品名:"小浣猫（黑灰）"
		KITCOON_DESERT = "发现沙漠亚种！看起来很耐热。",-- 物品名:"小浣猫（沙漠黄）"
		KITCOON_MOON = "发现月球亚种！……真的是猫吗？",-- 物品名:"小浣猫（剑齿虎bushi)"
		KITCOON_YOT = "哇！特别的猫咪！招财猫？",-- 物品名:"小浣猫（招财猫，最后托儿所领的那只）"

        -- 月亮风暴（Moon Storm）
        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "检测到高能读数！目标具有攻击性！",-- 物品名:"天体英雄"->默认
            DEAD = "威胁已解除！",-- 物品名:"天体英雄"->死了      --《荒野乱斗》露米台词致敬
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "能量信号在波动……它进化了！",-- 物品名:"天体英雄（二阶段）"->默认
            DEAD = "还没有彻底击败！",-- 物品名:"天体英雄（二阶段）"->死了        --《荒野乱斗》露米台词致敬
        },
        ALTERGUARDIAN_PHASE2SPIKE = "小心！是高密度的尖刺！",-- 物品名:"月光玻璃尖刺"
        ALTERGUARDIAN_PHASE3 = "最终形态确认！全力以赴吧！",-- 物品名:"天体英雄（三阶段）"      --华强经典台词致敬
        ALTERGUARDIAN_PHASE3TRAP = "千万不能睡着！",-- 物品名:"启迪陷阱"
        ALTERGUARDIAN_PHASE3DEADORB = "它变成球体了？",-- 物品名:"天体英雄（三阶段去世）"
        ALTERGUARDIAN_PHASE3DEAD = "终于……结束了。采集数据的时候到了。",-- 物品名:"被击败的天体英雄（三阶段去世且可开采）"      --《皇室战争》刺客首领台词致敬

        ALTERGUARDIANHAT = "认知增强装置？还是单纯的幻觉？",-- 物品名:"启迪之冠"
        ALTERGUARDIANHATSHARD = "亮晶晶的碎片，蕴含着奇怪的能量。",-- 物品名:"启迪碎片"

        MOONSTORM_GLASS = {--风暴中的注能矿
            GENERIC = "玻璃状的物质。",-- 物品名:"充能玻璃石"->默认
            INFUSED = "里面储存着不稳定的能量！"-- 物品名:"充能玻璃石"->一般是这句有用，上面那个不知道干嘛的
        },

        MOONSTORM_STATIC = "游离的电荷！",-- 物品名:"能量静电"
        MOONSTORM_STATIC_ITEM = "抓住了！",-- 物品名:"约束静电"
        MOONSTORM_STATIC_ROAMER = "别跑！我要记录你的参数！",-- 物品名:"未约束静电"     --《鬼泣》名场面台词致敬
        MOONSTORM_SPARK = "像萤火虫一样，但是是光能量。",-- 物品名:"月熠"

        BIRD_MUTANT = "因为月能而发生了异变……记录下来。",-- 物品名:"月盲乌鸦"
        BIRD_MUTANT_SPITTER = "保持距离！它会喷射腐蚀性液体！",-- 物品名:"奇形鸟"

        WAGSTAFF_NPC = "老先生？这种投影技术很不稳定。",-- 物品名:"颗粒状传输"->一般状态

        WAGSTAFF_NPC_MUTATIONS = "科学的力量真是令人大开眼界！",-- 物品名:"颗粒状传输"->击败新三王
        WAGSTAFF_NPC_WAGPUNK = "信号丢失了？",-- 这段貌似没有用到，至少我没见过，反正也是传输

        ALTERGUARDIAN_CONTAINED = "它被封印在里面了！",-- 物品名:"月亮精华提取器"

        WAGSTAFF_TOOL_1 = "校准用的吗？精密的仪器。",-- 物品名:"网状缓冲器"
        WAGSTAFF_TOOL_2 = "用来清除沉积物的工具？",-- 物品名:"装置除垢器"
        WAGSTAFF_TOOL_3 = "看起来像是用来开槽的。",-- 物品名:"垫圈开槽器"
        WAGSTAFF_TOOL_4 = "某种清理刷？",-- 物品名:"概念刷洗器"
        WAGSTAFF_TOOL_5 = "虽然看不懂原理，但感觉很厉害呢！",-- 物品名:"校准观察机"

        MOONSTORM_GOGGLESHAT = "通过滤镜就能看清风暴内部了吗？",-- 物品名:"星象护目镜" 制造描述:"利用土豆之眼来看清风暴。"

        MOON_DEVICE = {
            GENERIC = "它在发光！正在从月球抽取能量吗？",-- 物品名:"月亮虹吸器"->召唤天体形态
            CONSTRUCTION1 = "实验设施搭建中。",-- 物品名:"月亮虹吸器"->未完成实验（刚建成状态）
            CONSTRUCTION2 = "复杂的结构，令人着迷。",-- 物品名:"月亮虹吸器"->建造一次
        },

		-- 旺达（Wanda）
        POCKETWATCH_HEAL = {
			GENERIC = "可以让生物组织倒流回之前的状态？",-- 物品名:"不老表"->默认 制造描述:"你觉得自己是几岁，你就是几岁。"
			RECHARGING = "它在冷却中。",-- 物品名:"不老表" 制造描述:"你觉得自己是几岁，你就是几岁。"
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "逆转生命的终结……这是禁忌的技术吗？",-- 物品名:"第二次机会表"->默认 制造描述:"挽回一个朋友的不幸结局。"
			RECHARGING = "它在冷却中。",-- 物品名:"第二次机会表" 制造描述:"挽回一个朋友的不幸结局。"
		},

        POCKETWATCH_WARP = {
			GENERIC = "时空跳跃？莱茵生命还没这个课题呢！",-- 物品名:"倒走表"->默认
			RECHARGING = "充能中。",-- 物品名:"倒走表"
		},

        POCKETWATCH_RECALL = {
			GENERIC = "定位锚点回溯？",-- 物品名:"溯源表"->默认
			RECHARGING = "充能中。",-- 物品名:"溯源表"->CD中
			UNMARKED = "only_used_by_wanda",-- 物品名:"溯源表"->未标记时传送？
			MARKED_SAMESHARD = "only_used_by_wanda",-- 物品名:"溯源表"->传送相同世界
			MARKED_DIFFERENTSHARD = "only_used_by_wanda",-- 物品名:"溯源表"->传不同世界
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "制造时空裂隙？",-- 物品名:"裂缝表"->默认
			RECHARGING = "充能中。",-- 物品名:"裂缝表"->CD中
			UNMARKED = "only_used_by_wanda unmarked",-- 物品名:"裂缝表"->未标记状态
			MARKED_SAMESHARD = "only_used_by_wanda same shard",-- 物品名:"裂缝表"->传送相同世界
			MARKED_DIFFERENTSHARD = "only_used_by_wanda other shard",-- 物品名:"裂缝表"->传送不同世界
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "某种应用了谐振原理的武器？",-- 物品名:"警钟"->默认
			DEPLETED = "only_used_by_wanda",-- 物品名:"警钟"->没燃料
		},

        POCKETWATCH_PARTS = "复杂的时间装置碎片，很有研究价值！",-- 物品名:"时间碎片"
        POCKETWATCH_DISMANTLER = "精密工具组！如果是拆解工作的话，请交给莱茵生命的专业人士！",-- 物品名:"钟表匠工具"

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "稳定的虫洞？通往哪里呢？",-- 物品名:"时间裂缝"->传送相同世界
			DIFFERENTSHARD = "跨越维度的连接？",-- 物品名:"时间裂缝"->传送不同世界
		},
        POCKETWATCH_PORTAL_EXIT = "传送完成。记录：有轻微眩晕感。",-- 物品名:"时间裂缝（貌似是别人传过来时产生的传送门检查文案）"

        -- 水中木（Waterlog，官方名“高出平均值的树干”）
        WATERTREE_PILLAR = "巨大的水生植物！它的树龄一定相当惊人。",-- 物品名:"大树干"
        OCEANTREE = "这种生长形态……是为了适应海上环境吗？",-- 物品名:"疙瘩树"
        OCEANTREENUT = "里面好像有东西在动。",-- 物品名:"疙瘩树果"
        WATERTREE_ROOT = "发达的根系，注意脚下安全。",-- 物品名:"大树根"

        OCEANTREE_PILLAR = "虽然没有那棵那么巨大，但也非常有活力！",-- 物品名:"高出平均值的树干"

        OCEANVINE = "附生藤蔓植物。",-- 物品名:"苔藓藤条"
        FIG = "无花果果实。含糖量很高。",-- 物品名:"无花果"
        FIG_COOKED = "经过加热处理，风味更佳。",-- 物品名:"熟无花果"

        SPIDER_WATER = "水生蛛形纲生物！利用表面张力移动，真有趣！",-- 物品名:"海黾"
        MUTATOR_WATER = "诱导变异的物质？",-- 物品名:"海黾变身涂鸦"
        OCEANVINE_COCOON = "海黾的巢穴，悬挂结构很稳固。",-- 物品名:"海黾巢穴"
        OCEANVINE_COCOON_BURNT = "栖息地被破坏了……真可惜。",-- 物品名:"海黾巢穴"

        GRASSGATOR = "拟态伪装！差点就没发现它。",-- 物品名:"草鳄鱼"

        TREEGROWTHSOLUTION = "植物生长激素混合液？",-- 物品名:"树果酱"

        FIGATONI = "碳水化合物！是野外考察的重要能量来源！",-- 物品名:"无花果意面"
        FIGKABAB = "烧烤料理！味道不错！",-- 物品名:"无花果烤串"
        KOALEFIG_TRUNK = "虽然组合很奇怪，但营养价值看起来很高。",-- 物品名:"无花果酿象鼻"
        FROGNEWTON = "两栖类肉质与果实的结合……值得尝试。",-- 物品名:"无花果蛙腿三明治"

        -- 泰拉瑞亚联动（拉饥联动）
        TERRARIUM = {
            GENERIC = "封闭的生态系统？或者是某种亚空间？",-- 物品名:"盒中泰拉"->默认
            CRIMSON = "检测到不稳定的能量波动。",-- 物品名:"盒中泰拉"->可召唤双子眼形态
            ENABLED = "空间裂缝正在打开！大家小心！",-- 物品名:"盒中泰拉"->召唤中
			WAITING_FOR_DARK = "召唤仪式需要特定时间窗口（夜晚）。",-- 物品名:"盒中泰拉"->激活但未产生光束形态
			COOLDOWN = "设备过热，冷却中。",-- 物品名:"盒中泰拉"->冷却中
			SPAWN_DISABLED = "没有检测到任何反应。",-- 物品名:"盒中泰拉"->世界设置无召唤泰拉
        },

        -- 沃尔夫冈（Wolfgang）
        MIGHTY_GYM =
        {
            GENERIC = "动能训练设备……这对我来说太重了。",-- 物品名:"强大健身房"->默认
            BURNT = "设备损坏了。",-- 物品名:"强大健身房"->烧焦的
        },

        DUMBBELL = "比起举重，我更喜欢野外考察带来的锻炼效果。",-- 物品名:"哑铃"
        DUMBBELL_GOLDEN = "密度很高的金属器材……这是为了训练吗？",-- 物品名:"黄金哑铃"
		DUMBBELL_MARBLE = "完全……拿不动。",-- 物品名:"大理石哑铃"
        DUMBBELL_GEM = "用珍贵矿物制作的？有些奢侈呢。",-- 物品名:"宝石哑铃"
        POTATOSACK = "用来作为负重的块茎植物。",-- 物品名:"土豆袋"

        DUMBBELL_HEAT = "正在散发热量，是某种放热材料吗？",-- 物品名:"热铃"
        DUMBBELL_REDGEM = "像火焰一样热情的颜色！",-- 物品名:"火铃"
        DUMBBELL_BLUEGEM = "像冰雪一样冷静的颜色！",-- 物品名:"冰铃"

        TERRARIUMCHEST =
		{
			GENERIC = "来源不明的储物箱。",-- 物品名:"显眼箱子"->默认
			BURNT = "里面的东西没事吗？",-- 物品名:"显眼箱子"->烧焦的
			SHIMMER = "独特的光学现象……",-- 物品名:"显眼箱子"
		},

		EYEMASKHAT = "它在看着我？有些毛骨悚然的防护装备。",-- 物品名:"眼面具"

        EYEOFTERROR = "巨大的眼球状生物！是变异体吗？",-- 物品名:"恐怖之眼"
        EYEOFTERROR_MINI = "小型的观察单位？",-- 物品名:"可疑窥视者"
        EYEOFTERROR_MINI_GROUNDED = "进入了休眠状态？",-- 物品名:"恐怖之蛋"

        FROZENBANANADAIQUIRI = "低温饮品！如果是夏天就太棒了！",-- 物品名:"冰香蕉冻唇蜜"
        BUNNYSTEW = "虽然兔兔很可爱，但是我不客气了！",-- 物品名:"炖兔子"
        MILKYWHITES = "某种分泌物？",-- 物品名:"乳白物"

        CRITTER_EYEOFTERROR = "虽然长得有点奇怪，但它对我没有敌意。",-- 物品名:"友好窥视者"

        SHIELDOFTERROR ="生物护盾。虽然看着有点可怕，但防御性能良好。",-- 物品名:"恐怖盾牌"
        TWINOFTERROR1 = "检测到高能激光反应！",-- 物品名:"激光眼"
        TWINOFTERROR2 = "检测到魔焰反应！",-- 物品名:"魔焰眼"

		-- 咩咩启示录联动（Cult of the Lamb）
		COTL_TRINKET = "未知的能量反应……不属于这个世界。",-- 物品名:"红眼冠"
		TURF_COTL_GOLD = "含金量很高的地皮。",-- 物品名:"黄金地板"
		TURF_COTL_BRICK = "铺设得非常整齐的砖块。",-- 物品名:"砖地板"
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "虽然微弱，但仍有光照反应。",-- 物品名:"低微咩咩雕像"
			GENERIC = "它似乎需要燃料。",-- 物品名:"低微咩咩雕像"->默认
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "能量场趋于稳定。令人安心的光芒。",-- 物品名:"有所改进咩咩雕像"
			GENERIC = "它需要燃料来维持反应。",-- 物品名:"有所改进咩咩雕像"->默认
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "高强度的光照反应！这就代表着……希望吗？",-- 物品名:"完美无瑕咩咩雕像"
			GENERIC = "它需要燃料来维持反应。",-- 物品名:"完美无瑕咩咩雕像"->默认
		},

        -- 浣猫年（Year of the Catcoon）
        CATTOY_MOUSE = "模拟猎物，小猫咪会喜欢的。",-- 物品名:"发条鼠玩具"
        KITCOON_NAMETAG = "要给它建立什么档案名呢？",-- 物品名:"小浣猫项圈"

		KITCOONDECOR1 =
        {
            GENERIC = "火羽形状的平衡玩具。",-- 物品名:"火鸡不倒翁"->默认
            BURNT = "实验失败……烧焦了。",-- 物品名:"火鸡不倒翁"->烧焦的
        },
		KITCOONDECOR2 =
        {
            GENERIC = "受重力影响会摆动，很有趣。",-- 物品名:"逗猫小鱼"->默认
            BURNT = "实验失败……烧焦了。",-- 物品名:"逗猫小鱼"->烧焦的
        },

		KITCOONDECOR1_KIT = "组装很简单！",-- 物品名:"火鸡不倒翁套装"
		KITCOONDECOR2_KIT = "我来帮忙组装吧！",-- 物品名:"逗猫小鱼套装"

        -- 机器人（WX-78）
        WX78MODULE_MAXHEALTH = "结构增强电路。能提升机体强度。",-- 物品名:"强化电路"
        WX78MODULE_MAXSANITY1 = "处理能力升级。逻辑模块优化。",-- 物品名:"处理器电路"
        WX78MODULE_MAXSANITY = "超级处理单元！智慧的结晶。",-- 物品名:"超级处理器电路"
        WX78MODULE_MOVESPEED = "马达过载！速度提升确认！",-- 物品名:"加速电路"
        WX78MODULE_MOVESPEED2 = "哇！这速度简直像无人机一样！",-- 物品名:"超级加速电路"
        WX78MODULE_HEAT = "热调节电路，运行后会产生热量。",-- 物品名:"热能电路"
        WX78MODULE_NIGHTVISION = "光学传感器校准，开启夜视模式。",-- 物品名:"光电电路"
        WX78MODULE_COLD = "冷却系统已就绪，很有用的功能。",-- 物品名:"制冷电路"
        WX78MODULE_TASER = "放电模块已安装。警告：高压危险。",-- 物品名:"电气化电路"
        WX78MODULE_LIGHT = "辅助照明系统。",-- 物品名:"照明电路"
        WX78MODULE_MAXHUNGER1 = "能量储存模组扩容？",-- 物品名:"胃增益电路"
        WX78MODULE_MAXHUNGER = "这下可以储存更多的燃料了！",-- 物品名:"超级胃增益电路"
        WX78MODULE_MUSIC = "音频输出模块？播放一点轻松的音乐吧。",-- 物品名:"合唱盒电路"
        WX78MODULE_BEE = "蜂群仿生技术？还能听到嗡嗡声。",-- 物品名:"豆增压电路"
        WX78MODULE_MAXHEALTH2 = "装甲值大幅提升！",-- 物品名:"超级强化电路"

        WX78_SCANNER =
        {
            GENERIC ="生物扫描仪！我也想要一个！",-- 物品名:"生物扫描分析仪"->默认
            HUNTING = "雷达锁定目标！",-- 物品名:"生物扫描分析仪"->追踪目标
            SCANNING = "正在采集数据……好神奇。",-- 物品名:"生物扫描分析仪"->扫描中
        },

        WX78_SCANNER_ITEM = "虽然看不懂内部构造，但感觉是很重要的科研设备。",-- 物品名:"生物扫描分析仪"
        WX78_SCANNER_SUCCEEDED = "扫描完成！数据已归档。",-- 物品名:"生物扫描分析仪"->扫描完成

        WX78_MODULEREMOVER = "安全提取工具，用于拆卸电路。",-- 物品名:"电路提取器"

        SCANDATA = "采集到的生物数据，真令人着迷！",-- 物品名:"生物数据"

		-- 2022 便利性更新（QOL 2022）
		JUSTEGGS = "简单的蛋白质来源，但是很美味。",-- 物品名:"普通煎蛋"
		VEGGIEOMLET = "蔬菜和蛋的营养均衡搭配！",-- 物品名:"早餐锅"
		TALLEGGS = "高密度的蛋白质！",-- 物品名:"苏格兰高鸟蛋"
		BEEFALOFEED = "专业的饲料配方。",-- 物品名:"蒸树枝"
		BEEFALOTREAT = "这是给牛牛的奖励，应该很好吃吧？",-- 物品名:"皮弗娄牛零食"

        --月亮码头的诅咒    
        BOAT_ROTATOR = "舵机增强装置，大幅提升转向灵活性。",-- 物品名:"转向舵"
        BOAT_ROTATOR_KIT = "只要把它装上去，操作手感就会变好了。",-- 物品名:"转向舵套装"
        BOAT_BUMPER_KELP = "有机缓冲层，利用海带的韧性。",-- 物品名:"海带保险杠"
        BOAT_BUMPER_KELP_KIT = "用海带来做防护，很环保的想法。",-- 物品名:"海带保险杠套装"
		BOAT_BUMPER_SHELL = "钙化装甲板，能有效抵御撞击。",-- 物品名:"贝壳保险杠"
        BOAT_BUMPER_SHELL_KIT = "把贝壳装上去，提升船体防御力。",-- 物品名:"贝壳保险杠套装"
        BOAT_BUMPER_CRABKING = "这个……是用那种巨大生物的外壳做的吗？",-- 物品名:"帝王蟹保险杠"
        BOAT_BUMPER_CRABKING_KIT = "虽然很重，但是不仅霸气而且安全。",-- 物品名:"帝王蟹保险杠"（物品形态）

        BOAT_CANNON = {
            GENERIC = "动能投射装置。虽然我不推崇暴力……",-- 物品名:"大炮"->默认
            AMMOLOADED = "弹药装填完毕，随时可以发射！",-- 物品名:"大炮"->装弹
            NOAMMO = "这个时候如果只是装饰品的话就糟糕了。",-- 物品名:"大炮"->尝试发射无炮弹大炮
        },
        BOAT_CANNON_KIT = "需要把它安装在船上。",-- 物品名:"大炮套装（物品版）"
        CANNONBALL_ROCK_ITEM = "高密度的球体……要注意轻拿轻放。",-- 物品名:"炮弹"

        OCEAN_TRAWLER = {
            GENERIC = "自动捕鱼网。希望能捕到好东西。",-- 物品名:"海洋拖网捕鱼器"->默认（收起状态）
            LOWERED = "耐心等待……捕鱼需要时间。",-- 物品名:"海洋拖网捕鱼器"->放下且未捕捉到生物
            CAUGHT = "哇！不仅有鱼，说不定还有别的发现！",-- 物品名:"海洋拖网捕鱼器"->升起来有物品
            ESCAPED = "哎呀，跑掉了……下次要改进一下。",-- 物品名:"海洋拖网捕鱼器"->漏了
            FIXED = "修复完成！可以继续作业啦！",-- 物品名:"海洋拖网捕鱼器"->修复完成
        },
        OCEAN_TRAWLER_KIT = "找个资源丰富的地方部署吧。",-- 物品名:"海洋拖网捕鱼器套装"

        BOAT_MAGNET =
        {
            GENERIC = "导向系统？",-- 物品名:"自动航行仪"->默认
            ACTIVATED = "磁场牵引中！好神奇！",-- 物品名:"自动航行仪"->启用
        },
        BOAT_MAGNET_KIT = "有了这个，航行就更轻松了。",-- 物品名:"自动航行仪套装"

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "磁性信标。它在发送引导信号。",-- 物品名:"自动航行灯塔"->默认
            ACTIVATED = "信号发射中！连接建立。",-- 物品名:"自动航行灯塔"->启用
        },
        DOCK_KIT = "码头建设套件。扩展行动基地的必要设施。",-- 物品名:"码头套装"
        DOCK_WOODPOSTS_ITEM = "经过防腐处理的木桩，适合水下作业。",-- 物品名:"码头桩"

        MONKEYHUT =
        {
            GENERIC = "灵长类生物的聚落。建筑风格很……狂野。",-- 物品名:"猴子小屋"->默认
            BURNT = "栖息地被毁坏了。",-- 物品名:"猴子小屋"->烧焦的
        },
                POWDER_MONKEY = "目标持有爆炸物！请注意安全！",-- 物品名:"火药猴"
        PRIME_MATE = "确认为族群领袖。帽子是地位的象征吗？",-- 物品名:"大副"
		LIGHTCRAB = "发光的甲壳类生物！生物发光现象真美。",-- 物品名:"发光蟹"
        CUTLESS = "粗制滥造的武器，但依然有危险性。",-- 物品名:"木头短剑"
        CURSED_MONKEY_TOKEN = "散发着厄运气息的饰品……最好别碰。",-- 物品名:"诅咒饰品"
        OAR_MONKEY = "把船桨当做钝以此使用。",-- 物品名:"战桨"
        BANANABUSH = "大量香蕉！除了作为零食，也是很好的钾元素来源。",-- 物品名:"香蕉丛"
        DUG_BANANABUSH = "挖下来了，找个地方种上吧。",-- 物品名:"香蕉丛"
        PALMCONETREE = "像是棕榈和松树的杂交品种？真有趣。",-- 物品名:"棕榈松果树"
        PALMCONE_SEED = "坚硬的种子。",-- 物品名:"棕榈松果树芽"
        PALMCONE_SAPLING = "生长状况良好。",-- 物品名:"棕榈松果树苗"
        PALMCONE_SCALE = "树皮碎片。",-- 物品名:"棕榈松果树鳞片"
        MONKEYTAIL = "拟态植物！外形像猴子的尾巴。",-- 物品名:"猴尾草"
        DUG_MONKEYTAIL = "带回去种在温室里吧。",-- 物品名:"猴尾草"

        MONKEY_MEDIUMHAT = "海军指挥官的帽子？让我试试看合不合身。",-- 物品名:"船长的三角帽"
        MONKEY_SMALLHAT = "款式有点像以前的海盗。",-- 物品名:"海盗头巾"
        POLLY_ROGERSHAT = "这顶帽子……好像寄宿着某种意识。",-- 物品名:"波莉·罗杰的帽子"
        POLLY_ROGERS = "可以飞行的同伴！你好呀！",-- 物品名:"波莉·罗杰"

        MONKEYISLAND_PORTAL = "空间裂缝的读数很高。通向哪里？",-- 物品名:"非自然传送门"
        MONKEYISLAND_PORTAL_DEBRIS = "损坏的装置……即使修好了，功能也未知。",-- 物品名:"损坏的机器"
        MONKEYQUEEN = "岛屿的统治者。保持礼貌是外交的第一步。",-- 物品名:"月亮码头女王"
        MONKEYPILLAR = "柱子的材质很特殊。",-- 物品名:"猴子柱"
        PIRATE_FLAG_POLE = "挂上旗帜，莱茵生命探险队，出发！",-- 物品名:"月亮码头海盗旗"

        BLACKFLAG = "代表着“危险”的信号旗。",-- 物品名:"黑旗"
        PIRATE_STASH = "资源储藏点！会有宝贝吗？",-- 物品名:"X"
        STASH_MAP = "地理坐标已确认，寻宝开始！",-- 物品名:"海盗地图"

        BANANAJUICE = "高浓度的果糖饮料！能够快速补充体力！",-- 物品名:"香蕉奶昔"

        FENCE_ROTATOR = "旋转机关？看起来像是为了某种训练设计的。",-- 物品名:"栅栏击剑"
        CHARLIE_STAGE_POST = "搭建好的舞台？是要进行什么社会学实验吗？",-- 物品名:"舞台"
        CHARLIE_LECTURN = "上面记载着……剧本？",-- 物品名:"剧本"

        CHARLIE_HECKLER = "请保持安静，不要干扰观测。",-- 物品名:"嘲鸫"

        PLAYBILL_THE_DOLL = "这出剧目似乎关于某种人偶。",-- 物品名:"附魔玩偶\n舞台剧"
        PLAYBILL_THE_VEIL = "这出剧目充满了神秘色彩。",-- 物品名:"黑罩\n舞台剧"
        PLAYBILL_THE_VAULT = "忏悔……是为了寻求心灵的平静吗？",--任务完成\n一份忏悔
        STATUEHARP_HEDGESPAWNER = "植物与石料的共生现象。",-- 物品名:"荆棘密布的雕像"
        HEDGEHOUND = "敌对生物！它由植物构成！",-- 物品名:"蔷薇狼"
        HEDGEHOUND_BUSH = "只是灌木丛……解除警报。",-- 物品名:"蔷薇"

        MASK_DOLLHAT = "玩偶造型的面具。",-- 物品名:"玩偶面具"
        MASK_DOLLBROKENHAT = "裂开了……",-- 物品名:"开裂玩偶面具"
        MASK_DOLLREPAIREDHAT = "修复完成，裂痕依然可见。",-- 物品名:"破碎玩偶面具"
        MASK_BLACKSMITHHAT = "铁匠造型的面具。",-- 物品名:"铁匠面具"
        MASK_MIRRORHAT = "镜子造型的面具。",-- 物品名:"镜子面具"
        MASK_QUEENHAT = "女王造型的面具。",-- 物品名:"女王面具"
        MASK_KINGHAT = "国王造型的面具。",-- 物品名:"国王面具"
        MASK_TREEHAT = "树木造型的面具。",-- 物品名:"树木面具"
        MASK_FOOLHAT = "小丑造型的面具。",-- 物品名:"小丑面具"

        COSTUME_DOLL_BODY = "配套的演出服：玩偶。",-- 物品名:"玩偶服"
        COSTUME_QUEEN_BODY = "配套的演出服：女王。",-- 物品名:"女王服"
        COSTUME_KING_BODY = "配套的演出服：国王。",-- 物品名:"国王服"
        COSTUME_BLACKSMITH_BODY = "配套的演出服：铁匠。",-- 物品名:"铁匠服"
        COSTUME_MIRROR_BODY = "配套的演出服：镜子。",-- 物品名:"镜子服"
        COSTUME_TREE_BODY = "配套的演出服：树木。",-- 物品名:"树木服"
        COSTUME_FOOL_BODY = "配套的演出服：愚者。",-- 物品名:"小丑服"

        STAGEUSHER =
        {
            STANDING = "请不要干扰现场秩序。",-- 物品名:"多刺舞台之手"->攻击状态
            SITTING = "停止活动了。",-- 物品名:"多刺舞台之手"->未激活状态
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "展示用的人体模型。",-- 物品名:"假人"->默认
            BURNT = "模型损坏。",-- 物品名:"假人"->烧焦的
        },

		-- 麦斯威尔（Waxwell）相关
		MAGICIAN_CHEST = "空间折叠技术？物品被传送走了！",-- 物品名:"魔术师箱子"
		TOPHAT_MAGICIAN = "这个帽子……内部结构不符合拓扑学原理。",-- 物品名:"魔术师高礼帽"

        -- 兔年活动
        YOTR_FIGHTRING_KIT = "搏击竞技场的搭建包。",-- 物品名:"枕头大战坑套装"
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "比赛信号装置。",-- 物品名:"枕头大战钟"->默认
            PLAYING = "比赛开始！记录选手表现！",-- 物品名:"枕头大战钟"->游玩
        },

        YOTR_DECOR_1 = {
            GENERAL = "兔形仿生灯具，光源很柔和。",-- 物品名:"矮兔灯"
            OUT = "能源耗尽。",-- 物品名:"矮兔灯"->燃尽
        },
        YOTR_DECOR_2 = {
            GENERAL = "大型兔状灯具，覆盖范围很广。",-- 物品名:"高兔灯"
            OUT = "能源耗尽。",-- 物品名:"高兔灯"->燃尽
        },

        HAREBALL = "角蛋白堆积物……就是毛球啦。",-- 物品名:"兔毛球"
        YOTR_DECOR_1_ITEM = "要布置在哪里呢？",-- 物品名:"矮兔灯"
        YOTR_DECOR_2_ITEM = "需要很大的空间来放置。",-- 物品名:"高兔灯"

		-- 暗影石相关
		DREADSTONE = "这种矿石……不仅吸收光线，似乎还会吸收情绪。",-- 物品名:"绝望石"
		HORRORFUEL = "高浓度的恐惧结晶？这不科学。",-- 物品名:"纯粹恐惧"
		DAYWALKER =
		{
			GENERIC = "实验体看起来很痛苦……需要拘束吗？",-- 物品名:"噩梦猪人"->被释放
			IMPRISONED = "目标已被限制行动。",-- 物品名:"噩梦猪人"->被锁住
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "柱体内部检测到异物。",-- 物品名:"开裂的柱子"->未开采
			EXPOSED = "可以对此进行开采。",-- 物品名:"开裂的柱子"->已开采
		},
		DAYWALKER2 =
		{
			GENERIC = "正在拾荒的个体。暂时判定为中立。",-- 物品名:"拾荒疯猪"->中立
			BURIED = "目标被掩埋。",-- 物品名:"拾荒疯猪"->被困住
			HOSTILE = "目标情绪失控！准备战斗！",-- 物品名:"拾荒疯猪"->敌对
		},
		ARMORDREADSTONE = "穿上会对精神造成压力的护甲。防御性能未知。",-- 物品名:"绝望石盔甲"
		DREADSTONEHAT = "可以屏蔽精神干扰……但本身就是干扰源吧？",-- 物品名:"绝望石头盔"

        -- 裂隙篇 1
        LUNARRIFT_PORTAL = "检测到天体能量裂隙！空间结构很不稳定！",-- 物品名:"裂隙"
        LUNARRIFT_CRYSTAL = "高能晶体。接触需谨慎。",-- 物品名:"裂隙晶体"

        LUNARTHRALL_PLANT = "入侵型寄生植物。生长速度极快。",-- 物品名:"致命亮茄"
        LUNARTHRALL_PLANT_VINE_END = "地下根系探测到活动反应！",-- 物品名:"钻地藤蔓"

		LUNAR_GRAZER = "是跟随裂隙而来的生物吗？",-- 物品名:"牧者"

        PUREBRILLIANCE = "纯粹的月亮能量！",-- 物品名:"纯粹辉煌"
        LUNARPLANT_HUSK = "植物的外骨骼？有趣的材料。",-- 物品名:"亮茄外壳"

		LUNAR_FORGE = "针对月能材料的特种加工台。",-- 物品名:"辉煌铁匠铺"
		LUNAR_FORGE_KIT = "建立前线加工基地。",-- 物品名:"辉煌铁匠铺套装"

		LUNARPLANT_KIT = "生物组织修复技术？我可以试试。",-- 物品名:"亮茄修补套件"
		ARMOR_LUNARPLANT = "生物活性装甲。它还在进行光合作用吗？",-- 物品名:"亮茄盔甲"
		LUNARPLANTHAT = "与头部结合的共生体？希望不会影响大脑。",-- 物品名:"亮茄头盔"
		BOMB_LUNARPLANT = "不稳定的孢子集合体。",-- 物品名:"亮茄炸弹"
		STAFF_LUNARPLANT = "能量增幅装置。但是是用植物做的。",-- 物品名:"亮茄魔杖"
		SWORD_LUNARPLANT = "虽然我不推崇暴力，但由于自卫需要……",-- 物品名:"亮茄剑"
		PICKAXE_LUNARPLANT = "能粉碎一切的工具！",-- 物品名:"亮茄粉碎者"
		SHOVEL_LUNARPLANT = "高效的挖掘工具。",-- 物品名:"亮茄铲子" 

		BROKEN_FORGEDITEM = "装备损毁。需要维修。",-- 物品名:"损坏的亮茄装备"

        PUNCHINGBAG = "训练用的人偶。可以测试攻击数值。",-- 物品名:"拳击袋"

        -- 裂隙篇 2
        SHADOWRIFT_PORTAL = "暗影裂隙。读数显示为……虚无。",-- 物品名:"裂隙"
        SHADOW_FORGE = "暗物质操控台。感觉心里毛毛的。",-- 物品名:"暗影术基座"
        SHADOW_FORGE_KIT = "建立暗影研究设施。",-- 物品名:"暗影术基座套装"

        FUSED_SHADELING = "游离的暗影生物。",-- 物品名:"熔合暗影"
        FUSED_SHADELING_BOMB = "能量很不稳定！要炸了！",-- 物品名:"绝望螨"

		VOIDCLOTH = "质量几乎为零？这种材料违背了物理常识。",-- 物品名:"暗影碎布"
		VOIDCLOTH_KIT = "用于修补虚空装备。",-- 物品名:"虚空修补套件"
		VOIDCLOTHHAT = "光学迷彩？不，是完全的光线吸收。",-- 物品名:"虚空风帽"
		ARMOR_VOIDCLOTH = "仿佛把黑洞穿在了身上。",-- 物品名:"虚空长袍"

        VOIDCLOTH_UMBRELLA = "能够抵御酸雨的腐蚀。",-- 物品名:"暗影伞"
        VOIDCLOTH_SCYTHE = "这种形状……是用来收割什么的？",-- 物品名:"暗影收割者"

		SHADOWTHRALL_HANDS = "检测到巨型手状构造体！",-- 物品名:"墨荒"->躁动（骑士）
		SHADOWTHRALL_HORNS = "高速移动目标接近中！",-- 物品名:"墨荒"->刮擦（战车）
		SHADOWTHRALL_WINGS = "高频声波攻击警告！",-- 物品名:"墨荒"->尖叫（主教）我说石化有点抽象了
		SHADOWTHRALL_MOUTH = "那张嘴……让我感到生理性不适。",-- 物品名:"墨荒"->狞笑

        CHARLIE_NPC = "无法识别身份的人型生物。",-- 物品名:"查理"
        CHARLIE_HAND = "那是……暗影之手？",-- 物品名:"召唤之手"

        NITRE_FORMATION = "硝酸钾结晶堆。",-- 物品名:"硝石堆"
        DREADSTONE_STACK = "地壳深处的矿物沉积。",-- 物品名:"绝望石生成"
        
        SCRAPBOOK_PAGE = "资料页！我要把它放进档案里。",-- 物品名:"丢失的图鉴页面"

        LEIF_IDOL = "充满了自然能量的图腾。",-- 物品名:"树精守卫雕像" 制造描述:"召唤树木的力量。" 
        WOODCARVEDHAT = "硬木雕刻的帽子。具有一定的防护力。",-- 物品名:"硬木帽" 制造描述:"你的脑袋会被保护得很好（敲敲木头防止乌鸦嘴）。"
        WALKING_STICK = "人体工学设计，适合长途跋涉。",-- 物品名:"木手杖" 制造描述:"轻松穿越您最喜欢的自然小径。"

        IPECACSYRUP = "催吐剂。味道一定很糟糕。",-- 物品名:"吐根糖浆" 制造描述:"让你保持正常。"
        BOMB_LUNARPLANT_WORMWOOD = "沃姆伍德先生好像变得更厉害了呢。", -- 未使用        --这个应该是植物人的睡眠炸弹的废案？
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "它死了……",-- 物品名:"胡萝卜鼠" 制造描述:"将一个普通的胡萝卜变成有用的胡萝卜鼠！"->死亡
        	GENERIC = "植物与动物的嵌合体？",-- 物品名:"胡萝卜鼠" 制造描述:"将一个普通的胡萝卜变成有用的胡萝卜鼠！"->默认
        	HELD = "拿着小家伙。",-- 物品名:"胡萝卜鼠" 制造描述:"将一个普通的胡萝卜变成有用的胡萝卜鼠！"->携带
        	SLEEPING = "它在睡觉呢。",-- 物品名:"胡萝卜鼠" 制造描述:"将一个普通的胡萝卜变成有用的胡萝卜鼠！"->睡觉
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "能够自由移动的光源。",-- 物品名:"球状光虫" 制造描述:"将普通灯泡变成忠诚的球状光虫！"
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "很可爱，但是还没长大呢。",-- 物品名:"沙拉蝾螈" 制造描述:"将沉闷的火龙果变成凶猛的沙拉蝾螈！"->绿色
			RIPE = "成熟个体。火龙果的变异种。",-- 物品名:"沙拉蝾螈" 制造描述:"将沉闷的火龙果变成凶猛的沙拉蝾螈！"->红色
			SLEEPING = "嘘……它在睡觉呢。",-- 物品名:"沙拉蝾螈" 制造描述:"将沉闷的火龙果变成凶猛的沙拉蝾螈！"->睡觉
		},

        SUPPORT_PILLAR_SCAFFOLD = "还在建造中呢。",-- 物品名:"支柱脚手架" 制造描述:"我们都需要一些支持。"
        SUPPORT_PILLAR = "结构维护是必要的。",-- 物品名:"支柱"
        SUPPORT_PILLAR_COMPLETE = "支撑结构稳定。",-- 物品名:"加固支柱"
        SUPPORT_PILLAR_BROKEN = "承重结构已失效。",-- 物品名:"支柱瓦砾"

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "还在建造中呢。",-- 物品名:"绝望石支柱脚手架" 制造描述:""
		SUPPORT_PILLAR_DREADSTONE = "需要进行加固作业。",-- 物品名:"绝望石支柱"
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "虽然有些阴森，但结构很稳固。",-- 物品名:"加固绝望石支柱"
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "坍塌了……",-- 物品名:"绝望石支柱瓦砾"

        WOLFGANG_WHISTLE = "高频声音发生器。能提振士气。",-- 物品名:"训练哨" 制造描述:"释放你心底潜在的教练！"

        -- 裂隙篇 3
        MUTATEDDEERCLOPS = "目标发生了晶体化变异。危险等级上升。",-- 物品名:"晶体独眼巨鹿"
        MUTATEDWARG = "被寄生了吗？攻击欲望极其强烈！",-- 物品名:"附身座狼"
        MUTATEDBEARGER = "这种变异形态……太危险了！",-- 物品名:"装甲熊獾"        --《荒野乱斗》切斯特台词致敬

        LUNARFROG = "两栖类变异体。请不要一直盯着我看……",-- 物品名:"明眼青蛙"

        DEERCLOPSCORPSE =
        {
            GENERIC  = "目标沉默了吗……？",-- 物品名:"独眼巨鹿"->尸体
            BURNING  = "放热反应剧烈。小心烫伤。",-- 物品名:"独眼巨鹿"->尸体燃烧
            REVIVING = "躯体系统正在重启！它动了！",-- 物品名:"独眼巨鹿"->尸体复活
        },

        WARGCORPSE =
        {
            GENERIC  = "还没完全死……要小心。",-- 物品名:"座狼"->尸体
            BURNING  = "烧起来了……",-- 物品名:"座狼"->尸体燃烧
            REVIVING = "它要复活了！某种再生能力吗？",-- 物品名:"座狼"->尸体复活
        },

        BEARGERCORPSE =
        {
            GENERIC  = "散发着腐败气味……",-- 物品名:"熊獾"->尸体
            BURNING  = "危险解除……大概。",-- 物品名:"熊獾"->尸体燃烧
            REVIVING = "居然还能站起来？！不合常理！",-- 物品名:"熊獾"->尸体复活
        },

        BEARGERFUR_SACK = "极佳的隔热性能！用来保存食物再好不过了。",-- 物品名:"极地熊獾桶" 制造描述:"便携式冰箱。酷。"
        HOUNDSTOOTH_BLOWPIPE = "原始的投射物发射系统。利用气压原理。",-- 物品名:"榴弹炮" 制造描述:"那感觉就像远距离被咬一样。"
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "低温光学监控装置。被盯着看感觉怪怪的……", -- 物品名:"冰眼结晶器"->有眼珠
            NOEYEBALL = "核心组件缺失。",-- 物品名:"冰眼结晶器"->无眼珠
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "部署监控防御塔！我会保护大家的！",-- 物品名:"冰眼结晶器套装" 制造描述:"用冻伤来治疗一下晒伤。"

        SECURITY_PULSE_CAGE = "收容单元为空。",-- 物品名:"火花柜"
        SECURITY_PULSE_CAGE_FULL = "成功捕获高能粒子！",-- 物品名:"火花柜"

		CARPENTRY_STATION =
        {
            GENERIC = "木工模块。可以用来改善居住环境。",-- 物品名:"锯马"->默认 制造描述:"别瞎蹦跶了，做点家具吧。"
            BURNT = "设备损毁。",-- 物品名:"锯马"->烧毁 制造描述:"别瞎蹦跶了，做点家具吧。"
        },

        WOOD_TABLE = -- 圆桌和方桌通用
        {
            GENERIC = "可以用来放置实验器材，或者聚餐。",-- 物品名:"木圆桌/木方桌"->无东西 制造描述:"一张置物的木圆桌。/一张置物的木方桌。"
            HAS_ITEM = "载物台已被占用。",-- 物品名:"木圆桌/木方桌"->有东西 制造描述:"一张置物的木圆桌。/一张置物的木方桌。"
            BURNT = "碳化严重，无法使用。",-- 物品名:"木圆桌/木方桌"->烧毁 制造描述:"一张置物的木圆桌。/一张置物的木方桌。"
        },

        WOOD_CHAIR =    --木头椅子
        {
            GENERIC = "人体工学评估：可接受。博士要休息一下吗？",-- 物品名:"木椅"->无人 制造描述:"一把可以坐的木椅。"      --《荒野乱斗》露米台词致敬（英国人特供）
            OCCUPIED = "已有乘员。",-- 物品名:"木椅"->有人 制造描述:"一把可以坐的木椅。"
            BURNT = "烧焦了……",-- 物品名:"木椅"->烧毁 制造描述:"一把可以坐的木椅。"
        },

        DECOR_CENTERPIECE = "极简主义风格的装饰品。",-- 物品名:"艺术？" 制造描述:"彰显您卓越品味的餐桌摆件。"
        DECOR_LAMP = "暖色调光源，有助于缓解压力。",-- 物品名:"餐桌灯" 制造描述:"一盏舒适的小灯。"
        DECOR_FLOWERVASE =
        {
            GENERIC = "插着漂亮的花呢！",-- 物品名:"餐桌花瓶"->有花 制造描述:"这是一个放置鲜切花的好地方。"
            EMPTY = "需要采一些花来插。",-- 物品名:"餐桌花瓶"->无物品 制造描述:"这是一个放置鲜切花的好地方。"
            WILTED = "花枯萎了……",-- 物品名:"餐桌花瓶"->有花且已腐败 制造描述:"这是一个放置鲜切花的好地方。"
            FRESHLIGHT = "会发光耶！好漂亮！",-- 物品名:"餐桌花瓶"->有发光物品 制造描述:"这是一个放置鲜切花的好地方。"
            OLDLIGHT = "荧光变弱了。",-- 物品名:"餐桌花瓶"->有发光物品且已腐败 制造描述:"这是一个放置鲜切花的好地方。"
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "图像数据展示。",-- 物品名:"{item}画" 制造描述:"将你最爱的物品图装裱起来。"
            UNDRAWN = "可以放入图像资料。",-- 物品名:"空画框" 制造描述:"将你最爱的物品图装裱起来。"
        },
        DECOR_PORTRAITFRAME = "大家的笑容都被记录下来了！",-- 物品名:"愉快画像" 制造描述:"把你的朋友们放进框里，这很有趣！"

        PHONOGRAPH = "音频播放设备。虽然是模拟信号技术，但很有韵味。",-- 物品名:"留声机" 制造描述:"坐下来，放松一下，听一听你噩梦中的音乐。"
        RECORD = "音频数据存储介质。",-- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_CREEPYFOREST = "声波频率让人感到不安……",-- 物品名:"惊悚森林" 制造描述:"黑胶上的永恒经典。"
        RECORD_DANGER = "这种节奏……战斗要开始了吗？", -- 未使用       -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_DAWN = "很有朝气的旋律！", -- 未使用       -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_DRSTYLE = "这首歌很有趣呢。",-- 物品名:"D.R.风格" 制造描述:"黑胶上的永恒经典。"
        RECORD_DUSK = "有点悲伤的感觉……", -- 未使用       -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_EFS = "这是……什么风格的音乐呀？", -- 物品名:"E.F.S." 制造描述:"黑胶上的永恒经典。"
        RECORD_END = "播放结束。", -- 未使用      -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_MAIN = "这首曲子……好像在哪里听过。", -- 未使用       -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_WORKTOBEDONE = "要开始工作了吗？全速前进！", -- 未使用       -- 物品名:"唱片" 制造描述:"黑胶上的永恒经典。"
        RECORD_HALLOWEDNIGHTS = "好热闹的音乐！",-- 物品名:"远古小合奏机"

        ARCHIVE_ORCHESTRINA_MAIN = "这个构造……集成了声学与机械学。",-- 物品名:"W.A.R.B.I.S.头戴齿轮" 制造描述:"看起来聪明，打起来也聪明。"

        WAGPUNKHAT = "头部防护组件。看起来有点像机甲配件。",-- 物品名:"W.A.R.B.I.S.盔甲" 制造描述:"开足马力，全速前进！"
        ARMORWAGPUNK = "回收材料制成的护甲。环保又实用。",-- 物品名:"被丢弃的垃圾"
        WAGSTAFF_MACHINERY = "金属废料。潜在的资源。",-- 物品名:"废铁"
        WAGPUNKBITS = "机械碎片。也许可以逆向工程。",-- 物品名:"废铁"
        WAGPUNKBITS_KIT = "自动维修单元！好厉害！",-- 物品名:"自动修理机" 制造描述:"你得心应手的W.A.R.B.I.S.维修工具！"

        WAGSTAFF_MUTATIONS_NOTE = "上面写了很多我看不懂的公式……等等，这个我懂！",-- 物品名:"研究笔记"

        --薇格弗德、薇洛技能聚点更新
        BATTLESONG_INSTANT_REVIVE = "通过声学刺激进行复苏？希望能给大家带来力量！",--物品名:"战士重奏" 制造描述:"扰动阵亡战友的心房。"       --《荒野乱斗》露米台词致敬

        WATHGRITHR_IMPROVEDHAT = "强化头部护具。指挥官的专属装备。",--物品名:"统帅头盔" 制造描述:"适合女武神女王的头盔。"
        SPEAR_WATHGRITHR_LIGHTNING = "附带电荷释放的武器！闪电的力量……好厉害！",--物品名:"奔雷矛" 制造描述:"闪电的力量由你掌控。"


        BATTLESONG_CONTAINER = "战斗曲目的乐谱收纳罐。要分类归档哦。",--物品名:"战斗号子罐" 制造描述:"保存你所有的金曲。"

        SADDLE_WATHGRITHR = "带有空气以此动力学设计的鞍具。",--物品名:"战斗鞍具" 制造描述:"勇士与坐骑，一起战斗吧！"

        WATHGRITHR_SHIELD = "物理防御屏障。观测到使用者的意志力增强了防御效果。",--物品名:"战斗圆盾" 制造描述:"只要它相信自己，盾牌也可以是武器。"

        BATTLESONG_SHADOWALIGNED = "听起来……有点压抑。是对抗月能的特定频率。",--物品名:"黑暗悲歌" 制造描述:"减少自身和盟友受到暗影攻击的伤害，增加对月亮阵营敌人的伤害。"
        BATTLESONG_LUNARALIGNED = "很温柔的旋律，能安抚暗影的躁动。",--物品名:"启迪摇篮曲" 制造描述:"减少自身和盟友受到月亮攻击的伤害，增加对暗影阵营敌人的伤害。"

		SHARKBOI = "是冰鲨吗？在水下的机动性很高！",--物品名:"大霜鲨"       --《泰拉瑞亚》著名肉后小怪致敬
        BOOTLEG = "走私者的装备？",--物品名:"出逃腿靴"
        OCEANWHIRLPORTAL = "不稳定的水流漩涡。可能会通向另一个坐标。",--物品名:"漩涡传送门"

        EMBERLIGHT = "受控的燃烧球体。像是微缩的恒星。",--物品名:"火球"
        WILLOW_EMBER = "残留的热能实体。",--物品名:"余烬"       --《咸鱼喵喵》配乐，《虚空重生颂》歌词翻译致敬

        -- 龙年
        YOTD_DRAGONSHRINE =
        {
            GENERIC = "供奉点。需要特定的祭品。",--物品名:"龙蝇神龛"->默认 制造描述:"供奉红火的龙蝇。"
            EMPTY = "它在期待着什么。",--物品名:"龙蝇神龛"->空的 制造描述:"供奉红火的龙蝇。"
            BURNT = "过热警告！",--物品名:"龙蝇神龛"->烧焦 制造描述:"供奉红火的龙蝇。"
        },

        DRAGONBOAT_KIT = "赛艇装备。我们要参加水上竞赛吗？",--物品名:"龙蝇船套装" 制造描述:"启动海龙。"
        DRAGONBOAT_PACK = "全套竞速模组！",--物品名:"豪华龙蝇船套装" 制造描述:"配备了所有的龙之配件。"

        BOATRACE_CHECKPOINT = "检查点已确认！",--物品名:"比赛检查点"
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "设置路标。",--物品名:"比赛检查点套装" 制造描述:"重要的是旅程本身而不是终点。"
        BOATRACE_START = "计时起点。",--物品名:"起点塔"
        BOATRACE_START_THROWABLE_DEPLOYKIT = "准备好了吗？引擎……啊不，船桨预热！",--物品名:"起点塔套装" 制造描述:"各就位、预备、开划！"

        BOATRACE_PRIMEMATE = "那是竞争对手吗？",--物品名:"查理的选手"
        BOATRACE_SPECTATOR_DRAGONLING = "观察员小龙蝇。谢谢你的支持，我会努力记录数据的！",--物品名:"小龙蝇观赛者"

        YOTD_STEERINGWHEEL = "航向控制接口。让我来驾驶！",--物品名:"龙蝇船方向舵"
        YOTD_STEERINGWHEEL_ITEM = "需要安装控制台。",--物品名:"龙蝇船方向舵套装" 制造描述:"掌舵，驶向黄金！"
        YOTD_OAR = "推进装置！虽然是手动的。",--物品名:"利爪船桨" 制造描述:"关于龙蝇的一个鲜为人知的事实：它们是出人意料的游泳健将。"
        YOTD_ANCHOR = "制动系统。",--物品名:"巨爪船锚"
        YOTD_ANCHOR_ITEM = "这是……船锚的黄金标准吗？",--物品名:"巨爪船锚套装" 制造描述:"船锚的黄金标准。"
        MAST_YOTD = "这个帆的设计很符合流体力学。",--物品名:"龙翼桅杆"
        MAST_YOTD_ITEM = "风力推进模组。",--物品名:"龙翼桅杆套装" 制造描述:"制造这个桅杆时没有龙蝇受到伤害。"
        BOAT_BUMPER_YOTD = "碰撞缓冲装置。",--物品名:"獠牙保险杠"
        BOAT_BUMPER_YOTD_KIT = "加强船体结构。",--物品名:"獠牙保险杠套装" 制造描述:"没有人敢招惹呲牙咧嘴的龙。"
        BOATRACE_SEASTACK = "障碍物检测！",--物品名:"黄金浮标"
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "设置障碍物。",--物品名:"黄金浮标套装" 制造描述:"甲之浮标，乙之浮障。"
        BOATRACE_SEASTACK_MONKEY = "障碍物检测！",--物品名:"荆棘浮标"
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "小心！",--物品名:"荆棘浮标套装"
        MASTUPGRADE_LAMP_YOTD = "高流明照明设备。",--物品名:"龙蝇灯"
		MASTUPGRADE_LAMP_ITEM_YOTD = "用这个装饰一下吧~",	--物品名:"龙蝇灯套装" 制造描述:"用龙火照亮你的前路。"
        WALKINGPLANK_YOTD = "这个形状……像是龙的舌头？",-- 物品名:"跳板"(龙蝇船)
        CHESSPIECE_YOTD = "看着它……感觉很有动力！",--物品名:"起点塔雕塑"

        -- 裂隙/元数据 便利性更新
        HEALINGSALVE_ACID = "用于中和酸性腐蚀的药膏。",--物品名:"黏糊糊的药膏" 制造描述:"杀不死你的东西会让你变得更强大。"

        BEESWAX_SPRAY = "保护性涂层喷雾。可以防止氧化和腐烂。",--物品名:"防腐喷雾" 制造描述:"坚如磐石地守护植物的生命。"
        WAXED_PLANT = "已覆盖保护层。", -- 适用于所有涂蜡植物，从农作物到树木

        STORAGE_ROBOT = {
            GENERIC = "自动化物流单元！你好呀，瓦器人先生！我可以拆开看看吗？",--物品名:"瓦器人"->默认
            BROKEN = "系统故障。需要维修。",--物品名:"瓦器人"->损坏
        },

        SCRAP_MONOCLEHAT = "增强型光学传感器（单片眼镜版）。",--物品名:"地平线扩展器"
        SCRAPHAT = "简易头部护具。",--物品名:"拾荒尖帽"

        FENCE_JUNK = "虽然是用废品做的，但结构意外地稳固。",--物品名:"垃圾栅栏"
        JUNK_PILE = "检测到可回收材料堆积。",--物品名:"垃圾堆"
        JUNK_PILE_BIG = --物品名:"摇摇欲坠的垃圾堆"
        {
            BLUEPRINT = "扫描到技术图纸信号！",--具有蓝图
            GENERIC = "结构不稳定，小心倒塌。",--默认状态
        },

        ARMOR_LUNARPLANT_HUSK = "这件护甲带有反伤功能。",--物品名:"荆棘茄甲" 制造描述:"这次下次，浑身带刺。"

        -- 元数据4 / 海洋便利性更新（保持不沉没）
        OTTER = "水獭！这家伙会偷东西，注意保管财物。",--物品名:"水獭掠夺者"->
        OTTERDEN = {
            GENERIC = "水獭的巢穴。",--物品名:"水獭掠夺者窝点"->无物品
            HAS_LOOT = "里面好像藏了很多“战利品”呢。",--物品名:"水獭掠夺者窝点"->有物品       --2.5条梧梗致敬
        },
        OTTERDEN_DEAD = "栖息地被破坏了。",--物品名:"拆毁的水獭掠夺者窝点"

        BOAT_ANCIENT_ITEM = "古董级别的航海设备。",--物品名:"古董船套装"
        BOAT_ANCIENT_CONTAINER = "货舱，可以有效管理库存。",--物品名:"货舱"
        WALKINGPLANK_ANCIENT = "这个跳板……看起来很有历史了。",-- 物品名:"跳板"（古董船）      --莉（体）莉（育）娅（生）以自身的空中滑（漂）行（浮）而闻名（

        ANCIENTTREE_SEED = "未知的种子荚。基因序列很古老。",--物品名:"惊喜种子"->物品状态

        ANCIENTTREE_GEM = {
            GENERIC = "岩石与有机物的混合体？正在发芽？",--物品名:"萌芽石"->默认
            STUMP = "巨大的根基。",--物品名:"萌芽石"->破坏
        },

        ANCIENTTREE_SAPLING_ITEM = "要把它种在合适的地方。",--物品名:"萌芽石苗"

        ANCIENTTREE_SAPLING = {     --貌似年轻阴郁棘和年轻萌芽石都是用的这段
            GENERIC = "生长指标正常。幼体很有活力。",--物品名:"年轻萌芽石"->默认生长状态
            WRONG_TILE = "土壤环境不匹配。",--物品名:"年轻萌芽石"->地皮不对
            WRONG_SEASON = "非适宜生长的季节。",--物品名:"年轻萌芽石"->地皮对了，季节不对       --喵可莉：差不多得了
        },
 
        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "负向光敏感植被。环境照度过低。",--物品名:"阴郁之棘"->默认状态
            STUMP = "已被伐除。",--物品名:"阴郁之棘"->砍掉
        },

        ANCIENTFRUIT_GEM = "高度矿物质化的果实。硬度测试：高。",--物品名:"晶洞果"     --这里的“工具”指的是喵可莉（
        ANCIENTFRUIT_NIGHTVISION = "具有生物发光特性的果实。数据不足。",--物品名:"夜莓"
        ANCIENTFRUIT_NIGHTVISION_COOKED = "煮熟的夜莓。",--物品名:"熟夜莓"

        BOATPATCH_KELP = "有机补漏材料。临时应急方案。",--物品名:"海带补丁"

        CRABKING_MOB = "检测到具有智慧的甲壳类生物。请停止敌对行为！",--物品名:"蟹卫"
        CRABKING_MOB_KNIGHT = "外骨骼强度极高。",--物品名:"蟹骑士"
        CRABKING_CANNONTOWER = "弹道武器塔？！注意规避！",--物品名:"加农炮塔"
        CRABKING_ICEWALL = "低温屏障。",--物品名:"冰障"     --这里在说心心的冰冻保鲜（

        SALTLICK_IMPROVED = "富含矿物质的诱捕装置。",--物品名:"美味舔盐块"

        OFFERING_POT =
        {
            GENERIC = "用于提供食物的容器。",--物品名:"食堂海带盘"->空      --这里在吐槽鱼人吃地上的东西是猛猛炫的方式
            SOME_KELP = "检测到少量藻类。",--物品名:"食堂海带盘"->一些海带
            LOTS_OF_KELP = "储备充足。",--物品名:"食堂海带盘"->很多海带
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "改良型的食物容器。",--物品名:"高级食堂海带盘"->空
            SOME_KELP = "检测到少量藻类。",--物品名:"高级食堂海带盘"->一些海带
            LOTS_OF_KELP = "储备充足。",--物品名:"高级食堂海带盘"->很多海带
        },

        MERM_ARMORY = "两栖类生物的武备库。虽然简陋，但很有效。",--物品名:"鱼人军械库"
        MERM_ARMORY_UPGRADED = "升级后的武备库。存储量提升。",--物品名:"高级鱼人军械库"
        MERM_TOOLSHED = "工程车间？看起来像乱堆的。",--物品名:"劣质工具棚"
        MERM_TOOLSHED_UPGRADED = "经过整理的工具存放处。",--物品名:"不那么劣质的工具棚"
        MERMARMORHAT = "生物质防护头盔。气味读数异常。",--物品名:"沼泽斗士头盔"
        MERMARMORUPGRADEDHAT = "这个……抗冲击性能应该不错，但是我拒绝佩戴。",--物品名:"沼泽战士头盔"
        MERM_TOOL = "原始的复合工具。",--物品名:"劣质工具"
        MERM_TOOL_UPGRADED = "经过打磨的工具。",--物品名:"不那么劣质的工具"

        WURT_SWAMPITEM_SHADOW = "具有暗影辐射的材料。读数不稳定。",--物品名:绝望投泥带""
        WURT_SWAMPITEM_LUNAR = "具有月能辐射的材料。会干扰视觉传感器。",--物品名:"光芒投泥带"

        MERM_SHADOW = "受暗影能量影响的突变个体。",--物品名:"暗影鱼人"
        MERMGUARD_SHADOW = "暗影化的防御单位。",--物品名:"暗影鱼人守卫"

        MERM_LUNAR = "受月能影响的变异体。",--物品名:"变异鱼人"
        MERMGUARD_LUNAR = "变异的护卫。",--物品名:"变异鱼人守卫"

        -- 裂隙篇 4
        SHADOW_BEEF_BELL = "低频共振铃。听得让人头皮发麻。",--物品名:"阴郁皮弗娄牛铃"
        SADDLE_SHADOW = "暗影编制的鞍具。摩擦系数很低。",--物品名:"梦魇鞍具"
        SHADOW_BATTLEAXE = "虚空物质构成的斧刃。切割力惊人。",--物品名:"暗影槌"
        VOIDCLOTH_BOOMERANG = "通过暗影折跃返回的回旋镖。",--物品名:"阴郁回旋镖"        --我就喜欢玩这个翻译梗致敬
		ROPE_BRIDGE_KIT = "便携式桥梁组件。结构强度检测中。",--物品名:"洞穴探险者的桥梁套件"
		GELBLOB =
		{
			GENERIC = "粘性不明物质。需要取样分析。",--物品名:"恶液"->默认
			HAS_ITEM = "内部包裹着异物。",--物品名:"恶液"->有物品
			HAS_CHARACTER = "检测到生命体被困！",--物品名:"恶液"->有人
		},
        RABBITKING_AGGRESSIVE = "目标表现出极强攻击性！建议规避！",--物品名:"暴戾兔王"
        RABBITKING_PASSIVE = "目标处于平静状态。",--物品名:"和善兔王"
        RABBITKING_LUCKY = "这只兔子……运气指数很高？",--物品名:"机缘兔子"
        RABBITKINGMINION_BUNNYMAN = "皇家护卫单位，请保持距离。",--物品名:"皇家兔子警卫"
        ARMOR_CARROTLURE = "生物诱饵装置？",--物品名:"胡萝卜外套"
        RABBITKINGHORN = "声波召唤装置。",--物品名:"挖洞兔号角"     --《皇室战争》提示致敬
        RABBITKINGHORN_CHEST = "空间折叠技术？好快！",--物品名:"便携式巢穴"
        RABBITKINGSPEAR = "对兔形目生物特攻武器。",--物品名:"兔王棍"
        RABBITHAT = "伪装用的头部装备。虽然看起来很滑稽。",--物品名:"洞穴花环"
        WORM_BOSS = "巨型环节动物！危险等级高！",--物品名:"巨大洞穴蠕虫"

        STONE_TABLE = -- 圆桌和方桌通用
        {
            GENERIC = "花岗岩构造的桌子。非常稳固。",--物品名:"圆石桌/方石桌"->无物品
            HAS_ITEM = "承载着物品。",--物品名:"圆石桌/方石桌"->有物品
        },

        STONE_CHAIR =  --石椅子
        {
            GENERIC = "岩石质地的座椅。热传导率高，会很凉。",     --正常状态      --《荒野乱斗》露米台词致敬（英国人特供）
            OCCUPIED = "已被占用。",      --有人坐了
        },

        CARPENTRY_BLADE_MOONGLASS = "月亮玻璃切割片。非常锋利。",--物品名:"月光玻璃锯片"

        CHEST_MIMIC_REVEALED = "检测到拟态生物！是陷阱！",--物品名:"暴躁箱子"     --这在致敬谁应该不用我说了吧？

        GELBLOB_STORAGE = {
            GENERIC  = "软性材质的储存箱。",--物品名:"恶液储存箱"->无物品
            FULL = "容量已满。",--物品名:"恶液储存箱"->有物品
        },
        GELBLOB_STORAGE_KIT = "需要展开部署的储存组件。",--物品名:"恶液储存箱套件"
        GELBLOB_BOTTLE = "这种液体不能食用。请勿尝试。",--物品名:"恶液罐"

        PLAYER_HOSTED =
        {
            GENERIC = "目标的神经系统似乎被接管了。",--物品名:"被附身的尸体"->别人
            ME = "神经连接受到干扰……身体不听使唤了……",--物品名:"被附身的尸体"->自己
        },

        MASK_SAGEHAT = "这一款叫“贤者”。",--物品名:"贤者面具"
        MASK_HALFWITHAT = "这一款叫“愚人”。表演用的吗？",--物品名:"蠢人面具"
        MASK_TOADYHAT = "这一款叫“谄媚”。设计很夸张。",--物品名:"马屁精面具"

        SHADOWTHRALL_PARASITE = "寄生型暗影生物！快把它弄下来！",--物品名:"虚空面具"

        PUMPKINCARVER = "南瓜雕刻工具组。",--物品名:"南瓜勺1/南瓜刀2/南瓜锯3"
		SNOWMAN = --一个物品两种形态两种翻译，真有你的科雷这方面干得不错（居然没有多写一行的检查台词）
		{
			GENERIC = "人造冰雪塑像。",--物品名:"雪人"
			SNOWBALL = "还需要更多积雪。球体结构已成型。",--物品名:"大雪球"
		},
        SNOWBALL_ITEM = "压缩雪球。可以作为投掷武器。",--物品名:"雪球"

        -- 蛇年
        YOTS_SNAKESHRINE =
        {
            GENERIC = "爬行动物的祭祀点。要放东西上去吗？",--物品名:"洞穴蠕虫神龛"->有贡品
            EMPTY = "缺乏特定的贡品。",--物品名:"洞穴蠕虫神龛"->无贡品
            BURNT = "烧坏了。", --物品名:"洞穴蠕虫神龛"->燃尽
        },
        YOTS_WORM = "镀金的蠕虫！很漂亮！",--物品名:"镀金洞穴蠕虫"
        YOTS_LANTERN_POST = 
        {
            GENERIC = "节庆照明单元。为了庆祝爬行动物年？",--物品名:"喜庆灯笼柱"->默认
            BURNT = "过热损坏。",--物品名:"喜庆灯笼柱"->燃尽
        },
        YOTS_LANTERN_POST_ITEM = "需要选择部署位置。",--物品名:"喜庆灯笼柱套装"
        CHESSPIECE_DEPTHWORM  = "巨大穴居蠕虫的塑像。",--物品名:"洞穴蠕虫雕塑"

        -- 元数据5
        GHOSTLYELIXIR_LUNAR = "光谱增强剂。检测到月能反应。",--物品名:"光之怒"        --阿比获得10位面伤害，处于虚影状态时获得100点位面伤害，持续120秒        灵魂花冠：无法饮用
        GHOSTLYELIXIR_SHADOW = "光谱增强剂。检测到暗影反应，不建议饮用。",--物品名:"诅咒之苦"       --对生物额外增加10位面伤害，药效持续一天        灵魂花冠：无法饮用

		SLINGSHOTMODKIT = "投射武器改装套件。",--物品名:"弹弓野外作业包"
		SLINGSHOT_BAND_PIGSKIN = "高张力有机蛋白纤维。",--物品名:"猪皮弹弓皮筋"
		SLINGSHOT_BAND_TENTACLE = "这种材质的弹性模量很高。",--物品名:"甩尾弹弓皮筋"
		SLINGSHOT_BAND_MIMIC = "具有拟态特性的材料。",--物品名:"附身弹弓皮筋"
		SLINGSHOT_FRAME_BONE = "钙质骨架。",--物品名:"骨制弹弓框"
		SLINGSHOT_FRAME_GEMS = "晶体结构框架。具有折射特性，很漂亮。",--物品名:"铥矿弹弓框"     --《王国保卫战》马格努斯（马格纳斯）台词致敬“It a kind of magic”
		SLINGSHOT_FRAME_WAGPUNK_0 = "简易机械结构。",--物品名:"废料弹弓框"
		SLINGSHOT_FRAME_WAGPUNK = "利用废料构建的发射机构。容量提升。",--物品名:"加量废料弹弓框"      --囤积癖是《杀戮尖塔》的一个全局buff致敬
		SLINGSHOT_HANDLE_STICKY = "高粘度手柄。防止脱手。",--物品名:"粘性弹弓手柄"
		SLINGSHOT_HANDLE_JELLY = "糖分含量过高。",--物品名:"蜂王浆弹弓手柄"
		SLINGSHOT_HANDLE_SILK = "高韧性丝线缠绕。",--物品名:"弹弓手柄缠带"
		SLINGSHOT_HANDLE_VOIDCLOTH = "暗影材料手柄。手感很冷。",--物品名:"虚空弹弓手柄"

		WOBY_TREAT = "犬科生物营养补充剂。",--物品名:"沃比零食"
		BANDAGE_BUTTERFLYWINGS = "鳞翅目昆虫翅膀制作的绷带。有点浪费。",--物品名:"扑腾绷带"
		PORTABLEFIREPIT_ITEM = "便携式热源组件。",--物品名:"便携营火"
        SLINGSHOTAMMO_CONTAINER = "弹药收纳袋。",--物品名:"弹药袋"

        ELIXIR_CONTAINER = "运输盒，看起来像野餐用的？",--物品名:"野餐盒"
        GHOSTFLOWERHAT = "这花冠……看起来很悲伤。",--物品名:"幽魂花冠"
        WENDY_RESURRECTIONGRAVE = "为了纪念某种逝去的植物现象？",--物品名:"多年生植物祭坛"      --hard to say具体可以看旺达的台词，这里在接话       --《鬼泣5》名场面致敬
        GRAVEURN =
        {
            GENERIC = "这是……骨灰盒吗？未检测到有机残留。",--物品名:"灵魂容器"->默认（空的）
            HAS_SPIRIT = "检测到灵体波动……",--物品名:"灵魂容器"->有物品
        },

        SHALLOW_GRAVE = "这里有挖掘痕迹。好像埋了什么。",--物品名:"矮坟"
        THULECITEBUGNET = "古代科技强化的捕虫网。",--物品名:"铥矿捕虫网"

        -- 卡牌组
        DECK_OF_CARDS = "是纸牌游戏吗？我们可以玩扑克！",--物品名:"牌堆"
        PLAYING_CARD = "一张扑克牌。概率学道具。",--物品名:"扑克牌"
        BALATRO_MACHINE = "概率计算器？让我来试一试！",--小丑机     --《荒野乱斗》谜宝台词致敬

		-- 裂隙5
		GESTALT_CAGE =
		{
			GENERIC = "灵体捕获装置。要抓捕那些纯粹能量体吗？",--物品名:"幻灵捕获机"->默认（空的）
			FILLED = "捕获成功！",--物品名:"幻灵捕获机"->有物品
		},
		WAGBOSS_ROBOT_SECRET = "加密的构造体。",--物品名:"未公开构造体"
        WAGBOSS_ROBOT = "检测到敌对自动机！危险等级高！",--物品名:"战争瓦器人"
        WAGBOSS_ROBOT_POSSESSED = "系统被外部能量接管了？",--物品名:"启迪战争瓦器人"
		WAGBOSS_ROBOT_LEG = "行动模块受损。",--物品名:"战争瓦器人腿"        --想在中文里体现Lag（网卡）和Leg（腿）的双关还挺难的      --《荒野乱斗》布洛克台词致敬（猴强削）
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "高能反应！准备战斗！",--物品名:"天体仇灵"
		ALTERGUARDIAN_PHASE1_LUNARRIFT_GESTALT = "能量体分离。",--物品名:"纯粹虚影"
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "我不会让这种事情发生的！为了大家！",--物品名:"天体后裔"
		WAGDRONE_ROLLING = --他居然没有额外写一个物品，居然不写屎山代码了爷青结
        {
            GENERIC = "机动无人机。检测到移动！",--物品名:"螨地爬"->正常状态（敌对活动）
            INACTIVE = "进入待机模式。",--物品名:"螨地爬"->敌对闲置
            DAMAGED = "机体损坏。",--物品名:"螨地爬"->损坏
            FRIENDLY = "识别为友方单位。但还是要小心误伤。",--物品名:"螨地爬"->自己人
        },
        WAGDRONE_FLYING =
        {
            GENERIC = "它飞起来了！",--物品名:""黄莺->正常状态（敌对活动）
            INACTIVE = "悬停中。",--物品名:"黄莺"->敌对闲置
            DAMAGED = "如果能修好……我们可以研究它的飞行原理。",--物品名:"黄莺"->损坏
        },
		WAGDRONE_PARTS = "动力核心组件。",--物品名:"陀螺传导核心"
		WAGDRONE_BEACON = "信号屏蔽场？",--物品名:"螨地爬屏障柱"

        WAGPUNK_WORKSTATION = "概念验证机。可以制造试作型装备。",--物品名:"概念制造器"
        WAGPUNK_LEVER = "手动输入装置。",--物品名:"杠杆选择器"
        WAGPUNK_FLOOR_KIT = "基底扩展模块。",--物品名:"基底扩展器"
        WAGPUNK_CAGEWALL = "动能立场发生器。",--物品名:"动能场扩展器"

		WAGSTAFF_ITEM_1 = "未知的防护手套。",--物品名:"手套"
		WAGSTAFF_ITEM_2 = "记录板。这里面有数据吗？",--物品名:"剪贴板"

        HERMITCRAB_RELOCATION_KIT = "寄居蟹搬家套装。我们要帮助那位老女士吗？",--物品名:"隐士迁居套装"

        WANDERINGTRADER =
        {
            REVEALED = "身份识别：流浪商人。",--物品名:"流浪商人"
            GENERIC = "变异的皮弗娄牛？气味读数……很高。",--物品名:"怪皮弗娄牛"
        },

        GESTALT_GUARD_EVOLVED = "进化的虚影守卫！请退后！",--物品名:"敌意虚影"
        FLOTATIONCUSHION = "单人水上浮力装置。",--个人漂浮装置
        LUNAR_SEED = "蕴含月能的结晶。",--物品名:"天体珠宝"
        
        --恶意接管2
        WAGBOSS_ROBOT_CONSTRUCTIONSITE = "自动机装配基座。",--物品名:"战争瓦器人底座"
        WAGBOSS_ROBOT_CONSTRUCTIONSITE_KIT = "装配基座的预制件。",--物品名:"战争瓦器人底座套装"
        WAGBOSS_ROBOT_CREATION_PARTS = "复杂的机械零件。看不懂图纸……",--物品名:"战争瓦器人零件"
        MOONSTORM_STATIC_CATCHER = "静电约束仪。注意绝缘！",--物品名:"静电约束仪"
        COOLANT = "热调节流体。小心辐射。",--物品名:"核化液"

        FENCE_ELECTRIC = {  --麻刺节点
            LINKED = "回路已接通！",      --已连接
            GENERIC = "高压危险！",           --未连接
        },
        FENCE_ELECTRIC_ITEM = "便携式电网节点。",--物品名:"麻刺节点"（物品状态）      --吴京被电击名场面致敬

        MUTATEDBIRD = "发生畸变的羽。",--物品名:"亮喙鸟"
        --本来是想和之前一样手写成物品名格式的，但是那样太麻烦了，不想再这样手动改了，之后有机会再换吧（估计这辈子都不会）
        BIRDCORPSE =    --正常鸟类尸体
        {
            GENERIC  = "好可怜的小羽……", --检查
            BURNING  = "安息吧……", --燃烧
            REVIVING = "它……复活了？！", --月灵寄生
        },

        BUZZARDCORPSE = {       --秃鹫尸体
            GENERIC  = "循环……", --检查        --蜜雪冰城经典歌曲致敬
            BURNING  = "烧着了……", --燃烧       --《燃烧吧火鸟》歌词致敬
            REVIVING = "它看起来很痛苦……", --月灵寄生
        },

        MUTATEDBUZZARD_GESTALT = {--水晶冠秃鹫
            GENERIC = "发生畸变的食腐动物。", --默认
            EATING_CORPSE = "正在摄入有机质……", -- 啄食新鲜尸体时（可能是玩家或其他生物杀死的）
        },

        -- 裂隙 6

        SHADOWTHRALL_CENTIPEDE = {--巨荒蜈\涟漪(亲和名)
            HEAD = "这是它的头！好大！", -- 蜈蚣头部环节
            BODY = "身体好长啊……", -- 蜈蚣身体环节
            FLIPPED = "翻过来啦！趁现在！", -- 被翻过来时
        },

        TREE_ROCK =--巨石枝
        {
            BURNING = "石头树也会着火吗？！", --燃烧
            CHOPPED = "砍倒啦！", --被砍伐
            GENERIC = "长在岩石上的植物，好神奇的生存策略！",--默认
        },

        CAVE_VENT_ROCK =--喷气孔
        {
            GENERIC = "地热喷口！好像要喷发了！", -- 默认（未释放任何物质）
            HOT     = "好烫好烫！", -- 释放热气，使区域升温
            GAS     = "有毒气体！大家快跑！", -- 释放伞菌的毒气和孢子
            MIASMA  = "这种瘴气好浓……要小心！", -- 释放暗影裂隙的瘴气
        },
        CAVE_FERN_WITHERED = "蕨类缺水了。",--枯萎蕨类
        FLOWER_CAVE_WITHERED = "发光的花……不发光了。", --枯萎的荧光花

        ABYSSPILLAR_MINION =--追随者
        {
            GENERIC = "静止不动的石像……", --默认
            ACTIVATED = "动起来了！！", --已激活
        },
        ABYSSPILLAR_TRIAL = "这是开关吧？拉一下试试！", --杠杆（圣殿激活开关）

        VAULT_TELEPORTER =--圣殿路标
        {
            GENERIC = "传送点！可以瞬间移动！", --默认
            BROKEN = "传送装置坏了……",--损坏
            UNPOWERED = "没有能量了。",--未激活电
        },
        VAULT_TELEPORTER_UNDERCONSTRUCTION = "还在建设中……", -- 保留官方开发提示语气
        VAULT_ORB = "传送钥匙！", --传送宝珠        --字面意思的梗，致敬梗就是这句话
        VAULT_LOBBY_EXIT = "那是“门”吗？",--裂隙
        VAULT_CHANDELIER_BROKEN = "灯坏掉了。",--圣殿华灯

        ANCIENT_HUSK = "远古的遗骸……很久以前的文明吗？", --远古遗骸     --“像蛆一样滴死了”这个句子算致敬，梗是啥我就不知道了
        MASK_ANCIENT_HANDMAIDHAT = "古代面具！侍女风格？", --鞘翅面具\古代侍女帽面具
        MASK_ANCIENT_ARCHITECTHAT = "古代面具！建筑师风格？", --远见者面具\古代建筑师帽面具
        MASK_ANCIENT_MASONHAT = "古代面具！石匠风格？", --工匠面具\古代石匠帽面具

        TREE_ROCK_SEED = "种子包在石头壳里！",--巨石枝种子
        TREE_ROCK_SAPLING = "破壳而出的小树苗！", --巨石枝树苗
        --裂隙 6.1
        OCEANWHIRLBIGPORTALEXIT = "出口的标记！", --海洋漂浮物（圣殿入口的那坨垃圾堆）
        VAULT_TORCH =--迷之火焰
        {
            GENERIC = "要点亮它吗？",--正常火炬
            BROKEN = "点火装置坏了。",--开关损坏的火炬
        },
        CAVE_VENT_MITE =--地热螨
        {
            DEAD = "它不动了……",--死了      --《从百草园到三味书屋》对应课文致敬，这玩意死了也和打屁虫一样“放屁”不是吗？
            GENERIC = "好大的螨虫！",--默认状态
            SLEEPING = "在睡觉呢。",--睡着
            VENTING = "它在喷气……好臭！", --缩壳喷气
        },
        --2025万圣节

        PUMPKINHAT =
        {
            GENERIC = "是南瓜灯做的帽子！",       --南瓜头
            UNCARVED = "还没进行雕刻。",      --无面南瓜
        },

        PENGUINCORPSE =     --企鸥尸体
        {
            GENERIC  = "企鹅先生死掉了……",        --默认死掉
            BURNING  = "正在烧……",      --燃烧
            REVIVING = "它要复活了！",        --寄生复活
        },

        SPIDERCORPSE =      --蜘蛛尸体
        {
            GENERIC = "死掉的蜘蛛。",       --默认死掉
            BURNING = "燃烧反应。",       --燃烧
            REVIVING = "它正在自行修复？！",        --寄生复活
        },

        SPIDERQUEENCORPSE =     --蜘蛛女王尸体
        {
            GENERIC = "巨型个体已倒下。",       --默认死掉     --懒得写了，半个致敬，几乎不算
            BURNING = "产生大量烟雾……",       --燃烧
            REVIVING = "这是……二次变异吗？",        --寄生复活
        },

        MERMCORPSE =        --鱼人尸体
        {
            GENERIC = "两栖类生物遗骸。",     --默认死掉
            BURNING = "有机物燃烧的味道。",     --燃烧
            REVIVING = "神经系统重新连接？！",      --寄生复活
        },

        GENERIC_CORPSE =        --尸体（通用检查台词）
        {
            GENERIC = "生命消逝了。",     --默认死掉
            BURNING = "尘归尘，土归土。",     --燃烧
            REVIVING = "这是源石技艺吗？还是……某种寄生？",      --寄生复活
        },
        HERMITHOTSPRING = -- 隐士温泉
        {
            BOMBED = "添加了矿物盐，水质改善了。",    --放过沐浴球的
            GENERIC = "地热理疗池。看起来很舒适，我可以进去采集……啊不，泡一泡吗？",    --正常
            EMPTY = "水位下降至临界点。",   --干涸的温泉
        },
        HERMITHOTSPRING_CONSTR = "“注意湿滑。”", -- 温泉（建造中）
        MEATRACK_HERMIT_MULTI = -- 维托的话；复用风干架文案，但少聚焦肉类，多偏向鱼/茶
        {
            DONE = "脱水处理完成！", --晾晒结束
            DRYING = "正在进行脱水工序。", --晒干进行中
            DRYINGINRAIN = "环境湿度过高，效率下降。", --雨天晒干
            GENERIC = "等待也是实验的一部分。", --正常
            BURNT = "过热损毁。", -- 烧毁
            DONE_NOTMEAT = "干透了。", --晾晒完成，非肉
            DRYING_NOTMEAT = "物理性质正在发生变化。", --晾晒，非肉
            DRYINGINRAIN_NOTMEAT = "湿度太高了……", -- 雨天晾晒非肉
            DONE_SALT = "氯化钠结晶！", -- 完成晒盐
            ABANDONED = "看来被遗弃很久了。", --损坏状态
        },
        HERMITHOUSE_ORNAMENT = "发声挂件，还是叫风铃吧。", -- 风铃
        HERMITHOUSE_LAUNDRY = "生活用品晾晒。", -- 隐士的衣物

        PETALS_DRIED = "脱水花瓣标本。", -- 干花瓣
        PETALS_EVIL_DRIED = "散发着不详气息的标本。", -- 干恶魔花瓣
        FOLIAGE_DRIED = "干蕨叶。", -- 干蕨叶
        SUCCULENT_PICKED_DRIED = "晒干的多肉植物。", -- 干多肉植物
        FIRENETTLES_DRIED = "晒干了就不那么刺了。", -- 干火荨麻
        TILLWEED_DRIED = "干枯的杂草。", -- 干犁地草
        MOON_TREE_BLOSSOM_DRIED = "还保留着香味呢。", -- 干月树花
        FORGETMELOTS_DRIED = "可以用来泡茶吗？", -- 干必忘我

        HERMITCRABTEA_PETALS = "花瓣茶，好香啊！", -- 花瓣茶
        HERMITCRABTEA_PETALS_EVIL = "这个茶颜色好深……能喝吗？", -- 深色花瓣茶
        HERMITCRABTEA_FOLIAGE = "叶子泡的茶，味道怎么样呢？", -- 叶子茶
        HERMITCRABTEA_SUCCULENT_PICKED = "多肉茶？对身体好吗？", -- 多肉茶
        HERMITCRABTEA_FIRENETTLES = "喝了会觉得暖和吗？", -- 火荨麻茶
        HERMITCRABTEA_TILLWEED = "杂草也能泡茶呢。", -- 犁地草茶
        HERMITCRABTEA_MOON_TREE_BLOSSOM = "月树花茶，香气很特别。", -- 月树花茶
        HERMITCRABTEA_FORGETMELOTS = "喝了会忘记烦恼吗？", -- 必忘我茶
        SHELLWEAVER = "可以把盐变成工具的机器，好神奇！", -- 盐晶组合机
        ICESTAFF2 = "闪闪发光的冰杖。", -- 闪冻魔杖
        ICESTAFF3 = "感觉比普通的冰杖更冷。", -- 深冻魔杖
        NONSLIPGRIT = "洒在地上就不怕滑倒了。", -- 防滑粉
        NONSLIPGRITBOOSTED = "大颗的防滑粒。", -- 防滑颗粒
        DESICCANT = "可以吸走湿气的小包。", -- 小包干燥剂
        DESICCANTBOOSTED = "好大一包干燥剂。", -- 大包干燥剂
        HERMITCRAB_SHELL = "好大的海螺壳！", -- 搬运海螺
        SALTY_DOGHAT = "闻起来有海水的味道。", -- 咸狗帽
        SALTY_DOG = "咸咸的食物。", -- 咸狗

        HERMITCRAB_TEASHOP = -- 隐士蟹茶铺
        {
            GENERIC = "婆婆不在家吗？", -- 闲置状态，珍珠不在
            ACTIVE = "可以买茶喝啦！", -- 激活状态，珍珠在，可购买
            BREWING = "婆婆正在泡茶，要耐心等待。", -- 刚完成交易，珍珠在泡茶
            BURNT = "茶铺……烧掉了。", -- 烧焦了
        },

        FISHMEAT_DRIED = "鱼干，可以保存很久。", -- 干鱼肉
        FISHMEAT_SMALL_DRIED = "小鱼干，看起来脆脆的。", -- 小鱼干

        HERMITCRAB_LIGHTPOST = --珍珠的灯柱
        {
            GENERIC = "很漂亮的灯，光芒很柔和。", -- 默认亮起
            ABANDONED = "它坏掉了吗？",  --搬家废弃
        },
        HERMITCRAB_LIGHTPOST_ITEM = "可以用来装饰灯柱。", -- 珍珠的灯柱套装

        --棱镜部分（花香四溢篇）
        HAT_LICHEN = "发光苔藓做的发饰！在黑暗中也能亮闪闪的！",--苔衣发卡
        ROSORNS = "好锋利的荆棘！使用时要小心手哦。",--带刺蔷薇
        LILEAVES = "用蹄莲做的剑，好优雅！",--蹄莲翠叶
        ORCHITWIGS = "兰草做的武器，柔韧又好用。",--兰草花穗
        HAT_WHISPEROSE = "好漂亮的花饰……咦，好像有什么奇怪的感觉？",--语夜玫瑰
        ROSEBUSH = {--蔷薇花丛
            BARREN = "它需要肥料啦！",--需要施肥
            WITHERED = "太热了，花都蔫了。",--过热
            GENERIC = "好漂亮的蔷薇花！",--默认成熟
            PICKED = "小心刺！采到了！",--已采摘
            BURNING = "着火了！快灭火！",--燃烧
        },
        DUG_ROSEBUSH = "挖出来的蔷薇，可以种到别的地方。",--蔷薇花丛（铲起物品状态）
        CUTTED_ROSEBUSH = "蔷薇的枝条，还活着呢。",--蔷薇折枝
        LILYBUSH = {--蹄莲花丛
            BARREN = "需要施肥了。",--需要施肥
            WITHERED = "太热啦。",--过热
            GENERIC = "洁白的蹄莲花，好纯洁的感觉。",--默认成熟
            PICKED = "已经采过了。",--已采摘
            BURNING = "着火了！",--燃烧
        },  
        DUG_LILYBUSH = "挖出来的蹄莲。",--蹄莲花丛（铲起物品状态）
        CUTTED_LILYBUSH = "蹄莲的嫩芽。",--蹄莲芽束
        ORCHIDBUSH = {--兰草花丛
            BARREN = "肥料不够了。",--需要施肥
            WITHERED = "热坏了。",--过热
            GENERIC = "兰草花，好香啊！",--默认成熟
            PICKED = "花被摘走了。",--已采摘
            BURNING = "不！漂亮的花！",--燃烧
        },
        DUG_ORCHIDBUSH = "挖出来的兰草。",--兰草花丛（铲起物品状态）
        CUTTED_ORCHIDBUSH = "兰草的种子。",--兰草种籽
        NEVERFADEBUSH = {--永不凋零花丛
            GENERIC = "永不凋零……真的吗？好神奇！",--默认成熟
            PICKED = "长得好快！",--已采摘/还在生长
        },
        NEVERFADE = "时间好像静止了……好神奇的魔法！",--永不凋零
        NIGHTROSEBUSH = {--夜玫瑰花丛
            BARREN = "暗影植物也需要肥料吗？",--需要施肥
            WITHERED = "即使是暗影也怕热啊。",--过热
            GENERIC = "暗影玫瑰，有种神秘的美感。",--默认成熟
            PICKED = "已经采过了。",--已采摘
            BURNING = "噩梦在燃烧……",--燃烧
        },
        DUG_NIGHTROSEBUSH = "拿着有点凉飕飕的。",--夜玫瑰花丛（铲起物品状态）
        CUTTED_NIGHTROSEBUSH = "这个果子……感觉不能吃。",--夜玫瑰棘果
        SACHET = "香香的小包，闻着好舒服。",--香包
        PICK_ROSEBUSH = "哎呀！被刺扎到了！",--采摘蔷薇丛概率触发
        FOLIAGEATH = {--青枝绿叶
            MERGED = "伪装完美！",--已含有剑
            GENERIC = "空的剑鞘。",--鞘中无剑
        },
        FOLIAGEATH_MYLOVE = "藏在植物里的剑！",--青锋剑
        --棱镜部分（美味佳肴篇）
        PETALS_ROSE = "红色的花瓣。",--蔷薇花瓣
        PETALS_LILY = "洁白的花瓣。",--蹄莲花瓣
        PETALS_ORCHID = "兰草花瓣。适合制作植物标本。",--兰草花瓣
        PETALS_NIGHTROSE = "吸收了光线的花瓣……",--夜玫瑰花瓣
        DISH_CHILLEDROSEJUICE = "低温蔷薇提取液。好喝！",--蔷薇冰果汁
        DISH_TWISTEDROLLLILY = "精制碳水化合物点心。",--蹄莲花卷
        DISH_ORCHIDCAKE = "兰花糕。香气浓郁。",--兰花糕
        DISH_FLESHNAPOLEON = "多层酥皮结构。看起来很好吃。",--真果拿破仑
        DISH_BEGGINGMEAT = "焖肉！美拉德反应的味道！",--叫花焖肉
        DISH_FRENCHSNAILSBAKED = "焗蜗牛……这是米诺斯菜系吗？",--法式焗蜗牛
        DISH_NEWORLEANSWINGS = "烤翅！虽然不是KFC的。",--新奥尔良烤翅
        DISH_FISHJOYRAMEN = "拉面！需要趁热吃。",--鱼乐拉面
        DISH_ROASTEDMARSHMALLOWS = "烤棉花糖！糖分补给！",--烤棉花糖
        DISH_POMEGRANATEJELLY = "胶体甜点。晶莹剔透。",--石榴籽果冻
        DISH_MEDICINALLIQUOR = {--药酒
            GENERIC = "草本提取物乙醇溶液。闻起来有药味。",--查看药酒
            DRUNK = "呜……好苦……数据记录：口感极差。"--喝下药酒
        },
        DISH_BANANAMOUSSE = "香蕉慕斯。口感绵密。",--香蕉慕斯
        DISH_RICEDUMPLING = "粽子！这种包裹方式很特别。",--金黄香粽
        DISH_DURIANTARTARE = "检测到硫化物气味……这真的能吃吗？",--怪味鞑靼
        DISH_MERRYCHRISTMASSALAD = "蔬菜沙拉。虽然现在可能不是节日。",--圣诞快乐沙拉
        DISH_MURMURANANAS = "菠萝咕咾肉！酸甜适口。",--松萝咕咾肉
        DISH_SHYERRYJAM = "果酱。高糖分警告。",--颤栗果酱
        DISH_SUGARLESSTRICKMAKERCUPCAKES = { --无糖捣蛋鬼纸杯蛋糕
            GENERIC = "看起来像普通的蛋糕。扫描未发现异常。",--检查？还是吃下？
            TRICKED = "哇！吓我一跳！机关吗？",--被惊吓
            TREAT = "这是给你的补给。",--给予他人糖果
        },
        DISH_L_MOONCAKE = "月饼。高热量预警。",--月饼
        DISH_L_FLOWERBUN = "花型面点。很精致。",--花儿粑
        DISH_FAREWELLCUPCAKE = "这个蛋糕的名字……有点伤感。",--临别的纸杯蛋糕
        DISH_BRAISEDMEATWITHFOLIAGES = "蕨叶扣肉。脂肪含量较高。",--蕨叶扣肉
        WRAPPEDSHRIMPPASTE = "虾滑卷！我最喜欢的……之一！",--白菇虾滑卷
        DISH_SOSWEETJARKFRUIT = "糖度超标的松萝蜜！",--甜到裂开的松萝蜜
        DISH_FRIEDFISHWITHPUREE = "果泥佐鱼排。奇妙的搭配。",--果泥香煎鱼
        DISH_TOMAHAWKSTEAK = {--牛排战斧
            GENERIC = "过量的蛋白质！但我喜欢！",--查看
            CHOP = "嘿！",--触发秒树
            ATK = "战斗模式！",--触发单挑
        },
        DISH_LOVINGROSECAKE = "玫瑰酥。形状很完美。",--倾心玫瑰酥
        DISH_MUSHEDEGGS = "双菇烩蛋。蛋白质和维生素。",--双菇烩蛋
        DISH_MUSHEDKOI = "巨型汉堡！我要开动了！",--菌鱼双鲜堡
        DISH_MUSHEDMILK = "这名字……很有诗意。",--香蕈双峰
        DISH_BEANCONGEE = "清豆粥。适合清理肠胃。",--清豆粥
        DISH_SEEDSCONGEE = "春来多喜粥。名字真好听。",--春来多喜粥
        --棱镜部分（祈雨祭）
        RAINDONATE = {--雨蝇
            GENERIC = "昆虫翅膀具有类似宝石的光泽。",--默认状况（放在地上）
            HELD = "它停靠在我的手上了。没有攻击性。",--拿在手上
        },
        MONSTRAIN = {--雨竹
            SUMMER = "极度缺水。",--夏天枯萎
            WINTER = "低温休眠中。",--冬天冬眠
            GENERIC = "检测到毒性反应。请勿触碰。",--默认成熟
            PICKED = "采集时务必小心。",--摘下后
        },
        MONSTRAIN_WIZEN = "处于脱水状态的块茎。",--雨竹块茎
        DUG_MONSTRAIN = "这个块茎含有毒素吗？",--雨竹块茎（物品形态）
        SQUAMOUSFRUIT = "这种水果……怎么下口呢？",--鳞果
        MONSTRAIN_LEAF = "叶片含有生物碱毒素。",--雨竹叶
        BOOK_WEATHER = "能够操控局部气象的书籍。",--多变的云
        MERM_SCALES = "鱼人表皮组织。覆盖着粘液。",--鱼鳞
        HAT_MERMBREATHING = "水下呼吸装置？原理是鳃吗？",--鱼之息
        AGRONSSWORD = "古老的合金剑。密度很高。",--艾力冈的剑
        GIANTSFOOT = "巨人的……脚部标本？好大！",--巨人之脚
        REFRACTEDMOONLIGHT = "固化的月能实体。",--月折宝剑
        MOONDUNGEON = {--月的地下城
            SLEEP = "处于休眠状态的地下结构。",--未激活
            GENERIC = "神秘的地下城建筑。可能有古代科技。",--已激活
        },
        HIDDENMOONLIGHT = "时间静止容器。原理是什么呢？",--月藏宝匣
        HIDDENMOONLIGHT_INF = "检测到无限的空间折叠。",--月藏宝匣·无限
        HIDDENMOONLIGHT_ITEM = "宝匣的组装部件。",--月藏宝匣套件
        REVOLVEDMOONLIGHT = "以宝石为燃料的燃烧单元。好奢侈。",--月轮宝盘
        REVOLVEDMOONLIGHT_ITEM = "移动存储升级组件？",--月轮宝盘套件
        SIMMEREDMOONLIGHT = "利用月能进行烹饪。味道会很特别。",--月炆宝炊
        SIMMEREDMOONLIGHT_INF = "永恒能源炉？",--月炆宝炊·无限
        SIMMEREDMOONLIGHT_ITEM = "便携式月火源。",--月炆宝炊套件
        POND_L_SMOKE = "热气腾腾的温泉！可以进行地热研究……如果有时间的话。",--气熏温泉
        FERN_L = "耐酸性蕨类植物。",--耐酸蕨类
        ICELEGUME_L = "低温环境下的豆科植物。",--冰皂草
        BEAN_L_ICE = "像冰块一样的种子。",--冰皂豆
        PEBBLEITEM_L_NITRE = "不稳定的硝石块。",--碎石块
        ROCK_L_NITRE = "富含硝酸钾的矿石。",--硝石堆
        PONDBLDG_SOAK = "小型水体设施。",--澡花壳
        PONDBLDG_FISH = "为鱼类提供栖息环境。",--鱼栖壳
        --棱镜部分（丰饶传说篇）
        PINEANANAS = "松果和菠萝的嵌合体？",--松萝
        PINEANANAS_COOKED = "热处理后的嵌合果实。",--烤松萝
        PINEANANAS_SEEDS = "基因嵌合种子。",--嵌合种子
        PINEANANAS_OVERSIZED = "巨型个体！",--巨型松萝
        CROPGNAT = "农业害虫群。需要治理。",--植害虫群
        INFESTER = "寄生虫群！不要过来！",--叮咬虫群
        AHANDFULOFWINGS = "昆虫的翅膀碎片。",--虫翅碎片
        INSECTSHELL_L = "几丁质外壳。",--虫甲碎片
        BOLTWINGOUT = "虽然是翅膀，但能带人飞吗？",--脱壳之翅
        BOLTWINGOUT_SHUCK = "蜕下的空壳。",--羽化后的壳
        MINT_L = "荆芥属植物。猫科动物会喜欢。",--猫薄荷
        CATTENBALL = "毛毡球。",--猫线球
        SIVING_ROCKS = "检测到生命反应的石头。",--子圭石
        SIVING_DERIVANT_ITEM = "突变的硅基生物？真神奇。",--子圭奇型岩
        SIVING_DERIVANT = {--子圭奇型岩（子圭树形态）
            GENERIC = "它会长成某种硅基植物吗？",--刚种下
            LV1 = "发芽了！",--一级大小
            LV2 = "生长速率正常。",--二级大小
            LV3 = "已完全成熟。体型巨大。",--三级大小（最大）
            NOTTHIS = "拒绝摄入该物质。",--给予/献祭错误物品
        },
        SIVING_THETREE = {--子圭神木岩
            GENERIC = "神木……好神圣的感觉！",--检查
            NEEDALL = "它需要生命和光芒的力量。",--献祭物品且未达到召唤要求
            NEEDLIGHT = "还需要更多光。",--献祭物品且生命能量已达到要求
            NEEDHEALTH = "还需要更多生命力。",--献祭物品且光耀能量已达到要求
            NONEED = "它满足了！要召唤什么东西吗？！",--献祭成功即将召唤玄鸟
            NOTTHIS = "这个不行呢。",--献祭错误物品
        },
        SIVING_SOIL_ITEM = "特殊的土壤。",--未放置的子圭·垄
        SIVING_SOIL = "很肥沃的土壤！",--子圭·垄
        SIVING_CTLWATER_ITEM = "可以自动浇水的装置。",--未放置的子圭·利川
        SIVING_CTLWATER = {--子圭·利川
            GENERIC = "自动浇水器！省时省力！",--检查
            ISFULL = "水满了。",--给予水分且已满
            REFUSE = "这个装不进去。",--给予无水物品
        },
        SIVING_CTLDIRT_ITEM = "可以自动施肥的装置。",--未放置的子圭·益矩
        SIVING_CTLDIRT = {--子圭·益矩
            GENERIC = "自动施肥器！好方便！",--检查
            ISFULL = "肥料满了。",--给予肥料/可作为肥料物品且对应肥料已满
            REFUSE = "这个不是肥料。",--给予无肥料物品
        },
        SIVING_CTLALL_ITEM = "这是什么装置呢？",--未放置的子圭·崇溟
        SIVING_CTLALL = {--子圭·崇溟
            GENERIC = "综合控制器，结构好复杂！",--检查
            ISFULL = "装满了。",--对应物品已满
            REFUSE = "这个不行。",--给予非肥料/无水物品
        },
        FISHHOMINGTOOL_NORMAL = "简易的打窝工具。",--简易打窝饵制作器
        FISHHOMINGTOOL_AWESOME = "专业的打窝工具！效果肯定更好！",--专业打窝饵制作器
        FISHHOMINGBAIT = "希望能引来大鱼！",--打窝饵
        PLANT_CROP_L = { --异种通用检查台词
            WITHERED = "枯萎了……",--枯萎
            GROWING = "在长高呢！",--生长中
            BLOOMY = "开花了！",--花期
            READY = "丰收啦！",--长成
        },
        SEEDS_CROP_L = "这是什么作物的种子呢？",--异种种子通用检查台词
        SIVING_TURN = {--子圭·育
            GENERIC = "可以转化东西的装置！",--默认检查
            DONE = "转化完成了！",--转化完成
            DOING = "正在转化中……",--转化中
            NOENERGY = "没有能量了。",--无能量
        },
        SIVING_FEATHER_REAL = "真的羽毛！",--子圭·翰
        SIVING_FEATHER_FAKE = "看起来像真的羽毛。",--子圭玄鸟绒羽
        SIVING_FEATHER_LINE = "用羽毛做的绳子？好特别！",--牵羽牵寻
        SIVING_MASK = "戴上面具，感觉好神秘！",--子圭·汲
        SIVING_MASK_GOLD = "金色的面具，好华丽！",--子圭·歃
        SIVING_SUIT = "羽毛做的衣服，好轻便！",--子圭·庇
        SIVING_SUIT_GOLD = "金色的衣服，又轻又结实！",--子圭·釜
        SIVING_EGG = "好大的蛋！会孵出什么呢？",--子圭石子
        SIVING_PHOENIX = {--子圭玄鸟
            GENERIC = "哇！好大的鸟！",--一阶段俩鸟都在的状态
            GRIEF = "它看起来很悲伤……",--二阶段悲愤状态
        },
        SIVING_BOSS_FLOWER = "这朵花……好像有攻击性！",--子圭寄生花
        SIVING_BOSSFEA_REAL = "好漂亮的翎羽！",--精致子圭翎羽
        SIVING_BOSSFEA_FAKE = "这个会爆炸，要小心！",--子圭翎羽
        SIVING_BOSS_ROOT = "这是它的根吗？",--子圭突触
        HAT_ELEPHEETLE = "甲壳素头盔。",--犀金胄甲
        ARMOR_ELEPHEETLE = "高强度甲壳护甲。",--犀金护甲
        LANCE_CARROT_L = "以胡萝卜为原型的长柄武器？",--胡萝卜长枪
        PLANT_PLANTMEAT_L = { --巨食草（生长阶段）
            GROWING = "它在慢慢长大。",--生长？
            READY = "长大了……会吃人吗？",--即将长成
            WITHERED = "枯萎了。",--枯萎
            BLOOMY = "居然会开花！",--开花
        },
        PLANT_NEPENTHES_L = "食人花！虽然是养的，但还是要小心。",--巨食草（成熟阶段）
        PLANT_LOG_L = { --云青松
            GROWING = "小松树在长高。",--一二阶段？
            READY = "可以砍伐了！",--三阶段（可砍）
            WITHERED = "生病了吗？",--枯萎
            BLOOMY = "松树开花了！",--开花
        },
        PLANT_BERRIES_L = {--果攀树
            GROWING = "藤蔓在长高。",--生长
            READY = "好多果子！",--长成
            WITHERED = "虫子把它弄坏了。",--枯萎
            BLOOMY = "花开得好漂亮！",--开花
        },
        PLANT_CACTUS_MEAT_L = {--仙人柱
            GROWING = "小心刺哦。",--生长
            READY = "好多刺啊。",--长成
            WITHERED = "仙人掌也会枯萎吗？",--枯萎
            BLOOMY = "仙人掌的花好美！",--开花
        },
        PLANT_CARROT_L = {--芾萝卜
            GROWING = "萝卜在长叶子。",--生长
            READY = "大萝卜！",--长成
            WITHERED = "萝卜枯萎了。",--枯萎
            BLOOMY = "萝卜开花了。",--开花
        },
        PLANT_LIGHTBULB_L = {
            GROWING = "发光的植物在长大。",--生长
            READY = "像灯泡一样亮！",--长成
            WITHERED = "光芒黯淡了。",--枯萎
            BLOOMY = "发光的花！",--开花
        },
        OINTMENT_L_SIVBLOODREDUCE = "涂上这个就不痛了。",--弱肤药膏
        TISSUE_L = "这是……活的组织？",--活性组织通用台词
        CUTTED_LUMPYEVERGREEN = "可以进行无性繁殖吗？",--臃肿常青树嫩枝
        BOXOPENER_L = "云松的种籽。",--云松子
        SIVING_BOXOPENER = "子圭的种籽。",--子圭·系
        --棱镜部分（电闪雷鸣篇）
        ELECOURMALINE = "高压发生器。需要遵守安全协议。",--电气重铸台
        ELECOURMALINE_KEYSTONE = "能量基石。",--要石
        FIMBUL_AXE = "附带电荷的斧头。小心触电。",--芬布尔斧
        HAT_COWBOY = "我是……西部考察员！",--牛仔帽
        DUALWRENCH = "双头扳手。工程作业必备。",--扳手
        ELECARMET = "电磁装置？用途不明。",--莱克阿米特
        TOURMALINECORE = "能量核心。警告：高压。",--电气石
        TOURMALINESHARD = "带电晶体碎片。",--带电的晶石
        ICIRE_ROCK = {--鸳鸯石
            FROZEN = "温度极低！",--最冷
            COLD = "吸热反应。",--凉爽
            GENERIC = "双生矿石结构。",--正常
            WARM = "放热反应。",--温暖
            HOT = "温度极高！",--最热
        },
        GUITAR_MIGUEL = "声学乐器。可以弹奏出美妙的旋律。",--米格尔的吉他
        WEB_HUMP_ITEM = "丝囊标记物。",--蛛网标记
        WEB_HUMP = --蛛网标记(放下)
        {
            GENERIC = "标记点已设立。",--放下后
            TRYDIGUP = "回收标记。",--破坏
        },
        TRIPLESHOVELAXE = "多功能复合工具。效率提升！",--斧铲-三用型
        TRIPLEGOLDENSHOVELAXE = "黄金版多功能工具。耐用度很成问题……",--斧铲-黄金三用型
        AT_ALBICANS_MUSHROOM = { --素白蘑菇帽
            GENERIC = "白色的蘑菇。",--检查
            HUNGER = "饿了……没力气激活它。"--激活时饥饿导致激活失败
        },
        ALBICANS_CAP = "真菌子实体。",--采摘的素白菇
        ALBICANS_CAP_COOKED = "经过热处理的真菌。",--熟素白菇
        SOUL_CONTRACTS = {--灵魂契约
            GENERIC = "契约书……",--检查
            SIGN = "建立连接。",--签订契约
            TERMINATE = "断开连接。",--解除契约
            WRONG = "协议错误。",--失败
            NOTMINE = "访问权限被拒绝。",--操控非自己的契约
            SOULLESS = "未检测到灵魂波长。",--提取灵魂且契约已无灵魂
            OWNERSOULLESS = "灵魂容器为空。",--存储灵魂且自身无灵魂
            NOBOOK = "目标未找到。",--分享时周围无契约
            BOOKISFULL = "目标存储已满。",--分享灵魂失败
            BOOKISHIGH = "数据已存在。",--分享灵魂图，且周围契约已记录相同的灵魂图
            RECORDED = "已归档。",--这两句是拥有契约时的检查后缀，这句是已记录
            NOTRECORDED = "未归档。"
        },
        EXPLODINGFRUITCAKE = "内含爆炸物的糕点？谁设计的？",--爆炸水果蛋糕
        CHESTUPGRADER_L = "存储空间扩容组件。",--月石角撑

        --棱镜部分（尘世蜃楼篇）
        SHIELD_L_SAND = { --砂之抵御
            GENERIC = "硅酸盐复合盾牌。结构松散。",--检查
            WEAK = "吸水后结构强度下降。",--下雨时攻击？
            INSANE = "可能含有致幻矿物成分。",--低san？
        },
        SHYERRYTREE = {--颤栗树
            BURNING = "植物体正在燃烧！",--燃烧
            GENERIC = "表现出应激反应的植物。",--默认
        },
        SHYERRYCORE_PLANTED = { --不正常的颤栗树之心
            BURNING = "核心结构受损！",--燃烧
            WEAK = "刚种下去，还很弱小。",--刚种下的一阶段
            GROWING = "正在恢复活性。",--二阶段
            STRONG = "能量反应强烈。",--三阶段(最大)
        },
        SHYERRYFLOWER = {--颤栗花
            BURNING = "花朵正在燃烧！",--燃烧
            GENERIC = "具有神经质特征的花朵。",--检查
            SHY = "产生防御性闭合。",
        },
        SHYERRY = "富含某种生物碱的果实。",--颤栗果
        SHYERRY_COOKED = "生物碱已被破坏。",--烤颤栗果
        SHYERRYLOG = "宽大的木材切片。",--宽大的木墩
        SHYERRYCORE = {
            BURNING = "核心结构燃烧中！",--燃烧
            WEAK = "活性低下的核心。",--一阶段
            GROWING = "核心正在发育。",--二阶段
            STRONG = "完全成熟的核心。",--三阶段（最大）
        },
        SHYERRYCORE_ITEM = "名为“心芽”的繁殖体。",--颤栗树心芽
        GUITAR_WHITEWOOD =--白木吉他
        {
            GENERIC = "声学乐器。材质很轻。",--检查
            FAILED = "必须调整音频。",--弹错了
            HUNGRY = "能量不足，无法进行艺术活动。",--饥饿时弹奏
        },
        PINKSTAFF = "能够折射光线的法杖？",--幻象法杖
        THEEMPERORSCROWN = "某种权力的象征物。",--皇帝的王冠
        THEEMPERORSMANTLE = "一件披风。",--皇帝的披风
        THEEMPERORSSCEPTER = "金属杖。",--皇帝的权杖
        THEEMPERORSPENDANT = "饰品。",--皇帝的吊坠
        MAT_WHITEWOOD_ITEM = "地板铺设材料。",--白木地片
        CHEST_WHITEWOOD = { --白木展示台
            GENERIC = "小型展示单元。", --默认
            BURNT = "碳化严重。" --烧毁
        },
        CHEST_WHITEWOOD_INF = "具有空间折叠特性的展示台。",--白木展示台·无限
        CHEST_WHITEWOOD_BIG = {--白木展示柜
            GENERIC = "大型展示柜。",--默认
            BURNT = "碳化严重。"--烧毁
        },
        CHEST_WHITEWOOD_BIG_INF = "具有空间折叠特性的展示柜。",--白木展示柜·无限
        OINTMENT_L_FIREPROOF = "阻燃涂层。",--防火漆
        ACC_L_SHADOWMIRROR = "光学反射装置……或者是暗影通道？",--捉影之镜
        WAXED_ITEM_L = "经过封蜡处理的标本。",--影织物品（非植物）
        POT_WHITEWOOD = {--稀有基质培植盆
            GENERIC = "空白的培养皿。",--默认（空）
            BARREN = "需要肥料啦！",--需要肥料
            ALITTLE = "刚种下去。",--刚种下去
            SOME = "正在生长。",--生长中
            LOTS = "长满了！",--生长至最大
            WRONGITEM = "不能放这个。",--给予错误物品
            NONEED = "不需要了。"--给予物品但已满
        },
        SHADOWBRUSH_L = "可以刷出影子的刷子？",--细微之触
        --棱镜部分（其他）
        BACKCUB = "小熊背包，好可爱！",--靠背熊
        SHIELD_L_LOG = "木头做的盾牌。",--木盾

    },

    DESCRIBE_GENERIC = "这是什么呢？我还不太清楚。",        --检查物品描述的缺省值
    DESCRIBE_TOODARK = "太黑了，什么都看不见。",      --物品处于黑暗处检查
    DESCRIBE_SMOLDERING = "着火了！快灭火！",       --冒烟

    DESCRIBE_PLANTHAPPY = "它看起来很开心！",       --评估的植物无压力
    DESCRIBE_PLANTVERYSTRESSED = "它看起来很难受……",        --评估植物有多种压力
    DESCRIBE_PLANTSTRESSED = "它好像有点不舒服。",        --评估作物有两种压力
    DESCRIBE_PLANTSTRESSORKILLJOYS = "周围太乱了，它不喜欢。",      --评估作物压力来自杂物
    DESCRIBE_PLANTSTRESSORFAMILY = "它需要同伴。",      --评估作物压力来自家庭
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "太挤了，它透不过气。",        --评估作物压力来自拥挤
    DESCRIBE_PLANTSTRESSORSEASON = "现在的季节不适合它生长。",        --评估作物压力来自季节
    DESCRIBE_PLANTSTRESSORMOISTURE = "它渴了，需要浇水。",        --评估作物压力来自水分
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "它饿了，需要肥料。",		--评估作物压力来自肥料
    DESCRIBE_PLANTSTRESSORHAPPINESS = "它想有人陪它说说话。",     --评估作物压力来自对话

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "这个蛋……好像快孵化了。",--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "这个不能吃哦。",--吃节日欢愉
    },

    WENDY_SKILLTREE_EASTEREGG = "好像感觉到了什么……",--温蒂技能树通灵板彩蛋触发台词

}
