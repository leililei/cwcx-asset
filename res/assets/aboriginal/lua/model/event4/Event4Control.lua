require("Model/Event4/Data/Event4Data")
require("Model/Event4/Data/Event4PreheatData")
require("Model/Event4/Data/Event4ShopData")
---配置表
require("LocalData/PreheatGameLocalData")
require("LocalData/Activitypreview2LocalData")
require("LocalData/GashaponLocalData")

require("Model/Event4/EventHomeView")
require("Model/Event4/EventBossView")
require("Model/Event4/EventLevelView")
require("Model/Event4/EventTaskView")
require("Model/Event4/EventTaskItemView")
require("Model/Event4/EventXingbianView")
---数据管理器
Event4Control = {}

---BOSS模式(根据字段"levels"填入的先后顺序,决定难度)
Event4Control.BossMode = {
    ---普通
    Normal = 1,
    ---困难
    Hard = 2
}
---当前蛋池id
local CurPoolId = {}
---扭蛋结果是否包含特殊道具
Event4Control.ContainsSpecial = false
---蛋池剩余道具
local ClientPoolItems = {}


local SignAwardList = {}          ---预热签到奖励表
local PreheatList = {}            ---预热对话ID表
local PreheatBGM = nil            ---预热BGM
local PreheatInfo = nil
local PreheatActiveData = nil

local Event4Info = {}            ---四月外传数据
---@type Event4ShopData[]
local ShopInfo = {}              ---扭蛋池数据

local Event4BossData = nil
local ChapterData = {}          ---外传章数据    ActivechapterLocalData

local Event4ActivityData = {}

local NormalLevels = {}              ---普通关卡数据
local CurSelectLevel = nil              ---当前选中的关卡

local BossChapterData = nil             ---BOSS章节数据

local CurActID = nil            ---当前活动ID
---外传活动类型(根据类型判断打开的界面)
local ActType = {
    ---星月脊行
    event4 = 50100,
    ---星往昙沼
    event5 = 50101
}
---界面类型
local UIType = {
    home = 1,
    task = 2,
    shop = 3,
    level = 4,
    boss = 5,
    xingbian = 6
}

function Event4Control.Init()
    PreheatActiveData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.PREHEAT3)
    ---预热数据
    Event4Control.InitPreheatData()
    ---四月外传数据
    Event4Control.InitEvent4Data()
    ---初始化扭蛋池数据
    Event4Control.InitShopData()
end
------------------------预热活动------------------------
---初始化预热数据
function Event4Control.InitPreheatData()
    local idx = 0
    for i, v in ipairs(PreheatGameLocalData.tab) do
        idx = idx+1
        if SignAwardList[v[6]] == nil then
            SignAwardList[v[6]] = {}
            SignAwardList[v[6]][idx] = Event4PreheatData.New(v)
        elseif SignAwardList[v[6]][idx] == nil then
            SignAwardList[v[6]][idx] = Event4PreheatData.New(v)
        end
    end
    
    if PreheatActiveData == nil then
        return
    end
    ---初始化预热对话ID表
    for k,v in pairs(Activitypreview2LocalData.tab) do
        if v[2] == PreheatActiveData.activityId then
            PreheatList = string.split(v[7],',')
            PreheatBGM = v[8]
            break
        end
    end
end
---获取气球小游戏数据
function Event4Control.GetPreheatData(_activityID)
    return SignAwardList[_activityID]
end

---获取当天的对话数据
function Event4Control.GetDialogData()
    local tDialogData = ActivityControl.GetDialogData()
    local tCurTime = Global.GetCurTime()
    local tOpenDays = Global.TimeToDays(tCurTime-Global.GetTimeByStr(PreheatActiveData.beginTime))
     
    if tOpenDays > #PreheatList then
        tOpenDays = #PreheatList
    end
    local tDialogID = tonumber(PreheatList[tOpenDays])

    return tDialogData[tDialogID]
end
---获取预热活动BGM
function Event4Control.GetBGM()
    return PreheatBGM
end

---获取本次活动签到小游戏数据
function Event4Control.GetEvent4Preheat()
    local tPreheatData = Event4Control.GetPreheatData(PreheatActiveData.activityId)
    
    return tPreheatData
end
---获取今日已签到次数
function Event4Control.GetTodaySign()
    local curTime = Global.GetCurTime()-18000
    local signTime = PreheatActiveData.rewardTime-18000
    local signCount = PreheatActiveData.rewardCount
    if signTime <= 0 or not Global.CheckIsSameDay(signTime,curTime) then
        signCount = 0
    end
    
    return signCount
end

