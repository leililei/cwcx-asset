---@class SkillDetailData 技能描述信息

SkillDetailData = Class('SkillDetailData')
---构造方法
function SkillDetailData:ctor()
    self.id = 0                 ---ID
    self.RoleID = 0             ---角色ID
    self.SkillNum = 0           ---技能栏位
    self.UnlockLv = {}          ---技能解锁等级
    self.SkillLvStage = {}      ---技能进阶等级表(强化次数)
    self.SkillList = {}         ---技能列表(会根据技能解锁等级改变)
    self.GroupName = {}         ---技能组名(会根据技能解锁等级改变)
    self.TotleName = ""         ---技能总名称
    self.TagList = {}           ---技能属性标签(会根据技能解锁等级改变)
    self.Tips = {}              ---技能简略说明(会根据技能解锁等级改变)
    self.ChildSkill = {}
    self.IsEx = false           ---是否为EX技能
    self.isSpecialEquipSkill = false
    self.specialSkillAppearStage = -1
end

--- _config SkilllistLocalData
function SkillDetailData:PushConfig(_config)
    self.id = _config[1]
    self.RoleID = _config[2]
    self.SkillNum = _config[3]
    table.insert(self.UnlockLv,_config[4])
    ---技能进阶等级表
    local levelStage = string.split(_config[5],'$')
    if #levelStage > 1 then
        self.specialSkillAppearStage = tonumber(levelStage[2])  ---特殊共鸣装备技能出现阶段
        self.isSpecialEquipSkill = true
    end
    local t_List = string.split(levelStage[1],';')
    for i = 1, #t_List do
        self.SkillLvStage[i] = tonumber(t_List[i])
    end
    ---技能列表(会根据技能解锁等级改变)
    local tList = string.split(_config[6],';')
    for i = 1, #tList do
        if self.SkillList[_config[4]] == nil then
            self.SkillList[_config[4]] = {}
        end
        table.insert(self.SkillList[_config[4]],tonumber(tList[i]))
        table.insert(self.ChildSkill,tonumber(tList[i]))
    end
    ---技能组名(会根据技能解锁等级改变)
    self.GroupName[_config[4]] = _config[7]
    ---技能组名
    self.TotleName = _config[8]
    ---技能属性标签(会根据技能解锁等级改变)
    tList = string.split(_config[9],';')
    for i = 1, #tList do
        if self.TagList[_config[4]] == nil then
            self.TagList[_config[4]] = {}
        end
        table.insert(self.TagList[_config[4]],tList[i])
    end
    ---技能简略说明(会根据技能解锁等级改变)
    self.Tips[_config[4]] = _config[10]
    self.IsEx = (self.SkillNum % 10 == 5)
end
return SkillDetailData