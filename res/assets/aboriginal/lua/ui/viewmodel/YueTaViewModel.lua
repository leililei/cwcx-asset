require("LocalData/SteamLocalData")
require("LocalData/AbyssrewardLocalData")
YueTaViewModel = {}

local ResetCostTimes = tonumber(SteamLocalData.tab[121000][2])
local HardResetHeroLimit = tonumber(SteamLocalData.tab[121004][2])
YueTaViewModel.ResetCost = SteamLocalData.tab[121001][2]

---月塔战斗奖励
YueTaViewModel.Reward = nil

---@type ActivityData
local YueTaInfo = nil

local localServerData = {
    version = 1,
    curLevel = 0,
    heroResetCount = 0,
    towerHero = nil,
    towerStage = nil,
    enemyHp = nil,
    heroResetCountTotal = 0,
    innerTowerHero = nil,
    innerTowerStage = nil,
    innerEnemyHP = nil,
    innerTowerBuff = nil,
    innerTowerBuffSave = nil,
    innerTopScore = 0,
    innerCurLevel = 0,
    innerHeroResetCnt = 0,
    innerTowerResetCnt = 0,
    innerClaimedReward = nil
}

function YueTaViewModel.SetYuetaData()
    YueTaInfo = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.MONTH_EVENT)
end

function YueTaViewModel.GetYuetaData()
    return YueTaInfo
end

function YueTaViewModel.OpenYuetaUI()
    local ClientGetMonthlyTowerREQ = {}
    local bytes = assert(pb.encode('PBClient.ClientGetMonthlyTowerREQ',ClientGetMonthlyTowerREQ))
    MgrNet.SendReq(MID.CLIENT_GET_MONTHLY_TOWER_REQ,bytes,nil,nil,function(buffer,tag)
        YueTaViewModel.MonthlyTowerACK(buffer,tag)
    end,function(buffer,tag)
        YueTaViewModel.MonthlyTowerNTF(buffer,tag)
    end)
end

function YueTaViewModel.MonthlyTowerACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetMonthlyTowerACK',buffer))
    if tab.errNo == 0 then
    else
        print("月塔未开放,获取月塔数据失败,errNo " .. tab.errNo)
    end
end
---获取月塔数据
function YueTaViewModel.MonthlyTowerNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetMonthlyTowerNTF',buffer))
    local time = Global.GetCurTime()
    if time > tab.openTs and time < tab.closeTs and YueTaControl.GetYueTaInfo() ~= nil and tab.version == YueTaControl.GetYueTaInfo().version then
        ---加载关卡信息
        StormViewModel.ReloadStormData()
        ---记录所有服务器给的数据
        YueTaViewModel.PushServerData(tab,function()
            --YueTaControl.OpenUI()
            YueTaControl.OpenHome()
        end)
    end
end

function YueTaViewModel.PushServerData(serverData,callBack)
    localServerData.version = serverData.version
    localServerData.curLevel = serverData.curLevel
    localServerData.heroResetCount = serverData.heroResetCnt
    localServerData.towerHero = serverData.towerHero
    localServerData.towerStage = serverData.towerStage  --level:关卡id status:通关与否
    localServerData.heroResetCountTotal = serverData.heroResetCountTotal == nil and 0 or serverData.heroResetCountTotal
    localServerData.innerTowerHero = serverData.innerTower.innerTowerHero
    localServerData.innerEnemyHP = serverData.innerTower.innerEnemyHP
    localServerData.innerTowerStage = serverData.innerTower.innerTowerStage
    localServerData.innerHeroResetCnt = serverData.innerTower.innerHeroResetCnt
    localServerData.innerTowerBuff = serverData.innerTower.innerTowerBuff
    localServerData.innerTowerBuffSave = serverData.innerTowerBuffSave
    localServerData.innerCurLevel = serverData.innerTower.innerCurLevel
    localServerData.innerTopScore = serverData.innerTopScore
    localServerData.innerTowerResetCnt = serverData.innerTowerResetCnt
    localServerData.innerClaimedReward = serverData.innerClaimedReward
    StormViewModel.PushYuetaPointData(serverData.towerStage)
    StormViewModel.PushYuetaInnerPointData(serverData.innerTower.innerTowerStage)
    YueTaViewModel.SaveEnemyHp(serverData.enemyHP)
    if callBack then
        callBack()
    end