function Event4Control.SaveTodaySign()
    if PreheatActiveData then
        PreheatActiveData.rewardTime = Global.GetCurTime()
        PreheatActiveData.rewardCount = PreheatActiveData.rewardCount+1
    end
end

---夏活预热开启
function Event4Control.OpenPreheatUI()
    if PreheatActiveData and Global.isMiddleTime(PreheatActiveData.beginTime, PreheatActiveData.endTime) then
        MgrUI.GoHide(UID.Event4Preheat_UI)
    end
end

---签到领取奖励
function Event4Control.Sign(callback)
    local activityRewardReq =
    {
        activityId = PreheatActiveData.activityId,
        rewardId = 0,
        rewardType = 1
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientActivityGetRewardREQ',activityRewardReq))

    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ACTIVITY_GET_REWARD_REQ,bytes,0,nil,Event4Control.ActivityRewardSendACK,function(...)
        Event4Control.ActivityRewardSendNTF(...)
        if callback then
            callback()
        end
    end)
end
---领取活动奖励ACK
function Event4Control.ActivityRewardSendACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientActivityGetRewardACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo~=0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
            if tab.errNo == ServerErrorCode.ActivityGetReward_501 then
                MgrUI.GoBackTo(UID.Home_UI)
            else
                MgrUI.GoBack()
            end
        end
    end
end
---领取活动奖励NTF
function Event4Control.ActivityRewardSendNTF(buffer, tag)
    ---解析活动奖励
    local tab = assert(pb.decode('PBClient.ClientActivityGetRewardNTF',buffer))
    if tab.goods then
        ---将奖励推送进背包
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---弹出奖励弹窗
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
    end

    ---刷新背包缓存数据
    BagViewModel.ReloadCacheData()
    ---更新今天签到次数
    Event4Control.SaveTodaySign()
end

---预热红点检测
function Event4Control.CheckRedDot()
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.PREHEAT3) then
        return
    end
    ---签到次数上限
    local tSignLimit = tonumber(SteamLocalData.tab[122000][2])
    ---当日消耗的体力
    local CostVigor = TaskControl.dayStatistics[tonumber(SteamLocalData.tab[109004][2])]
    ---每日体力消耗上限
    local Limit = tonumber(SteamLocalData.tab[122001][2])*tSignLimit
    if CostVigor then
        CostVigor = CostVigor > Limit and Limit or CostVigor
    else
        CostVigor = 0
    end

    ---今日已签到次数
    local tSignCount = Event4Control.GetTodaySign()
    ---今日可签到次数
    local tCanSignCount = math.modf(CostVigor/Limit)-tSignCount

    ---检测今天是否用尽签到次数
    if tCanSignCount > tSignCount and tSignCount < tSignLimit then
        RedDotControl.GetDotData("Event4PreSign"):SetState(true)
    else
        RedDotControl.GetDotData("Event4PreSign"):SetState(false)
    end
    
    ---气球签到藏品红点检测
    local tPreheaData = Event4Control.GetEvent4Preheat()
    for i = 1, #tPreheaData do
        ---检测是否拥有激活道具
        local NewItemData = ItemControl.GetItemByIdAndType(tPreheaData[i].SpecialAward.goodsID,tPreheaData[i].SpecialAward.goodsType)
        
        if NewItemData.goods.goodsNum > 0 then
            RedDotControl.GetDotData("Event4PreMap"):SetState(true)
            return
        end
    end
    RedDotControl.GetDotData("Event4PreMap"):SetState(false)
end
------------------------四月外传数据------------------------
function Event4Control.InitEvent4Data()
    ---7月活动数据
    for k,v in pairs(ActivityLocalData.tab) do
        if v[2] == ActivityControl.activityTypeEnum.EVENT4 or math.modf(v[2]/100) == ActivityControl.activityTypeEnum.EVENT4 then
            Event4Info[v[1]] = EventRaidData.New()
            Event4Info[v[1]]:PushData(v[1])
            if Event4Info[v[1]].id ~= 0 then
                --注册红点
                RedDotControl.RegisterChildDot("Event4DailyTask_"..v[1],"Event4")
                RedDotControl.RegisterChildDot("Event4Achievement_"..v[1],"Event4")
                RedDotControl.RegisterChildDot("Event4Award_"..v[1],"Event4")
                RedDotControl.RegisterChildDot("Event4Xingbian_"..v[1],"Event4")
                ---7月活动总览数据
                Event4ActivityData[v[1]] = ActivityControl.GetActivityInfo(v[2])
            end
        end
    end
end
---@return EventRaidData
function Event4Control.GetEvent4Data()
    if Event4Info == nil then
        Event4Control.InitEvent4Data()
    end

    return Event4Info
