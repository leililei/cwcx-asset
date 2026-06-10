-- Code Auto Create Begin
local M = Class('WorldBoss_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WorldBoss_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WorldBoss_UI].prefab'
    self.Name = 'Form[WorldBoss_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Ani/Img_BG',2},{'mask_Left','Ani/Img_BG/mask_Left',2},{'zhuangshixian','Ani/Panel_Left/zhuangshixian',2},{'Img_Yuanzuimingdi1','Ani/Panel_Left/Img_Yuanzuimingdi1',2},{'Img_Chakandi1','Ani/Panel_Left/Img_Yuanzuimingdi1/Text_BossName/Img_Chakandi1',2},{'Img_Chakanicon1','Ani/Panel_Left/Img_Yuanzuimingdi1/Text_BossName/Img_Chakandi1/Img_Chakanicon1',2},{'Img_Biaotidi','Ani/Panel_Left/Img_Biaotidi',2},{'Time','Ani/Panel_Left/Time',2},{'Zuigaozongfen','Ani/Panel_Left/Zuigaozongfen',2},{'Img_Fengexian','Ani/Panel_Left/Img_Fengexian',2},{'Btn_Rank','Ani/Panel_Left/Btn_Rank',2},{'Btn_Reward','Ani/Panel_Left/Btn_Reward',2},{'RedDotIcon','Ani/Panel_Left/Btn_Reward/RedDotIcon',2},{'Btn_Shop','Ani/Panel_Left/Btn_Shop',2},{'RedDotIcon_Shop','Ani/Panel_Left/Btn_Shop/RedDotIcon_Shop',2},{'Panel_Right','Ani/Panel_Right',2},{'Img_Simulation','Ani/Panel_Right/Btn_Simulation/Img_Simulation',2},{'Btn_Challenge','Ani/Panel_Right/Btn_Challenge',2},{'Img_Challenge','Ani/Panel_Right/Btn_Challenge/Img_Challenge',2},{'Img_ChallengeCoutBG','Ani/Panel_Right/Btn_Challenge/Img_ChallengeCoutBG',2},{'Btn_Challenge2','Ani/Panel_Right/Btn_Challenge2',2},{'Img_Challenge2','Ani/Panel_Right/Btn_Challenge2/Img_Challenge2',2},{'Cishutiao','Ani/Panel_Right/Cishutiao',2},{'Img_Tiao1','Ani/Panel_Right/Cishutiao/Img_Tiao1',2},{'Img_Tiao_H1','Ani/Panel_Right/Cishutiao/Img_Tiao1/Img_Tiao_H1',2},{'Img_Tiao2','Ani/Panel_Right/Cishutiao/Img_Tiao2',2},{'Img_Tiao_H2','Ani/Panel_Right/Cishutiao/Img_Tiao2/Img_Tiao_H2',2},{'Img_Tiao3','Ani/Panel_Right/Cishutiao/Img_Tiao3',2},{'Img_Tiao_H3','Ani/Panel_Right/Cishutiao/Img_Tiao3/Img_Tiao_H3',2},{'Img_Xian1','Ani/Panel_Right/Img_Xian1',2},{'Img_Liebiaodi','Ani/Panel_Right/paiming/Img_Liebiaodi',2},{'Img_xian','Ani/Panel_Right/paiming/Img_xian',2},{'ReturnBg','Ani/UpperLeftPanel/ReturnBg',2},{'Btn_GoMenu','Ani/UpperLeftPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/UpperLeftPanel/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','Ani/UpperLeftPanel/Btn_I',2},{'RewardPop','Ani/RewardPop',2},{'Mask','Ani/RewardPop/Mask',2},{'bg','Ani/RewardPop/bg',2},{'Reward','Ani/RewardPop/bg/Reward',2},{'Img_tiao','Ani/RewardPop/bg/Reward/Img_tiao',2},{'Leijijifen','Ani/RewardPop/Leijijifen',2},{'Content','Ani/RewardPop/RewardScroll/Content',2},{'Btn_Lingqu','Ani/RewardPop/Btn_Lingqu/Btn_Lingqu',2},{'Btn_Lingqu01','Ani/RewardPop/Btn_Lingqu_hui/Btn_Lingqu',2},
        -- Button 列表
        {'Btn_ShowBoss','Ani/Panel_Left/Img_Yuanzuimingdi1/Text_BossName/Btn_ShowBoss',4},{'Btn_Simulation','Ani/Panel_Right/Btn_Simulation',4},{'Btn_Lingqu02','Ani/RewardPop/Btn_Lingqu',4},{'Btn_Lingqu_hui','Ani/RewardPop/Btn_Lingqu_hui',4},
        -- UITemplate 列表
        {'WorldBossRankItem','Ani/Panel_Right/paiming/WorldRankScroll/WorldBossRankItem',10},{'WorldBossRankOne','Ani/Panel_Right/paiming/WorldBossRankOne',10},{'WBRewardItem1','Ani/RewardPop/RewardScroll/WBRewardItem1',10},
        -- RawImage 列表
        {'Btn_ShowBoss01','Ani/Panel_Left/Img_Yuanzuimingdi1/Text_BossName/Btn_ShowBoss',15},{'Btn_Simulation01','Ani/Panel_Right/Btn_Simulation',15},{'WorldRankScroll','Ani/Panel_Right/paiming/WorldRankScroll',15},{'Btn_Lingqu03','Ani/RewardPop/Btn_Lingqu',15},{'Btn_Lingqu_hui01','Ani/RewardPop/Btn_Lingqu_hui',15},
        -- LoopScrollRect 列表
        {'WorldRankScroll01','Ani/Panel_Right/paiming/WorldRankScroll',18},{'RewardScroll','Ani/RewardPop/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_BossName','Ani/Panel_Left/Img_Yuanzuimingdi1/Text_BossName',20},{'Text_Taofamubiao','Ani/Panel_Left/Img_Biaotidi/Text_Taofamubiao',20},{'Text_CrusadeTarget','Ani/Panel_Left/Img_Biaotidi/Text_CrusadeTarget ',20},{'Text_Time','Ani/Panel_Left/Time/Text_Time',20},{'Text_Zuigaozongfen','Ani/Panel_Left/Zuigaozongfen/Text_Zuigaozongfen',20},{'Text_Fen','Ani/Panel_Left/Zuigaozongfen/Text_Fen',20},{'Text_diyici','Ani/Panel_Left/Text_diyici',20},{'Text_fen','Ani/Panel_Left/Text_diyici/Text_fen',20},{'Text_dierci','Ani/Panel_Left/Text_dierci',20},{'Text_fen01','Ani/Panel_Left/Text_dierci/Text_fen',20},{'Text_disanci','Ani/Panel_Left/Text_disanci',20},{'Text_fen02','Ani/Panel_Left/Text_disanci/Text_fen',20},{'Text_jinri','Ani/Panel_Left/Text_jinri',20},{'Text_fen03','Ani/Panel_Left/Text_jinri/Text_fen',20},{'Text_Paiming','Ani/Panel_Left/Btn_Rank/Text_Paiming',20},{'Text_Reward','Ani/Panel_Left/Btn_Reward/Text_Reward',20},{'Text_Shop','Ani/Panel_Left/Btn_Shop/Text_Shop',20},{'Text_Simulation','Ani/Panel_Right/Btn_Simulation/Text_Simulation',20},{'Text_Challenge','Ani/Panel_Right/Btn_Challenge/Text_Challenge',20},{'Text_Cishu','Ani/Panel_Right/Btn_Challenge/Img_ChallengeCoutBG/Text_Cishu',20},{'Text_ChallengeCout','Ani/Panel_Right/Btn_Challenge/Img_ChallengeCoutBG/Text_ChallengeCout',20},{'Text_Challenge2','Ani/Panel_Right/Btn_Challenge2/Text_Challenge2',20},{'Text_Xiaohaotili','Ani/Panel_Right/Text_Xiaohaotili',20},{'Text_RankListTips','Ani/Panel_Right/paiming/Text_RankListTips',20},{'Text_Weishangbang','Ani/Panel_Right/paiming/Text_Weishangbang',20},{'Text_RankTips','Ani/Panel_Right/paiming/Text_RankTips',20},{'Text_Title','Ani/UpperLeftPanel/Text_Title',20},{'Text_TitleEn','Ani/UpperLeftPanel/Text_TitleEn',20},{'Text_Reward01','Ani/RewardPop/bg/Reward/Text_Reward',20},{'Text_Leijijifen','Ani/RewardPop/Leijijifen/Text_Leijijifen',20},{'Text_Lingqu','Ani/RewardPop/Btn_Lingqu/Btn_Lingqu/Text_Lingqu',20},{'Text_Lingqu01','Ani/RewardPop/Btn_Lingqu_hui/Btn_Lingqu/Text_Lingqu',20},
    }
