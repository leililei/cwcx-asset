-- Code Auto Create Begin
local M = Class('SummerHome_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerHome_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerHome_UI].prefab'
    self.Name = 'Form[SummerHome_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Heidi','Ani/Heidi',2},{'Background','Ani/Background',2},{'Shop','Ani/LeftGroup/Shop',2},{'Img_Shopdi','Ani/LeftGroup/Shop/Img_Shopdi',2},{'Mission','Ani/LeftGroup/Mission',2},{'Img_Missiondi','Ani/LeftGroup/Mission/Img_Missiondi',2},{'MissionRedDotIcon','Ani/LeftGroup/Mission/MissionRedDotIcon',2},{'Replay','Ani/LeftGroup/Replay',2},{'PlotLock','Ani/LeftGroup/Replay/PlotLock',2},{'Img_Suo','Ani/LeftGroup/Replay/PlotLock/Img_Suo',2},{'Img_Replaydi','Ani/LeftGroup/Replay/Img_Replaydi',2},{'Raid','Ani/RightGroup/Raid',2},{'RaidLock','Ani/RightGroup/Raid/RaidLock',2},{'Img_Suo01','Ani/RightGroup/Raid/RaidLock/Img_Suo',2},{'Img_Raiddi','Ani/RightGroup/Raid/Img_Raiddi',2},{'BossRaid','Ani/RightGroup/BossRaid',2},{'BossLock','Ani/RightGroup/BossRaid/BossLock',2},{'Img_Suo02','Ani/RightGroup/BossRaid/BossLock/Img_Suo',2},{'Img_Raiddi01','Ani/RightGroup/BossRaid/Img_Raiddi',2},{'EventName','Ani/TitleGroup/EventName',2},{'Time','Ani/TitleGroup/EventTime/Time',2},{'UpperRightPanel','Ani/UpperRightPanel',2},{'Btn_AddPower','Ani/UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','Ani/UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add2','Ani/UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Image','Ani/UpperRightPanel/Btn_AddPower/Btn_Add2/Image',2},{'Img_Tiliicon','Ani/UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- TextMeshProUGUI 列表
        {'Text_Shop','Ani/LeftGroup/Shop/Text_Shop',20},{'Text_Mission','Ani/LeftGroup/Mission/Text_Mission',20},{'Text_PlotLock','Ani/LeftGroup/Replay/PlotLock/Text_PlotLock',20},{'Text_Replay','Ani/LeftGroup/Replay/Text_Replay',20},{'Text_RaidLock','Ani/RightGroup/Raid/RaidLock/Text_RaidLock',20},{'Text_Raid','Ani/RightGroup/Raid/Text_Raid',20},{'Text_BossLock','Ani/RightGroup/BossRaid/BossLock/Text_BossLock',20},{'Text_Raid01','Ani/RightGroup/BossRaid/Text_Raid',20},{'Remainder','Ani/TitleGroup/EventTime/Time/Remainder',20},{'Text_Huodongjieshushijian','Ani/TitleGroup/EventTime/Text_Huodongjieshushijian',20},{'Text_Date','Ani/TitleGroup/EventTime/Text_Date',20},{'Text_ResTili','Ani/UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---弹出引导帮助界面
    --ActiveTutorialControl.ForcePopGuide(1)
    self.IsLevelOpen = false
    self.IsBossTimeOpen = false
    self.IsBossOpen = false
    self.SummerData = SummerControl.GetSummerData()
    self.SummerActivity = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.SUMMER)
    
    ---初始化按钮
    self:InitButton()
    ---初始化各地图走过的格子数据
    SummerMapControl.InitMapMark(self.SummerData)

    ---夏活任务关闭时刷新本界面红点
    Event.Add("SummerHome_UI_RefreshRedDoc",function()
        if self.ObjRoot then
            self:RefreshRedDot()
        end
    end)
end

function M:OnUpdateUI()
    self:RefreshRedDot()
    ---背景音乐
    if self.SummerData and self.SummerData.music ~= "" then
        MgrSound.PlayBGM(self.SummerData.music,0.2,nil,true)
    end
    ---体力
    self:RefreshCoinCount()
    ---时间
    local tEndTime = string.split(self.SummerData.endTime,'-')
    ---剩余天数
    local remainTime = SummerControl.GetEndTime() - 1
    if Global.isMiddleTime(self.SummerActivity.beginTime,self.SummerActivity.battleEndTime) then
        remainTime = SummerControl.GetBattleEndTime() - 1
        tEndTime = string.split(self.SummerActivity.battleEndTime,'-')
        ---探索结束时间
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text26")
    else
        ---兑换结束时间
        self.Text_Huodongjieshushijian().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text27")
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
    ---判断是否在活动期内
    self.IsLevelOpen = SummerControl.CheckChapterTimeOpen(ActiveChapterControl.ChapterType.Logic)
    self.RaidLock().gameObject:SetActive(not self.IsLevelOpen)
    self.IsBossTimeOpen = SummerControl.CheckChapterTimeOpen(ActiveChapterControl.ChapterType.Boss)
    if self.IsBossTimeOpen then
        self.IsBossOpen = SummerControl.CheckChapterLock(ActiveChapterControl.ChapterType.Boss)
    end
    self.BossLock().gameObject:SetActive(not self.IsBossOpen)
    ---剧情回放锁
    if ArtAtlasControl.CheckUnlock(2,2) == false then
        self.PlotLock().gameObject:SetActive(true)
    else
        self.PlotLock().gameObject:SetActive(false)
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
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
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.SummerData.group)
    end)
    ---商店
    UIEvent.LuaClick(self.Shop().gameObject, function()
        MgrUI.GoHide(UID.SummerShop_UI)
    end)
    ---任务
    UIEvent.LuaClick(self.Mission().gameObject, function()
        MgrUI.Pop(UID.SummerTask_UI)
    end)
    ---剧情回放
    UIEvent.LuaClick(self.Replay().gameObject, function()
        MgrLink.TurnToPlot(2,2)
    end)
    ---关卡
    UIEvent.LuaClick(self.Raid().gameObject, function()
        if not self.IsLevelOpen then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text23"), 1 }, true)
            return
        end
        local tData = SummerControl.GetCurChaptersData()
        if tData.Chaptertype ~= ActiveChapterControl.ChapterType.Logic then
            SummerControl.ResetType(ActiveChapterControl.ChapterType.Logic)
        end
        MgrUI.GoHide(UID.SummerLevels_UI)
    end)
    ---BOSS
    UIEvent.LuaClick(self.BossRaid().gameObject, function()
        if not self.IsBossTimeOpen then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text23"), 1 }, true)
            return
        elseif not self.IsBossOpen then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text15"), 1 }, true)
            return
        end
        local tData = SummerControl.GetCurChaptersData()
        if tData.Chaptertype ~= ActiveChapterControl.ChapterType.Boss then
            SummerControl.ResetType(ActiveChapterControl.ChapterType.Boss)
        end
        MgrUI.GoHide(UID.SummerLevels_UI)
    end)
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))
end

---刷新红点
function M:RefreshRedDot()
    ---任务红点
    self.MissionRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("SummerTask").State)
end
---刷新体力
function M:RefreshCoinCount()
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili.."/"..TiliMax
end

return M