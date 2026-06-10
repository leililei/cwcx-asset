require("LocalData/SkillLocalData")
---@class AbyssBuffData 活动数据
AbyssBuffData = Class("AbyssBuffData")

function AbyssBuffData:ctor(buffID)
    if SkillLocalData.tab[buffID] ~= nil then
        self.id = buffID
        self.skill = JNSkill:new(buffID, 10,true,true)
    end
end

return AbyssBuffData