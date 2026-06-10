---外传活动主界面
EventBossView = {}
local V_BaseUI = nil

function EventBossView.Init(BaseUI)
    V_BaseUI = BaseUI
end

function EventBossView:OnUpdateUI()
    ---剩余票数
    V_BaseUI.Text_Shu().text = ItemControl.GetItemByIdAndType(200017,4).count
    ---难度初始化
    V_BaseUI.Difficulty = 1
    EventBossView:InitBossDifficulty()
    ---注册奖励滑块
    V_BaseUI.BossRewardsScroll01():SetLuaCellEvent(function(trans, idx)
        trans:GetComponent("UITemplate"):SetData(V_BaseUI.RewardsList[idx])
    end)
    ---背景音乐
    if V_BaseUI.BossData.chaptermusic ~= "" then
        MgrSound.PlayBGM(V_BaseUI.BossData.chaptermusic,0.2,nil,true)
    end
    ---BOSS关名
    V_BaseUI.Text_BossName().text = V_BaseUI.BossData.chaptername
    ---检测所有红点
    Event4Control.CheckAllRedDot()
    ---任务红点
    local taskState = RedDotControl.GetDotData("Event4DailyTask_"..V_BaseUI.CurActID).State or RedDotControl.GetDotData("Event4Achievement_"..V_BaseUI.CurActID).State
    V_BaseUI.MissionRedDotIcon().gameObject:SetActive(taskState)
    ---扭蛋红点
    local AwardState = RedDotControl.GetDotData("Event4Award_"..V_BaseUI.CurActID).State
    V_BaseUI.ShopRedDotIcon().gameObject:SetActive(AwardState)
    ---星变红点
    local XingbianState = RedDotControl.GetDotData("Event4Xingbian_"..V_BaseUI.CurActID).State
    V_BaseUI.Xinbian_RedDotIcon().gameObject:SetActive(XingbianState)
end

function EventBossView:InitBossDifficulty()
    local allBossLevels = Event4Control.GetBossChapterLevels()
    ---@type StormPointData[]
    V_BaseUI.allPointData = {}
    local locks = {}    --所有关卡解锁状态
    for i, levelData in ipairs(allBossLevels) do
        local tCurLevelData = StormControl.GetStormPointByID(levelData)
        table.insert(V_BaseUI.allPointData,tCurLevelData)
        table.insert(locks,tCurLevelData:CheckLock())
    end
    for i,v in ipairs(allBossLevels) do
        local go = GameObject.Instantiate(V_BaseUI.BossPopBtn().gameObject,V_BaseUI.ShowBossPanel().transform,false)
        ---是否上锁
        local lock = go.transform:Find("Nandu/BossLock").gameObject
        local lockImage = go:GetComponent("Image")
        if locks[i] then
            lock:SetActive(false)
            MgrRes.LoadSprite(lockImage,"Quality/Btn_Boss_"..i)
        else
            lock:SetActive(true)
            MgrRes.LoadSprite(lockImage,"Quality/Btn_Boss_suo")
        end
        ---关卡名
        go.transform:Find("Nandu/Text_BossNandu").transform:GetComponent("TextMeshProUGUI").text = V_BaseUI.allPointData[i].name
        ---推荐等级
        go.transform:Find("Text_TuijianLv").transform:GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text262"), V_BaseUI.allPointData[i].recommendLevel) 
        ---Boss弹窗
        UIEvent.LuaClick(go,function()
            if V_BaseUI.allPointData[i]:CheckLock() then
                V_BaseUI.Difficulty = i
                EventBossView:OpenBossPop(i)
            else
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"), 1 }, true)
            end
        end)
    end
    V_BaseUI.BossPopBtn().gameObject:SetActive(false)
    if #V_BaseUI.allPointData > 0 then
        StormViewModel.CurPointData = V_BaseUI.allPointData[1]
        EventBossView:RefreshCost(V_BaseUI.allPointData[1])
    end
end

