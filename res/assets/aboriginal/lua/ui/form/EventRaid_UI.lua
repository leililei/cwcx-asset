-- Code Auto Create Begin
local M = Class('EventRaid_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventRaid_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventRaid_UI].prefab'
    self.Name = 'Form[EventRaid_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg_huodongdi','Background/bg_huodongdi',2},{'bg_left','Background/bg_left',2},{'bg_right','Background/bg_right',2},{'bg_lihui','Background/bg_lihui',2},{'bg_lrmask(zuo)','Background/bg_lrmask(zuo)',2},{'bg_lrmask(you)','Background/bg_lrmask(you)',2},{'Img_line(zuo)','Background/Img_line(zuo)',2},{'Img_line(you)','Background/Img_line(you)',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add2','UpperRightPanel/Btn_AddPower/Btn_Add2',2},{'Image','UpperRightPanel/Btn_AddPower/Btn_Add2/Image',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'Img_Btndi4','LeftGroup/LeftButton/Gallery/Img_Btndi4',2},{'btn_gallery','LeftGroup/LeftButton/Gallery/btn_gallery',2},{'Img_Btndi3','LeftGroup/LeftButton/Mission/Img_Btndi3',2},{'btn_mission','LeftGroup/LeftButton/Mission/btn_mission',2},{'MissionRedDotIcon','LeftGroup/LeftButton/Mission/btn_mission/MissionRedDotIcon',2},{'Img_Btndi2','LeftGroup/LeftButton/Shop/Img_Btndi2',2},{'btn_shop','LeftGroup/LeftButton/Shop/btn_shop',2},{'Img_Btndi1','LeftGroup/LeftButton/Story/Img_Btndi1',2},{'btn_story','LeftGroup/LeftButton/Story/btn_story',2},{'EventName','RightGroup/TitleGroup/EventName',2},{'Time','RightGroup/TitleGroup/EventTime/Time_Text/Time',2},{'RaidBg','RightGroup/RaidBtn/RaidBg',2},{'Raiddi','RightGroup/RaidBtn/Raiddi',2},{'Img_Xian','RightGroup/RaidBtn/Img_Xian',2},{'Img_Huodongguanka','RightGroup/RaidBtn/Img_Huodongguanka',2},{'Img_Huodongguanka(1)','RightGroup/RaidBtn/Img_Huodongguanka (1)',2},{'Btn_Easy','RightGroup/BossGroup/Btn_Easy',2},{'Btn_Normal','RightGroup/BossGroup/Btn_Normal',2},{'Btn_Hard','RightGroup/BossGroup/Btn_Hard',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},
        -- Text 列表
        {'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',3},{'Text_Gallery','LeftGroup/LeftButton/Gallery/Text_Gallery',3},{'Text_Mission','LeftGroup/LeftButton/Mission/Text_Mission',3},{'Text_Shop','LeftGroup/LeftButton/Shop/Text_Shop',3},{'Text_Story','LeftGroup/LeftButton/Story/Text_Story',3},{'DateStart','RightGroup/TitleGroup/EventTime/Time_Text/DateStart',3},{'DateOver','RightGroup/TitleGroup/EventTime/Time_Text/DateOver',3},{'TimeStart','RightGroup/TitleGroup/EventTime/Time_Text/TimeStart',3},{'TimeOver','RightGroup/TitleGroup/EventTime/Time_Text/TimeOver',3},{'DateTo','RightGroup/TitleGroup/EventTime/Time_Text/DateTo',3},{'Remainder','RightGroup/TitleGroup/EventTime/Time_Text/Remainder',3},{'Text_Huodongriqi','RightGroup/TitleGroup/EventTime/Time_Text/Text_Huodongriqi',3},{'NowLevel','RightGroup/RaidBtn/RaidLevel_Text/NowLevel',3},{'LevelNumber','RightGroup/RaidBtn/RaidLevel_Text/LevelNumber',3},{'Text_Easyrecommend','RightGroup/BossGroup/Btn_Easy/Text_Easyrecommend',3},{'Text_Easyrank','RightGroup/BossGroup/Btn_Easy/Text_Easyrank',3},{'Text_Easyshadow','RightGroup/BossGroup/Btn_Easy/Text_Easyshadow',3},{'Text_Easyuse','RightGroup/BossGroup/Btn_Easy/Text_Easyuse',3},{'Text_Easy','RightGroup/BossGroup/Btn_Easy/Text_Easy',3},{'Text_Normalrecommend','RightGroup/BossGroup/Btn_Normal/Text_Normalrecommend',3},{'Text_Normalrank','RightGroup/BossGroup/Btn_Normal/Text_Normalrank',3},{'Text_Normalshadow','RightGroup/BossGroup/Btn_Normal/Text_Normalshadow',3},{'Text_Normaluse','RightGroup/BossGroup/Btn_Normal/Text_Normaluse',3},{'Text_Normal','RightGroup/BossGroup/Btn_Normal/Text_Normal',3},{'Text_Hardrecommend','RightGroup/BossGroup/Btn_Hard/Text_Hardrecommend',3},{'Text_Hardrank','RightGroup/BossGroup/Btn_Hard/Text_Hardrank',3},{'Text_Hardshadow','RightGroup/BossGroup/Btn_Hard/Text_Hardshadow',3},{'Text_Harduse','RightGroup/BossGroup/Btn_Hard/Text_Harduse',3},{'Text_Hard','RightGroup/BossGroup/Btn_Hard/Text_Hard',3},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',3},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',3},
        -- Button 列表
        {'btn_gallery01','LeftGroup/LeftButton/Gallery/btn_gallery',4},{'btn_mission01','LeftGroup/LeftButton/Mission/btn_mission',4},{'btn_shop01','LeftGroup/LeftButton/Shop/btn_shop',4},{'btn_story01','LeftGroup/LeftButton/Story/btn_story',4},{'RaidBg01','RightGroup/RaidBtn/RaidBg',4},{'Btn_Easy01','RightGroup/BossGroup/Btn_Easy',4},{'Btn_Normal01','RightGroup/BossGroup/Btn_Normal',4},{'Btn_Hard01','RightGroup/BossGroup/Btn_Hard',4},
    }
