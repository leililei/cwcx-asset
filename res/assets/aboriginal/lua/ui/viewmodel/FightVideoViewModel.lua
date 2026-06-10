require("LocalData/SigninLocalData")
require("LocalData/Special_effectLocalData")
require("Fight/Base/FightEnum")

---战斗VM
FightVideoViewModel = {}
---攻击音效
FightVideoViewModel.HitPlay = false
---是否放弃战斗
FightVideoViewModel.GiveUp = nil
---放弃战斗枚举
FightVideoViewModel.giveUp = {
    GIVE_UP = 0,
    DONE = 1,
}
---战斗返回
FightVideoViewModel.PveReturn = false
---对Boss伤害
FightVideoViewModel.BossHurt = 0
---正在结算
FightVideoViewModel.isReturning = false
---是否跳过
FightVideoViewModel.JumpOut = false
---红色巨塔奖励
FightVideoViewModel.TowerReward = nil
---普通战斗奖励
FightVideoViewModel.NormalRewardTab = nil
---战术指导接收消息
FightVideoViewModel.GuideTab = nil
-----签到类型
FightVideoViewModel.SignData = {}
---战斗前的玩家经验数据
FightVideoViewModel.playerExp = 0
---战斗队伍是否与服务器匹配
FightVideoViewModel.TeamCorrect = false
---是否播放XL特效
FightVideoViewModel.playInXLEffect = true
---狂暴特效
FightVideoViewModel.KuangbaoEffect = false
--Videos/Round/turn { atk ,hit,hits(次要目标) ,{skill,skill } }
FightVideoViewModel.AllVideos={}
FightVideoViewModel.HeadIcons={}--头像列表 {{id,id,id,id}, {id,id}}
FightVideoViewModel.GameStartVideo={} --游戏开始时

FightVideoViewModel.PausePhase = nil

FightVideoViewModel.norHit = {}     --普攻受击
FightVideoViewModel.norHitCount = 1;

FightVideoViewModel.addHit = {}     --追击受击
FightVideoViewModel.zjHitActionCount = 0
FightVideoViewModel.zjHitShowCount = 0
FightVideoViewModel.zjHitCount = 1;
FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.TURN_START
FightVideoViewModel.pauseDelay = 0.17

---初始化
function FightVideoViewModel.Init()

end
function FightVideoViewModel.Close()

end
---游戏暂停，保存当前阶段
function FightVideoViewModel.GamePause(func)
    if CJNBattleMgr.Instance then
        if CJNBattleMgr.Instance.IsPause then
            -- print("游戏暂停")
            FightVideoViewModel.PausePhase = func
            MgrTimer.AddRepeat("GamePausing",0.5,function()
                if CJNBattleMgr.Instance and not CJNBattleMgr.Instance.IsPause then
                    if FightVideoViewModel.PausePhase then
                        FightVideoViewModel.PausePhase()
                    end
                else
                    -- print("游戏暂停中")
                end
            end,-1,nil)
            return
        else
            MgrTimer.Cancel("GamePausing")  --暂停计时
            FightVideoViewModel.PausePhase = nil    --暂停阶段未执行的方法清空
        end
    end
end

-----------------------业务逻辑-------------------------
---发送请求 mode 1.普通战斗 2.PVP 3.boss战 4.模拟boss战 5.战术指导 6.红色巨塔
function FightVideoViewModel.SendSign(mode,closePanelCallBack)
    print("发送")
    if mode ~= nil then
        FightVideoViewModel.Sending(mode,closePanelCallBack)
    end
end

require("JNBattle/BattleManager")
function FightVideoViewModel.GameStart()
    FightVideoViewModel.GamePause(FightVideoViewModel.GameStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    --判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    CJNBattleMgr.Instance:RegisterSpine(FightVideoViewModel.handleSpineEvent)
    --查找技能Id播放对应特效,使用对应技能效果
    FightVideoViewModel.RankAndShowIcon()
    MgrCamera.BackToRoundEndPosition()
    CJNBattleMgr:SetRoundUIZore()
    CJNBattleMgr:GameStartPanel()
    MgrTimer.AddBattleDelay("ShowGameStart",2,FightVideoViewModel.ShowGameStart,nil)
    MgrTimer.AddBattleDelay("RoundStart",3,FightVideoViewModel.RoundStart,nil)
end
FightVideoViewModel.RoundCout=0 --轮数下标
FightVideoViewModel.TrunCout=0 --回合数下标
function FightVideoViewModel.ShowGameStart()
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.GAME_START
    print("战斗开始")
    for i, v in pairs(FightVideoViewModel.GameStartVideo) do
        --print( v.actType.. "施法者Id"..v.atkId .."受击者"..v.hitId .."技能id"..v.hitskillID .."持续时间"..  v.hitTime .."技能类型" ..v.SkillType .."技能数字"..v.SkillNumber)
        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --GameStartVideo
    end
end
function FightVideoViewModel.RoundStart()
    SettingViewModel.SetBattleSpeed(SettingViewModel.GetBattleSpeed())
    print("RoundStart")
    FightVideoViewModel.GamePause(FightVideoViewModel.RoundStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.LeftSummon = false
    FightVideoViewModel.RightSummon = false
    FightVideoViewModel.turn = 0
    FightVideoViewModel.TrunCout=0
    FightVideoViewModel.RoundCout=FightVideoViewModel.RoundCout + 1
    if  FightVideoViewModel.RoundCout > #FightVideoViewModel.AllVideos then
		--战斗结束结算
        FightVideoViewModel.GiveUp = FightVideoViewModel.giveUp.DONE
        CJNBattleMgr.SetGameSpeed(1)
        FightVideoViewModel.ReturnToMainScene()
		return
    end
    --初始化头像队列
    local roleData = BattleManager.AllRole[FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][1].atkId]
    FightVideoViewModel.HeadIconsUpdate(roleData,FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout])
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][1]
    if #turn.V_RoundStart ~= 0 then
        --print("V_RoundStart useskill")
        for i,v in ipairs(turn.V_RoundStart) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --V_RoundStart
        end
        FightVideoViewModel.TrunCout=1
    end
    --FightVideoViewModel.TrunStart()
    if FightVideoViewModel.RoundCout ~= 1 then
        MgrTimer.AddBattleDelay("SetRoundUI",1,function() CJNBattleMgr:SetRoundUI() end,nil)
    else
        Event.Go("BtnPauseDelay_Battle02")
        Event.Go("BtnFriendTiaoGuo_Battle02")
        CJNBattleMgr:RoundAddOne()
    end
    MgrTimer.AddBattleDelay("TrunStartPause",3,FightVideoViewModel.TrunStartPause,nil)

end

---二次战斗
function FightVideoViewModel.TrunSecondPhase()
    ---二次战斗角色摆放
    CMgrUI.Instance:SecondBattleScreen()
    MgrTimer.AddBattleDelay("SecondPhaseGameStartSkill",1,function()
        BattleManager.StartSecondPhaseBattle(StormViewModel.CurPointData.banSkill)
    end,nil)
    MgrTimer.AddBattleDelay("SecondPhaseGameStartUseSkill",2,function()
        for i, v in pairs(FightVideoViewModel.GameTwoStartVideo) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --GameStartVideo
        end
    end,nil)
    MgrTimer.AddBattleDelay("RoundStartPause",3,FightVideoViewModel.RoundStart,nil)
end


--回合间停顿，并移动镜头
function FightVideoViewModel.TrunStartPause()
    print("TrunStartPause")
    CJNBattleMgr:TurnAddOne()
    FightVideoViewModel.TrunCout=FightVideoViewModel.TrunCout + 1
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local roleData= BattleManager.AllRole[turn.atkId]
    --相机移动速度
    MgrCamera.ChangeBlendTime(1)
    --新回合清空
    FightVideoViewModel.LastSkillId = 0
    FightVideoViewModel.LastHitId = 0
    if SettingViewModel.GetCameraMove() == 1 then
        MgrCamera.MoveToCharacter(turn.atkId)
    end
    --加个停顿          停顿时长 相机混合时长
    MgrTimer.AddBattleDelay("TrunStart",MgrCamera.timeToCharacter,FightVideoViewModel.TrunStart,nil)
end

--回合开始
function FightVideoViewModel.TrunStart()
    print("TrunStart")
    --移动
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local roleData= BattleManager.AllRole[turn.atkId]
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    --CJNBattleMgr:TurnAddOne()
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.TURN_START
    print(FightVideoViewModel.RoundCout.."++++"..FightVideoViewModel.TrunCout .. "回合开始 " .. turn.atkId .."主角,受击者".. turn.hitId )
    --回合开始技能计算
    --print("V_TurnStart useskill")
    for i, v in pairs(turn.V_TurnStart) do
        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --V_TurnStart
    end
    if roleData then
        roleData.myAni:ShowBigDrawing()
        FightVideoViewModel.HeadIconsUpdate(roleData,FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout])
    end
    --判断ex
    local tempExTime=0
    if  #turn.V_TurnStartEX ~= 0 then
        tempExTime = FightVideoViewModel.TrunStartEX()
    end
    MgrTimer.AddBattleDelay("AtkStart",tempExTime,FightVideoViewModel.AtkStart,nil)
end

function FightVideoViewModel.AtkStart()
    print("AtkStart")
    FightVideoViewModel.GamePause(FightVideoViewModel.AtkStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    if turn.hitId==0 then
        --print("蓄力/眩晕/加Buff")
        if #turn.V_AtkCharge>0 then
            local roleData= BattleManager.AllRole[turn.atkId]
            local xltime = 0
            if roleData then
                --print("inxl roledata:"..turn.atkId)
                xltime = roleData.myAni:InXL(true)
            end
            CMgrCamera.Instance:SetFade2(turn.atkId,{},true)
        else
           MgrTimer.AddBattleDelay("TrunEnd",2,FightVideoViewModel.TrunEnd,nil)
        end
        return
    end
    --print("正常量流程")
    local roleData= BattleManager.AllRole[turn.atkId]
    if roleData then
        --如果是蓄力角色,关闭蓄力状态
        if roleData.Occupation==3 then
            roleData.myAni:OutXL()
        end
    end
    local HitData = BattleManager.AllRole[turn.hitId]
    if roleData ~= nil and HitData ~= nil then
        MgrCamera.ChangeBlendTime(1)
        if SettingViewModel.GetCameraMove() == 1 then

        end
        local beHitMonsterId = {}
        table.insert(beHitMonsterId,turn.hitId)
        for k, v in pairs(turn.V_Atk) do
            if k ~= 0 and not table.Contains(beHitMonsterId, k) then
                table.insert(beHitMonsterId,k)
            end
        end
        if next(turn.V_BefAtkSelf) ~= nil then
            for key, value in pairs(turn.V_BefAtkSelf) do
                if key ~= 0 and key ~= turn.atkId and not table.Contains(beHitMonsterId, key) then
                    table.insert(beHitMonsterId,key)
                end
            end
        end
        if next(turn.V_BefAtkBuff) ~= nil then
            for key, value in pairs(turn.V_BefAtkBuff) do
                if value.hitId ~= 0 and value.hitId ~= turn.atkId and not table.Contains(beHitMonsterId, value.hitId) then
                    table.insert(beHitMonsterId,value.hitId)
                end
            end
        end
        ---攻击前暂停
        CMgrCamera.Instance:SetFade2(turn.atkId,beHitMonsterId,true)    --隐藏未被攻击人
        if roleData.Attackmode ~=1 then
            local flytime= roleData.myAni:GetFlyTime(roleData.myAni,HitData.myAni)
            if flytime>0.001 then
                roleData.myAni:StartBefAtkFly()
                --延迟调用普攻
                MgrTimer.AddBattleDelay("TrunAtk",flytime,FightVideoViewModel.TrunAtk,nil)

            else
                --直接调用普攻
                MgrTimer.AddBattleDelay("TrunAtk",0,FightVideoViewModel.TrunAtk,nil)
            end
        else
            --直接调用普攻
            MgrTimer.AddBattleDelay("TrunAtk",0,FightVideoViewModel.TrunAtk,nil)
        end
    end
end
--回合开始Ex 返回ex需要的时间
function FightVideoViewModel.TrunStartEX()
    print("TrunStartEX")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunStartEX)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.BEF_NOR_EX
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    --查找所有受击目标
    local atkid=turn.V_TurnStartEX[1].atkId
    local skillid=math.abs(turn.V_TurnStartEX[1].hitskillID) --技能id
    local tempAllhit={}
    local effid = 0
    for _, v in pairs(turn.V_TurnStartEX) do
        --查找ex特效id
        --local effectid= FightVideoViewModel.HaveEffect( v.hitskillID ,v.hitId,0)
        local effectid= FightVideoViewModel.HaveEffectAndAddIcon( v.hitskillID ,v.hitId,0)
        effid=tonumber( JNStrTool.strSplit("_", effectid)[1] )
        ---↓无用
        if effid>0 then
            local skilldata=SkillLocalData.tab[math.abs(v.hitskillID)]
            if skilldata[9]==1 then --是ex
                atkid=v.atkId
                skillid=math.abs(v.hitskillID)
                break
            end
        end
        ---↑
    end
    --添加次要目标
    for _, v in pairs(turn.V_TurnStartEX) do
        if   v.hitId~=0 and v.hitId~=atkid then
            table.insert(tempAllhit,v.hitId)
        end
    end
    ---获取角色实例
    local roleData= BattleManager.AllRole[atkid]
    ---获取结束时间
    local endtime = 0
    if SettingViewModel.GetExAnim() == 1 then
        ---获取特效表
        if true then

        end
        local effectInfo = Special_effectLocalData.tab[effid]
        print("当前EXid为 ".. effid)
        print("特效表 ", serpent.block(effectInfo))
        if roleData then
            local target
            if tempAllhit[1] == nil then
                target = roleData
            else
                target = BattleManager.AllRole[tempAllhit[1]]
            end
            endtime = FightVideoViewModel.LuaPlayEX_V2(roleData,target,effectInfo[4],effectInfo[8],effectInfo[9],effectInfo[7],effectInfo[12],effectInfo[15],effectInfo[3],roleData.EXCutInPos,effectInfo[23],effectInfo[24])
        end

        MgrTimer.AddBattleDelay("UseExSkill_TurnStart",endtime,FightVideoViewModel.UseExSkill_TurnStart,nil)
    else
        endtime = 0
        FightVideoViewModel.UseExSkill_TurnStart()
    end
    return endtime + 0.2
end
--使用ex技能和显示伤害
function FightVideoViewModel.UseExSkill_TurnStart()
    FightVideoViewModel.GamePause(FightVideoViewModel.UseExSkill_TurnStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local temp = {}
    --print("V_TurnStartEX useskill")
    for i, v in pairs(turn.V_TurnStartEX) do
        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil, i ~= 1)    --V_TurnStartEX
        if v.hitId ~= 0 and FightVideoViewModel.isDamageType(v.SkillType, v.SkillNumber) then
            temp[v.hitId] = true
        end
    end
    for key, value in pairs(temp) do
        FightVideoViewModel.ShowHitAni(key)
    end
end
function FightVideoViewModel.UseExSkill_TurnEnd()
    FightVideoViewModel.GamePause(FightVideoViewModel.UseExSkill_TurnEnd)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local temp = {}
    --print("V_TurnEndEX useskill")
    for i, v in pairs(turn.V_TurnEndEX) do
        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil, i ~= 1)    --V_TurnEndEX
        if v.hitId ~= 0 and FightVideoViewModel.isDamageType(v.SkillType, v.SkillNumber) then
            temp[v.hitId] = true
        end
    end
    for key, value in pairs(temp) do
        FightVideoViewModel.ShowHitAni(key)
    end
end

--回合结束Ex 返回ex需要的时间
function FightVideoViewModel.TrunEndEX()
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunEndEX)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.AFT_NOR_EX
    local turn =   FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    --查找所有受击目标
    local atkid=turn.V_TurnEndEX[1].atkId
    local skillid=math.abs(turn.V_TurnEndEX[1].hitskillID) --技能id
    local tempAllhit={}
    local effid = 0
    for _, v in pairs(turn.V_TurnEndEX) do
        --查找ex技能
        --local effectid= FightVideoViewModel.HaveEffect( v.hitskillID ,v.hitId,0)
        local effectid = FightVideoViewModel.HaveEffectAndAddIcon( v.hitskillID ,v.hitId,0)
        --print("EX特效 技能ID " .. v.hitskillID)
        effid=tonumber( JNStrTool.strSplit("_", effectid)[1] )
        if effid>0 then
            local skilldata=SkillLocalData.tab[math.abs(v.hitskillID)]
            if skilldata[9]==1 then --是ex
                atkid=v.atkId
                skillid=math.abs(v.hitskillID)
                break
            end
        end
    end
    --添加次要目标
    for _, v in pairs(turn.V_TurnEndEX) do
        if   v.hitId~=0 and v.hitId~=atkid then
            table.insert(tempAllhit,v.hitId)
        end
    end
    local roleData= BattleManager.AllRole[atkid]

    if Special_effectLocalData.tab[effid] == nil then
        print("找不到以下特效ID " .. effid)
    end
    local effectInfo = Special_effectLocalData.tab[effid]
    local endtime = 0
    if SettingViewModel.GetExAnim() == 1 then
        if roleData then
            local target
            if tempAllhit[1] == nil then
                target = roleData
            else
                target = BattleManager.AllRole[tempAllhit[1]]
            end
            endtime = FightVideoViewModel.LuaPlayEX_V2(roleData,target,effectInfo[4],effectInfo[8],effectInfo[9],effectInfo[7],effectInfo[12],effectInfo[15],effectInfo[3],roleData.EXCutInPos,effectInfo[23],effectInfo[24])
        end

        MgrTimer.AddBattleDelay("UseExSkill_TurnEnd",endtime,FightVideoViewModel.UseExSkill_TurnEnd,nil)
    else
        endtime = 0
        FightVideoViewModel.UseExSkill_TurnEnd()
    end

    ---yzb 本阶段继续判断是否还有EX复活技能触发
    local EXAftDeadEndtime2 = 0
    MgrTimer.AddBattleDelay("V_TurnEnd_EXToSelf_Back2", endtime + 0.1,function()
        ---先看看有没有已经死亡需要触发EXAftDead的
        EXAftDeadEndtime2 = FightVideoViewModel.ExAftDead_Action(turn)

        MgrTimer.AddBattleDelay("V_TurnEnd_EX_Back2", EXAftDeadEndtime2 + 0.5,function()
            FightVideoViewModel.TrunEnd_Back()
        end,nil)
    end,nil)

    --MgrTimer.AddBattleDelay("TrunEnd_Back",endtime + 0.2,FightVideoViewModel.TrunEnd_Back,nil)
