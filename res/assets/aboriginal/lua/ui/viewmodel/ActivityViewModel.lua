require("LocalData/RecruitactivityLocalData")
require("LocalData/StoryactivityLocalData")
ActivityViewModel = {}

---活动的参数
local ActivityParameters = nil
---Boss难度
local ActivityBossHardness = 1

---设置Boss难度
function ActivityViewModel.SetBossHardness(hardness)
    ActivityBossHardness = hardness
end

---设置剧情活动参数
function ActivityViewModel.SetParameters(paras)
    ActivityParameters = paras
end
---获得剧情活动参数
function ActivityViewModel.GetParameters()
    return ActivityParameters
end
---进入剧情活动
function ActivityViewModel.EnterStoryActivity()

end
---获取活动节点数据
function ActivityViewModel.GetStoryPointData()

end

---获取新手活动数据
function ActivityViewModel.GetNoviceActivityData()

end

---检查剧情关卡
function ActivityViewModel.CheckPointState()
    ---检查战前剧情
    if StormViewModel.CurPointState < StormViewModel.PointState.firstPlot then
        StormViewModel.CurPointState = StormViewModel.PointState.firstPlot
        ---跳转到剧情
        if StormViewModel.CurPointData.plot_f ~= nil and StormViewModel.CurPointData.plot_f ~= "0" then
            PlotViewModel.OpenPlotUI(StormViewModel.CurPointData.plot_f,StormViewModel.PlotEndOpen,true,true)
        else
            StormViewModel.CheckPointState()
        end
    ---战斗阶段
    elseif StormViewModel.CurPointState < StormViewModel.PointState.fight then
        StormViewModel.CurPointState = StormViewModel.PointState.fight
        ---设置关卡未通关
        BattleRoleData.Bool_Pass = false
        ---跳转到战斗
        if StormViewModel.CurPointData.battleMap ~= nil and StormViewModel.CurPointData.battleMap ~= "0" then
            MgrBattle.GoFight(MgrBattle.fightType.normal,nil,StormViewModel.CurPointData.battleMap)
        else
            StormViewModel.CheckPointState()
        end
    ---战后剧情阶段
    elseif StormViewModel.CurPointState < StormViewModel.PointState.lastPlot then
        StormViewModel.CurPointState = StormViewModel.PointState.lastPlot
        ---跳转到剧情
        if StormViewModel.CurPointData.plot_l ~= nil and StormViewModel.CurPointData.plot_l ~= "0" then
            if MgrUI.GetCurUI().Uid ~= UID.Battle02_UI then
                if BattleRoleData.Bool_Pass == true then
                    ---通关战斗再播放战后剧情
                    --BattleManager.ClearLuaData()
                    PlotViewModel.OpenPlotUI(StormViewModel.CurPointData.plot_l,StormViewModel.PlotEndOpen,true,true)
                else
                    ---未通关直接进入结算
                    StormViewModel.CheckPointState()
                end
            end
        else
            StormViewModel.CheckPointState()
        end
    ---结算阶段
    elseif StormViewModel.CurPointState < StormViewModel.PointState.finish then
        StormViewModel.CurPointState = StormViewModel.PointState.wait
        if StormViewModel.CurPointType == StormViewModel.PointType.tower then

            ---挑战红巨结算
            if BattleViewModel.TowerReward == nil then
                MgrBattle.CloseFight()
            else
                ---显示奖励弹窗
                MgrUI.Pop(UID.ItemAchievePop_UI,{BattleViewModel.TowerReward,function()
                    MgrBattle.CloseFight()
                end},true)
            end
        elseif StormViewModel.CurPointType == StormViewModel.PointType.guide then
            ---战术指导结算
            if BattleRoleData.Bool_Pass == true then
                ---战术指导加载教学弹窗
                MgrUI.Pop(UID.NoviceFrame_UI,{StormViewModel.CurPointData.teach_l,nil,function()
                    ---重置当前关卡进度
                    StormViewModel.CurPointState = StormViewModel.PointState.wait
                    if BattleViewModel.GuideTab.reward == nil then
                        ---无奖励直接返回
                        MgrTimer.AddDelayNoName(1,function()
                            MgrBattle.CloseFight()
                        end)
                    else
                        ---显示奖励弹窗
                        MgrUI.Pop(UID.ItemAchievePop_UI,{BattleViewModel.GuideTab.reward,function()
                            ---无奖励直接返回
                            MgrTimer.AddDelayNoName(1,function()
                                MgrBattle.CloseFight()
                            end)
                        end},true)
                    end
                end},true)
            else
                ---战斗失败直接返回
                MgrTimer.AddDelayNoName(1,function()
                    MgrBattle.CloseFight()
                end)
            end
        else
            ---纯剧情关卡直接通关
            if StormViewModel.CurPointData.battleMap == "0" then
                if  StormViewModel.CurPointData.star > 0 then
                    MgrBattle.CloseFight()
                    return
                end
                local ClientSetLevelStarREQ = {
                    levelID = StormViewModel.CurPointData.id,
                    teamID = 0,
                    heroID = {},
                }
                ---组装数据
                local bytes = assert(pb.encode('PBClient.ClientSetLevelStarREQ',ClientSetLevelStarREQ))
                print("发送签到"..pb.tohex(bytes))
                local thisACK = function(buffer,tag)
                    print("回放ACK")
                    local tab = assert(pb.decode('PBClient.ClientSetLevelStarACK',buffer))
                    tab.levelStar = 7
                    if tab.errNo ~= 0 then
                        UnityEngine.Debug.LogError(tab.errNo)
                        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
                            MgrSdk.BackToLogin()
                        end},true)
                    end
                end
                local thisNTF = function(buffer,tag)
                    local tab = assert(pb.decode('PBClient.ClientSetLevelStarNTF',buffer))
                    tab.levelStar = 7
                    ---更新数据统计
                    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
                    ---获取关卡数据
                    local pointData = StormControl.GetStormPointByID(tab.levelID)
                    ---@type LevelInfo 更新关卡数据
                    local levelInfo = {
                        levelStar = tab.levelStar > pointData.star and tab.levelStar or pointData.star,
                        levelCount = pointData.count + 1,
                    }
                    pointData:PushData(levelInfo)
                    ---获取玩家数据
                    local player = PlayerControl.GetPlayerData()
                    ---检查是否升级
                    PlayerControl.CheckLevelUp(tab.userLevel)
                    ---更新体力
                    player:PushVigor(tab.vigor)
                    ---结算扣除
                    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
                    ---更新物品奖励
                    ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
                    ---更新玩家经验
                    player:PushExp(tab.userExp)
                    ---更新玩家等级
                    player:PushLevel(tab.userLevel)
                    if tab.reward ~= nil then
                        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward , function()
                            if MgrUI.GetCurUI().Uid ~= UID.Battle02_UI then
                                MgrBattle.CloseFight()
                            end
                        end},true)
                    else
                        if MgrUI.GetCurUI().Uid ~= UID.Battle02_UI then
                            MgrBattle.CloseFight()
                        end
                    end
                    BattleViewModel.NormalRewardTab = nil
                    BattleViewModel.NormalRewardTab = tab

                end
                MgrNet.SendReq(MID.CLIENT_SET_LEVEL_STAR_REQ,bytes,0,nil,thisACK,thisNTF)

            end
            if BattleViewModel.NormalRewardTab ~= nil and StormViewModel.CurPointData.battleMap ~= "0" then
                ---显示结算
                local offsetExp = BattleViewModel.NormalRewardTab.userExp - BattleViewModel.playerExp
                local offsetExpList = {}
                if BattleViewModel.NormalRewardTab.heroInfos ~= nil then
                    for i, v in pairs(BattleViewModel.NormalRewardTab.heroInfos) do
                        local heroData = HeroControl.GetRoleDataByID(v.heroID)
                        offsetExpList[i] = {}
                        offsetExpList[i].data = heroData
                        offsetExpList[i].offset = v.heroExp - heroData.exp
                    end
                end
                MgrUI.Pop(UID.PVEComplete_UI,{BattleViewModel.NormalRewardTab,offsetExp,offsetExpList},true)
            end
        end
    end