end
-- Code Auto Create End
require("LocalData/TimeLocalData")
function M:OnInit()
    ---红点检查
    TaskControl.CheckDotReceived()
    ---活动信息 ActivityLocalData
    self.eventRaidInfo = EventRaidViewModel.GetEventRaidData()
    if self.eventRaidInfo then
        ---活动数据
        ---@type EventRaidData
        self.EventRaidData = EventRaidControl.CreateEventRaidData(self.eventRaidInfo)     ---StoryactivityLocalData
    end
    StormViewModel.ReloadStormData()
    ---卷数据
    ---@type StormScrollData[] 所有剧情活动卷(普通关卡和Boss)
    self.ScrollData = StormControl.GetEventRaidScrollData()
    ---关卡数据
    ---@type StormPointData[] 所有剧情活动关卡(普通关卡和Boss)
    self.PointData = StormControl.GetEventRaidPointData()
    ---初始化按钮
    self:InitButton()
    ---普通关最新进度
    self.LevelNumber().text = self:NewestStage()
    ---Boss按钮推荐等级/消耗
    local levels = {}
    for i,v in ipairs(self.PointData) do
        if v.type == StormViewModel.PointBattleType.ACTIVITY_BOSS then
            table.insert(levels,v)
        end
    end
    self.Text_Easyuse().text = "x" .. string.split(levels[1].consume,"_")[3]
    self.Text_Normaluse().text = "x" .. string.split(levels[2].consume,"_")[3]
    --self.Text_Harduse().text = "x" .. string.split(levels[3].consume,"_")[3]
    self.Text_Easyrank().text = levels[1].recommendLevel
    self.Text_Normalrank().text = levels[2].recommendLevel
    --self.Text_Hardrank().text = levels[3].recommendLevel

    ---初始化Boss血量显示
    for i = 1, 3 do
        EventRaidViewModel.SetBossBlood(i,100)
    end