end
--回合中的内容时间 普攻
function FightVideoViewModel.TrunAtk()
    print("TrunAtk")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunAtk)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end

    --攻前动作
    FightVideoViewModel.TrunStartAtk_Action()
end
--普通攻击
function FightVideoViewModel.NorStart()
    print("NorStart")
    FightVideoViewModel.GamePause(FightVideoViewModel.NorStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.NORMAL_ATK
    --查找本回合video
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local roleData= BattleManager.AllRole[turn.atkId]
    local HitData= BattleManager.AllRole[turn.hitId]
    local AtkAniTime = 0
    if roleData ~= nil and HitData ~= nil then
        FightVideoViewModel.norHitCount = 1;
        roleData.myAni:Loop_AtkAtk(HitData.myAni)   --普通攻击 + 震动
        MgrCamera.CameraShake(roleData.myAni)           --震动
        AtkAniTime = roleData.myAni.AtkAniTime +0.2
        --print("普通攻击时间"..AtkAniTime)
        FightVideoViewModel.norHit = {}
        FightVideoViewModel.elseHit = {}
        for k, v in pairs(turn.V_Atk) do    -- k==受击方GameID，v是所有的受击技能
            if k ~= 0 and k ~= turn.atkId and FightVideoViewModel.isDamageType(v[1].SkillType, v[1].SkillNumber) then
                local norHit = {}
                local elseHit = {}
                for i,val in pairs(v) do
                    if val.atkId ~= turn.atkId then
                        table.insert(elseHit,clone(val))    --自己的行动回合中可能夹杂其他人对同一目标的伤害，比如猫蛋对Boss的传导伤害
                    else
                        table.insert(norHit,clone(val))
                    end
                end
                if next(norHit) then
                    FightVideoViewModel.norHit[k] = norHit
                end
                if next(elseHit) then
                    FightVideoViewModel.elseHit[k] = elseHit
                end
                --FightVideoViewModel.norHit[k] = v   --被攻击导致的受击
            else
                if k ~= 0  then
                    if v[1].atkId ~= turn.atkId then
                        FightVideoViewModel.elseHit[k] = v  --攻击阶段的其他人的攻击(比如海姬的死亡触发的回血,玛利亚的反弹伤害等)
                    else
                        if BattleManager.AllRole[turn.atkId].myAni:GetTempt() then  --海姬被魅惑自己打死自己触发给对方回血
                            FightVideoViewModel.elseHit[k] = v
                        end
                    end
                else
                    --删除技能
                    FightVideoViewModel.elseHit[k] = v
                end
            end
        end
    end
end
--展示技能和技能特效
function FightVideoViewModel.ShowTurnStart()
    print("ShowTurnStart")
    FightVideoViewModel.GamePause(FightVideoViewModel.ShowTurnStart)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    local turn =   FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    --print("V_TurnStart useskill")
    for i, v in pairs(turn.V_TurnStart) do
        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --V_TurnStart
    end
end
--展示普通攻击
function FightVideoViewModel.ShowAtk()
    print("ShowAtk")
    FightVideoViewModel.GamePause(FightVideoViewModel.ShowAtk)
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local atkTab = {}
    for i = 0, 54 do
        if turn.V_Atk[i] ~= nil then
            local value = turn.V_Atk[i]
            for j, v in pairs(value) do
                FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,(v.hitId == turn.hitId),v.delSkill,nil,j ~= 1)    --V_Atk
            end
        end
    end
    --for key, value in pairs(turn.V_Atk) do
    --    for _, v in pairs(value) do
    --        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)    --V_Atk
    --    end
    --end
end
--回合结束
function FightVideoViewModel.TrunEnd()
    print("TrunEnd")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunEnd)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    --print("本次攻击结束")
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    CMgrCamera.Instance:SetFade2(turn.atkId,{},false)
    --if turn.V_Atk ~= nil and turn.V_Atk[0] ~= nil and #turn.V_Atk[0] ~= 0 then
    --    --print("攻击结束 useskill")
    --    for k, v in pairs(turn.V_Atk[0]) do
    --        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,k ~= 1)
    --    end
    --end
    --攻后动作
    FightVideoViewModel.TrunEndHit_Action()
