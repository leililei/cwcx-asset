require("Model/Summer/Data/SummerData")
require("Model/Summer/Data/SummerPreheaData")
require("Model/Summer/Data/SummerTalkData")
---配置表
require("LocalData/SummerlogawardLocalData")
require("LocalData/SummerlogdialogueLocalData")
require("LocalData/SummermazetalkLocalData")

---数据管理器
HalfAnniControl = {}
---@type ActivechapterLocalData
---BOSS模式(根据字段"levels"填入的先后顺序,决定难度)
HalfAnniControl.BossMode = {
    ---普通
    Normal = 1,
    ---困难
    Hard = 2
}
---夏活关卡卷ID
HalfAnniControl.LevelScroll = {
    Scroll1 = 1,
    Scroll2 = 2,
    Scroll3 = 3
}
HalfAnniControl.TaskType = {
    daily = 1,
    achievement = 2
}
local PreheatList = {}  ---预热表

local HalfAnniInfo = nil        ---活动数据
local ChapterData = {}          ---夏活章数据
local CurSelectLevel = {}       ---当前选中的关卡
local CurBranchSelectLevel = nil       ---当前分支选中的关卡
local NormalLevels = {}         ---普通关卡数据
local CurContent = nil          ---当前打开的关卡Content
local CurSelect = nil           ---当前选中的关卡
local ChapterBoss = nil         ---BOSS章节数据
local BossDetail = nil          ---BOSS详情
local BossDataList = {}         ---BOSS基础属性
local CurBossLevel = nil        ---当前BOSS关
local GamePlot = nil            ---签到小游戏
local GameCost = nil            ---签到消耗
local CanPlay = true            ---播放入场动画

HalfAnniControl.curShopType = nil   ---当前商店类型
HalfAnniControl.curTaskType = nil   ---当前任务类型
HalfAnniControl.TaskType = {
     daily = 0,       --每日
     achievement = 1,  --成就
}

function HalfAnniControl.Init()
    ---初始化活动数据
    HalfAnniControl.InitData()
    ---签到消耗
    GameCost = string.split(SteamLocalData.tab[124000][2],'_')
end

------------------------活动数据------------------------
function HalfAnniControl.InitData()
    for k,v in pairs(ActivityLocalData.tab) do
        if v[2] == ActivityControl.activityTypeEnum.HALF_ANNI then
            HalfAnniInfo = EventRaidData.New()
            HalfAnniInfo:PushData(v[1])
        end
    end
end

---打开主界面
function HalfAnniControl.OpenHome()
    local remainTime = HalfAnniControl.GetEndTime() - 1
    local tActivityData = ActivityControl.GetCurActivityByID(HalfAnniInfo.activityID)
    if not SysLockControl.CheckSysLock(tActivityData.systemopen) then
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(tActivityData.systemopen),1},true)
        return
    end
    if remainTime > 0 then
        --若首次且有视频文件名
        if HalfAnniInfo.usmBg and HalfAnniInfo.usmBg[1] ~= "0" and CanPlay then
            local tUsm = string.split(HalfAnniInfo.usmBg[1],'_')
            MgrUI.Pop(UID.UsmPlay, { tUsm[2], function()
                MgrUI.GoHide(UID.HalfAnniversaryHome_UI)
                CanPlay = false
            end })
        else
            MgrUI.GoHide(UID.HalfAnniversaryHome_UI)
        end
    end
end

---打开章节界面
function HalfAnniControl.OpenChapter()
    if not HalfAnniControl.CheckChapterTimeOpen(false) then
        local tChapters = HalfAnniControl.GetChapterLevels()
        if Global.GetTimeState(tChapters[1].beginTime, tChapters[1].endTime) == 1 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text20"), 1 }, true)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
        end

        return
    end
    if HalfAnniInfo.LevelType == 0 then
        MgrUI.GoHide(UID.HalfAnniversaryScroll_UI)
    else
        HalfAnniControl.OpenBranchLevel()
    end
end
---打开关卡界面
function HalfAnniControl.OpenLevel(_ChapterId)
    local TouchLevel = HalfAnniControl.GetToutchLevel(_ChapterId)
    if TouchLevel == nil then
        local tChapters = HalfAnniControl.GetChapterLevels()
        local tData = nil
        for i, v in ipairs(tChapters) do
            if v.chapterid == _ChapterId then
                tData = v
                break
            end
        end
        local TimeState = Global.GetTimeState(tData.beginTime, tData.endTime)
        if TimeState == 1 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text50"), 1 }, true)
        elseif TimeState == 3 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_summerevent_text19"), 1 }, true)
        end
        return
    end

    MgrUI.GoHide(UID.HalfAnniversaryLevels_UI)
