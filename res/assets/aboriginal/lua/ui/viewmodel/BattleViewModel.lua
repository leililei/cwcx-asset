require("JNBattle/RoleBattleData")
require("JNBattle/BattleLogger")
local VideoCheckPoint = {
    VBefGameStart = 1,
    VGameStart = 2,
    VRoundStart = 3,
    VTurnStart = 4,
    VBefAtk = 5,
    VOnAtk = 6,
    VBefSubAtk = 7,
    VAtkDmg = 8,
    VAftSubAtk = 9,
    VAftAtK = 10,
    VCastSkill = 11,
    VTurnEnd = 12,
    VTurnBuff = 13,
    VRoundEnd = 14,
    VDead = 15,
    VSummon = 16,
    VCharge = 17,
    VFrozen = 18,
    VResurrection = 19,
    VAfterDead = 20,
    VDuelStart = 21,
    VAftResurrection = 22,
    VDuelWin = 23,
    VDuelLose = 24,
    VNextBattle = 25,
    VAtkBack = 26,
    VAtkTrigger = 27,
}

BattleViewModel = {}
BattleViewModel.BattleVideo = {}
---@type table<number, RoleBattleData> @ key - uid
BattleViewModel.Fighters = {}
BattleViewModel.AtkOrders = {}
BattleViewModel.CurOrderList = {}
BattleViewModel.RoundCount = 0
BattleViewModel.TurnCount = 0
BattleViewModel.PhaseIndex = 0
BattleViewModel.CurData = nil
BattleViewModel.CurRoundStartInfo = {}

BattleViewModel.CurNormalList = {}
BattleViewModel.CurNormalIdx = 0
BattleViewModel.zjHitCount = 1

BattleViewModel.CurNormalTab = {}
BattleViewModel.CurNormalIdxTab = {}
BattleViewModel.zjHitCountTab = {}
BattleViewModel.TotalNormalCount = 0
BattleViewModel.FinishedCount = 0

BattleViewModel.NormalDuration = 0
BattleViewModel.HitPlay = false
BattleViewModel.hitAniStep = VideoCheckPoint.VTurnStart

BattleViewModel.gjHitCount = 1
BattleViewModel.isLeftWin = false
BattleViewModel.isShowKuangbao = false

BattleViewModel.PausePhase = nil

BattleViewModel.GuideTeam = nil
BattleViewModel.isReturning = false
BattleViewModel.PveReturn = false
BattleViewModel.TeamCorrect = false

---是否放弃战斗
BattleViewModel.GiveUp = nil
---放弃战斗枚举
BattleViewModel.giveUp = {
    GIVE_UP = 0,
    DONE = 1,
}

BattleViewModel.TowerReward = nil
BattleViewModel.NormalRewardTab = nil
BattleViewModel.GuideTab = nil

local getTowerReward = false
local getGuideReward = false

function BattleViewModel.Init()
    Event.Add("BattleUpdateMaxHp", BattleViewModel.UpdateMaxHp)
    Event.Add("BattleUpdateDef", BattleViewModel.UpdateDef)
    Event.Add("BattleUpdateAgi", BattleViewModel.UpdateAgi)
    Event.Add("BattleUpdateShield", BattleViewModel.UpdateShield)
    Event.Add("BattleUpdateCurHp", BattleViewModel.UpdateCurHp)
    Event.Add("BattleRemoveBuff", BattleViewModel.RemoveBuff)
end

function BattleViewModel.UpdateMaxHp(uid, value)
    local roleData= BattleManager.AllRole[uid]
    if roleData ~= nil then
        if value>0 then
            roleData.myAni:SetHPMax(value,1)
        else
            roleData.myAni:SetHPMax(value,0)
        end
    end
end

function BattleViewModel.UpdateDef(uid, value)
    local roleData= BattleManager.AllRole[uid]
    if roleData ~= nil then
        if value >= 10000 then
            roleData.myAni:SetSingleEffect("Buff_HuDunMax_v1")
        else
            roleData.myAni:RemoveEffect("Buff_HuDunMax_v1")
        end
    end
end

function BattleViewModel.UpdateAgi(uid, value)
    local roleData= BattleManager.AllRole[uid]
    if roleData ~= nil then
        if value >= 10000 then
            roleData.myAni:SetSingleEffect("Buff_ShanBiMax_v1")
        else
            roleData.myAni:RemoveEffect("Buff_ShanBiMax_v1")
        end
    end
end

function BattleViewModel.UpdateShield(uid, value)
    local roleData= BattleManager.AllRole[uid]
    if roleData ~= nil then
        roleData.myAni:AddShield(value)
    end
end

function BattleViewModel.UpdateCurHp(uid, value)
    local roleData= BattleManager.AllRole[uid]
    if roleData ~= nil then
        local isHide = roleData.myAni.AtkHid
        print("UpdateCurHp:"..uid.." isHide:"..(isHide and 0 or 1))
        if not isHide then
            if BattleViewModel.hitAniStep == VideoCheckPoint.VBefAtk or
            BattleViewModel.hitAniStep == VideoCheckPoint.VBefSubAtk or
            BattleViewModel.hitAniStep == VideoCheckPoint.VAtkDmg or
            BattleViewModel.hitAniStep == VideoCheckPoint.VAftAtK or
            BattleViewModel.hitAniStep == VideoCheckPoint.VAftSubAtk then
                roleData.myAni:SetHPWithoutNumber(value)
            end
        end
    end
end