function EventBossView:OpenBossPop(index)
    local currentPoint = V_BaseUI.allPointData[index]
    StormViewModel.CurPointData = currentPoint

    V_BaseUI.BossPop().gameObject:SetActive(true)
    ---关卡名字
    V_BaseUI.Text_BossPopName().text = currentPoint.name
    ---队伍平均等级
    V_BaseUI.Text_PopTuijianLv().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text37") .. currentPoint.recommendLevel
    ---存储需求

    ---掉落素材
    V_BaseUI.RewardsList = currentPoint:GetRewards()
    ---设置Loop数量
    V_BaseUI.BossRewardsScroll01().totalCount = #V_BaseUI.RewardsList
    V_BaseUI.BossRewardsScroll01():RefillCells()
    ---刷新体力
    EventBossView:RefreshCost(StormViewModel.CurPointData)
    ---进入战斗按钮
    if V_BaseUI.Btn_InBoss2 == nil then
        UIEvent.LuaClick(V_BaseUI.Btn_InBoss().gameObject,function()
            if not StormViewModel.CurPointData:CheckLock() then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
                return
            end
            if V_BaseUI.CurHaveItem.count < tonumber(V_BaseUI.CurCost[3]) then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_externalevent_txt19"), 1 }, true)
                return
            end
            BattleManager.GameMode = BattleManager.GameModeType.Normal
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activityBoss)
        end)
    else
        UIEvent.LuaClick(V_BaseUI.Btn_InBoss2().gameObject,function()
            if not StormViewModel.CurPointData:CheckLock() then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
                return
            end
            if V_BaseUI.CurHaveItem.count < tonumber(V_BaseUI.CurCost[3]) then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_externalevent_txt19"), 1 }, true)
                return
            end
            BattleManager.GameMode = BattleManager.GameModeType.Normal
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activityBoss)
        end)
        ---扫荡
        UIEvent.LuaClick(V_BaseUI.Btn_Fast().gameObject, function()
            if not StormViewModel.CurPointData:CheckLock() then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
                return
            end
            if V_BaseUI.CurHaveItem.count < tonumber(V_BaseUI.CurCost[3]) then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_externalevent_txt19"), 1 }, true)
                return
            end
            if not EventBossView:CheckFast(StormViewModel.CurPointData) then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text24"), 1 }, true)
                return
            end
            MgrUI.Pop(UID.SweepPop_UI, { StormViewModel.CurPointData, function()
                ---刷新体力
                EventBossView:RefreshCost(StormViewModel.CurPointData)
            end }, true)
        end)
        V_BaseUI.SweepSuo().gameObject:SetActive(not EventBossView:CheckFast(StormViewModel.CurPointData))
    end

    ---储存需求说明
    EventBossView:SetTipsPop(currentPoint.energycondition[2])
    ---储存需求
    V_BaseUI.Text_Chubeixuqiu().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt8").."："..currentPoint.energycondition[1]
    ---当前能量范围
    local tCurEnergyRange,tSelfEnergyVelue = Event4Control.CheckEnergy(currentPoint.energycondition)
    MgrRes.LoadSprite(V_BaseUI.Img_Nengyuan(), tCurEnergyRange.icon)
    V_BaseUI.Text_Nengyuan().text = tSelfEnergyVelue
    V_BaseUI.Text_Zhi().text = tCurEnergyRange.rangeName
    ---关卡通关评级
    EventBossView:InitStar(currentPoint)
end
---刷新消耗
function EventBossView:RefreshCost(_curPoint)
    ---消耗
    V_BaseUI.CurCost = string.split(_curPoint.consume, "_")
    V_BaseUI.CurHaveItem = ItemControl.GetItemByIdAndType(tonumber(V_BaseUI.CurCost[2]), tonumber(V_BaseUI.CurCost[1]))
    ---剩余票数
    V_BaseUI.Text_Shu().text = V_BaseUI.CurHaveItem.count
    V_BaseUI.Text_BCNum().text = Global.GetCompareText(V_BaseUI.CurHaveItem.count,tonumber(V_BaseUI.CurCost[3]))
end

---编辑说明弹窗
function EventBossView:SetTipsPop(_GroupID)
    ---获取改组能量所有数据
    local tAllEnergyData = Event4Control.GetEnergyEffect(_GroupID)

    for i,v in ipairs(tAllEnergyData) do
        local go = GameObject.Instantiate(V_BaseUI.NengyuanItem().gameObject,V_BaseUI.TipsContent().transform,false)
        local _ImgBg = CJNUIMgr.GetSunUseName(go, "Img_di"):GetComponent("Image")
        local _Icon = CJNUIMgr.GetSunUseName(go, "Img_Icon"):GetComponent("Image")
        local _Qujian = CJNUIMgr.GetSunUseName(go, "Text_Qujian"):GetComponent("TextMeshProUGUI")
        local _Shuoming = CJNUIMgr.GetSunUseName(go, "Text_Shuoming"):GetComponent("TextMeshProUGUI")

        MgrRes.LoadSprite(_ImgBg,v.background)
        MgrRes.LoadSprite(_Icon,v.icon)
        _Qujian.text = v.range.min.."~"..v.range.max
        _Shuoming.text = v.skillTip
    end
    V_BaseUI.NengyuanItem().gameObject:SetActive(false)
end

---关卡通关评级
function EventBossView:InitStar(_data)
    ---星级
    local s1, s2, s3 = _data:CheckStar()
    local tStar = {s1,s2,s3}
    local strArr = string.split(_data.condition, ",")
    if #strArr <= 1 then
        return
    end
    for i = 1,#V_BaseUI.StarGroup do
        V_BaseUI.StarGroup[i].Star.gameObject:SetActive(tStar[i])
        V_BaseUI.StarGroup[i].Condition.text = TermdescLocalData.tab[tonumber(string.split(strArr[i], "_")[3])][2]
    end
end

---扫荡检测
function EventBossView:CheckFast(_curPoint)
    if _curPoint == nil then
        return false
    end
    if not _curPoint:CheckLock() then
        return false
    end
    if _curPoint.star < 7 then
        return false
    end

    return true
end
return EventBossView