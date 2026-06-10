require("LocalData/SkilllistLocalData")
require("Model/Skill/Data/SkillDetailData")
---加锁管理器
SkillDetailControl = {}
---@type SkillDetailData[]
---角色技能说明
SkillDetailControl.SkillDetailList = {}

function SkillDetailControl.InitSkillDetail()
    SkillDetailControl.SkillDetailList = {}
    for i, v in pairs(SkilllistLocalData.tab) do
        if v[2] == 11001 then
            print()
        end
        if SkillDetailControl.SkillDetailList[v[2]] == nil then
            SkillDetailControl.SkillDetailList[v[2]] = {}
            SkillDetailControl.SkillDetailList[v[2]][v[3]] = SkillDetailData.New()
        else
            if SkillDetailControl.SkillDetailList[v[2]][v[3]] == nil then
                SkillDetailControl.SkillDetailList[v[2]][v[3]] = SkillDetailData.New()
            end
        end
        SkillDetailControl.SkillDetailList[v[2]][v[3]]:PushConfig(v)
    end
end
---获取技能简略列表 _index为heroID
function SkillDetailControl.GetSkillListByID(_index)
    ---如果有EX,将有EX技能前置
    local tList = SkillDetailControl.SkillDetailList[_index]
    local tSkillList = {}
    for i, v in pairs(tList) do
        table.insert(tSkillList, v)
    end
    
    if #tList >= 5 then     --列表中可能包含11 21等替换技能
        table.sort(tSkillList,function(a,b)
            if a.SkillNum < b.SkillNum then
                return true
            else
                return false
            end
        end)
    end

    return tSkillList
end
---获取子技能所属的
function SkillDetailControl.GetSkillData(_heroID, _skillID)
    local tSkillList = SkillDetailControl.GetSkillListByID(_heroID)
    for i, v in ipairs(tSkillList) do
        for i, skillID in pairs(v.ChildSkill) do
            if _skillID == skillID then
                return v
            end
        end
    end
end
---根据进阶共鸣装备等级替换对应技能
function SkillDetailControl.SortSkillList(SkillDetailList,specialEquip)
    local newList = {}
    for i,v in pairs(SkillDetailList) do
        if v.SkillNum < 10 then
            newList[i] = v
        end
    end
    if specialEquip == nil then
        return newList
    end
    ---SkillDetailData
    for i,v in pairs(SkillDetailList) do
        if v.SkillNum > 10 and specialEquip.evolutionLevel >= v.specialSkillAppearStage then
            for key,value in pairs(newList) do
                if value.SkillNum == v.SkillNum % 10 then
                    local a = clone(v)
                    a.SkillNum = a.SkillNum % 10
                    newList[key] = a
                end
            end
        end
    end
    return newList
end

function SkillDetailControl.Clear()
    SkillDetailControl.SkillDetailList = {}
end

return SkillDetailControl