end


---检查活动红点
function ActivityViewModel.CheckRedDot()
    ---夏活红点
    SummerControl.CheckAllRedPoint()
    ---世界Boss红点
    RedDotControl.GetDotData("WorldBoss"):SetState(WorldBossViewModel.CheckRedPoint())
    ---剧情红点
    ActivityViewModel.CheckPlotRedDot()
    ---战术指导红点
    TaskControl.CheckGuide()
    ---基金红点
    FundControl.RefreshRedPoint()
    ---月冕
    HaiYueControl.CheckTaskRedPoint()
    ---月塔
    YueTaControl.CheckRedPoint()
    ---累计充值
    ActivityControl.CheckRechargeRedDot()
    ---限时充值
    ActivityControl.CheckMonthlyRechargeRedDot()
    ---七月预热红点检测
    Event4Control.CheckRedDot()
    ---检测七月活动所有红点
    Event4Control.CheckAllRedDot()
    ---检测限时签到红点
    LimitSignControl.CheckLimitSignRedDot()
    ---预热红点
    SummerControl.CheckPreheatRedDot()
    ---半周年任务红点
    HalfAnniControl.CheckAllRedPoint()
    ---生日活动
    CakeControl.CheckDot()
    ---章节任务红点
    ActivityControl.CheckChapterTaskDot()
    ---武道会任务红点
    BuDoukaiControl.CheckTaskRedPoint()
    --体力活动检测红点
    ActivityControl.CheckPowerRedDot()
    ---累销活动红点
    CumulativeSalesViewModel.RefreshAllRedDots()
    ---Bingo活动红点
    BingoViewModel.RefreshAllRedDots()
end

---检查活动剧情红点
function ActivityViewModel.CheckPlotRedDot()
    RedDotControl.GetDotData("ActivityPlot"):SetState(false)
    local arr = {}
    for k,v in pairs(StormControl.GetStormScrollById(900000).points) do
        table.insert(arr,StormControl.GetStormPointByID(v))
    end

    RedDotControl.GetDotData("ActivityPlot"):SetState(false)
    for i = 1,#arr do
        if arr[i]:CheckLock() and arr[i].count == 0 then --and UnityEngine.PlayerPrefs.GetInt(PlayerControl.GetPlayerData().UID.."ActivityPlot"..i) == 0
            local data = arr[i]
            local item = ItemControl.GetItemByIdAndType(tonumber(string.split(data.activitypreview2,"_")[2]),tonumber(string.split(data.activitypreview2,"_")[1]))  --判断是否解锁的道具
            local needNum = tonumber(string.split(data.activitypreview2,"_")[3])  --解锁所需数量
            if item.count >= needNum and not StormControl.CheckPointPass(arr[i].id) then
                RedDotControl.GetDotData("ActivityPlot"):SetState(true)
                break
            end
        end
    end
end


return ActivityViewModel