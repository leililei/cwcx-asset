-- Code Auto Create Begin
local M = Class('Activity_Boss', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Boss.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Boss','/',2},{'Btn_Chakan','Btn_Chakan',2},{'Btn_Chakan1','Btn_Chakan/Btn_Chakan1',2},{'HuoDongShiJian','HuoDongShiJian',2},{'Img_ShengYu','HuoDongShiJian/Img_ShengYu',2},{'Btn_Qianwangtaofa','Btn_Qianwangtaofa',2},
        -- UITemplate 列表
        {'Activity_Boss01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ShiJian','HuoDongShiJian/Text_ShiJian',20},{'Text_XiaoShi','HuoDongShiJian/Text_XiaoShi',20},{'Text_ShengYuTian','HuoDongShiJian/Img_ShengYu/Text_ShengYuTian',20},{'Text_Taofa','Btn_Qianwangtaofa/Text_Taofa',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.HuoDongShiJian().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Qianwangtaofa().gameObject,Handle(self,function ()
        ---判断活动是否还开着
        local data = EventRaidControl.GetLIANHETAOFAData(self.activityType)
        if data == nil or not Global.isMiddleTime(data.beginTime,data.endTime) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),1},true)
            return
        end
        ---跳转到对应界面
        ActivityControl.PageType = ActivityControl.activityTypeEnum.LIANHETAOFA
        HomeViewModel.OpenCrusade(self.activityType)
        --if UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "LHTF"..self.activityType) == "" then
        --    PlotViewModel.OpenPlotUI(EventRaidControl.GetLIANHETAOFAData().plot,
        --            HomeViewModel.OpenCrusade
        --    ,nil,true)
        --    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "LHTF"..self.activityType,"1")
        --else
        --    HomeViewModel.OpenCrusade()
        --end
        --MgrUI.ClosePop(UID.HuoDongPop_UI)
    end))
    UIEvent.LuaClick(self.Btn_Chakan().gameObject,function()
        MgrUI.Pop(UID.BossXiangqing_UI,{self.BossData.BossData[1].BossData},true)
    end)
end

function M:OnUpdateUI(pData)
    self.activityType = pData[1]
    ---Activity_Boss JointcrusadeLocalData.tab
    self.BossData = EventRaidControl.GetLIANHETAOFAData(self.activityType)
    ---底图更换
    if self.BossData.resource ~= "0" then
        MgrRes.LoadSprite(self.Activity_Boss(),"Activity/"..self.BossData.resource)
    end
    if self.BossData.icon ~= "0" then
        MgrRes.LoadSprite(self.Btn_Qianwangtaofa(),"Activity/"..self.BossData.icon)
    end

    ---活动时间
    local tBeginTime = string.split(self.BossData.beginTime,'-')
    local tEndTime = string.split(self.BossData.endTime,'-')
    local _time = tBeginTime[1].."/"..tBeginTime[2].."/"..tBeginTime[3].." "..tBeginTime[4]..":"..tBeginTime[5].."~"..
    tEndTime[1].."/"..tEndTime[2].."/"..tEndTime[3].." "..tEndTime[4]..":"..tEndTime[5]
    self.Text_XiaoShi().text = _time
    --string.format("%s/%s <size=24>%s:%s</size>-%s/%s <size=24>%s:%s</size>",tBeginTime[2],tBeginTime[3],tBeginTime[4],tBeginTime[5],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])
    ---剩余天数
    local remainTime = EventRaidControl.GetLHETFEndTime() - 1
    if remainTime / (3600*24) >= 1 then
        ---剩余天数
        self.Text_ShengYuTian().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..math.modf(remainTime/(3600*24)).."</color> "..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        self.Text_ShengYuTian().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..hour.."</color> "..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
end

return M