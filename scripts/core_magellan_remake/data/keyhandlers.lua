---@diagnostic disable: lowercase-global, undefined-global, trailing-space

---@type data_keyhandler[]
local data = {
    {
        namespace = 'magellan_remake',
        skillid = 'key_light',
        type = 'down',
        avatar = {"mgl"},
        key = SUGAR_magellan_remake:getModConfigDataFromTUNING('_key_light'),
        skill_template_type = 'none',
        fn = function(inst)
            local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if item and item:HasTag("mgl_mapper") and item.components.machine then
                if item.components.machine:IsOn() then
                    item.components.machine:TurnOff()
                elseif not item.components.machine:IsOn() then
                    item.components.machine:TurnOn()
                end
            end
        end
    },
    -- 召唤无人机
    {
        namespace = 'magellan_remake',
        skillid = 'key_call_uav',
        type = 'down',
        avatar = {"mgl"},
        key = SUGAR_magellan_remake:getModConfigDataFromTUNING('_key_call_uav'),
        skill_template_type = 'none',
        fn = function(inst)
            local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if item and item:HasTag("mgl_mapper")then
                inst.components.mgl_system:CallUav()
            end
        end
    },
    -- 使用技能
    {
        namespace = 'magellan_remake',
        skillid = 'key_mgl_skill',
        type = 'down',
        avatar = {"mgl"},
        key = SUGAR_magellan_remake:getModConfigDataFromTUNING('_key_mgl_skill'),
        skill_template_type = 'none',
        fn = function(inst)
            local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if item and item:HasTag("mgl_mapper") then
                inst.components.mgl_system:UseSkill()
            end
        end
    },
    -- 切换无人机
    {
        namespace = 'magellan_remake',
        skillid = 'key_mgl_change_uav',
        type = 'down',
        avatar = {"mgl"},
        key = SUGAR_magellan_remake:getModConfigDataFromTUNING('_key_mgl_change_uav'),
        skill_template_type = 'none',
        fn = function(inst)
            local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if item and item:HasTag("mgl_mapper") then
                inst.components.mgl_system:ChangeUav()
            end
        end
    }
}


return data