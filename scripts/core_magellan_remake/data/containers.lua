---@diagnostic disable: lowercase-global, undefined-global, trailing-space

---@type data_containerUI
local params = {}
-- params.new_ui = {
--     widget =
--     {
--         animbank = 'ui_chest_3x3',
--         animbuild = 'ui_chest_3x3', 
--         slotpos = {},
--         slotbg = {},
--         pos = Vector3(-340, -120, 0),
--         side_align_tip = 160,
--         buttoninfo = {
--             text = 'hit',
--             position = Vector3(0, 80*-2+10, 0),
--         },
--         dragtype_drag = 'new_ui',
--         unique = 'new_ui',
--     },
--     type = 'new_ui',
--     itemtestfn = function(container, item, slot)
--         -- if slot == nil then -- 这样设置就能让shift左键失效,还能保证giveitem能用,我也不知道原因,群佬没告诉我
--         --     return false 
--         -- end
--         -- if item:HasTag('gem') then return true end
--         -- return false
--     end
-- }

-- for y = 2, 0, -1 do
--     for x = 0, 1 do
--         table.insert(params.new_ui.widget.slotpos, Vector3(80 * (x - 2) + 130, 80 * (y - 2) + 75, 0))
--         -- table.insert(params.new_ui.widget.slotbg, { atlas="images/slotbg/.xml",image = ".tex" })
--     end
-- end
-- 运输无人机的3x3容器UI定义
params.uav_container = {
    widget =
    {
        animbank = 'ui_chest_3x1',
        animbuild = 'ui_chest_3x1', 
        slotpos = {},
        slotbg = {},
        pos = Vector3(340, -250, 0),
        dragtype_drag = 'uav_container',
        unique = 'uav_container',
    },
    type = 'uav_container', -- 背包类型容器
    itemtestfn = function(container, item, slot)
        if slot == nil then -- 这样设置就能让shift左键失效,还能保证giveitem能用,我也不知道原因,群佬没告诉我
            return false 
        end
        return true
    end
}

for x = 1, 3 do
    table.insert(params.uav_container.widget.slotpos, Vector3(80 * (x - 2), 0, 0)) 
    -- table.insert(params.uav_container.widget.slotbg, { atlas="images/ui.xml", image = "slot.tex" })
end

return params