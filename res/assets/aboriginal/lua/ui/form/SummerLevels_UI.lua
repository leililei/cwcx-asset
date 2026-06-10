-- Code Auto Create Begin
local M = Class('SummerLevels_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SummerLevels_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SummerLevels_UI].prefab'
    self.Name = 'Form[SummerLevels_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'SwitchPanel','SwitchPanel',2},{'Shop','SwitchPanel/Shop',2},{'Img_Shopdi','SwitchPanel/Shop/Img_Shopdi',2},{'Task','SwitchPanel/Task',2},{'Img_Missiondi','SwitchPanel/Task/Img_Missiondi',2},{'MissionRedDotIcon','SwitchPanel/Task/MissionRedDotIcon',2},{'RaidLock1','SwitchPanel/Raid/RaidLock1',2},{'Img_Suo','SwitchPanel/Raid/RaidLock1/Img_Suo',2},{'RaidLock2','SwitchPanel/Raid/RaidLock2',2},{'Img_Suo01','SwitchPanel/Raid/RaidLock2/Img_Suo',2},{'Img_Raiddi','SwitchPanel/Raid/Img_Raiddi',2},{'Img_Raiddi_H1','SwitchPanel/Raid/Img_Raiddi_H1',2},{'Img_Raiddi_H2','SwitchPanel/Raid/Img_Raiddi_H2',2},{'BossLock','SwitchPanel/BossRaid/BossLock',2},{'Img_Suo02','SwitchPanel/BossRaid/BossLock/Img_Suo',2},{'Img_BossRaiddi','SwitchPanel/BossRaid/Img_BossRaiddi',2},{'Img_BossRaiddi_H','SwitchPanel/BossRaid/Img_BossRaiddi_H',2},{'ToggleG','SwitchPanel/ToggleG',2},{'LevelBtn1','SwitchPanel/ToggleG/LevelBtn1',2},{'Img_Sanjiao','SwitchPanel/ToggleG/LevelBtn1/Img_Sanjiao',2},{'LevelBtn2','SwitchPanel/ToggleG/LevelBtn2',2},{'Img_Sanjiao01','SwitchPanel/ToggleG/LevelBtn2/Img_Sanjiao',2},{'BossBtn','SwitchPanel/ToggleG/BossBtn',2},{'Img_Sanjiao02','SwitchPanel/ToggleG/BossBtn/Img_Sanjiao',2},{'Sanjiao','SwitchPanel/ToggleG/Sanjiao',2},{'Main_Level','Main_Level',2},{'Panel_MainPoint','Main_Level/Panel_MainPoint',2},{'LevelsScroll','Main_Level/LevelsScroll',2},{'ItemMask','Main_Level/LevelsScroll/ItemMask',2},{'di','Main_Level/SelectPoint/Panel_Info/di',2},{'Img_Xian2','Main_Level/SelectPoint/Panel_Info/Img_Xian2',2},{'Img_Xian1','Main_Level/SelectPoint/Panel_Info/Img_Xian1',2},{'Img_Biaotixian1','Main_Level/SelectPoint/Panel_Info/Img_Biaotixian1',2},{'Img_Biaotixian2','Main_Level/SelectPoint/Panel_Info/Img_Biaotixian2',2},{'PointIdxNamedi','Main_Level/SelectPoint/Panel_Info/PointIdxNamedi',2},{'Zuozhan','Main_Level/SelectPoint/Panel_Info/Zuozhan',2},{'Img_StarTask_1','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1',2},{'Img_LevelStar_1','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_LevelStar_1',2},{'Highlight','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Img_LevelStar_1/Highlight',2},{'Img_StarTask_2','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2',2},{'Img_LevelStar_2','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_LevelStar_2',2},{'Highlight01','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Img_LevelStar_2/Highlight',2},{'Img_StarTask_3','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3',2},{'Img_LevelStar_3','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_LevelStar_3',2},{'Highlight02','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Img_LevelStar_3/Highlight',2},{'Btn_Fast','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_Fast',2},{'Btu_Saodangdi','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btu_Saodangdi',2},{'SweepSuo','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/SweepSuo',2},{'Btn_InPoint','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint',2},{'Btn_Zuozhanzhunbeidi','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili',2},{'Img_LevelCost','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Img_LevelCost',2},{'JuQing','Main_Level/SelectPoint/Panel_Info/JuQing',2},{'Btn_InExplore','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore',2},{'Btn_Zuozhanzhunbeidi01','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili01','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore/Img_Xiaohaotili',2},{'Img_LevelCost01','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore/Img_Xiaohaotili/Img_LevelCost',2},{'Main_Boss','Main_Boss',2},{'BossTips','Main_Boss/BossTips',2},{'zhuangshixian','Main_Boss/BossTips/zhuangshixian',2},{'Img_Chakandi1','Main_Boss/BossTips/Text_BossName/Img_Chakandi1',2},{'Img_Chakanicon1','Main_Boss/BossTips/Text_BossName/Img_Chakandi1/Img_Chakanicon1',2},{'Btn_Chakan','Main_Boss/BossTips/Btn_Chakan',2},{'Biaoti','Main_Boss/BossTips/Biaoti',2},{'ShowBossPanel','Main_Boss/ShowBossPanel',2},{'BossPopBtn','Main_Boss/ShowBossPanel/BossPopBtn',2},{'XzJiaobiao','Main_Boss/ShowBossPanel/BossPopBtn/XzJiaobiao',2},{'Nomal','Main_Boss/ShowBossPanel/BossPopBtn/Nomal',2},{'MenpiaoIcon','Main_Boss/ShowBossPanel/BossPopBtn/Nomal/MenpiaoIcon',2},{'Hard','Main_Boss/ShowBossPanel/BossPopBtn/Hard',2},{'MenpiaoIcon01','Main_Boss/ShowBossPanel/BossPopBtn/Hard/MenpiaoIcon',2},{'BossLock01','Main_Boss/ShowBossPanel/BossPopBtn/BossLock',2},{'UpperRightPanel','UpperRightPanel',2},{'Coin1','UpperRightPanel/Coin1',2},{'Img_PowerBG','UpperRightPanel/Coin1/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Coin1/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Coin1/Img_Tiliicon',2},{'Coin2','UpperRightPanel/Coin2',2},{'Img_PowerBG2','UpperRightPanel/Coin2/Img_PowerBG2',2},{'Btn_Add2','UpperRightPanel/Coin2/Btn_Add2',2},{'Img_Tiliicon2','UpperRightPanel/Coin2/Img_Tiliicon2',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'BossPop','BossPop',2},{'BossPopDi','BossPop/BossPopDi',2},{'BossPopBg','BossPop/BossPopBg',2},{'BossPopImg','BossPop/BossPopBg/BossPopImg',2},{'Panel_Diff','BossPop/Panel_Diff',2},{'Img_DiffBG','BossPop/Panel_Diff/Img_DiffBG',2},{'Btn_Normal','BossPop/Panel_Diff/Btn_Normal',2},{'Img_Normal','BossPop/Panel_Diff/Btn_Normal/Img_Normal',2},{'Btn_Hard','BossPop/Panel_Diff/Btn_Hard',2},{'HardBossSuo','BossPop/Panel_Diff/Btn_Hard/Content/HardBossSuo',2},{'Img_Hard','BossPop/Panel_Diff/Btn_Hard/Img_Hard',2},{'Btn_Hard_Mask','BossPop/Panel_Diff/Btn_Hard_Mask',2},{'BossNameBack','BossPop/BossNameBack',2},{'Img_Xuetiaodi','BossPop/Img_Xuetiaodi',2},{'Img_BossHp','BossPop/Img_Xuetiaodi/Img_BossHp',2},{'Img_Shenyuxueliangdi','BossPop/Img_Shenyuxueliangdi',2},{'Img_Biaotixian101','BossPop/Img_Biaotixian1',2},{'Img_StarTask_101','BossPop/Img_StarTask_1',2},{'Img_BossStar_1','BossPop/Img_StarTask_1/Img_BossStar_1',2},{'Highlight03','BossPop/Img_StarTask_1/Img_BossStar_1/Highlight',2},{'Img_StarTask_201','BossPop/Img_StarTask_2',2},{'Img_BossStar_2','BossPop/Img_StarTask_2/Img_BossStar_2',2},{'Highlight04','BossPop/Img_StarTask_2/Img_BossStar_2/Highlight',2},{'Img_StarTask_301','BossPop/Img_StarTask_3',2},{'Img_BossStar_3','BossPop/Img_StarTask_3/Img_BossStar_3',2},{'Highlight05','BossPop/Img_StarTask_3/Img_BossStar_3/Highlight',2},{'Img_Biaotixian201','BossPop/Img_Biaotixian2',2},{'Btn_Fast01','BossPop/Btn_Fast',2},{'Shengyucishu','BossPop/Btn_Fast/Shengyucishu',2},{'Btn_Saodangdi','BossPop/Btn_Fast/Btn_Saodangdi',2},{'SweepSuo01','BossPop/Btn_Fast/Btn_Content/SweepSuo',2},{'Btn_InBoss','BossPop/Btn_InBoss',2},{'Btn_Zuozhanzhunbeidi02','BossPop/Btn_InBoss/Btn_Zuozhanzhunbeidi',2},{'Img_Xiaohaotili02','BossPop/Btn_InBoss/Img_Xiaohaotili',2},{'Img_CostIcon','BossPop/Btn_InBoss/Img_Xiaohaotili/Img_CostIcon',2},
        -- Button 列表
        {'Btn_ShowBoss','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',4},
        -- UITemplate 列表
        {'SummerLevelItem','Main_Level/LevelsScroll/SummerLevelItem',10},{'PointRewardsItem','Main_Level/SelectPoint/Panel_Info/VFXMask/RewardsScroll/PointRewardsItem',10},{'PointRewardsItem01','BossPop/VFXMask/BossRewardsScroll/PointRewardsItem',10},
        -- Toggle 列表
        {'Btn_Normal01','BossPop/Panel_Diff/Btn_Normal',13},{'Btn_Hard01','BossPop/Panel_Diff/Btn_Hard',13},
        -- RawImage 列表
        {'LevelsContent','Main_Level/LevelsScroll/ItemMask/LevelsContent',15},{'SelectPoint','Main_Level/SelectPoint',15},{'RewardsScroll','Main_Level/SelectPoint/Panel_Info/VFXMask/RewardsScroll',15},{'RewardsContent','Main_Level/SelectPoint/Panel_Info/VFXMask/RewardsScroll/RewardsContent',15},{'Btn_ShowBoss01','Main_Boss/BossTips/Text_BossName/Btn_ShowBoss',15},{'BossRewardsScroll','BossPop/VFXMask/BossRewardsScroll',15},{'RewardsContent01','BossPop/VFXMask/BossRewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'LevelsScroll01','Main_Level/LevelsScroll',18},{'RewardsScroll01','Main_Level/SelectPoint/Panel_Info/VFXMask/RewardsScroll',18},{'BossRewardsScroll01','BossPop/VFXMask/BossRewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Shop','SwitchPanel/Shop/Text_Shop',20},{'Text_Mission','SwitchPanel/Task/Text_Mission',20},{'Text_BossLock','SwitchPanel/Raid/RaidLock1/Text_BossLock',20},{'Text_BossLock01','SwitchPanel/Raid/RaidLock2/Text_BossLock',20},{'Text_Raid1','SwitchPanel/Raid/Text_Raid1',20},{'Text_Raid2','SwitchPanel/Raid/Text_Raid2',20},{'Text_BossLock02','SwitchPanel/BossRaid/BossLock/Text_BossLock',20},{'Text_BossRaid','SwitchPanel/BossRaid/Text_BossRaid',20},{'Text_PointName','Main_Level/SelectPoint/Panel_Info/Text_PointName',20},{'Text_PointIdxName','Main_Level/SelectPoint/Panel_Info/PointIdxNamedi/Text_PointIdxName',20},{'Text_TaskName','Main_Level/SelectPoint/Panel_Info/Zuozhan/Text_TaskName',20},{'Text_LevelTask_1','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_1/Text_LevelTask_1',20},{'Text_LevelTask_2','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_2/Text_LevelTask_2',20},{'Text_LevelTask_3','Main_Level/SelectPoint/Panel_Info/Zuozhan/Img_StarTask_3/Text_LevelTask_3',20},{'Text_Drop','Main_Level/SelectPoint/Panel_Info/Zuozhan/Text_Drop',20},{'Text_Saodang','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_InPoint','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Text_InPoint',20},{'Text_LevelNum','Main_Level/SelectPoint/Panel_Info/Zuozhan/Btn_InPoint/Img_Xiaohaotili/Text_LevelNum',20},{'Text_PlotTitle','Main_Level/SelectPoint/Panel_Info/JuQing/Text_PlotTitle',20},{'Text_PlotTips','Main_Level/SelectPoint/Panel_Info/JuQing/Text_PlotTips',20},{'Text_Drop01','Main_Level/SelectPoint/Panel_Info/JuQing/Text_Drop',20},{'Text_InPoint01','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore/Text_InPoint',20},{'Text_LevelNum01','Main_Level/SelectPoint/Panel_Info/JuQing/Btn_InExplore/Img_Xiaohaotili/Text_LevelNum',20},{'Text_Jianjie','Main_Boss/BossTips/Text_Jianjie',20},{'Text_BossName','Main_Boss/BossTips/Text_BossName',20},{'Text_Taofamubiao','Main_Boss/BossTips/Biaoti/Text_Taofamubiao',20},{'Text_CrusadeTarget','Main_Boss/BossTips/Biaoti/Text_CrusadeTarget ',20},{'Text_Putong','Main_Boss/ShowBossPanel/BossPopBtn/Nomal/Text_Putong',20},{'Text_Shuliang','Main_Boss/ShowBossPanel/BossPopBtn/Nomal/Text_Shuliang',20},{'Text_Kunnan','Main_Boss/ShowBossPanel/BossPopBtn/Hard/Text_Kunnan',20},{'Text_Shuliang01','Main_Boss/ShowBossPanel/BossPopBtn/Hard/Text_Shuliang',20},{'Text_PopBossName','Main_Boss/ShowBossPanel/BossPopBtn/Text_PopBossName',20},{'Text_ResTili','UpperRightPanel/Coin1/Text_ResTili',20},{'Text_ResTili2','UpperRightPanel/Coin2/Text_ResTili2',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_Normal','BossPop/Panel_Diff/Btn_Normal/Text_Normal',20},{'Text_Normal01','BossPop/Panel_Diff/Btn_Normal/Img_Normal/Text_Normal',20},{'Text_Hard','BossPop/Panel_Diff/Btn_Hard/Content/Text_Hard',20},{'Text_Hard01','BossPop/Panel_Diff/Btn_Hard/Img_Hard/Text_Hard',20},{'Text_BossPopName','BossPop/BossNameBack/Text_BossPopName',20},{'Text_Mode','BossPop/BossNameBack/Text_Mode',20},{'Text_TuijianLV','BossPop/Text_TuijianLV',20},{'Text_BossHpPer','BossPop/Text_BossHpPer',20},{'Text_BossHp','BossPop/Text_BossHp',20},{'Text_Shenyuxueliang','BossPop/Img_Shenyuxueliangdi/Text_Shenyuxueliang',20},{'Text_TaskName01','BossPop/Text_TaskName',20},{'Text_BossTask_1','BossPop/Img_StarTask_1/Text_BossTask_1',20},{'Text_BossTask_2','BossPop/Img_StarTask_2/Text_BossTask_2',20},{'Text_BossTask_3','BossPop/Img_StarTask_3/Text_BossTask_3',20},{'Text_LevelType','BossPop/Text_LevelType',20},{'Text_Cishu','BossPop/Btn_Fast/Shengyucishu/Text_Cishu',20},{'Text_Saodang01','BossPop/Btn_Fast/Btn_Content/Text_Saodang',20},{'Text_InPoint02','BossPop/Btn_InBoss/Text_InPoint',20},{'Text_CNum','BossPop/Btn_InBoss/Img_Xiaohaotili/Text_CNum',20},{'Txt_Back','BossPop/Txt_Back',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Main_Level().gameObject:SetActive(false)
    self.SelectPoint().gameObject:SetActive(false)
    self.Main_Boss().gameObject:SetActive(false)
    self.BossPop().gameObject:SetActive(false)
    ---toggle,卷ID
    self.mToggleGroup = {
        ---页签按钮,卷ID,选中状态图片,按钮锁,卷类型
        [1] = { self.LevelBtn1(), SummerControl.LevelScroll.Scroll1, self.Img_Raiddi_H1(), self.RaidLock1(), ActiveChapterControl.ChapterType.Logic, self.Text_Raid1().transform:GetComponent("CanvasGroup") },
        [2] = { self.LevelBtn2(), SummerControl.LevelScroll.Scroll2, self.Img_Raiddi_H2(), self.RaidLock2(), ActiveChapterControl.ChapterType.Logic, self.Text_Raid2().transform:GetComponent("CanvasGroup") },
        [3] = { self.BossBtn(), SummerControl.LevelScroll.Scroll3, self.Img_BossRaiddi_H(), self.BossLock(), ActiveChapterControl.ChapterType.Boss, self.Text_BossRaid().transform:GetComponent("CanvasGroup") }
    }
    self.mBossPopToggle = {
        [1] = { self.Btn_Normal01(), self.Img_Normal() },
        [2] = { self.Btn_Hard01(), self.Img_Hard() }
    }
    self.CurPanel = nil     ---当前展示的页签
    self.CurBGName = nil    ---当前使用的背景图名称
    self.CurBossBtn = nil   ---当前选中的BOSS按钮
    self.CurPageBtn = nil   ---当前页签按钮
    self.ItemMask = self.ItemMask().transform:GetComponent("RectMask2D")
    ---注册滑块
    self.LevelsScroll01():SetLuaCellEvent(Handle(self, self.CellItem))
    self.RewardsScroll01():SetLuaCellEvent(Handle(self, self.RewardCellItem))
    self.BossRewardsScroll01():SetLuaCellEvent(Handle(self, self.RewardCellItem))
    ---体力
    self:RefreshCost()

    self:InitButton()

    self:AddEvent()
    ---刷新红点
    self:RefreshRedDot()
    ---夏活任务关闭时刷新本界面红点
    Event.Add("SummerLevels_UI_RefreshRedDoc", function()
        if self.ObjRoot then
            self:RefreshRedDot()
        end
    end)
end

function M:OnBackShow()
    ---回到此界面后重新刷新任务数据
    SummerControl.CheckTaskRedPoint()
    self:RefreshRedDot()
    self:SwitchUI(true)
    if self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Logic then
        ---背景音乐
        if self.CurLevelList.ChapterMusic ~= "" then
            MgrSound.PlayBGM(self.CurLevelList.ChapterMusic,0.2,nil,true)
        end
    elseif self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Boss then
        ---背景音乐
        if self.CurLevelList[SummerControl.GetBossIndex()].chaptermusic ~= "" then
            MgrSound.PlayBGM(self.CurLevelList[SummerControl.GetBossIndex()].chaptermusic,0.2,nil,true)
        end
    end
end

function M:OnUpdateUI()
    
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
function M:InitButton()
    local tBossBtnLock = SummerControl.CheckChapterLock(ActiveChapterControl.ChapterType.Boss)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        StormViewModel.CurPointData = nil
        SummerControl.SetBossLevel()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.SummerHome_UI)
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        StormViewModel.CurPointData = nil
        SummerControl.SetBossLevel()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        if self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Logic then
            ActiveTutorialControl.OpenGuide(SummerControl.GetSummerData().group)
        elseif self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Boss then
            ActiveTutorialControl.OpenGuide(SummerControl.GetSummerData().group)
        end
    end)
    ---商店
    UIEvent.LuaClick(self.Shop().gameObject, function()
        MgrUI.GoHide(UID.SummerShop_UI)
    end)
    ---任务
    UIEvent.LuaClick(self.Task().gameObject, function()
        MgrUI.Pop(UID.SummerTask_UI)
    end)
    ---关卡及BOSS
    for i = 1, #self.mToggleGroup do
        local tSanJiao = self.mToggleGroup[i][1].transform:Find("Img_Sanjiao").transform
        ---按钮控制
        if i == SummerControl.GetPageID() then
            self.CurPageBtn = self.mToggleGroup[i]
            self.CurPageBtn[3].gameObject:SetActive(true)
            
            self.Sanjiao().transform.position = tSanJiao.position
        else
            self.mToggleGroup[i][3].gameObject:SetActive(false)
        end
        ---按钮锁
        local tIsOpen = SummerControl.CheckChapterTimeOpen(self.mToggleGroup[i][5], self.mToggleGroup[i][2])
        self.mToggleGroup[i][4].gameObject:SetActive(not tIsOpen)
        if tIsOpen and self.mToggleGroup[i][1] == self.BossBtn() then
            ---检查BOSS界面是否解锁
            self.mToggleGroup[i][4].gameObject:SetActive(not tBossBtnLock)
        end
        -----按钮文字透明度
        --if self.mToggleGroup[i][4].gameObject.activeSelf then
        --    self.mToggleGroup[i][6].alpha = 0.5
        --else
        --    self.mToggleGroup[i][6].alpha = 1
        --end
        
        UIEvent.LuaClick(self.mToggleGroup[i][1].gameObject, function()
            if self.CurPageBtn == self.mToggleGroup[i] then
                return
            end
            if not tIsOpen then
                if self.mToggleGroup[i][5] == ActiveChapterControl.ChapterType.Logic then
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text9"), 1 }, true)
                else
                    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text23"), 1 }, true)
                end
                return
            end
            if self.mToggleGroup[i][1] == self.BossBtn() and not tBossBtnLock then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text15"), 1 }, true)
                return
            end
            self.CurPageBtn[3].gameObject:SetActive(false)
            self.CurPageBtn = self.mToggleGroup[i]
            self.CurPageBtn[3].gameObject:SetActive(true)

            ---按钮三角位置切换
            self.Sanjiao().transform.position = tSanJiao.position
            ---更新选中界面
            SummerControl.SetPageID(self.CurPageBtn[2])
            self:SwitchUI(true)
        end, nil, self.mToggleGroup[i][1])
    end

    UIEvent.LuaClick(self.Btn_Hard_Mask().gameObject,function()
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_summerevent_text15"),1},true)
    end)

    ---点击隐藏关卡信息
    UIEvent.LuaClick(self.Background().gameObject, function()
        if self.SelectPoint().gameObject.activeSelf then
            self.SelectPoint().gameObject:SetActive(false)
            self.SwitchPanel().gameObject:SetActive(true)
            self.ItemMask.enabled = false
        end
    end, nil, self.Background())
    UIEvent.LuaClick(self.LevelsScroll().gameObject, function()
        if self.SelectPoint().gameObject.activeSelf then
            self.SelectPoint().gameObject:SetActive(false)
            self.SwitchPanel().gameObject:SetActive(true)
            self.ItemMask.enabled = false
        end
    end, nil, self.LevelsScroll())
    ---关闭BOSS弹窗
    UIEvent.LuaClick(self.BossPopDi().gameObject, function()
        SummerControl.SetBossLevel()
        self.BossPop().gameObject:SetActive(false)
        BattleManager.CurActivityBossHp = 0
    end, nil, self.BossPopDi())
    ---BOSS弹窗难度切换按钮
    for i = 1, #self.mBossPopToggle do
        Tools.ToggleValueChange(self.mBossPopToggle[i][1], function(isOn)
            if isOn then
                self.mBossPopToggle[i][2].gameObject:SetActive(true)
                ---设置BOSS难度
                SummerControl.SetBossMode(i)
                ---设置BOSS关卡
                SummerControl.SetBossLevel(self.CurLevelList[SummerControl.GetBossIndex()].levels[i])
                ---BOSS弹窗
                self:PopBoss(SummerControl.GetBossIndex())
            else
                self.mBossPopToggle[i][2].gameObject:SetActive(false)
            end
        end)
        self.mBossPopToggle[i][1].isOn = false
    end
    ---格子关卡
    UIEvent.LuaClick(self.Btn_InExplore().gameObject, function()
        local tCurChapterID = SummerControl.GetSelectID()
        if not ActiveChapterControl.CheckScrollLock(tCurChapterID) then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        local tCurChapterData = SummerControl.GerCurChapterData()
        SummerMapControl.SetChapter(tCurChapterID)
        SummerMapControl.SetChapterData(tCurChapterData)
        SummerMapControl.SetHelp(SummerControl.GetSummerData().group)
        
        MgrUI.GoHide(UID.SummerExplore_UI)
    end)
    ---关卡挑战
    UIEvent.LuaClick(self.Btn_InPoint().gameObject, function()
        if not StormViewModel.CurPointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end, nil)
    end)
    ---关卡扫荡
    UIEvent.LuaClick(self.Btn_Fast().gameObject, function()
        if not self:CheckFast() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
            return
        end

        MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData,function()
            self:RefreshCost()
        end }, true)
    end)
    ---BOSS挑战
    UIEvent.LuaClick(self.Btn_InBoss().gameObject, function()
        if StormViewModel.CurPointData and not StormViewModel.CurPointData:CheckLock() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
            return
        end
        --local tCost = string.split(StormViewModel.CurPointData.consume, "_")
        --if ItemControl.GetItemByIdAndType(tonumber(tCost[2]), tonumber(tCost[1])).count < tonumber(tCost[3]) then
        --    MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("battle_ui_tips1"), 1 }, true)
        --    return
        --end
        
        MgrTimer.AddDelay("GoPlot", 1, function()
            ---下次需要获取夏活BOSS数据
            SummerControl.ChangeBossData()
            BattleManager.GameMode = BattleManager.GameModeType.ActivityBoss
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activityBoss)
        end, nil)
    end)
    ---BOSS扫荡
    UIEvent.LuaClick(self.Btn_Fast01().gameObject, function()
        if not self:CheckFast() then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text22"), 1 }, true)
            return
        end
        local tCost = string.split(StormViewModel.CurPointData.consume, "_")
        if ItemControl.GetItemByIdAndType(tonumber(tCost[2]), tonumber(tCost[1])).count < tonumber(tCost[3]) then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("battle_ui_tips1"), 1 }, true)
            return
        end
        
        MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData,function()
            self:RefreshBossCost()
            self.Text_CNum().text = ItemControl.GetItemByIdAndType(tonumber(tCost[2]), tonumber(tCost[1])).count .. string.format("<color=#FFFFFF>%s</color>", "/" .. tCost[3])
        end }, true)
    end)
    ---跳转体力信息面板
    UIEvent.LuaClick(self.Coin1().gameObject, Handle(self, function()
        if self.CurPanel == self.Main_Boss() then
            return
        end
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCost()
        end}, true)
    end))
