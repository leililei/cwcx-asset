require("LocalData/WudaorewardLocalData")
require("LocalData/WudaoactivityLocalData")
require("Model/Budoukai/Data/BuDoukaiData")
---武道会管理器
BuDoukaiControl = {}
---排行奖励
local RankAward = {}
---@type BuDoukaiData
local BuDoukaiInfo = nil
local BuDoukaActivityInfo = nil
local FreeTimes = { totalFree=0,usedFree=0 }
local ResultData = {}
---是否为进攻方
local isAtk = true
--改变的阵型角色ID
local ChangeTeam = {}

function BuDoukaiControl.Init()
    BuDoukaActivityInfo = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.PVP_WuDaoHui)
    for i, v in ipairs(WudaoactivityLocalData.tab) do
        if BuDoukaActivityInfo.activityId == v.activityid then
            BuDoukaiInfo = BuDoukaiData.New(v)
        end
    end
    ---初始化排行奖励
    BuDoukaiControl.InitRankAward()
    ---注册第二场战斗NTF
    BuDoukaiControl.RegisterFightSecondNtf()
end

---武道会主界面
function BuDoukaiControl.OpenHome()
    --ruyuan xiayigetianliang
    MgrUI.GoHide(UID.WudaohuiPVP_UI)
end
---布阵
function BuDoukaiControl.OpenBuZhen()
    MgrBattle.GoFight(MgrBattle.fightType.wudaohuiReady,nil,"jingjichang")
end
---匹配
function BuDoukaiControl.OpenFight()
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientMoonPVPFightReq', { paid = FreeTimes.usedFree >= FreeTimes.totalFree }))
    MgrNet.SendReq(MID.CLIENT_MOON_PVP_FIGHT_REQ,bytes,0,nil,function()  end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientMoonPVPFightFirstNtf', buffer))
        local tScenesIdx = math.random(1,#BuDoukaiInfo.scenes)
        PVPViewModel.IsViewRecord = false
        --切场景进入战斗
        MgrBattle.GoFight(MgrBattle.fightType.wudaohuiReady,function()
            ---获取本场PVP的数据
            PVPViewModel.PlayerIsAtk = true
            PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.defTeam,tab.defSkin)
            PVPViewModel.OwnTeam = PVPViewModel.GetPvPRole(tab.atkTeam,tab.atkSkin)
            PVPViewModel.TargetTeamSkin = tab.defSkin
            PVPViewModel.OwnTeamSkin = tab.atkSkin
            PVPViewModel.CurToken = tab.token
            PVPViewModel.TargetInfo.name = tab.defName
            PVPViewModel.OwnInfo.name = tab.atkName
            --PVPViewModel.SetBuDoukaiPvpData(tab,true)

            BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
            --设置技能等级右侧角色数据
            PVPViewModel.PVPRightRoleData = {}
            PVPViewModel.PVPRightRoleData = tab.defTeam

            BattleManager.ClearLuaData()

            ---整理PVP队伍
            for i = 1, #PVPViewModel.OwnTeam do
                table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
            end
            for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
                table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
            end

            ---video整理进FightVideo
            BattleViewModel.GeneVideo(tab.video)
            --设置当前进攻还是防守
            BuDoukaiControl.SetCurAtkOrDef(true)

            ---结果 胜负状态 2胜利 1失败
            BattleViewModel.isLeftWin = tab.result == 2 and true or false
            ---记录结果
            ResultData.selfName = tab.atkName
            ResultData.otherName = tab.defName
            ResultData.firstToken = tab.token
            ---打开玩家立绘
            MgrTimer.AddDelayNoName(0,function()
                BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
                PVPViewModel.OpenBattleUI()
            end,nil)
        end,BuDoukaiInfo.scenes[tScenesIdx])
    end)
end
---注册第二场战斗NTF
function BuDoukaiControl.RegisterFightSecondNtf()
    MgrNet.RegisterNTF(MID.CLIENT_MOON_PVP_FIGHT_SECOND_NTF, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientMoonPVPFightSecondNtf', buffer))
        ---武道会PVP数据
        PVPViewModel.SetBuDoukaiPvpData(tab,false)

        ---更新消耗
        ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
        ---记录统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---最终胜负 2胜利 1失败 0平局
        ResultData.result = tab.matchResult
        ---第二场回放
        ResultData.secondToken = tab.token
        ---己方积分[10000,0,10000]
        ResultData.atkScore = tab.atkScore
        ---对手积分[10000,0,10000]
        ResultData.defScore = tab.defScore
    end)
