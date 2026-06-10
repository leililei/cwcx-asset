-- Code Auto Create Begin
local M = Class('HalfAnniversaryHome_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryHome_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryHome_UI].prefab'
    self.Name = 'Form[HalfAnniversaryHome_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Heidi','Ani/Heidi',2},{'Background','Ani/Background',2},{'Img_di','Ani/LeftGroup/Img_di',2},{'Img_di(1)','Ani/LeftGroup/Img_di (1)',2},{'Mission','Ani/LeftGroup/Mission',2},{'Img_huan','Ani/LeftGroup/Mission/Img_huan',2},{'Img_di01','Ani/LeftGroup/Mission/Img_di',2},{'Text_Mission','Ani/LeftGroup/Mission/Text_Mission',2},{'Img_Mission_En','Ani/LeftGroup/Mission/Img_Mission_En',2},{'MissionRedDotIcon','Ani/LeftGroup/Mission/MissionRedDotIcon',2},{'BossRaid','Ani/LeftGroup/BossRaid',2},{'Img_huan01','Ani/LeftGroup/BossRaid/Img_huan',2},{'Img_di02','Ani/LeftGroup/BossRaid/Img_di',2},{'Img_BossRaid_En','Ani/LeftGroup/BossRaid/Img_BossRaid_En',2},{'Text_BossRaid','Ani/LeftGroup/BossRaid/Text_BossRaid',2},{'BossLock','Ani/LeftGroup/BossRaid/BossLock',2},{'Img_Suo','Ani/LeftGroup/BossRaid/BossLock/Img_Suo',2},{'Raid','Ani/LeftGroup/Raid',2},{'Img_huan02','Ani/LeftGroup/Raid/Img_huan',2},{'Img_di03','Ani/LeftGroup/Raid/Img_di',2},{'Img_Raid_En','Ani/LeftGroup/Raid/Img_Raid_En',2},{'Text_Raid','Ani/LeftGroup/Raid/Text_Raid',2},{'RaidLock','Ani/LeftGroup/Raid/RaidLock',2},{'Img_Suo01','Ani/LeftGroup/Raid/RaidLock/Img_Suo',2},{'EventTime','Ani/LeftGroup/EventTime',2},{'Shop','Ani/RightGroup/Shop',2},{'Img_huan03','Ani/RightGroup/Shop/Img_huan',2},{'Img_di04','Ani/RightGroup/Shop/Img_di',2},{'Text_Shop','Ani/RightGroup/Shop/Text_Shop',2},{'Img_Shop_En','Ani/RightGroup/Shop/Img_Shop_En',2},{'Replay','Ani/RightGroup/Replay',2},{'Img_huan04','Ani/RightGroup/Replay/Img_huan',2},{'Img_di05','Ani/RightGroup/Replay/Img_di',2},{'Text_Replay','Ani/RightGroup/Replay/Text_Replay',2},{'Img_Replay_En','Ani/RightGroup/Replay/Img_Replay_En',2},{'PlotLock','Ani/RightGroup/Replay/PlotLock',2},{'Img_Suo02','Ani/RightGroup/Replay/PlotLock/Img_Suo',2},{'Game','Ani/RightGroup/Game',2},{'Img_huan05','Ani/RightGroup/Game/Img_huan',2},{'Img_di06','Ani/RightGroup/Game/Img_di',2},{'Img_Game_En','Ani/RightGroup/Game/Img_Game_En',2},{'Text_Game','Ani/RightGroup/Game/Text_Game',2},{'GameLock','Ani/RightGroup/Game/GameLock',2},{'Img_Suo03','Ani/RightGroup/Game/GameLock/Img_Suo',2},{'GameRedDotIcon','Ani/RightGroup/Game/GameRedDotIcon',2},{'ToHYHS','Ani/RightGroup/ToHYHS',2},{'Img_di07','Ani/RightGroup/ToHYHS/Img_di',2},{'EventName','Ani/TitleGroup/EventName',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- TextMeshProUGUI 列表
        {'Text_Huodongjieshushijian','Ani/LeftGroup/EventTime/Text_Huodongjieshushijian',20},{'Text_Date','Ani/LeftGroup/EventTime/Text_Date',20},{'Text_TimeRemainder','Ani/LeftGroup/EventTime/Text_TimeRemainder',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---弹出引导帮助界面
    --ActiveTutorialControl.ForcePopGuide(1)
    self.IsLevelOpen = false
    self.IsBossTimeOpen = false
    self.IsBossOpen = false
    self.HalfAnniData = HalfAnniControl.GetData()
    self.HalfAnniActivity = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.HALF_ANNI)

    CMgrCamera.Instance.UIMainCamera.allowHDR = false
    MgrUI.GetUICamera().orthographic = true
    self.CameraChange = true
    ---初始化按钮
    self:InitButton()
    ---初始化各地图走过的格子数据
    SummerMapControl.InitMapMark(self.HalfAnniData)
    ---动态背景
    self:ShowBackground()
end

function M:OnUpdateUI()
    self.CameraChange = true
    self:RefreshRedDot()
    ---背景音乐
    if self.HalfAnniData and self.HalfAnniData.music ~= "" then
        MgrSound.PlayBGM(self.HalfAnniData.music,0.2,nil,true)
    end
    ---时间
    local tEndTime = string.split(self.HalfAnniData.endTime,'-')
    ---剩余天数
    local remainTime = HalfAnniControl.GetEndTime() - 1
    if Global.isMiddleTime(self.HalfAnniActivity.beginTime,self.HalfAnniActivity.battleEndTime) then
        remainTime = HalfAnniControl.GetBattleEndTime() - 1
        tEndTime = string.split(self.HalfAnniActivity.battleEndTime,'-')
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
        self.Text_TimeRemainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus2").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    else
        ---剩余小时数
        local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
        self.Text_TimeRemainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
    
    ---剧情回放锁
    if ArtAtlasControl.CheckUnlock(tonumber(self.HalfAnniData.gallary[1]),tonumber(self.HalfAnniData.gallary[2])) == false then
        self.PlotLock().gameObject:SetActive(true)
    else
        self.PlotLock().gameObject:SetActive(false)
    end
    
    ---判断章节解锁
    local tIsChapterLock = HalfAnniControl.CheckChapterTimeOpen(false)
    ---判断BOSS解锁
    local tIsBossLock = HalfAnniControl.CheckChapterTimeOpen(true)
    
    self.RaidLock().gameObject:SetActive(not tIsChapterLock)
    self.BossLock().gameObject:SetActive(not tIsBossLock)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        self.CameraChange = false
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
        ActiveTutorialControl.OpenGuide(self.HalfAnniData.group)
    end)
    ---商店
    UIEvent.LuaClick(self.Shop().gameObject, function()
        HalfAnniControl.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Mission().gameObject, function()
        HalfAnniControl.OpenTask()
    end)
    ---剧情回放
    UIEvent.LuaClick(self.Replay().gameObject, function()
        MgrLink.TurnToPlot(tonumber(self.HalfAnniData.gallary[1]),tonumber(self.HalfAnniData.gallary[2]))
    end)
    ---关卡
    UIEvent.LuaClick(self.Raid().gameObject, function()
        HalfAnniControl.OpenChapter()
    end)
    ---BOSS
    UIEvent.LuaClick(self.BossRaid().gameObject, function()
        HalfAnniControl.OpenBoss()
    end)
    ---签到游戏
    UIEvent.LuaClick(self.Game().gameObject, function()
        HalfAnniControl.OpenSignGame()
    end)
    ---HaiYueHuanShuo_UI
    UIEvent.LuaClick(self.ToHYHS().gameObject, function()
        MgrUI.GoHide(UID.HaiYueHuanShuo_UI)
    end)