end

function M:CellItem(trans, idx)
    local isNextLock = false
    if idx < #self.CurLevelList then
        isNextLock = ActiveChapterControl.CheckScrollLock(self.CurLevelList[idx + 1].chapterid)
    end
    trans:GetComponent("UITemplate"):SetData({self.CurLevelList[idx], #self.CurLevelList == idx, isNextLock})
end

function M:RewardCellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData(self.CurRewardList[idx])
end

function M:OnShowFinish(pArg)
    self:SwitchUI()
end

function M:SwitchUI(_go)
    if SummerControl.GetSelectID() ~= nil or _go then
        self.CurLevelList = SummerControl.GetCurChaptersData()
    else
        self.CurLevelList = SummerControl.GetLastChaptersData(SummerControl.GetPageID())
    end

    if self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Logic then
        ---弹出引导帮助界面
        ActiveTutorialControl.ForcePopGuide(SummerControl.GetSummerData().group)
        self:SwichPanel(self.Main_Level())
        ---界面标题
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text4")
        self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text16")
        ---刷新关卡信息
        self.LevelsScroll01().totalCount = #self.CurLevelList + 3
        --self.LevelsScroll():RefillCells(0)
        if SummerControl.GetSelectID() == nil then
            for i ,v in ipairs(self.CurLevelList) do
                local isLock = ActiveChapterControl.CheckScrollLock(self.CurLevelList[i].chapterid)
                if isLock then
                    SummerControl.SetSelectID(self.CurLevelList[i].chapterid)
                end
            end
        end
        self:MoveItem()
        self:InitNormalButton()
        ---更换背景
        self:SwitchBG(self.CurLevelList.ChapterBG)
        ---背景音乐
        if self.CurLevelList.ChapterMusic ~= "" then
            MgrSound.PlayBGM(self.CurLevelList.ChapterMusic,0.2,nil,true)
        end
        ---刷新体力
        self:RefreshCost()
    elseif self.CurLevelList.Chaptertype == ActiveChapterControl.ChapterType.Boss then
        ---弹出引导帮助界面
        --ActiveTutorialControl.ForcePopGuide(3)
        self:SwichPanel(self.Main_Boss())
        ---界面标题
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text5")
        self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_summerevent_text17")
        
        SummerControl.InitBossLevelID(self.CurLevelList)
        self:BossUI(SummerControl.GetBossIndex())
        ---刷新门票
        self:RefreshBossCost()
    end
end

---更新选中界面
---@param _data ActiveChapterData | StormPointData @ _type == "chapter" -> ActiveChapterData, _type == "level" -> StormPointData
function M:UpdataSelect(_type, _data)
    ---更新选中Item位置
    self:MoveItem()
    ---更新选中界面资料
    self.SelectPoint().gameObject:SetActive(true)
    self.SwitchPanel().gameObject:SetActive(false)
    self.ItemMask.enabled = true
    local tItem = {
        award = nil,
        victory = nil
    }
    if _type == "chapter" then
        self.Zuozhan().gameObject:SetActive(false)
        self.JuQing().gameObject:SetActive(true)
        ---标题
        self.Text_PointName().text = _data.chaptername
        ---章节顺序
        self.Text_PointIdxName().text = _data.chapternum
        ---描述 
        self.Text_PlotTips().text = _data.chapterdesc
        ---道具
        tItem.victory = _data.awardview
        self.CurRewardList = self:GetRewards(tItem)

        ---更换背景
        self:SwitchBG(_data.chapterpicture)
    elseif _type == "level" then
        self.Zuozhan().gameObject:SetActive(true)
        self.JuQing().gameObject:SetActive(false)
        ---标题
        self.Text_PointName().text = _data.name
        ---章节顺序
        self.Text_PointIdxName().text = _data.idxName
        ---通过描述
        local s1, s2, s3 = _data:CheckStar()
        self.Img_LevelStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
        self.Img_LevelStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
        self.Img_LevelStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
        local strArr = string.split(_data.condition, ",")
        self.Text_LevelTask_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1], "_")[3])][2]
        self.Text_LevelTask_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2], "_")[3])][2]
        self.Text_LevelTask_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3], "_")[3])][2]
        ---奖励道具
        if _data.reward then
            local t = string.split(_data.reward, ',')
            tItem.award = t
        end
        if _data.victory then
            local t = string.split(_data.victory, ',')
            tItem.victory = t
        end
        self.CurRewardList = self:GetRewards(tItem)
        ---消耗
        local tCost = string.split(_data.consume, "_")
        local tIcon = Global.GetLocalDataByGoods(_data.consume).icon
        MgrRes.LoadSprite(self.Img_LevelCost(), "Item/" .. tIcon)
        self.Text_LevelNum().text = tCost[3]
        ---当前关卡
        StormViewModel.CurPointData = _data
        ---扫荡锁
        self:SweepSuo().gameObject:SetActive(not self:CheckFast())
    end
    self.RewardsScroll01().totalCount = #self.CurRewardList
    self.RewardsScroll01():RefillCells()