end
---获取技能列表
function Event4Control.GetSkillData(_actId)
    local tCurID = _actId and _actId or CurActID
    local tSkillData = ActivitySkillControl.GetActivitySkill(tCurID)
    
    return tSkillData
end
---获取活动技能等级
function Event4Control.GetActSkillLv(_actId)
    local tCurID = _actId and _actId or CurActID
    return Event4ActivityData[tCurID].ExpansionLevel
end

function Event4Control.GetEnergyEffect(_groupID)
    local tEnergyEff = ActivitySkillControl.GetEnergyEffect(_groupID)
    
    return tEnergyEff
end
---打开第四章主界面
function Event4Control.OpenEvent4UI(_actId)
    local remainTime = Event4Control.GetEndTime() - 1
    local tActivityData = ActivityControl.GetActivityByID(_actId)
    if remainTime > 0 then
        if SysLockControl.CheckSysLock(tActivityData.systemopen) then
            Event4Control.OpenUI(UIType.home)
        else
            MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(tActivityData.systemopen), 1 }, true)
        end
    end
end
---打开任务界面
function Event4Control.OpenTask()
    Event4Control.OpenUI(UIType.task)
end
---打开扭蛋界面
function Event4Control.OpenShop()
    if CurPoolId[CurActID] == 0 then
        local tCurPoolId = ShopInfo[CurActID][1].id
        Event4Control.GameUp(Event4ActivityData[CurActID].activityId,tCurPoolId,function()
            Event4Control.OpenUI(UIType.shop)
        end)
    else
        Event4Control.OpenUI(UIType.shop)
    end
end
---打开关卡界面
function Event4Control.OpenLevel()
    if Event4Control.GetToutchLevel() == nil then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text50"), 1 }, true)
        return
    end
    
    local tTime = 0
    local isOpen = false
    local tChapters = Event4Control.GetChapterLevels()
    for i, v in ipairs(tChapters) do
        if Global.isMiddleTime(v[1].beginTime, v[1].endTime) then
            isOpen = true
            break
        else
            if tTime == 0 or tTime > Global.GetTimeByStr(v[1].beginTime) then
                tTime = Global.GetTimeByStr(v[1].beginTime)
            end
        end
    end

    if isOpen then
        Event4Control.OpenUI(UIType.level)
    elseif tTime > Global.GetCurTime() then
        local tStr = Global.GetAloneTimeFormat(tTime)
        local tTips = string.format(MgrLanguageData.GetLanguageByKey("ui_externalevent_txt13"),tStr)
        MgrUI.Pop(UID.PopTip_UI, { tTips, 1 }, true)
    else
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
    end
end
---打开星变界面
function Event4Control.OpenXingBian()
    Event4Control.OpenUI(UIType.xingbian)
end
---打开BOSS界面
function Event4Control.OpenBoss()
    ---Boss是否开启
    local IsBossTimeOpen = false
    local tOpenTime = Event4Control.GetBossOpenTime()
    local tBossData = Event4Control.GetBossChapterData()
    
    if tOpenTime <= 0 then
        IsBossTimeOpen = Event4Control.CheckChapterTimeOpen(ActiveChapterControl.ChapterType.WaiZhuanBoss)
    end

    local tState = Global.GetTimeState(tBossData.beginTime, tBossData.endTime)
    if tState == 1 then
        local tStr = Global.GetAloneTimeFormat(tBossData.beginTime)
        local tTips = string.format(MgrLanguageData.GetLanguageByKey("ui_externalevent_txt13"),tStr)
        MgrUI.Pop(UID.PopTip_UI, { tTips, 1 }, true)
    elseif tState == 2 then
        Event4Control.OpenUI(UIType.boss)
    elseif tState == 3 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
    end
end
---
function Event4Control.OpenUI(_uiType)
    local tCurData = Event4ActivityData[CurActID]
    if tCurData == nil then
        return
    end
    if tCurData.activityType == ActType.event4 then
        if _uiType == UIType.home then
            MgrUI.GoHide(UID.Event4Home_UI)
        elseif _uiType == UIType.task then
            MgrUI.GoHide(UID.Event4Task_UI)
        elseif _uiType == UIType.shop then
            MgrUI.GoHide(UID.Event4Shop_UI)
        elseif _uiType == UIType.level then
            MgrUI.GoHide(UID.Event4Levels_UI)
        elseif _uiType == UIType.boss then
            MgrUI.GoHide(UID.Event4Boss_UI)
        elseif _uiType == UIType.xingbian then
            MgrUI.GoHide(UID.Event4Xingbian_UI)
        end
    elseif tCurData.activityType == ActType.event5 then
        if _uiType == UIType.home then
            MgrUI.GoHide(UID.Event5Home_UI)
        elseif _uiType == UIType.task then
            MgrUI.GoHide(UID.Event5Task_UI)
        elseif _uiType == UIType.shop then
            MgrUI.GoHide(UID.Event5Shop_UI)
        elseif _uiType == UIType.level then
            MgrUI.GoHide(UID.Event5Levels_UI)
        elseif _uiType == UIType.boss then
            MgrUI.GoHide(UID.Event5Boss_UI)
        elseif _uiType == UIType.xingbian then
            MgrUI.GoHide(UID.Event5Xingbian_UI)
        end
    end
