-- Code Auto Create Begin
local M = Class('ZijinengPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ZijinengPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'TagPanel','TagPanel',2},{'Img_Tag','Img_Tag',2},{'Img_Zijinengdi','Img_Zijinengdi',2},{'Img_Exception','Img_Exception',2},{'Btn_SkillDetailTip','Btn_SkillDetailTip',2},
        -- UITemplate 列表
        {'ZijinengPrefab','/',10},
        -- RawImage 列表
        {'ZijinengPrefab01','/',15},
        -- TextMeshProUGUI 列表
        {'Text_Fujiaxiaoguo','Text_Fujiaxiaoguo',20},{'Text_Tag','Img_Tag/Text_Tag',20},{'Text_Fujiashuoming','Img_Zijinengdi/Text_Fujiashuoming',20},{'Text_Matter','Img_Exception/Text_Matter',20},{'TipNameTxt','Btn_SkillDetailTip/TipNameTxt',20},
    }
end
-- Code Auto Create End
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")
require("LocalData/SkillexceptionLocalData")

function M:OnInit()
    self.Img_Tag().gameObject:SetActive(false)
    self.Img_Exception().gameObject:SetActive(false)
    self.TagObj = self:InitPanel(self.TagPanel().gameObject, self.Img_Tag(), 2)

    ---长按查看体力
    local isTouch = false
    UIEvent.LuaPressClick(self.ObjRoot, Handle(self, function()
        if isTouch or not self.Btn_SkillDetailTip().gameObject.activeSelf or self.ExceptionDontOpen then
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
    end))
end
function M:OnUpdateUI(pData)
    self.Btn_SkillDetailTip().gameObject:SetActive(true)
    ---@type SkillFightData
    self.pData = pData[1]
    --if pData[2] ~= nil and pData[2] == "Battle" then
    --    self.Btn_SkillDetailTip().gameObject:SetActive(false)
    --    self.ExceptionDontOpen = true
    --else
        self.ExceptionDontOpen = false
    --end
    if self.pData == nil or self.pData.RealLV <= 0 then
        self.Img_Tag().gameObject:SetActive(false)
        self.Text_Fujiaxiaoguo().text = ""
        self.Text_Fujiashuoming().text = ""
        for i = 1, #self.TagObj do
            self.TagObj[i].gameObject:SetActive(false)
        end
        self.Btn_SkillDetailTip().gameObject:SetActive(false)
        return
    end
    self.Text_Fujiaxiaoguo().text = self.pData.Name

    --Tag标签
    for i = 1, #self.TagObj do
        local tagStr = self.TagObj[i].transform:Find("Text_Tag").gameObject
        local tagType = nil
        if i == 1 then
            tagType = SkilltypeoneLocalData.tab[self.pData.Skilltype1]
        else
            tagType = SkilltypetwoLocalData.tab[self.pData.Skilltype2]
        end
        
        if tagType == nil then
            print("标签ID不匹配")
            self.TagObj[i].gameObject:SetActive(false)
            return
        end
        self.TagObj[i].gameObject:SetActive(true)
        tagStr:GetComponent("TextMeshProUGUI").text = tagType[2]
    end
    ---说明
    self.pData.Explain = string.gsub(self.pData.Explain, "<size=42>", "<size=20>")
    self.pData.Explain = string.gsub(self.pData.Explain, "<size=38>", "<size=20>")
    self.Text_Fujiashuoming().text = self.pData.Explain
    ---例外事项
    local exception = string.split(self.pData.Exception,"@")
    if exception[1] == "0" or #exception == 0 then
        self.Btn_SkillDetailTip().gameObject:SetActive(false)
        return
    end

    local text = ""
    for i = 1, #exception do
        text = text .. SkillexceptionLocalData.tab[tonumber(exception[i])][2] .. "\n"
    end
    self.Text_Matter().text = text
end
--创建Panel中的元素 _Root为父节点
function M:CreatObjInPanel(_Root, _Prefab)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x, tempObj.transform.localPosition.y, 0)

    return tempObj
end
--初始化Panel中的元素
function M:InitPanel(_Root, _Prefab, _Count)
    Tools.ClearAllChild(_Root)
    local tempObjList = {}
    for i = 1, _Count, 1 do
        tempObjList[i] = self:CreatObjInPanel(_Root, _Prefab)
    end

    return tempObjList
end

return M