end

---切换页签
function M:SwichPanel(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
end
---更换背景
function M:SwitchBG(_name)
    if _name ~= "0" and _name ~= "" and _name ~= nil and _name ~= self.CurBGName then
        MgrRes.LoadSprite(self.Background(), _name)
        self.CurBGName = _name
        Tools.DoPFade(self.Background(), 0, 0, 0, 1, false, 0, 0, nil)
        MgrTimer.Cancel("SelectScrollBG")
        MgrTimer.AddDelay("SelectScrollBG", 0.1, function()
            Tools.DoPFade(self.Background(), 1, 0.2, 0, 1, false, 0, 0, nil)
        end, nil)
    end
end

function M:MoveItem()
    local offset = 0
    if SummerControl.GetSelectID() ~= nil then
        for i, v in ipairs(self.CurLevelList) do
            if v.chapterid == SummerControl.GetSelectID() or tonumber(v.unlocklevel) == SummerControl.GetSelectID() then
                if i == 1 then
                    offset = 0
                    break
                else
                    offset = i - 2
                    break
                end
            end
        end
    end
    self.LevelsScroll01():RefillCells(offset)
end

function M:InitNormalButton()
    local pageId = SummerControl.GetPageID()
    if self.CurPageBtn == self.mToggleGroup[pageId] or self.mToggleGroup[pageId][4].gameObject.activeSelf then
        return
    end
    local tSanJiao = self.mToggleGroup[pageId][1].transform:Find("Img_Sanjiao").transform
    self.CurPageBtn[3].gameObject:SetActive(false)
    self.CurPageBtn = self.mToggleGroup[pageId]
    self.CurPageBtn[3].gameObject:SetActive(true)

    ---按钮三角位置切换
    self.Sanjiao().transform.position = tSanJiao.position
end
---BOSS界面
function M:BossUI(_curBossID)
    self:RefrshBossUI(_curBossID)
    if self.CurBossBtn ~= nil then
        return
    end

    for i = 1, #self.CurLevelList do
        local tBtnList = GameObject.Instantiate(self.BossPopBtn().gameObject, self.ShowBossPanel().transform)
        local tSelect = tBtnList.transform:Find("XzJiaobiao").gameObject
        local tBossName = tBtnList.transform:Find("Text_PopBossName").gameObject:GetComponent("TextMeshProUGUI")
        
        MgrRes.LoadSprite(tBtnList.gameObject:GetComponent("Image"), self.CurLevelList[i].pickicon)
        tSelect:SetActive(i == _curBossID)
        if i == _curBossID then
            self.CurBossBtn = tSelect
        end
        ---判断当前BOSS是否解锁
        local tBossLock = tBtnList.transform:Find("BossLock").gameObject
        local normalBossId = self.CurLevelList[i].levels[SummerControl.BossMode.Normal]   ---获取普通BossID
        local curNormalBossData = StormControl.GetStormPointByID(normalBossId)
        tBossLock:SetActive(not curNormalBossData:CheckLock())
        tBossName.text = curNormalBossData.name
        
        UIEvent.LuaClick(tBtnList.gameObject, function()
            if not curNormalBossData:CheckLock() then
                ---判断当前BOSS是否解锁
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text15"), 1 }, true)
                return
            end
            ---设置BOSS界面index
            SummerControl.SetBossIndex(i)
            ---BOSS弹窗显示
            self.BossPop().gameObject:SetActive(true)
            ---设置BOSS关卡
            SummerControl.SetBossLevel(self.CurLevelList[i].levels[SummerControl.GetBossMode()])
            self.mBossPopToggle[1][1].isOn = true
            ---BOSS弹窗
            self:PopBoss(i)
            ---判断是否点击的是同一个按钮
            local tBtn = tBtnList.transform:Find("XzJiaobiao").gameObject
            if self.CurBossBtn == tBtn then
                return
            end
            self.CurBossBtn:SetActive(false)
            self.CurBossBtn = tBtn
            self.CurBossBtn:SetActive(true)
            ---刷新BOSS界面
            self:RefrshBossUI(i)
        end)
    end

    ---隐藏主UI
    self.BossPopBtn().gameObject:SetActive(false)
end
---刷新BOSS界面
function M:RefrshBossUI(_id)
    self.Text_BossName().text = self.CurLevelList[_id].chaptername
    self.Text_Jianjie().text = self.CurLevelList[_id].chapterdesc
    ---更换背景
    self:SwitchBG(self.CurLevelList[_id].chapterpicture)
    ---背景音乐
    if self.CurLevelList[_id].chaptermusic ~= "" then
        MgrSound.PlayBGM(self.CurLevelList[_id].chaptermusic,0.2,nil,true)
    end
end
---BOSS弹窗
function M:PopBoss(_id)
    if not self.BossPop().gameObject.activeSelf then
        return
    end
    MgrRes.LoadSprite(self.BossPopBg(), self.CurLevelList[_id].bossbackground)
    MgrRes.LoadSprite(self.BossPopImg(), self.CurLevelList[_id].bosspicture,nil,true)
    if self.CurLevelList[_id].bossPos ~= "0" and self.CurLevelList[_id].bossPos ~= nil then
        local pos = string.split(self.CurLevelList[_id].bossPos,',')
        self.BossPopImg().transform.anchoredPosition = Vector2(tonumber(pos[1]),tonumber(pos[2]))
    end
    ---获取当前选择难度
    local tCurBossMode = SummerControl.GetBossMode()
    ---获取当前关卡ID
    local tCurLevel = self.CurLevelList[_id].levels[tCurBossMode]
    ---获取当前关卡信息
    local tCurLevelData = StormControl.GetStormPointByID(tCurLevel)
    local tCurBossLevel = SummerControl.GetBossLevel()
    StormViewModel.CurPointData = tCurLevelData
    ---POP界面信息
    ---BOSS名
    self.Text_BossPopName().text = tCurLevelData.name
    ---难度显示
    if tCurBossMode == SummerControl.BossMode.Normal then
        self.Text_Mode().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text39")
        self.Text_Mode().color = Color(0.45, 1, 1, 1)
    elseif tCurBossMode == SummerControl.BossMode.Hard then
        self.Text_Mode().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text40")
        self.Text_Mode().color = Color(0.7, 0.6, 1, 1)
    end
    Tools.ReContentSizeGroup(self.BossNameBack().gameObject)
    ---推荐等级
    local tStr = MgrLanguageData.GetLanguageByKey("stormtower_ui_adviselevel")..tCurLevelData.recommendLevel
    self.Text_TuijianLV().text = tStr
    ---通过描述
    local s1, s2, s3 = tCurLevelData:CheckStar()
    self.Img_BossStar_1().transform:Find("Highlight").gameObject:SetActive(s1)
    self.Img_BossStar_2().transform:Find("Highlight").gameObject:SetActive(s2)
    self.Img_BossStar_3().transform:Find("Highlight").gameObject:SetActive(s3)
    local strArr = string.split(tCurLevelData.condition, ",")
    self.Text_BossTask_1().text = TermdescLocalData.tab[tonumber(string.split(strArr[1], "_")[3])][2]
    self.Text_BossTask_2().text = TermdescLocalData.tab[tonumber(string.split(strArr[2], "_")[3])][2]
    self.Text_BossTask_3().text = TermdescLocalData.tab[tonumber(string.split(strArr[3], "_")[3])][2]
    ---奖励道具
    local tItem = {
        award = nil,
        victory = nil
    }
    if tCurLevelData.reward then
        local t = string.split(tCurLevelData.reward, ',')
        tItem.award = t
    end
    if tCurLevelData.victory then
        local t = string.split(tCurLevelData.victory, ',')
        tItem.victory = t
    end
    self.CurRewardList = self:GetRewards(tItem)
    self.BossRewardsScroll01().totalCount = #self.CurRewardList
    self.BossRewardsScroll01():RefillCells()
    ---消耗券显示
    ---消耗
    local tCost = string.split(tCurLevelData.consume, "_")
    local tIcon = Global.GetLocalDataByGoods(tCurLevelData.consume).icon
    MgrRes.LoadSprite(self.Img_CostIcon(), "Item/" .. tIcon)
    self.Text_CNum().text = ItemControl.GetItemByIdAndType(tonumber(tCost[2]), tonumber(tCost[1])).count .. string.format("<color=#FFFFFF>%s</color>", "/" .. tCost[3])
    
    ---BOSS血量
    SummerControl.GetBossData(function(_tab)
        local data = tCurLevelData:GetMonsterById(tCurLevelData.monsters[1].id)
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
        if BattleManager.CurActivityBossPointInfo == nil or BattleManager.CurActivityBossPointInfo.levelPerfectCount < 5 then
            self.SweepSuo01().gameObject:SetActive(true)
            self.Shengyucishu().gameObject:SetActive(true)
            if BattleManager.CurActivityBossPointInfo == nil then
                self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_summerevent_text37"),5)
            else
                self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_summerevent_text37"),5-BattleManager.CurActivityBossPointInfo.levelPerfectCount)
            end
        elseif BattleManager.CurActivityBossPointInfo.levelPerfectCount >= 5 then
            self.SweepSuo01().gameObject:SetActive(false)
            self.Shengyucishu().gameObject:SetActive(false)
        end
    end)

    -----判断困难Boss是否需要上锁
    local hardBossId = self.CurLevelList[_id].levels[SummerControl.BossMode.Hard]   ---获取困难BossID
    local curHardBossData = StormControl.GetStormPointByID(hardBossId)
    if curHardBossData:CheckLock() then
        self.HardBossSuo().gameObject:SetActive(false)
        self.Btn_Hard_Mask().gameObject:SetActive(false)
    else
        self.HardBossSuo().gameObject:SetActive(true)
        self.Btn_Hard_Mask().gameObject:SetActive(true)
    end
end
---获取奖励物品
function M:GetRewards(_itemData)
    local arr = {}
    if _itemData.award ~= nil then
        ---首通奖励
        for i, v in pairs(_itemData.award) do
            local config = Global.GetLocalDataByGoods(v)
            local data = {}
            data.type = string.split(v, "_")[1]
            data.id = config.id
            data.config = config
            data.quality = config.quality
            data.isOnceAdopt = true
            data.count = tonumber(string.split(v, "_")[3])
            data.isRec = false
            data.idx = #arr + 1
            arr[#arr + 1] = data
        end
    end
    if _itemData.victory then
        ---固定奖励
        for i, v in pairs(_itemData.victory) do
            local config = Global.GetLocalDataByGoods(v)
            local vSelf = string.split(v, "_")
            local isGet = false
            for i3, v3 in pairs(arr) do
                if v3.type == vSelf[1] and v3.config.id == config.id and v3.isOnceAdopt == false then
                    arr[i3].count = arr[i3].count + tonumber(vSelf[3])
                    isGet = true
                    break
                end
            end
            if isGet ~= true then
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
        end
    end
    Global.Sort(arr, { "isOnceAdopt", "idx" }, { false, false })
    return arr
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
        if BattleManager.CurActivityBossPointInfo == nil or BattleManager.CurActivityBossPointInfo.levelPerfectCount < 5 then
            --MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("activityCcontrol_tips2"),5),1},true)
            return false
        end
    end

    return true
