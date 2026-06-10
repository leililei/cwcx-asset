-- Code Auto Create Begin
local M = Class('NewYueta_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewYueta_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewYueta_UI].prefab'
    self.Name = 'Form[NewYueta_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_guanqia','Btn_guanqia',2},{'Btn_jiandan','Btn_guanqia/Btn_jiandan',2},{'Btn_kunnan','Btn_guanqia/Btn_kunnan',2},{'Img_HardLock','Btn_guanqia/Btn_kunnan/Img_HardLock',2},{'Img_Suo','Btn_guanqia/Btn_kunnan/Img_HardLock/Img_Suo',2},{'Btn_chongzhi','Btn_guanqia/Btn_chongzhi',2},{'Btn_shop','Btn_shop',2},{'ICON_shop','Btn_shop/ICON_shop',2},{'bg_shop','Btn_shop/bg_shop',2},{'Btn_jiangli','Btn_jiangli',2},{'ICON_jiangli','Btn_jiangli/ICON_jiangli',2},{'bg_jiangli','Btn_jiangli/bg_jiangli',2},{'RewardRedDot','Btn_jiangli/RewardRedDot',2},{'Btn_TOP','Btn_TOP',2},{'ICON_paiming','Btn_TOP/ICON_paiming',2},{'bg_paiming','Btn_TOP/bg_paiming',2},{'Time_BG','Time_BG',2},{'Yueta_RewardPop','Yueta_RewardPop',2},{'Mask','Yueta_RewardPop/Mask',2},{'bg','Yueta_RewardPop/bg',2},{'Reward','Yueta_RewardPop/bg/Reward',2},{'Img_tiao','Yueta_RewardPop/bg/Reward/Img_tiao',2},{'Leijijifen','Yueta_RewardPop/Leijijifen',2},{'Content','Yueta_RewardPop/RewardScroll/Content',2},{'Btn_Lingqu','Yueta_RewardPop/Btn_Lingqu',2},{'Img_Lingqu','Yueta_RewardPop/Btn_Lingqu/Img_Lingqu',2},{'Img_Lingqu01','Yueta_RewardPop/Btn_Lingqu_hui/Img_Lingqu',2},
        -- Button 列表
        {'Btn_Lingqu01','Yueta_RewardPop/Btn_Lingqu',4},{'Btn_Lingqu_hui','Yueta_RewardPop/Btn_Lingqu_hui',4},
        -- UITemplate 列表
        {'TXRewardItem','Yueta_RewardPop/RewardScroll/TXRewardItem',10},
        -- RawImage 列表
        {'Btn_Lingqu_hui01','Yueta_RewardPop/Btn_Lingqu_hui',15},
        -- LoopScrollRect 列表
        {'RewardScroll','Yueta_RewardPop/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperLeftPanel/Text_TitleCn',20},{'Text_TitleEn','UpperLeftPanel/Text_TitleEn',20},{'Text_name','Btn_guanqia/Btn_jiandan/Text_name',20},{'Text_jindu','Btn_guanqia/Btn_jiandan/Text_jindu',20},{'Text_name2','Btn_guanqia/Btn_kunnan/Text_name2',20},{'Text_jindu2','Btn_guanqia/Btn_kunnan/Text_jindu2',20},{'Text_chongzhi','Btn_guanqia/Btn_chongzhi/Text_chongzhi',20},{'Text_shop','Btn_shop/bg_shop/Text_shop',20},{'Text_jiangli','Btn_jiangli/bg_jiangli/Text_jiangli',20},{'Text_jiangli01','Btn_TOP/bg_paiming/Text_jiangli',20},{'Remainder','Time_BG/Remainder',20},{'Text_Huodongjieshushijian','Time_BG/Text_Huodongjieshushijian',20},{'Text_Date','Time_BG/Text_Date',20},{'Text_Reward','Yueta_RewardPop/bg/Reward/Text_Reward',20},{'Text_Leijijifen','Yueta_RewardPop/Leijijifen/Text_Leijijifen',20},{'Text_Lingqu','Yueta_RewardPop/Btn_Lingqu/Img_Lingqu/Text_Lingqu',20},{'Text_Lingqu01','Yueta_RewardPop/Btn_Lingqu_hui/Img_Lingqu/Text_Lingqu',20},
    }