end
-- Code Auto Create End
require("LocalData/JcscorerewardLocalData")
---世界boss页初始化
function M:OnInit()
    --RedDotControl.GetDotData("WorldBoss"):SetState(false)--打开过界面就关闭联合讨伐红点
    self.RewardPop().gameObject:SetActive(false)
    ---清空活动Boss血量
    BattleManager.CurActivityBossHp = 0
    ---退出点击
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackToFirst()
    end)
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(97)
    end))
    ---获取榜首
    self.wBRanOne = self.WorldBossRankOne()
    self.wBRanOne.gameObject:SetActive(false)
    ---注册排名滑块
    self.WorldRankScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---跳转世界boss战斗界面
    local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
    if not Global.isMiddleTime(data.beginTime,data.battleEndTime) then
        self.Btn_Challenge().gameObject:SetActive(false)
        self.Btn_Challenge2().gameObject:SetActive(true)
    else
        self.Btn_Challenge().gameObject:SetActive(true)
        self.Btn_Challenge2().gameObject:SetActive(false)
        UIEvent.LuaClick(self.Btn_Challenge().gameObject,function()
            local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
            if data == nil or not Global.isMiddleTime(data.beginTime,data.battleEndTime) then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),1},true)
                return
            end
            if TaskControl.CheckLHTFVigor() <=  ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).count then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("worldboss_ui_tips8"),1},true)
                return
            end
            BattleManager.GameMode = BattleManager.GameModeType.WorldBoss
            MgrUI.Pop(UID.WorldBossAnaPop_UI,{},true)
        end)
    end

    ---跳转boss详情页
    --[[UIEvent.LuaClick(self.Btn_ShowBoss().gameObject,function()
        MgrUI.Pop(UID.BossInfoPop_UI,{StormViewModel.GetWorldBossData(StormViewModel.CurStormBossId)},true)
    end)]]
    ---跳转模拟页
    UIEvent.LuaClick(self.Btn_Simulation().gameObject,function()
        ---判断活动是否还开着
        local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
        if data == nil or not Global.isMiddleTime(data.beginTime,data.endTime) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"),1},true)
            return
        end
        BattleManager.GameMode = BattleManager.GameModeType.AniWorldBoss
        MgrUI.Pop(UID.WorldBossAnaPop_UI,{},true)
    end)
    ---跳转排名
    UIEvent.LuaClick(self.Btn_Rank().gameObject,function()
        MgrUI.Pop(UID.WorldBossRankPop_UI,{ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)},true)
    end)
    ---商店
    UIEvent.LuaClick(self.Btn_Shop().gameObject,function()
        MgrLink.LinkStart("tz_sc_lhtf_01")
    end)
    self.RedDotIcon_Shop().gameObject:SetActive(false)--商店红点不显示
    ---查看积分奖励
    UIEvent.LuaClick(self.Btn_Reward().gameObject,function()
        self:FreshReward()
        self.RewardPop().gameObject:SetActive(true)
        self.RewardScroll():RefillCells()
    end)
    UIEvent.LuaClick(self.Mask().gameObject,function()
        self.RewardPop().gameObject:SetActive(false)
    end)
    ---查看角色信息
    UIEvent.LuaClick(self.Btn_ShowBoss().gameObject,function()
        MgrUI.Pop(UID.BossXiangqing_UI,{EventRaidControl.GetLIANHETAOFAData().BossData[1].BossData},true)
    end)
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
        ActivityControl.RewardSendReq(ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.LIANHETAOFA).activityId,0,2,function()
            self:FreshReward()
            self:RewardRedDot()
        end)
    end)