end

---打开BOSS界面
function HalfAnniControl.OpenBoss()
    if not HalfAnniControl.CheckChapterTimeOpen(true) then
        local tChapters = HalfAnniControl.GetChapterBoss()
        if Global.GetTimeState(tChapters.beginTime, tChapters.endTime) == 1 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text20"), 1 }, true)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
        end
        return
    end
    
    MgrUI.GoHide(UID.HalfAnniversaryBoss_UI)
end

---打开商店
function HalfAnniControl.OpenShop()
    local remainTime = HalfAnniControl.GetEndTime() - 1
    if remainTime > 0 then
        MgrUI.GoHide(UID.HalfAnniversaryShop_UI)
    end
end

---打开任务界面
function HalfAnniControl.OpenTask()
    MgrUI.GoHide(UID.HalfAnniversaryTask_UI)
end

---打开签到游戏
function HalfAnniControl.OpenSignGame()
    MgrUI.GoHide(UID.HalfAnniversaryGame_UI)
end
---打开签到游戏剧情
function HalfAnniControl.OpenSignGamePlot()
    if not HalfAnniControl.CheckTimeOpen() then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_juqinghuodong_text3"), 1 }, true)
        return
    end
    MgrUI.GoHide(UID.HalfAnniversaryPlot_UI)
end
---打开多分支关卡
function HalfAnniControl.OpenBranchLevel()
    if HalfAnniControl.GetToutchLevel() == nil then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text50"), 1 }, true)
        return
    end

    local tTime = 0
    local isOpen = false
    local tChapters = HalfAnniControl.GetChapterLevels()
    for i, v in ipairs(tChapters) do
        if Global.isMiddleTime(v.beginTime, v.endTime) then
            isOpen = true
            break
        else
            if tTime == 0 or tTime > Global.GetTimeByStr(v.beginTime) then
                tTime = Global.GetTimeByStr(v.beginTime)
            end
        end
    end

    if isOpen then
        MgrUI.GoHide(UID.HalfAnniversaryLevels2_UI)
    elseif tTime > Global.GetCurTime() then
        local tStr = Global.GetAloneTimeFormat(tTime)
        local tTips = string.format(MgrLanguageData.GetLanguageByKey("ui_externalevent_txt13"),tStr)
        MgrUI.Pop(UID.PopTip_UI, { tTips, 1 }, true)
    else
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("eventraidcontrol_tips2"), 1 }, true)
    end
end

function HalfAnniControl.GetData()
    if HalfAnniInfo == nil then
        HalfAnniControl.InitData()
    end
    
    return HalfAnniInfo
end
---商店数据
function HalfAnniControl.GetShopData()
    local arr = {}
    for k,v in pairs(HalfAnniInfo.shopType) do
        local shopData = ShopControl.GetCertainTypeShopData(v)
        arr[v] = shopData
    end
    return arr
end
---每日任务数据
function HalfAnniControl.GetDailyTaskData()
    local array = TaskControl.GetEventRaidTaskData(HalfAnniInfo.dayTaskId)    --附带判断任务是否解锁
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
function HalfAnniControl.GetTaskData()
    local tAchieviment = AchievementViewModel.GetTask(TaskControl.AchievementTaskType.ACTIVITY_STORY,false,HalfAnniInfo.taskId)
    
    return tAchieviment
end
---@return ActiveChapterData
---章节数据
function HalfAnniControl.GetChapterData()
    if #ChapterData == 0 then
        ChapterData = ActiveChapterControl.GetChapterData(HalfAnniInfo.chapterId)
    end
    
    return ChapterData
end

---@return ActiveChapterData
---获取普通关卡数据
function HalfAnniControl.GetChapterLevels()
    if #NormalLevels == 0 then
        local tChapterData = HalfAnniControl.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype ~= ActiveChapterControl.ChapterType.Boss and v.Chaptertype ~= ActiveChapterControl.ChapterType.Extra then
                table.insert(NormalLevels, v[1])
            end
        end
    end

    return NormalLevels
