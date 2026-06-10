-- Code Auto Create Begin
local M = Class('GongGaoPageBtn', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GongGaoPageBtn.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GongGaoPageBtn','/',2},{'HLight','HLight',2},{'Img_Xzdi','HLight/Img_Xzdi',2},{'Nomal','Nomal',2},{'Img_Xzdi01','Nomal/Img_Xzdi',2},
        -- UITemplate 列表
        {'GongGaoPageBtn01','/',10},
        -- Toggle 列表
        {'GongGaoPageBtn02','/',13},
        -- TextMeshProUGUI 列表
        {'Text_GongGao','HLight/Text_GongGao',20},{'Text_AUG','HLight/Text_AUG',20},{'Text_Riqi','HLight/Text_Riqi',20},{'Text_GongGao01','Nomal/Text_GongGao',20},{'Text_AUG01','Nomal/Text_AUG',20},{'Text_Riqi01','Nomal/Text_Riqi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ChangeUI = {}
    self.PageID = 1
    self.BtnState = { self.HLight().gameObject, self.Nomal().gameObject }
    self.IsBack = false
    self.MonthStr = {
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen1"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen2"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen3"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen4"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen5"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen6"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen7"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen8"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen9"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen10"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen11"),
        MgrLanguageData.GetLanguageByKey("ui_gonggao_yuefen12"),
    }
    for i = 1, #self.BtnState do
        self.ChangeUI[i] = self:InitUI(self.BtnState[i])
    end
    ---
    Tools.ToggleValueChange(self.GongGaoPageBtn02(), function(isOn)
        if isOn then
            self.IsBack = true
            self.BtnState[1]:SetActive(true)
            self.BtnState[2]:SetActive(false)

            Event.Go("Notice_Page", self.PageID)
        else
            self.BtnState[1]:SetActive(false)
            self.BtnState[2]:SetActive(true)
        end
    end)
end

function M:InitUI(_obj)
    local tUI = {
        TitleTmp = CJNUIMgr.GetSunUseName(_obj, "Text_GongGao"):GetComponent("TextMeshProUGUI"),
        MonthTmp = CJNUIMgr.GetSunUseName(_obj, "Text_AUG"):GetComponent("TextMeshProUGUI"),
        DayTmp = CJNUIMgr.GetSunUseName(_obj, "Text_Riqi"):GetComponent("TextMeshProUGUI")
    }
    return tUI
end

function M:OnUpdateUI(pData)
    local tData = pData[1]
    self.PageID = pData[2]
    local tBtnState = self.PageID == 1

    self.GongGaoPageBtn02().group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup")
    local noticeTime = Global.GetTimeByStr(tData.openTime)
    local timeL = string.split(os.date("%m-%d", noticeTime  + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600), "-")
    for i, v in ipairs(self.ChangeUI) do
        v.TitleTmp.text = tData.title
        v.MonthTmp.text = self.MonthStr[tonumber(timeL[1])]
        v.DayTmp.text = timeL[2]
    end

    if not tBtnState then
        self.BtnState[1]:SetActive(false)
        self.BtnState[2]:SetActive(true)
        
        self.IsBack = true
    else
        self.IsBack = false
    end
    
    self.GongGaoPageBtn02().isOn = tBtnState
    if not self.IsBack then
        Event.Go("Notice_Page", self.PageID)
    end
end

return M