end
-- Code Auto Create End
require("LocalData/AbyssrewardLocalData")
function M:OnInit()
    self.EasyStageLimit = 0
    self.HardStageLimit = 0
    self.isFirstOpen = true
    self.IsHardOpen = false
    ---按钮
    self:InitButton()
    ---初始化排名滑块
    self:InitRankScroll()
    ---初始化奖励数据    
    self:InitRewardData()
    ---深渊挑战阶段
    self:InitTowerStage()
    ---帮助
    ActiveTutorialControl.ForcePopGuide(YueTaControl.GetYueTaInfo().group)
end

function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
--[[    ---刷新层数据
    local firstHard = StormViewModel.GetMonthTowerPointData(YueTaControl.GetYueTaInfo().chapterGroup,1)[3]
    if firstHard ~= nil and not firstHard.isEmpty and firstHard:CheckLock() then
        self.hard = 1
        self.Text_Diff().text = MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_10")
    end]]
    ---更新活动时间
    local activityData = ActivityControl.GetCurActivityByType(3)
    if next(activityData) then
        local e = activityData[1].endTime
        local endTimeStr = string.split(e,"-")
        local strEnd = endTimeStr[1].."/"..endTimeStr[2].."/"..endTimeStr[3].." "..endTimeStr[4] ..":"..endTimeStr[5]
        self.Text_Date().text = strEnd
        --local s = Global.GetTimeStamp(activityData[1].endTime) - Global.GetCurTime()
        --local day = math.floor(s/86400)
        --self.Remainder().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text110"),day)
        
        local tEndTime = Global.GetTimeByStr(activityData[1].endTime) 
        local serverTime = MgrNet.GetServerTime()
        local remainTime = tEndTime - serverTime

        if remainTime / (3600*24) >= 1 then
            ---剩余天数
            self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
        else
            ---剩余小时数
            local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
            self.Remainder().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
        end
    else
        self.Remainder().transform.parent.gameObject:SetActive(false)
    end
    ---播放bgm
    MgrSound.PlayBGM(YueTaControl.GetYueTaInfo().music,0.2)
    ---重置按钮显隐
    self.Btn_chongzhi().gameObject:SetActive(YueTaViewModel.GetServerData().innerTowerBuff~=nil)
end
function M:InitButton()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        ActiveTutorialControl.OpenGuide(YueTaControl.GetYueTaInfo().group)
    end))
    ---回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    ---简单模式
    UIEvent.LuaClick(self.Btn_jiandan().gameObject,function()
        YueTaControl.SetMode(YueTaControl.ModeType.EASY)
        YueTaControl.OpenUI()
    end)
    ---困难模式
    UIEvent.LuaClick(self.Btn_kunnan().gameObject,function()
        if self.IsHardOpen then
            if YueTaViewModel.GetServerData().innerTowerBuff == nil then
                YueTaControl.OpenBuffUI()
            else
                YueTaControl.SetMode(YueTaControl.ModeType.HARD)
                YueTaControl.OpenUI()
            end
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
        end
    end)
    ---商店
    UIEvent.LuaClick(self.Btn_shop().gameObject,function()
        MgrLink.LinkStart("tz_sc_114003_306")
    end)
    ---奖励信息
    UIEvent.LuaClick(self.Btn_jiangli().gameObject,Handle(self,self.OpenReward))
    ---关闭奖励
    UIEvent.LuaClick(self.Mask().gameObject,function()
        self.Yueta_RewardPop().gameObject:SetActive(false)
    end)
    ---排名信息
    UIEvent.LuaClick(self.Btn_TOP().gameObject,function()
        YueTaControl.OpenRank()
    end)
    ---困难模式重置
    UIEvent.LuaClick(self.Btn_chongzhi().gameObject,function()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_27"),function()
            YueTaViewModel.InnerTowerReset(function()
                self.Text_jindu2().text = "0/"..self.HardStageLimit
                self.Btn_chongzhi().gameObject:SetActive(false)
            end)
        end,nil,2},true)
    end)
    ---一键领取特性奖励
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
        YueTaViewModel.RecPointReward(self.CanReceiveList, function()
            self.RewardScroll():RefreshCells()
            self.RewardRedDot().gameObject:SetActive(false)
            self.Btn_Lingqu().gameObject:SetActive(false)
            self.Btn_Lingqu_hui().gameObject:SetActive(true)
            RedDotControl.GetDotData("YuetaReward"):SetState(false)
        end)
    end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