end
---血量记录
function YueTaViewModel.PushHeroInfo(info)
    localServerData.towerHero = info.towerHero
    localServerData.innerTowerHero = info.innerTowerHero
end

function YueTaViewModel.GetServerData()
    return localServerData
end

function YueTaViewModel.PushInnerTowerData(_serverData)
    localServerData.innerTowerStage = _serverData.innerTower.innerTowerStage
    localServerData.innerTowerResetCnt = _serverData.innerTowerResetCnt
    localServerData.innerCurLevel = _serverData.innerTower.innerCurLevel
    localServerData.innerTowerBuff = _serverData.innerTower.innerTowerBuff
    localServerData.innerHeroResetCnt = _serverData.innerTower.innerHeroResetCnt
    localServerData.innerTowerHero = nil
    localServerData.innerEnemyHP = nil
end

function YueTaViewModel.ResetAllHeroHPReq(callBack)
    if YueTaControl.GetMode() == YueTaControl.ModeType.EASY then
        ---简单模式英雄重置
        YueTaViewModel.EasyHeroHpReset(callBack)
    else
        ---困难模式英雄重置
        YueTaViewModel.HardTowerHeroReset(callBack)
    end
end
---简单模式英雄重置
function YueTaViewModel.EasyHeroHpReset(callBack)
    local tab = {
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTowerHeroResetREQ',tab))
    MgrNet.SendReq(MID.CLIENT_TOWER_HERO_RESET_REQ, bytes, 0, nil, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientTowerHeroResetACK',buffer))
        if tab.errNo ~= 0 then

        end
    end, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientTowerHeroResetNTF',buffer))
        YueTaViewModel.ResetAllHeroHP(tab.heroInfo)
        YueTaViewModel.ResetCount(tab.heroResetCnt)
        YueTaViewModel.ResetCountTotal(tab.heroResetCntTotal)
        ---消耗道具
        if tab.cost then
            for k,v in pairs(tab.cost) do
                ItemControl.PushSingleItemData(v,ItemControl.PushEnum.consume)
            end
        end
        if callBack then
            callBack()
        end
    end)
end

---困难模式英雄重置
function YueTaViewModel.HardTowerHeroReset(callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientInnerTowerHeroResetREQ', {}))
    MgrNet.SendReq(MID.CLIENT_INNER_TOWER_HERO_RESET_REQ,bytes,0,nil,YueTaViewModel.HardTowerHeroAck,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientInnerTowerHeroResetNTF', buffer))
        localServerData.innerHeroResetCnt = tab.heroResetCnt
        localServerData.innerTowerHero = nil
        if callBack then
            callBack()
        end
    end)
end
function YueTaViewModel.HardTowerHeroAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientInnerTowerHeroResetACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end

function YueTaViewModel.ResetCountTime()
    return ResetCostTimes
end

function YueTaViewModel.ResetCount(count)
    localServerData.heroResetCount = count  --剩余重置次数
end

function YueTaViewModel.ResetCountTotal(heroResetCntTotal)
    localServerData.heroResetCountTotal = heroResetCntTotal  --总重置次数
end

function YueTaViewModel.ResetAllHeroHP(heroInfo)
    localServerData.towerHero = heroInfo
end

function YueTaViewModel.GetHardResetHeroLimit()
    return HardResetHeroLimit
end

function YueTaViewModel.ReturnResetCost()
    local cost = string.split(YueTaViewModel.ResetCost,"_")
    local goods = {
        goodsType = tonumber(cost[1]),
        goodsID = tonumber(cost[2]),
        goodsNum = tonumber(cost[3])
    }
    local item = ItemData.New()
    item:PushData(goods, ItemControl.PushEnum.none)
    return item
end

function YueTaViewModel.SaveEnemyHp(enemyHP)
    if enemyHP then
        localServerData.enemyHp = enemyHP
    else
        localServerData.enemyHp = nil
    end
end

function YueTaViewModel.GetEnemyHp()
    local tEnemyHp = localServerData.enemyHp
    if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        tEnemyHp = localServerData.innerEnemyHP
    end
    
    return tEnemyHp
end
---保存里塔BUFF
function YueTaViewModel.SaveInnerTowerBuff(_buffList)
    localServerData.innerTowerBuff = _buffList
    localServerData.innerTowerBuffSave = _buffList
end
---获取BUFF特性积分
function YueTaViewModel.GetInnerBuffPT()
    local tPoint = 0
    local BuffList = YueTaControl.GetBuffList()
    if localServerData.innerTowerBuff then
        for i, v in ipairs(localServerData.innerTowerBuff) do
            if BuffList[v] then
                tPoint = BuffList[v].score + tPoint
            end
        end
    end
    return tPoint
end

---重置困难模式
function YueTaViewModel.InnerTowerReset(callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientInnerTowerResetREQ', {}))
    MgrNet.SendReq(MID.CLIENT_INNER_TOWER_RESET_REQ,bytes,0,nil,YueTaViewModel.InnerTowerResetAck,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientInnerTowerResetNTF', buffer))
        YueTaViewModel.PushInnerTowerData(tab)
        StormViewModel.ResetYuetaInnerPointData()
        if callBack then
            callBack()
        end
    end)
end
function YueTaViewModel.InnerTowerResetAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientInnerTowerResetACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end

---领取积分奖励
function YueTaViewModel.RecPointReward(_rewardList, callBack)
    local InnerTowerGetPtRewardReq =
    {
        claimID = _rewardList
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientInnerTowerGetPtRewardREQ', InnerTowerGetPtRewardReq))
    MgrNet.SendReq(MID.CLIENT_INNER_TOWER_GET_PT_REWARD_REQ,bytes,0,nil,YueTaViewModel.InnerTowerResetAck,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientInnerTowerGetPtRewardNTF', buffer))
        YueTaViewModel.GetServerData().innerClaimedReward = tab.innerClaimedReward

        if tab.reward then
            ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
            ---弹出奖励窗口
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
        end
        if callBack then
            callBack()
        end
    end)
end
function YueTaViewModel.RecPointRewardAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientInnerTowerGetPtRewardACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end

---注册月塔红点推送监听
function YueTaViewModel.RegisterNtf()
    MgrNet.RegisterNTF(MID.CLIENT_MONTHLY_TOWER_SCORE_NTF,function(buffer,tag)
        ---收到商品推送
        local info = assert(pb.decode('PBClient.ClientMonthlyTowerScoreNtf',buffer))

        YueTaViewModel.CheckRedDot(info.topScore,info.claimedRewards)
    end)
end

function YueTaViewModel.CheckRedDot(topScore,claimedRewards)
    local TopScore = topScore
    local RecRewardList = claimedRewards

    RedDotControl.GetDotData("Yueta"):SetState(false)
    RedDotControl.GetDotData("YuetaReward"):SetState(false)
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.MONTH_EVENT) then
        return
    end
    if UnityEngine.PlayerPrefs.GetInt("Yueta_" .. YueTaControl.GetYueTaInfo().version .. "_"..PlayerControl.GetPlayerData().UID) == 0 then
        RedDotControl.GetDotData("Yueta"):SetState(true)
    end
    ---检测是否能够领取奖励
    local RankRewardInfo = AbyssrewardLocalData.tab
    Global.Sort(RankRewardInfo,{"score"})
    for i, v in ipairs(RankRewardInfo) do
        if TopScore >= v.score then
            if (RecRewardList and not Global.Contains(RecRewardList,v.id)) or RecRewardList == nil then
                RedDotControl.GetDotData("YuetaReward"):SetState(true)
                break
            end
        end
    end
end

function YueTaViewModel.Clear()
    YueTaViewModel.Reward = nil
end

return YueTaViewModel