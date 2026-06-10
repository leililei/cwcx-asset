-- Code Auto Create Begin
local M = Class('CoreSkill_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CoreSkill_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CoreSkill_UI].prefab'
    self.Name = 'Form[CoreSkill_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'mh','Ani/mh',2},{'Img_Tanchuangdi1','Ani/Img_Tanchuangdi1',2},{'Img_Xian2','Ani/Img_Xian2',2},{'Img_Xian1','Ani/Img_Xian1',2},{'Img_Shuomingdi','Ani/Jinengshuoming/Img_Shuomingdi',2},{'Img_Jinengshuomingdi','Ani/Jinengshuoming/Img_Jinengshuomingdi',2},{'Img_Biaotixian3','Ani/Jinengshuoming/Img_Biaotixian3',2},{'Img_Miaoshudi','Ani/Jinengmiaoshu/Img_Miaoshudi',2},{'Img_Biaotixian2','Ani/Jinengmiaoshu/Img_Biaotixian2',2},{'Text_SkillInstructionText','Ani/Jinengmiaoshu/Text_SkillInstructionText',2},{'Viewport','Ani/Jinengmiaoshu/Text_SkillInstructionText/Viewport',2},{'Img_Biaotixian1','Ani/Img_Biaotixian1',2},
        -- Text 列表
        {'Content','Ani/Jinengmiaoshu/Text_SkillInstructionText/Viewport/Content',3},
        -- TextMeshProUGUI 列表
        {'Text_CoolDown','Ani/Jinengshuoming/Text_CoolDown',20},{'Text_CoolDownTxt','Ani/Jinengshuoming/Text_CoolDownTxt',20},{'Text_RemainTime','Ani/Jinengshuoming/Text_RemainTime',20},{'Text_RemainTimeTxt','Ani/Jinengshuoming/Text_RemainTimeTxt',20},{'Text_TriggerOpportunity','Ani/Jinengshuoming/Text_TriggerOpportunity',20},{'Text_TriggerOpportunityTxt','Ani/Jinengshuoming/Text_TriggerOpportunityTxt',20},{'Text_SkillTarget','Ani/Jinengshuoming/Text_SkillTarget',20},{'Text_SkillTargetTxt','Ani/Jinengshuoming/Text_SkillTargetTxt',20},{'Text_SkillInstrument','Ani/Jinengshuoming/Text_SkillInstrument',20},{'Text_SkillName','Ani/Jinengmiaoshu/Text_SkillName',20},{'Text_SkillInstruction','Ani/Jinengmiaoshu/Text_SkillInstruction',20},{'Text_CoreSkill','Ani/Text_CoreSkill',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillLocalData")
require("LocalData/TxtLocalData")

function M:OnInit()
    self:InitButton()
end
function M:OnShow(skillId)
    self.currentSkill = SkillLocalData.tab[skillId]
    self:ShowSkillInstructions()
end

---显示技能信息
function M:ShowSkillInstructions()
    ---self.Text_CoreSkill().text = self.currentSkill[7]
    self.Text_SkillName().text = self.currentSkill[12]
    ---self.Text_SkillInstructionText().text = self.currentSkill[6]
    ---self.Content():GetComponent("TextMeshProUGUI").text = self.currentSkill[6]                    ---技能描述
    self.Content():GetComponent("TextMeshProUGUI").text = self:SkillDescription(self.currentSkill[6])
    self.Text_SkillTargetTxt().text = self:ShowSkillTarget(self.currentSkill[15])
    self.Text_TriggerOpportunityTxt().text = self:ShowTrigger(self.currentSkill[14])
    if self.currentSkill[16] ~= "0" and self.currentSkill[16] ~= "-1" then
        self.Text_RemainTimeTxt().text = self.currentSkill[16] .. string.split(TxtLocalData.tab[180003][6],"_")[2]
    elseif self.currentSkill[16] == "0" then
        self.Text_RemainTimeTxt().text = string.split(TxtLocalData.tab[180003][5],"_")[2]
    elseif self.currentSkill[16] == "-1" then
        self.Text_RemainTimeTxt().text = string.split(TxtLocalData.tab[180003][4],"_")[2]
    end
    self.Text_CoolDownTxt().text = self.currentSkill[7]
end

---去掉技能描述的方括号，并将内部的数字放大100倍
function M:SkillDescription(str)
    str = string.gsub(str,"(%b[])",function (x)
        x = "return " .. string.sub(x, 2, -2)*100
        local f = load(x)
        return f()
    end)
    return str
end

---读取技能目标
function M:ShowSkillTarget(skillTargetIndex)
    local skillTarget = TxtLocalData.tab[180002][skillTargetIndex + 3]
    if skillTarget then
        skillTarget = string.sub(skillTarget,3)
        return skillTarget
    end
    return ""
end

---读取技能触发时点
function M:ShowTrigger(skillTriggerIndex)
    local skillTrigger = TxtLocalData.tab[180001][skillTriggerIndex + 3]
    if skillTrigger then
        skillTrigger = string.split(skillTrigger,"_")
        return skillTrigger[2]
    end
    return ""
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.mh().gameObject, Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

return M