end

function M:OnBackKey()
    if self.RewardPop().gameObject.activeSelf then
        self.RewardPop().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        self:OnBackClick()
    end
end

function  M:OnShowFinish()
    --NoviceViewModel.CheckFirstGuide(154)
    ---弹出奖励弹窗
    if ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).LHTFGoods ~= nil then
        MgrUI.Pop(UID.ItemAchievePop_UI,{ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).LHTFGoods},true)
        ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).LHTFGoods = nil
    end
end

---世界boss页刷新
function M:OnUpdateUI()
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113020][2],0.2)
    ---初始化界面通用属性
    self:UpdateCommon()
    StormViewModel.LHTFRewardFunc()
    self:RewardRedDot()
end
function M:UpdateCommon()
    local data = ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId)
    ---检查排名
    if StormViewModel.CheckRankCount() < 1 then
        ---无排名隐藏榜首并打开提示
        self.Text_RankTips().gameObject:SetActive(true)
        self.wBRanOne.gameObject:SetActive(false)
        self.Text_Weishangbang().gameObject:SetActive(true)
    else
        ---否则显示榜首并关闭提示
        self.Text_RankTips().gameObject:SetActive(false)
        self.wBRanOne.gameObject:SetActive(true)
        self.Text_Weishangbang().gameObject:SetActive(false)
    end
    ---更新背景图
    MgrRes.LoadSprite(self.Img_BG(),"Preview/"..EventRaidControl.GetLIANHETAOFAData().BossData[1].thumbnail_map)
    ---获取领取剩余时间配置
    local serverTime = MgrNet.GetServerTime()
    local t = 0
    local text = ""
    local timeTxt = ""
    local timeTxt2 = ""
    if data.battleUnlockEndTime ~= 0 then
        t = TimeControl.GetTimeTable(data.battleUnlockEndTime)
        text = MgrLanguageData.GetLanguageByKey("ui_taofazhan_text1")
    end
    if t.endTime < MgrNet.GetServerTime() then  --战斗结束时间已过
        t = TimeControl.GetTimeTable(data.unlockTime)
        text = MgrLanguageData.GetLanguageByKey("ui_taofazhan_text2")
    end
    local txt = string.split(Global.TimeToDate(t.endTime),"-")
    timeTxt = string.format(" %s/%s/%s %s:%s ",txt[1],txt[2],txt[3],txt[4],txt[5])
    timeTxt2 = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").. math.modf((t.endTime - serverTime)/(3600*24)) .."</color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
    self.offsetTime = t.endTime - serverTime
    ---判断是否在开启时间内
    if data:CheckUnlock() then
        ---播放倒计时
        if self.offsetTime > 0 then
            self.Text_Time().text = text .. timeTxt .. timeTxt2
        else
            self.Text_Time().text = MgrLanguageData.GetLanguageByKey("worldboss_ui_tips1")
        end
    else
        ---开启时间外显示距离开启时间
        if data.getReward == 0 then
            ---未领取奖励
            self.Text_Time().text = MgrLanguageData.GetLanguageByKey("worldboss_ui_tips5")
        else
            ---已领取奖励
            ---距离开启时间时间
            self.offsetTime = 0
                local timeStr = string.split(data.beginTime,"-")
                self.offsetTime = tonumber(os.time({year=timeStr[1], month = timeStr[2], day = timeStr[3], hour = timeStr[4], min = timeStr[5], sec = timeStr[6]})) - (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600 - tonumber(serverTime)
            ---播放倒计时
            if self.offsetTime > 0 then
                local h = math.floor(self.offsetTime / 3600)
                local m = math.floor((self.offsetTime - h * 3600) / 60)
                self.Text_Time().text = string.format(MgrLanguageData.GetLanguageByKey("worldboss_ui_tips6"),h,m)
                --self.Text_Time().text = MgrLanguageData.GetLanguageByKey("worldboss_ui_tips5")
                MgrTimer.AddRepeat("WBDownTime",60,function()
                    if self.offsetTime > 0 then
                        self.offsetTime = self.offsetTime - 60
                        local _h = math.floor(self.offsetTime / 3600)
                        local _m = math.floor((self.offsetTime - _h * 3600) / 60)
                        self.Text_Time().text = string.format(MgrLanguageData.GetLanguageByKey("worldboss_ui_tips6"),_h,_m)
                    else
                        self.Text_Time().text = MgrLanguageData.GetLanguageByKey("worldboss_ui_tips7")
                        ---倒计时结束销毁倒计时
                        MgrTimer.Cancel("WBDownTime")
                    end
                end,-1,nil)
            end
        end
    end
    ---更新boss名称
    self.Text_BossName().text = EventRaidControl.GetLIANHETAOFAData().BossData[1].BossData.name
    ---分数显示
    --最高分
    self.Text_Fen().text = (StormViewModel.SelfRankInfo.rank == -1 and "-" or StormViewModel.SelfRankInfo.score)
    --三次挑战分
    local score = {}
    if StormViewModel.SelfRankInfo.array then
        for i,v in pairs(StormViewModel.SelfRankInfo.array) do
            score[v.index] = v.score
        end
    end
    self.Text_fen().text = StormViewModel.SelfRankInfo.count < 1 and "-" or score[1]
    self.Text_fen01().text = StormViewModel.SelfRankInfo.count < 2 and "-" or score[2]
    self.Text_fen02().text = StormViewModel.SelfRankInfo.count < 3 and "-" or score[3]
    --今日总分
    self.Text_fen03().text = (StormViewModel.SelfRankInfo.rank == -1 or StormViewModel.SelfRankInfo.count < 1) and "-" or StormViewModel.SelfRankInfo.todayScore
    ---消耗体力显示
    local vi = TaskControl.CheckTodayVigorExpend()
    local limit = tonumber(SteamLocalData.tab[109000][2]) * 100
    self.Text_Xiaohaotili().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text125"),tostring(vi > limit and limit or vi),tostring(limit))
    ---更新挑战次数
    self.Text_ChallengeCout().text = TaskControl.CheckLHTFVigor() - data.count
    ---刷新红点状态
    WorldBossViewModel.RefreshRedPoint(data.count)
    ---世界Boss红点
    RedDotControl.GetDotData("WorldBoss"):SetState(WorldBossViewModel.CheckRedPoint())
    ---挑战次数黄条
    local Img_Tiao_H = {
        self.Img_Tiao_H1().gameObject,
        self.Img_Tiao_H2().gameObject,
        self.Img_Tiao_H3().gameObject
    }
    for i = 1, 3 do
        if i <= TaskControl.CheckLHTFVigor() then
            Img_Tiao_H[i]:SetActive(true)
        else
            Img_Tiao_H[i]:SetActive(false)
        end
    end
    ---刷新滑块
    self:ReloadRankView(true)

    ---判断是不是在战斗时间内,关闭相应按钮
    local tData = EventRaidControl.GetLIANHETAOFAData()
    if tData then
        if not Global.isMiddleTime(tData.beginTime,tData.battleEndTime) then
            self.Btn_Simulation().gameObject:SetActive(false)
            self.Btn_Challenge().gameObject:SetActive(false)
            self.Text_Xiaohaotili().gameObject:SetActive(false)
            self.Cishutiao().gameObject:SetActive(false)
        end
    end
end
---排名滑块回调
function M:CellItem(trans,idx)
    ---刷新item
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self})
end
---排名滑块刷新
function M:ReloadRankView(isOnce)
    ---刷新滑块
    local scroll = self.WorldRankScroll01()
    self.pointList = StormViewModel.GetWorldBossRank(1)
    scroll.totalCount = #self.pointList
    if isOnce then
        ---首次全刷新,若玩家有排名则刷新到玩家位置
        scroll:RefillCells()
    else
        ---之后不变位置刷新
        scroll:RefreshCells()
    end
    ---自己的世界Boss排名
    local selfData = StormViewModel.SelfRankInfo
    if selfData.rank == -1 then
        self.wBRanOne.gameObject:SetActive(false)
    else
        self.wBRanOne:SetData({selfData,self})
    end