end
---结算
function BuDoukaiControl.OpenComplete()
    ---打开结算界面
    MgrUI.Pop(UID.BudokaiComplete_UI,ResultData,true)
end
---设置结算信息
function BuDoukaiControl.SetBuDoukaiResult(_result)
    ---自己的昵称
    ResultData.selfName = PlayerControl.GetPlayerData().nickname
    ---对手的昵称
    ResultData.otherName = _result.otherName
    ---第一场战斗回放
    ResultData.firstToken = _result.firstToken
    ---第二场回放
    ResultData.secondToken = _result.secondToken
    ---最终胜负
    ResultData.result = _result.result
    ---己方积分[10000,0,10000]
    ResultData.atkScore = _result.atkScore
    ---对手积分[10000,0,10000]
    ResultData.defScore = _result.defScore
end

---初始化排行奖励
function BuDoukaiControl.InitRankAward()
    for i, v in ipairs(WudaorewardLocalData.tab) do
        local t = {
            id = v[1],
            firstRank = v[2],
            lastRank = v[3],
            reward = v[4]
        }
        table.insert(RankAward,t)
    end
end

---获取排行榜数据
function BuDoukaiControl.RankReq(callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetMoonPVPRankReq', {}))
    MgrNet.SendReq(MID.CLIENT_GET_MOON_PVP_RANK_REQ,bytes,0,nil,function()  end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientGetMoonPVPRankNtf', buffer))
        FreeTimes.usedFree = tab.usedFree
        FreeTimes.totalFree = tab.totalFree
        
        if callBack then
            callBack(tab)
        end
    end)
end

---获取排行奖励数据
function BuDoukaiControl.GetRankAward()
    return RankAward
end
---战报请求
function BuDoukaiControl.ZhanBaoReq(callBack)
    local bytes = assert(pb.encode('PBClient.ClientGetMoonPVPRecordReq', {}))
    MgrNet.SendReq(MID.CLIENT_GET_MOON_PVP_RECORD_REQ,bytes,0,nil,function()  end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientGetMoonPVPRecordNtf', buffer))

        if callBack then
            callBack(tab.records)
        end
    end)
end

---每日任务数据
function BuDoukaiControl.GetDailyTaskData()
    local array = TaskControl.GetEventRaidTaskData(BuDoukaiInfo.dayTaskId)    --附带判断任务是否解锁
    table.sort(array, function(a,b)     --按照是否已完成和已领取排序
        if a.isComplete > b.isComplete then
            return false
        elseif a.isComplete < b.isComplete then
            return true
        else
            if a.isReceive > b.isReceive then
                return true
            elseif a.isReceive < b.isReceive then
                return false
            else
                return a.id < b.id
            end
        end
    end)
    return array
end
---成就任务数据
function BuDoukaiControl.GetTaskData()
    local tAchieviment = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.ACTIVITY_STORY,false,BuDoukaiInfo.activeid)

    return tAchieviment
end
---武道会活动数据
---@return BuDoukaiData
function BuDoukaiControl.GetData()
    return BuDoukaiInfo
end
---武道会活动总览
---@return ActivityData
function BuDoukaiControl.GetActivityData()
    return BuDoukaActivityInfo
end

---回放战斗
function BuDoukaiControl.PlayBackData(token)
    local BaseREQ  =
    {
        token = token
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderPlayBackExREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_PLAY_BACK_EX_REQ,bytes,0,nil,function()  end,BuDoukaiControl.PlayBackNTF)
end

---设置当前进攻还是防守
function BuDoukaiControl.SetCurAtkOrDef(_isAtk)
    isAtk = _isAtk
end
function BuDoukaiControl.GetCurAtkOrDef()
    return isAtk
end