end

function M:OnUpdateUI()
    -----红点检查
    --TaskControl.CheckDotReceived()
    ---检查剧情活动红点
    --EventRaidViewModel.CheckRot()
    ---红点
    if RedDotControl.GetDotData("EventRaidTaskDaily").State or RedDotControl.GetDotData("EventRaidTaskTotal").State then
        self.MissionRedDotIcon().gameObject:SetActive(true)
    else
        self.MissionRedDotIcon().gameObject:SetActive(false)
    end
    ---体力
    self:FreshTili()

    ---活动时间
    self.beginTime = string.split(self.EventRaidData.beginTime,"-")
    self.endTime = string.split(self.EventRaidData.endTime,"-")
    self.DateStart().text = self.beginTime[2].."/"..self.beginTime[3]
    self.DateOver().text = self.endTime[2].."/"..self.endTime[3]
    self.TimeStart().text = self.beginTime[4]..":"..self.beginTime[5]
    self.TimeOver().text = self.endTime[4]..":"..self.endTime[5]
    ---获取服务器时间
    local curTime = MgrNet.GetServerTime()
    self.remainTime = self:RemainTime(curTime,os.time({year = tonumber(self.endTime[1]),month = tonumber(self.endTime[2]),day = tonumber(self.endTime[3]),hour = tonumber(self.endTime[4]) ,min = tonumber(self.endTime[5]),sec = tonumber(self.endTime[6])}))
    self.remainTime = self.remainTime - 1
    if self.remainTime / (3600*24) >= 1 then
        ---剩余多少天
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..math.modf(self.remainTime / (3600*24)).."</color> "..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    elseif self.remainTime > 0 then
        local hour = math.floor(self.remainTime / 3600) < 1 and 1 or math.floor(self.remainTime / 3600)
        self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus")..hour.."</color> "..MgrLanguageData.GetLanguageByKey("ui_common_hour")
    end
    ---最后3天提醒
    if self.remainTime < 3*86400 and self.remainTime > 0 and EventRaidViewModel.PoppedTip == false then
        EventRaidViewModel.PoppedTip = true
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("eventraid_ui_tips2"),"3"),1},true)
    end
    
    MgrTimer.AddRepeat("EventRemainTime",1,function()
        if self.remainTime <= 0 then
            local callBack = function()
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_tips1"),1},true)
                MgrUI.GoBack()
            end
            ActivityControl.PushData(callBack)
        end
    end,-1,nil)
end