end
---活动剩余时间
function Event4Control.GetEndTime()
    local tData = Event4Control.GetEvent4Data()[CurActID]
    ---活动结束提醒
    local serverTime = MgrNet.GetServerTime()
    local tEndTime = Global.GetTimeByStr(tData.endTime)
    local remainTime = tEndTime - serverTime

    return remainTime
end
---活动挑战剩余时间
function Event4Control.GetBattleEndTime()
    ---活动结束提醒
    local serverTime = MgrNet.GetServerTime()
    local tEndTime = Global.GetTimeByStr(Event4ActivityData[CurActID].battleEndTime)
    local remainTime = tEndTime - serverTime

    return remainTime
end
---设置当前活动ID
function Event4Control.SetCurActID(_actId)
    CurActID = _actId
end
function Event4Control.GetCurActID()
    return CurActID
end

---每日任务数据
function Event4Control.GetDailyTaskData(_actId)
    local array = TaskControl.GetEventRaidTaskData(Event4Info[_actId].dayTaskId)    --附带判断任务是否解锁
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
function Event4Control.GetTaskData(_actId)
    local tAchieviment = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.ACTIVITY_STORY,false,Event4Info[_actId].taskId)

    return tAchieviment
end

---检查任务相关红点
function Event4Control.CheckTaskRedPoint()
    ---遍历任务
    local tData = Event4Control.GetEvent4Data()

    --每日任务
    local checkDailyTask = function(_actId)
        for k,v in pairs(Event4Control.GetDailyTaskData(_actId)) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("Event4DailyTask_".._actId):SetState(true)
                break
            end
        end
    end
    --成就
    local checkTask = function(_actId)
        for k,v in pairs(Event4Control.GetTaskData(_actId)) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("Event4Achievement_".._actId):SetState(true)
                break
            end
        end
    end
    for i, v in pairs(tData) do
        if (CurActID == nil and v.activityID ~= 0) or v.activityID == CurActID then
            RedDotControl.GetDotData("Event4DailyTask_"..i):SetState(false)
            RedDotControl.GetDotData("Event4Achievement_"..i):SetState(false)
            
            if Event4Control.CheckActiveOpen(i) then
                if Global.isMiddleTime(v.beginTime,v.battleEndTime) then
                    checkDailyTask(i)
                end
                
                ---遍历成就
                checkTask(i)
            end
        end
    end
end
---@return ActiveChapterData
---外传章数据
function Event4Control.GetChapterData()
    if #ChapterData == 0 then
        ChapterData = ActiveChapterControl.GetChapterData(Event4Info[CurActID].chapterId)
    end
    return ChapterData
end
---获取BOSS关卡数据
function Event4Control.GetBossChapterLevels()
    local levels = nil
    local allChaptersData = Event4Control.GetChapterData()  --activechapter表
    for i,v in ipairs(allChaptersData) do
        if v.Chaptertype == ActiveChapterControl.ChapterType.WaiZhuanBoss then
            levels = v[1].levels
        end
    end
    return levels