---回放战斗
function BuDoukaiControl.PlayBackNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExNTF',buffer))
    --切场景进入战斗
    BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
    local tScenesIdx = math.random(1,#BuDoukaiInfo.scenes)
    MgrBattle.GoFight(MgrBattle.fightType.wudaohuiReady,function()
        PVPViewModel.PlayerIsAtk = isAtk
        if isAtk then    --进攻回放
            PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.team,tab.dSkin)
            PVPViewModel.OwnTeam =PVPViewModel.GetPvPRole(tab.selfTeam,tab.aSkin)
            PVPViewModel.TargetTeamSkin = tab.dSkin
            PVPViewModel.OwnTeamSkin = tab.aSkin
            PVPViewModel.TargetInfo.name = tab.name
            PVPViewModel.TargetInfo.score = tab.score
            PVPViewModel.TargetInfo.rank = tab.rank
            PVPViewModel.TargetInfo.rankLevel = tab.RankLevel
            PVPViewModel.OwnInfo.name = tab.selfName
            PVPViewModel.OwnInfo.score = tab.selfScore
            PVPViewModel.OwnInfo.rank = tab.selfRank
            PVPViewModel.OwnInfo.rankLevel = tab.selfRankLevel

            --设置技能等级右侧角色数据
            PVPViewModel.PVPRightRoleData = {}
            PVPViewModel.PVPRightRoleData = tab.team
        else                                --防守回放
            PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.team,tab.aSkin)
            PVPViewModel.OwnTeam = PVPViewModel.GetPvPRole(tab.selfTeam,tab.dSkin)
            PVPViewModel.TargetTeamSkin = tab.aSkin
            PVPViewModel.OwnTeamSkin = tab.dSkin
            PVPViewModel.TargetInfo.name = tab.selfName
            PVPViewModel.TargetInfo.score = tab.selfScore
            PVPViewModel.TargetInfo.rank = tab.selfRank
            PVPViewModel.TargetInfo.rankLevel = tab.selfRankLevel
            PVPViewModel.OwnInfo.name = tab.name
            PVPViewModel.OwnInfo.score = tab.score
            PVPViewModel.OwnInfo.rank = tab.rank
            PVPViewModel.OwnInfo.rankLevel = tab.RankLevel

            --设置技能等级右侧角色数据
            PVPViewModel.PVPRightRoleData = {}
            PVPViewModel.PVPRightRoleData = tab.selfTeam
        end
        
        BattleManager.ClearLuaData()
        PVPViewModel.AllRole = {}
        ---整理PVP队伍
        for i = 1, #PVPViewModel.OwnTeam do
            table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
        end
        for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
            table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
        end
        ---video整理进FightVideo
        BattleViewModel.GeneVideo(tab.video)
        BattleManager.BattleAgain = true
        
        if (tab.result == 2 and tab.selfName == PlayerControl.GetPlayerData().nickname) or (tab.result == 1 and tab.name == PlayerControl.GetPlayerData().nickname) then --进攻方获胜
            BattleViewModel.isLeftWin = true
        else
            BattleViewModel.isLeftWin = false
        end
        ---回放去掉跳过倒计时
        PVPViewModel.IsViewRecord = true
        ---打开玩家立绘
        MgrTimer.AddDelayNoName(0,function()
            BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
            PVPViewModel.OpenBattleUI()
        end,nil)
    end,BuDoukaiInfo.scenes[tScenesIdx])
end
---检查任务相关红点
function BuDoukaiControl.CheckTaskRedPoint()
    RedDotControl.GetDotData("BuDoukaiDailyTask"):SetState(false)
    RedDotControl.GetDotData("BuDoukaiAch"):SetState(false)

    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.PVP_WuDaoHui) then
        return
    end
    ---遍历任务
    local tData = BuDoukaiControl.GetActivityData()
    if Global.isMiddleTime(tData.beginTime,tData.endTime) then
        for k,v in pairs(BuDoukaiControl.GetDailyTaskData()) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("BuDoukaiDailyTask"):SetState(true)
                break
            end
        end
    end

    ---遍历成就
    for k,v in pairs(BuDoukaiControl.GetTaskData()) do
        local progressStr = JNStrTool.strSplit("_", v.complete)
        local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
        if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
            RedDotControl.GetDotData("BuDoukaiAch"):SetState(true)
            break
        end
    end
end

---设置改变的阵型角色ID
function BuDoukaiControl.SetChangeTeamID(_roleID)
    if _roleID then
        table.insert(ChangeTeam, _roleID)
    else
        ChangeTeam = {}
    end
end
function BuDoukaiControl.GetChangeTeamID()
    return ChangeTeam
end
function BuDoukaiControl.RemoveChangeTeamID(_roleID)
    for i, roleID in ipairs(ChangeTeam) do
        if roleID == _roleID then
            table.remove(ChangeTeam,i)
            break
        end
    end
end

function BuDoukaiControl.Clear()
    RankAward = {}
    BuDoukaiInfo = nil
    BuDoukaActivityInfo = nil
    FreeTimes = { totalFree=0,usedFree=0 }
    ResultData = {}
    isAtk = true
    ChangeTeam = {}
end

return BuDoukaiControl