-- 猴子诅咒免疫功能
-- 为麦哲伦角色添加猴子诅咒免疫

local function IsImmune(inst)
    -- 检查是否为麦哲伦角色，如果是则免疫猴子诅咒
    return inst:HasTag("mgl")
end

-- 重写docurse函数以添加免疫检查
local function AddMonkeyCurseImmunity()
    local curse_monkey = require("curse_monkey_util")
    -- 确保curse_monkey_util存在再进行重写
    if curse_monkey then
        local old_docurse = curse_monkey.docurse
        
        curse_monkey.docurse = function(owner, numitems)
            -- 如果角色免疫猴子诅咒，则不执行任何操作
            if IsImmune(owner) then
                return
            end
            
            -- 否则使用原始函数
            return old_docurse(owner, numitems)
        end
    end
end

-- 在游戏初始化时添加猴子诅咒免疫功能
AddMonkeyCurseImmunity()