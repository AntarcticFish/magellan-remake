---@diagnostic disable: lowercase-global, undefined-global, trailing-space

---@type data_recipe[]
local data = {
	-- {
	-- 	recipe_name = 'choleknife_recipe_1', --食谱ID
	-- 	ingredients = { --配方
	-- 		Injectatlas('pack_gold',1), 
	-- 		Ingredient('rope',2), 
	-- 		Ingredient('log',2),
	-- 	},
	-- 	tech = TECH.SCIENCE_ONE, --所需科技 ,TECH.LOST 表示需要蓝图才能解锁
	-- 	isOriginalItem = true, --是官方物品(官方物品严禁写atlas和image路径,因为是自动获取的),不写则为自定义物品
	-- 	config ={ --其他的一些配置,可不写
	-- 		--制作出来的物品,不写则默认制作出来的预制物为食谱ID
	-- 		product = 'choleknife', 
	-- 		--xml路径,不写则默认路径为,'images/inventoryimages/'..product..'.xml' 或 'images/inventoryimages/'..recipe_name..'.xml'
	-- 		atlas = 'images/choleknife.xml',
	-- 		--图片名称,不写则默认名称为 product..'.tex' 或 recipe_name..'.tex'
	-- 		image = 'choleknife.tex',
	-- 		--制作出的物品数量,不写则为1
	-- 		numtogive = 40,
	-- 		--不需要解锁
	-- 		nounlock = false,
	-- 	},
	-- 	filters = {'CHARACTER'} --将物品添加到这些分类中
	-- },
	{
		recipe_name = 'mgl_book1',
		ingredients = {
			Ingredient("transistor", 5), 
			Ingredient("goldnugget", 7), 
			Ingredient("beeswax", 4)
		},
		tech = TECH.NONE,
		config = {
			builder_tag = 'mgl',
			atlas = 'images/inventoryimages/mgl_book1.xml',
			image = 'mgl_book1.tex',
			numtogive = 1,
			nounlock = true,
		},
		filters = {'CHARACTER', 'MODS'}
	},
	{
		recipe_name = 'mgl_book2',
		ingredients = {
			Ingredient("transistor", 8), 
			Ingredient("gunpowder", 3), 
			Ingredient("glommerfuel", 2), 
			Ingredient("thulecite", 3)
		},
		tech = TECH.NONE,
		config = {
			builder_tag = 'mgl',
			atlas = 'images/inventoryimages/mgl_book2.xml',
			image = 'mgl_book2.tex',
			numtogive = 1,
			nounlock = true,
		},
		filters = {'CHARACTER', 'MODS'}
	},
	{
		recipe_name = 'mgl_chargerfuel',
		ingredients = {
			Ingredient("transistor", 2), 
			Ingredient("redgem", 1)
		},
		tech = TECH.SCIENCE_TWO,
		config = {
			builder_tag = 'mgl',
			atlas = 'images/inventoryimages/mgl_chargerfuel.xml',
			image = 'mgl_chargerfuel.tex',
		},
		filters = {'CHARACTER', 'MODS'}
	},
	{
		recipe_name = 'mgl_d99',
		ingredients = {
			Ingredient("transistor", 5), 
			Ingredient("purplegem", 1), 
			Ingredient("goldnugget", 5), 
			Ingredient("silk", 5)
		},
		tech = TECH.MAGIC_TWO,
		config = {
			builder_tag = 'mgl',
			atlas = 'images/inventoryimages/mgl_d99.xml',
			image = 'mgl_d99.tex',
		},
		filters = {'CHARACTER', 'MODS'}
	},
	{
		recipe_name = 'mgl_mapper_item',
		ingredients = {
			Ingredient("moonglass", 5), 
			Ingredient("goldnugget", 3), 
			Ingredient("transistor", 2), 
			Ingredient("trinket_6", 2)
		},
		tech = TECH.SCIENCE_TWO,
		config = {
			builder_tag = 'mgl',
			atlas = 'images/inventoryimages/mgl_mapper_item.xml',
			image = 'mgl_mapper_item.tex',
		},
		filters = {'CHARACTER', 'MODS'}
	}
}

---@type data_destruction_recipes[]
local destruction_recipes = {
}

return data,destruction_recipes