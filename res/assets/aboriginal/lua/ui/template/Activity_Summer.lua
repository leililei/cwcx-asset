-- Code Auto Create Begin
local M = Class('Activity_Summer', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Summer.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Summer','/',2},{'EventName','TitleGroup/EventName',2},{'Time','TitleGroup/EventTime/Time',2},{'Btn_Qianwanghuodong','Btn_Qianwanghuodong',2},
        -- UITemplate 列表
        {'Activity_Summer01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Date','TitleGroup/EventTime/Text_Date',20},{'Remainder','TitleGroup/EventTime/Time/Remainder',20},{'Text_Qianwang','Btn_Qianwanghuodong/Text_Qianwang',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Qianwanghuodong().gameObject,Handle(self,function ()
        ---跳转到对应界面
        MgrLink.LinkStart("tz_summer_zjm_01")
        --MgrUI.ClosePop(UID.HuoDongPop_UI)
    end))
end
function M:OnUpdateUI(pData)
    ---该活动在表中只会存在一个
    local tData = SummerControl.GetSummerData()
    ---底图更换
    if tData.resource ~= "0" then
        MgrRes.LoadSprite(self.Activity_Plot(),"Activity/"..tData.resource)
    end
    ---活动时间
    local tEndTime = string.split(tData.endTime,'-')
    local beginTime = string.split(tData.beginTime,'-') 
    local _time = beginTime[1].."/"..beginTime[2].."/"..beginTime[3].." "..beginTime[4]..":"..beginTime[5].."~"..
    tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3].." "..tEndTime[4]..":"..tEndTime[5]
    self.Text_Date().text = _time
    ---剩余天数
    local remainTime = SummerControl.GetEndTime() - 1
    if remainTime / (3600*24) >= 1 then
        ---剩余天数
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
end

return M