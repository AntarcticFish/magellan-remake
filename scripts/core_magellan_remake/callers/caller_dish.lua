---@diagnostic disable: lowercase-global, undefined-global, trailing-space

local modid = 'magellan_remake'

local data = _require('core_'..modid..'/data/dishes')

API.DISH:main(data)