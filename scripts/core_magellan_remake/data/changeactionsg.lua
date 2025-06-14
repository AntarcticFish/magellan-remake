---@diagnostic disable: lowercase-global, undefined-global, trailing-space

---@type data_changeactionsg[]
local data = {
    -- {
    --     action = 'BUILD',
    --     sg = 'doshortaction',
    --     testfn = function (doer)
    --         return doer and doer:HasTag("player")
    --     end,
    --     testfn_client = function (doer)
    --         return doer and doer:HasTag("player")
    --     end
    -- }
    {
        action = 'ATTACK',
        sg = 'mgl_attack_prepare',
        testfn = function (inst, action)
            local isdead = inst.replica.health and inst.replica.health:IsDead()
            local item = inst.replica.inventory and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            local target = action.target
            local combat = inst.components.combat or inst.replica.combat
            local isriding = inst.replica.rider:IsRiding()
            if isdead or isriding or not (item and target and item:IsValid() and target:IsValid() and combat) then
                return false
            end
            if item:HasTag("mgl_mapper") then
                return true
            end

            return false
        end,
        testfn_client = function (inst, action)
            local isdead = inst.replica.health and inst.replica.health:IsDead()
            local item = inst.replica.inventory and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            local target = action.target
            local combat = inst.components.combat or inst.replica.combat
            local isriding = inst.replica.rider:IsRiding()
            if isdead or isriding or not (item and target and item:IsValid() and target:IsValid() and combat) then
                return false
            end
            if item:HasTag("mgl_mapper") then
                return true
            end

            return false
        end
    },
}
return data