-- Code Auto Create Begin
local M = Class('HalfAnniversaryBoss_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryBoss_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryBoss_UI].prefab'
    self.Name = 'Form[HalfAnniversaryBoss_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Main_Boss','Main_Boss',2},{'Btn_Chakan','Main_Boss/BossTips/Text_BossName/Btn_Chakan',2},{'Img_Chakanicon1','Main_Boss/BossTips/Text_BossName/Btn_Chakan/Img_Chakanicon1',2},{'Biaoti','Main_Boss/BossTips/Biaoti',2},{'Img_xian','Main_Boss/BossTips/Img_xian',2},{'RightPanel','Main_Boss/RightPanel',2},{'Img_Fengexian','Main_Boss/RightPanel/Text_Nanduxuanze/Img_Fengexian',2},{'ShowBossPanel','Main_Boss/RightPanel/ShowBossPanel',2},{'BossPopBtn','Main_Boss/RightPanel/BossPopBtn',2},{'Nandu','Main_Boss/RightPanel/BossPopBtn/Nandu',2},{'BossLock','Main_Boss/RightPanel/BossPopBtn/Nandu/BossLock',2},{'UpperLeftPanel','UpperLeftPanel',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Btn_AddPower/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'BossPop','BossPop',2},{'BossPopMask','BossPop/BossPopMask',2},{'BossPopBg','BossPop/BossPopBg',2},{'BossPopImg','BossPop/BossPopBg/BossPopImg',2},{'BossNameBack','BossPop/BossPopBg/BossNameBack',2},{'Img_Xuetiaodi','BossPop/BossPopBg/Img_Xuetiaodi',2},{'Img_BossHp','BossPop/BossPopBg/Img_Xuetiaodi/Img_BossHp',2},{'BossHpdi','BossPop/BossPopBg/BossHpdi',2},{'Img_Shenyuxueliangdi','BossPop/BossPopBg/Img_Shenyuxueliangdi',2},{'Img_Biaotixian1','BossPop/BossPopBg/Img_Biaotixian1',2},{'Img_StarTask_1','BossPop/BossPopBg/Img_StarTask_1',2},{'Img_BossStar_1','BossPop/BossPopBg/Img_StarTask_1/Img_BossStar_1',2},{'Highlight_1','BossPop/BossPopBg/Img_StarTask_1/Img_BossStar_1/Highlight_1',2},{'Img_StarTask_2','BossPop/BossPopBg/Img_StarTask_2',2},{'Img_BossStar_2','BossPop/BossPopBg/Img_StarTask_2/Img_BossStar_2',2},{'Highlight_2','BossPop/BossPopBg/Img_StarTask_2/Img_BossStar_2/Highlight_2',2},{'Img_StarTask_3','BossPop/BossPopBg/Img_StarTask_3',2},{'Img_BossStar_3','BossPop/BossPopBg/Img_StarTask_3/Img_BossStar_3',2},{'Highlight_3','BossPop/BossPopBg/Img_StarTask_3/Img_BossStar_3/Highlight_3',2},{'Img_Biaotixian2','BossPop/BossPopBg/Img_Biaotixian2',2},{'Btn_InBoss','BossPop/BossPopBg/Btn_InBoss',2},{'Btn_Zuozhanzhunbeidi','BossPop/BossPopBg/Btn_InBoss/Btn_Zuozhanzhunbeidi',2},{'Img_CostIcon','BossPop/BossPopBg/Btn_InBoss/Img_Xiaohaotili/Img_CostIcon',2},{'Btn_Fast','BossPop/BossPopBg/Btn_Fast',2},{'Btn_Saodangdi','BossPop/BossPopBg/Btn_Fast/Btn_Saodangdi',2},{'Btn_Content','BossPop/BossPopBg/Btn_Fast/Btn_Content',2},{'SweepSuo','BossPop/BossPopBg/Btn_Fast/Btn_Content/SweepSuo',2},{'Shengyucishu','BossPop/BossPopBg/Btn_Fast/Shengyucishu',2},{'Btn_zuo','BossPop/Btn_zuo',2},{'Btn_you','BossPop/Btn_you',2},
        -- Button 列表
        {'Btn_ShowBoss','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',4},
        -- UITemplate 列表
        {'PointRewardsItem','BossPop/BossPopBg/BossRewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'Btn_ShowBoss01','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',15},{'BossRewardsScroll','BossPop/BossPopBg/BossRewardsScroll',15},{'RewardsContent','BossPop/BossPopBg/BossRewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'BossRewardsScroll01','BossPop/BossPopBg/BossRewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_BossName','Main_Boss/BossTips/Text_BossName',20},{'Text_Taofamubiao','Main_Boss/BossTips/Biaoti/Text_Taofamubiao',20},{'Text_Jianjie','Main_Boss/BossTips/Text_Jianjie',20},{'Text_Nanduxuanze','Main_Boss/RightPanel/Text_Nanduxuanze',20},{'Text_BossNandu','Main_Boss/RightPanel/BossPopBtn/Nandu/Text_BossNandu',20},{'Text_TuijianLv','Main_Boss/RightPanel/BossPopBtn/Text_TuijianLv',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_BossPopName','BossPop/BossPopBg/BossNameBack/Text_BossPopName',20},{'Text_BossLv','BossPop/BossPopBg/Text_BossLv',20},{'Text_BossHpPer','BossPop/BossPopBg/Text_BossHpPer',20},{'Text_BossHp','BossPop/BossPopBg/BossHpdi/Text_BossHp',20},{'Text_Shenyuxueliang','BossPop/BossPopBg/Img_Shenyuxueliangdi/Text_Shenyuxueliang',20},{'Text_TaskName','BossPop/BossPopBg/Text_TaskName',20},{'Text_BossTask_1','BossPop/BossPopBg/Img_StarTask_1/Text_BossTask_1',20},{'Text_BossTask_2','BossPop/BossPopBg/Img_StarTask_2/Text_BossTask_2',20},{'Text_BossTask_3','BossPop/BossPopBg/Img_StarTask_3/Text_BossTask_3',20},{'Text_LevelType','BossPop/BossPopBg/Text_LevelType',20},{'Text_InPoint','BossPop/BossPopBg/Btn_InBoss/Text_InPoint',20},{'Text_CNum','BossPop/BossPopBg/Btn_InBoss/Img_Xiaohaotili/Text_CNum',20},{'Text_Saodang','BossPop/BossPopBg/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_Cishu','BossPop/BossPopBg/Btn_Fast/Shengyucishu/Text_Cishu',20},{'Text_Back','BossPop/Text_Back',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.BossPop().gameObject:SetActive(false)

    self.ChapterBoss = HalfAnniControl.GetChapterBoss()
    self.BossDetail,self.BossDataList = HalfAnniControl.GetBossDetail()
    ---星星组
    self.StarGroup = {
        [1] = { Star = self.Highlight_1(), Condition = self.Text_BossTask_1() },
        [2] = { Star = self.Highlight_2(), Condition = self.Text_BossTask_2() },
        [3] = { Star = self.Highlight_3(), Condition = self.Text_BossTask_3() }
    }
    ---所有boss关数据
    self.AllPointData = {}
    self.SelectID = 1
    ---完美通关次数限制
    self.LimitCount = 1
    self.RewardsList = nil
    ---注册奖励滑块
    self.BossRewardsScroll01():SetLuaCellEvent(function(trans, idx)
        trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
    end)
    
    self:RefreshCoinCount()
    self:InitButton()
    self:BossUI()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        ActivityControl.SetBossLevel(_level)
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        ActivityControl.SetBossLevel(_level)
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---BOSS弹窗
    UIEvent.LuaClick(self.BossPopMask().gameObject, function()
        self.BossPop().gameObject:SetActive(false)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(HalfAnniControl.GetData().group)
    end)
    ---查看Boss
    UIEvent.LuaClick(self.Btn_ShowBoss().gameObject,function()
        MgrUI.Pop(UID.BossXiangqing_UI,{ self.BossDetail },true)
    end)
    ---扫荡
    UIEvent.LuaClick(self.Btn_Fast().gameObject,function()
        if not self:CheckFast() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text12"), 1 }, true)
            return
        end
        local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
        local curTili = PlayerControl.GetPlayerData():GetVigor()
       
        if curTili < vigor then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips3"), 1 }, true)
            return
        end

        MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData,function()
            ---刷新消耗
            self:RefreshCoinCount()
        end }, true)
    end)
    ---挑战
    UIEvent.LuaClick(self.Btn_InBoss().gameObject,function()
        if StormViewModel.CurPointData and not StormViewModel.CurPointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end

        MgrTimer.AddDelay("GoPlot", 1, function()
            ---下次需要获取夏活BOSS数据
            ActivityControl.ChangeBossData()
            BattleManager.GameMode = BattleManager.GameModeType.ActivityBoss
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activityBoss)
        end, nil)
    end)
    ---BOSS弹窗切换
    UIEvent.LuaClick(self.Btn_zuo().gameObject, function()
        if self.SelectID <= 1 then
            return
        end
        if not self.AllPointData[self.SelectID-1]:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1 }, true)
            return
        end
        self.SelectID = self.SelectID-1
        self:OnBossPop(self.AllPointData[self.SelectID])
    end)
    UIEvent.LuaClick(self.Btn_you().gameObject, function()
        if self.SelectID >= #self.AllPointData then
            return
        end
        if not self.AllPointData[self.SelectID+1]:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1 }, true)
            return
        end
        self.SelectID = self.SelectID+1
        self:OnBossPop(self.AllPointData[self.SelectID])
    end)

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))
end

