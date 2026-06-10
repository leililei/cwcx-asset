-- Code Auto Create Begin
local M = Class('Activity_Event4', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Event4.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Event4','/',2},{'Event','Event',2},{'Btn_Qianwanghuodong','Event/Btn_Qianwanghuodong',2},{'Replay_Img','Event/Btn_Qianwanghuodong/Replay_Img',2},{'Replay_Text','Event/Btn_Qianwanghuodong/Replay_Text',2},{'EventTime','Event/EventTime',2},{'Event2','Event2',2},{'BG','Event2/BG',2},{'Activity2','Event2/BG/Activity2',2},{'ActivityBg','Event2/BG/Activity2/ActivityBg',2},{'Btn_Enter','Event2/BG/Activity2/Btn_Enter',2},{'EventTime01','Event2/BG/Activity2/EventTime',2},{'Activity1','Event2/BG/Activity1',2},{'ActivityBg01','Event2/BG/Activity1/ActivityBg',2},{'Btn_Enter01','Event2/BG/Activity1/Btn_Enter',2},{'EventTime02','Event2/BG/Activity1/EventTime',2},
        -- UITemplate 列表
        {'Activity_Event401','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Huodongjieshushijian','Event/EventTime/Text_Huodongjieshushijian',20},{'Text_Date','Event/EventTime/Text_Date',20},{'Text_Huodongshijian','Event2/BG/Activity2/EventTime/Text_Huodongshijian',20},{'Text_Date_1','Event2/BG/Activity2/EventTime/Text_Date_1',20},{'Text_Date_2','Event2/BG/Activity2/EventTime/Text_Date_2',20},{'Text_Huodongshijian01','Event2/BG/Activity1/EventTime/Text_Huodongshijian',20},{'Text_Date_101','Event2/BG/Activity1/EventTime/Text_Date_1',20},{'Text_Date_201','Event2/BG/Activity1/EventTime/Text_Date_2',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.DataInfo = nil
end

function M:OnUpdateUI(pData)
    if self.DataInfo == nil then
        self.DataInfo = Event4Control.GetEvent4Data()
    end
    local tData = self.DataInfo[pData[1]]
    if tData.Relevant == nil then
        self:ActEvent(tData)
        
        self.Event().gameObject:SetActive(true)
        self.Event2().gameObject:SetActive(false)
    else
        self:ActEvent2(tData)
        
        self.Event().gameObject:SetActive(false)
        self.Event2().gameObject:SetActive(true)
    end
end

function M:ActEvent(_data)
    ---活动时间
    local tEndTime = string.split(_data.endTime,'-')
    local beginTime = string.split(_data.beginTime,'-')
    local tUTC = SteamLocalData.tab[112011][2]
    local _time = tUTC.." "..beginTime[1].."/"..beginTime[2].."/"..beginTime[3].."~"..
            tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3]
    self.Text_Date().text = _time

    UIEvent.LuaClick(self.Btn_Qianwanghuodong().gameObject,function()
        Event4Control.OpenEvent4UI(_data.activityID)
    end)
end
function M:ActEvent2(_data)
    for i, v in ipairs(_data.Relevant) do
        local tData = self.DataInfo[v]
        if i==1 then
            self:EventActive(self.Activity1().gameObject, tData)
        else
            self:EventActive(self.Activity2().gameObject, tData)
        end
    end
end
function M:EventActive(_actObj,_data)
    local tActBg = CJNUIMgr.GetSunUseName(_actObj, "ActivityBg"):GetComponent("Image")
    local tBtn_Enter = CJNUIMgr.GetSunUseName(_actObj, "Btn_Enter"):GetComponent("Image")
    local tDate1 = CJNUIMgr.GetSunUseName(_actObj, "Text_Date_1"):GetComponent("TextMeshProUGUI")
    local tDate2 = CJNUIMgr.GetSunUseName(_actObj, "Text_Date_2"):GetComponent("TextMeshProUGUI")
    --背景和按钮图
    if Global.isMiddleTime(_data.beginTime,_data.endTime) then
        if _data.resource ~= "0" then
            MgrRes.LoadSprite(tActBg, "Activity/".._data.resource.."_Normal")
            MgrRes.LoadSprite(tBtn_Enter, "Activity/".._data.resource.."_Btn")
        end
        tBtn_Enter.gameObject:SetActive(true)
        
        UIEvent.LuaClick(tBtn_Enter.gameObject,function()
            Event4Control.ClearBossData()
            Event4Control.SetCurActID(_data.activityID)
            Event4Control.OpenEvent4UI(_data.activityID)
        end)
    else
        if _data.resource ~= "0" then
            MgrRes.LoadSprite(tActBg, "Activity/".._data.resource.."_Locked")
            MgrRes.LoadSprite(tBtn_Enter, "Activity/".._data.resource.."_Btn")
        end
        tBtn_Enter.gameObject:SetActive(false)
    end
    --活动时间
    local tEndTime = string.split(_data.endTime,'-')
    local beginTime = string.split(_data.beginTime,'-')
    local tUTC = SteamLocalData.tab[112011][2]
    tDate1.text = tUTC.." "..beginTime[1].."/"..beginTime[2].."/"..beginTime[3].."~"..
            tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3]
    --剩余天数
    local tCurTime = Global.GetCurTime()
    if _data.beginTime_Stamp <= tCurTime and _data.endTime_Stamp >= tCurTime then
        local tDay = Global.TimeToDays(_data.endTime_Stamp-tCurTime)
        tDate2.text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text110"), tDay)
        tDate2.gameObject:SetActive(true)
    else
        tDate2.gameObject:SetActive(false)
    end
end
return M