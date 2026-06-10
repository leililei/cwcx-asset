require("Model/Activity/ActivityData/ActivitySkillData")
require("Model/Activity/ActivityData/EnergyEffectData")
require("LocalData/ExpanddetailLocalData")
require("LocalData/EnergyeffectLocalData")

ActivitySkillControl = {}
---活动拓展技能升级数据
local ActivitySkill = {}
---活动拓展技能-能源储备效果数据
local SkillEnergyEff = {}

function ActivitySkillControl.Init()
    local idx = 1
    if #ActivitySkill == 0 then
        for i, v in ipairs(ExpanddetailLocalData.tab) do
            if ActivitySkill[v.activityid] == nil then
                idx = 1
                ActivitySkill[v.activityid] = {}
                ActivitySkill[v.activityid][idx] = ActivitySkillData.New(v)
            elseif ActivitySkill[v.activityid][idx] == nil then
                ActivitySkill[v.activityid][idx] = ActivitySkillData.New(v)
            end
            idx = idx+1
        end
    end
    
    if #SkillEnergyEff == 0 then
        for i, v in ipairs(EnergyeffectLocalData.tab) do
            if SkillEnergyEff[v.group] == nil then
                idx = 1
                SkillEnergyEff[v.group] = {}
                SkillEnergyEff[v.group][idx] = EnergyEffectData.New(v)
            elseif SkillEnergyEff[v.group][idx] == nil then
                SkillEnergyEff[v.group][idx] = EnergyEffectData.New(v)
            end
            idx = idx+1
        end
    end
end
---根据活动ID,获取活动技能数据
function ActivitySkillControl.GetActivitySkill(_activityID)
    return ActivitySkill[_activityID]
end
---根据关卡需求的组ID,获取能源储备数据
function ActivitySkillControl.GetEnergyEffect(_groupID)
    return SkillEnergyEff[_groupID]
end

function ActivitySkillControl.Clear()
    ActivitySkill = {}
    SkillEnergyEff = {}
end
return ActivitySkillControl