function M:BossUI()
    ---BOSS名
    self.Text_BossName().text = self.ChapterBoss.chaptername
    ---BOSS介绍
    self.Text_Jianjie().text = self.ChapterBoss.chapterdesc

    local locks = {}    --所有关卡解锁状态
    for i, levelData in ipairs(self.ChapterBoss.levels) do
        local tCurLevelData = StormControl.GetStormPointByID(levelData)
        table.insert(self.AllPointData,tCurLevelData)
        local isOpen = tCurLevelData:CheckLock()
        table.insert(locks,isOpen)
    end
    for i,v in ipairs(self.ChapterBoss.levels) do
        local go = GameObject.Instantiate(self.BossPopBtn().gameObject,self.ShowBossPanel().transform,false)
        local tNanDu = go.transform:Find("Nandu").gameObject
        ---是否上锁
        local lock = tNanDu.transform:Find("BossLock").gameObject
        local lockImage = go:GetComponent("Image")
        if locks[i] then
            lock:SetActive(false)
            MgrRes.LoadSprite(lockImage,"Activity/HalfAnniversary/Img_Boss_"..i)
        else
            lock:SetActive(true)
            MgrRes.LoadSprite(lockImage,"Activity/HalfAnniversary/Img_Boss_suo")
        end
        ---关卡名
        tNanDu.transform:Find("Text_BossNandu").transform:GetComponent("TextMeshProUGUI").text = self.AllPointData[i].name
        Tools.ReContentSizeGroup(tNanDu)
        ---推荐等级
        go.transform:Find("Text_TuijianLv").transform:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text15") .. ":Lv " .. self.AllPointData[i].recommendLevel
        ---Boss弹窗
        UIEvent.LuaClick(go.gameObject,function()
            if self.AllPointData[i]:CheckLock() then
                self.SelectID = i
                StormViewModel.CurPointData = self.AllPointData[i]
                self:OnBossPop(self.AllPointData[i])
            else
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1 }, true)
            end
        end)
    end
    self.BossPopBtn().gameObject:SetActive(false)