end
function M:RewardRedDot()
    self.RedDotIcon().gameObject:SetActive(WorldBossViewModel.CheckLHTFReward())
end
function M:FreshReward()
    self.GotReward = RapidJson.decode(ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.LIANHETAOFA).reward)
    self.Text_Leijijifen().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text82") .." : ".. StormViewModel.SelfRankInfo.totalScore
    self.rewardList = JcscorerewardLocalData.tab
    self:InitRewardScroll()
    ---奖励领完加个灰按钮
    self:ButtonOnAndOff()
    ---对rewardList进行排序
    if self.GotReward ~= nil then
        local listStart = {}
        local listEnd = {}
        for i = 1, #JcscorerewardLocalData.tab do
            if self.GotReward[tostring(i)] ~= nil then
                ---已获得的奖励排到末尾
                table.insert(listEnd,self.rewardList[i])
            else
                table.insert(listStart,self.rewardList[i])
            end
        end
        self.rewardList = listStart
        for _,v in ipairs(listEnd) do
            table.insert(self.rewardList,v)
        end
    end
    self.RewardScroll().totalCount = #self.rewardList
    self.RewardScroll():RefillCells()
    --if self.GotReward == nil then
    --    self.Btn_Lingqu().gameObject:SetActive(true)
    --    self.Btn_Lingqu_hui().gameObject:SetActive(false)
    --else
    --    self.Btn_Lingqu().gameObject:SetActive(self.GotReward[tostring(#self.rewardList)] == nil)
    --    self.Btn_Lingqu_hui().gameObject:SetActive(self.GotReward[tostring(#self.rewardList)] ~= nil)
    --end
end
function M:ButtonOnAndOff()
    local level = 0
    for i,v in ipairs(self.rewardList) do
        if StormViewModel.SelfRankInfo.totalScore < v.score then
            level = v.id - 1    --当前最大可领层数
            break
        end
        ---达到最大可领状态
        if i == #self.rewardList and StormViewModel.SelfRankInfo.totalScore >= self.rewardList[i].score and (self.GotReward == nil or self.GotReward[tostring(i)] == nil) then
            level = v.id
        end
    end
    if level == 0 then  --一档都没到或全部拿完
        self.Btn_Lingqu().gameObject:SetActive(false)
        self.Btn_Lingqu_hui().gameObject:SetActive(true)
    elseif self.GotReward == nil or self.GotReward[tostring(level)] == nil then --有没领的
        self.Btn_Lingqu().gameObject:SetActive(true)
        self.Btn_Lingqu_hui().gameObject:SetActive(false)
    else
        self.Btn_Lingqu().gameObject:SetActive(false)
        self.Btn_Lingqu_hui().gameObject:SetActive(true)
    end
end
function M:InitRewardScroll()
    ---注册排名滑块
    self.RewardScroll():SetLuaCellEvent(Handle(self,self.RewardCellItem))
end
function M:RewardCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.rewardList[idx],self.GotReward ~= nil and self.GotReward[tostring(self.rewardList[idx].id)] or nil,self})
end
---销毁回调
function M:OnClose()
    ---销毁倒计时
    MgrTimer.Cancel("WBDownTime")
    ---清除排行数据
    --ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId):ClearRanks()
    BattleViewModel.LHTFReward = {}
end
---返回按钮
function M:OnBackClick()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
---返回大厅按钮
--function M:OnBackHomeClick()
--    MgrUI.GoBackTo(UID.Home_UI)
--end
return M