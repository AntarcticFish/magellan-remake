-- 科研购置商店数据
-- 这个文件存储了所有可在科研商店中购买的商品信息

local research_shop_data = {
    -- 模块类商品
    {
        id = "mgl_module1",
        name = "基础科研模块",
        description = "一个基础的科研模块，可以帮助你更好地进行科学研究。\n提升你的科研效率。",
        price = 100,
        item_prefab = "mgl_module1",
        category = "modules",
        icon_atlas = "images/inventoryimages/mgl_module1.xml",
        icon = "mgl_module1.tex"
    },
    {
        id = "mgl_module2",
        name = "高级科研模块",
        description = "一个高级的科研模块，拥有更强大的科研能力。\n显著提升你的科研效率。",
        price = 250,
        item_prefab = "mgl_module2",
        category = "modules",
        icon_atlas = "images/inventoryimages/mgl_module2.xml",
        icon = "mgl_module2.tex"
    },
    {
        id = "mgl_module_experimental",
        name = "实验型科研模块",
        description = "一个实验性质的科研模块，可能会带来意想不到的效果。\n使用时请注意安全。",
        price = 150,
        item_prefab = "mgl_module1",
        category = "modules",
        icon_atlas = "images/inventoryimages/mgl_module1.xml",
        icon = "mgl_module1.tex"
    },
    
    -- 消耗品类商品
    {
        id = "mgl_chargerfuel",
        name = "充电器燃料",
        description = "用于为移动充电器补充能量的特殊燃料。\n每个燃料可以为充电器提供持久的能量供应。",
        price = 50,
        item_prefab = "mgl_chargerfuel",
        category = "consumables",
        icon_atlas = "images/inventoryimages/mgl_chargerfuel.xml",
        icon = "mgl_chargerfuel.tex"
    },
    {
        id = "mgl_energy_cell",
        name = "高能电池",
        description = "高能量密度的电池，可为各类设备提供强劲动力。\n比普通充电器燃料更持久。",
        price = 120,
        item_prefab = "mgl_chargerfuel",
        category = "consumables",
        icon_atlas = "images/inventoryimages/mgl_chargerfuel.xml",
        icon = "mgl_chargerfuel.tex"
    },
    {
        id = "mgl_boost_potion",
        name = "科研加速药水",
        description = "临时提升科研效率的特殊药水。\n使用后短时间内大幅提高科研速度。",
        price = 80,
        item_prefab = "mgl_chargerfuel",
        category = "consumables",
        icon_atlas = "images/inventoryimages/mgl_chargerfuel.xml",
        icon = "mgl_chargerfuel.tex"
    },
    
    -- 工具类商品
    {
        id = "mgl_mapper_item",
        name = "地形测绘仪",
        description = "先进的地形测绘工具，可以帮助你探索和记录周围的地形。\n使用后可以获得周围区域的地图信息。",
        price = 300,
        item_prefab = "mgl_mapper_item",
        category = "tools",
        icon_atlas = "images/inventoryimages/mgl_mapper_item.xml",
        icon = "mgl_mapper_item.tex"
    },
    {
        id = "mgl_scanner",
        name = "资源扫描仪",
        description = "可以探测周围资源分布的高级工具。\n帮助你快速找到所需的各种材料。",
        price = 350,
        item_prefab = "mgl_mapper_item",
        category = "tools",
        icon_atlas = "images/inventoryimages/mgl_mapper_item.xml",
        icon = "mgl_mapper_item.tex"
    },
    {
        id = "mgl_analyzer",
        name = "物质分析仪",
        description = "能够分析各种物质成分的精密设备。\n使用后可获得物品的详细信息。",
        price = 250,
        item_prefab = "mgl_mapper_item",
        category = "tools",
        icon_atlas = "images/inventoryimages/mgl_mapper_item.xml",
        icon = "mgl_mapper_item.tex"
    },
    
    -- 书籍类商品
    {
        id = "mgl_book1",
        name = "科研笔记 I",
        description = "一本古老的科研笔记，记录了一些基础的科研知识。\n阅读后可以获得科研点数奖励。",
        price = 150,
        item_prefab = "mgl_book1",
        category = "books",
        icon_atlas = "images/inventoryimages/mgl_book1.xml",
        icon = "mgl_book1.tex"
    },
    {
        id = "mgl_book2",
        name = "科研笔记 II",
        description = "一本高级的科研笔记，记录了一些深奥的科研理论。\n阅读后可以获得更多的科研点数奖励。",
        price = 350,
        item_prefab = "mgl_book2",
        category = "books",
        icon_atlas = "images/inventoryimages/mgl_book2.xml",
        icon = "mgl_book2.tex"
    },
    {
        id = "mgl_blueprint",
        name = "高级蓝图集",
        description = "包含多种高级科技蓝图的珍贵书籍。\n阅读后可能获得稀有科技的制作方法。",
        price = 450,
        item_prefab = "mgl_book2",
        category = "books",
        icon_atlas = "images/inventoryimages/mgl_book2.xml",
        icon = "mgl_book2.tex"
    },
    
    -- 无人机类商品
    {
        id = "mgl_uav_item",
        name = "基础无人机",
        description = "一个基础的无人机，可以帮助你进行侦查和简单的任务。\n需要消耗充电器燃料来运行。",
        price = 400,
        item_prefab = "mgl_uav_item",
        category = "drones",
        icon_atlas = "images/inventoryimages/mgl_uav_item.xml",
        icon = "mgl_uav_item.tex"
    },
    {
        id = "mgl_uav_66",
        name = "探索者无人机",
        description = "专为探索未知区域设计的高性能无人机。\n拥有更长的续航和更强大的探测能力。",
        price = 600,
        item_prefab = "mgl_uav_66",
        category = "drones",
        icon_atlas = "images/inventoryimages/mgl_uav_66.xml",
        icon = "mgl_uav_66.tex"
    },
    {
        id = "mgl_uav_yhly",
        name = "运输无人机",
        description = "专门用于运输物品的无人机。\n可以帮助你轻松搬运大量物资。",
        price = 700,
        item_prefab = "mgl_uav_yhly",
        category = "drones",
        icon_atlas = "images/inventoryimages/mgl_uav_yhly.xml",
        icon = "mgl_uav_yhly.tex"
    },
    
    -- 特殊商品
    {
        id = "mgl_d99",
        name = "D-99 装置",
        description = "一个神秘的装置，拥有未知的力量。\n使用时请小心谨慎。",
        price = 1000,
        item_prefab = "mgl_d99",
        category = "special",
        icon_atlas = "images/inventoryimages/mgl_d99.xml",
        icon = "mgl_d99.tex"
    },
    {
        id = "mgl_blackhole_protocol",
        name = "黑洞协议",
        description = "一个极其危险的科研项目，涉及到时空扭曲技术。\n只有最资深的科学家才能安全使用。",
        price = 2000,
        item_prefab = "mgl_blackhole_protocol",
        category = "special",
        icon_atlas = "images/inventoryimages/mgl_blackhole_protocol.xml",
        icon = "mgl_blackhole_protocol.tex"
    },
    {
        id = "mgl_wormhole_device",
        name = "虫洞生成器",
        description = "能够生成临时虫洞的高科技设备。\n可以瞬间传送到指定位置，但使用风险极高。",
        price = 1500,
        item_prefab = "mgl_blackhole_protocol",
        category = "special",
        icon_atlas = "images/inventoryimages/mgl_blackhole_protocol.xml",
        icon = "mgl_blackhole_protocol.tex"
    },
    {
        id = "mgl_quantum_core",
        name = "量子核心",
        description = "蕴含着量子能量的神秘核心。\n是制作高级科技设备的关键材料。",
        price = 3000,
        item_prefab = "mgl_blackhole_protocol",
        category = "special",
        icon_atlas = "images/inventoryimages/mgl_blackhole_protocol.xml",
        icon = "mgl_blackhole_protocol.tex"
    }
}

return research_shop_data