end
---获取BOSS关卡数据
function HalfAnniControl.GetChapterBoss()
    if ChapterBoss == nil then
        local tChapterData = HalfAnniControl.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.Boss then
                ChapterBoss = v[1]
            end
        end
        ActivityControl.InitBossAttri(ChapterBoss.levels)
    end

    return ChapterBoss
end
---获取抽奖剧情关
function HalfAnniControl.GetGamePlot()
    if GamePlot == nil then
        local tChapterData = HalfAnniControl.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.Extra then
                GamePlot = v[1]
            end
        end
    end
    
    return GamePlot
end

---获取已解锁章节的数据和新解锁关卡的章节ID
function HalfAnniControl.GetNewChapter()
    local tChapters = HalfAnniControl.GetChapterLevels()
    local tNewChapter = {}
    local tChapter = {}
    
    for i, v in ipairs(tChapters) do
        for n, pointID in ipairs(v.levels) do
            local pointData = StormControl.GetStormPointByID(pointID)
            if pointData and pointData:CheckLock() then
                if pointData.star == 0 and tNewChapter[v.chapterid] == nil then
                    tNewChapter[v.chapterid] = v
                end
                if tChapter[v.chapterid] == nil then
                    tChapter[v.chapterid] = v
                end
            end
        end
    end

    return tChapter,tNewChapter
end
---设置选中关卡索引
function HalfAnniControl.SetToutchChapter(_chapter)
    CurSelectLevel.chapter = _chapter
end
function HalfAnniControl.SetToutchLevel(_level)
    CurSelectLevel.level = _level
end
---获取选中关卡索引
function HalfAnniControl.GetToutchLevel(_chapter)
    ---获取已解锁章节的数据和新解锁关卡的章节ID
    local unlockChapter = HalfAnniControl.GetNewChapter()
    ---展示解锁章节
    local tMaxID = 0
    local tLevel = 0
    local tChapterID = 0
    local idx = 0
    if CurSelectLevel.chapter == nil then
        for i, v in pairs(unlockChapter) do
            if v.scrollid > tMaxID then
                tMaxID = v.scrollid
                tChapterID = v.chapterid
                tLevel = #v.levels
            end
        end
        
        CurSelectLevel.chapter = tChapterID
    end
    local tCurChapter = _chapter and _chapter or CurSelectLevel.chapter
    if tCurChapter then
        if unlockChapter[tCurChapter] == nil then
            return nil
        end
        if unlockChapter[tCurChapter].chaptertype == ActiveChapterControl.ChapterType.Logic then
            local num = 0
            for i, v in ipairs(unlockChapter[tCurChapter].levels) do
                local pointData = StormControl.GetStormPointByID(v)
                if pointData and pointData:CheckLock() then
                    num = num + 1
                end
            end
            local tJinDu = math.modf(num / #unlockChapter[tCurChapter].levels * 100)
            CurSelectLevel = { chapter = tCurChapter, level = tJinDu }
        else
            for i, v in ipairs(unlockChapter[tCurChapter].levels) do
                local pointData = StormControl.GetStormPointByID(v)
                if pointData:CheckLock() then
                    idx = i
                end
            end
            tLevel = unlockChapter[tCurChapter].levels[idx]
            
            if tLevel > 0 then
                CurSelectLevel = { chapter = tCurChapter, level = tLevel }
            end
        end
    end

    return CurSelectLevel
end
---设置选中关卡索引
function HalfAnniControl.SetBranchToutchLevel(_chapter,_level)
    CurBranchSelectLevel = { chapter=_chapter,level=_level }
end
---获取多分支线选中关卡索引
function HalfAnniControl.GetBranchToutchLevel()
    if CurBranchSelectLevel == nil then
        local tKey = "HalfSelectLevel_"..PlayerControl.GetPlayerData().UID.."_"..HalfAnniInfo.activityID
        local tValue = UnityEngine.PlayerPrefs.GetString(tKey)
        local tStr = tValue == nil and nil or string.split(tValue,'_')
        local tData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.HALF_ANNI)
        if tStr and tData.version ~= tonumber(tStr[3]) then
            UnityEngine.PlayerPrefs.SetString(tKey,"")
            tValue = ""
        end
        tValue = ""
        if tValue ~= "" then
            CurBranchSelectLevel = { chapter=tonumber(tStr[1]),level=tonumber(tStr[2]) }
        else
            ---获取新解锁关卡的章节ID和已解锁章节的数据
            local unlockChapter,newChapter = HalfAnniControl.GetNewChapter()

            ---展示解锁章节
            local tMaxID = 0
            local tLevel = 0
            for i, v in pairs(unlockChapter) do
                if v.scrollid > tMaxID then
                    tMaxID = v.scrollid
                    tLevel = v.levels[1]
                end
            end
            if tMaxID > 0 and tLevel > 0 then
                CurBranchSelectLevel = { chapter=tMaxID,level=tLevel }
            end
        end
    end

    return CurBranchSelectLevel
