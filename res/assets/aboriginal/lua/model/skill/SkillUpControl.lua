require("LocalData/RoleattriskillupLocalData")
require("Model/Skill/Data/SkillUpData")
---加锁管理器
SkillUpControl = {}
local mSkillUpData = {}

function SkillUpControl.InitSkillUpData()
    mSkillUpData = {}
    for i, v in pairs(RoleattriskillupLocalData.tab) do
        if mSkillUpData[v[2]] == nil then
            mSkillUpData[v[2]] = {}
            mSkillUpData[v[2]][v[3]] = {}
            mSkillUpData[v[2]][v[3]][v[7]] = SkillUpData.New()
        else
            if mSkillUpData[v[2]][v[3]] == nil then
                mSkillUpData[v[2]][v[3]] = {}
                mSkillUpData[v[2]][v[3]][v[7]] = SkillUpData.New()
            end
        end
        if mSkillUpData[v[2]][v[3]][v[7]] then
            mSkillUpData[v[2]][v[3]][v[7]]:PushData(v)
        else
            mSkillUpData[v[2]][v[3]][v[7]] = SkillUpData.New()
            mSkillUpData[v[2]][v[3]][v[7]]:PushData(v)
        end

    end
end
---获取技能升级材料
function SkillUpControl.GetSkillUpData(_rank, _skillLv, _career)
    if mSkillUpData[_rank][_skillLv] == nil then
        return nil
    end
    local tData = mSkillUpData[_rank][_skillLv][_career]
    if tData == nil then
        tData = mSkillUpData[_rank][_skillLv][0]
    end
    return tData
end

---获取技能升级材料列表
function SkillUpControl.GetSkillUpDataList(_rank, _career)
    local list = {}
    for _skillLv = 0, 8 do
        local tData = mSkillUpData[_rank][_skillLv][_career]
        if tData == nil then
            tData = mSkillUpData[_rank][_skillLv][0]
        end
        list[_skillLv] = tData
    end
    return list
end

function SkillUpControl.Clear()
    mSkillUpData = {}
end

return SkillUpControl