---按钮初始化
function M:InitButton()
    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(101)
    end))
    ---跳转商店(商店界面未知)
    UIEvent.LuaClick(self.btn_shop().gameObject,function()
        MgrUI.GoHide(UID.EventShop_UI)
    end)
    ---跳转剧情()
    UIEvent.LuaClick(self.btn_story().gameObject,function()
        if SysLockControl.CheckSysLock(2003) then
            EventRaidViewModel.JumpToPlot = true
            IllustrationViewModel.OpenPlotReplayUI()
        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("eventraid_ui_tips3"),SysLockControl.GetUnlockPoint(2003)),1},true)
        end
    end)
    ---查看任务
    UIEvent.LuaClick(self.btn_mission().gameObject,function()
        --子活动时间是否开启（读另外的时间）
        local ctime = tonumber(SteamLocalData.tab[111010][2])
        local cStartTime = TimeLocalData.tab[ctime][6]
        local cEndTime = TimeLocalData.tab[ctime][7]
        local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)

        if not inMiddle then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips3"),2},true)
            return
        end

        MgrUI.GoHide(UID.EventTask_UI)
    end)
    ---跳转图鉴
    UIEvent.LuaClick(self.btn_gallery().gameObject,function()
        if SysLockControl.CheckSysLock(2003) then
            --IllustrationViewModel.OpenUI()
            MgrUI.GoHide(UID.ArtGallery_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("eventraid_ui_tips3"),SysLockControl.GetUnlockPoint(2003)),1},true)
        end
    end)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackToFirst()
    end)
    ---活动按钮
    UIEvent.LuaClick(self.RaidBg().gameObject,function()
        --子活动时间是否开启（读另外的时间）
        local ctime = tonumber(SteamLocalData.tab[111010][2])
        local cStartTime = TimeLocalData.tab[ctime][6]
        local cEndTime = TimeLocalData.tab[ctime][7]
        local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)

        if inMiddle then
            StormViewModel.CurPointType = StormViewModel.PointType.activity
            StormViewModel.CurDifficulty = StormViewModel.ActivityDifficulty.EASY
            MgrUI.GoHide(UID.EventLevels_UI)
        else
            --不在活动时间内提示
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),2},true)
        end
    end)
    ---Boss按钮
    self.bossData = {}
    for i = 1,#self.PointData do
        if self.PointData[i].type == 16 then
            table.insert(self.bossData,self.PointData[i])
        end
    end
    self.bossLocked = self:BossLock()
    UIEvent.LuaClick(self.Btn_Easy().gameObject,function()
        --是否在活动时间内
        local ctime = tonumber(SteamLocalData.tab[111010][2])
        local cStartTime = TimeLocalData.tab[ctime][6]
        local cEndTime = TimeLocalData.tab[ctime][7]
        local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)

        if not inMiddle then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),2},true)
            return
        end

        if not self.bossLocked[1] then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_bosslock"),2},true)
            return
        end
        StormViewModel.CurPointType = StormViewModel.PointType.activityBoss
        StormViewModel.CurDifficulty = StormViewModel.ActivityDifficulty.EASY
        --MgrUI.GoHide(UID.EventLevels_UI)
        StormViewModel.CurPointData = self.bossData[1]
        StormViewModel.curSelectData = StormViewModel.CurPointData
        self:OnPointClick_Boss(self.bossData[1],1)
    end)
    UIEvent.LuaClick(self.Btn_Normal().gameObject,function()
         --是否在活动时间内
         local ctime = tonumber(SteamLocalData.tab[111010][2])
         local cStartTime = TimeLocalData.tab[ctime][6]
         local cEndTime = TimeLocalData.tab[ctime][7]
         local inMiddle = Global.isMiddleTime(cStartTime, cEndTime)
 
         if not inMiddle then
             MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),2},true)
             return
         end

        if not self.bossLocked[2] then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_bosslock"),2},true)
            return
        end
        StormViewModel.CurPointType = StormViewModel.PointType.activityBoss
        StormViewModel.CurDifficulty = StormViewModel.ActivityDifficulty.MIDDLE
        --MgrUI.GoHide(UID.EventLevels_UI)
        StormViewModel.CurPointData = self.bossData[2]
        StormViewModel.curSelectData = StormViewModel.CurPointData
        self:OnPointClick_Boss(self.bossData[2],2)
    end)
    --[[UIEvent.LuaClick(self.Btn_Hard().gameObject,function()
        if not self.bossLocked[3] then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_bosslock"),2},true)
            return
        end
        StormViewModel.CurPointType = StormViewModel.PointType.activityBoss
        StormViewModel.CurDifficulty = StormViewModel.ActivityDifficulty.HARD
        --MgrUI.GoHide(UID.EventLevels_UI)
        StormViewModel.CurPointData = self.bossData[3]
        self:OnPointClick_Boss(self.bossData[3],3)
    end)]]
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_Add2().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel,{function()
            self:FreshTili()
        end} ,true)
    end))
end
---判断Boss管是否解锁
function M:BossLock()
    local locked = {}
    for i = 1,#self.PointData do
        if self.PointData[i].type == 16 then
            table.insert(locked,self.PointData[i]:CheckLock())
        end
    end
    return locked
end

---检查最新关
function M:NewestStage()
    ---活动关卡当前进度
    local txt = nil
    for i = 1,#self.PointData do
        if self.PointData[i].type ~= 16 then
            if self.PointData[i]:CheckLock() then
                txt = self.PointData[i].idxName
            else
                break
            end
        end
    end
    return txt
