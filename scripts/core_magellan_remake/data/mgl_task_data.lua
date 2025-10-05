-- 任务数据文件
-- 存储所有任务的详细信息，包括标题、要求、奖励以及需要提交的物品列表

local task_data = {
    {
        id = 1,
        title = "收集5个木材",
        completed = false,
        requirement = "在森林中收集5个木材",
        reward = "50点科研点数",
        -- 任务需要提交的物品列表，使用键值对数组形式
        required_items = {
            {item = "log", amount = 5}
        },
        -- 任务奖励物品
        reward_items = {
            {item = "mgl_science_points", amount = 50}
        }
    },
    {
        id = 2,
        title = "制作科学机器",
        completed = false,
        requirement = "使用1个黄金、4个木材和4个石头制作科学机器",
        reward = "100点科研点数",
        required_items = {
            {item = "goldnugget", amount = 1},
            {item = "log", amount = 4},
            {item = "rocks", amount = 4}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 100}
        }
    },
    {
        id = 3,
        title = "研究新科技",
        completed = false,
        requirement = "使用科学机器研究至少3个新配方",
        reward = "100点科研点数",
        required_items = {
            -- 这个任务是研究任务，不需要提交物品
        },
        reward_items = {
            {item = "mgl_science_points", amount = 100}
        },
        -- 特殊任务类型标记
        task_type = "research",
        research_count = 3
    },
    {
        id = 4,
        title = "探索洞穴",
        completed = false,
        requirement = "找到并进入地下洞穴",
        reward = "80点科研点数",
        required_items = {
            -- 探索任务，不需要提交物品
        },
        reward_items = {
            {item = "mgl_science_points", amount = 80}
        },
        task_type = "exploration",
        exploration_target = "cave"
    },
    {
        id = 5,
        title = "制作二本科技",
        completed = false,
        requirement = "使用4个木板、2个石砖和4个黄金制作炼金引擎",
        reward = "150点科研点数",
        required_items = {
            {item = "boards", amount = 4},
            {item = "cutstone", amount = 2},
            {item = "goldnugget", amount = 4}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 150}
        }
    },
    {
        id = 6,
        title = "收集10个石头",
        completed = false,
        requirement = "在地面收集10个石头",
        reward = "30点科研点数",
        required_items = {
            {item = "rocks", amount = 10}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 30}
        }
    },
    {
        id = 7,
        title = "种植浆果丛",
        completed = false,
        requirement = "种植至少3个浆果丛",
        reward = "30点科研点数",
        required_items = {
            -- 种植任务，不需要提交物品
        },
        reward_items = {
            {item = "mgl_science_points", amount = 30}
        },
        task_type = "planting",
        plant_count = 3,
        plant_type = "berrybush"
    },
    {
        id = 8,
        title = "制作避雷针",
        completed = false,
        requirement = "使用3个黄金制作避雷针",
        reward = "40点科研点数",
        required_items = {
            {item = "goldnugget", amount = 3}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 40}
        }
    },
    {
        id = 9,
        title = "制作背包",
        completed = false,
        requirement = "使用4个蜘蛛网和4个树枝制作背包",
        reward = "45点科研点数",
        required_items = {
            {item = "spiderweb", amount = 4},
            {item = "twigs", amount = 4}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 45}
        }
    },
    {
        id = 10,
        title = "收集20个草",
        completed = false,
        requirement = "在草原收集20个草",
        reward = "20点科研点数",
        required_items = {
            {item = "cutgrass", amount = 20}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 20}
        }
    },
    {
        id = 11,
        title = "制作木甲",
        completed = false,
        requirement = "使用8个木材制作木甲",
        reward = "50点科研点数",
        required_items = {
            {item = "log", amount = 8}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 50}
        }
    },
    {
        id = 12,
        title = "制作火坑",
        completed = false,
        requirement = "使用3个石头、2个木材和3个草制作火坑",
        reward = "35点科研点数",
        required_items = {
            {item = "rocks", amount = 3},
            {item = "log", amount = 2},
            {item = "cutgrass", amount = 3}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 35}
        }
    },
    {
        id = 13,
        title = "收集3个黄金",
        completed = false,
        requirement = "通过挖矿收集3个黄金",
        reward = "70点科研点数",
        required_items = {
            {item = "goldnugget", amount = 3}
        },
        reward_items = {
            {item = "mgl_science_points", amount = 70}
        }
    }
}

return task_data