end
---获取BOSS章节数据
function Event4Control.GetBossChapterData()
    if BossChapterData == nil then
        local allChaptersData = Event4Control.GetChapterData()  --activechapter表
        for i,v in ipairs(allChaptersData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.WaiZhuanBoss then
                BossChapterData = v[1]
                break
            end
        end
    end
    
    return BossChapterData
end
---检测关卡是否在活动期间
function Event4Control.CheckChapterTimeOpen(_type,_scrollid)
    local isOpen = false
    local tChapterData = Event4Control.GetChapterData()
    if _scrollid then
        tChapterData = Event4Control.GetChapterData()[_scrollid]
    end
    for i, chapterData in ipairs(tChapterData) do
        if chapterData.Chaptertype and chapterData.Chaptertype == _type then
            for i, v in ipairs(chapterData) do
                if Global.CheckOnTime(TimeControl.GetTimeTable(v.chaptertime)) then    --要改为按照服务器时间表判
                    isOpen = true
                    break
                end
            end
        elseif chapterData.Chaptertype == nil then
            if Global.CheckOnTime(TimeControl.GetTimeTable(chapterData.chaptertime)) then    --要改为按照服务器时间表判
                isOpen = true
                break
            end
        end
    end
    return isOpen
end

function Event4Control.CheckChapterLock(_type)
    local isOpen = false
    local tChapterData = Event4Control.GetChapterData()
    for i, chapterData in ipairs(tChapterData) do
        if chapterData.Chaptertype and chapterData.Chaptertype == _type then
            local tCurLevelData = StormControl.GetStormPointByID(chapterData[1].levels[Event4Control.BossMode.Normal])
            isOpen = tCurLevelData:CheckLock()
        end
    end
    return isOpen
end

function Event4Control.GetBossData()
    if Event4BossData == nil then
        local tChapterData = Event4Control.GetChapterData()
        for i, chapterData in ipairs(tChapterData) do
            if chapterData.Chaptertype and chapterData.Chaptertype == ActiveChapterControl.ChapterType.WaiZhuanBoss then
                local tCurLevelData = StormControl.GetStormPointByID(chapterData[1].levels[Event4Control.BossMode.Normal])
                local monsterData = nil
                local monster = tCurLevelData.monsters
                local isBoss = tCurLevelData:GetAllMonsterIsBoss()
                for i = 1, #isBoss do
                    if isBoss[i] then
                        monsterData = monster[i]
                        break
                    end
                end
                --Event4BossData = ReadData.CreatMonster(monsterData.id,monsterData.level,monsterData.star,monsterData.skillLevel,monsterData.awaken,monsterData.scale,monsterData.sIndex)
                Event4BossData = MonsterControl.CreateSingleMonster(monsterData.id,monsterData.star,monsterData.level,monsterData.awaken,monsterData.skillLevel,monsterData.sIndex,monsterData.scale,monsterData.isBoss,monsterData.armor1,monsterData.armor1Pro,monsterData.armor1Skill,monsterData.armor2,monsterData.armor2Pro,monsterData.armor2Skill,1)
            end
        end
    end
    return Event4BossData
end
function Event4Control.ClearBossData()
    Event4BossData = nil
    BossChapterData = nil
    CurSelectLevel = nil
    ChapterData = {}
    NormalLevels = {}
end
---@return ActiveChapterData
---获取普通关卡数据
function Event4Control.GetChapterLevels()
    if #NormalLevels == 0 then
        local tChapterData = Event4Control.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.WaiZhuanNormal then
                table.insert(NormalLevels, v)
            end
        end
    end

    return NormalLevels
end
---获取新解锁关卡的章节ID和已解锁章节的数据
function Event4Control.GetNewChapter()
    local tChapters = Event4Control.GetChapterLevels()
    local tNewChapter = {}
    local tChapter = {}
    local tLockChapter = {}
    for i, v in ipairs(tChapters) do
        for k, chapter in ipairs(v) do
            for n, pointID in ipairs(chapter.levels) do
                local pointData = StormControl.GetStormPointByID(pointID)
                if pointData and pointData:CheckLock() then
                    if pointData.star == 0 then
                        table.insert(tNewChapter, chapter.scrollid)
                    end
                    if tLockChapter[chapter.scrollid] == nil then
                        table.insert(tChapter, chapter)

                        tLockChapter[chapter.scrollid] = 1
                    end
                end
            end
        end
    end

    return tNewChapter,tChapter
end
---获取BOSS开启时间
function Event4Control.GetBossOpenTime()
    local tBossData = Event4Control.GetBossChapterData()
    
    if tBossData then
        local tOpenTime = TimeControl.GetTimeTable(tBossData.chaptertime).openTime
        
        return tOpenTime-Global.GetCurTime()
    end
    
    return 0
end
---设置选中关卡索引
function Event4Control.SetToutchLevel(_chapter,_level)
    CurSelectLevel = { chapter=_chapter,level=_level }
end
---获取选中关卡索引
function Event4Control.GetToutchLevel()
    if CurSelectLevel == nil then
        --local tKey = "Event4SelectLevel_"..PlayerControl.GetPlayerData().UID.."_"..CurActID
        --local tValue = UnityEngine.PlayerPrefs.GetString(tKey)
        --local tStr = tValue == nil and nil or string.split(tValue,'_')
        --if tStr and Event4ActivityData[CurActID].version ~= tonumber(tStr[3]) then
        --    UnityEngine.PlayerPrefs.SetString(tKey,"")
        --    tValue = ""
        --end
        --if tValue ~= "" then
        --    CurSelectLevel = { chapter=tonumber(tStr[1]),level=tonumber(tStr[2]) }
        --else
            ---获取新解锁关卡的章节ID和已解锁章节的数据
            local newChapter,unlockChapter = Event4Control.GetNewChapter()

            ---展示解锁章节
            local tMaxID = 0
            local tLevel = 0
            for i, v in ipairs(unlockChapter) do
                if v.scrollid > tMaxID then
                    tMaxID = v.scrollid
                    tLevel = v.levels[1]
                end
            end
            if tMaxID > 0 and tLevel > 0 then
                CurSelectLevel = { chapter=tMaxID,level=tLevel }
            end
        --end
    end
    
    return CurSelectLevel
end
---保存选中关卡索引
function Event4Control.SaveToutchLevel()
    if CurSelectLevel then
        local tKey = "Event4SelectLevel_"..PlayerControl.GetPlayerData().UID.."_"..CurActID
        UnityEngine.PlayerPrefs.SetString(tKey,CurSelectLevel.chapter.."_"..CurSelectLevel.level.."_"..Event4ActivityData[CurActID].version)
    end
end

------------------------拓展件升级------------------------
---升级活动技能
function Event4Control.SkillUp(_activityID,_expansionID,callback)
    local expansionUPREQ =
    {
        eventID = _activityID,
        expansionID = _expansionID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientExpansionUPREQ',expansionUPREQ))

    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_EXPANSION_UP_REQ,bytes,0,nil,Event4Control.ExpansionUPACK,function(...)
        Event4Control.ExpansionUPNTF(...)
        if callback then
            callback()
        end
    end)
end
---升级活动技能ACK
function Event4Control.ExpansionUPACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientExpansionUPACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
       
    end
end
---升级活动技能NTF
function Event4Control.ExpansionUPNTF(buffer, tag)
    ---解析活动奖励
    local tab = assert(pb.decode('PBClient.ClientExpansionUPNTF',buffer))
    Event4ActivityData[CurActID].ExpansionLevel = tab.expansionLevel

    for i, v in ipairs(tab.cost) do
        ItemControl.PushSingleItemData(v,ItemControl.PushEnum.consume)
    end
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
end
---获取能量区间数据
function Event4Control.CheckEnergy(_energy)
    local tSkillLv = Event4Control.GetActSkillLv()
    local tSkillData = Event4Control.GetSkillData()
    local tEnergyData = Event4Control.GetEnergyEffect(_energy[2])
    if tSkillData == nil then
        return
    end
    
    local tData = nil
    local tCurEnergyVelue = tSkillData[tSkillLv] and tSkillData[tSkillLv].energyVelue - _energy[1] or - _energy[1]
    for i, v in ipairs(tEnergyData) do
        if tCurEnergyVelue >= v.range.min and tCurEnergyVelue <= v.range.max then
            tData = v
            break
        end
    end
    
    local tSelfEnergyVelue = tSkillData[tSkillLv] and tSkillData[tSkillLv].energyVelue or 0
    return tData,tSelfEnergyVelue
end

function Event4Control.CheckSkillRedDot()
    local tData = Event4Control.GetEvent4Data()
    --星变技能
    local checkSkill = function(_actId)
        local tSkillLv = Event4Control.GetActSkillLv(_actId)+1
        local tSkillData = Event4Control.GetSkillData(_actId)
        if tSkillData then
            local tCurSkillUpData = tSkillData[tSkillLv]
            if tCurSkillUpData then
                local tCanUp = true
                for i, v in ipairs(tCurSkillUpData.consume) do
                    local tItem = ItemControl.GetItemByIdAndType(v.goodsID, v.goodsType)
                    if tItem.count < v.costNum then
                        tCanUp = false
                        break
                    end
                end
                RedDotControl.GetDotData("Event4Xingbian_".._actId):SetState(tCanUp)
            end
        end
    end
    for i, v in pairs(tData) do
        if (CurActID == nil and v.activityID ~= 0) or v.activityID == CurActID then
            RedDotControl.GetDotData("Event4Xingbian_"..i):SetState(false)

            checkSkill(i)
        end
    end
end
------------------------扭蛋池------------------------
function Event4Control.InitShopData()
    if Event4ActivityData == nil then
        return
    end
    for i, actData in pairs(Event4ActivityData) do
        for k,v in ipairs(GashaponLocalData.tab) do
            if v[2] == actData.activityId then
                --ShopInfo[v[1]] = Event4ShopData.New(v[1])
                if ShopInfo[actData.activityId] == nil then
                    ShopInfo[actData.activityId] = {}
                end
                table.insert(ShopInfo[actData.activityId],Event4ShopData.New(v[1]))
            end
        end
        if #ShopInfo[actData.activityId] == 0 then
            return
        end

        if actData.poolID then
            CurPoolId[actData.activityId] = actData.poolID
            ClientPoolItems[actData.activityId] = Event4Control.GetCurShopPoolList(actData.activityId)
        end
        if actData.goods then
            Event4Control.PushClientPoolItems(actData.goods, actData.activityId)
        end
    end
end

---@return Event4ShopData[]
function Event4Control.GetShopList()
    local arr = {}
    for k,v in pairs(ShopInfo[CurActID]) do
        table.insert(arr,v)
    end
    return arr
end

---@return ItemData[] 获取特殊物品
function Event4Control.GetSpecialItemList()
    local arr = {}
    local str = Event4Info[CurActID].specialItem
    for k,v in pairs(str) do
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        table.insert(arr,item)
    end
    return arr
end

---获取特殊物品数量
function Event4Control.GetSpecialItemCount()
    local count = 0
    local str = Event4Info[CurActID].specialItem
    for k,v in pairs(str) do
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        if item.count > 0 then
            count = count + 1
        end
    end
    return count
end

---检查商店红点
function Event4Control.CheckShopRedPoint()
    local tData = Event4Control.GetEvent4Data()

    local checkPoint = function(_actId)
        local arr = Event4Control.GetCollectionList(_actId)
        for k,v in pairs(arr) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("Event4Award_".._actId):SetState(true)
                break
            end
        end
    end
    for i, v in pairs(tData) do
        if (CurActID == nil and v.activityID ~= 0) or v.activityID == CurActID then
            RedDotControl.GetDotData("Event4Award_"..i):SetState(false)

            ---遍历
            checkPoint(i)
        end
    end
end

---@return Event4ShopData 获取当前蛋池
function Event4Control.GetCurShop()
    if CurPoolId[CurActID] == nil then
        return nil
    end
    local tId = CurPoolId[CurActID]==0 and ShopInfo[CurActID][1].id or CurPoolId[CurActID]
    for k,v in pairs(ShopInfo[CurActID]) do
        if v.id == tId then
            return v
        end
    end
end

---@return Event4ShopData 获取当前蛋池掉落数据
function Event4Control.GetCurShopPoolList(_actId)
    if CurPoolId[_actId] == nil then
        return nil
    end
    local id = CurPoolId[_actId]
    if id == 0 then
        id = ShopInfo[_actId][1].id
    end
    for k,v in pairs(ShopInfo[_actId]) do
        if v.id == id then
            return v:GetPoolData(Event4Info[_actId].specialItem)
        end
    end
end

---根据蛋池id获取蛋池数据
function Event4Control.GetShopPoolByPoolId(pId)
    for k,v in pairs(ShopInfo[CurActID]) do
        if v.pool == pId then
            return v
        end
    end
    return nil
end

---推送当前蛋池数据
function Event4Control.PushClientPoolItems(data, actId)
    if data == nil or data == "" then
        return
    end
    local arr = RapidJson.decode(data)
    local tPoolItems = ClientPoolItems[actId]
    for k,v in pairs(tPoolItems) do
        v.totalCount = 0
        for i,value in pairs(arr) do
            if i == v.str then
                v.totalCount = value
            end
        end
    end
end

---获取当前卡池剩余物品数据
function Event4Control.GetClientPoolItems()
    return ClientPoolItems[CurActID]
end

---获取卡池剩余物品数量
function Event4Control.GetPoolItemsCount()
    local count = 0
    for k,v in pairs(ClientPoolItems[CurActID]) do
        count = count + v.totalCount
    end
    return count
end

---检查当前卡池特殊物品是否售罄
function Event4Control.CheckSpecialItemSellOut()
    local tCurPoolId = CurPoolId[CurActID]
    local tData = nil
    for i, v in ipairs(ShopInfo[CurActID]) do
        if v.id == tCurPoolId then
            tData = v
            break
        end
    end
    if tData ~= nil and tData.unlockType == 0 then
        local arr = Event4Control.GetSpecialItemList()
        for k,v in pairs(ClientPoolItems[CurActID]) do
            for i,item in pairs(arr) do
                if item.id == v.item.id then
                    if v.totalCount > 0 then
                        return false
                    end
                end
            end
        end
        return true
    else
        for k,v in pairs(ClientPoolItems[CurActID]) do
            if v.totalCount > 0 then
                return false
            end
        end
        return true
    end
end

---获取收藏品成就任务奖励数据
function Event4Control.GetCollectionList(_actId)
    local arr = {}
    for k,v in pairs(TaskControl.AchievementDataList) do
        if v.activeId == Event4Info[_actId].specialAId then
            if TaskControl.CheckComplete(v.id) then
                v.isComplete = 1
            else
                v.isComplete = 0
            end
            if TaskControl.CheckAchieveReceived(v) then
                v.isReceive = 1
            else
                v.isReceive = 0
            end
            table.insert(arr,v)
        end
    end
    Global.Sort(arr,{"id"},false)
    return arr
end

---检查抽取结果是否包含特殊道具
function Event4Control.CheckContainsSpecial(data)
    Event4Control.ContainsSpecial = false
    for k,v in pairs(data) do
        for i,item in pairs(Event4Control.GetSpecialItemList()) do
            if item.id == v.goodsID then
                Event4Control.ContainsSpecial = true
                break
            end
        end
    end
end

---扭蛋抽奖
function Event4Control.Lottery(eventId,poolId,num,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
        num = num
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameLotteryREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_LOTTERY_REQ,bytes,0,nil,Event4Control.LotteryACK,function(...)
        Event4Control.LotteryNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋抽奖ACK
function Event4Control.LotteryACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameLotteryACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    end
end
---扭蛋抽奖NTF
function Event4Control.LotteryNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameLotteryNTF',buffer))
    if tab.cost then
        ---物品消耗
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    end
    if tab.goods then
        ---将奖励推送进背包
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---检查是否包含特殊道具
        Event4Control.CheckContainsSpecial(tab.goods)
        Event.Clear("Event4ShopAwardPop")
        Event.Add("Event4ShopAwardPop",function()
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
        end)
    end
    ---推送成就
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---刷新背包缓存数据
    BagViewModel.ReloadCacheData()
    ---刷新奖池
    Event4Control.PushClientPoolItems(tab.poolGoods, tab.eventID)
    ---检查红点
    Event4Control.CheckShopRedPoint()
end

---扭蛋卡池升级
function Event4Control.GameUp(eventId,poolId,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameUPREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_UP_REQ,bytes,0,nil,Event4Control.GameUpACK,function(...)
        Event4Control.GameUpNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋卡池升级ACK
function Event4Control.GameUpACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameUPACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    elseif tab.errNo == 0 then
    end
end
---扭蛋卡池升级NTF
function Event4Control.GameUpNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameUPNTF',buffer))
    ---更新当前蛋池id
    CurPoolId[tab.eventID] = tab.poolID
    ---刷新奖池
    ClientPoolItems[tab.eventID] = Event4Control.GetCurShopPoolList(tab.eventID)
    Event4Control.PushClientPoolItems(tab.poolGoods, tab.eventID)
end

---扭蛋卡池重置
function Event4Control.PoolReset(eventId,poolId,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameResetREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_RESET_REQ,bytes,0,nil,Event4Control.PoolResetACK,function(...)
        Event4Control.PoolResetNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋卡池重置ACK
function Event4Control.PoolResetACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameResetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    end
end
---扭蛋卡池重置NTF
function Event4Control.PoolResetNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameResetNTF',buffer))
    ---更新当前蛋池id
    CurPoolId[tab.eventID] = tab.poolID
    ---刷新奖池
    ClientPoolItems[CurActID] = Event4Control.GetCurShopPoolList(CurActID)
    Event4Control.PushClientPoolItems(tab.poolGoods, CurActID)
end
---检测七月活动所有红点
function Event4Control.CheckAllRedDot()
    ---任务红点
    Event4Control.CheckTaskRedPoint()
    ---扭蛋红点
    Event4Control.CheckShopRedPoint()
    ---星变红点
    Event4Control.CheckSkillRedDot()
end

---查询该活动是否开启
function Event4Control.CheckActiveOpen(_actId)
    local tActiveData = ActivityControl.GetActivityByID(_actId)
    if tActiveData == nil or (tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen)) or not StormControl.CheckPointPass(tonumber(tActiveData.front)) then
        local str = MgrLanguageData.GetLanguageByKey("activityCcontrol_tips1")
        if tActiveData ~= nil and tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen) then
            str = SysLockControl.GetSystemLockTips(tActiveData.systemopen)
        end
        return false,str
    end

    return true
end

function Event4Control.Clear()
    SignAwardList = {}
    PreheatList = {}
    PreheatInfo = nil
    PreheatActiveData = nil
    Event4Info = {}
    ShopInfo = {}

    Event4ActivityData = {}    
    ClientPoolItems = {}
    CurPoolId = {}
    Event4Control.ContainsSpecial = false
    ChapterData = {}
    NormalLevels = {}
    CurSelectLevel = nil
    BossChapterData = nil
    CurActID = nil
end

return Event4Control