end
--攻击方攻前动作
function FightVideoViewModel.TrunStartAtk_Action()
    print("TrunStartAtk_Action")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunStartAtk_Action)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.BEF_NOR_ATK

    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]

    ---释放所有攻前Buff,不论敌我
    if next(turn.V_BefAtkBuff) ~= nil then
        for i, v in ipairs(turn.V_BefAtkBuff) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
    end

    -- 查找是否需要播放动作
    local needAction = false;
    local actionList = {}
    local removeList2 = {}  --移除技能列表
    local removeList = {}
    FightVideoViewModel.addHit = {}
    local roleData = BattleManager.AllRole[turn.atkId]
    if turn ~= nil and turn.V_BefAtkSelf ~= nil and next(turn.V_BefAtkSelf) ~= nil then
        for id, v in pairs(turn.V_BefAtkSelf) do
            local lastSkillId = 0
            for idx, value in pairs(v) do
                table.insert(actionList, value)     --攻前动作集合
                local skilldata=nil
                if value.hitskillID ~= nil then
                    skilldata = SkillLocalData.tab[math.abs(value.hitskillID)]
                end
                if skilldata ~= nil then    --释放的技能
                    if skilldata[3] ~= "0" and skilldata[3] ~= 0 then --是否有追击字段
                        if skilldata[40] == tonumber(roleData.ID) then
                            needAction = true
                        end
                        if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then      --是否有追击特效
                            if value.hitskillID ~= nil  then    --攻击型追击
                                if lastSkillId ~= math.abs(value.hitskillID) then
                                    lastSkillId = math.abs(value.hitskillID)
                                    FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),(value.hitId==turn.hitId),roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            else
                                FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),(value.hitId==turn.hitId),roleData.ZJEffectId_str)   --创建特效并播放
                            end
                        end
                    end
                    if FightVideoViewModel.addHit[id] == nil then
                        FightVideoViewModel.addHit[id] = {}
                        FightVideoViewModel.addHit[id]["dmg"] = {}
                        FightVideoViewModel.addHit[id]["buff"] = {}
                    end
                    if FightVideoViewModel.isDamageType(value.SkillType, value.SkillNumber)
                    then
                        --table.insert(FightVideoViewModel.addHit[id]["dmg"],idx,value)
                        --FightVideoViewModel.addHit[id]["dmg"][idx] = value
                        FightVideoViewModel.addHit[id]["dmg"][#FightVideoViewModel.addHit[id]["dmg"]+1] = value
                    else
                        --local temp = true
                        --for k1, v1 in pairs(FightVideoViewModel.addHit[id]["buff"]) do
                        --    if math.abs(v1.hitskillID) == math.abs(value.hitskillID) and v1.SkillType == value.SkillType then   --已存在该BUFF，不重复释放
                        --        temp = false
                        --        local str = string.split(skilldata[17],"@")
                        --        for _,strValue in pairs(str) do
                        --            if strValue == "2" then     --例外事项有2类型为可叠加
                        --                temp = true
                        --            end
                        --        end
                        --    end
                        --end
                        --if temp then
                        --    FightVideoViewModel.addHit[id]["buff"][#FightVideoViewModel.addHit[id]["buff"]+1] = value
                        --end
                    end
                else                        --移除的技能
                    table.insert(removeList2, value)
                    removeList = Global.CopyTable(removeList2)
                end
            end
        end
    elseif turn ~= nil and turn.V_BeforeSupportSelf ~= nil and next(turn.V_BeforeSupportSelf) ~= nil then
        for id, v in pairs(turn.V_BeforeSupportSelf) do
            local lastSkillId = 0
            for idx,value in ipairs(v) do
                table.insert(actionList, value)     --攻前动作集合
                local skilldata=nil
                if value.hitskillID ~= nil then
                    skilldata = SkillLocalData.tab[math.abs(value.hitskillID)]
                end
                if skilldata ~= nil then
                    if skilldata[3] ~= "0" and skilldata[3] ~= 0 then --是否有追击字段
                        if skilldata[40] == tonumber(roleData.ID) then
                            needAction = true
                        end
                        if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then      --是否有追击特效
                            if value.hitskillID ~= nil  then    --攻击型追击
                                if lastSkillId ~= math.abs(value.hitskillID) then
                                    lastSkillId = math.abs(value.hitskillID)
                                    FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            else
                                FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                            end
                        end
                    end
                    if FightVideoViewModel.addHit[id] == nil then
                        FightVideoViewModel.addHit[id] = {}
                        FightVideoViewModel.addHit[id]["dmg"] = {}
                        FightVideoViewModel.addHit[id]["buff"] = {}
                    end
                    if FightVideoViewModel.isDamageType(value.SkillType, value.SkillNumber)
                    then
                        --table.insert(FightVideoViewModel.addHit[id]["dmg"],idx,value)
                        --FightVideoViewModel.addHit[id]["dmg"][idx] = value
                        FightVideoViewModel.addHit[id]["dmg"][#FightVideoViewModel.addHit[id]["dmg"]+1] = value
                    else
                        local temp = true
                        for k1, v1 in pairs(FightVideoViewModel.addHit[id]["buff"]) do
                            if math.abs(v1.hitskillID) == math.abs(value.hitskillID) and v1.SkillType == value.SkillType then
                                temp = false
                                local str = string.split(skilldata[17],"@")
                                for _,strValue in pairs(str) do
                                    if strValue == "2" then     --例外事项有2类型为可叠加
                                        temp = true
                                    end
                                end
                            end
                        end
                        if temp then
                            --table.insert(FightVideoViewModel.addHit[id]["buff"],idx,value)
                            --FightVideoViewModel.addHit[id]["buff"][idx] = value
                            FightVideoViewModel.addHit[id]["buff"][#FightVideoViewModel.addHit[id]["buff"]+1] = value
                        end
                    end
                else
                    table.insert(removeList2, value)
                    removeList = Global.CopyTable(removeList2)
                end
            end
        end
    else
        -- 执行敌方受击前动作
        FightVideoViewModel.TrunStartHit_Action();
        return
    end


    if needAction
    then
        FightVideoViewModel.zjHitCount = 1;
        for i, v in pairs(removeList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        --如果有动作
        local roleData = BattleManager.AllRole[turn.atkId]
        if roleData then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 then
                roleData.myAni:RealStataAni("zj",false)
            end
        end
    else
        --整理actionList
        FightVideoViewModel.SortSkillList(actionList,removeList)
        --同时使用所有技能
        for i, v in pairs(removeList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        for i, v in pairs(actionList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --V_BefAtk
        end
        -- 执行敌方受击前动作
        FightVideoViewModel.TrunStartHit_Action();
    end
end

function FightVideoViewModel.TrunStartHit_Action()
    print("TrunStartHit_Action")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunStartHit_Action)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.BEF_NOR_HIT
    FightVideoViewModel.zjHitActionCount = 0
    FightVideoViewModel.zjHitShowCount = 0
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]

    local actionList = {}
    local atkList = {}
    if turn ~= nil and turn.V_BefAtkEnemy ~= nil and next(turn.V_BefAtkEnemy) ~= nil then
        for k, v in pairs(turn.V_BefAtkEnemy) do
            local lastSkillId = 0
            for key, value in pairs(v) do
                for idx, info in pairs(value) do
                    table.insert(actionList, info)
                    local skilldata=SkillLocalData.tab[math.abs(info.hitskillID)]
                    if skilldata ~= nil then
                        if skilldata[3]~="0" and skilldata[3]~=0 then
                            atkList[info.atkId] = true
                            local roleData = BattleManager.AllRole[info.atkId]
                            if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then
                                if value.hitskillID ~= nil  then    --攻击型追击
                                    if lastSkillId ~= math.abs(value.hitskillID) then
                                        lastSkillId = math.abs(value.hitskillID)
                                        FightVideoViewModel.UseEffect(info.atkId,info.hitId,math.abs(info.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                    end
                                else
                                    FightVideoViewModel.UseEffect(info.atkId,info.hitId,math.abs(info.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        -- 进入普通攻击
        FightVideoViewModel.NorStart()
        return
    end

    --同步播放所有动作,返回最长的时间
    for k, v in pairs(atkList) do
        local roleData= BattleManager.AllRole[k]
        local aniTime = 0
        if roleData then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 then
                roleData.myAni:RealStataAni("zj",false)
                FightVideoViewModel.zjHitActionCount = FightVideoViewModel.zjHitActionCount + 1
            end
        end
    end

    if FightVideoViewModel.zjHitActionCount <= 0 then
        --同时使用所有技能
        --print("TrunStartHit_Action useskill")
        for i, v in pairs(actionList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        -- 进入普通攻击
        FightVideoViewModel.NorStart()
        return
    else
        if turn.V_BefAtkEnemy ~= nil then
            for k, value in pairs(turn.V_BefAtkEnemy) do
                if value[0] ~= nil and #value[0] ~= 0 then
                    --print("TrunStartHit_Action useskill")
                    for i, v in pairs(value[0]) do
                        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
                    end
                end
            end
        end
    end
end

function FightVideoViewModel.TrunEndHit_Action()
    print("TrunEndHit_Action")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunEndHit_Action)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end

    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.AFT_NOR_HIT
    FightVideoViewModel.zjHitActionCount = 0
    FightVideoViewModel.zjHitShowCount = 0

    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]

    local actionList = {}
    local atkList = {}
    if turn ~= nil and turn.V_AftAtkEnemy ~= nil and next(turn.V_AftAtkEnemy) ~= nil then
        for k, v in pairs(turn.V_AftAtkEnemy) do
            local lastSkillId = 0
            for key, value in pairs(v) do
                for idx, info in pairs(value) do
                    table.insert(actionList, info)
                    local skilldata=SkillLocalData.tab[math.abs(info.hitskillID)]
                    if skilldata ~= nil then
                        if skilldata[3]~="0" and skilldata[3]~=0 then   --有动作
                            atkList[info.atkId] = true
                            local roleData = BattleManager.AllRole[info.atkId]
                            if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then
                                if value.hitskillID ~= nil  then    --攻击型追击
                                    if lastSkillId ~= math.abs(value.hitskillID) then
                                        lastSkillId = math.abs(value.hitskillID)
                                        FightVideoViewModel.UseEffect(info.atkId,info.hitId,math.abs(info.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                    end
                                else
                                    FightVideoViewModel.UseEffect(info.atkId,info.hitId,math.abs(info.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        -- 进入攻击方普攻后动作
        FightVideoViewModel.TrunEndAtk_Action()
        return
    end

    --同步播放所有动作,返回最长的时间
    for k, v in pairs(atkList) do
        local roleData= BattleManager.AllRole[k]
        local aniTime = 0
        if roleData then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 and not roleData.Remove then
                roleData.myAni:RealStataAni("zj",false)
                FightVideoViewModel.zjHitActionCount = FightVideoViewModel.zjHitActionCount + 1
            end
        end
    end

    if FightVideoViewModel.zjHitActionCount <= 0 then
        --同时使用所有技能
        --print("TrunEndHit_Action useskill")
        for i, v in pairs(actionList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        -- 进入攻击方普攻后动作
        FightVideoViewModel.TrunEndAtk_Action()
        return
    else
        ---所有其他人的攻后动作，在此处集中释放
        for i, v in pairs(actionList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        --if turn.V_AftAtkEnemy ~= nil then
        --    for k, value in pairs(turn.V_AftAtkEnemy) do
        --        if value[0] ~= nil and #value[0] ~= 0 then
        --            --print("TrunEndHit_Action useskill")
        --            for i, v in pairs(value[0]) do
        --                FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        --            end
        --        end
        --    end
        --end
    end
end
--攻后动作
function FightVideoViewModel.TrunEndAtk_Action()
    FightVideoViewModel.playInXLEffect = false
    print("TrunEndAtk_Action")
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunEndAtk_Action)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.AFT_NOR_ATK
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]

    -- 查找是否需要播放动作
    local needAction = false;
    local actionList = {}
    local removeList2 = {}
    local removeList = {}
    FightVideoViewModel.addHit = {}
    local roleData = BattleManager.AllRole[turn.atkId]
    if turn ~= nil and turn.V_AftAtkSelf ~= nil and next(turn.V_AftAtkSelf) ~= nil and not roleData.Remove then
        for id, v in pairs(turn.V_AftAtkSelf) do
            local lastSkillId = 0
            for idx, value in pairs(v) do
                table.insert(actionList, value) --动作列表
                local skilldata=nil
                if value.hitskillID ~= nil then
                    skilldata = SkillLocalData.tab[math.abs(value.hitskillID)]
                end
                if skilldata ~= nil
                then
                    if skilldata[3]~="0" and skilldata[3]~=0 then
                        if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then
                            if value.hitskillID ~= nil  then    --攻击型追击
                                if lastSkillId ~= math.abs(value.hitskillID) then
                                    lastSkillId = math.abs(value.hitskillID)
                                    FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),(value.hitId==turn.hitId),roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            else
                                FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),(value.hitId==turn.hitId),roleData.ZJEffectId_str)   --创建特效并播放
                            end
                        end
                        if skilldata[40] == tonumber(roleData.ID) then
                            needAction = true
                        end
                    end
                    if FightVideoViewModel.addHit[id] == nil then
                        FightVideoViewModel.addHit[id] = {}
                        FightVideoViewModel.addHit[id]["dmg"] = {}
                        FightVideoViewModel.addHit[id]["buff"] = {}
                    end
                    if FightVideoViewModel.isDamageType(value.SkillType, value.SkillNumber) then
                        --table.insert(FightVideoViewModel.addHit[id]["dmg"],idx, value)
                        FightVideoViewModel.addHit[id]["dmg"][#FightVideoViewModel.addHit[id]["dmg"]+1] = value
                    else
                        local temp = true
                        for k1, v1 in pairs(FightVideoViewModel.addHit[id]["buff"]) do
                            if math.abs(v1.hitskillID) == math.abs(value.hitskillID) and v1.SkillType == value.SkillType then
                                temp = false
                                local str = string.split(skilldata[17],"@")
                                for _,strValue in pairs(str) do
                                    if strValue == "2" then     --例外事项有2类型为可叠加
                                        temp = true
                                    end
                                end
                            end
                        end
                        if temp then
                            --table.insert(FightVideoViewModel.addHit[id]["buff"],idx, value)
                            FightVideoViewModel.addHit[id]["buff"][#FightVideoViewModel.addHit[id]["buff"]+1] = value
                        end
                    end
                else
                    table.insert(removeList2, value)
                    removeList = Global.CopyTable(removeList2)  --本回合要移除的技能
                end
            end
        end
    --[[可能暂无此情况了
    -- elseif turn.V_Atk ~= nil and next(turn.V_Atk) ~= nil then  --另外判断是否有攻击动作含有zj动作
    --     for k, v in pairs(turn.V_Atk) do
    --         for key, value in pairs(v) do
    --             table.insert(actionList, value)
    --             local skilldata=SkillLocalData.tab[value.hitskillID]
    --             if skilldata ~= nil then
    --                 if skilldata[3]~="0" and skilldata[3]~=0 then
    --                    if skilldata[40] == tonumber(roleData.ID) then
    --                       needAction = true
    --                    if skilldata[40] == tonumber(roleData.ID) then
    --                     -- 目标记录
    --                 end
    --             end
    --         end
    --     end]]
    elseif turn ~= nil and turn.V_AfterSupportSelf ~= nil and next(turn.V_AfterSupportSelf) ~= nil and not roleData.Remove then
        for id, v in pairs(turn.V_AfterSupportSelf) do
            local lastSkillId = 0
            for idx,value in ipairs(v) do
                table.insert(actionList, value)
                local skilldata=nil
                if value.hitskillID ~= nil then
                    skilldata = SkillLocalData.tab[math.abs(value.hitskillID)]
                end
                if skilldata ~= nil
                then
                    if skilldata[3]~="0" and skilldata[3]~=0 then
                        if roleData.ZJEffectId_str ~= "0" and not roleData.Remove then
                            if value.hitskillID ~= nil  then    --攻击型追击
                                if lastSkillId ~= math.abs(value.hitskillID) then
                                    lastSkillId = math.abs(value.hitskillID)
                                    FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                                end
                            else
                                FightVideoViewModel.UseEffect(value.atkId,value.hitId,math.abs(value.hitskillID),true,roleData.ZJEffectId_str)   --创建特效并播放
                            end
                        end
                        if skilldata[40] == tonumber(roleData.ID) then
                            needAction = true
                        end
                    end
                    if FightVideoViewModel.addHit[id] == nil then
                        FightVideoViewModel.addHit[id] = {}
                        FightVideoViewModel.addHit[id]["dmg"] = {}
                        FightVideoViewModel.addHit[id]["buff"] = {}
                    end
                    if FightVideoViewModel.isDamageType(value.SkillType, value.SkillNumber) then
                        --table.insert(FightVideoViewModel.addHit[id]["dmg"],idx,value)
                        --FightVideoViewModel.addHit[id]["dmg"][idx] = value
                        FightVideoViewModel.addHit[id]["dmg"][#FightVideoViewModel.addHit[id]["dmg"]+1] = value
                    else
                        local temp = true
                        for k1, v1 in pairs(FightVideoViewModel.addHit[id]["buff"]) do
                            if math.abs(v1.hitskillID) == math.abs(value.hitskillID) and v1.SkillType == value.SkillType then
                                temp = false
                                local str = string.split(skilldata[17],"@")
                                for _,strValue in pairs(str) do
                                    if strValue == "2" then     --例外事项有2类型为可叠加
                                        temp = true
                                    end
                                end
                            end
                        end
                        if temp then
                            --table.insert(FightVideoViewModel.addHit[id]["buff"],idx,value)
                            --FightVideoViewModel.addHit[id]["buff"][idx] = value
                            FightVideoViewModel.addHit[id]["buff"][#FightVideoViewModel.addHit[id]["buff"]+1] = value
                        end
                    end
                else
                    table.insert(removeList2, value)
                    removeList = Global.CopyTable(removeList2)
                end
            end
        end
    else
        -- 执行敌方受击前动作
        FightVideoViewModel.TrunEndAction()
        return
    end
    --整理actionList
    --FightVideoViewModel.SortSkillList(actionList,removeList)    --移除不存在的技能
    local roleData = BattleManager.AllRole[turn.atkId]
    if needAction and not roleData.Remove then
        FightVideoViewModel.zjHitCount = 1;
        --print("TrunEndAtk_Action useskill")
        for i, v in pairs(removeList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --不存在的技能的伤害仍然要计算
        end
        --如果有动作
        local roleData = BattleManager.AllRole[turn.atkId]
        if roleData and not roleData.Remove then
            local aniTime = roleData.myAni:GetAniTime("zj")
            if aniTime > 0 then
                roleData.myAni:RealStataAni("zj",false)
            end
        end
    else
        --同时使用所有技能
        for i, v in pairs(removeList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        for i, v in pairs(actionList) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
        end
        FightVideoViewModel.TrunEndAction()
    end
end

function FightVideoViewModel.TrunEndAction()
    FightVideoViewModel.playInXLEffect = true
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    ---死亡小技能
    for i, v in pairs(turn.V_DeadSkill) do
        FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
    end
    local endTimeToSelf = 0
    local EXAftDeadEndtime = 0
    ---死亡前对自己释放的EX
    endTimeToSelf = FightVideoViewModel.ExAftDeadToSelf_Action(turn)
    MgrTimer.AddBattleDelay("V_TurnEnd_EXToSelf_Back", endTimeToSelf + 0.1,function()
        ---先看看有没有已经死亡需要触发EXAftDead的
        EXAftDeadEndtime = FightVideoViewModel.ExAftDead_Action(turn)

        MgrTimer.AddBattleDelay("V_TurnEnd_EX_Back",  EXAftDeadEndtime + 0.5,function()
            if #turn.V_TurnEndEX>0 then
                FightVideoViewModel.TrunEndEX()
            else
                FightVideoViewModel.TrunEnd_Back()
            end
        end,nil)
    end,nil)
end
--攻后后退复位/死亡/是否有人被救起
function FightVideoViewModel.TrunEnd_Back()
    print("TrunEnd_Back")
    ---后撤完暂停阶段
    --角色后退
    local turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    FightVideoViewModel.GamePause(FightVideoViewModel.TrunEnd_Back)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.hitAniStep = FightEnum.BattleTurnStep.TURN_END
    if next(FightVideoViewModel.addHit) ~= nil then
        for key, value in pairs(FightVideoViewModel.addHit) do
            for k1, value1 in pairs(value) do
                FightVideoViewModel.EndHitAni(k1)
            end
        end
        FightVideoViewModel.addHit = {}
    end
    --献身结算
    for _, v in pairs(turn.V_ExchangePosition) do
        FightVideoViewModel.RemoveXianShen(v.atkId,v.SkillNumber)
    end

    local roleData= BattleManager.AllRole[turn.atkId]
    local  tempFlyTime = 0
    if roleData then
        tempFlyTime= roleData.myAni:AtkBackTime()
        if not roleData.Remove then
            roleData.myAni:AtkBack()
        end
    end
    local cell = function()
        ------重排V_TurnEnd----临时做法：将31类型放到最后执行
        local re_TurnEnd = {}
        for i,v in ipairs(turn.V_TurnEnd) do
            if v.SkillType ~= 31 then
                table.insert(re_TurnEnd,v)
            end
        end
        for i,v in ipairs(turn.V_TurnEnd) do
            if v.SkillType == 31 then
                table.insert(re_TurnEnd,v)
            end
        end
        ---------------------------------------------------
        for i, v in pairs(re_TurnEnd) do
            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)    --V_TurnEnd
        end
    end
    CAnimation.AllBuffTurnMinusOne(cell)
    --目标死亡时技能
    for i, v in pairs(turn.TargetDeadSkill) do
        FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
    end
    --显示死亡
    for _, v in pairs(turn.V_RoleDead) do
        local deadData= BattleManager.AllRole[v.atkId]
        if deadData and not deadData.Remove and v.hitId ~= -v.atkId then
            deadData.myAni:RealStataAni("sw",false)
            ---清理Buff
            --deadData.myAni.myHpUi.Bufftexts:Clear()
            print(v.atkId .. " 死亡")
            deadData.Remove = true
            if deadData.IsLeft and FightVideoViewModel.LeftSummon then
                deadData.myAni.DeadParent:SetActive(false)
            elseif not deadData.IsLeft and FightVideoViewModel.RightSummon then
                deadData.myAni.DeadParent:SetActive(false)
            end
        end
    end
    local roleDeadOrderLeft = {}
    local roleDeadOrderRight = {}
    if FightVideoViewModel.TurnDeadAndResurrection ~= nil then
        for key, v in pairs(FightVideoViewModel.TurnDeadAndResurrection) do
            for i,value in pairs(v) do
                if key == "Left" then
                    table.insert(roleDeadOrderLeft,value)
                else
                    table.insert(roleDeadOrderRight,value)
                end
            end
        end
    else
        for key, v in ipairs(turn.V_RoleDead) do
            local role = BattleManager.AllRole[v.atkId]
            if role.IsLeft then
                table.insert(roleDeadOrderLeft,role.AtkOrder)
            else
                table.insert(roleDeadOrderRight,role.AtkOrder)
            end
        end
    end

    local aliveLeft = {}
    for i,v in ipairs(BattleManager.LeftTeam) do
        if v.Remove == false then
            table.insert(aliveLeft,v)
        end
    end
    for i,v in pairs(aliveLeft) do
        local num = 0
        for j,k in pairs(roleDeadOrderLeft) do
            if v.AtkOrder > k then
                num = num + 1
            end
        end
        v.AtkOrder = v.AtkOrder - num
    end

    local aliveRight = {}
    for i,v in ipairs(BattleManager.RightTeam) do
        if v.Remove == false then
            table.insert(aliveRight,v)
        end
    end
    for i,v in pairs(aliveRight) do
        local num = 0
        for j,k in pairs(roleDeadOrderRight) do
            if v.AtkOrder > k then
                num = num + 1
            end
        end
        v.AtkOrder = v.AtkOrder - num
    end

    FightVideoViewModel.LeftSummon = false
    FightVideoViewModel.RightSummon = false
    FightVideoViewModel.TurnDeadAndResurrection = nil
    --调整当前的下标 调用下一个
    MgrCamera.BackToRoundEndPosition()
    MgrTimer.AddBattleDelay("ShowTrunEnd",tempFlyTime,FightVideoViewModel.ShowTrunEnd,nil)
end

function FightVideoViewModel.ShowTrunEnd()
    print("ShowTrunEnd")
    local turn =  FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
    local role = BattleManager.AllRole[turn.atkId]
    NoviceViewModel.CheckCurID(50114,function()
        ---如果角色id和回合数正确
        if tonumber(role.ID) == 90001 and FightVideoViewModel.RoundCout == 1 then
            ---斯卡蒂行动后暂停
            CJNBattleMgr.Instance.IsPause = true
            NoviceViewModel.DoNext()
        end
    end)
    NoviceViewModel.CheckCurID(50317,function()
        ---如果角色id和回合数正确
        if tonumber(role.ID) == 12002 and FightVideoViewModel.RoundCout == 1 then
            ---不知火行动后暂停
            CJNBattleMgr.Instance.IsPause = true
            MgrTimer.AddDelayNoName(1,function()
                NoviceViewModel.DoNext()
            end,nil)
        end
    end)
    NoviceViewModel.CheckCurID(50327,function()
        ---如果角色id和回合数正确
        if tonumber(role.ID) == 12002 and FightVideoViewModel.RoundCout == 2 then
            ---不知火行动后暂停
            CJNBattleMgr.Instance.IsPause = true
            NoviceViewModel.DoNext()
        end
    end)
    NoviceViewModel.CheckCurID(50528,function()
        ---如果角色id和回合数正确
        if tonumber(role.ID) == 10013 and FightVideoViewModel.RoundCout == 1 then
            ---斯卡蒂行动后
            CJNBattleMgr.Instance.IsPause = true
            NoviceViewModel.DoNext()
        end
    end)
    FightVideoViewModel.GamePause(FightVideoViewModel.ShowTrunEnd)
    if FightVideoViewModel.PausePhase ~= nil then
        return
    end
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    FightVideoViewModel.HitPlay = false
    --print("V_TurnEnd useskill")
    FightVideoViewModel.ShowTrunEnd2(turn)
end

function FightVideoViewModel.ShowTrunEnd2(turn)
    for i,v in pairs(BattleManager.AllRole) do
        v.Resurrectioned = false    ---复活无敌状态重置
        v.ExplodeDebuff = false     ---引爆Debuff状态重置
    end

    if  #FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout] <=FightVideoViewModel.TrunCout then
        if #turn.V_SecondPhase ~= 0 then
            MgrTimer.AddBattleDelay("TrunSecondPhase",2,FightVideoViewModel.TrunSecondPhase,nil)
        else
            for i, v in pairs(turn.V_RoundEnd) do
                FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1)
            end
            FightVideoViewModel.RoundStart()
        end
    else
        MgrTimer.AddBattleDelay("TrunStartPause",BattleData.RoundPause,FightVideoViewModel.TrunStartPause,nil)
    end
end

function FightVideoViewModel.ExAftDeadToSelf_Action(turn)
    local endtime = 0
    local effid = 0
    for i,v in pairs(turn.V_ExAftDeadToSelf) do
        if v.atkId ~= 0 and v.SkillType ~= 0 and v.hitId ~= 0 then
            --查找ex特效id
            local effectid= FightVideoViewModel.HaveEffectAndAddIcon(v.hitskillID ,v.hitId,0)
            effid=tonumber(JNStrTool.strSplit("_", effectid)[1])
        end
    end
    local atkId = 0
    for i,v in pairs(turn.V_ExAftDeadToSelf) do
        if v.atkId ~= 0 and v.SkillType ~= 0 then
            atkId = v.atkId
            break
        end
    end
    local roleData = BattleManager.AllRole[atkId]
    ---获取结束时间
    if SettingViewModel.GetExAnim() == 1 then
        local effectInfo = Special_effectLocalData.tab[effid]
        if roleData then
            endtime = FightVideoViewModel.LuaPlayEX_V2(roleData,roleData,effectInfo[4],effectInfo[8],effectInfo[9],effectInfo[7],effectInfo[12],effectInfo[15],effectInfo[3],roleData.EXCutInPos,effectInfo[23],effectInfo[24])
        end
        MgrTimer.AddBattleDelay("V_ExAftDeadToSelf",endtime,function()
            for i, v in pairs(turn.V_ExAftDeadToSelf) do
                FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,true)
            end
        end,nil)
    else
        for i, v in pairs(turn.V_ExAftDeadToSelf) do
            FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,true)
        end
    end
    return endtime
end

function FightVideoViewModel.ExAftDead_Action(turn)
    local endtime = 0
    local dead = {}     --已经死亡要被释放EX复活的人
    for i,v in pairs(turn.V_ExAftDead) do
        for j,value in pairs(BattleManager.AllRole) do
            if v.hitId == value.GameID and value.Remove then
                table.insert(dead,v)
            end
        end
    end
    local newExAftDead = {}
    for j,value in pairs(turn.V_ExAftDead) do
        local contain = false
        for i,v in pairs(dead) do
            if v == value then
                contain = true
            end
        end
        if not contain then
            table.insert(newExAftDead,value)
        end
    end
    local tempTurn = clone(turn)
    tempTurn.V_ExAftDead = newExAftDead
    if next(dead) ~= nil then
        ---EX技能施放者
        local atkId = nil
        for i, v in pairs(dead) do
            if v.atkId ~= 0 and v.SkillType ~= 0 then
                atkId = v.atkId
                break
            end
        end
        local effid = 0
        for _, v in pairs(dead) do
            if v.atkId ~= 0 and v.SkillType ~= 0 and v.hitId ~= 0 then
                --查找ex特效id
                local effectid= FightVideoViewModel.HaveEffectAndAddIcon( v.hitskillID ,v.hitId,0)
                effid=tonumber( JNStrTool.strSplit("_", effectid)[1])
            end
        end
        local tempAllhit = {}
        --添加次要目标
        for _, v in pairs(dead) do
            if   v.hitId~=0 and v.hitId~=atkId then
                table.insert(tempAllhit,v.hitId)
            end
        end
        ---获取角色实例
        local roleData = BattleManager.AllRole[atkId]
        ---获取结束时间
        if SettingViewModel.GetExAnim() == 1 then
            local effectInfo = Special_effectLocalData.tab[effid]
            if roleData then
                local target
                if tempAllhit[1] == nil then
                    target = roleData
                else
                    target = BattleManager.AllRole[tempAllhit[1]]
                end
                endtime = FightVideoViewModel.LuaPlayEX_V2(roleData,target,effectInfo[4],effectInfo[8],effectInfo[9],effectInfo[7],effectInfo[12],effectInfo[15],effectInfo[3],roleData.EXCutInPos,effectInfo[23],effectInfo[24])
            end
            MgrTimer.AddBattleDelay("V_ExAftDead",endtime,function()
                for i, v in pairs(dead) do
                    local healer = BattleManager.AllRole[v.atkId]
                    local backToLife = BattleManager.AllRole[v.hitId]
                    FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1,tempTurn)   --V_ExAftDead
                    if backToLife then
                        backToLife.Remove = false
                    end
                end
            end,nil)
        else
            endtime = 3.5
            MgrTimer.AddBattleDelay("V_ExAftDead",3.5,function()
                for i, v in pairs(dead) do
                    local healer = BattleManager.AllRole[v.atkId]
                    local backToLife = BattleManager.AllRole[v.hitId]
                    FightVideoViewModel.UseSkill(v.atkId,v.hitId,v.hitskillID,v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,i ~= 1,tempTurn)   --V_ExAftDead
                    if backToLife then
                        backToLife.Remove = false
                    end
                end
            end,nil)
        end
    end
    return endtime
end

--计算技能效果,展示扣血动画,增减属性值
-- _skillId 1代表普攻,如果是负数代表暴击
function FightVideoViewModel.UseSkill( _atkId,_hitId,_skillId,_skillTime,_skillType,_SkillNum,_IsMianTar, _DelSkill,skillIsCrit,_NotInSound,tUrn)    -- _NotInSound是否播放声音
    ---判断是否跳过
    if FightVideoViewModel.JumpOut then
        return
    end
    if _skillId==nil then
        return
    end
    print(_atkId.."进攻角色id,受击角色id".._hitId.." 技能id ".._skillId.." 技能持续时间 ".._skillTime.." 技能类型 ".._skillType.." 技能数值或者修改后的五维 ".._SkillNum)
    ---判断是否暴击_skillId 为负数代表暴击
    local isCrit =false
    if _skillId < 0 then
        _skillId =_skillId * -1
        isCrit=true
    end
    if skillIsCrit then
        isCrit=true
    end
    ---判断Buff持续时间
    if _skillTime > 50000 then
        _skillTime=-1
    end
    ---加减属性值，伤害计算
    if _skillType==1 or _skillType==9 or _skillType==11 or _skillType==12 or _skillType==13 or _skillType==10029 or _skillType==10084 or _skillType==10083
    then
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 and _hitId == 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        if BattleManager.AllRole[_hitId] and BattleManager.AllRole[_hitId].Resurrectioned then
            _SkillNum = 0
        end
        local roleData= BattleManager.AllRole[_hitId]
        local hitRoleDead = false
        if roleData.myAni.myHpUi.Uidata_Hp + _SkillNum <= 0 then
            hitRoleDead = true
        end
        --扣血,可以用护盾抵消
        if FightVideoViewModel.RoundCout == 0 and FightVideoViewModel.TrunCout == 0 then
            FightVideoViewModel.BeHit(_hitId,isCrit,true,_SkillNum,_skillType,{})
        else
            FightVideoViewModel.BeHit(_hitId,isCrit,true,_SkillNum,_skillType,FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_DodgeRole)
        end
        if (BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss) and _hitId == 1 then
            FightVideoViewModel.BossHurt = FightVideoViewModel.BossHurt - _SkillNum
            BattleManager.ReturnFightData_Eve(FightVideoViewModel.BossHurt)
        end
        --if BattleManager.GameMode == BattleManager.GameModeType.ActivityBoss and _hitId == 1 then
        --    BattleManager.CurActivityBossHp = BattleManager.CurActivityBossHp + _SkillNum
        --end
        --hitId可能死亡
        if not roleData.Remove and hitRoleDead and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout] ~= nil and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout] ~= nil and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].atkId ~= _hitId then
            if #FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_RoleDead ~= 0 then
                for i,v in pairs(FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_RoleDead) do
                    if v.atkId == _hitId then
                        roleData.Remove = true
                        MgrTimer.AddDelayNoName(0.5,function()
                            roleData.myAni:RealStataAni("sw",false)
                        end,nil)
                        print(_hitId .. " 死亡")
                        if not FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].playedKillVoice then   ---本回合未播放击杀语音
                        FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].playedKillVoice = true
                            local atkRoleData= BattleManager.AllRole[_atkId]
                            atkRoleData.myAni:KillVoice()
                        end
                    end
                end
            end
        end
    elseif _skillType==10 or _skillType==72 or _skillType==94
    then
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        if BattleManager.AllRole[_hitId] and BattleManager.AllRole[_hitId].Resurrectioned then
            _SkillNum = 0
        end
        --扣血,不能用护盾
        local roleData= BattleManager.AllRole[_hitId]
        local hitRoleDead = false
        if roleData.myAni.myHpUi.Uidata_Hp + _SkillNum <= 0 then
            hitRoleDead = true
        end
        if FightVideoViewModel.RoundCout == 0 and FightVideoViewModel.TrunCout == 0 then
            FightVideoViewModel.BeHit(_hitId,isCrit,false,_SkillNum,_skillType,{})
        else
            FightVideoViewModel.BeHit(_hitId,isCrit,false,_SkillNum,_skillType,FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_DodgeRole)
        end
        if (BattleManager.GameMode == BattleManager.GameModeType.WorldBoss or BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss) and _hitId == 1 then
            FightVideoViewModel.BossHurt = FightVideoViewModel.BossHurt - _SkillNum
            BattleManager.ReturnFightData_Eve(FightVideoViewModel.BossHurt)
        end
        --if BattleManager.GameMode == BattleManager.GameModeType.ActivityBoss and _hitId == 1 then
        --    BattleManager.CurActivityBossHp = BattleManager.CurActivityBossHp + _SkillNum
        --end
        --hitId可能死亡
        if not roleData.Remove and hitRoleDead and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout] ~= nil and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout] ~= nil and FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].atkId ~= _hitId then
            if #FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_RoleDead ~= 0 then
                for i,v in pairs(FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_RoleDead) do
                    if v.atkId == _hitId then
                        roleData.Remove = true
                        MgrTimer.AddDelayNoName(0.5,function()
                            roleData.myAni:RealStataAni("sw",false)
                        end,nil)
                        print(_hitId .. " 死亡")
                        if not FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].playedKillVoice then   ---本回合未播放击杀语音
                            FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].playedKillVoice = true
                            local atkRoleData= BattleManager.AllRole[_atkId]
                            atkRoleData.myAni:KillVoice()
                        end
                    end
                end
            end
        end
    elseif _skillType==8
    then   --减伤
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 and _hitId == 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.DamageRelief(_hitId,_SkillNum)
    elseif _skillType==14 or _skillType==63 or _skillType==97
    then --积累护盾值
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetShield(_hitId,_SkillNum)
    elseif _skillType==25
    then --//重置减益buff时长
        FightVideoViewModel.ResetDownSkillTime()
    elseif _skillType==26
    then --//重置增益buff时长
        FightVideoViewModel.ResetUpSkillTime()
    elseif _skillType==31
    then --复活
        local roleData= BattleManager.AllRole[_hitId]
        ---清理Buff
        --roleData.myAni.myHpUi.Bufftexts:Clear()
        roleData.Resurrectioned = true
        FightVideoViewModel.Resurrection(_hitId ,_SkillNum)
    elseif _skillType==33
    then --自爆
        FightVideoViewModel.ThisDead(_hitId ,_SkillNum)
        local deadData= BattleManager.AllRole[_hitId]
        if deadData and not deadData.Remove then
            deadData.Remove = true
            MgrTimer.AddBattleDelay("zibao".._hitId,0.6,function()
                deadData.myAni:RealStataAni("sw",false)
                print(_hitId .. " 死亡")
            end,nil)
        end
    elseif _skillType==38
    then --魅惑
        if _SkillNum == 0 then
            FightVideoViewModel.Tempt(_hitId,true)
        else
            FightVideoViewModel.Tempt(_hitId,false)
        end
    elseif _skillType==41 or _skillType==75
    then --攻击力
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetAtk(_hitId,_SkillNum)
    elseif _skillType==42 or _skillType==55 or _skillType==76
    then --防御力
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetDef(_hitId,_SkillNum)
    elseif _skillType==43 or _skillType==57  or _skillType==77
    then --暴击率
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetCrit(_hitId,_SkillNum)
    elseif _skillType==44 or _skillType==78
    then --暴击伤害
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0
        then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetCritDMG(_hitId,_SkillNum)
    elseif _skillType==45 or _skillType==56 or _skillType==79
    then --闪避率
        --受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetAgile(_hitId,_SkillNum)
    elseif _skillType==60
    then --重置所有技能时长
        FightVideoViewModel.ResetAllSkillTime()
    elseif _skillType==62
    then --蓄力状态使火力型角色立即完成蓄力
        FightVideoViewModel.SetXlIn(_hitId,_SkillNum)
    elseif _skillType==64
    then --攻击力系数变化
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetAtkRatio(_hitId,_SkillNum)
    elseif _skillType==67
    then --生命值最大值变化
        if BattleManager.AllRole[_atkId] == nil and _atkId ~= 0 then
            _hitId = 256 - _atkId
            if _DelSkill.skillTime ~= nil then
                _atkId = _DelSkill.skillTime
            end
        end
        FightVideoViewModel.SetHPMax(_hitId,_SkillNum)
    elseif _skillType==69
    then --解除蓄力状态
        FightVideoViewModel.SetXlOut(_hitId,_SkillNum)
    elseif _skillType==71
    then  --添加献身效果，受到致命一击时保留1点血，自身与目标调换位置
        FightVideoViewModel.SetXianShen(_atkId,_hitId)
    elseif _skillType==74
    then --重置目标身上所有的持续伤害类BUFF时间

    elseif _skillType==85
    then
        FightVideoViewModel.SetSupport(_hitId,_SkillNum)
    elseif _skillType==88
    then --复活一个已经剔除队列的角色
        local turn = (tUrn ~= nil) and tUrn or FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
        FightVideoViewModel.TurnDeadAndResurrection = {}
        FightVideoViewModel.TurnDeadAndResurrection["Left"] = {}
        FightVideoViewModel.TurnDeadAndResurrection["Right"] = {}
        for i,v in pairs(turn.V_RoleDead) do
            if BattleManager.AllRole[v.atkId].IsLeft then
                FightVideoViewModel.TurnDeadAndResurrection["Left"][i] = BattleManager.AllRole[v.atkId].AtkOrder
            else
                FightVideoViewModel.TurnDeadAndResurrection["Right"][i] = BattleManager.AllRole[v.atkId].AtkOrder
            end
        end
        print("yzb..fuhuoID: " .. _hitId)
        FightVideoViewModel.ResurrectionAndStandUp(_hitId,_SkillNum)
        for i,v in pairs(turn.V_RoleDead) do
            if v.atkId == _hitId then   --死亡角色和被复活角色是同一个人
                FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout].V_RoleDead[i].hitId = -v.atkId   --被复活标记
                break
            end
        end
        local roleData= BattleManager.AllRole[_hitId]
        roleData.Remove = false
    elseif _skillType==90
    then --引爆Debuff
        local atkRoleData = BattleManager.AllRole[_atkId]
        if not atkRoleData.ExplodeDebuff then
            local v_turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
            for i,v in pairs(v_turn.V_DebuffDamageExploded) do
                local thisIsCrit = false
                if BattleManager.AllRole[v.atkId] == nil and v.atkId ~= 0 and v.hitId == 0 then
                    v.hitId = 256 - v.atkId     --暴击传负数(无符号二进制)
                    v.atkId = v.hitId
                    thisIsCrit = true
                else
                    v.hitId = v.atkId
                end
                FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,thisIsCrit,i ~= 1)
            end
            atkRoleData.ExplodeDebuff = true
        end
    elseif _skillType==95
    then
        --local id = tonumber(string.split(SkillLocalData.tab[_skillId][20],"_")[2])    ---召唤技能ID
        if BattleManager.AllRole[_atkId].IsLeft then
            FightVideoViewModel.LeftSummon = true
        else
            FightVideoViewModel.RightSummon = true
        end
        BattleManager.Summon(_skillId,BattleManager.AllRole[_atkId].IsLeft,_DelSkill.skillTime,_DelSkill.skillID,_SkillNum + 1,BattleManager.AllRole[_atkId])   --_SkillNum + 1 : 服务器顺序从0开始算
    end

    ---移除buff
    if _DelSkill ~=nil and _DelSkill.skillID ~= nil and _DelSkill.skillID ~= 0 and _DelSkill.skillTime ~= nil and _skillType ~= 95 then --95召唤类型特殊传值
        --查找需要移除的特效
        local delId=math.abs(_DelSkill.skillID)
        local delskillTime=_DelSkill.skillTime
        FightVideoViewModel.DelBuffIcon(_atkId,delId,delskillTime)
        FightVideoViewModel.DelBuffEff(_atkId,delId)
        local roleData= BattleManager.AllRole[_atkId]
        if roleData then
            for i,v in pairs(roleData.TabBuffSkill) do
                if v.skillid == delId then
                    table.remove(roleData.TabBuffSkill,i)
                end
            end
        end
        --local skilldata=SkillLocalData.tab[delId]
        --local roleData= BattleManager.AllRole[_hitId]
        --roleData.myAni:RemoveBuffEff(skilldata[42])
        --roleData.myAni:RemoveBuff(delId ,delskillTime)
        --print("-----------移除技能受击角色id".._hitId.." 技能id "..delId.." 剩余持续时间 "..delskillTime.." 技能类型 "..v.reType.." 技能数值或者修改后的五维 "..v.reNumber)
        if #_DelSkill.delNum>0 then
            for _, v in pairs(_DelSkill.delNum) do
                if v.reType==1 then

                elseif v.reType==8 then
                    FightVideoViewModel.DamageRelief(_atkId,v.reNumber)
                elseif  v.reType==14 or v.reType == 63 or v.reType == 97
                then --积累护盾值
                    FightVideoViewModel.ReSetShield(_atkId,v.reNumber)
                elseif v.reType==36
                then --眩晕

                elseif v.reType==38
                then --魅惑
                    FightVideoViewModel.Tempt(_atkId,false)
                elseif v.reType==41 or v.reType==75
                then --攻击力
                    FightVideoViewModel.SetAtk(_atkId,v.reNumber)
                elseif v.reType==42 or v.reType==55 or v.reType==76
                then --防御力
                    FightVideoViewModel.SetDef(_atkId,v.reNumber)
                elseif v.reType==43 or v.reType==57  or v.reType==77
                then --暴击率
                    FightVideoViewModel.SetCrit(_atkId,v.reNumber)
                elseif v.reType==44 or v.reType==78
                then --暴击伤害
                    FightVideoViewModel.SetCritDMG(_atkId,v.reNumber)
                elseif v.reType==45 or v.reType==56 or v.reType==79
                then --闪避率
                    FightVideoViewModel.SetAgile(_atkId,v.reNumber)
                elseif v.reType==67
                then --生命值最大值变化
                    FightVideoViewModel.SetHPMax(_atkId,v.reNumber)
                elseif v.reType == 71
                then  --移除献身Buff并触发效果，受到致命一击时保留1点血，自身与释放者调换位置
                    ---展示攻击之后触发的献身,交换Buff
                    if FightVideoViewModel.RoundCout == 0 and FightVideoViewModel.TrunCout == 0 then
                    else
                        if _SkillNum == 0 then
                            --清Buff
                        else
                            FightVideoViewModel.RemoveXianShen(_atkId,_SkillNum)
                        end
                    end
                end
            end
        end
    end
    if _skillId == 59999 and not FightVideoViewModel.KuangbaoEffect then
        FightVideoViewModel.KuangbaoEffect = true
        MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/Ui_QuanPingKuangBao.prefab',function(go)
            BattleManager.CjnMgr:SetEffectChild(go)
        end)
    end
    ---查找技能id对应的特效 普攻是1 则查找角色普攻特效
    if _skillId > 0 and _skillId ~= 59999 and _skillTime ~=0 and _skillType == 0 then
        --local skilleff=FightVideoViewModel.HaveEffect( _skillId ,_hitId, _skillTime)    --查找有没有特效,如果本技能有特效,直接播放
        local skilleff=FightVideoViewModel.HaveEffectAndAddIcon( _skillId ,_hitId, _skillTime)
        if skilleff~=0 and skilleff~="0" then
            --if not BattleManager.AllRole[_atkId].Remove then    --死亡后依然上特效
            FightVideoViewModel.UseEffect(_atkId,_hitId,_skillId,_IsMianTar,skilleff,_NotInSound)   --创建特效并播放
            --end
        end
        --按照时长存贮
        if _skillTime~=0 then
            --受击者
            local roleData= BattleManager.AllRole[_hitId]
            local skilldata=SkillLocalData.tab[_skillId]
            if roleData then
                local BuffSkill={}
                BuffSkill.type1=skilldata[10]
                BuffSkill.type2=skilldata[11]
                BuffSkill.skillid=_skillId
                BuffSkill.time=_skillTime
                BuffSkill.AtkId = _atkId
                table.insert(roleData.TabBuffSkill,BuffSkill)
            end
        end
    end