end

---刷新红点
function M:RefreshRedDot()
    ---任务红点
    self.MissionRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("HalfAnniversaryTask").State)
    ---游戏剧情红点
    self.GameRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("HalfAnniversaryPlot").State)
end
---动态背景
function M:ShowBackground()
    if self.HalfAnniData.usmBg and self.HalfAnniData.usmBg[2] then
        local criUI = self.Background().transform:GetComponent("CriManaMovieControllerForUI")
        --给组件的player设置usm视频文件
        local tUsm = string.split(self.HalfAnniData.usmBg[2],'_')
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/Common/"..tUsm[2]..".usm"))
        criUI.loop = tUsm[1]=="1"
        --播放视频
        criUI:Play()
    else
        local tSpineCfg = MainuiskinLocalData.tab[self.HalfAnniData.bgspine]
        if tSpineCfg then
            local coordinate = string.split(tSpineCfg.bgcoordinate,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadCgSpine(self.Background(), tSpineCfg.id,tSpineCfg.backgroundpic,x,y,scale,tSpineCfg.morning,function(BG)
                --BG.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder-3,"Default")
            end,true)
        end
    end
end

function M:OnBackShow()
    CMgrCamera.Instance.UIMainCamera.allowHDR = false
    MgrUI.GetUICamera().orthographic = true
end

function M:OnHide()
    CMgrCamera.Instance.UIMainCamera.allowHDR = true
    MgrUI.GetUICamera().orthographic = false
end

function M:OnClose()
    if self.CameraChange then
        CMgrCamera.Instance.UIMainCamera.allowHDR = true
        MgrUI.GetUICamera().orthographic = false
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M