end
---保存选中关卡索引
function HalfAnniControl.SaveToutchLevel()
    if CurBranchSelectLevel then
        local tData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.HALF_ANNI)
        local tKey = "HalfSelectLevel_"..PlayerControl.GetPlayerData().UID.."_"..HalfAnniInfo.activityID
        UnityEngine.PlayerPrefs.SetString(tKey,CurSelectLevel.chapter.."_"..CurSelectLevel.level.."_"..tData.version)
    end
end
---设置当前打开的关卡Content
function HalfAnniControl.SetCurContent(_Content)
    CurContent = _Content
end
---获取当前打开的关卡Content
function HalfAnniControl.GetCurContent()
    return CurContent
end
---设置当前选中的关卡
function HalfAnniControl.SetCurSelect(_Select)
    CurSelect = _Select
end
---获取当前选中的关卡
function HalfAnniControl.GetCurSelect()
    return CurSelect
end

---获取BOSS界面数据
function HalfAnniControl.GetBossDetail()
    if BossDetail == nil then
        local tChapterData = HalfAnniControl.GetChapterBoss()
        local monsterData = nil
        for i, v in ipairs(tChapterData.levels) do
            local tCurLevelData = StormControl.GetStormPointByID(v)
            local monster = tCurLevelData.monsters
            local isBoss = tCurLevelData:GetAllMonsterIsBoss()
            for n = 1, #isBoss do
                if isBoss[n] then
                    if i == #tChapterData.levels then
                        monsterData = monster[n]
                    end
                    BossDataList[v] = monster[n]
                end
            end
        end
        
        BossDetail = MonsterControl.CreateSingleMonster(monsterData.id,monsterData.star,monsterData.level,monsterData.awaken,monsterData.skillLevel,monsterData.sIndex,monsterData.scale,monsterData.isBoss,monsterData.armor1,monsterData.armor1Pro,monsterData.armor1Skill,monsterData.armor2,monsterData.armor2Pro,monsterData.armor2Skill,1)
    end
    return BossDetail,BossDataList
end
------------------------签到小游戏------------------------
---获取本次活动签到小游戏数据
function HalfAnniControl.GetSignData()
    local tSignData = Event4Control.GetPreheatData(HalfAnniInfo.activityID)

    return tSignData
end
---获取签到消耗
function HalfAnniControl.GetGameCost()
    return GameCost
end
---签到领取奖励
function HalfAnniControl.Sign(callback)
    local activityRewardReq =
    {
        activityId = HalfAnniInfo.activityID,
        rewardId = 0,
        rewardType = 1
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientActivityGetRewardREQ',activityRewardReq))

    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ACTIVITY_GET_REWARD_REQ,bytes,0,nil,HalfAnniControl.ActivityRewardSendACK,function(buffer, tag)
        ---解析活动奖励
        local tab = assert(pb.decode('PBClient.ClientActivityGetRewardNTF',buffer))
        if tab.goods then
            ---将奖励推送进背包
            ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
            ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
            -----弹出奖励弹窗
            --MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
            if callback then
                callback(tab)
            end
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
        end

        ---刷新背包缓存数据
        BagViewModel.ReloadCacheData()
    end)
end
---领取活动奖励ACK
function HalfAnniControl.ActivityRewardSendACK(buffer, tag)
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

------------------------红点相关------------------------
---检查任务相关红点
function HalfAnniControl.CheckTaskRedPoint()
    RedDotControl.GetDotData("HalfAnniversaryDailyTask"):SetState(false)
    RedDotControl.GetDotData("HalfAnniversaryAchievement"):SetState(false)
    
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.HALF_ANNI) then
        return
    end
    ---遍历任务
    local isOpen = HalfAnniControl.CheckChapterTimeOpen(false)
    if isOpen then
        for k,v in pairs(HalfAnniControl.GetDailyTaskData()) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("HalfAnniversaryDailyTask"):SetState(true)
                break
            end
        end
    end
    ---遍历成就
    for k,v in pairs(HalfAnniControl.GetTaskData()) do
        local progressStr = JNStrTool.strSplit("_", v.complete)
        local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
        if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
            RedDotControl.GetDotData("HalfAnniversaryAchievement"):SetState(true)
            break
        end
    end
