-- Code Auto Create Begin
local M = Class('HalfAnniversaryLevels_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryLevels_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryLevels_UI].prefab'
    self.Name = 'Form[HalfAnniversaryLevels_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Main_Level','Main_Level',2},{'Img_LevelIcon','Main_Level/Img_LevelIcon',2},{'Img_Mask1','Main_Level/Img_Mask1',2},{'Img_di','Main_Level/RightPanel/Img_di',2},{'Img_Shijianxian','Main_Level/RightPanel/Img_Shijianxian',2},{'Img_Section','Main_Level/RightPanel/Img_Section',2},{'LevelScorll','Main_Level/RightPanel/LevelScorll',2},{'Explore_Level','Explore_Level',2},{'Img_MapIcon','Explore_Level/Img_MapIcon',2},{'Img_Mask2','Explore_Level/Img_Mask2',2},{'Img_TansuoIcon','Explore_Level/RightPanel/Text_PointName/Img_TansuoIcon',2},{'Img_Fengexian','Explore_Level/RightPanel/Img_Fengexian',2},{'Btn_InExplore','Explore_Level/RightPanel/Btn_InExplore',2},{'Img_Sanjiao','LeftPanel/Text_PlotTitle/Img_Sanjiao',2},{'Img_Sanjiao01','LeftPanel/Text_Drop/Img_Sanjiao',2},{'RewardsScroll','LeftPanel/RewardsScroll',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Btn_AddPower/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'UpperLightPanel','UpperLightPanel',2},{'Btn_GoMenu','UpperLightPanel/Btn_GoMenu',2},{'Btn_Back','UpperLightPanel/Btn_Back',2},{'Img_Fenggexian','UpperLightPanel/Img_Fenggexian',2},{'Btn_Help','UpperLightPanel/Btn_Help',2},
        -- UITemplate 列表
        {'HalfAnniversaryLevelItem','Main_Level/RightPanel/LevelScorll/HalfAnniversaryLevelItem',10},{'PointRewardsItem','LeftPanel/RewardsScroll/PointRewardsItem',10},
        -- LoopScrollRect 列表
        {'LevelScorll01','Main_Level/RightPanel/LevelScorll',18},{'RewardsScroll01','LeftPanel/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_PointName','Explore_Level/RightPanel/Text_PointName',20},{'Text_Jindu','Explore_Level/RightPanel/Text_Jindu',20},{'Text_InPoint','Explore_Level/RightPanel/Btn_InExplore/Text_InPoint',20},{'Text_PlotTitle','LeftPanel/Text_PlotTitle',20},{'Text_PlotTips','LeftPanel/Text_PlotTips',20},{'Text_Drop','LeftPanel/Text_Drop',20},{'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','UpperLightPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLightPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TouchLevel = HalfAnniControl.GetToutchLevel()
    local unlockChapter = HalfAnniControl.GetNewChapter()
    self.CurChapterData = unlockChapter[self.TouchLevel.chapter]
    ---关卡列表 
    self.CurLevelList = nil
    self.CurRewardList = nil
    
    self:RefreshCoinCount()
    self:InitButton()
    
    if self.CurChapterData == nil then
        return
    end

    Event.Add("HalfAnni",Handle(self,self.ShowCurData))
    ---注册掉落滑块
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardItem))
    ---检测是关卡还是地图入口
    self:CheckUI()
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

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))
    ---进入走格子地图
    UIEvent.LuaClick(self.Btn_InExplore().gameObject, Handle(self, function()
        if not ActiveChapterControl.CheckScrollLock(self.TouchLevel.chapter) then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        
        SummerMapControl.SetChapter(self.TouchLevel.chapter)
        SummerMapControl.SetChapterData(self.CurChapterData)
        SummerMapControl.SetHelp(HalfAnniControl.GetData().group)
        
        MgrUI.GoHide(UID.SummerExplore_UI)
    end))
end
---检测是关卡还是地图入口
function M:CheckUI()
    ---判断是否是走格子关卡
    if self.CurChapterData.chaptertype == ActiveChapterControl.ChapterType.Logic then
        self.Main_Level().gameObject:SetActive(false)
        self.Explore_Level().gameObject:SetActive(true)
        
        self.Text_Jindu().text = self.TouchLevel.level.."%"
        
        local tCurRewardList = self:GetRewards(self.CurChapterData.awardview)
        self:ShowReward(tCurRewardList)
        ---描述
        self.Text_PlotTips().text = self.CurChapterData.chapterdesc
        ---地图名
        self.Text_PointName().text = self.CurChapterData.chaptername
        ---背景图
        MgrRes.LoadSprite(self.Img_MapIcon(),self.CurChapterData.chapterpicture)
        ---地图进度
        local tPassType = ActiveChapterControl.CheckScrollState(self.CurChapterData.chapterid)
        local tStr = MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text10")
        if tPassType == 0 then
            tStr = tStr..MgrLanguageData.GetLanguageByKey("ui_summerevent_text28")
        elseif tPassType == 1 then
            tStr = tStr..MgrLanguageData.GetLanguageByKey("ui_summerevent_text29")
        elseif tPassType == 2 then
            tStr = tStr..MgrLanguageData.GetLanguageByKey("ui_summerevent_text30")
        end
        self.Text_Jindu().text = tStr
    else
        self.Main_Level().gameObject:SetActive(true)
        self.Explore_Level().gameObject:SetActive(false)

        ---注册滑块
        self.LevelScorll01():SetLuaCellEvent(Handle(self, self.LevelItem))
        self.CurLevelList = self.CurChapterData.levels
        
        self.LevelScorll01().totalCount = #self.CurLevelList
        
        local idx = 0
        for i, v in ipairs(self.CurLevelList) do
            if self.TouchLevel.level == v then
                idx = i-1
            end
        end
        self.LevelScorll01():RefillCells(idx)
    end
end
function M:ShowCurData(_curPoint)
    ---关卡描述
    self.Text_PlotTips().text = _curPoint.introduction
    ---关卡奖励
    self:ShowReward(_curPoint:GetRewards())
    ---背景图
    MgrRes.LoadSprite(self.Img_LevelIcon(),_curPoint.bgpicture)
end

function M:ShowReward(_award)
    self.CurRewardList = _award

    self.RewardsScroll01().totalCount = #self.CurRewardList
    self.RewardsScroll01():RefillCells()
end
---关卡列表
function M:LevelItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.CurLevelList[idx],self.TouchLevel.level==self.CurLevelList[idx] })
end
---关卡掉落
function M:RewardItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData(self.CurRewardList[idx])
end
---获取奖励物品
function M:GetRewards(_itemData)
    local arr = {}

    ---固定奖励
    for i, v in pairs(_itemData) do
        local config = Global.GetLocalDataByGoods(v)
        local vSelf = string.split(v, "_")
        
        local data = {}
        data.type = vSelf[1]
        data.config = config
        data.id = config.id
        data.quality = config.quality
        data.isOnceAdopt = false
        data.count = tonumber(vSelf[3])
        data.isRec = false
        data.idx = #arr + 1
        arr[#arr + 1] = data
    end
    
    Global.Sort(arr, { "isOnceAdopt", "idx" }, { true, false })
    return arr
end
---刷新体力
function M:RefreshCoinCount()
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili.."/"..TiliMax
end

function M:OnUpdateUI()
    ---背景音乐
    if self.CurChapterData and self.CurChapterData.chaptermusic ~= "" then
        MgrSound.PlayBGM(self.CurChapterData.chaptermusic,0.2,nil,true)
    end
end

function M:OnClose()
    Event.Clear("HalfAnni")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M