---@param uid int
---@param skillID long @ 实际为 skillID .. 二位数序号
---@param duration int? @ 新增参数，为了用于移除 Buff 图标
function BattleViewModel.RemoveBuff(uid, skillID, duration)
    local sID = math.modf(skillID/100)
    local roleData= BattleManager.AllRole[uid]   --要删除特效的角色的数据
    local effectTab = JNStrTool.SubAtkEffectId(SkillLocalData.tab[sID][5])  --要删除的Buff的特效ID表
    if roleData ~= nil then
        for i = 1, #effectTab do
            for j = 1, #effectTab[i] do
                local effectID = tonumber(effectTab[i][j][1])
                if Special_effectLocalData.tab[effectID] then
                    local effectName = Special_effectLocalData.tab[effectID][4]
                    local newEffectName = string.split(effectName,'/')
                    effectName = newEffectName[#newEffectName]
                    local effectType = Special_effectLocalData.tab[effectID][6]
                    roleData.myAni:RemoveBuffEffect(effectName.."(Clone)",effectType)
                end
            end
        end
        -- 移除图标
        roleData.myAni:RemoveBuff(sID, duration or 0)
    end
end

function BattleViewModel.StartBattle(mode, closePanelCallBack)
    -- BattleViewModel.BattleVideo = {}
    -- BattleViewModel.Fighters = {}
    BattleViewModel.BossHurt = 0
    BattleViewModel.playerExp = PlayerControl.GetPlayerData().exp
    BattleViewModel.JumpOut = false
    BattleViewModel.isReturning = false
    BattleViewModel.PausePhase = nil
    BattleViewModel.GiveUp = BattleViewModel.giveUp.DONE
    BattleViewModel.GuideTab = nil
    CJNBattleMgr.Instance.IsPause = false
    if mode == 1 then
        BattleViewModel.DamageTotal = {}
        local REQ
        if NoviceControl.battleStart == true then
            REQ = {
                levelID = StormViewModel.CurPointData.id,
                teamID = -1,
                heroID = {},
            }
        else
            REQ = {
                levelID = StormViewModel.CurPointData.id,
                teamID = 0,
                heroID = {},
            }
        end
        ---若存在Npc助战,将阵容设置到指定阵容并提交Npc信息
        if StormViewModel.CurPointData.npcType > 0 then
            if not NoviceControl.battleStart then
                REQ.teamID = StormViewModel.NpcTeamStaticId
            end
            if StormViewModel.NpcTeam ~= nil then
                for i, fighter in pairs(StormViewModel.NpcTeam) do
                    REQ.heroID[#REQ.heroID + 1] = fighter
                end
            end
        end
        if StormViewModel.FriendSupportTeam ~= nil then
            for i, fighter in pairs(StormViewModel.FriendSupportTeam) do
                REQ.friendSupport = fighter
            end
        end
        ---组装数据
        local bytes = assert(pb.encode('PBClient.ClientSetLevelStarExREQ',REQ))
        --print("请求常规战斗"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_SET_LEVEL_STAR_EX_REQ,bytes,0,function() end,BattleViewModel.NewBattleACK,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.NewBattleNTF(...)
        end)
        return
    elseif mode == 2 then --TODO
        BattleViewModel.Calculagraph()
        BattleViewModel.RoundCount=0 --轮数下标
        BattleViewModel.TurnCount=0 --回合数下标
        BattleViewModel.StartPlayVideo()
    elseif mode == 3 then
        BattleViewModel.DamageTotal = {}
        local ClientBossBattleREQ = {
            teamID = 0,
            key = StormViewModel.CurStormBossId_Monster
        }
        local bytes = assert(pb.encode('PBClient.ClientBossBattleREQ',ClientBossBattleREQ))
        --print("发送签到"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_BOSS_BATTLE_E_REQ,bytes,0,function() end,BattleViewModel.BossBattleSignReceiveACK,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.BossBattleSignReceiveNTF(...)
        end)
        return
    elseif mode == 4 then
        BattleViewModel.DamageTotal = {}
        local ClientBossBattleTextREQ = {
            teamID = 0,
            bossID = StormViewModel.CurStormAnaBossId_Monster
        }
        local bytes = assert(pb.encode('PBClient.ClientBossBattleTextREQ',ClientBossBattleTextREQ))
        --print("发送签到"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_BOSS_BATTLE_TEXT_E_REQ,bytes,0,function() end,BattleViewModel.ClientBossBattleTextACK,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.ClientBossBattleTextNTF(...)
        end)
        return
    elseif mode == 5 then
        BattleViewModel.DamageTotal = {}
        ---创建服务器需要的红色巨塔数据
        local tab = {
            towerID = StormViewModel.CurPointData.id,
            heroID = {}
        }
        ---获取通关时使用的角色
        local teamData = TeamControl.GetTeamData(0)
        if teamData ~= nil and teamData.info ~= nil then
            for i, v in pairs(teamData.info) do
                tab.heroID[#tab.heroID + 1] = v
            end
        end
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientTowerBattleREQ',tab))
        ---发送结算请求
        MgrNet.SendReq(MID.CLIENT_TOWER_BATTLE_REQ,bytes,0,function() end, BattleViewModel.TowerAck_New, function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.TowerNtf_New(...)
        end)
        return
    elseif mode == 6 then
        BattleViewModel.DamageTotal = {}
        ---创建服务器需要的战术指导数据
        local tab = {
            towerID = StormViewModel.CurPointData.id,
            heroID = {}
        }
        ---获取通关时使用的角色
        for i, role in pairs(BattleViewModel.GuideTeam) do
            tab.heroID[#tab.heroID + 1] = role
        end
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientTowerBattleREQ',tab))
        ---发送结算请求
        MgrNet.SendReq(MID.CLIENT_GUIDE_BATTLE_REQ,bytes,0,function() end, BattleViewModel.GuideAck_New,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.GuideNtf_New(...)
        end)
        return
    elseif mode == 7 or mode == 8 then
        BattleViewModel.DamageTotal = {}
        local REQ = {
            levelID = StormViewModel.CurPointData.id,
            teamID = 0,
            heroID = {},
        }
        ---若存在Npc助战,将阵容设置到指定阵容并提交Npc信息
        if StormViewModel.CurPointData.npcType > 0 then
            if not NoviceControl.battleStart then
                REQ.teamID = StormViewModel.NpcTeamStaticId
            end
            if StormViewModel.NpcTeam ~= nil then
                for i, fighter in pairs(StormViewModel.NpcTeam) do
                    REQ.heroID[#REQ.heroID + 1] = fighter
                end
            end
        end
        if StormViewModel.FriendSupportTeam ~= nil then
            for i, fighter in pairs(StormViewModel.FriendSupportTeam) do
                REQ.friendSupport = fighter
            end
        end
        ---组装数据
        local bytes = assert(pb.encode('PBClient.ClientSetLevelStarREQ',REQ))
        --("请求常规战斗"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_SET_EVENT_BOSS_LEVEL_STAR_REQ,bytes,0,function() end,BattleViewModel.ActivityBossACK,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.ActivityBossNTF(...)
        end)
        return
    elseif mode == 9 then
        BattleViewModel.DamageTotal = {}
        local tab = {
            level = StormViewModel.CurChooseMonthTower
        }
        local bytes = assert(pb.encode('PBClient.ClientMonthlyTowerFightREQ',tab))
        MgrNet.SendReq(MID.CLIENT_MONTHLY_TOWER_FIGHT_REQ,bytes,0,function() end,BattleViewModel.MonthTowerACK,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            BattleViewModel.MonthTowerNTF(...)
        end)
    elseif mode == 10 then --TODO
        BattleViewModel.RoundCount=0 --轮数下标
        BattleViewModel.TurnCount=0 --回合数下标
        BattleViewModel.StartPlayVideo()
    elseif mode == 11    --武道会PVPvideo
    then
        BattleViewModel.Calculagraph()
        BattleViewModel.RoundCount=0 --轮数下标
        BattleViewModel.TurnCount=0 --回合数下标
        BattleViewModel.StartPlayVideo()
    end
end

---普通战斗请求验证_新
function BattleViewModel.NewBattleACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarExACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end

---数据推送 普通战斗NTF_新
function BattleViewModel.NewBattleNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarExNTF',buffer))
    print("NewBattleNTF:"..serpent.block(tab))
    BattleViewModel.GeneVideo(tab.video)
    BattleViewModel.StartPlayVideo()
    if NoviceControl.battleStart then
        NoviceControl.battleStart = false
    end
end

---红色巨塔请求ACK
function BattleViewModel.TowerAck_New(buffer,tag)
    local recAck = assert(pb.decode('PBClient.ClientTowerBattleACK',buffer))
    if recAck.errNo ~= 0 then
        print("结算失败:"..recAck.errNo)
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips4"),recAck.errNo),1},true)
        ---返回红巨界面
        MgrBattle.CloseFight()
        MgrUI.UnLock("battle_start")
    end
end
---红色巨塔数据NTF
function BattleViewModel.TowerNtf_New(buffer,tag)
    local recNtf = assert(pb.decode('PBClient.ClientTowerBattleNTF',buffer))
    ---播放
    BattleViewModel.GeneVideo(recNtf.video)
    ---记录结果
    if recNtf.result == 0 then
        getTowerReward = false
        BattleViewModel.isLeftWin = false
    elseif recNtf.result == 1 then
        getTowerReward = true
        BattleViewModel.isLeftWin = true
    end
    BattleViewModel.RoundCount=0 --轮数下标
    BattleViewModel.TurnCount=0 --回合数下标
    print("----------开始红色巨塔战斗---------")
    BattleViewModel.StartPlayVideo()
end

---战术指导请求ACK
function BattleViewModel.GuideAck_New(buffer,tag)
    local recAck = assert(pb.decode('PBClient.ClientTowerBattleACK',buffer))
    if recAck.errNo ~= 0 then
        print("结算失败:"..recAck.errNo)
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips4"),recAck.errNo),1},true)
        ---返回战术指导界面
        MgrTimer.AddDelayNoName(1,function()
            MgrBattle.CloseFight()
        end)
        MgrUI.UnLock("battle_start")
    end
end
---战术指导NTF
function BattleViewModel.GuideNtf_New(buffer,tag)
    local recNtf = assert(pb.decode('PBClient.ClientTowerBattleNTF',buffer))
    print("GuideNtf_New result:"..serpent.block(recNtf.result))
    ---整理视频
    BattleViewModel.GeneVideo(recNtf.video)
    ---记录结果
    if recNtf.result == 0 then  --失败
        getGuideReward = false
        BattleViewModel.isLeftWin = false
    elseif recNtf.result == 1 then  --胜利
        getGuideReward = true
        BattleViewModel.isLeftWin = true
    end
    BattleViewModel.RoundCount=0 --轮数下标
    BattleViewModel.TurnCount=0 --回合数下标
    print("------------------正式开始战斗---------")
    BattleViewModel.StartPlayVideo()
end

---Boss战斗请求验证
function BattleViewModel.BossBattleSignReceiveACK(buffer, tag)
    --print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientBossBattleACK',buffer))
    if tab.errNo == ServerErrorCode.BossBattle_564 then    --boss已被击杀
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips1")..tab.errNo,2},true)
        ---还原播放速度
        CJNBattleMgr.SetGameSpeed(1)
        ---显示结算面板
        if MgrUI.GetCurUI().Uid ~= UID.Home_UI then
            BattleManager.ReturnToMainScene(false)
        end
        MgrUI.UnLock("battle_start")
    elseif tab.errNo == ServerErrorCode.BossBattle_508 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("worldboss_ui_tips8")..tab.errNo,2},true)
        MgrUI.UnLock("battle_start")
    else
		if tab.errNo ~= 0 then
       		MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips9").."ID："..tab.errNo,2},true)
            MgrUI.UnLock("battle_start")
    	end
	end
end
---Boss模拟战斗请求验证
function BattleViewModel.ClientBossBattleTextACK(buffer, tag)
    --print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientBossBattleTextACK',buffer))
    if tab.errNo == ServerErrorCode.BossBattleText_564 then    --Boss已被击杀
        MgrUI.UnLock("battle_start")
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips1")..tab.errNo,2},true)
        ---还原播放速度
        CJNBattleMgr.SetGameSpeed(1)
        ---显示结算面板
        if MgrUI.GetCurUI().Uid ~= UID.Home_UI then
            BattleManager.ReturnToMainScene(false)
        end
    else
        MgrUI.UnLock("battle_start")
        --MgrUI.Pop(UID.PopTip_UI,{"错误ID："..tab.errNo,2},true)
    end
end
---Boss战斗NTF
function BattleViewModel.BossBattleSignReceiveNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBossBattleNTF',buffer))
    BattleViewModel.GeneVideo(tab.video)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    BattleViewModel.LHTFReward = {}
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).score = tab.score
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).count = tab.count
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).maxScore = tab.maxScore
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).roundScore = tab.roundScore
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).killScore = tab.killScore
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).damageScore = tab.damageScore
    ActivityControl.GetCurActivityByID(StormViewModel.CurStormBossId).LHTFGoods = tab.goods

    ---更新物品奖励
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    ---刷新地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    BattleViewModel.isLeftWin = true
    BattleViewModel.RoundCount=0 --轮数下标
    BattleViewModel.TurnCount=0 --回合数下标
    print("------------------正式开始战斗---------")
    BattleViewModel.StartPlayVideo()
end
---模拟boss战斗NTF
function BattleViewModel.ClientBossBattleTextNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBossBattleTextNTF',buffer))
    BattleViewModel.GeneVideo(tab.video)
    BattleViewModel.AniBossScore = tab.score
    BattleViewModel.AniBossRoundScore = tab.roundScore
    BattleViewModel.AniBossKillScore = tab.killScore
    BattleViewModel.AniBossDamageScore = tab.damageScore
    BattleViewModel.isLeftWin = true
    BattleViewModel.RoundCount=0 --轮数下标
    BattleViewModel.TurnCount=0 --回合数下标
    print("------------------正式开始战斗---------")
    BattleViewModel.StartPlayVideo()
end

---活动Boss战斗请求验证
function BattleViewModel.ActivityBossACK(buffer, tag)
    print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarACK',buffer))
    if tab.errNo ~= 0 then
        if tab.errNo == ServerErrorCode.SetLevelStar_515 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips1"),2},true)
        elseif tab.errNo == ServerErrorCode.SetLevelStar_503 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("sweeppoppvp_ui_tips1"),2},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo,2},true)
        end
        MgrUI.UnLock("battle_start")
    end
end
---数据推送 活动Boss战斗结算NTF
function BattleViewModel.ActivityBossNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarNTF',buffer))
    print("两边队伍一致")
    ---更新视频
    BattleViewModel.GeneVideo(tab.video)
    ---保存普通奖励
    BattleViewModel.NormalRewardTab = nil
    BattleViewModel.NormalRewardTab = tab
    if StormViewModel.CurPointData.battleMap ~= "0" then
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
    end
    ---是否胜利判断
    if tab.levelStar > 0 then
        BattleViewModel.isLeftWin = true
    else
        BattleViewModel.isLeftWin = false
    end
    BattleViewModel.RoundCount=0 --轮数下标
    BattleViewModel.TurnCount=0 --回合数下标
    print("------------------正式开始战斗---------")
    BattleViewModel.StartPlayVideo()
end

---月塔ACK
function BattleViewModel.MonthTowerACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientMonthlyTowerFightACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.UnLock("battle_start")
        print("月塔战斗开始失败,错误码" .. tab.errNo)
        if tab.errNo == 654 then
            print("有英雄已死亡,错误码" .. tab.errNo)
        elseif tab.errNo == 655 then
            print("上一关未通关,错误码" .. tab.errNo)
        end
    end
end
---月塔NTF
function BattleViewModel.MonthTowerNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientMonthlyTowerFightNTF',buffer))

    YueTaViewModel.Reward = tab.reward
    ---战斗胜负
    BattleViewModel.isLeftWin = tab.leftWin
    ---更新视频
    BattleViewModel.GeneVideo(tab.video)
    ---血量记录
    YueTaViewModel.PushHeroInfo(tab)
    ---更新物品奖励
    ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)

    BattleViewModel.RoundCount=0
    BattleViewModel.TurnCount=0
    BattleViewModel.StartPlayVideo()
end