end
---@param _bossData StormPointData
function M:OnBossPop(_bossData)
    if _bossData == nil then
        return
    end
    if self.SelectID <= 1 then
        self.Btn_zuo().gameObject:SetActive(false)
        self.Btn_you().gameObject:SetActive(true)
    elseif self.SelectID >= #self.AllPointData then
        self.Btn_zuo().gameObject:SetActive(true)
        self.Btn_you().gameObject:SetActive(false)
    else
        self.Btn_zuo().gameObject:SetActive(true)
        self.Btn_you().gameObject:SetActive(true)
    end
    ---当前关卡
    StormViewModel.CurPointData = _bossData
    self.Text_BossPopName().text = _bossData.name
    self.Text_BossLv().text = "LV "..self.BossDataList[_bossData.id].level
    ---刷新消耗
    self:RefreshCoinCount()
    ---胜利条件
    self:InitStar(_bossData)
    ---设置Loop数量
    self.RewardsList = _bossData:GetRewards()
    self.BossRewardsScroll01().totalCount = #self.RewardsList
    self.BossRewardsScroll01():RefillCells()
    ---BOSS图
    if _bossData.picture ~= "0" then
        MgrRes.LoadSprite(self.BossPopImg(),_bossData.picture)
    end
    ---BOSS血量
    ActivityControl.SetBossLevel(_bossData.id)
    ActivityControl.GetBossData(function(_tab)
        local data = _bossData:GetMonsterById(self.BossDataList[_bossData.id].id)
        local tBData = ReadData.GetBossAttr(data.id, data.star, data.level, data.skillLevel, data.awaken)

        if _tab == nil or _tab.totalHp == 0
        then
            self.Img_BossHp().fillAmount = 1
            self.Text_BossHp().text = math.modf(tBData.HPmax) .. "/" .. math.modf(tBData.HPmax)
            self.Text_BossHpPer().text = "100%"
            BattleManager.CurActivityBossHp = math.modf(tBData.HPmax)
        else
            ---如果是0则显示满血
            if _tab.nowHp == 0 then
                self.Img_BossHp().fillAmount = 1
                self.Text_BossHp().text = _tab.totalHp .. "/" .. _tab.totalHp
                self.Text_BossHpPer().text = "100%"
                BattleManager.CurActivityBossHp = _tab.totalHp
            else
                self.Img_BossHp().fillAmount = _tab.nowHp / _tab.totalHp
                self.Text_BossHp().text = _tab.nowHp .. "/" .. _tab.totalHp
                self.Text_BossHpPer().text = math.modf(_tab.nowHp / _tab.totalHp * 100) .. "%"
                BattleManager.CurActivityBossHp = _tab.nowHp
            end
        end
        ---扫荡锁和提示
        if BattleManager.CurActivityBossPointInfo == nil or BattleManager.CurActivityBossPointInfo.levelPerfectCount < self.LimitCount then
            self.SweepSuo().gameObject:SetActive(true)
        elseif BattleManager.CurActivityBossPointInfo.levelPerfectCount >= self.LimitCount then
            self.SweepSuo().gameObject:SetActive(false)
        end
        
        Tools.ReSize(self.Btn_Content().gameObject)
    end)
    self.BossPop().gameObject:SetActive(true)
