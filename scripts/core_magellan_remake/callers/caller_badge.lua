---@diagnostic disable: lowercase-global, undefined-global, trailing-space

local modid = 'magellan_remake'

local data = _require('core_'..modid..'/data/badges')

API.BADGE:main(data)