function BattleViewModel.GeneVideo(video)
    BattleViewModel.BattleVideo = {}
    BattleViewModel.Fighters = {}
    BattleViewModel.AtkOrders = {}
    BattleViewModel.DamageTotal = {}
    BattleViewModel.isLeftWin = video.leftWin
    BattleViewModel.hitAniStep = VideoCheckPoint.VTurnStart;
    for index, fighter in ipairs(video.fighters) do
        local data = RoleBattleData.New()
        data:InitWithVideoInfo(fighter)
        BattleViewModel.Fighters[data.uid] = data
    end
    print("NewBattle fighter:"..serpent.block(BattleViewModel.Fighters))
    for index, video in ipairs(video.videos) do
        if BattleViewModel.BattleVideo[video.round] == nil then
            BattleViewModel.BattleVideo[video.round] = {}
        end
        BattleViewModel.BattleVideo[video.round][video.turn] = video
    end
    print("NewBattle videos:"..serpent.block(BattleViewModel.BattleVideo))
    print("NewBattle video length:"..#BattleViewModel.BattleVideo)
    if nil ~= video.atkOrders then
        for index, order in pairs(video.atkOrders) do
            BattleViewModel.AtkOrders[order.round] = order
        end
    end
    print("NewBattle orders:"..serpent.block(BattleViewModel.AtkOrders))
    BattleLogger.log(video);
end

function BattleViewModel.StartPlayVideo()
    BattleViewModel.GamePause(BattleViewModel.StartPlayVideo)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    BattleViewModel.RoundCount = 0
    BattleViewModel.TurnCount = 0
    MgrCamera.BackToRoundEndPosition()
    CJNBattleMgr.Instance:RegisterSpine(BattleViewModel.handleSpineEvent)
    CJNBattleMgr:SetRoundUIZore()
    CJNBattleMgr:GameStartPanel()
    MgrTimer.AddBattleDelay("ShowGameStart",2,BattleViewModel.PlayBattleStart,nil)
    MgrTimer.AddBattleDelay("RoundStart",3,BattleViewModel.CheckNext,nil)
end

function BattleViewModel.PlayBattleStart()
    if BattleViewModel.BattleVideo[0] == nil then
        return
    end
    local data = BattleViewModel.BattleVideo[0][0]
    if data == nil then
        return
    end
    print("PlayBattleStart data:"..serpent.block(data))
    for index, value in ipairs(data.actions) do
        if value.checkPt == VideoCheckPoint.VDead then
            MgrTimer.AddBattleDelay("DuelDead" .. index,1, function()
                BattleViewModel.PlayDeath(value, nil);
            end,nil)
        else
            for i, v in ipairs(value.skills) do
                if v.changes ~= nil then
                    BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                    BattleViewModel.UpdateStatus(v.changes)
                    BattleViewModel.ShowAllDamage(v.changes)
                end
            end
        end
    end
end

function BattleViewModel.CheckNext()
    BattleViewModel.GamePause(BattleViewModel.CheckNext)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    BattleViewModel.TurnCount = BattleViewModel.TurnCount + 1
    BattleViewModel.HitPlay = false
    print("CheckNext round:"..BattleViewModel.RoundCount)
    print("CheckNext turn:"..BattleViewModel.TurnCount)
    if BattleViewModel.BattleVideo[BattleViewModel.RoundCount] == nil or BattleViewModel.BattleVideo[BattleViewModel.RoundCount][BattleViewModel.TurnCount] == nil then
        BattleViewModel.RoundCount = BattleViewModel.RoundCount + 1
        if BattleViewModel.BattleVideo[BattleViewModel.RoundCount] == nil then
            BattleViewModel.GiveUp = BattleViewModel.giveUp.DONE
            CJNBattleMgr.SetGameSpeed(1)
            BattleViewModel.JumpOut = true
            BattleViewModel.ReturnToMainScene()
            return
        end
        BattleViewModel.TurnCount = 0
        BattleViewModel.CheckSecondBattle()
    else
        BattleViewModel.PlayNextTurn()
    end
end

function BattleViewModel.CheckSecondBattle()
    BattleViewModel.GamePause(BattleViewModel.RoundStartAni)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    BattleViewModel.CurRoundStartInfo = {}
    local data = BattleViewModel.BattleVideo[BattleViewModel.RoundCount][0]
    if data == nil then
        BattleViewModel.RoundStartAni()
        return
    end
    if data.actions[1].checkPt == VideoCheckPoint.VNextBattle then
        for key, value in pairs(data.actions) do
            if value.checkPt ~= VideoCheckPoint.VNextBattle then
                table.insert(BattleViewModel.CurRoundStartInfo, value)
            end
        end
        BattleViewModel.TrunSecondPhase(data.actions[1], BattleViewModel.RoundStartAni)
    else
        BattleViewModel.CurRoundStartInfo = data.actions
        BattleViewModel.RoundStartAni()
    end
end

function BattleViewModel.RoundStartAni()
    SettingViewModel.SetBattleSpeed(SettingViewModel.GetBattleSpeed())
    print("BattleViewModel RoundStartAni start")
    BattleViewModel.GamePause(BattleViewModel.RoundStartAni)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    BattleViewModel.RefreshRoundStartHeadIcon()
    if BattleViewModel.RoundCount == 1 then
        print("BattleViewModel RoundStartAni:"..BattleViewModel.RoundCount)
        Event.Go("BtnPauseDelay_Battle02")
        if BattleManager.GameMode == BattleManager.GameModeType.FriendPVP or
           BattleManager.GameMode == BattleManager.GameModeType.MonthTower or
           BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or
           BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss
        then
            Event.Go("BtnFriendTiaoGuo_Battle02")
        end
    end
    MgrTimer.AddBattleDelay("SetRoundUI",1,function() CJNBattleMgr:SetRoundUI() end,nil)
    MgrTimer.AddBattleDelay("RoundStartSkills",3,BattleViewModel.RoundStartSkills,nil)
end

function BattleViewModel.RoundStartSkills()
    BattleViewModel.GamePause(BattleViewModel.RoundStartSkills)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    if next(BattleViewModel.CurRoundStartInfo) == nil then
        BattleViewModel.CheckNext()
        return
    end
    for index, value in ipairs(BattleViewModel.CurRoundStartInfo) do
        for i, v in ipairs(value.skills) do
            if v.skillID == 59999 and not BattleViewModel.isShowKuangbao then
                BattleViewModel.isShowKuangbao = true
                MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/Ui_QuanPingKuangBao.prefab',function(go)
                    BattleManager.CjnMgr:SetEffectChild(go)
                end)
            end
            if v.changes ~= nil then
                BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                BattleViewModel.UpdateStatus(v.changes)
                BattleViewModel.ShowAllDamage(v.changes)
            end
        end
    end
    MgrTimer.AddBattleDelay("RoundStartCheck",2,BattleViewModel.CheckNext,nil)
end

function BattleViewModel.TurnStartCamMove()
    BattleViewModel.GamePause(BattleViewModel.TurnStartCamMove)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    BattleViewModel.PhaseIndex = 0
    BattleViewModel.CurData = BattleViewModel.BattleVideo[BattleViewModel.RoundCount][BattleViewModel.TurnCount]
    CJNBattleMgr:TurnAddOne()
    MgrCamera.ChangeBlendTime(1)
    if SettingViewModel.GetCameraMove() == 1 then
        MgrCamera.MoveToCharacter(BattleViewModel.CurData.atk)
    end
    local roleData= BattleManager.AllRole[BattleViewModel.CurData.atk]
    if roleData then
        roleData.myAni:ShowBigDrawing()
        if BattleViewModel.TurnCount ~= 1 then
            roleData.myAni:NextIcon(1,1)
        end
    end
    MgrTimer.AddBattleDelay("CheckNextPhase",MgrCamera.timeToCharacter,BattleViewModel.CheckNextPhase,nil)
end

