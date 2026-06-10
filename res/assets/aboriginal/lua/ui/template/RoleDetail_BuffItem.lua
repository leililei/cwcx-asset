-- Code Auto Create Begin
local M = Class('RoleDetail_BuffItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleDetail_BuffItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SubPanel','SubPanel',2},{'NameAndImage','SubPanel/NameAndImage',2},{'Img_xian','SubPanel/NameAndImage/Img_xian',2},{'BuffIcon','SubPanel/NameAndImage/BuffIcon',2},{'BuffName','SubPanel/NameAndImage/BuffName',2},{'Icon','SubPanel/NameAndImage/BuffName/BuffTime/Text_Time/Icon',2},{'BuffTips','SubPanel/BuffTips',2},{'ButtonPanel','SubPanel/ButtonPanel',2},{'Btn_SkillDetailTip','SubPanel/ButtonPanel/Btn_SkillDetailTip',2},{'ExceptionPanel','ExceptionPanel',2},{'Img_Exception','ExceptionPanel/Img_Exception',2},
        -- UITemplate 列表
        {'RoleDetail_BuffItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Censhu','SubPanel/NameAndImage/BuffIcon/Text_Censhu',20},{'Text_BuffName','SubPanel/NameAndImage/BuffName/Text_BuffName',20},{'Text_Time','SubPanel/NameAndImage/BuffName/BuffTime/Text_Time',20},{'Text_Jinengshuoming','SubPanel/BuffTips/Text_Jinengshuoming',20},{'TipNameTxt','SubPanel/ButtonPanel/Btn_SkillDetailTip/TipNameTxt',20},{'Text_Matter','ExceptionPanel/Img_Exception/Text_Matter',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillexceptionLocalData")
function M:OnInit()
    self.isTouch = false
    UIEvent.LuaPressClick(self.Btn_SkillDetailTip().gameObject, Handle(self, function()
        if self.isTouch or not self.Btn_SkillDetailTip().gameObject.activeSelf then
            return
        end
        self.isTouch = true
        self.Img_Exception().gameObject:SetActive(true)
        MgrTimer.AddRepeat("ExceptionTouch", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("ExceptionTouch")
                self.Img_Exception().gameObject:SetActive(false)
                self.isTouch = false
            end
        end, -1, nil)
    end))
end

function M:OnUpdateUI(pData)
    self.buffTurn = pData[1][1] --剩余回合数
    self.icon = pData[1][2] --图片
    self.name = pData[1][3] --名字
    self.Explain = pData[1][4]  --技能说明
    self.Exception = pData[1][5]    --例外事项
    self.parent = pData[2]

    ---0回合不显示
    if self.buffTurn == 0 then
        self.ObjRoot:SetActive(false)
        return
    end

    self.Img_Exception().gameObject:SetActive(false)
    ---图片
    MgrRes.LoadSprite(self.BuffIcon(),"Skill/" .. self.icon)
    ---层数(服务器未给)
    self.Text_Censhu().gameObject:SetActive(false)
    ---技能名
    self.Text_BuffName().text = self.name
    ---剩余回合数
    local str = MgrLanguageData.GetLanguageByKey("ui_tongyong_text104")
    if self.buffTurn == -1 then
        self.Text_Time().text = string.format(MgrLanguageData.GetLanguageByKey("eventshopitem_surplus_1"), str)
    else
        self.Text_Time().text = string.format(MgrLanguageData.GetLanguageByKey("eventshopitem_surplus_1"), self.buffTurn)
    end
    ---技能说明
    self.Text_Jinengshuoming().text = self.Explain
    ---例外事项
    local exception = string.split(self.Exception,"@")
    if exception[1] == "0" or #exception == 0 then
        self.Btn_SkillDetailTip().gameObject:SetActive(false)
        return
    end
    self.Btn_SkillDetailTip().gameObject:SetActive(true)
    local text = ""
    for i = 1, #exception do
        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
    end
    self.Text_Matter().text = text
end

return M