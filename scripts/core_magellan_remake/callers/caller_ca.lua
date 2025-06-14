---@diagnostic disable: lowercase-global, undefined-global, trailing-space

local modid = 'magellan_remake'

local data,change = _require('core_'..modid..'/data/componentactions')

API.CA:main(data,change)