-- Code Auto Create Begin
local M = Class('Activity_Plot', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Plot.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Plot','/',2},{'Btn_JinRuXianXi','Btn_JinRuXianXi',2},{'JinRuXianXiDi','Btn_JinRuXianXi/JinRuXianXiDi',2},{'JinRuXiaXi','Btn_JinRuXianXi/JinRuXiaXi',2},{'Img_ShengYuTian','HuoDongShiJian/Img_ShengYuTian',2},
        -- UITemplate 列表
        {'Activity_Plot01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_JuTiShiJian','HuoDongShiJian/Text_JuTiShiJian',20},{'Text_XiaoShi','HuoDongShiJian/Text_XiaoShi',20},{'Text_ShengYuTian','HuoDongShiJian/Img_ShengYuTian/Text_ShengYuTian',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_JinRuXianXi().gameObject,Handle(self,function ()
        ---跳转到对应界面
        MgrLink.LinkStart("tz_hd_hdzjm_01")

        --MgrUI.ClosePop(UID.HuoDongPop_UI)
    end))
end
function M:OnUpdateUI(pData)
    ---该活动在表中只会存在一个
    local tData = EventRaidControl.GetEventData()
    ---底图更换
    if tData.resource ~= "0" then
        MgrRes.LoadSprite(self.Activity_Plot(),"Activity/"..tData.resource)
    end
    ---活动时间
    local tBeginTime = string.split(tData.beginTime,'-')
    local tEndTime = string.split(tData.endTime,'-')
    self.Text_XiaoShi().text = string.format("%d/%d <size=24>%d:%d</size>~%d/%d <size=24>%d:%d</size>",tBeginTime[2],tBeginTime[3],tBeginTime[4],tBeginTime[5],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])
    ---剩余天数
    local remainTime = EventRaidControl.GetEventEndTime() - 1
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