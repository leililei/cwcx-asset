-- Code Auto Create Begin
local M = Class('ValentinesDayHome_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ValentinesDayHome_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ValentinesDayHome_UI].prefab'
    self.Name = 'Form[ValentinesDayHome_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Img_Zhezhao','Ani/Background/Img_Zhezhao',2},{'Img_Suduxian','Ani/Background/Img_Suduxian',2},{'Img_Bang','Ani/Background/Img_Bang',2},{'Replay','Ani/LeftGroup/Replay',2},{'Replay_Img','Ani/LeftGroup/Replay/Replay_Img',2},{'Img_PlotSuo','Ani/LeftGroup/Replay/Img_PlotSuo',2},{'Suo','Ani/LeftGroup/Replay/Img_PlotSuo/Suo',2},{'Mission','Ani/LeftGroup/Mission',2},{'Mission_Img','Ani/LeftGroup/Mission/Mission_Img',2},{'MissionRedDotIcon','Ani/LeftGroup/Mission/MissionRedDotIcon',2},{'Shop','Ani/LeftGroup/Shop',2},{'Shop_Img','Ani/LeftGroup/Shop/Shop_Img',2},{'ShopRedDotIcon','Ani/LeftGroup/Shop/ShopRedDotIcon',2},{'Raid','Ani/RightGroup/Raid',2},{'Raid_Img','Ani/RightGroup/Raid/Raid_Img',2},{'EventName','Ani/TitleGroup/EventName',2},{'EventTime','Ani/TitleGroup/EventTime',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- TextMeshProUGUI 列表
        {'Remainder','Ani/TitleGroup/EventTime/Time/Remainder',20},{'Text_Huodongjieshushijian','Ani/TitleGroup/EventTime/Text_Huodongjieshushijian',20},{'Text_Date','Ani/TitleGroup/EventTime/Text_Date',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.HaiYueData = HaiYueControl.GetHaiYueInfo()
    
    self:InitButton()
    self:OnCheckTime()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---活动入口
    UIEvent.LuaClick(self.Raid().gameObject, function()
        MgrUI.GoHide(UID.HaiYueHuanShuo_UI)
    end)
    ---商城
    UIEvent.LuaClick(self.Shop().gameObject, function()
        HaiYueControl.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Mission().gameObject, function()
        HaiYueControl.OpenTask()
    end)
    ---图鉴
    UIEvent.LuaClick(self.Replay().gameObject, function()
        MgrLink.TurnToPlot(tonumber(self.HaiYueData.gallary[1]),tonumber(self.HaiYueData.gallary[2]))
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.HaiYueData.group)
    end)
end

function M:OnUpdateUI()
    if self.HaiYueData.gallary and ArtAtlasControl.CheckUnlock(tonumber(self.HaiYueData.gallary[1]),tonumber(self.HaiYueData.gallary[2])) == false then
        self.Img_PlotSuo().gameObject:SetActive(true)
        self.Replay_Img().color = Color(0.5,0.5,0.5,1)
    else
        self.Img_PlotSuo().gameObject:SetActive(false)
        self.Replay_Img().color = Color(1,1,1,1)
    end

    ---任务红点
    HaiYueControl.CheckTaskRedPoint()
    self.MissionRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("HaiYue").State)
    ---背景音乐
    if self.HaiYueData and self.HaiYueData.music ~= "" then
        MgrSound.PlayBGM(self.HaiYueData.music,0.2,nil,true)
    end
end

function M:OnCheckTime()
    ---时间
    local tEndTime = string.split(self.HaiYueData.endTime,'-')
    ---剩余天数
    local remainTime = HaiYueControl.GetEndTime("change") - 1
    if Global.isMiddleTime(self.HaiYueData.beginTime,self.HaiYueData.battleEndTime) then
        remainTime = HaiYueControl.GetEndTime("battle") - 1
        tEndTime = string.split(self.HaiYueData.battleEndTime,'-')
        ---作戰時間
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text1")
    else
        ---兌換時間
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text2")
    end

    ---时间
    self.Text_Date().text = string.format("%d/%d/%d %s:%s",tEndTime[1],tEndTime[2],tEndTime[3],tEndTime[4],tEndTime[5])

    if remainTime / (3600*24) >= 1 then
        ---剩余天数
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M