end

function M:CheckFast()
    if StormViewModel.CurPointData == nil then
        return false
    end
    if not StormViewModel.CurPointData:CheckLock() then
        --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
        return false
    end
    if StormViewModel.CurPointData.star < 7 then
        return false
    end
    if StormViewModel.CurPointData.type == StormViewModel.PointBattleType.ACTIVITY_BLOODBOSS then
        if BattleManager.CurActivityBossPointInfo == nil or BattleManager.CurActivityBossPointInfo.levelPerfectCount < self.LimitCount then
            --MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("activityCcontrol_tips2"),5),1},true)
            return false
        end
    end

    return true
end

---关卡通关评级
function M:InitStar(_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    local strArr = string.split(_data.condition, ",")
    if #strArr <= 1 then
        return
    end
    for i = 1,#self.StarGroup do
        self.StarGroup[i].Star.gameObject:SetActive(tStar[i])
        self.StarGroup[i].Condition.text = TermdescLocalData.tab[tonumber(string.split(strArr[i], "_")[3])][2]
    end
end
---刷新消耗
function M:RefreshCoinCount()
    ---右上角体力显示
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili.."/"..TiliMax
    ---关卡消耗体力显示
    if StormViewModel.CurPointData then
        local vigor = StormViewModel.CurPointData.consume and tonumber(string.split(StormViewModel.CurPointData.consume,"_")[3]) or 0
        local color = curTili < vigor and "#ff3149" or "#000000"
        self.Text_CNum().text = "<color="..color..">"..curTili.."</color>/"..vigor
    end
end

function M:OnUpdateUI()
    ---背景音乐
    if self.ChapterBoss and self.ChapterBoss.chaptermusic ~= "" then
        MgrSound.PlayBGM(self.ChapterBoss.chaptermusic,0.2,nil,true)
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        StormViewModel.CurPointData = nil
        BattleManager.CurActivityBossHp = 0
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M