---返回按钮
function M:OnBackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
end
---返回大厅按钮
function M:OnBackHomeClick()
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end

function M:InitRankScroll()
    self.RewardScroll():SetLuaCellEvent(Handle(self,self.RankRewardItem))
end

function M:RankRewardItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.RankRewardInfo[idx]})
end

function M:InitRewardData()
    ---奖励显示
    self.RankRewardInfo = AbyssrewardLocalData.tab
    Global.Sort(self.RankRewardInfo,{"score"})
    self.RewardScroll().totalCount = #self.RankRewardInfo
    
    ---检测是否能够领取奖励
    local TopScore = YueTaViewModel.GetServerData().innerTopScore
    local RecRewardList = YueTaViewModel.GetServerData().innerClaimedReward
    self.CanReceiveList = {}
    for i, v in ipairs(self.RankRewardInfo) do
        if TopScore >= v.score then
            if (RecRewardList and not Global.Contains(RecRewardList,v.id)) or RecRewardList == nil then
               table.insert(self.CanReceiveList, v.id)
            end
        else
            break
        end
    end
    if #self.CanReceiveList > 0 then
        self.Btn_Lingqu().gameObject:SetActive(true)
        self.Btn_Lingqu_hui().gameObject:SetActive(false)
        self.RewardRedDot().gameObject:SetActive(true)
    else
        self.Btn_Lingqu().gameObject:SetActive(false)
        self.Btn_Lingqu_hui().gameObject:SetActive(true)
        self.RewardRedDot().gameObject:SetActive(false)
    end
    ---当前最高通關特性等級：%s
    self.Text_Leijijifen().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_29"),TopScore)
end
---深渊挑战阶段
function M:InitTowerStage()
    local EasyTowerList = StormViewModel.GetMonthTowerPointData(YueTaControl.GetYueTaInfo().chapterGroup,0)
    local HardTowerList = StormViewModel.GetMonthTowerPointData(YueTaControl.GetYueTaInfo().chapterGroup,1)
    local EasyTowerStage = self:GetCurTowerStage(EasyTowerList,YueTaViewModel.GetServerData().curLevel)
    local HardTowerStage = self:GetCurTowerStage(HardTowerList,YueTaViewModel.GetServerData().innerCurLevel)
    self.EasyStageLimit = #EasyTowerList-5
    self.HardStageLimit = #HardTowerList-5
    
    self.Text_jindu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_28"),EasyTowerStage,self.EasyStageLimit)
    self.Text_jindu2().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_28"),HardTowerStage,self.HardStageLimit)

    for i, v in ipairs(HardTowerList) do
        if not v.isEmpty then
            self.IsHardOpen = v:CheckLock()
            break
        end
    end
    self.Img_HardLock().gameObject:SetActive(not self.IsHardOpen)
end

function M:GetCurTowerStage(_towerList,_curLevel)
    local tStage = 0
    local idx = 0
    for i, v in ipairs(_towerList) do
        if v.isEmpty then
            idx = idx+1
        elseif v.id == _curLevel then
            tStage = i-idx
            break
        end
    end
    
    return tStage
end

function M:OpenReward()
    self.Yueta_RewardPop().gameObject:SetActive(true)
    if self.isFirstOpen then
        self.RewardScroll():RefillCells()
        self.isFirstOpen = false
    end
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
return M