end

---进入Boss关卡
function M:OnPointClick_Boss(data,index)
    EventRaidViewModel.GetBossData(data,index)
    ---获取Boss信息/弹出Boss面板
    --MgrUI.Pop(UID.EventBossPop_UI,{data,index},true)
end

---刷新体力
function M:FreshTili()
    ---体力校准
    Global.TiliCalibration()
    self.MaxTili = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    self.curTili = PlayerControl.GetPlayerData():GetVigor()     --获取当前体力值
    self.Text_ResTili().text = self.curTili .. "/" ..self.MaxTili
    --self:InitTiliClock()
end
--初始化体力时钟
--[[function M:InitTiliClock()
--    MgrTimer.Cancel("TiLiClock")
--    local DiffTime
--    if self.curTili < self.MaxTili then
--        local NewTime = Global.GetCurTime()     ---当前服务器时间(登陆时间 + 运行时间)
--        print("服务器时间戳+++++++++++++++",NewTime)
--        DiffTime = NewTime - PlayerControl.GetPlayerData().vigor.vigorTime  ---体力恢复时间差
--    end
--    ---时钟
--    self.curTime =  tonumber(SteamLocalData.tab[104004][2])     --恢复体力要300秒
--    local tarHour,tarMin,tarSec = self:CheckTiliTime()      --体力恢复满需要的时间(未经倒计时)
--    local min = self.curTime / 60 - 1
--    local sec = 60
--    if DiffTime and DiffTime > 0 then
--        print("时间差+++++++++++++++",DiffTime)
--        --换算成分和秒
--        local s = DiffTime % 60
--        local m = math.floor(DiffTime % 3600 / 60)
--        sec = sec - s   --小计时
--        min = min - m
--        tarSec = 60 - s --大计时
--        tarMin = tarMin - m - 1
--
--    end
--    MgrTimer.AddRepeat("TiLiClock", 1, Handle(self,function()
--        if self.curTili >= self.MaxTili then
--            self.Text_TargetTime().text = "00:00:00"
--            self.Text_PowerClock().text = "00:00:00"
--            return
--        end
--        if sec == 0 or sec < 0 then
--            min = min - 1
--            sec = 60
--        end
--        if min < 0 then
--            PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + 1
--            self.MaxTili = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
--            self.curTili = PlayerControl.GetPlayerData().vigor.vigorNum
--            self.Text_MaxPower().text="/"..self.MaxTili
--            self.Text_CurPower().text=self.curTili
--            --self:RefreshCoinCount()
--            min = self.curTime/60 - 1
--        end
--        if tarSec <= 0 then
--            if tarMin > 0 then
--                tarMin = tarMin -1
--            else
--                tarMin = 0
--            end
--            tarSec = 60
--        end
--        if tarMin < 0 then
--            tarHour = tarHour - 1
--            if tarHour >= 0 then
--                tarMin = 60 + tarMin
--            else
--                tarHour = 0
--                tarMin = 0
--                tarSec = 0
--            end
--        end
--
--        sec = sec - 1
--        tarSec = tarSec -1
--        self.Text_PowerClock().text = string.format("%02d:%02d:%02d",0,min,sec)
--        self.Text_TargetTime().text =  string.format("%02d:%02d:%02d",tarHour,tarMin,tarSec)
--    end) , -1, nil)
--end
----体力恢复剩余时间
--function M:CheckTiliTime()
--    local tili =self.MaxTili - self.curTili     --体力差值
--    if tili<=0 then
--        return 0,0,0
--    end
--    local ts = tili * 300   --总秒数
--    local seconds = ts % 60 --秒数
--    local min = math.modf(ts % 3600 / 60)   --分数
--    local hour = math.floor(ts/3600)    --小时数
--    return hour,min,seconds
--end]]

---计算两日期差值
function M:RemainTime(time1,time2)
    local dif = time2 - time1
    if dif < 0 then
        return 0
    end
    return dif
end

function M:OnClose()
    MgrTimer.Cancel("EventRemainTime")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M