end
---游戏剧情红点
function HalfAnniControl.GamePlotRedPoint()
    RedDotControl.GetDotData("HalfAnniversaryPlot"):SetState(false)
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.HALF_ANNI) then
        return
    end
    local tData = HalfAnniControl.GetGamePlot()
    local tCurPointData = StormControl.GetStormPointByID(tData.levels[1])
    local tCost = string.split(tCurPointData.activitypreview2,"_")
    ---判断是否解锁的道具
    local itemNum = ItemControl.GetItemByIdAndType(tonumber(tCost[2]),tonumber(tCost[1])).count
    for i, v in ipairs(tData.levels) do
        local data = StormControl.GetStormPointByID(v)
        ---解锁所需数量
        local costNum = tonumber(string.split(data.activitypreview2,"_")[3])
        if itemNum >= costNum and data:CheckLock() and data.star == 0 then
            RedDotControl.GetDotData("HalfAnniversaryPlot"):SetState(true)
        end
    end
end
---检查所有红点
function HalfAnniControl.CheckAllRedPoint()
    ---任务相关红点
    HalfAnniControl.CheckTaskRedPoint()
    ---游戏剧情红点
    HalfAnniControl.GamePlotRedPoint()
end
---活动剩余时间
function HalfAnniControl.GetEndTime()
    local tData = HalfAnniControl.GetData()
    ---活动结束提醒
    local serverTime = MgrNet.GetServerTime()
    local tEndTime = Global.GetTimeByStr(tData.endTime)
    local remainTime = tEndTime - serverTime

    return remainTime
end
---活动挑战剩余时间
function HalfAnniControl.GetBattleEndTime()
    local tData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.HALF_ANNI)
    ---活动结束提醒
    local serverTime = MgrNet.GetServerTime()
    local tEndTime = Global.GetTimeByStr(tData.battleEndTime)
    local remainTime = tEndTime - serverTime

    return remainTime
end
---@return ActiveChapterData
---检测关卡是否在活动期间
function HalfAnniControl.CheckChapterTimeOpen(_isBoss)
    local isOpen = false
    local tChapterData = HalfAnniControl.GetChapterData()
    
    for i, chapterData in ipairs(tChapterData) do
        if _isBoss == (chapterData.Chaptertype == ActiveChapterControl.ChapterType.Boss) and chapterData.Chaptertype ~= ActiveChapterControl.ChapterType.Extra then
            for i, v in ipairs(chapterData) do
                if Global.CheckOnTime(TimeControl.GetTimeTable(v.chaptertime)) then
                    isOpen = true
                    break
                end
            end
        end
    end
    return isOpen
end

function HalfAnniControl.CheckTimeOpen()
    local isOpen = false
    local tChapterData = HalfAnniControl.GetChapterData()

    for i, chapterData in ipairs(tChapterData) do
        if chapterData.Chaptertype == ActiveChapterControl.ChapterType.Extra then
            for i, v in ipairs(chapterData) do
                if Global.CheckOnTime(TimeControl.GetTimeTable(v.chaptertime)) then
                    isOpen = true
                    break
                end
            end
        end
    end
    return isOpen
end

function HalfAnniControl.CheckChapterLock(_type)
    local isOpen = false
    local tChapterData = HalfAnniControl.GetChapterData()
    for i, chapterData in ipairs(tChapterData) do
        if chapterData.Chaptertype and chapterData.Chaptertype == _type then
            local tCurLevelData = StormControl.GetStormPointByID(chapterData[1].levels[HalfAnniControl.BossMode.Normal])
            isOpen = tCurLevelData:CheckLock()
        end
    end
    return isOpen
end

function HalfAnniControl.Clear()
    PreheatList = {}
    HalfAnniInfo = nil
    ChapterData = {}
    CurSelectLevel = {}
    CurBranchSelectLevel = nil
    NormalLevels = {}
    CurContent = nil
    CurSelect = nil
    ChapterBoss = nil
    BossDetail = nil
    BossDataList = {}
    CurBossLevel = nil
    GamePlot = nil
    CanPlay = true
    
    HalfAnniControl.curShopType = nil
    HalfAnniControl.curTaskType = nil
end
return HalfAnniControl