function BattleViewModel.CheckNextPhase()
    BattleViewModel.GamePause(BattleViewModel.CheckNextPhase)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    print("Start CheckNextPhase")
    BattleViewModel.PhaseIndex = BattleViewModel.PhaseIndex + 1
    if BattleViewModel.PhaseIndex > #BattleViewModel.CurData.actions then

        -- 该方法会修改 UI 内的数据，与逻辑数据无关。该方法必须传个参。
        CBattleTools.AllBuffTurnMinusOne(function()  end)
        for key, value in pairs(BattleViewModel.Fighters) do
            value:AutoMinusBuffDuration()
        end
        BattleViewModel.RefreshTurnHeadIcon()
        -- BattleViewModel.AtkBack(function ()
            local role = BattleManager.AllRole[BattleViewModel.CurData.atk]
            NoviceViewModel.CheckCurID(50114,function()
                ---如果角色id和回合数正确
                if tonumber(role.ID) == 90001 and BattleViewModel.RoundCount == 1 then
                    ---斯卡蒂行动后暂停
                    CJNBattleMgr.Instance.IsPause = true
                    NoviceViewModel.DoNext()
                end
            end)
            NoviceViewModel.CheckCurID(50317,function()
                ---如果角色id和回合数正确
                if tonumber(role.ID) == 12002 and BattleViewModel.RoundCount == 1 then
                    ---不知火行动后暂停
                    CJNBattleMgr.Instance.IsPause = true
                    MgrTimer.AddDelayNoName(1,function()
                        NoviceViewModel.DoNext()
                    end,nil)
                end
            end)
            NoviceViewModel.CheckCurID(50327,function()
                ---如果角色id和回合数正确
                if tonumber(role.ID) == 12002 and BattleViewModel.RoundCount == 2 then
                    ---不知火行动后暂停
                    CJNBattleMgr.Instance.IsPause = true
                    NoviceViewModel.DoNext()
                end
            end)
            NoviceViewModel.CheckCurID(50528,function()
                ---如果角色id和回合数正确
                if tonumber(role.ID) == 10013 and BattleViewModel.RoundCount == 1 then
                    ---斯卡蒂行动后
                    CJNBattleMgr.Instance.IsPause = true
                    NoviceViewModel.DoNext()
                end
            end)
            BattleViewModel.CheckNext()
        -- end)
        return
    end
    local info = BattleViewModel.CurData.actions[BattleViewModel.PhaseIndex]
    BattleViewModel.hitAniStep = info.checkPt
    Event.Clear("PlayNormalEnd")
    Event.Clear("ZjPlayEnd")
    print("CheckNextPhase phase:"..info.checkPt)
    if info.checkPt == VideoCheckPoint.VTurnStart then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VOnAtk then
        BattleViewModel.StartAtk()
    elseif info.checkPt == VideoCheckPoint.VBefAtk then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VBefSubAtk then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAtkDmg then
        BattleViewModel.NormalAtk()
    elseif info.checkPt == VideoCheckPoint.VAftSubAtk then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAftAtK then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VTurnEnd then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VTurnBuff then
        BattleViewModel.ShowTurnBuff(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VDead then
        BattleViewModel.PlayKillVoice(info)
        BattleViewModel.PlayDeath(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VCharge then
        BattleViewModel.PlayCharge()
    elseif info.checkPt == VideoCheckPoint.VFrozen then
        MgrTimer.AddBattleDelay("VFrozen",2,BattleViewModel.CheckNextPhase,nil)
    elseif info.checkPt == VideoCheckPoint.VSummon then
    elseif info.checkPt == VideoCheckPoint.VCastSkill then
    elseif info.checkPt == VideoCheckPoint.VRoundEnd then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAfterDead then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VResurrection then
        BattleViewModel.ShowResurrection(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAftResurrection then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VNextBattle then
        BattleViewModel.TrunSecondPhase(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAtkBack then
        BattleViewModel.AtkBack(BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VAtkTrigger then
        BattleViewModel.SortSkills(info, BattleViewModel.CheckNextPhase)
    elseif info.checkPt == VideoCheckPoint.VDuelWin or info.checkPt == VideoCheckPoint.VDuelLose then
        BattleViewModel.SortSkills(info, function()
            MgrTimer.AddBattleDelay("VDuel", 0, BattleViewModel.CheckNextPhase,nil);
        end);
    end
end

function BattleViewModel.PlayNextTurn()
    BattleViewModel.TurnStartCamMove()
end

function BattleViewModel.StartAtk()
    BattleViewModel.GamePause(BattleViewModel.StartAtk)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    print("Start StartAtk")
    local roleData = BattleManager.AllRole[BattleViewModel.CurData.atk]
    -- print("StartAtk roleData:"..serpent.block(roleData))
    if roleData then
        --如果是蓄力角色,关闭蓄力状态
        if roleData.Occupation==3 then
            roleData.myAni:OutXL()
        end
    end
    local hitData = BattleManager.AllRole[BattleViewModel.CurData.def]
    if roleData ~= nil and hitData ~= nil then
        local temp = BattleViewModel.CheckBeHitRoles(BattleViewModel.CurData)
        print("StartAtk hitEnemy:"..serpent.block(temp))
        CMgrCamera.Instance:SetFade2(BattleViewModel.CurData.atk, temp, true)    --隐藏未被攻击人
        if roleData.Attackmode ~=1 then
            local flytime = roleData.myAni:GetFlyTime(roleData.myAni,hitData.myAni)
            print("StartAtk flytime:"..flytime)
            if flytime>0.001 then
                roleData.myAni:StartBefAtkFly()
                --延迟调用普攻
                MgrTimer.AddBattleDelay("StartAtk",flytime,BattleViewModel.CheckNextPhase,nil)

            else
                --直接调用普攻
                MgrTimer.AddBattleDelay("StartAtk",0,BattleViewModel.CheckNextPhase,nil)
            end
        else
            --直接调用普攻
            MgrTimer.AddBattleDelay("StartAtk",0,BattleViewModel.CheckNextPhase,nil)
        end
    end
end

function BattleViewModel.NormalAtk()
    BattleViewModel.GamePause(BattleViewModel.NormalAtk)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    print("Play Normal Atk")
    local roleData= BattleManager.AllRole[BattleViewModel.CurData.atk]
    local HitData= BattleManager.AllRole[BattleViewModel.CurData.def]
    if roleData ~= nil and HitData ~= nil then
        BattleViewModel.gjHitCount = 1
        roleData.myAni:Loop_AtkAtk(HitData.myAni)   --普通攻击 + 震动
        MgrCamera.CameraShake(roleData.myAni)           --震动
    end
end

function BattleViewModel.SortSkills(info, callback)
    local exBefNormal = false
    local normalList = {}
    local exList = {}
    for i = 1, #info.skills, 1 do
        local v = info.skills[i]
        if v.skillID ~= 0 then
            if BattleViewModel.IsExSkill(v.skillID) then
                if i == 1 then
                    exBefNormal = true
                end
                table.insert(exList, v)
            else
                table.insert(normalList, v)
            end
        elseif v.changes then
            --- 无技能纯变化的数据也要处理
            --- 考虑到顺序要依赖传入顺序，因此不得不加入 normalList
            table.insert(normalList, v)
        end
    end
    BattleViewModel.PlaySkills(exBefNormal, exList, normalList, callback)
end

function BattleViewModel.PlaySkills(exBefNormal, exList, normalList, callback)
    if exBefNormal then
        BattleViewModel.PlayExs(exList, function ()
            print("PlayNormals after EX")
            BattleViewModel.PlayNormals(normalList, callback)
        end)
    else
        BattleViewModel.PlayNormals(normalList, function ()
            print("PlayExs after Normal")
            BattleViewModel.PlayExs(exList, callback)
        end)
    end
end

function BattleViewModel.PlayExs(exList, callback)
    print("Start PlayExs")
    if #exList == 0 then
        callback()
        return
    end
    local totalTime = 0
    local exTab = {}
    for index = 1, #exList, 1 do
        local info = exList[index]
        if exTab[info.atk] == nil then
            exTab[info.atk] = {}
        end
        table.insert(exTab[info.atk], info)
    end
    for key, value in pairs(exTab) do
        local einfo = BattleViewModel.GetExEffectInfo(value)
        if einfo ~= nil and (SettingViewModel.GetExAnim() == 1 or (SettingViewModel.GetExAnim() == 2 and not BattleViewModel.CheckDailyExPlay(key))) then
            MgrTimer.AddBattleDelay("ExAni"..key,totalTime,function ()
                BattleViewModel.PlayExAni(key, einfo, value)
            end,nil)
            local time = BattleViewModel.GetExTime(key, einfo)
            totalTime = totalTime + time + 0.5
        else
            MgrTimer.AddBattleDelay("ExAni",totalTime,function ()
                for k, v in pairs(value) do
                    local info = v
                    if info.changes ~= nil then
                        BattleViewModel.ShowBuffIcons(info.atk, info.changes)
                        BattleViewModel.UpdateStatus(info.changes)
                        BattleViewModel.CheckNeedHitAni(info.atk, info.changes)
                        BattleViewModel.ShowAllDamage(info.changes)
                    end
                end
            end,nil)
            totalTime = totalTime + 0.5
        end
    end
    MgrTimer.AddBattleDelay("ExEnd"..BattleViewModel.hitAniStep,totalTime,callback,nil)
end

function BattleViewModel.GetExTime(atkId, eInfo)
    local endTime = eInfo[3]
    local delay = 0.2
    local delay2 = 1.2
    local xlPrefabStr = eInfo[12]
    if xlPrefabStr ~= "0" then
        local xlStr = string.split(xlPrefabStr,",")
        if xlStr[2] ~= nil then
            delay2 = tonumber(xlStr[2]) > delay2 and tonumber(xlStr[2]) or delay2
        end
    end
    local prefabStr = eInfo[7]
    local effectTime = 0
    if prefabStr ~= "0" then
        --预制体加载,攻击特效,拆解预制体字段
        local info = string.split(prefabStr,";")
        effectTime = CEffectVideo.Instance:ReturnCurrentExTotalTime(info[1])
    end
    local roleData= BattleManager.AllRole[atkId]
    local exActTime = roleData.myAni:GetAniTime("ex")
    local actBefOrAft = eInfo[23]
    if exActTime >= effectTime then
        if actBefOrAft == "0" then
            return endTime + delay + delay2 + effectTime    ---动作处于ex动画前开始
        else
            return endTime + delay + delay2 + exActTime     ---动作处于ex动画后开始
        end
    else
        return endTime + delay + delay2 + effectTime
    end
end

function BattleViewModel.PlayExAni(atkId, eInfo, exInfos)
    local roleData = BattleManager.AllRole[atkId]
    local defId = exInfos[1].def
    local targetData = BattleManager.AllRole[defId]
    local whetherPlayVideo = eInfo[4]
    local Sound_Delay = eInfo[8]
    local SoundName = eInfo[9]
    local prefabStr = eInfo[7]
    local xlPrefabStr = eInfo[12]
    local position = eInfo[15]
    local endTime = eInfo[3]
    local SpinePos = roleData.EXCutInPos
    local actBefOrAft = eInfo[23]
    local BossSoundName = eInfo[24]

    local uid = PlayerControl.GetPlayerData().UID
    UnityEngine.PlayerPrefs.SetInt("St_ExPlayTime"..uid.."_"..roleData.ID, Global.GetCurTime())

    --游戏速度设为1
    CJNBattleMgr.Instance:SetSpeedOne()
    --隐藏除自己外的所有人
    CJNBattleMgr.Instance:LuaSetRoleUI(roleData.myAni,whetherPlayVideo == "y")
    CJNBattleMgr.Instance:LuaHidAll(whetherPlayVideo == "y")
    --记录攻击者和被攻击者
    CEffectVideo.Instance:LuaRecordAtkRole(roleData.myAni)
    CEffectVideo.Instance:LuaRecordHitRole(targetData.myAni)

    local delay = 0.2
    local delay2 = 1.2
    local xlStr = {}
    if xlPrefabStr ~= "0" then
        local xlStr = string.split(xlPrefabStr,",")
        if xlStr[2] ~= nil then
            delay2 = tonumber(xlStr[2]) > delay2 and tonumber(xlStr[2]) or delay2
        end
    end
    roleData.myAni:EXCameraMove(delay,delay2,xlStr[1],SettingViewModel.GetCameraMove() == 2 or roleData.myAni.IsWorldBoss)
    if whetherPlayVideo == "y" then
        CEffectVideo.Instance:New_LoadUsm(tonumber(roleData.ID))
    end
    BattleViewModel.EX_CutIn(tonumber(roleData.SkinID == nil and roleData.ID or roleData.SkinID),roleData,SpinePos,whetherPlayVideo)
    if whetherPlayVideo == "y" then
        ---播放动画
        MgrTimer.AddBattleDelay("EXPlay",delay + delay2,function()
            if actBefOrAft == "0" then
                roleData.myAni:LuaSetAni(0, "ex", true)    --播放ex动画
                roleData.myAni:LuaSetAni(roleData.myAni:GetAniTime("ex"), "dj", true)
            end
            roleData.myAni:PlayRoleEX()     --声音
            --roleData.myAni:PlayExEffVoice(SoundName,Sound_Delay)    --音效
            MgrSound.PlayFight(SoundName,1,Sound_Delay*1000,false,0,0,"ExRadio")
            CEffectVideo.Instance:LuaExVideoOnly(endTime)
        end,nil)

        ---播放动作
        MgrTimer.AddBattleDelay("EX_End",endTime + delay + delay2,function()
            if actBefOrAft == "1" then
                roleData.myAni:LuaSetAni(0, "ex", true)    --播放ex动画
                roleData.myAni:LuaSetAni(roleData.myAni:GetAniTime("ex"), "dj", true)
            end
            --MgrSound.Stop(4,"ExRadio",false)
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(targetData.GameID)
            end
            CJNBattleMgr.Instance:ShowAll()
            CJNBattleMgr.Instance:SetPreviousSpeed()    --速度恢复
            roleData.myAni:BillBoarderOn()
        end,nil)
    else
        MgrTimer.AddBattleDelay("EXPlay",delay+delay2,function()
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(targetData.GameID)
            end
            roleData.myAni:LuaSetAni(0, "ex", true);    --播放ex动画
            roleData.myAni:LuaSetAni(roleData.myAni:GetAniTime("ex"), "dj", true);
            roleData.myAni:PlayRoleEX()
            --MgrSound.PlayFight(SoundName,1,Sound_Delay*1000,false,0,0,"ExRadio")
            MgrSound.PlayFightLap(BossSoundName,1,Sound_Delay*1000,false,0,0)
        end,nil)
    end
    local effectTime = 0
    if prefabStr ~= "0" then
        --预制体加载,攻击特效,拆解预制体字段
        local info = string.split(prefabStr,";")
        MgrTimer.AddBattleDelay("EX_Effect",endTime + delay + delay2,function()
            --MgrSound.Stop(4,"ExRadio",false)
            --LuaOnlyExEffect                     名字    哪个位置            位置         在右边且为角色怪
            CEffectVideo.Instance:LuaOnlyExEffect(info[1],tonumber(info[2]),position, not roleData.IsLeft and HeroControl.GetOriginalHero(tonumber(roleData.ID)) ~= nil)   --表第7列 15列
            CJNBattleMgr.Instance:SetPreviousSpeed()    --速度恢复
        end,nil)
        effectTime = CEffectVideo.Instance:ReturnCurrentExTotalTime(info[1])
    end
    local exActTime = roleData.myAni:GetAniTime("ex")
    local time = 0
    if exActTime >= effectTime then
        if actBefOrAft == "0" then
            time = endTime + delay + delay2 + effectTime    ---动作处于ex动画前开始
        else
            time = endTime + delay + delay2 + exActTime     ---动作处于ex动画后开始
        end
    else
        time = endTime + delay + delay2 + effectTime
    end
    print("PlayExAni time:"..time)
    MgrTimer.AddBattleDelay("UseEx",time + 0.4,function ()
        for k, v in pairs(exInfos) do
            local exInfo = v
            if exInfo.changes ~= nil then
                BattleViewModel.ShowBuffIcons(exInfo.atk, exInfo.changes)
                BattleViewModel.UpdateStatus(exInfo.changes)
                BattleViewModel.CheckNeedHitAni(exInfo.atk, exInfo.changes)
                BattleViewModel.ShowAllDamage(exInfo.changes)
            end
        end
    end,nil)
end

function BattleViewModel.EX_CutIn(_RoleId,roleData,SpinePos,whetherPlayVideo)
    if RoleattributeLocalData.tab[_RoleId] == nil then  --boss
        local x = 0
        local y = 0
        local scale = nil
        if SpinePos ~= "0" then
            local str = string.split(SpinePos,";")
            x = tonumber(string.split(str[1],",")[1])
            y = tonumber(string.split(str[1],",")[2])
            scale = tonumber(str[2])
        end
        local cell = function(...)
            MgrRes.LoadWatch3DSpine(..., _RoleId, x, y, scale, nil, function(obj)
                CJNBattleMgr.Instance:SetLayer(obj,"Ex")
                CEffectVideo.Instance:AddSpineDofade(obj,0.6,0,1.4)
            end)
        end
        CEffectVideo.Instance:LoadCutIn(roleData.Occupation,cell)
        if whetherPlayVideo == "y" then
            CEffectVideo.Instance:PlayOneSec()  --只播放一帧暂停
        end
    else
        local x = 0
        local y = 0
        local scale = nil
        if SpinePos ~= "0" then
            local str = string.split(SpinePos,";")
            x = tonumber(string.split(str[1],",")[1])
            y = tonumber(string.split(str[1],",")[2])
            scale = tonumber(str[2])
        end
        local cell = function(...)
            MgrRes.LoadWatch3DSpine(..., _RoleId, x, y, scale, nil, function(obj)
                CJNBattleMgr.Instance:SetLayer(obj,"Ex")
                CEffectVideo.Instance:AddSpineDofade(obj,0.6,0,1.4)
            end)
        end
        CEffectVideo.Instance:LoadCutIn(roleData.Occupation,cell)
        if whetherPlayVideo == "y" then
            CEffectVideo.Instance:PlayOneSec()  --只播放一帧暂停
        end
    end
    MgrSound.PlayEffect("yx_ui_cut_in",1,0,false,0,0,"yx_ui_cut_in")
end

function BattleViewModel.GetExEffectInfo(list)
    for i = 1, #list, 1 do
        local info = list[i]
        local skilldata = SkillLocalData.tab[math.abs(info.skillID)]
        local effectid = tonumber( JNStrTool.strSplit("_", skilldata[5])[1])
        if Special_effectLocalData.tab[effectid] ~= nil then
            return Special_effectLocalData.tab[effectid]
        end
    end
end

function BattleViewModel.PlayNormals(normalList, callback)
    print("Start PlayNormals")
    if #normalList == 0 then
        callback()
        return
    end

    if BattleViewModel.hitAniStep == VideoCheckPoint.VBefAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftAtK then
        BattleViewModel.CurNormalList = normalList
        BattleViewModel.CurNormalIdx = 0
        Event.Add("PlayNormalEnd", function ()
            Event.Clear("PlayNormalEnd")
            Event.Clear("ZjPlayEnd")
            if callback then
                callback()
            end
        end)

        Event.Add("ZjPlayEnd", function ()
            MgrTimer.AddBattleDelay("PlayNextNormal",BattleViewModel.NormalDuration,function ()
                MgrTimer.Cancel2("PlayNextNormal")
                BattleViewModel.PlaySingleNormal()
            end,nil)
        end)

        BattleViewModel.PlaySingleNormal()
    elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefSubAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftSubAtk then
        BattleViewModel.CurNormalTab = {}
        BattleViewModel.CurNormalIdxTab = {}
        BattleViewModel.zjHitCountTab = {}
        for i, v in ipairs(normalList) do
            if BattleViewModel.CurNormalTab[v.atk] == nil then
                BattleViewModel.CurNormalTab[v.atk] = {}
            end
            table.insert(BattleViewModel.CurNormalTab[v.atk], v)
            if BattleViewModel.CurNormalIdxTab[v.atk] == nil then
                BattleViewModel.CurNormalIdxTab[v.atk] = 0
            end
        end
        BattleViewModel.TotalNormalCount = 0
        BattleViewModel.FinishedCount = 0

        Event.Add("PlayNormalTabEnd", function ()
            BattleViewModel.FinishedCount = BattleViewModel.FinishedCount + 1
            if BattleViewModel.FinishedCount >= BattleViewModel.TotalNormalCount then
                Event.Clear("PlayNormalTabEnd")
                Event.Clear("ZjPlayEnd")
                if callback then
                    callback()
                end
            end
        end)

        Event.Add("ZjPlayEnd", function (atkId)
            MgrTimer.AddBattleDelay("PlayNextNormal"..atkId,BattleViewModel.NormalDuration,function ()
                MgrTimer.Cancel2("PlayNextNormal"..atkId)
                BattleViewModel.PlaySingleNormalinTab(atkId)
            end,nil)
        end)

        for atkId, value in pairs(BattleViewModel.CurNormalTab) do
            BattleViewModel.TotalNormalCount = BattleViewModel.TotalNormalCount + 1
            BattleViewModel.PlaySingleNormalinTab(atkId)
        end
    else
        for i, v in ipairs(normalList) do
            if v.changes ~= nil then
                BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                BattleViewModel.UpdateStatus(v.changes)
                BattleViewModel.ShowAllDamage(v.changes)
                BattleViewModel.CheckNeedHitAni(v.atk, v.changes)
            end
        end
        if callback then
            callback()
        end
    end
end

function BattleViewModel.PlaySingleNormal()
    print("Start PlaySingleNormal")
    BattleViewModel.CurNormalIdx = BattleViewModel.CurNormalIdx + 1
    if BattleViewModel.CurNormalIdx > #BattleViewModel.CurNormalList then
        Event.Go("PlayNormalEnd")
        return
    end
    local v = BattleViewModel.CurNormalList[BattleViewModel.CurNormalIdx]

    --- 新增对 skillId=0 的保险处理
    if v.skillID == 0 then
        Global.LogError("PlayerSingleNormal处理了skillID=0的数据")
        if v.changes then
            BattleViewModel.ShowBuffIcons(v.atk, v.changes)
            BattleViewModel.UpdateStatus(v.changes)
            BattleViewModel.CheckNeedHitAni(v.atk, v.changes)
            BattleViewModel.ShowAllDamage(v.changes)
        end
        BattleViewModel.PlaySingleNormal()
        return
    end
    
    print("PlaySingleNormal info:"..serpent.block(v))
    local roleData = BattleManager.AllRole[v.atk]
    print("PlaySingleNormal roleData:"..serpent.block(roleData))
    local skilldata = SkillLocalData.tab[v.skillID]
    if skilldata[3] ~= "0" and skilldata[3] ~= 0 then --是否有追击字段
        if roleData ~= nil and skilldata[40] == tonumber(roleData.ID) then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 then
                roleData.myAni:RealStataAni("zj",false)
                if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then      --是否有追击特效
                    BattleViewModel.UseEffect(v.atk, v.def, v.skillID, true, roleData.ZJEffectId_str)
                end
                BattleViewModel.zjHitCount = 1
                return
            end
        end
    end
    
    if v.changes ~= nil then
        BattleViewModel.ShowBuffIcons(v.atk, v.changes)
        BattleViewModel.UpdateStatus(v.changes)
        BattleViewModel.CheckNeedHitAni(v.atk, v.changes)
        BattleViewModel.ShowAllDamage(v.changes)
    end
    MgrTimer.AddBattleDelay("PlayNextNormal",BattleViewModel.NormalDuration,function ()
        MgrTimer.Cancel2("PlayNextNormal")
        BattleViewModel.PlaySingleNormal()
    end,nil)
end

function BattleViewModel.PlaySingleNormalinTab(atkId)
    print("Start PlaySingleNormalinTab")
    BattleViewModel.CurNormalIdxTab[atkId] = BattleViewModel.CurNormalIdxTab[atkId] + 1
    if BattleViewModel.CurNormalIdxTab[atkId] > #BattleViewModel.CurNormalTab[atkId] then
        Event.Go("PlayNormalTabEnd")
        return
    end
    local v = BattleViewModel.CurNormalTab[atkId][BattleViewModel.CurNormalIdxTab[atkId]]

    --- 新增对 skillId=0 的保险处理
    if v.skillID == 0 then
        Global.LogError("PlaySingleNormalinTab处理了skillID=0的数据")
        if v.changes then
            BattleViewModel.ShowBuffIcons(v.atk, v.changes)
            BattleViewModel.UpdateStatus(v.changes)
            BattleViewModel.CheckNeedHitAni(v.atk, v.changes)
            BattleViewModel.ShowAllDamage(v.changes)
        end
        BattleViewModel.PlaySingleNormalinTab(atkId)
        return
    end
    
    local roleData = BattleManager.AllRole[v.atk]
    local skilldata = SkillLocalData.tab[v.skillID]
    if skilldata[3] ~= "0" and skilldata[3] ~= 0 then --是否有追击字段
        if skilldata[40] == tonumber(roleData.ID) then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 then
                roleData.myAni:RealStataAni("zj",false)
                if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then      --是否有追击特效
                    BattleViewModel.UseEffect(v.atk, v.def, v.skillID, true, roleData.ZJEffectId_str)
                end
                BattleViewModel.zjHitCountTab[atkId] = 1
                return
            end
        end
    end
    if v.changes ~= nil then
        BattleViewModel.ShowBuffIcons(v.atk, v.changes)
        BattleViewModel.UpdateStatus(v.changes)
        BattleViewModel.CheckNeedHitAni(v.atk, v.changes)
        BattleViewModel.ShowAllDamage(v.changes)
    end

    MgrTimer.AddBattleDelay("PlayNextNormal"..atkId, BattleViewModel.NormalDuration,function ()
        MgrTimer.Cancel2("PlayNextNormal"..atkId)
        BattleViewModel.PlaySingleNormalinTab(atkId)
    end,nil)
end

function BattleViewModel.PlayCharge()
    BattleViewModel.GamePause(BattleViewModel.PlayCharge)
    if BattleViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if BattleViewModel.JumpOut then
        return
    end
    -- local role = BattleViewModel.Fighters[BattleViewModel.CurData.atk]
    local roleData= BattleManager.AllRole[BattleViewModel.CurData.atk]
    if roleData then
        --print("inxl roledata:"..turn.atkId)
        roleData.myAni:InXL(true)
    end
    CMgrCamera.Instance:SetFade2(BattleViewModel.CurData.atk, {}, true)
end

function BattleViewModel.IsExSkill(skillId)
    local config = SkillLocalData.tab[skillId]
    if config == nil then
        print("error skillId:"..skillId)
        return false
    else
        if config[9] == 1 then
            return true
        end
        return false
    end
end

function BattleViewModel.UpdateStatus(changes)
    print("UpdateStatus:"..serpent.block(changes))
    for i1, v1 in ipairs(changes) do
        if v1.props ~= nil then
            BattleViewModel.Fighters[v1.uID]:UpdateProps(v1.props, false)
        end
        if v1.buffs ~= nil then
            BattleViewModel.Fighters[v1.uID]:UpdateBuffs(v1.buffs)
        end
    end
end

function BattleViewModel.ShowBuffIcons(atk, changes)
    for i1, v1 in ipairs(changes) do
        BattleViewModel.UseSkill(v1)
        if v1.buffs ~= nil then
            for i2, v2 in ipairs(v1.buffs) do
                if v2.duration ~= 0 then
                    local sID = math.modf(v2.skillID/100)
                    local skilldata = SkillLocalData.tab[math.abs(sID)]
                    local skilleff = skilldata[5]
                    if skilleff ~= 0 and skilleff ~= "0" then
                        BattleViewModel.UseEffect(atk, v1.uID, sID, true, skilleff, i2 ~= 1)
                    end
                    BattleViewModel.AddBuffIcon(v1.uID, sID, v2.duration)
                end
            end
        end
    end
end

function BattleViewModel.AddBuffIcon(_hitId, _buffId, _buffTime)
    local skilldata=SkillLocalData.tab[math.abs(_buffId)]
    if skilldata == nil then
        return
    end
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil and not roleData.Remove then
        roleData.myAni:AddBuff( _buffId, skilldata[13], _buffTime, skilldata[33])
    end
end

function BattleViewModel.UseSkill(info)
    if info.damage == nil then
        return
    end
    local type = math.modf((math.abs(info.damage[1]) % 10000)/10)
    if type == 62 then
        local roleData= BattleManager.AllRole[info.uID]
        if roleData ~= nil then
            roleData.myAni:InXL(true)
        end
    end
end

--使用特效
function BattleViewModel.UseEffect(_atkId, _hitId, _skillId, _IsMianTar, _skilleff, _NotInSound)
    local skillEffect = SkillLocalData.tab[_skillId][20]    --技能伤害效果
    if (_atkId ~= _hitId and tonumber(string.split(skillEffect,"_")[1]) == 29) then    --被反伤不显示特效
        return
    end
    if (_atkId == _hitId and tonumber(string.split(skillEffect,"_")[1]) == 10) then    --水蛇对自己伤害不显示特效
        return
    end
    local effectTab = JNStrTool.SubAtkEffectId(_skilleff)   --_skilleff：技能表第五列  effectTab：技能ID表
    for key, value in pairs(effectTab) do
        for k, v in pairs(value) do
            if 68999 < tonumber(v[1]) and tonumber(v[1]) < 69999 and BattleManager.AllRole[_hitId] and BattleManager.AllRole[_hitId].myAni.IsWorldBoss then
                --print("世界boss不显示部分特效")
            else
                --print(atkId .. "释放特效:" .. tonumber(v[1]) .. "攻击" .. _hitId)
                if BattleViewModel.PlayEffectToMinorTarget(v[1], _IsMianTar) then
                    JNTurnEffectMgr.CreatEffTo_Action_Show( 0, false, _atkId, _hitId, _IsMianTar, {v}, 1, 0, 0, _NotInSound) --创建特效并播放
                end
            end
        end
    end
end

function BattleViewModel.PlayEffectToMinorTarget(effectId, _IsMianTar)
    if Special_effectLocalData.tab[tonumber(effectId)][25] == 1 and not _IsMianTar then
        return false
    else
        return true
    end
end

function BattleViewModel.ShowHitAni(hitId)
    local hitData = BattleManager.AllRole[hitId]
    local aniTime = 0
    if hitData then
        print("ShowHitAni1", hitId)
        aniTime = hitData.myAni:GetAniTime("sj")
        if aniTime > 0.01 then
            print("ShowHitAni2", hitId)
            hitData.myAni:RealStataAni("sj",false)
        end
    end
end

function BattleViewModel.CheckNeedHitAni(atkId, changes)
    print("CheckNeedHitAni:"..serpent.block(changes))
    local temp = {}
    for i1, v1 in ipairs(changes) do
        local type = 0
        local value = 0
        if v1.damage ~= nil then
            print("CheckNeedHitAni damage:"..v1.damage[1])
            type = math.modf((math.abs(v1.damage[1]) % 10000)/10)
            print("CheckNeedHitAni type:"..type)
            value = math.modf(v1.damage[1]/10000)
            print("CheckNeedHitAni value:"..value)
            if v1.uID ~= atkId and BattleViewModel.isDamageType(type, value) then
                temp[v1.uID] = true
            end
        end
    end
    for key, value in pairs(temp) do
        BattleViewModel.ShowHitAni(key)
    end
end

function BattleViewModel.isDamageType(_skillType, num)
    if _skillType==1 or _skillType==9 or _skillType==11 or _skillType==12 or _skillType==13
     or _skillType==10029 or _skillType==10 or _skillType==72  then
        if num <= 0 then
            return true
        end
    end
    return false
end

function BattleViewModel.CheckBeHitRoles(info)
    local temp = {}
    table.insert(temp, info.def)
    for i = 1, #info.actions, 1 do
        local action = info.actions[i]
        if action.checkPt == VideoCheckPoint.VBefAtk or action.checkPt == VideoCheckPoint.VAftAtK or action.checkPt == VideoCheckPoint.VAtkDmg then
            if action.skills ~= nil then
                for j = 1, #action.skills, 1 do
                    local skill = action.skills[j]
                    if skill.changes ~= nil then
                        for k = 1, #skill.changes, 1 do
                            local change = skill.changes[k]
                            if change.uID ~= info.atk and not table.Contains(temp, change.uID) then
                                table.insert(temp, change.uID)
                            end
                        end
                    end
                end
            end
        end
    end
    return temp
end

function BattleViewModel.ShowAllDamage(changes)
    for i1, v1 in ipairs(changes) do
        if v1.damage ~= nil then
            for i = 1, #v1.damage, 1 do
                local damage = v1.damage[i]
                local shield = 0
                if v1.shield ~= nil and v1.shield[i] then
                    shield = v1.shield[i]
                end
                local _skillType = math.modf((math.abs(damage) % 10000)/10)
                local value = math.modf(damage/10000)
                local state = math.abs(damage) % 10
                if _skillType == 1 or _skillType == 9 or _skillType == 11 or _skillType == 12 or _skillType == 13 or _skillType == 0
                or _skillType == 10029 or _skillType == 10084 or _skillType == 10083 or _skillType == 10 or _skillType == 72 or _skillType == 94 then
                    BattleViewModel.BeHit(v1.uID, value, shield, _skillType, state)
                end
            end
        end
    end
end

function BattleViewModel.ShowDamage(changes, count)
    for i1, v1 in ipairs(changes) do
        if v1.damage ~= nil and v1.damage[count] then
            local damage = v1.damage[count]
            local shield = 0
            if v1.shield ~= nil and v1.shield[count] then
                shield = v1.shield[count]
            end
            local _skillType = math.modf((math.abs(damage) % 10000)/10)
            local value = math.modf(damage/10000)
            local state = math.abs(damage) % 10
            if _skillType == 1 or _skillType == 9 or _skillType == 11 or _skillType == 12 or _skillType == 13
            or _skillType == 10029 or _skillType == 10084 or _skillType == 10083 or _skillType == 10 or _skillType == 72 or _skillType == 94 then
                BattleViewModel.BeHit(v1.uID, value, shield, _skillType, state)
            end
        end
    end
end

function BattleViewModel.BeHit(_roleId, _damage, _shieldNum, _skillType, state)
    if _damage == 0 and _shieldNum == 0 then
        return
    end
    local _isCrit = false
    local _isDodge = false
    if state == 1 then
        _isCrit = true
    elseif state == 2 then
        _isDodge = true
    elseif state == 3 then
        _isCrit = true
        _isDodge = true
    end
    local atkNumberType = -1
    if _damage > 0 then
        atkNumberType = 1
    else
        atkNumberType = 0
        if _skillType then
            atkNumberType = -1
        end
    end
    local roleData= BattleManager.AllRole[_roleId]
    if roleData ~= nil then
        roleData.myAni:BeHit(_isCrit, _damage, _shieldNum, atkNumberType, _isDodge)
    end
    if (BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss) and _roleId == 1 then
        BattleViewModel.BossHurt = BattleViewModel.BossHurt - (_damage + _shieldNum)
        BattleManager.ReturnFightData_Eve(BattleViewModel.BossHurt)
    end
end

function BattleViewModel.ShowTurnBuff(info, callback)
    for i, v in ipairs(info.skills) do
        if v.changes ~= nil then
            -- BattleViewModel.ShowBuffIcons(v.atk, v.changes)
            BattleViewModel.UpdateStatus(v.changes)
            BattleViewModel.ShowAllDamage(v.changes)
        end
    end
    MgrTimer.AddBattleDelay("ShowTurnBuff",2,callback,nil)
end

function BattleViewModel.handleSpineEvent(aniName, eName, gameid)
    local roleData = BattleManager.AllRole[gameid]
    local turn = BattleViewModel.CurData
    if roleData == nil then
        return
    end
    if eName == "Start" then
        if aniName == "gj-0" then
            --播放蓄力语音
            roleData.myAni:PlayInXLSound()
        elseif aniName == "gj-1" then
            --if roleData.Attackmode == 1 then
                roleData.myAni:AtkVoice()
            --end
            local HitData = BattleManager.AllRole[turn.def]
            roleData.myAni:Play_Atk_Effect(HitData.myAni)
        elseif aniName == "zj" then
            roleData.myAni:ZjAtkVoice()
            ---追击震动
            local Shake_Dlay = {}
            local Shake_Dur = {}
            local Shake_Stg = {}
            local Shake_Random = {}
            local Shake_X = {}
            local Shake_Y = {}
            local Shake_Z = {}
            if #roleData.ZJShake ~= 0 then
                for i = 1, #roleData.ZJShake do
                    table.insert(Shake_Dlay,tonumber(roleData.ZJShake[i][1])/30)
                    table.insert(Shake_Dur,tonumber(roleData.ZJShake[i][2]))
                    table.insert(Shake_Stg,tonumber(roleData.ZJShake[i][3]))
                    table.insert(Shake_Random,tonumber(roleData.ZJShake[i][4]))
                    table.insert(Shake_X,tonumber(roleData.ZJShake[i][5]))
                    table.insert(Shake_Y,tonumber(roleData.ZJShake[i][6]))
                    table.insert(Shake_Z,tonumber(roleData.ZJShake[i][7]))
                end
                CMgrCamera.Instance:StartIeSHowShake_C(Shake_Dlay,Shake_Dur,Shake_Stg,Shake_Random,Shake_X,Shake_Y,Shake_Z)
            end
        elseif aniName == "ex" then
            ---追击震动
            local Shake_Dlay = {}
            local Shake_Dur = {}
            local Shake_Stg = {}
            local Shake_Random = {}
            local Shake_X = {}
            local Shake_Y = {}
            local Shake_Z = {}
            if #roleData.EXShake ~= 0 then
                for i = 1, #roleData.EXShake do
                    table.insert(Shake_Dlay,tonumber(roleData.EXShake[i][1])/30)
                    table.insert(Shake_Dur,tonumber(roleData.EXShake[i][2]))
                    table.insert(Shake_Stg,tonumber(roleData.EXShake[i][3]))
                    table.insert(Shake_Random,tonumber(roleData.EXShake[i][4]))
                    table.insert(Shake_X,tonumber(roleData.EXShake[i][5]))
                    table.insert(Shake_Y,tonumber(roleData.EXShake[i][6]))
                    table.insert(Shake_Z,tonumber(roleData.EXShake[i][7]))
                end
                CMgrCamera.Instance:StartIeSHowShake_C(Shake_Dlay,Shake_Dur,Shake_Stg,Shake_Random,Shake_X,Shake_Y,Shake_Z)
            end
        elseif aniName == "sj" then
            roleData.myAni:BecomeRed()
            roleData.sjInterrupt = false;
        end
    elseif eName == "Complete" then
        if aniName == "gj-0" then
            roleData.myAni:RealStataAni("dj", true)
            if turn ~= nil and gameid == turn.atk then
                CMgrCamera.Instance:SetFade2(BattleViewModel.CurData.atk, {}, false);
                BattleViewModel.CheckNextPhase()
            end
        elseif aniName == "gj-1" then
            roleData.myAni:RealStataAni("dj", true)
            if gameid == turn.atk then
                BattleViewModel.CheckNextPhase()
            end
        elseif aniName == "zj" then
            roleData.myAni:RealStataAni("dj", true)
            if BattleViewModel.hitAniStep == VideoCheckPoint.VBefAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftAtK then
                Event.Go("ZjPlayEnd")
            elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefSubAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftSubAtk then
                Event.Go("ZjPlayEnd", gameid)
            end
        elseif aniName == "sj" then
            if roleData.sjInterrupt == false then
                roleData.myAni:RealStataAni("dj", true)
            else
                roleData.sjInterrupt = false;
            end
        end
    elseif eName == "Camera_Move" then
        if turn ~= nil and turn.def ~= 0 then
            --print(turn.atkId .. " 攻击 " .. turn.hitId .. " 触发相机前往")
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(turn.def)
            end
        end
    elseif eName == "Hit" then      --动作加数字
        if not BattleViewModel.HitPlay then
            BattleViewModel.HitPlay = true
            --if roleData.Attackmode ~= 1 then
            --    roleData.myAni:AtkVoice()
            --end
        end
        if BattleViewModel.hitAniStep == VideoCheckPoint.VAtkDmg then
            if roleData.Occupation == 4 then
                local info = BattleViewModel.CurData.actions[BattleViewModel.PhaseIndex]
                if info.skills ~= nil then
                    for i, v in ipairs(info.skills) do
                        if v.changes ~= nil then
                            BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                            BattleViewModel.UpdateStatus(v.changes)
                            BattleViewModel.ShowAllDamage(v.changes)
                        end
                    end
                end
                return
            end
            local info = BattleViewModel.CurData.actions[BattleViewModel.PhaseIndex]
            local v = info.skills[1]
            if v.changes ~= nil then
                if BattleViewModel.gjHitCount == 1 then
                    BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                    BattleViewModel.UpdateStatus(v.changes)
                end
                BattleViewModel.CheckNeedHitAni(gameid, v.changes)
                BattleViewModel.ShowDamage(v.changes, BattleViewModel.gjHitCount)
                BattleViewModel.gjHitCount = BattleViewModel.gjHitCount + 1
            end
        elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftAtK then
            if aniName ~= "ex" then
                if aniName ~= "zj" then
                    Global.LogError(string.format("[Warning] At BefAtk/AftAtk, there is an aniName '%s' that is not 'zj'", aniName))
                end
                local v = BattleViewModel.CurNormalList[BattleViewModel.CurNormalIdx]
                if v and v.changes ~= nil then
                    if BattleViewModel.zjHitCount == 1 then
                        BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                        BattleViewModel.UpdateStatus(v.changes)   
                        --在这里放ShowAllDamage，以显示zj中的多段伤害
                        BattleViewModel.ShowAllDamage(v.changes)
                    end
                    BattleViewModel.CheckNeedHitAni(gameid, v.changes)
                    --隐藏ShowDamage，放到上面换成ShowAllDamage
                    --BattleViewModel.ShowDamage(v.changes, BattleViewModel.zjHitCount)                
                    BattleViewModel.zjHitCount = BattleViewModel.zjHitCount + 1
                end
            end
        elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefSubAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftSubAtk then
            if aniName ~= "ex" then
                if aniName ~= "zj" then
                    Global.LogError(string.format("[Warning] At BefSubAtk/AftSubAtk, there is an aniName '%s' that is not 'zj'", aniName))
                end
                local v = BattleViewModel.CurNormalTab[gameid][BattleViewModel.CurNormalIdxTab[gameid]]
                if v and v.changes ~= nil then
                    if BattleViewModel.zjHitCountTab[gameid] == 1 then
                        BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                        BattleViewModel.UpdateStatus(v.changes)
                        --在这里放ShowAllDamage，以显示zj中的多段伤害
                        BattleViewModel.ShowAllDamage(v.changes)
                    end
                    BattleViewModel.CheckNeedHitAni(gameid, v.changes)
                    --隐藏ShowDamage，放到上面换成ShowAllDamage
                    --BattleViewModel.ShowDamage(v.changes, BattleViewModel.zjHitCountTab[gameid])
                    BattleViewModel.zjHitCountTab[gameid] = BattleViewModel.zjHitCountTab[gameid] + 1
                end
            end
        end
    elseif eName == "Hit_up" then   --只有动作
        if not BattleViewModel.HitPlay then
            BattleViewModel.HitPlay = true
            --if roleData.Attackmode ~= 1 then
            --    roleData.myAni:AtkVoice()
            --end
        end
        if BattleViewModel.hitAniStep == VideoCheckPoint.VAtkDmg then
            local info = BattleViewModel.CurData.actions[BattleViewModel.PhaseIndex]
            if nil ~= info.skills then
                local v = info.skills[1]
                if v.changes ~= nil then
                    BattleViewModel.CheckNeedHitAni(gameid, v.changes)
                end
            end
        elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftAtK then
            local v = BattleViewModel.CurNormalList[BattleViewModel.CurNormalIdx]
            if v and v.changes ~= nil then
                BattleViewModel.CheckNeedHitAni(gameid, v.changes)
            end
        elseif BattleViewModel.hitAniStep == VideoCheckPoint.VBefSubAtk or BattleViewModel.hitAniStep == VideoCheckPoint.VAftSubAtk then
            local v = BattleViewModel.CurNormalTab[gameid][BattleViewModel.CurNormalIdxTab[gameid]]
            if v and v.changes ~= nil then
                BattleViewModel.CheckNeedHitAni(gameid, v.changes)
            end
        end
    elseif eName == "Interrupt" then
        if aniName == "gj-1" then
            if gameid == turn.atk then
                BattleViewModel.CheckNextPhase()
            end
        elseif aniName == "gj-0" then
            if gameid == turn.atk and (BattleViewModel.hitAniStep == VideoCheckPoint.VAtkDmg or BattleViewModel.hitAniStep == VideoCheckPoint.VTurnStart) then
                roleData.myAni:RealStataAni("dj", true)
                CMgrCamera.Instance:SetFade2(BattleViewModel.CurData.atk, {}, false);
                BattleViewModel.CheckNextPhase()
            end
        elseif aniName == "sj" then
            roleData.sjInterrupt = true;
        end
    end
end

---结算回调
local cell = function(...)
    MgrTimer.AddDelayNoName(1,function()
        --敌方所有剩余的支援角色消失
        for i,v in pairs(BattleManager.AllRole) do
            if v.Occupation == 4 and v.Remove == false and v.IsLeft ~= BattleViewModel.isLeftWin then
                v.myAni:HideSelf()
                v.myAni:PlayU3DVFX("TongYong_Prefab/chuansong.prefab")
            end
        end
    end,nil)
    BattleViewModel.isReturning = false
    ---还原播放速度
    CJNBattleMgr.SetGameSpeed(1)
    ---显示结算面板
    if MgrUI.GetCurUI().Uid ~= UID.Home_UI then
        BattleManager.ReturnToMainScene(BattleViewModel.isLeftWin,...)
    end
end

---战斗结算
function BattleViewModel.ReturnToMainScene()
    if BattleViewModel.isReturning then
        return
    end
    ---正在结算
    BattleViewModel.isReturning = true
    if BattleManager.GameMode == BattleManager.GameModeType.Normal then   ---普通战斗
        BattleViewModel.GetFightReward(BattleViewModel.GiveUp,cell)
    elseif BattleManager.GameMode == BattleManager.GameModeType.PVP then                                ---PVP战斗
        if PVPViewModel.IsViewRecord then
            cell()
        else
            if BattleViewModel.isLeftWin then
                BattleViewModel.GetPVPReward(BattleViewModel.GiveUp,cell)
            else
                cell()
            end
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP then
        cell()
    elseif BattleManager.GameMode == BattleManager.GameModeType.RedTower then
        if getTowerReward and BattleViewModel.GiveUp ~= BattleViewModel.giveUp.GIVE_UP then
            BattleViewModel.GetTowerReward(BattleViewModel.GiveUp,cell)---红色巨塔战斗
        else
            BattleViewModel.TowerReward = nil
            if BattleViewModel.GiveUp == BattleViewModel.giveUp.GIVE_UP then
                BattleViewModel.isLeftWin = false
            end
            cell()
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.MonthTower then
        local ClientGetMonthlyTowerREQ = {}
        local bytes = assert(pb.encode('PBClient.ClientGetMonthlyTowerREQ',ClientGetMonthlyTowerREQ))
        MgrNet.SendReq(MID.CLIENT_GET_MONTHLY_TOWER_REQ,bytes,nil,nil,function(buffer,tag)
            local tab = assert(pb.decode('PBClient.ClientGetMonthlyTowerACK',buffer))
            if tab.errNo == 0 then
            else
                print("获取月塔数据失败,errNo " .. tab.errNo)
            end
        end,function(buffer,tag)
            local tab = assert(pb.decode('PBClient.ClientGetMonthlyTowerNTF',buffer))
            ---记录所有服务器给的数据
            YueTaViewModel.PushServerData(tab,function()
                cell()
            end)
            YueTaViewModel.CheckRedDot(tab.innerTopScore,tab.innerClaimedReward)
        end)
    elseif BattleManager.GameMode == BattleManager.GameModeType.Guide then
        if getGuideReward and BattleViewModel.GiveUp ~= BattleViewModel.giveUp.GIVE_UP then
            BattleViewModel.GetGuideReward(BattleViewModel.GiveUp,cell)---战术指导战斗
        else
            if BattleViewModel.GiveUp == BattleViewModel.giveUp.GIVE_UP then
                BattleViewModel.isLeftWin = false
            end
            cell()
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.ActivityBoss then
        cell()
    else
        cell()
    end
end

---根据数据，判断并播放击杀语音
function BattleViewModel.PlayKillVoice(info)
    -- 当前阶段的攻击者
    local mainAtk = BattleViewModel.CurData.atk
    ---@type BattleRole
    local mainAtkData = BattleManager.AllRole[mainAtk]
    
    local bEnemyDead = false
    for _, v in pairs(info.skills) do
        -- 要规避自己也死亡的情况
        if v.atk == mainAtk then
            return
        end
        ---@type BattleRole
        local deathData = BattleManager.AllRole[v.atk]
        -- 检查敌对阵营的死亡
        if deathData.IsLeft ~= mainAtkData.IsLeft then
            bEnemyDead = true
        end
    end

    if bEnemyDead then
        mainAtkData.myAni:KillVoice()
    end
end

function BattleViewModel.PlayDeath(info, callback)
    BattleViewModel.SortSkills(info, function ()
        for i = 1, #info.skills, 1 do
            local v = info.skills[i]
            if v.skillID == 0 then
                local roleData= BattleManager.AllRole[v.atk]
                roleData.Remove = true
                roleData.myAni:RealStataAni("sw",false)
            end
        end
        --- 可能出现 VDead 结束时触发 VDead 的情况，导致同名计时器被添加
        --- 提前取消一次，避免同名问题
        MgrTimer.Cancel2("VDead")
        MgrTimer.AddBattleDelay("VDead", 2.2, function ()
            if nil ~= callback then
                callback()
            end
        end, nil)
    end)
end

function BattleViewModel.AtkBack(callback)
    print("Start AtkBack")
    local roleData= BattleManager.AllRole[BattleViewModel.CurData.atk]
    local  tempFlyTime = 0
    if roleData then
        tempFlyTime= roleData.myAni:AtkBackTime()
        if not roleData.Remove then
            roleData.myAni:AtkBack()
        end
    end
    CMgrCamera.Instance:SetFade2(BattleViewModel.CurData.atk, {}, false)
    MgrCamera.BackToRoundEndPosition()
    MgrTimer.AddBattleDelay("AtkBack", tempFlyTime, callback, nil)
end

function BattleViewModel.ShowResurrection(info, callback)
    print("ShowResurrection")
    for index, value in ipairs(info.skills) do
        if value.changes ~= nil then
            for i, v in ipairs(value.changes) do
                if v.props ~= nil then
                    for i2, v2 in ipairs(v.props) do
                        if v2.field == 5 then
                            BattleViewModel.ResurrectionAndStandUp(value.atk ,v2.value)
                        end
                    end
                end
            end
            BattleViewModel.UpdateStatus(value.changes)
        end
    end
    MgrTimer.AddBattleDelay("VResurrection", 0.5, function ()
        callback()
    end, nil)
end

function BattleViewModel.ResurrectionAndStandUp(_hitId ,_num)
    print("ResurrectionAndStandUp hp".._num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:ResurrectionAndStandUp(_num) --复活并刷新血条UI/各种其他UI
        roleData.myAni:SetHPNew( _num,1,0)  --设置血量
        local maxOrder = 0
        if roleData.IsLeft then
            for i,v in ipairs(BattleManager.LeftTeam) do
                if v.Remove == false then
                    maxOrder = v.AtkOrder
                end
            end
        else
            for i,v in ipairs(BattleManager.RightTeam) do
                if v.Remove == false then
                    maxOrder = v.AtkOrder
                end
            end
        end
        roleData.AtkOrder = maxOrder + 1
        roleData.Remove = false
    end
end

function BattleViewModel.GamePause(func)
    if CJNBattleMgr.Instance then
        if CJNBattleMgr.Instance.IsPause then
            -- print("游戏暂停")
            BattleViewModel.PausePhase = func
            MgrTimer.AddRepeat("GamePausing",0.5,function()
                if CJNBattleMgr.Instance and not CJNBattleMgr.Instance.IsPause then
                    if BattleViewModel.PausePhase then
                        BattleViewModel.PausePhase()
                    end
                else
                    -- print("游戏暂停中")
                end
            end,-1,nil)
            return
        else
            MgrTimer.Cancel("GamePausing")  --暂停计时
            BattleViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
        end
    end
end

---战斗结算相关Start
---普通战斗结算
function BattleViewModel.GetFightReward(state,cell)
    local REQ = {
        status = state
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientChooseBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
            BattleViewModel.GetFightRewardACK,
            function(...)
                BattleViewModel.GetFightRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end
function BattleViewModel.GetFightRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseBattleRewardACK',buffer))
    if tab.errNo ~= 0 then
        BattleViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end
function BattleViewModel.GetFightRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseBattleRewardNTF',buffer))
    BlueprintViewModel.SetWeekRaidNum(tab.bpWeekRaidNum);
    ---保存普通奖励
    BattleViewModel.NormalRewardTab = tab
    if tab.supportNum then
        PlayerControl.SupportNum = tab.supportNum     --已经使用的支援次数
    end
    if tab.weekCopyNum then
        StormControl.SaveWeekBossTime(tab.weekCopyNum, tab.weekCopyNumTotal)
    end
    if StormViewModel.CurPointData.battleMap ~= "0" then
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
        ---刷新背包缓存
        BagViewModel.ReloadCacheData()
        ---更新玩家经验
        player:PushExp(tab.userExp)
        ---更新玩家等级
        player:PushLevel(tab.userLevel)
    end
    ---是否胜利判断
    if tab.levelStar > 0 then
        BattleViewModel.isLeftWin = true
    else
        BattleViewModel.isLeftWin = false
    end
    ---设置地图,玩家所在位置
    if tab.activityPos then
        SummerMapControl.SetMapPos(tab.activityPos)
        SummerMapControl.ChangeLogicState(tab.activityPos,tab.levelStar,tab.levelID)
    end
    if nil ~= tab.bpWeekRaidDmg then
        BlueprintViewModel.UpdateRaidDmg(tab.bpWeekRaidDmg);
    end
end

---PVP战斗结算
function BattleViewModel.GetPVPReward(state,cell)
    local REQ = {
        status = state
    }
    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_LADDER_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
            function(...)
                BattleViewModel.GetPVPRewardACK(...,cell)
            end,
            function(...)
                BattleViewModel.GetPVPRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end

function BattleViewModel.GetPVPReward2(state,cell)
    local REQ = {
        status = state
    }
    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_LADDER_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,BattleViewModel.GetPVPRewardACK,
            function(...)
                BattleViewModel.GetPVPRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end

function BattleViewModel.GetPVPRewardACK(buffer,tag,cell)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleRewardACK',buffer))
    if tab.errNo ~= 0 then
        BattleViewModel.isReturning = false
        if tab.errNo == ServerErrorCode.HighLadderBattleReward_9 then  ---PVP战斗已经结算过了
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text102")..tab.errNo,1},true)
            return
        elseif tab.errNo == ServerErrorCode.HighLadderBattleReward_501 then  ---PVP战斗结算时间已过
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus")..tab.errNo,1},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips3")..tab.errNo,1},true)
        end
        if BattleViewModel.BackToPVP then
            BattleViewModel.BackToPVP = false
            MgrTimer.AddDelayNoName(1,function()
                --敌方所有剩余的支援角色消失
                for i,v in pairs(BattleManager.AllRole) do
                    if v.Occupation == 4 and v.Remove == false and v.IsLeft ~= BattleViewModel.isLeftWin then
                        v.myAni:HideSelf()
                        v.myAni:PlayU3DVFX("TongYong_Prefab/chuansong.prefab")
                    end
                end
                ---还原播放速度
                CJNBattleMgr.SetGameSpeed(1)
                ---退回PVP准备界面
                local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
                MgrBattle.GoFight(MgrBattle.fightType.pvp,function() BattleViewModel.BackToPVP = true end,rankData[15])
            end,nil)
        end
    end
end

function BattleViewModel.GetPVPRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleRewardNTF',buffer))
    ---结果
    BattleViewModel.isLeftWin = tab.result ~= 1 and true or false
    ---记录结果
    PVPViewModel.resultData = {
        goods = tab.goods,
        aScore = tab.aScore,    ---进攻方增加/减少的分数
        aRank = tab.aRank,      ---进攻方的新段位
        dScore = tab.dScore,
        dRank = tab.dRank,
        day = tab.day,
        week = tab.week,
        month = tab.month,
        glory = tab.glory,
    }
end

---红色巨塔结算
function BattleViewModel.GetTowerReward(state,cell)
    if StormViewModel.CurPointData.star ~= 0 then
        cell()
        return
    end
    local REQ = {
        status = state
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientTowerRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_TOWER_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
    BattleViewModel.GetTowerRewardACK,
    function(...)
        BattleViewModel.GetTowerRewardNTF(...)
        if cell then
            cell()
        end
    end)
end

function BattleViewModel.GetTowerRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardACK',buffer))
    if tab.errNo ~= 0 then
        BattleViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end

function BattleViewModel.GetTowerRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardNTF',buffer))
    if tab == nil then
        BattleViewModel.isLeftWin = false
        return
    end
    BattleViewModel.TowerReward = nil
    BattleViewModel.TowerReward = tab.reward
    if BattleViewModel.TowerReward and #BattleViewModel.TowerReward ~= 0 then
        ---更新物品奖励
        ItemControl.PushGroupItemData(BattleViewModel.TowerReward,ItemControl.PushEnum.add)
    end
    ---胜利
    if tab.info then
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---重置当前关卡进度
        StormViewModel.CurPointState = 0
        ---更新红色巨塔状态
        StormControl.PushTowerData({tab.info})
        ---记录胜利
        --BattleViewModel.LeftWin = true
    else
        --BattleViewModel.LeftWin = false
    end
end

---战术指导结算
function BattleViewModel.GetGuideReward(state,cell)
    if StormViewModel.CurPointData.star ~= 0 then
        cell()
        return
    end
    local REQ = {
        status = state
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientTowerRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_GUIDE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
    BattleViewModel.GetGuideRewardACK,
    function(...)
        BattleViewModel.GetGuideRewardNTF(...)
        if cell then
            cell()
        end
    end)
end

function BattleViewModel.GetGuideRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardACK',buffer))
    if tab.errNo ~= 0 then
        BattleViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end

function BattleViewModel.GetGuideRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardNTF',buffer))
    if tab == nil then
        BattleViewModel.isLeftWin = false
        return
    end
    ---记录
    BattleViewModel.GuideTab = tab
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if tab.info then
        ---更新战术指导状态
        StormControl.PushGuideData({tab.info.towerID})
        BattleViewModel.isLeftWin = true
    else
        BattleViewModel.isLeftWin = false
    end
    if tab.reward ~= nil and BattleViewModel.isLeftWin then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
    end
end

function BattleViewModel.Calculagraph()  --计时器
    --15秒后激活跳过按钮
    MgrTimer.AddDelayNoName(15,function()
        BattleViewModel.JumpButtonOn = true
    end,nil)
    --15秒计时
    BattleViewModel.DJS = 15
    MgrTimer.AddRepeat("JumpButtonOn",1,function()
        if BattleViewModel.DJS >= 0 then
            BattleViewModel.DJS = BattleViewModel.DJS - 1
        end
    end,15,nil)
end

function BattleViewModel.Clear()
    BattleViewModel.PveReturn = false
    CJNBattleMgr.SetGameSpeed(1)
end

function BattleViewModel.RefreshRoundStartHeadIcon()
    local atkOrders = BattleViewModel.AtkOrders[BattleViewModel.RoundCount].atkOrder
    local isCharge = {}
    for i = 1, #atkOrders, 1 do
        table.insert(isCharge, 0)
    end
    BattleViewModel.CurOrderList = atkOrders
    local roleData = BattleManager.AllRole[atkOrders[1]]
    roleData.myAni:ShowNewOrderIcon(0,BattleViewModel.CurOrderList,isCharge)
end

function BattleViewModel.RefreshTurnHeadIcon()
    -- print("RefreshTurnHeadIcon start")
    local info = BattleViewModel.AtkOrders[BattleViewModel.RoundCount]
    local isCharge = {}
    if info.turnChanges == nil then
        local newOrder = {}
        for i = BattleViewModel.TurnCount, #BattleViewModel.CurOrderList, 1 do
            table.insert(newOrder, BattleViewModel.CurOrderList[i])
            table.insert(isCharge, 0)
        end
        -- BattleViewModel.CurOrderList = newOrder
        local roleData = BattleManager.AllRole[newOrder[1]]
        roleData.myAni:ShowNewOrderIcon(0,newOrder,isCharge)
        return
    end
    for key, value in pairs(info.turnChanges) do
        -- print("RefreshTurnHeadIcon turnChanges:"..serpent.block(value))
        -- print("RefreshTurnHeadIcon curTurn:"..BattleViewModel.TurnCount)
        if value.turn == BattleViewModel.TurnCount then
            BattleViewModel.CurOrderList = value.atkOrder
        end
    end
    local newOrder = {}
    for i = 1, #BattleViewModel.CurOrderList, 1 do
        if i >= 2 then
            table.insert(newOrder, BattleViewModel.CurOrderList[i])
        end
        table.insert(isCharge, 0)
    end
    local roleData = BattleManager.AllRole[BattleViewModel.CurOrderList[1]]
    print("RefreshTurnHeadIcon CurOrderList round:"..BattleViewModel.RoundCount.." turn:"..BattleViewModel.TurnCount.." order:"..serpent.block(BattleViewModel.CurOrderList))
    roleData.myAni:ShowNewOrderIcon(0,BattleViewModel.CurOrderList,isCharge)
    BattleViewModel.CurOrderList = newOrder
end

---二次战斗
function BattleViewModel.TrunSecondPhase(info, callback)
    ---设置连战场次
    StormControl.SetBattleContinu(StormControl.GetBattleContinu()+1)
    ---二次战斗角色摆放
    CMgrUI.Instance:SecondBattleScreen()
    MgrTimer.AddBattleDelay("SecondPhaseGameStartSkill",1,function()
        BattleManager.StartSecondPhaseBattle(StormViewModel.CurPointData.banSkill)
    end,nil)
    MgrTimer.AddBattleDelay("SecondPhaseGameStartUseSkill",2,function()
        if info.skills == nil then
            return
        end
        for i, v in ipairs(info.skills) do
            if v.changes ~= nil then
                BattleViewModel.ShowBuffIcons(v.atk, v.changes)
                BattleViewModel.UpdateStatus(v.changes)
                BattleViewModel.ShowAllDamage(v.changes)
            end
        end
    end,nil)
    MgrTimer.AddBattleDelay("RoundStartPause",3,callback,nil)
end


function BattleViewModel.CheckDailyExPlay(atkId)
    local roleData = BattleManager.AllRole[atkId]
    local roleID = roleData.ID
    local uid = PlayerControl.GetPlayerData().UID
    local s = UnityEngine.PlayerPrefs.GetInt("St_ExPlayTime"..uid.."_"..roleID)
    if s == nil or s == 0 then
        s = 0
    end
    if Global.CheckIsSameDay(s,Global.GetCurTime()) then
        return true
    else
        return false
    end
end

return BattleViewModel