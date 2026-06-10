-- Code Auto Create Begin
local M = Class('Blueprint_SkillItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Blueprint_SkillItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SubSkill','SubSkill',2},{'SubSkillPoint','SubSkill/SubNamePanel/SubSkillPoint',2},{'TagPanel','SubSkill/SubNamePanel/TagPanel',2},{'Img_Tag1','SubSkill/SubNamePanel/TagPanel/Img_Tag1',2},{'Img_Tag2','SubSkill/SubNamePanel/TagPanel/Img_Tag2',2},{'Img_Exception','SubSkill/SubNamePanel/Img_Exception',2},{'SkillTips','SubSkill/SkillTips',2},{'TipsPanel','SubSkill/TipsPanel',2},{'Btn_SkillDetailTip','SubSkill/TipsPanel/Btn_SkillDetailTip',2},
        -- UITemplate 列表
        {'Blueprint_SkillItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_SubSkillName','SubSkill/SubNamePanel/SubSkillPoint/Text_SubSkillName',20},{'Text_Tag1','SubSkill/SubNamePanel/TagPanel/Img_Tag1/Text_Tag1',20},{'Text_Tag2','SubSkill/SubNamePanel/TagPanel/Img_Tag2/Text_Tag2',20},{'Text_Matter','SubSkill/SubNamePanel/Img_Exception/Text_Matter',20},{'Text_Jinengshuoming','SubSkill/SkillTips/Text_Jinengshuoming',20},{'TipNameTxt','SubSkill/TipsPanel/Btn_SkillDetailTip/TipNameTxt',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillexceptionLocalData")
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")
function M:OnInit()
    self.Img_Exception().gameObject:SetActive(false)
    self.TagList = { 
        [1] = { img=self.Img_Tag1(), txt=self.Text_Tag1() },
        [2] = { img=self.Img_Tag2(), txt=self.Text_Tag2() },
    }

    --长按查看体力
    local isTouch = false
    UIEvent.LuaPressClick(self.Btn_SkillDetailTip().gameObject, function()
        if isTouch or not self.Btn_SkillDetailTip().gameObject.activeSelf then
            return
        end
        isTouch = true
        self.Img_Exception().gameObject:SetActive(true)
        MgrTimer.AddRepeat("ExceptionTouch", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("ExceptionTouch")
                self.Img_Exception().gameObject:SetActive(false)
                isTouch = false
            end
        end, -1, nil)
    end)
end
function M:OnUpdateUI(pData)
    local SkillId = tonumber(pData[1])
    local skillData = JNSkill:new(SkillId,10)
    
    self.Text_SubSkillName().text = skillData.Name
    self.Text_Jinengshuoming().text = skillData.Explain
    --标签
    for i, v in ipairs(self.TagList) do
        local tagType = SkilltypeoneLocalData.tab[skillData.Skilltype1]
        if i == 2 then
            tagType = SkilltypetwoLocalData.tab[skillData.Skilltype2]
        end
        if tagType == nil then
            v.img.gameObject:SetActive(false)
        else
            v.img.gameObject:SetActive(true)
        end
        v.txt.text = tagType[2]
    end
    --例外事项
    local exception = string.split(skillData.Exception,"@")
    if exception[1] == "0" or #exception == 0 then
        self.TipsPanel().gameObject:SetActive(false)
    else
        self.TipsPanel().gameObject:SetActive(true)
        local text = ""
        for i = 1, #exception do
            text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
        end
        self.Text_Matter().text = text
    end
end

return M