end
function FightVideoViewModel.PlayEffectToMinorTarget(effectId,_IsMianTar)
    if Special_effectLocalData.tab[tonumber(effectId)][25] == 1 and not _IsMianTar then
        return false
    else
        return true
    end
end
--重置持续时间 如果移除的时候找不到匹配的时间,移除符合的第一个
function FightVideoViewModel.ResetAllSkillTime()

end
--正面buff
function FightVideoViewModel.ResetUpSkillTime()

end
--重置负面
function FightVideoViewModel.ResetDownSkillTime()

end
--修改攻击力参数
function FightVideoViewModel.SetAtkRatio(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetAtkRatio(_SkillNum/10000)
    end
end
--修改攻击力
function FightVideoViewModel.SetAtk(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetAtk(_SkillNum)
    end
end
--修改防御力
function FightVideoViewModel.SetDef(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetDef(_SkillNum/10000)
        --挂防御Buff
        if _SkillNum >= 10000 then
            roleData.myAni:SetSingleEffect("Buff_HuDunMax_v1")
        else
            roleData.myAni:RemoveEffect("Buff_HuDunMax_v1")
        end
    end
end
--修改支援力
function FightVideoViewModel.SetSupport(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetSupport(_SkillNum)
    end
end
--修改暴击率
function FightVideoViewModel.SetCrit(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetCrit(_SkillNum/10000)
    end
end
--修改暴击伤害
function FightVideoViewModel.SetCritDMG(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetCritDMG(_SkillNum/10000)
    end
end
--修改闪避率
function FightVideoViewModel.SetAgile(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData then
        roleData.myAni:SetAgile(_SkillNum/10000)
        --挂闪避Buff
        if _SkillNum >= 10000 then
            roleData.myAni:SetSingleEffect("Buff_ShanBiMax_v1")
        else
            roleData.myAni:RemoveEffect("Buff_ShanBiMax_v1")
        end
    end
end
--移除一个buff
function FightVideoViewModel.DelSkill(_hitId,_skillType,_SkillNum)

end
--排序并且显示角色头像
function FightVideoViewModel.RankAndShowIcon()

end
--加减血,传入技能类型                 掉血角色id 暴击  能不能用护盾抵消 数值
function FightVideoViewModel.BeHit(_roleId,_isCrit,_canShield, _num, _skillType,dodgeRole)
    if _num == 0 then
        return
    end
    local atkNumberType = -1
    if _num > 0 then
        atkNumberType = 1
    else
        atkNumberType = 0
        if _skillType then
            atkNumberType = -1
        end
    end
    local roleData= BattleManager.AllRole[_roleId]
    local isGrey = false
    if #dodgeRole >= 1 then
        for i = 1,#dodgeRole do
            if dodgeRole[i] == _roleId then
                isGrey = true
                break
            end
        end
    end
    if roleData ~= nil then
        roleData.myAni:BeHit(_isCrit,_canShield, _num,atkNumberType,isGrey)
    end
end
function FightVideoViewModel.DamageRelief(_hitId,_SkillNum)
    ---@type BattleRole
    local roleData= BattleManager.AllRole[_hitId]
    roleData:SetDamageRelief(roleData,_SkillNum/10000)
end
--加减护盾值
function FightVideoViewModel.SetShield(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:AddShield( _SkillNum)
    end
end

function FightVideoViewModel.ReSetShield(_hitId,_SkillNum)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:AddShield( _SkillNum)
    end
end

FightVideoViewModel.AllBuffList = {}
--添加一个buff          _buffTime=0的话，显示一下马上消失
function FightVideoViewModel.AddBuffIcon(_hitId,_buffId, _IconName,_BuffName,_buffTime)
    local roleData= BattleManager.AllRole[_hitId]
    print("给 " .. _hitId .. " 添加一个Buff,BuffName是 " .. _BuffName .. "BuffId是" .. _buffId .."持续时间为 " .. _buffTime .. " 回合")
    if roleData ~= nil and not roleData.Remove then
        roleData.myAni:AddBuff( _buffId, _IconName,_buffTime, _BuffName)
    end
end
--删除一个buff 用_buffTime来区分
function FightVideoViewModel.DelBuffIcon(_hitId,_buffId,_buffTime)
    --print("给 " .. _hitId .. " 移除一个Buff,BuffId是" .. _buffId .."持续时间为 " .. _buffTime .. " 回合")
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:RemoveBuff( _buffId,_buffTime)
    end
end
--删除Buff特效
function FightVideoViewModel.DelBuffEff(_hitId,_buffId)
    local roleData= BattleManager.AllRole[_hitId]   --要删除特效的角色的数据
    local effectTab = JNStrTool.SubAtkEffectId(SkillLocalData.tab[_buffId][5])  --要删除的Buff的特效ID表
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
    end
end
--每回合Buff时间减少
function FightVideoViewModel.TurnBuff()

end
--复活_num 为复活后的血量
function FightVideoViewModel.Resurrection(_hitId ,_num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:SetHPNew( _num,1,0)
        roleData.myAni:Resurrection(_num)
        roleData.Remove = false
    end
end
--复活_num 为复活后的血量
function FightVideoViewModel.ResurrectionAndStandUp(_hitId ,_num)
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
    end
end
--最大血量
function FightVideoViewModel.SetHPMax(_hitId ,_num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        if _num>0 then
            roleData.myAni:SetHPMax( _num,1)
        else
            roleData.myAni:SetHPMax( _num,0)
        end
    end
end
--自爆 血量归零
function FightVideoViewModel.ThisDead(_hitId ,_num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:SetHPNew(_num,0,0)
    end
end
--设置魅惑状态
function FightVideoViewModel.Tempt(_hitId,temp)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:SetTempt(temp)
    end
end

--开始蓄力
function FightVideoViewModel.SetXlIn(_hitId ,_num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
    roleData.myAni:InXL(FightVideoViewModel.playInXLEffect)
    end
end
--结束蓄力
function FightVideoViewModel.SetXlOut(_hitId ,_num)
    local roleData= BattleManager.AllRole[_hitId]
    if roleData ~= nil then
        roleData.myAni:OutXL()
    end
end
--设置献身Buff
function FightVideoViewModel.SetXianShen(_atkId,_hitId)
    --local roleData= BattleManager.AllRole[_hitId]
    --if roleData ~= nil then
    --    table.insert(roleData.XianShenSwitchId,_atkId)
    --end
end
--移除献身Buff，触发效果
function FightVideoViewModel.RemoveXianShen(_selfId,_anotherId)
    local roleData = BattleManager.AllRole[_selfId]
    local roleDataTwo = BattleManager.AllRole[_anotherId]
    if roleData ~= nil then
        if roleDataTwo ~= nil then
            --交换位置
            FightVideoViewModel.SwitchPosition(_selfId,_anotherId)
        end
        roleData.Remove = false
        --自身血量显示为1
        roleData.myAni:SetHPWithoutNumber(1)
    end
end
--重排战斗小头像，并得出当前存活的角色的ID
function FightVideoViewModel.HeadIconsUpdate(roleData,round)    --round:当前轮的所有回合
    --当前所有存活角色的ID
    local atkOrder = {}
    local characterIsCharge = {}
    local haveRoundStart = 0
    for i = 1, #round do
        if #round[i].V_RoundStart == 0 then
            if BattleManager.AllRole[round[i].atkId] ~= nil and not BattleManager.AllRole[round[i].atkId].isSummonObj and not BattleManager.AllRole[round[i].atkId].Remove then
                table.insert(atkOrder,BattleManager.AllRole[round[i].atkId].myAni.roleData.GameID)     --存活的人的攻击顺序
                if BattleManager.AllRole[round[i].atkId].myAni.XLing then
                    table.insert(characterIsCharge,0)   --存活的人正在充能
                else
                    table.insert(characterIsCharge,1)   --存活的人是否正在充能
                end
            end
        end
    end
    if #round[1].V_RoundStart ~= 0 then
        haveRoundStart = 1
    end
    if FightVideoViewModel.TrunCout ~= 0  then
        --移动一位
        --print("头像移动一位 第"..FightVideoViewModel.RoundCout.."轮  第" .. FightVideoViewModel.TrunCout .. " 回合")
        if not BattleManager.AllRole[round[FightVideoViewModel.TrunCout].atkId].isSummonObj then
            roleData.myAni:NextIcon(FightVideoViewModel.TrunCout - haveRoundStart,1)
        end
    else
        --刷新全部头像序列
        roleData.myAni:ShowNewOrderIcon(FightVideoViewModel.TrunCout,atkOrder,characterIsCharge)
    end
end
require("LocalData/SkillLocalData")
--require("JNBattle/JNStrTool") ---战斗工具类
--使用特效
FightVideoViewModel.LastUseEffectId=0
--存在的Debuff
FightVideoViewModel.ExistDebuff = {}
--使用特效
function FightVideoViewModel.UseEffect( atkId,_hitId,_skillId,_IsMianTar,_skilleff,_NotInSound)
    --if _skillId == FightVideoViewModel.LastSkillId and FightVideoViewModel.LastHitId == _hitId then     --不对同一个人重复使用特效
    --    return
    --end
    local skillEffect = SkillLocalData.tab[_skillId][20]    --技能伤害效果
    if (atkId ~= _hitId and tonumber(string.split(skillEffect,"_")[1]) == 29) then    --被反伤不显示特效
        return
    end
    if (atkId == _hitId and tonumber(string.split(skillEffect,"_")[1]) == 10) then    --水蛇对自己伤害不显示特效
        return
    end
    local effectTab = JNStrTool.SubAtkEffectId(_skilleff)   --_skilleff：技能表第五列  effectTab：技能ID表
    for key, value in pairs(effectTab) do
        for k, v in pairs(value) do
            if 68999 < tonumber(v[1]) and tonumber(v[1]) < 69999 and BattleManager.AllRole[_hitId] and BattleManager.AllRole[_hitId].myAni.IsWorldBoss then
                --print("世界boss不显示部分特效")
            else
                --print(atkId .. "释放特效:" .. tonumber(v[1]) .. "攻击" .. _hitId)
                if FightVideoViewModel.PlayEffectToMinorTarget(v[1],_IsMianTar) then
                    JNTurnEffectMgr.CreatEffTo_Action_Show( 0,false,atkId,_hitId,_IsMianTar ,{v},1,0,0  ,_NotInSound) --创建特效并播放
                end
            end
        end
    end
    FightVideoViewModel.LastSkillId = _skillId
    FightVideoViewModel.LastHitId = _hitId
end
--先判断有没有特效，并添加BuffIcon
function FightVideoViewModel.HaveEffectAndAddIcon( _skillId ,_hitId,_buffTime)
    local skilldata=SkillLocalData.tab[math.abs(_skillId)]
    if skilldata==nil then
        return 0
    end
    FightVideoViewModel.AddBuffIcon(_hitId,_skillId,skilldata[13],skilldata[33], _buffTime)     --给角色添加一个Buff
    return skilldata[5] ---特效ID
end
---结算回调
local cell = function(...)
    MgrTimer.AddDelayNoName(1,function()
        --敌方所有剩余的支援角色消失
        for i,v in pairs(BattleManager.AllRole) do
            if v.Occupation == 4 and v.Remove == false and v.IsLeft ~= FightVideoViewModel.LeftWin then
                v.myAni:HideSelf()
                v.myAni:PlayU3DVFX("TongYong_Prefab/chuansong.prefab")
            end
        end
    end,nil)
    FightVideoViewModel.isReturning = false
    ---还原播放速度
    CJNBattleMgr.SetGameSpeed(1)
    ---结算值统计
    --FightVideoViewModel.ReturnData()
    ---显示结算面板
    if MgrUI.GetCurUI().Uid ~= UID.Home_UI then
        BattleManager.ReturnToMainScene(FightVideoViewModel.LeftWin,...)
    end
end

local getTowerReward = false
local getGuideReward = false
---战斗结算
function FightVideoViewModel.ReturnToMainScene()
    --FightVideoViewModel.GiveUp = FightVideoViewModel.giveUp.GIVE_UP
    if FightVideoViewModel.isReturning then
        return
    end
    ---正在结算
    FightVideoViewModel.isReturning = true
    if BattleManager.GameMode == BattleManager.GameModeType.Normal
    then   ---普通战斗
        FightVideoViewModel.GetFightReward(FightVideoViewModel.GiveUp,cell)
    elseif BattleManager.GameMode == BattleManager.GameModeType.PVP
    then                                ---PVP战斗
    if PVPViewModel.IsViewRecord then
        cell()
    else
        if FightVideoViewModel.LeftWin then
            FightVideoViewModel.GetPVPReward(FightVideoViewModel.GiveUp,cell)
        else
            cell()
        end
    end
    elseif BattleManager.GameMode == BattleManager.GameModeType.FriendPVP
    then
        cell()
    elseif BattleManager.GameMode == BattleManager.GameModeType.RedTower
    then
        if getTowerReward and FightVideoViewModel.GiveUp ~= FightVideoViewModel.giveUp.GIVE_UP then
            FightVideoViewModel.GetTowerReward(FightVideoViewModel.GiveUp,cell)---红色巨塔战斗
        else
            FightVideoViewModel.TowerReward = nil
            if FightVideoViewModel.GiveUp == FightVideoViewModel.giveUp.GIVE_UP then
                FightVideoViewModel.LeftWin = false
            end
            cell()
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.MonthTower
    then
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
    elseif BattleManager.GameMode == BattleManager.GameModeType.Guide
    then
        if getGuideReward and FightVideoViewModel.GiveUp ~= FightVideoViewModel.giveUp.GIVE_UP then
            FightVideoViewModel.GetGuideReward(FightVideoViewModel.GiveUp,cell)---战术指导战斗
        else
            if FightVideoViewModel.GiveUp == FightVideoViewModel.giveUp.GIVE_UP then
                FightVideoViewModel.LeftWin = false
            end
            cell()
        end
    elseif BattleManager.GameMode == BattleManager.GameModeType.ActivityBoss then
        cell()
    else
        cell()
    end

end
---结算值统计
function FightVideoViewModel.ReturnData()

end

FightVideoViewModel.LeftWin = false
FightVideoViewModel.WorldBossKey = 0
FightVideoViewModel.WorldBossID = 0
FightVideoViewModel.GuideTeam = nil
FightVideoViewModel.DamageTotal = {}
---战斗请求发送
function FightVideoViewModel.Sending(mode,closePanelCallBack)
    ---开始前的部分记录
    FightVideoViewModel.BossHurt = 0
    FightVideoViewModel.ExistDebuff = {}
    FightVideoViewModel.playerExp = 0
    FightVideoViewModel.playerExp = PlayerControl.GetPlayerData().exp
    FightVideoViewModel.JumpOut = false
    FightVideoViewModel.isReturning = false
    FightVideoViewModel.LastSkillId = nil
    FightVideoViewModel.LastHitId = nil
    FightVideoViewModel.PausePhase = nil
    FightVideoViewModel.GiveUp = FightVideoViewModel.giveUp.DONE
    FightVideoViewModel.GuideTab = nil
    CJNBattleMgr.Instance.IsPause = false
    if mode == 1                --关卡挑战,当阵容存在可操作NPC角色时需要将场上玩家的角色(非NPC)保存至指定teamData,并告知服务器保存的teamID和当前使用的NPC角色
    then
        FightVideoViewModel.DamageTotal = {}
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
        MgrNet.SendReq(MID.CLIENT_SET_LEVEL_STAR_EX_REQ,bytes,0,nil,FightVideoViewModel.SignReceiveACK_New,function(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
            FightVideoViewModel.SignReceiveNTF_New(...)
        end)
        return
    elseif mode == 2    --播放PVPvideo
    then
        FightVideoViewModel.Calculagraph()
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        FightVideoViewModel.GameStart()
    elseif mode == 3    --Boss战
    then
        FightVideoViewModel.DamageTotal = {}
        local ClientBossBattleREQ = {
            teamID = 0,
            key = StormViewModel.CurStormBossId_Monster
        }
        local bytes = assert(pb.encode('PBClient.ClientBossBattleREQ',ClientBossBattleREQ))
        --print("发送签到"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_BOSS_BATTLE_E_REQ,bytes,0,nil,FightVideoViewModel.BossBattleSignReceiveACK,function(...)
            FightVideoViewModel.BossBattleSignReceiveNTF(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end)
        return
    elseif mode == 4    --模拟Boss战
    then
        FightVideoViewModel.DamageTotal = {}
        local ClientBossBattleTextREQ = {
            teamID = 0,
            bossID = StormViewModel.CurStormAnaBossId_Monster
        }
        local bytes = assert(pb.encode('PBClient.ClientBossBattleTextREQ',ClientBossBattleTextREQ))
        --print("发送签到"..pb.tohex(bytes))
        MgrNet.SendReq(MID.CLIENT_BOSS_BATTLE_TEXT_E_REQ,bytes,0,nil,FightVideoViewModel.ClientBossBattleTextACK,function(...)
            FightVideoViewModel.ClientBossBattleTextNTF(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end)
        return
    elseif mode == 5    --红色巨塔
    then
        FightVideoViewModel.DamageTotal = {}
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
        MgrNet.SendReq(MID.CLIENT_TOWER_BATTLE_REQ,bytes,0,nil, FightVideoViewModel.TowerAck_New, function(...)
            FightVideoViewModel.TowerNtf_New(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end)
    elseif mode == 6    --战术指导
    then
        FightVideoViewModel.DamageTotal = {}
        ---创建服务器需要的战术指导数据
        local tab = {
            towerID = StormViewModel.CurPointData.id,
            heroID = {}
        }
        ---获取通关时使用的角色
        for i, role in pairs(FightVideoViewModel.GuideTeam) do
            tab.heroID[#tab.heroID + 1] = role
        end
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientTowerBattleREQ',tab))
        ---发送结算请求
        MgrNet.SendReq(MID.CLIENT_GUIDE_BATTLE_REQ,bytes,0,nil, FightVideoViewModel.GuideAck_New,function(...)
            FightVideoViewModel.GuideNtf_New(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end )
    elseif mode == 7 or mode == 8   --活动Boss战
    then
        FightVideoViewModel.DamageTotal = {}
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
        MgrNet.SendReq(MID.CLIENT_SET_EVENT_BOSS_LEVEL_STAR_REQ,bytes,0,nil,FightVideoViewModel.ActivityBossACK,function(...)
            FightVideoViewModel.ActivityBossNTF(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end)
        return
    elseif mode == 9    --月塔挑战
    then
        FightVideoViewModel.DamageTotal = {}
        local tab = {
            level = StormViewModel.CurChooseMonthTower
        }
        local bytes = assert(pb.encode('PBClient.ClientMonthlyTowerFightREQ',tab))
        MgrNet.SendReq(MID.CLIENT_MONTHLY_TOWER_FIGHT_REQ,bytes,0,nil,FightVideoViewModel.MonthTowerACK,function(...)
            FightVideoViewModel.MonthTowerNTF(...)
            if closePanelCallBack then
                closePanelCallBack()
            end
        end)
    elseif mode == 10   --好友PVP
    then
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        FightVideoViewModel.GameStart()
    end
end
---月塔ACK
function FightVideoViewModel.MonthTowerACK(buffer,tag)
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
function FightVideoViewModel.MonthTowerNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientMonthlyTowerFightNTF',buffer))

    YueTaViewModel.Reward = tab.reward
    ---战斗胜负
    FightVideoViewModel.LeftWin = tab.leftWin
    ---更新视频
    FightVideoViewModel.SortVideo(tab)
    ---血量记录
    YueTaViewModel.PushHeroInfo(tab)
    ---更新物品奖励
    ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)

    FightVideoViewModel.RoundCout=0
    FightVideoViewModel.TrunCout=0
    FightVideoViewModel.GameStart()
end
---Boss数据请求验证
function FightVideoViewModel.BossSignReceiveACK(buffer, tag)
    --print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientBossDataACK',buffer))
    if tab.errNo ~= 0 then
        if tab.errNo == 564 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips1")..tab.errNo,2},true)
        else
            --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips2")..tab.errNo,2},true)
        end
    end
end
---Boss战斗请求验证
function FightVideoViewModel.BossBattleSignReceiveACK(buffer, tag)
    --print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientBossBattleACK',buffer))
    if tab.errNo == ServerErrorCode.BossBattle_564 then    --boss已被击杀
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips1")..tab.errNo,2},true)
        ---还原播放速度
        CJNBattleMgr.SetGameSpeed(1)
        ---结算值统计
        FightVideoViewModel.ReturnData()
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
function FightVideoViewModel.ClientBossBattleTextACK(buffer, tag)
    --print("回放ACK")
    local tab = assert(pb.decode('PBClient.ClientBossBattleTextACK',buffer))
    if tab.errNo == ServerErrorCode.BossBattleText_564 then    --Boss已被击杀
        MgrUI.UnLock("battle_start")
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips1")..tab.errNo,2},true)
        ---还原播放速度
        CJNBattleMgr.SetGameSpeed(1)
        ---结算值统计
        FightVideoViewModel.ReturnData()
        ---显示结算面板
        if MgrUI.GetCurUI().Uid ~= UID.Home_UI then
            BattleManager.ReturnToMainScene(false)
        end
    else
        MgrUI.UnLock("battle_start")
        --MgrUI.Pop(UID.PopTip_UI,{"错误ID："..tab.errNo,2},true)
    end
end
---普通战斗请求验证_新
function FightVideoViewModel.SignReceiveACK_New(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarExACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end
---数据推送 普通战斗NTF_新
function FightVideoViewModel.SignReceiveNTF_New(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarExNTF',buffer))
    ---如果队伍信息本地和服务器对不上，按照服务器的队伍设置本地队伍
    local teamIsCorrect = true
    local localTeam = {}
    if not NoviceControl.battleStart then
        localTeam = StormViewModel.localTeam
    else
        localTeam = FightVideoViewModel.GuideTeam
        NoviceControl.battleStart = false
    end
    if StormViewModel.NpcTeam ~= nil then
        for i, fighter in pairs(StormViewModel.NpcTeam) do
            localTeam[i] = fighter
        end
    end
    if StormViewModel.FriendSupportTeam ~= nil then
        for i, fighter in pairs(StormViewModel.FriendSupportTeam) do
            localTeam[i] = fighter
        end
    end
    for i = 1, #localTeam, 1 do
        print("本地队伍成员 : "..localTeam[i].index .. " " .. localTeam[i].roleID)
    end
    local FWQTeam = tab.point
    for i = 1, #FWQTeam, 1 do
        print("服务器队伍成员 : "..FWQTeam[i].index .. " " .. FWQTeam[i].roleID)
    end
    for i = 1, #localTeam, 1 do
        if localTeam[i].index ~= FWQTeam[i].index or localTeam[i].roleID ~= FWQTeam[i].roleID then
            teamIsCorrect = false
        end
    end
    ---更新视频
    FightVideoViewModel.SortVideo(tab)
    if teamIsCorrect == true then
        print("两边队伍一致")
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        --print("----------开始主线战斗---------")
        FightVideoViewModel.GameStart()
    else
        print("发送队伍与服务器战斗队伍不匹配，按照服务器的队伍进行战斗")
        ---重排己方阵型
        FightVideoViewModel.LoadTeamRole(FWQTeam,0)
        ---开始战斗
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        print("----------开始主线战斗---------")
        FightVideoViewModel.GameStart()
    end
end
---普通战斗结算
function FightVideoViewModel.GetFightReward(state,cell)
    local REQ = {
        status = state
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientChooseBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
            FightVideoViewModel.GetFightRewardACK,
            function(...)
                FightVideoViewModel.GetFightRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end
function FightVideoViewModel.GetFightRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseBattleRewardACK',buffer))
    if tab.errNo ~= 0 then
        FightVideoViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end
function FightVideoViewModel.GetFightRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientChooseBattleRewardNTF',buffer))
    ---保存普通奖励
    FightVideoViewModel.NormalRewardTab = tab
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
        FightVideoViewModel.LeftWin = true
    else
        FightVideoViewModel.LeftWin = false
    end
    ---设置地图,玩家所在位置
    if tab.activityPos then
        SummerMapControl.SetMapPos(tab.activityPos)
        SummerMapControl.ChangeLogicState(tab.activityPos,tab.levelStar,tab.levelID)
    end
end
---PVP战斗结算
function FightVideoViewModel.GetPVPReward(state,cell)
    local REQ = {
        status = state
    }
    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_LADDER_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,
            function(...)
                FightVideoViewModel.GetPVPRewardACK(...,cell)
            end,
            function(...)
                FightVideoViewModel.GetPVPRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end
function FightVideoViewModel.GetPVPRewardACK(buffer,tag,cell)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleRewardACK',buffer))
    if tab.errNo ~= 0 then
        FightVideoViewModel.isReturning = false
        if tab.errNo == ServerErrorCode.HighLadderBattleReward_9 then  ---PVP战斗已经结算过了
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text102")..tab.errNo,1},true)
            return
        elseif tab.errNo == ServerErrorCode.HighLadderBattleReward_501 then  ---PVP战斗结算时间已过
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus")..tab.errNo,1},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("fightvideoviewmodel_tips3")..tab.errNo,1},true)
        end
        if FightVideoViewModel.BackToPVP then
            FightVideoViewModel.BackToPVP = false
            MgrTimer.AddDelayNoName(1,function()
                --敌方所有剩余的支援角色消失
                for i,v in pairs(BattleManager.AllRole) do
                    if v.Occupation == 4 and v.Remove == false and v.IsLeft ~= FightVideoViewModel.LeftWin then
                        v.myAni:HideSelf()
                        v.myAni:PlayU3DVFX("TongYong_Prefab/chuansong.prefab")
                    end
                end
                ---还原播放速度
                CJNBattleMgr.SetGameSpeed(1)
                ---退回PVP准备界面
                local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
                MgrBattle.GoFight(MgrBattle.fightType.pvp,function() FightVideoViewModel.BackToPVP = true end,rankData[15])
            end,nil)
        end
    end
end
function FightVideoViewModel.GetPVPRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleRewardNTF',buffer))
    ---结果
    FightVideoViewModel.LeftWin = tab.result ~= 1 and true or false
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
function FightVideoViewModel.GetPVPReward2(state,cell)
    local REQ = {
        status = state
    }
    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleRewardREQ',REQ))
    MgrNet.SendReq(MID.CLIENT_CHOOSE_LADDER_BATTLE_REWARD_REQ,bytes,0,function(...)
        CJNBattleMgr.SetGameSpeed(1)
    end,FightVideoViewModel.GetPVPRewardACK,
            function(...)
                FightVideoViewModel.GetPVPRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end

---Boss数据NTF
function FightVideoViewModel.BossSignReceiveNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBossDataNTF',buffer))
    FightVideoViewModel.WorldBossKey = tab.subKey
    FightVideoViewModel.WorldBossID = tab.bossID
    print("已读取到Boss数据")
end
---Boss战斗NTF
function FightVideoViewModel.BossBattleSignReceiveNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBossBattleNTF',buffer))
    FightVideoViewModel.SortVideo(tab)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    FightVideoViewModel.LHTFReward = {}
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
    FightVideoViewModel.LeftWin = true
    FightVideoViewModel.RoundCout=0 --轮数下标
    FightVideoViewModel.TrunCout=0 --回合数下标
    print("------------------正式开始战斗---------")
    FightVideoViewModel.GameStart()
end
---模拟boss战斗NTF
function FightVideoViewModel.ClientBossBattleTextNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBossBattleTextNTF',buffer))
    FightVideoViewModel.SortVideo(tab)
    FightVideoViewModel.AniBossScore = tab.score
    FightVideoViewModel.AniBossRoundScore = tab.roundScore
    FightVideoViewModel.AniBossKillScore = tab.killScore
    FightVideoViewModel.AniBossDamageScore = tab.damageScore
    FightVideoViewModel.LeftWin = true
    FightVideoViewModel.RoundCout=0 --轮数下标
    FightVideoViewModel.TrunCout=0 --回合数下标
    print("------------------正式开始战斗---------")
    FightVideoViewModel.GameStart()
end
---红色巨塔请求ACK
function FightVideoViewModel.TowerAck_New(buffer,tag)
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
function FightVideoViewModel.TowerNtf_New(buffer,tag)
    local recNtf = assert(pb.decode('PBClient.ClientTowerBattleNTF',buffer))
    ---播放
    FightVideoViewModel.SortVideo(recNtf)
    ---记录结果
    if recNtf.result == 0 then
        getTowerReward = false
        FightVideoViewModel.LeftWin = false
    elseif recNtf.result == 1 then
        getTowerReward = true
        FightVideoViewModel.LeftWin = true
    end
    FightVideoViewModel.RoundCout=0 --轮数下标
    FightVideoViewModel.TrunCout=0 --回合数下标
    print("----------开始红色巨塔战斗---------")
    FightVideoViewModel.GameStart()
end
---红色巨塔结算
function FightVideoViewModel.GetTowerReward(state,cell)
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
            FightVideoViewModel.GetTowerRewardACK,
            function(...)
                FightVideoViewModel.GetTowerRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end
function FightVideoViewModel.GetTowerRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardACK',buffer))
    if tab.errNo ~= 0 then
        FightVideoViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end
function FightVideoViewModel.GetTowerRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardNTF',buffer))
    if tab == nil then
        FightVideoViewModel.LeftWin = false
        return
    end
    FightVideoViewModel.TowerReward = nil
    FightVideoViewModel.TowerReward = tab.reward
    if FightVideoViewModel.TowerReward and #FightVideoViewModel.TowerReward ~= 0 then
        ---更新物品奖励
        ItemControl.PushGroupItemData(FightVideoViewModel.TowerReward,ItemControl.PushEnum.add)
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
        --FightVideoViewModel.LeftWin = true
    else
        --FightVideoViewModel.LeftWin = false
    end
end
---战术指导请求ACK
function FightVideoViewModel.GuideAck_New(buffer,tag)
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
function FightVideoViewModel.GuideNtf_New(buffer,tag)
    local recNtf = assert(pb.decode('PBClient.ClientTowerBattleNTF',buffer))
    ---整理视频
    FightVideoViewModel.SortVideo(recNtf)
    ---记录结果
    if recNtf.result == 0 then  --失败
        getGuideReward = false
        FightVideoViewModel.LeftWin = false
    elseif recNtf.result == 1 then  --胜利
        getGuideReward = true
        FightVideoViewModel.LeftWin = true
    end
    FightVideoViewModel.RoundCout=0 --轮数下标
    FightVideoViewModel.TrunCout=0 --回合数下标
    print("------------------正式开始战斗---------")
    FightVideoViewModel.GameStart()
end
---战术指导结算
function FightVideoViewModel.GetGuideReward(state,cell)
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
            FightVideoViewModel.GetGuideRewardACK,
            function(...)
                FightVideoViewModel.GetGuideRewardNTF(...)
                if cell then
                    cell()
                end
            end)
end
function FightVideoViewModel.GetGuideRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardACK',buffer))
    if tab.errNo ~= 0 then
        FightVideoViewModel.isReturning = false
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1")..tab.errNo, function ()
            MgrSdk.BackToLogin()
        end},true)
    end
end
function FightVideoViewModel.GetGuideRewardNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTowerRewardNTF',buffer))
    if tab == nil then
        FightVideoViewModel.LeftWin = false
        return
    end
    ---记录
    FightVideoViewModel.GuideTab = tab
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if tab.info then
        ---更新战术指导状态
        StormControl.PushGuideData({tab.info.towerID})
        FightVideoViewModel.LeftWin = true
    else
        FightVideoViewModel.LeftWin = false
    end
    if tab.reward ~= nil and FightVideoViewModel.LeftWin then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
    end
end
---活动Boss战斗请求验证
function FightVideoViewModel.ActivityBossACK(buffer, tag)
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
        --MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("activityviewmodel_tips1"), function ()
            --MgrSdk.BackToLogin()
        --end},true)
    end

end
---数据推送 活动Boss战斗结算NTF
function FightVideoViewModel.ActivityBossNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSetLevelStarNTF',buffer))
    ---如果队伍信息本地和服务器对不上，按照服务器的队伍设置本地队伍
    local teamIsCorrect = true
    local localTeam = StormViewModel.localTeam
    if StormViewModel.FriendSupportTeam ~= nil then
        for i, fighter in pairs(StormViewModel.FriendSupportTeam) do
            localTeam[i] = fighter
        end
    end
    local FWQTeam = tab.point
    for i = 1, #localTeam, 1 do
        print("本地队伍成员 : "..localTeam[i].index .. " " .. localTeam[i].roleID)
    end
    for i = 1, #FWQTeam, 1 do
        print("服务器队伍成员 : "..FWQTeam[i].index .. " " .. FWQTeam[i].roleID)
    end
    for i = 1, #localTeam, 1 do
        for j = 1, #FWQTeam,1 do
            if localTeam[i].index == FWQTeam[j].index then
                if  localTeam[i].roleID ~= FWQTeam[j].roleID  then
                    teamIsCorrect = false
                    break
                end
            end
        end
    end
    if #FWQTeam ~= #localTeam then
        teamIsCorrect = false
    end
    if teamIsCorrect == true then
        print("两边队伍一致")
        ---更新视频
        FightVideoViewModel.SortVideo(tab)
        ---保存普通奖励
        FightVideoViewModel.NormalRewardTab = nil
        FightVideoViewModel.NormalRewardTab = tab
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
            FightVideoViewModel.LeftWin = true
        else
            FightVideoViewModel.LeftWin = false
        end
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        print("------------------正式开始战斗---------")
        FightVideoViewModel.GameStart()
    else
        print("发送队伍与服务器战斗队伍不匹配，按照服务器的队伍进行战斗")
        ---重排己方阵型
        FightVideoViewModel.LoadTeamRole(FWQTeam,0)
        ---更新视频
        FightVideoViewModel.SortVideo(tab)
        ---保存普通奖励
        FightVideoViewModel.NormalRewardTab = nil
        FightVideoViewModel.NormalRewardTab = tab
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
            FightVideoViewModel.LeftWin = true
        else
            FightVideoViewModel.LeftWin = false
        end
        FightVideoViewModel.RoundCout=0 --轮数下标
        FightVideoViewModel.TrunCout=0 --回合数下标
        print("------------------正式开始战斗---------")
        FightVideoViewModel.GameStart()
    end
end
function FightVideoViewModel.SortVideo(tab)
    ---设置默认机位
    BattleManager.SetCanmeraNor()
    local tempVideos={} --临时的,未分类
    for i, v in ipairs(tab.video) do  --本轮所有的回放数据 ,每次到新id就加入HeadIcons
        tempVideos[i]={}
        local cout=1
        for i1, v1 in ipairs(v.video) do --所有行动数据
            --先解析出id和行动类型
            local  gameid = Tools.IDtype(v1.gameActionSkillIDType)
            local  v_video={}
            v_video.atkId=gameid[0] --施法者
            v_video.actType=gameid[1] --行动类型
            v_video.SkillType=gameid[2] --技能类型
            v_video.SkillNumber=v1.skillNum --技能数值
            v_video.delSkill={} --如果移除技能
            v_video.delSkill.delNum={}  --如果actType == 12,那么此处为闪避
            v_video.delSkill.skillID=nil
            v_video.delSkill.skillTime=nil
            --判断有没有加入/移除 buff
            if v1.skillData~=nil then   --添加技能 AddSkillData
                local skillid=  Tools.IdTime(v1.skillData.gameIDTime)
                v_video.hitId= skillid[0]
                v_video.hitTime=skillid[1]
                v_video.hitskillID=v1.skillData.skillID
            else
                v_video.hitId= 0    --移除buff的hitId = 0
                v_video.hitTime=0
                v_video.hitskillID=0
            end
            if v1.delSkillID~=nil then --如果有要删除的技能，移除一个buffid
                v_video.delSkill.delNum={}
                v_video.delSkill.skillID=v1.delSkillID.skillID
                v_video.delSkill.skillTime=v1.delSkillID.skillTime

                --判断有几个需要移除的属性值
                if v1.delSkillID.delSkillData~=nil then
                    for _, v2 in pairs(v1.delSkillID.delSkillData) do
                        local v_delSkill={}
                        v_delSkill.reType=v2.type   --移除类型
                        v_delSkill.reNumber=v2.num  --移除时的数值(比如移除护盾时的伤害值)
                        --print(i.."轮"..i1.."回".."施法者 ".. BattleManager.AllRole[v_video.atkId].Name .. " 技能ID " ..  v_video.delSkill.skillID.."移除解析++++移除类型"..  v_delSkill.reType .. " 数值 " .. v_delSkill.reNumber)
                        table.insert(v_video.delSkill.delNum ,v_delSkill)
                    end
                end
            end
            tempVideos[i][cout]=v_video
            --table.insert(tempVideos[i],cout,v_video)
            cout=cout+1

        end
    end
    print("------------------游戏开始时---------")
    --遍历所有videos
    local  v_turn={}
    v_turn.hitId=0
    v_turn.V_TurnStart={} --回合开始     1
    v_turn.V_TurnStartEX={} --回合开始Ex2
    v_turn.V_BefAtkSelf={} --我方攻击前
    v_turn.V_BefAtkEnemy = {}   --对方受击前
    v_turn.V_BefAtkBuff = {}
    v_turn.V_Atk={} --普攻3
    v_turn.V_AftAtkEnemy = {}   --对方受击后
    v_turn.V_AftAtkSelf={}  --我方攻击后
    v_turn.V_AftAtkBuff = {}
    v_turn.V_TurnEndEX={} --回合结束Ex5
    v_turn.V_TurnEnd={} --回合结束4
    v_turn.V_ExAftDead={} --死亡后的EX(对目标)
    v_turn.V_ExAftDeadToSelf={} --死亡后的EX(对自己)
    v_turn.V_DeadSkill = {}
    v_turn.V_RoleDead={} --死亡6
    v_turn.V_RoundStart={} --每轮开始时7
    v_turn.V_RoundEnd={} --每轮结束时8
    v_turn.V_AtkPass={} --眩晕9
    v_turn.V_AtkCharge={} --蓄力10
    v_turn.V_ExchangePosition = {} --交换位置18(献身等)
    v_turn.V_SecondPhase = {} --二阶段战斗19
    --v_turn.V_BeforeSupport = {} --支援前20
    --v_turn.V_AfterSupport = {} --支援后21
    v_turn.V_BeforeSupportSelf = {} --支援前20
    v_turn.V_BeforeSupportEnemy = {} --支援前20
    v_turn.V_AfterSupportSelf = {} --支援后21
    v_turn.V_AfterSupportEnemy = {} --支援后21
    v_turn.V_DebuffDamageExploded = {} --debuff引爆22
    v_turn.TargetDeadSkill = {} --击杀时技能27
    v_turn.V_DodgeRole = {} --本回合闪避角色
    v_turn.isSupport=false
    v_turn.playedKillVoice = false
    FightVideoViewModel.AllVideos = {}
    FightVideoViewModel.GameStartVideo={}   --第一场战斗开场技能
    FightVideoViewModel.GameTwoStartVideo={}    --第一场战斗开场技能
    local lastType = 7
    for i, v in ipairs(tempVideos) do
        FightVideoViewModel.AllVideos[i]={}     --Round总数，表内存每回合的作战内容
        for i2, v_video in ipairs(tempVideos[i]) do
            -- print("zqx SortVideo:"..i..","..i2..":"..serpent.block(v_video))
            if  v_video.actType==0 or v_video.actType==28 then --添加到游戏开始
                if BattleManager.AllRole[v_video.atkId] == nil and #BattleManager.AllRole ~= 0 then
                    if BattleManager.GameMode == BattleManager.GameModeType.PVP then
                        table.insert(FightVideoViewModel.GameStartVideo,v_video)
                    else
                        table.insert(FightVideoViewModel.GameTwoStartVideo,v_video)
                    end
                else
                    table.insert(FightVideoViewModel.GameStartVideo,v_video)
                end
                lastType = 0
            elseif  v_video.actType==1 then
                table.insert(v_turn.V_TurnStart ,v_video ) --回合开始1
            elseif   v_video.actType==2 then
                table.insert(v_turn.V_TurnStartEX ,v_video ) --回合开始Ex2
            elseif   v_video.actType==3 then
                -- table.insert(v_turn.V_Atk ,v_video )  --普攻3
                if v_turn.V_Atk[v_video.hitId] == nil then
                    v_turn.V_Atk[v_video.hitId] = {}
                end
                table.insert(v_turn.V_Atk[v_video.hitId] ,v_video )
            elseif  v_video.actType==4 then
                table.insert(v_turn.V_TurnEnd ,v_video )   --回合结束4
            elseif  v_video.actType==5 then
                table.insert(v_turn.V_TurnEndEX ,v_video )  --回合结束Ex5
            elseif  v_video.actType==6 then
                table.insert(v_turn.V_RoleDead ,v_video )   --死亡6
            elseif  v_video.actType==7 then
                if lastType == 12 or lastType == 0 then
                    v_turn={}
                    v_turn.atkId=v_video.atkId  --攻击者
                    v_turn.hitId=0  --被攻击者
                    v_turn.V_TurnStart={} --回合开始     1
                    v_turn.V_TurnStartEX={} --回合开始Ex2
                    v_turn.V_BefAtkSelf={} --我方攻击前
                    v_turn.V_BefAtkEnemy = {}   --对方受击前
                    v_turn.V_BefAtkBuff = {}
                    v_turn.V_Atk={} --普攻3
                    v_turn.V_AftAtkEnemy = {}   --对方受击后
                    v_turn.V_AftAtkSelf={}  --我方攻击后
                    v_turn.V_AftAtkBuff = {}
                    v_turn.V_TurnEnd={} --回合结束4
                    v_turn.V_ExAftDead={} --死亡后的EX(对目标)
                    v_turn.V_ExAftDeadToSelf={} --死亡后的EX(对自己)
                    v_turn.V_DeadSkill = {}
                    v_turn.V_TurnEndEX={} --回合结束Ex5
                    v_turn.V_RoleDead={} --死亡6
                    v_turn.V_RoundStart={} --每轮开始时7
                    v_turn.V_RoundEnd={} --每轮结束时8
                    v_turn.V_AtkPass={} --眩晕9
                    v_turn.V_AtkCharge={} --蓄力10
                    v_turn.V_ExchangePosition = {} --交换位置18(献身等)
                    v_turn.V_SecondPhase = {} --二阶段战斗19
                    --v_turn.V_BeforeSupport = {} --支援前20
                    --v_turn.V_AfterSupport = {} --支援后21
                    v_turn.V_BeforeSupportSelf = {} --支援前20
                    v_turn.V_BeforeSupportEnemy = {} --支援前20
                    v_turn.V_AfterSupportSelf = {} --支援后21
                    v_turn.V_AfterSupportEnemy = {} --支援后21
                    v_turn.V_DebuffDamageExploded = {} --debuff引爆22
                    v_turn.TargetDeadSkill = {} --击杀时技能27
                    v_turn.V_DodgeRole = {}     --闪避角色
                    v_turn.isSupport=false
                    v_turn.playedKillVoice = false
                    table.insert(FightVideoViewModel.AllVideos[i],v_turn)
                    lastType = 7
                end
                table.insert(v_turn.V_RoundStart ,v_video )  --每轮开始时7
            elseif  v_video.actType==8 then
                table.insert(v_turn.V_RoundEnd ,v_video )    --每轮结束时8
            elseif  v_video.actType==9 then
                table.insert(v_turn.V_AtkPass ,v_video )   --眩晕9
            elseif  v_video.actType==10 then
                table.insert(v_turn.V_AtkCharge ,v_video ) --蓄力10
            elseif  v_video.actType==12 then
                --本回合主角12 创建新的
                v_turn={}
                v_turn.atkId=v_video.atkId  --攻击者
                v_turn.hitId=0  --被攻击者
                v_turn.V_TurnStart={} --回合开始     1
                v_turn.V_TurnStartEX={} --回合开始Ex2
                v_turn.V_BefAtkSelf={} --我方攻击前
                v_turn.V_BefAtkEnemy = {}   --对方受击前
                v_turn.V_BefAtkBuff = {}
                v_turn.V_Atk={} --普攻3
                v_turn.V_AftAtkEnemy = {}   --对方受击后
                v_turn.V_AftAtkSelf={}  --我方攻击后
                v_turn.V_AftAtkBuff = {}
                v_turn.V_TurnEnd={} --回合结束4
                v_turn.V_ExAftDead={} --死亡后的EX(对目标)
                v_turn.V_ExAftDeadToSelf={} --死亡后的EX(对自己)
                v_turn.V_DeadSkill = {}
                v_turn.V_TurnEndEX={} --回合结束Ex5
                v_turn.V_RoleDead={} --死亡6
                v_turn.V_RoundStart={} --每轮开始时7
                v_turn.V_RoundEnd={} --每轮结束时8
                v_turn.V_AtkPass={} --眩晕9
                v_turn.V_AtkCharge={} --蓄力10
                v_turn.V_ExchangePosition = {} --交换位置18(献身等)
                v_turn.V_SecondPhase = {} --二阶段战斗19
                --v_turn.V_BeforeSupport = {} --支援前20
                --v_turn.V_AfterSupport = {} --支援后21
                v_turn.V_BeforeSupportSelf = {} --支援前20
                v_turn.V_BeforeSupportEnemy = {} --支援前20
                v_turn.V_AfterSupportSelf = {} --支援后21
                v_turn.V_AfterSupportEnemy = {} --支援后21
                v_turn.V_DebuffDamageExploded = {} --debuff引爆22
                v_turn.TargetDeadSkill = {} --击杀时技能27
                v_turn.V_DodgeRole = {}     --闪避角色
                if #v_video.delSkill.delNum ~= 0 then
                    for i,v in pairs(v_video.delSkill.delNum) do
                        table.insert(v_turn.V_DodgeRole,v.reType)
                    end
                end
                v_turn.isSupport=false
                v_turn.playedKillVoice = false
                table.insert(FightVideoViewModel.AllVideos[i],v_turn)
                lastType = 12
            elseif v_video.actType==13 then
                -- table.insert(v_turn.V_Atk ,v_video )  --普攻3
                v_turn.hitId=v_video.hitId
                if v_turn.V_Atk[v_video.hitId] == nil then
                    v_turn.V_Atk[v_video.hitId] = {}
                end
                table.insert(v_turn.V_Atk[v_video.hitId] ,v_video )
            elseif v_video.actType==14 then --攻击前
                -- table.insert(v_turn.V_BefAtk ,v_video )
                if v_video.atkId == v_turn.atkId then
                    if FightVideoViewModel.isDamageType(v_video.SkillType, v_video.SkillNumber)
                    then
                        if v_turn.V_BefAtkSelf[v_video.hitId] == nil then
                            v_turn.V_BefAtkSelf[v_video.hitId] = {}
                        end
                        table.insert(v_turn.V_BefAtkSelf[v_video.hitId] ,v_video)
                    else
                        table.insert(v_turn.V_BefAtkBuff,v_video)
                    end
                else
                    if FightVideoViewModel.isDamageType(v_video.SkillType, v_video.SkillNumber)
                    then
                        if v_turn.V_BefAtkEnemy[v_video.atkId] == nil then
                            v_turn.V_BefAtkEnemy[v_video.atkId] = {}
                        end
                        if v_turn.V_BefAtkEnemy[v_video.atkId][v_video.hitId] == nil then
                            v_turn.V_BefAtkEnemy[v_video.atkId][v_video.hitId] = {}
                        end
                        table.insert(v_turn.V_BefAtkEnemy[v_video.atkId][v_video.hitId] ,v_video)
                    else
                        table.insert(v_turn.V_BefAtkBuff,v_video)
                    end
                end
            elseif v_video.actType==15 then --攻击后
                -- table.insert(v_turn.V_AftAtk ,v_video )
                if v_video.atkId == v_turn.atkId then
                    if v_turn.V_AftAtkSelf[v_video.hitId] == nil then
                        v_turn.V_AftAtkSelf[v_video.hitId] = {}
                    end
                    table.insert(v_turn.V_AftAtkSelf[v_video.hitId] ,v_video )
                else
                    if v_turn.V_AftAtkEnemy[v_video.atkId] == nil then  --所有其他人在该回合的行动都包含在其中，包括己方其他人
                        v_turn.V_AftAtkEnemy[v_video.atkId] = {}
                    end
                    if v_turn.V_AftAtkEnemy[v_video.atkId][v_video.hitId] == nil then
                        v_turn.V_AftAtkEnemy[v_video.atkId][v_video.hitId] = {}
                    end
                    table.insert(v_turn.V_AftAtkEnemy[v_video.atkId][v_video.hitId] ,v_video )
                end
            elseif v_video.actType == 16 then --支援的主要目标
                v_turn.hitId=v_video.atkId
                v_turn.isSupport = true
            elseif v_video.actType == 17 then   --死亡后的EX(对目标)
                table.insert(v_turn.V_ExAftDead ,v_video )
            elseif v_video.actType == 18 then   --交换位置(献身等)
                table.insert(v_turn.V_ExchangePosition ,v_video)
            elseif v_video.actType == 19 then   --战斗二阶段转换
                table.insert(v_turn.V_SecondPhase ,v_video)
            elseif v_video.actType == 20 then   --支援前
                if v_video.atkId == v_turn.atkId then
                    if v_turn.V_BeforeSupportSelf[v_video.hitId] == nil then
                        v_turn.V_BeforeSupportSelf[v_video.hitId] = {}
                    end
                    table.insert(v_turn.V_BeforeSupportSelf[v_video.hitId] ,v_video )
                else
                    if v_turn.V_BeforeSupportEnemy[v_video.atkId] == nil then
                        v_turn.V_BeforeSupportEnemy[v_video.atkId] = {}
                    end
                    if v_turn.V_BeforeSupportEnemy[v_video.atkId][v_video.hitId] == nil then
                        v_turn.V_BeforeSupportEnemy[v_video.atkId][v_video.hitId] = {}
                    end
                    table.insert(v_turn.AfterSupportEnemy[v_video.atkId][v_video.hitId] ,v_video )
                end
                --table.insert(v_turn.V_BeforeSupport ,v_video)
            elseif v_video.actType == 21 then   --支援后
                if v_video.atkId == v_turn.atkId then
                    if v_turn.V_AfterSupportSelf[v_video.hitId] == nil then
                        v_turn.V_AfterSupportSelf[v_video.hitId] = {}
                    end
                    table.insert(v_turn.V_AfterSupportSelf[v_video.hitId] ,v_video )
                else
                    if v_turn.V_AfterSupportEnemy[v_video.atkId] == nil then
                        v_turn.V_AfterSupportEnemy[v_video.atkId] = {}
                    end
                    if v_turn.V_AfterSupportEnemy[v_video.atkId][v_video.hitId] == nil then
                        v_turn.V_AfterSupportEnemy[v_video.atkId][v_video.hitId] = {}
                    end
                    table.insert(v_turn.V_AfterSupportEnemy[v_video.atkId][v_video.hitId] ,v_video )
                end
                --table.insert(v_turn.V_AfterSupport ,v_video)
            elseif v_video.actType == 22 then   --debuff引爆
                table.insert(v_turn.V_DebuffDamageExploded ,v_video)
            elseif v_video.actType == 27 then   --击杀时技能
                table.insert(v_turn.TargetDeadSkill ,v_video)
            elseif v_video.actType == 29 then   --死亡后的EX(对自己)
                table.insert(v_turn.V_ExAftDeadToSelf ,v_video)
            elseif v_video.actType == 30 then   --死亡后的小技能
                table.insert(v_turn.V_DeadSkill ,v_video)
            end
            if BattleManager.GameMode ~= BattleManager.GameModeType.PVP then
                FightVideoViewModel.Recount(v_video, v_turn.atkId)    ---统计伤害(非PVP)
            else
                FightVideoViewModel.PVPRecount(v_video, v_turn.atkId)    ---统计伤害(PVP)
            end
        end
    end
    local a = 0
end

function FightVideoViewModel.Recount(v_video,turnAtkId)
    if v_video.SkillType==1 or v_video.SkillType==9 or v_video.SkillType==11 or v_video.SkillType==12 or v_video.SkillType==13 or v_video.SkillType == 10029 or v_video.SkillType == 10084 or v_video.SkillType == 10083
    then
        local _atkId
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if BattleManager.AllRole[v_video.atkId] == nil and v_video.atkId ~= 0 then
            if v_video.delSkill.skillTime ~= nil then
                _atkId = v_video.delSkill.skillTime     --Dot的攻击者通过skilltime来传
            else
                _atkId = v_video.atkId                  --不满足Dot条件并且无法在AllRole中找到的,为二次战斗数据
            end
        else
            _atkId = v_video.atkId
        end
        if v_video.SkillType == 10083 then
            _atkId = turnAtkId
        end
        --伤害统计
        if v_video. SkillNumber <= 0 then
            if FightVideoViewModel.DamageTotal[_atkId] ~= nil then
                FightVideoViewModel.DamageTotal[_atkId] = FightVideoViewModel.DamageTotal[_atkId] + v_video. SkillNumber
                print("GameID " .. _atkId .. "释放技能 : ".. v_video.hitskillID .."  打出伤害: ".. v_video.SkillNumber)
            else
                FightVideoViewModel.DamageTotal[_atkId] = v_video.SkillNumber
                print("GameID " .. _atkId .. "释放技能 : ".. v_video.hitskillID .."  打出伤害: ".. v_video.SkillNumber)
            end
        end
    elseif v_video._SkillType==10 or v_video._SkillType==72
    then
        local _atkId
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if BattleManager.AllRole[v_video.atkId] == nil and v_video.atkId ~= 0 then
            if v_video.delSkill.skillTime ~= nil then
                _atkId = v_video.delSkill.skillTime     --Dot的攻击者通过skilltime来传
            else
                _atkId = v_video.atkId                  --不满足Dot条件并且无法在AllRole中找到的,为二次战斗数据
            end
        else
            _atkId = v_video.atkId
        end
        --伤害统计
        if v_video. SkillNumber <= 0 then
            if FightVideoViewModel.DamageTotal[_atkId] ~= nil then
                FightVideoViewModel.DamageTotal[_atkId] = FightVideoViewModel.DamageTotal[_atkId] + v_video.SkillNumber
                print("GameID " .. _atkId .. "释放技能 : ".. v_video.hitskillID .."  打出伤害: ".. v_video.SkillNumber)
            else
                FightVideoViewModel.DamageTotal[_atkId] = v_video.SkillNumber
                print("GameID " .. _atkId .. "释放技能 : ".. v_video.hitskillID .."  打出伤害: ".. v_video.SkillNumber)
            end
        end
    end
end

function FightVideoViewModel.PVPRecount(v_video,turnAtkId)
    if v_video.SkillType==1 or v_video.SkillType==9 or v_video.SkillType==11 or v_video.SkillType==12 or v_video.SkillType==13 or v_video.SkillType==10029 or v_video.SkillType==10084 or v_video.SkillType==10083
    then
        local _atkId
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if PVPViewModel.AllRole[v_video.atkId] == nil and v_video.atkId ~= 0 then
            if v_video.delSkill.skillTime ~= nil then
                _atkId = v_video.delSkill.skillTime
            else
                return
            end
        else
            _atkId = v_video.atkId
        end
        if v_video.SkillType == 10083 then
            _atkId = turnAtkId
        end
        --伤害统计
        if v_video. SkillNumber <= 0 then
            if FightVideoViewModel.DamageTotal[_atkId] ~= nil then
                FightVideoViewModel.DamageTotal[_atkId] = FightVideoViewModel.DamageTotal[_atkId] + v_video. SkillNumber
            else
                FightVideoViewModel.DamageTotal[_atkId] = v_video.SkillNumber
            end
        end
    elseif v_video._SkillType==10 or v_video._SkillType==72
    then
        local _atkId
        --Dot伤害，受击者ID为攻击者的负数，_DelSkill的skilltime为攻击者ID
        if PVPViewModel.AllRole[v_video.atkId] == nil and v_video.atkId ~= 0 then
            if v_video.delSkill.skillTime ~= nil then
                _atkId = v_video.delSkill.skillTime
            else
                return
            end
        else
            _atkId = v_video.atkId
        end
        --伤害统计
        if v_video. SkillNumber <= 0 then
            if FightVideoViewModel.DamageTotal[_atkId] ~= nil then
                FightVideoViewModel.DamageTotal[_atkId] = FightVideoViewModel.DamageTotal[_atkId] + v_video.SkillNumber
            else
                FightVideoViewModel.DamageTotal[_atkId] = v_video.SkillNumber
            end
        end
    end
end

---加载阵型
function FightVideoViewModel.LoadTeamRole(team,flayDelay)
    ---解除左侧队列角色
    FightVideoViewModel.ReMoveAllLeft()
    ---获取阵型数据
    if team == nil or #team == 0 then
        return
    end
    BattleManager.LeftAtkOrderCout=1
    for atkOrder, fighter in ipairs(team) do
        ---创建立绘并获得该角色所有数据
        local role = FightVideoViewModel.GetOrCreatSpineRole(HeroControl.GetRoleDataByID(fighter.roleID), atkOrder ~= 1, flayDelay)
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(role)
        ---还原role透明度
        role.myAni:SetAlpha(1)
        ---设置role位置
        local posNum = fighter.index - 1
        role.PosX = (5 - math.floor(posNum / 3)) + 1
        role.PosY = (posNum % 3) + 1
        ---更新目标地板信息
        BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
        role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(role)
        ---飞行进场
        role.myAni:UIFlayIn(0.55)
        if atkOrder == #team then
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
        end
    end
end
---移除左侧队列及角色
function FightVideoViewModel.ReMoveAllLeft()
    ---解除队伍时，队伍设置为不正确
    FightVideoViewModel.TeamCorrect = false
    local count = 0
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---将原阵列位置置为空
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = 0
            role.myAni:XYSetPos2(role.PosX, role.PosY, 0, 0)
            ---将地板角色移除左侧队列
            BattleManager.LeftTemaReomve(role)
            ---删除地板角色
            GameObject.Destroy(role.myAni.gameObject)
            ---从UI关卡英雄池中添加地板英雄数据
            StormViewModel.AddHeroData(tonumber(role.ID))
            count = count + 1
        end
    end
    if count > 0 then
        ---重置左侧队列顺序
        BattleManager.LeftAtkOrderCout = 1
        ---更新所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
    end
    BattleManager.LeftTeam = {}
end

---@param roleData RoleData 创建Spine
function FightVideoViewModel.GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---创建spine
    local battleRole = BattleManager.CreartRoleLeft(roleData.id, roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(), roleData.awaken,roleData.type,roleData.userID,nil,roleData.favor)
    CBattleTools.CCreatUIGo(battleRole.AniName, battleRole.GameID, battleRole.Qzoom,(battleRole.SkinID == nil and battleRole.ID or battleRole.SkinID),function(myAni) battleRole.myAni = myAni end)
    ---创建战斗用角色数据
    if battleRole.Str_Audio ~= nil and battleRole.Str_Audio ~= "0" and not _NotInSound then
        local audioGroup = tonumber(battleRole.Str_Audio)
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == audioGroup and value[3] == 16 then
                battleRole.myAni.Audio_Dc=value[13]
                break
            end
        end
    end
    ---创建角色特效
    BattleRole.CreatEffFollowAni(battleRole,_NotInSound,_delay)
    BattleRole.SetFlyIn(battleRole,_delay)
    --百防百闪
    if battleRole.RealAgile >= 1 then
        battleRole.myAni:SetSingleEffect("Buff_ShanBiMax_v1")
    end
    if battleRole.RealDef >= 1 then
        battleRole.myAni:SetSingleEffect("Buff_HuDunMax_v1")
    end
    return battleRole
end

---交换两个角色位置信息和位置                AllRole中的索引，也就是GameID
function FightVideoViewModel.SwitchPosition(idOne,idTwo)
    local targetOne = BattleManager.AllRole[idOne]
    local targetTwo = BattleManager.AllRole[idTwo]

    ---交换位置坐标
    local tempPosX = targetOne.PosX
    local tempPosY = targetOne.PosY
    targetOne.PosX = targetTwo.PosX
    targetOne.PosY = targetTwo.PosY
    targetTwo.PosX = tempPosX
    targetTwo.PosY = tempPosY

    ---更新交换角色地板信息，并放置新位置
    BattleManager.ChessboardLeft[targetOne.PosY][targetOne.PosX] = targetOne
    targetOne.myAni:XYSetPos2(targetOne.PosX, targetOne.PosY, targetOne.GameID, targetOne.Occupation)   --放到对应位置
    targetOne.myAni:SetXY(targetOne.PosX, targetOne.PosY)                                               --修改C#记录的位置信息
    targetOne.myAni:PlayU3DVFX("TongYong_Prefab/xs_tongyonghuanwei.prefab")                                                                    --献身特效1
    ---更新被交换角色地板信息，并放置新位置
    BattleManager.ChessboardLeft[targetTwo.PosY][targetTwo.PosX] = targetTwo
    targetTwo.myAni:XYSetPos2(targetTwo.PosX, targetTwo.PosY, targetTwo.GameID, targetTwo.Occupation)
    targetTwo.myAni:SetXY(targetTwo.PosX, targetTwo.PosY)
    targetTwo.myAni:PlayU3DVFX("TongYong_Prefab/cs_tongyonghuanwei.prefab")                                                                   --献身特效2
    ---重新赋AllRole中的值
    BattleManager.AllRole[idOne] = targetOne
    BattleManager.AllRole[idTwo] = targetTwo
end

function FightVideoViewModel.ShowHitAni(hitId)
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

function FightVideoViewModel.EndHitAni(hitId)
    -- local hitData = BattleManager.AllRole[hitId]
    -- local aniTime = 0
    -- if hitData then
    --     aniTime = hitData.myAni:GetAniTime("sj")
    --     hitData.myAni:SetAniSpeed(1)
    --     hitData.myAni:DelayPlayAni("dj",(aniTime - FightVideoViewModel.pauseDelay),true)
    -- end
end

function FightVideoViewModel.isDamageType(_skillType, num)
    if _skillType==1 or _skillType==9 or _skillType==11 or _skillType==12 or _skillType==13
     or _skillType==10029 or _skillType==10 or _skillType==72  then
        if num <= 0 then
            return true
        end
    end
    return false
end

function FightVideoViewModel.handleSpineEvent(aniName, eName, gameid)
    --print("handleSpineEvent  ".." aniName " .. aniName .. " eventName " .. eName .. " gameid " .. gameid);
    local round = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout]
    local turn = nil
    if round ~= nil then
        turn = FightVideoViewModel.AllVideos[FightVideoViewModel.RoundCout][FightVideoViewModel.TrunCout]
        if turn == nil then
            print("handleSpineEvent error", FightVideoViewModel.RoundCout, FightVideoViewModel.TrunCout);
        end
    end
    local roleData = BattleManager.AllRole[gameid]
    if roleData == nil then
        return
    end
    if turn == nil then
        roleData.myAni:RealStataAni("dj", true)
        return
    end
    if eName == "Start"
    then
        if aniName == "gj-0"
        then
            --播放蓄力语音
            roleData.myAni:PlayInXLSound()
        elseif aniName == "gj-1"
        then
            if roleData.Attackmode == 1 then
                roleData.myAni:AtkVoice()
            end
            local HitData= BattleManager.AllRole[turn.hitId]
            roleData.myAni:Play_Atk_Effect(HitData.myAni)
        elseif aniName == "pd-0"
        then

        elseif aniName == "zj"
        then
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
        elseif aniName == "ex"
        then
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
        elseif aniName == "sj"
        then
            roleData.myAni:BecomeRed()
            --判断攻击者是否处于ZJ状态
            if BattleManager.AllRole[turn.atkId].myAni:CheckAniName() == "gj-1" then
                --BattleManager.AllRole[turn.atkId].myAni:Set_SJ_Eff(roleData.myAni)
            end
        end
    elseif eName == "Complete"
    then
        if aniName == "gj-0"
        then
            roleData.myAni:RealStataAni("dj", true)
            if gameid == turn.atkId and (FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.NORMAL_ATK or FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.TURN_START)  then
                FightVideoViewModel.TrunEnd()
            end
        elseif aniName == "gj-1"
        then
            roleData.myAni:RealStataAni("dj", true)
            if gameid == turn.atkId then
                FightVideoViewModel.TrunEnd()
            end
            if roleData.Occupation ~= 4 then
                if FightVideoViewModel.elseHit ~= {} then
                    ---清理Buff技能先执行
                    if FightVideoViewModel.elseHit[0] ~= nil then
                        for k, v in pairs(FightVideoViewModel.elseHit[0]) do
                            FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)
                        end
                    end
                    ---执行剩下技能
                    for key, value in pairs(FightVideoViewModel.elseHit) do
                        if key ~= 0 then
                            for k, v in pairs(value) do
                                FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)
                            end
                        end
                    end
                end
            end
        elseif aniName == "zj"
        then
            roleData.myAni:RealStataAni("dj", true)
            if gameid == turn.atkId then
                if FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_ATK then
                    FightVideoViewModel.TrunStartHit_Action()
                elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_ATK then
                    FightVideoViewModel.TrunEndAction()
                end
            else
                FightVideoViewModel.zjHitShowCount = FightVideoViewModel.zjHitShowCount + 1
                if FightVideoViewModel.zjHitShowCount >= FightVideoViewModel.zjHitActionCount then
                    if FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_HIT then
                        FightVideoViewModel.NorStart()
                    elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_HIT then
                        FightVideoViewModel.TrunEndAtk_Action()
                    end
                end
            end
        elseif aniName == "sj"
        then
            roleData.myAni:RealStataAni("dj", true)
        end
    elseif eName == "Camera_Move"
    then
        if turn.hitId ~= 0 then
            --print(turn.atkId .. " 攻击 " .. turn.hitId .. " 触发相机前往")
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(turn.hitId)
            end
        end
    elseif eName == "Hit"       --动作加数字
    then
        if not FightVideoViewModel.HitPlay then
            FightVideoViewModel.HitPlay = true
            --if roleData.Attackmode ~= 1 then
            --    local HitData= BattleManager.AllRole[turn.hitId]
            --    roleData.myAni:Play_Atk_Effect(HitData.myAni)
            --end
            if roleData.Attackmode ~= 1 then
                roleData.myAni:AtkVoice()
            end
        end
        if FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.NORMAL_ATK
        then
            if roleData.Occupation == 4 then
                FightVideoViewModel.ShowAtk()
                return
            end
            for key, value in pairs(FightVideoViewModel.norHit) do      ---普通攻击每一帧显示一段伤害
                local realNorHit = {}   ---筛掉数据中不属于本次行动的spine的数据
                for i,v in ipairs(value) do
                    if v.atkId == roleData.GameID then
                        table.insert(realNorHit,v)
                    end
                end
                local v = realNorHit[FightVideoViewModel.norHitCount]
                if v ~= nil then
                    if key ~= gameid then
                        FightVideoViewModel.ShowHitAni(key)
                    end
                    FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)
                end
            end
            FightVideoViewModel.norHitCount = FightVideoViewModel.norHitCount + 1
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_ATK or FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_ATK
        then
            for key, value in pairs(FightVideoViewModel.addHit) do  ---每一个受击角色的受击伤害
                FightVideoViewModel.zjHitCount = 1
                --for k, v in pairs(value["buff"]) do
                --    FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)
                --end
                while true do
                    local v = value["dmg"][FightVideoViewModel.zjHitCount]
                    local b = value["buff"][FightVideoViewModel.zjHitCount]
                    if v ~= nil then    --如果伤害不为空
                        if key ~= gameid and v.SkillNumber < 0 then
                            FightVideoViewModel.ShowHitAni(key)
                        end
                        FightVideoViewModel.UseSkill(v.atkId, v.hitId,v.hitskillID, v.hitTime,v.SkillType,v.SkillNumber,true,v.delSkill,nil,key ~= 1)
                    end
                    if  b ~= nil then   --如果buff不为空
                        FightVideoViewModel.UseSkill(b.atkId, b.hitId,b.hitskillID, b.hitTime,b.SkillType,b.SkillNumber,true,b.delSkill,nil,key ~= 1)
                    end
                    if v == nil and b == nil then
                            break
                    end
                    FightVideoViewModel.zjHitCount = FightVideoViewModel.zjHitCount + 1
                end
            end
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_HIT
        then
            if turn.V_BefAtkEnemy ~= nil and next(turn.V_BefAtkEnemy) ~= nil then
                if turn.V_BefAtkEnemy[gameid] ~= nil and next(turn.V_BefAtkEnemy[gameid]) ~= nil then
                    for key, v in pairs(turn.V_BefAtkEnemy[gameid]) do
                        for k,val in pairs(v) do
                            FightVideoViewModel.UseSkill(val.atkId, val.hitId,val.hitskillID, val.hitTime,val.SkillType,val.SkillNumber,true,val.delSkill,nil,key ~= 1)
                            if FightVideoViewModel.isDamageType(val.SkillType, val.SkillNumber) then
                                if key ~= gameid then
                                    FightVideoViewModel.ShowHitAni(key)
                                end
                            end
                        end
                    end
                end
            end
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_HIT
        then
            if turn.V_AftAtkEnemy ~= nil and next(turn.V_AftAtkEnemy) ~= nil then
                for key, v in pairs(turn.V_AftAtkEnemy[gameid]) do
                    for k,val in pairs(v) do
                        --FightVideoViewModel.UseSkill(val.atkId, val.hitId,val.hitskillID, val.hitTime,val.SkillType,val.SkillNumber,true,val.delSkill,nil,key ~= 1)
                        if FightVideoViewModel.isDamageType(val.SkillType, val.SkillNumber) then
                            if key ~= gameid then
                                FightVideoViewModel.ShowHitAni(key)
                            end
                        end
                    end
                end
            end
        end
    elseif eName == "Hit_up"    --只有动作
    then
        if not FightVideoViewModel.HitPlay then
            FightVideoViewModel.HitPlay = true
            --if roleData.Attackmode ~= 1 then
            --    local HitData= BattleManager.AllRole[turn.hitId]
            --    roleData.myAni:Play_Atk_Effect(HitData.myAni)
            --end
            if roleData.Attackmode ~= 1 then
                roleData.myAni:AtkVoice()
            end
        end
        if FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.NORMAL_ATK
        then
            for key, value in pairs(FightVideoViewModel.norHit) do
                if key ~= gameid then
                    FightVideoViewModel.ShowHitAni(key)
                end
            end
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_ATK or FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_ATK
        then
            for key, value in pairs(FightVideoViewModel.addHit) do
                if key ~= gameid then
                    if value["dmg"] ~= nil and next(value["dmg"]) ~= nil then
                        for i,v in pairs(value["dmg"]) do
                            if v.SkillNumber < 0 then
                                FightVideoViewModel.ShowHitAni(key)
                            end
                        end
                    end
                end
            end
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.BEF_NOR_HIT
        then
            if turn.V_BefAtkEnemy ~= nil and next(turn.V_BefAtkEnemy) ~= nil then
                if turn.V_BefAtkEnemy[gameid] ~= nil and next(turn.V_BefAtkEnemy[gameid]) ~= nil then
                    for key, v in pairs(turn.V_BefAtkEnemy[gameid]) do
                        for k,val in pairs(v) do
                            if key ~= gameid then
                                FightVideoViewModel.ShowHitAni(key)
                            end
                        end
                    end
                end
            end
        elseif FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.AFT_NOR_HIT
        then
            if turn.V_AftAtkEnemy ~= nil and next(turn.V_AftAtkEnemy) ~= nil then
                if turn.V_AftAtkEnemy[gameid] ~= nil and next(turn.V_AftAtkEnemy[gameid]) ~= nil then
                    for key, v in pairs(turn.V_AftAtkEnemy[gameid]) do
                        for k,val in pairs(v) do
                            if key ~= gameid then
                                FightVideoViewModel.ShowHitAni(key)
                            end
                        end
                    end
                end
            end
        end
    elseif eName == "Interrupt"
    then
        if aniName == "gj-1" then
            if gameid == turn.atkId then
                FightVideoViewModel.TrunEnd()
            end
        elseif aniName == "gj-0" then
            roleData.myAni:RealStataAni("dj", true)
            if gameid == turn.atkId and (FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.NORMAL_ATK or FightVideoViewModel.hitAniStep == FightEnum.BattleTurnStep.TURN_START) then
                FightVideoViewModel.TrunEnd()
            end
        end
    end
end

function FightVideoViewModel.SortSkillList(actionList,removeList)
    local removePosition = {}
    for i = 1, #actionList do   --actionList中的删除技能不释放
        if actionList[i].hitskillID == 0 and actionList[i].SkillType == 0 and actionList[i].delSkill.delNum ~= nil then
            actionList[i].hitskillID = nil
        end
    end
    --for j = 1, #removeList do
    --    for i = 1, #actionList do
    --        if actionList[i] == removeList[j] then
    --            actionList[i].hitskillID = nil
    --        end
    --    end
    --end
    for j = 1, #removeList do
        for i = 1, #actionList do
            if actionList[i].hitskillID == math.abs(removeList[j].delSkill.skillID) and actionList[i].hitTime == removeList[j].delSkill.skillTime and actionList[i].SkillType ~= 0 then
                actionList[i].hitskillID = nil
                break
            end
        end
    end

end

function FightVideoViewModel.Calculagraph()  --计时器
    --15秒后激活跳过按钮
    MgrTimer.AddDelayNoName(15,function()
        FightVideoViewModel.JumpButtonOn = true
    end,nil)
    --15秒计时
    FightVideoViewModel.DJS = 15
    MgrTimer.AddRepeat("JumpButtonOn",1,function()
        if FightVideoViewModel.DJS >= 0 then
            FightVideoViewModel.DJS = FightVideoViewModel.DJS - 1
        end
    end,15,nil)
end

---@type BattleRole roleData
--function FightVideoViewModel.PlayEX(roleData,AllEnemyID,delay,endtime,EXtype,whetherPlayVideo,timeStr,prefabStr,grabPosition,targetShowTime,allRoleHideTime,EXPosition)
--    local playAni = nil
--    if whetherPlayVideo == "Role" then
--        playAni = true
--    else
--        playAni = false
--    end
--    --加载视频
--    CEffectVideo.Instance:New_LoadUsm(roleData.ID);
--    --目标分类
--    local mainTargetID = AllEnemyID[1]
--    local secondTargetIDs = table.remove(Global.CopyTable(AllEnemyID),1)
--    --主目标受击延迟显示
--    CJNBattleMgr.Instance:DelayShow(allRoleHideTime,BattleManager.AllRole[mainTargetID].myAni)
--    CJNBattleMgr.Instance:LuaRecovery(allRoleHideTime, mainTargetID, secondTargetIDs);
--    --待机
--    roleData.myAni:RealStataAni("dj", true)
--    --隐藏除自己外的所有人
--    CJNBattleMgr.Instance:LuaSetRoleUI(roleData.myAni,playAni)
--    --恢复1倍速
--    CJNBattleMgr.Instance:SetSpeedOne()
--
--end
---endtime 视频时间
function FightVideoViewModel.LuaPlayEX_V2(roleData,enemyRoleData,whetherPlayVideo,Sound_Delay,SoundName,prefabStr,xlPrefabStr,position,endTime,SpinePos,actBefOrAft,BossSoundName)
    --游戏速度设为1
    CJNBattleMgr.Instance:SetSpeedOne()
    --隐藏除自己外的所有人
    CJNBattleMgr.Instance:LuaSetRoleUI(roleData.myAni,whetherPlayVideo == "y")
    CJNBattleMgr.Instance:LuaHidAll(whetherPlayVideo == "y");
    --记录攻击者和被攻击者
    CEffectVideo.Instance:LuaRecordAtkRole(roleData.myAni)
    CEffectVideo.Instance:LuaRecordHitRole(enemyRoleData.myAni)
    --加载usm并播放
    local delay = 0.2
    local delay2 = 1.2
    --ex相机移动
    local xlStr = {}
    if xlPrefabStr ~= "0" then
        xlStr = string.split(xlPrefabStr,",")
        if xlStr[2] ~= nil then
            delay2 = tonumber(xlStr[2]) > delay2 and tonumber(xlStr[2]) or delay2
        end
    end
    roleData.myAni:EXCameraMove(delay,delay2,xlStr[1],SettingViewModel.GetCameraMove() == 2 or roleData.myAni.IsWorldBoss)
    if whetherPlayVideo == "y" then
        CEffectVideo.Instance:New_LoadUsm(tonumber(roleData.ID))
    end
    FightVideoViewModel.EX_CutIn(true,tonumber(roleData.SkinID == nil and roleData.ID or roleData.SkinID),roleData,SpinePos,whetherPlayVideo)
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
        if FightVideoViewModel.JumpOut then
            return
        end
        ---播放动作
        MgrTimer.AddBattleDelay("EX_End",endTime + delay + delay2,function()
            if actBefOrAft == "1" then
                roleData.myAni:LuaSetAni(0, "ex", true)    --播放ex动画
                roleData.myAni:LuaSetAni(roleData.myAni:GetAniTime("ex"), "dj", true)
            end
            --MgrSound.Stop(4,"ExRadio",false)
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(enemyRoleData.GameID)
            end
            CJNBattleMgr.Instance:ShowAll()
            CJNBattleMgr.Instance:SetPreviousSpeed()    --速度恢复
            roleData.myAni:BillBoarderOn()
        end,nil)
    else
        MgrTimer.AddBattleDelay("EXPlay",delay+delay2,function()
            if SettingViewModel.GetCameraMove() == 1 then
                MgrCamera.MoveToCharacter(enemyRoleData.GameID)
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
function FightVideoViewModel.EX_CutIn(CameraMoveOrNot,_RoleId,roleData,SpinePos,whetherPlayVideo)
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

function FightVideoViewModel.Clear()
    FightVideoViewModel.PveReturn = false
    CJNBattleMgr.SetGameSpeed(1)
end

return FightVideoViewModel