end

function M:RefreshCost()
    ---体力
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili .. "/" .. TiliMax
    MgrRes.LoadSprite(self.Img_Tiliicon(), "Item/Tilishuicon")
    self.Coin2().gameObject:SetActive(false)
    self.Btn_Add().gameObject:SetActive(true)
end

function M:RefreshBossCost()
    self.Coin2().gameObject:SetActive(true)
    self.Btn_Add().gameObject:SetActive(false)
    self.Btn_Add2().gameObject:SetActive(false)
    
    local tCurBossMode = SummerControl.GetBossMode()
    self.CurLevelList = SummerControl.GetCurChaptersData()
    local Img_Tiliicons = {
        [1] = self.Img_Tiliicon(),
        [2] = self.Img_Tiliicon2()
    }
    local Text_ResTilis = {
        [1] = self.Text_ResTili(),
        [2] = self.Text_ResTili2()
    }
    for i = 1, #self.CurLevelList do
        ---获取当前关卡ID
        local tCurLevel = self.CurLevelList[i].levels[tCurBossMode]
        ---获取当前关卡信息
        local tCurLevelData = StormControl.GetStormPointByID(tCurLevel)
        ---消耗
        local tCost = string.split(tCurLevelData.consume, "_")
        local tIcon = Global.GetLocalDataByGoods(tCurLevelData.consume).icon
        MgrRes.LoadSprite(Img_Tiliicons[i], "Item/" .. tIcon)
        Text_ResTilis[i].text = ItemControl.GetItemByIdAndType(tonumber(tCost[2]), tonumber(tCost[1])).count
    end

end

function M:AddEvent()
    Event.Add("SummerSelect", Handle(self, self.UpdataSelect))
end

function M:OnClose()
    Event.CheckClear("SummerSelect")
end

---刷新红点
function M:RefreshRedDot()
    ---任务红点
    self.MissionRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("SummerTask").State)
end

return M