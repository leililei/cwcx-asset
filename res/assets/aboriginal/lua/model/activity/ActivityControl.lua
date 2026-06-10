require("LocalData/ActivityLocalData")
require("LocalData/FirstchargeawardLocalData")
require("LocalData/RechargeLocalData")
require("LocalData/MonthlyrechargeLocalData")
require("LocalData/ReturnsigninLocalData")
require("LocalData/ChaptertaskLocalData")
require("LocalData/DirectlylibaoLocalData")
require("Model/Activity/ActivityData/ActivityData")
require("Model/Activity/ActivityData/DialogueData")
require("Model/Activity/ActivityData/ChapterTaskData")
---活动管理器
ActivityControl = {}

---@type ActivityData[] 表中的活动信息
local CacheActivityData = {}
---缓存来自服务器的所有活动信息
---@type ActivityData[]
local AllActivityInfo = {}
---收到所有活动信息标志
ActivityControl.AllActivityInfoGet = false
ActivityControl.PageType = nil  ---打开活动界面开启的页签

---@class activityTypeEnum 活动类型枚举
ActivityControl.activityTypeEnum = {
    ---月冕
    EVENT = 1,
    ---通行证
    PASSPORT = 2,
    ---月塔
    MONTH_EVENT = 3,
    ---活动预热
    PREHEAT = 400,
    ---预热2
    WarmUP2 = 401,
    ---预热3(气球签到)
    PREHEAT3 = 402,
    ---限时签到
    LIMITSIGN = 403,
    ---新限时签到
    LIMITSIGN_NEW = 405,
    ---生日签到
    CAKESIGN = 40501,
    ---Bingo宾果
    BINGO = 407,
    ---夏活
    SUMMER = 500,
    ---四月外传活动
    EVENT4 = 501,
    ---半周年活动
    HALF_ANNI = 502,
    ---个人剧情活动
    PERSON_STORY = 510,
    ---累销活动(仅有任务和商店的活动)
    CUMULATIVE_SALES = 700,
    ---礼包直购
    GIFT_BUY = 887,
    ---体力消耗活动
    ACTIVE_TILI = 890,
    ---拉新活动
    INVITE = 985,
    ---折扣商店（B站整活搞出来的需求）
    DISCOUNT_SHOP = 986,
    ---百日签到
    SIGNALL = 987,
    ---宇宙武道会
    PVP_WuDaoHui = 988,
    ---章节任务活动
    CHAPTER_TASK = 989,
    ---回归活动
    HUIGUI = 990,
    ---限时充值
    MonthlyRecharge = 991,
    ---累计充值
    TotalRecharge = 992,
    ---基金
    FUND = 993,
    ---战术指导
    GUIDE = 994,
    ---签到
    SIGN = 995,
    --联合讨伐
    LIANHETAOFA = 996,
    ---七日签到
    SIGNDAY = 997,
    ---首充
    FIRSTCHARGE = 998,
    ---新兵训练
    NOVICE_TRAIN = 999,
}
local FirstChargeCfg = {}
local IsReqData = false
local FirstChargeState = 0
local CanGet = {}               ---能够获得的奖励列表
local DialogData = {}
local BossLevelList = {}        ---记血量的BOSS关卡数据
local CurBossLevel = nil
local IsGetBossData = true      ---是否获取BOSS数据
local LimitSignData = {}        ---显示签到数据
local ChapterTask = {}          ---活动章节任务数据
local ChapterTaskInfo = {}
local GiftCfg = {}             ---礼包直购配置
local Gift_BuyTimes = {}
local Gift_TotalTimes = {}

---从服务器获取通行证数据
function ActivityControl.PushData(callBack)
    local ExpReq = {
        rev = "1";
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientActivityGetREQ',ExpReq))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ACTIVITY_GET_REQ,bytes,0,nil,ActivityControl.ActivityACK,function(...)
        ActivityControl.ActivityNTF(...)
        if callBack then
            callBack()
        end
    end)
end
---获得玩家活动ACK
function ActivityControl.ActivityACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientActivityGetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activityCcontrol_tips1"),2},true)
    end
end
---获得玩家活动NTF(包含userID，活动ID，活动版本号，分数，更新时间，已领奖励)
function ActivityControl.ActivityNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientActivityGetNTF',buffer))
    for i,v in pairs(tab.events) do
        if AllActivityInfo[v.activityId] == nil then
            AllActivityInfo[v.activityId] = ActivityData.New(v.activityId)
        end
        AllActivityInfo[v.activityId]:PushData(v)
    end
    PassportControl.SetPassportData()   --通行证信息刷新
    TaskControl.SetNoviceData()         --新手任务信息刷新
    EventRaidControl.SetEventRaidData()  --剧情活动信息刷新
    YueTaViewModel.SetYuetaData()
    ActivityControl.AllActivityInfoGet = true
    ---首充红点
    ActivityControl.CheckFirstCharge()
end

---登录初始化活动
function ActivityControl.InitActivity(events)    
    for i, v in pairs(ActivityLocalData.tab) do
        if AllActivityInfo[v[1]] == nil then
            AllActivityInfo[v[1]] = ActivityData.New(v[1])
        end
    end
    for i,v in pairs(events) do
        if AllActivityInfo[v.activityId] ~= nil then
            AllActivityInfo[v.activityId]:PushData(v)
        end
    end
    PassportControl.SetPassportData()   --通行证信息刷新
    TaskControl.SetNoviceData()         --新手任务信息刷新
    EventRaidControl.SetEventRaidData()  --剧情活动信息刷新
    FundControl.SetFundData()           ---基金信息刷新
    ActivityControl.AllActivityInfoGet = true

    ActivityControl.InitFirstCharge()
    ---首充红点
    ActivityControl.CheckFirstCharge()
    Event.Add("ActivityReq",Handle(ActivityControl,ActivityControl.ActivityReq))
    ---初始化活动对话数据
    ActivityControl.InitDialogData()
    ---初始化活动章节任务数据
    ActivityControl.InitChapterTaskData()
    --初始化礼包直购
    ActivityControl.InitBuyGift()
end

function ActivityControl.ActivityReq()
    if IsReqData then
        ActivityControl.PushData()
    end
end

---更新部分活动信息
function ActivityControl.SetActivityInfo(activityId,tab)
    if tab.version then
        AllActivityInfo[activityId].version = tab.version
    end
    if tab.score then
        AllActivityInfo[activityId].score = tab.score
    end
    if tab.uTime then
        AllActivityInfo[activityId].uTime = tab.uTime
    end
    PassportControl.SetPassportData()   --通行证信息刷新
    TaskControl.SetNoviceData()         --新手任务信息刷新
    EventRaidControl.SetEventRaidData()  --剧情活动信息刷新
end
---根据活动类型获得活动信息
---@return ActivityData
function ActivityControl.GetActivityInfo(activityType)
    for i,v in pairs(ActivityLocalData.tab) do
        if v[2] == activityType then
            if AllActivityInfo[v[1]] ~= nil then
                return AllActivityInfo[v[1]]
            end
        end
    end
    ---未找到
    return nil
end

---根据活动类型获得同类型的活动信息
---@type ActivityData[]
function ActivityControl.GetActivityList(activityType)
    local list = {}
    for i,v in pairs(ActivityLocalData.tab) do
        if v[2] == activityType then
            if AllActivityInfo[v[1]] ~= nil then
                list[v[1]] = AllActivityInfo[v[1]]
            end
        end
    end
    ---未找到
    return list
end

---根据活动ID获取活动信息
function ActivityControl.GetActivityByID(_actId)
    return AllActivityInfo[_actId]
end

---获取所有存在活动期间的数据
function ActivityControl.GetAllActivityData()
    local tAllData = {}
    ---@type ActivityData[] AllActivityInfo
    for i, v in pairs(AllActivityInfo) do
        if v.isShow == 1 then
            local isOpen = false
            ---是否在开放时间内
            if v.timeType == 999    --永久开放
            then
                if Global.GetCreateRoleDays() <= v.dayTime or v.dayTime == -1 then
                    if v.activityType == ActivityControl.activityTypeEnum.FIRSTCHARGE then
                        ---首充判定状态
                        if FirstChargeState ~= 2 then
                            isOpen = true
                        end
                    elseif v.activityType == ActivityControl.activityTypeEnum.SIGNDAY then
                        ---如果创角时间超过七日签到的长度,则隐藏
                        local tIsSignFull = false
                        SignViewModel.WeekSignData,tIsSignFull = PlayerControl.GetWeekSignData()
                        if not tIsSignFull or SignViewModel.lastWeekSign then --如果未签满或最后一天签到
                            isOpen = true
                        end
                    elseif v.activityType == ActivityControl.activityTypeEnum.NOVICE_TRAIN then
                        if TaskControl.NoviceStage(v.activityId) <= #TaskControl.GetNoviceStageData(v.activityId) then
                            isOpen = true
                        end
                    elseif v.activityType == ActivityControl.activityTypeEnum.FUND then
                        --基金
                        if not FundControl.GetFundRecState() then
                            isOpen = true
                        end
                    elseif v.activityType == ActivityControl.activityTypeEnum.GUIDE then  --战术指导
                        if not TaskControl.AllGuideRewardReceived then
                            isOpen = true
                        end
                    elseif v.activityType == ActivityControl.activityTypeEnum.SIGNALL then
                        --百日签到
                        if not LimitSignControl.CheckComplete() then
                            isOpen = true
                        end
                    --elseif v.activityType == ActivityControl.activityTypeEnum.CHAPTER_TASK then
                    --    --章节任务
                    --    local tChapterData = ActivityControl.GetChapterTask(v.activityId)
                    --    local tStageNumber = ActivityControl.TaskStage(v.activityId)
                    --    if tStageNumber < #tChapterData then
                    --        isOpen = true
                    --    end
                    else
                        isOpen = true
                    end
                end
            elseif Global.isMiddleTime(v.beginTime,v.endTime) then
                if v.activityType == ActivityControl.activityTypeEnum.GIFT_BUY then
                    --礼包直购
                    if not ActivityControl.CheckBuyGiftState(v.activityId) then
                        isOpen = true
                    end
                else
                    isOpen = true
                end
            elseif v.beginTime == "0" and v.endTime == "0" then
                isOpen = true
            end
            if isOpen then
                table.insert(tAllData,v)
            end
        end
    end
    Global.Sort(tAllData, { "sort" },false)
    
    return tAllData
end

---根据type获取活动期间的数据
function ActivityControl.GetCurActivityByType(_type)
    local tData = {}
    local tActivity =  ActivityControl.GetAllActivityData()
    for i, v in pairs(tActivity) do
        if v.activityType == _type then
            table.insert(tData,v)
        end
    end
    
    return tData
end

---根据activityID获取活动期间的数据
function ActivityControl.GetCurActivityByID(activityID)
    local tActivity = ActivityControl.GetAllActivityData()
    for i, v in pairs(tActivity) do
        if v.activityId == activityID then
            return v
        end
    end
    return nil
end

---给所有活动推送充值金额
function ActivityControl.PushActivityRecharge(recharge)
    for k,v in pairs(AllActivityInfo) do
        v.recharge = v.recharge + recharge
    end
end

function ActivityControl.UpdateRecharge(info)
    for idx, goods in pairs(info) do
        if AllActivityInfo[goods.ID] == nil then
            AllActivityInfo[goods.ID] = {}
        end
        AllActivityInfo[goods.ID].recharge = goods.Recharge
    end
end

---初始化活动数据
function ActivityControl.InitActivityData()
    for k,v in pairs(ActivityLocalData.tab) do
        table.insert(CacheActivityData,ActivityData.New(k))
    end
    ActivityControl.PushData(function()
        --- 初始化只有登录初始化时需要的活动数据
        BingoViewModel.InitData()
    end)
end

---检查活动是否有满足前置条件
function ActivityControl.CheckActivity()
    for k,v in pairs(CacheActivityData) do
        if v.front ~= "0" and v.front ~= nil then
            if PlayerControl.GetPlayerData().level >= v.openLevel and StormControl.CheckPointPass(tonumber(v.front)) then
                return true
            end
        end
    end
    return false
end
---首充红点
function ActivityControl.CheckFirstCharge()
    local tData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.FIRSTCHARGE)
    if tData == nil then
        return
    end
    local tReward = tData.reward~="" and RapidJson.decode(tData.reward) or {}
    local tChargeData = FirstChargeCfg[tData.activityId]

    local length = Global.GetListLenght(tReward)
    if #tChargeData == length then
        FirstChargeState = 2
    end
    for i, v in ipairs(tChargeData) do
        if tData.recharge >= v.price and tReward[tostring(v.id)] == nil then
            ---首充红点
            RedDotControl.GetDotData("FirstCharge"):SetState(true)
            FirstChargeState = 1
            v.getState = 1
        elseif tData.recharge < v.price then
            IsReqData = true
            break
        elseif tData.recharge >= v.price then
            v.getState = 2
        end
    end
    if #CanGet == 0 and IsReqData then
        RedDotControl.GetDotData("FirstCharge"):SetState(ActivityControl.GetRedDotState())
    end
end
---首充领取状态(0.未满足充值限额 1.存在可领取 2.已全部领取)
function ActivityControl.GetFirstChargeState()
    return FirstChargeState
end
---检测切换状态
function ActivityControl.CheckFirstChargeState()
    local tData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.FIRSTCHARGE)
    if tData == nil then
        return
    end
    local tChargeData = FirstChargeCfg[tData.activityId]
    local AllGet = true
    for i, v in ipairs(tChargeData) do
        if v.getState ~= 2 then
            AllGet = false
            ---首充红点
            if tData.recharge >= v.price then
                RedDotControl.GetDotData("FirstCharge"):SetState(true)
            elseif tData.recharge < v.price then
                RedDotControl.GetDotData("FirstCharge"):SetState(false)
            end
            break
        end
    end
    if AllGet then
        ---首充红点
        RedDotControl.GetDotData("FirstCharge"):SetState(false)
        FirstChargeState = 2
    end
end
---红点一天显示一次
function ActivityControl.GetRedDotState()
    local CurTime = Global.GetCurTime()
    local tStr = PlayerControl.GetPlayerData().UID.."FirstChargeRedDot"
    local OldTime = UnityEngine.PlayerPrefs.GetInt(tStr)
    if OldTime == 0 or not Global.CheckIsSameDay(OldTime,CurTime) then
        return true
    end
    
    return false
end
function ActivityControl.HideFirstChargeDot()
    local CurTime = Global.GetCurTime()
    local tStr = PlayerControl.GetPlayerData().UID.."FirstChargeRedDot"
    
    UnityEngine.PlayerPrefs.SetInt(tStr, CurTime)
    RedDotControl.GetDotData("FirstCharge"):SetState(false)
end
---能够获得的奖励列表
function ActivityControl.CanGet()
    return CanGet
end

function ActivityControl.RewardSendReq(actId,awardId,type,func)
    local activityRewardReq = {
        activityId = actId,
        rewardId = awardId == nil and 0 or awardId,
        rewardType = type == nil and 2 or type,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientActivityGetRewardREQ',activityRewardReq))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_ACTIVITY_GET_REWARD_REQ,bytes,0,nil,ActivityControl.RewardACK,
            function (...)
                ActivityControl.RewardNTF(...)
                if func then
                    func()
                end
            end)
end
function ActivityControl.RewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientActivityGetRewardACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        ItemControl.AckError = true
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips2")..tab.errNo,2},true)
    end
end
function ActivityControl.RewardNTF(buffer,tag,parentUI)
    local tab = assert(pb.decode('PBClient.ClientActivityGetRewardNTF',buffer))
    if tab.goods then
        ---添加任务奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    end
    ActivityControl.PushActivityReward(tab.activityId,tab.reward)
    TaskControl.CheckGuide()
    Event.Go("ActivityDot")
end
function ActivityControl.InitFirstCharge()
    for i, v in ipairs(FirstchargeawardLocalData.tab) do
        local tData = {
            id = v[1],
            actId = v[2],
            backImg = v[3],
            price = v[5],
            rewards = v[6],
            --0.不能领取 1.可领取 2.已领取
            getState = 0
        }
        if FirstChargeCfg[v[2]] == nil then
            FirstChargeCfg[v[2]] = {}
        end
        table.insert(FirstChargeCfg[v[2]], tData)
    end
end
---获取首充配置信息
function ActivityControl.GetFirstChargeCfg()
    return FirstChargeCfg
end

---推送活动奖励状态
function ActivityControl.PushActivityReward(id,reward)
    if AllActivityInfo[id] == nil then
        return
    end
    AllActivityInfo[id]:PushRewardData(reward)
end
---@type activityTypeEnum
---打开活动界面 
function ActivityControl.OpenHuoDong(_type)
    local activityData = ActivityControl.GetAllActivityData()
    local isOpen = false
    
    ---是否已经解锁
    for i, v in pairs(activityData) do
        if v.activityType == _type then
            if v.systemopen == 0 or SysLockControl.CheckSysLock(v.systemopen) then
                isOpen = true
            else
                MgrUI.Pop(UID.PopTip_UI,{ SysLockControl.GetSystemLockTips(v.systemopen),2 },true)
            end
            break
        end
    end
    if isOpen or _type == nil then
        ActivityControl.PageType = _type
        if MgrUI.GetCurUI() and MgrUI.GetCurUI().Uid ~= UID.HuoDongPop_UI then
            MgrUI.GoHide(UID.HuoDongPop_UI)
        else
            Event.Go("ChangePage")
        end
    end
end

---@type activityTypeEnum
---根据类型查询该活动是否开启
function ActivityControl.CheckActiveOpen(_type)
    local tActiveData = ActivityControl.GetCurActivityByType(_type)
    if #tActiveData == 0 or (tActiveData[1].systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData[1].systemopen)) or not StormControl.CheckPointPass(tonumber(tActiveData[1].front)) then
        local str = MgrLanguageData.GetLanguageByKey("activityCcontrol_tips1")
        if #tActiveData ~= 0 and tActiveData[1].systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData[1].systemopen) then
            str = SysLockControl.GetSystemLockTips(tActiveData[1].systemopen)
        end
        return false,str
    end
    
    return true
end
---根据类型查询该活动是否开启
function ActivityControl.CheckActiveOpenById(_actId)
    local tActiveData = ActivityControl.GetCurActivityByID(_actId)
    if tActiveData == nil or (tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen)) or not StormControl.CheckPointPass(tonumber(tActiveData.front)) then
        local str = MgrLanguageData.GetLanguageByKey("activityCcontrol_tips1")
        if tActiveData ~= nil and tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen) then
            str = SysLockControl.GetSystemLockTips(tActiveData.systemopen)
        end
        return false,str
    end
    
    return true
end
---根据类型查询该活动是否开启(不受配置不中显隐字段的限制)
function ActivityControl.CheckActiveOpen_Hide(_type)
    local tActiveData = ActivityControl.GetActivityInfo(_type)
    if tActiveData == nil or (tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen)) or not StormControl.CheckPointPass(tonumber(tActiveData.front)) then
        local str = MgrLanguageData.GetLanguageByKey("activityCcontrol_tips1")
        if tActiveData ~= nil and tActiveData.systemopen ~= 0 and not SysLockControl.CheckSysLock(tActiveData.systemopen) then
            str = SysLockControl.GetSystemLockTips(tActiveData.systemopen)
        end
        return false,str
    end

    if not Global.isMiddleTime(tActiveData.beginTime,tActiveData.endTime) then
        return false
    end
    
    return true
end
---初始化活动对话数据
function ActivityControl.InitDialogData()
    for i, v in pairs(SummerlogdialogueLocalData.tab) do
        DialogData[i] = DialogueData.New(v)
    end
end
---获取活动对话数据
function ActivityControl.GetDialogData()
    return DialogData
end

------------------------------活动章节任务----------------------------------
---初始化活动章节任务数据
function ActivityControl.InitChapterTaskData()
    for i, v in pairs(ChaptertaskLocalData.tab) do
        if ChapterTask[v.activityid] == nil then
            ChapterTask[v.activityid] = {}
        end
        table.insert(ChapterTask[v.activityid], ChapterTaskData.New())
        ChapterTask[v.activityid][#ChapterTask[v.activityid]]:PushData(v)
    end
    for i, v in pairs(ChapterTask) do
        Global.Sort(v, {"id"})
    end
    ChapterTaskInfo = ActivityControl.GetActivityList(ActivityControl.activityTypeEnum.CHAPTER_TASK)
end
function ActivityControl.GetChapterTask(_activityID)
    return ChapterTask[_activityID]
end
---获得活动已领取奖励
function ActivityControl.GetReceivedReward(_activityID)
    local tab = {}
    local taskInfo = ChapterTaskInfo[_activityID]
    if taskInfo ~= nil and taskInfo.reward then
        tab = RapidJson.decode(taskInfo.reward)
    end
    return tab
end
---更新已领取的奖励
function ActivityControl.RefreshReceivedReward(reward,_activityID)
    if ChapterTaskInfo[_activityID] == nil then
        return
    end
    ChapterTaskInfo[_activityID].reward = reward
end
---检查任务完成到第几阶段
function ActivityControl.TaskStage(_activityID)
    --判断奖励领了多少个
    local receivedReward = ActivityControl.GetReceivedReward(_activityID)
    if receivedReward then
        local length = 1
        for i,v in pairs(receivedReward) do
            if v == 0 then
                length = length + 1
            end
        end
        return length
    else
        return 1
    end
end
---获得任务阶段
function ActivityControl.GetTaskStageInfo(stageNum,_activityID)
    for i,v in pairs(ChapterTask[_activityID]) do
        if i == stageNum then
            return v
        end
    end
    return nil
end
---根据活动ID获取章节任务数据
function ActivityControl.GetTaskStageData(_activityID)
    return ChapterTask[_activityID]
end

function ActivityControl.CheckChapterTaskDot()
    for i, v in pairs(ChapterTask) do
        ActivityControl.CheckChapterTaskSign(i)
    end
end
---检查章节任务红点
function ActivityControl.CheckChapterTaskSign(_activityID)
    ---新手任务第几阶段
    local stageNumber = ActivityControl.TaskStage(_activityID)
    if stageNumber > #ActivityControl.GetTaskStageData(_activityID) or not SysLockControl.CheckSysLock(1802) then
        RedDotControl.GetDotData("ChapterTask"):SetState(false)
        return
    end
    local taskGroupID = ActivityControl.GetTaskStageInfo(stageNumber,_activityID).achievementId
    --现阶段9个任务
    ---@type AchievementTaskData[]  本阶段所有新手任务
    local isReward = true
    for i, v in pairs(TaskControl.NoviceDataList) do
        if taskGroupID == v.taskGroupID and TaskControl.CheckTaskLock(v) then
            if not TaskControl.CheckComplete(v.id) then
                isReward = false
                break
            end
        end
    end

    for i, v in pairs(TaskControl.NoviceDataList) do
        if taskGroupID == v.taskGroupID and TaskControl.CheckTaskLock(v) then
            if not TaskControl.CheckComplete(v.id) then
                if TaskControl.CheckTaskReceived(v) then
                    if not isReward then
                        isReward = true
                    end
                    break
                end
            end
        end
    end

    RedDotControl.GetDotData("ChapterTask"):SetState(isReward)
    
    --Event.Go("ActivityDot")
end

---成就任务数据
---_achievementTaskType 成就类型 _taskId 成就任务组
function ActivityControl.GetTaskData(_achievementTaskType, _taskId)
    local tAchieviment = AchievementViewModel.GetTask(_achievementTaskType,false,_taskId)

    return tAchieviment
end

---是否包含指定元素
function ActivityControl.Contains(target,table)
    if table == nil then
        return false
    end
    for k,v in pairs(table) do
        if target == tonumber(k) then
            return true
        end
    end
    return false
end

---检查累计充值红点
function ActivityControl.CheckRechargeRedDot()
    RedDotControl.GetDotData("TotalRecharge"):SetState(false)
    if AllActivityInfo[99992] == nil then
        RedDotControl.GetDotData("TotalRecharge"):SetState(false)
        return
    end
    local str = {}
    if AllActivityInfo[99992].reward and #AllActivityInfo[99992].reward ~= 0 then
        str = RapidJson.decode(AllActivityInfo[99992].reward)
    end
    local totalMoney = (AllActivityInfo[99992].recharge + 100) / 10000
    for k,v in pairs(RechargeLocalData.tab) do
        if ActivityControl.Contains(k,str) == false and totalMoney >= (v[3] / 10000) then
            RedDotControl.GetDotData("TotalRecharge"):SetState(true)
            break
        end
    end
end

--检查回归签到红点
function ActivityControl.CheckSignBackRedDot()
    local value = PlayerControl.GetPlayerData().regression
    ---检测活动是否开启
    if value == nil or not Global.isMiddleTime(value.CreateAt, value.CloseDAt) then
        RedDotControl.GetDotData("SignBack"):SetState(false)
        return
    end
    local info = RapidJson.decode(value.RewardIDS)
    local awardDays = {}
    for i, v in pairs(info) do
        table.insert(awardDays,i)
    end

    if #awardDays < #ReturnsigninLocalData.tab and (not PlayerControl.GetPlayerData().regression.OnceStatus or #awardDays < PlayerControl.GetPlayerData().regression.RewardCount) then
        RedDotControl.GetDotData("SignBack"):SetState(true)
    else
        RedDotControl.GetDotData("SignBack"):SetState(false)
    end
end

---检查限时充值红点
function ActivityControl.CheckMonthlyRechargeRedDot()
    RedDotControl.GetDotData("MonthlyRecharge"):SetState(false)
    if AllActivityInfo[99991] == nil then
        RedDotControl.GetDotData("MonthlyRecharge"):SetState(false)
        return
    end

    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.MonthlyRecharge) then
        RedDotControl.GetDotData("MonthlyRecharge"):SetState(false)
        return
    end
    local str = {}
    if AllActivityInfo[99991].reward and #AllActivityInfo[99991].reward ~= 0 then
        str = RapidJson.decode(AllActivityInfo[99991].reward)
    end
    local totalMoney = (AllActivityInfo[99991].recharge) / 10000
    for k,v in pairs(MonthlyrechargeLocalData.tab) do
        if AllActivityInfo[99991].version == v[5] and ActivityControl.Contains(k,str) == false and totalMoney >= (v[3] / 10000) then
            RedDotControl.GetDotData("MonthlyRecharge"):SetState(true)
            break
        end
    end
end
-----------------------------记血量的BOSS关卡数据-----------------------------
---设置当前BOSS关ID
function ActivityControl.SetBossLevel(_level)
    CurBossLevel = _level
end
function ActivityControl.GetBossLevel()
    return CurBossLevel
end
---下次需要获取BOSS数据
function ActivityControl.ChangeBossData()
    IsGetBossData = true
end
function ActivityControl.InitBossAttri(_levelData)
    for i, level in pairs(_levelData) do
        if BossLevelList[level] == nil then
            BossLevelList[level] = {
                levelId = level,
                nowHp = 0,
                totalHp= 0,
                levelStar = 0,
                levelCount = 0,
                levelPerfectCount = 0
            }
        end
    end
end
---请求BOSS数据
function ActivityControl.GetBossData(callBack)
    if BossLevelList[CurBossLevel] and BossLevelList[CurBossLevel].totalHp ~= 0 and not IsGetBossData then
        BattleManager.CurActivityBossHp = BossLevelList[CurBossLevel].nowHp==0 or BossLevelList[CurBossLevel].totalHp and BossLevelList[CurBossLevel].nowHp
        BattleManager.CurActivityBossPointInfo = BossLevelList[CurBossLevel]
        if callBack then
            callBack(BossLevelList[CurBossLevel])
        end
        return
    end
    IsGetBossData = false

    local req = {
        type = -1
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLevelInfoREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LEVEL_INFO_REQ,bytes,1,nil,ActivityControl.GetBossDataACK,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientLevelInfoNTF', buffer))
        local info = ActivityControl.GetBossDataNTF(tab)[CurBossLevel]

        BattleManager.CurActivityBossHp = info.nowHp
        BattleManager.CurActivityBossPointInfo = info

        if callBack then
            callBack(info)
        end
    end)
end
function ActivityControl.GetBossDataACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientLevelInfoACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraidviewmodel_tips1"),2},true)
    end
end
function ActivityControl.GetBossDataNTF(tab)
    if tab.hp then
        for i, v in pairs(tab.hp) do
            if BossLevelList[v.levelId] then
                BossLevelList[v.levelId].nowHp = v.nowHp==0 and v.totalHp or v.nowHp
                BossLevelList[v.levelId].totalHp = v.totalHp
            end
        end
        for i, v in pairs(tab.activity) do
            if BossLevelList[v.levelID] then
                BossLevelList[v.levelID].levelStar = v.levelStar
                BossLevelList[v.levelID].levelCount = v.levelCount
                BossLevelList[v.levelID].levelPerfectCount = v.levelPerfectCount
            end
        end
    end
    return BossLevelList
end
---限时签到数据
function ActivityControl.SetLimitSignData(info)
    if info == nil or #info == 0 then
        return
    end
    for i, v in ipairs(info) do
        if LimitSignData[v.activityId] then
            LimitSignData[v.activityId].day = v.day
            LimitSignData[v.activityId].time = v.time
            LimitSignData[v.activityId].ableDay = v.ableDay
        else
            LimitSignData[v.activityId] = {
                time = v.time,
                day = v.day,
                ableDay = v.ableDay
            }
        end
    end
    ---生日签到红点
    CakeControl.CheckDot()
end

function ActivityControl.GetLimitSignData(_actvityId)
    return LimitSignData[_actvityId]
end

function ActivityControl.LimitSignReq(_actvityId, callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLimitSign2Req',{activityID = _actvityId}))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LIMIT_SIGN2_REQ,bytes,0,nil,
            function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientLimitSign2Ack',buffer))
                if tab.errNo~=0 then
                    if tab.errNo == 4000 then
                        print("重复签到")
                    end
                end
            end,
            function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientLimitSign2Ntf',buffer))
                local goodsList = {}
                for i, v in pairs(tab.goods) do
                    for _, v1 in pairs(v.goods) do
                        goodsList[#goodsList + 1] = v1
                    end
                end
                ---更新物品奖励
                ItemControl.PushGroupItemData(goodsList,ItemControl.PushEnum.add)
                ---弹出奖励窗口
                if #goodsList > 0 then
                    MgrUI.Pop(UID.ItemAchievePop_UI,{goodsList},true)
                end
                ActivityControl.SetLimitSignData({tab.info})
                if callBack then
                    callBack()
                end
            end)
end
-------------------------------------- 礼包直购 --------------------------------------
---初始化礼包直购
function ActivityControl.InitBuyGift()
    for i, v in ipairs(DirectlylibaoLocalData.tab) do
        local tData = {
            id = v[1],
            actId = v[2],
            shopId = v[3],
            reward = string.split(v[4],","),
            backImg = v[5],
            isShowBtn = v[6]==1
        }
        GiftCfg[v[2]] = tData
        if tData.isShowBtn then
            ActivityControl.GetDetail(tData.shopId)
        end
    end
end
---获取礼包直购配置
function ActivityControl.GetBuyGiftCfg()
    return GiftCfg
end
---检测礼包直购状态(true:已购买所有)
function ActivityControl.CheckBuyGiftState(_actId)
    if GiftCfg[_actId] == nil then
        return true
    end
    --每次首次登录
    if Gift_BuyTimes[_actId] == nil or Gift_BuyTimes[_actId] == 0 then
        return false
    end
    local tBuyShopID = GiftCfg[_actId].shopId
    if GiftCfg[_actId].isShowBtn then
        return Gift_BuyTimes[_actId] >= Gift_TotalTimes[_actId]
    else
        local tBuyGiftData = nil
        local tShopData = ShopViewModel.GetOutShopList()
        for i, v in ipairs(tShopData) do
            if v.id == 4 then
                tBuyGiftData = v.shopItems
                break
            end
        end
        if tBuyGiftData[tBuyShopID] and tBuyGiftData[tBuyShopID].buyCount >= tBuyGiftData[tBuyShopID].buyMaxCount then
            return true
        else
            return false
        end
    end
end

function ActivityControl.AddGiftBuyTimes(_actId)
    if _actId == 0 then
        return
    end
    Gift_BuyTimes[_actId] = Gift_BuyTimes[_actId] + 1
end

function ActivityControl.GetDetail(_shopId, callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSkinRandomReq',{goodsID = _shopId}))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SKIN_RANDOM_REQ,bytes,0,nil,
            function(buffer,tag) end,
            function(buffer,tag)
                local tCurActId = 0
                local tab = assert(pb.decode('PBClient.ClientSkinRandomNtf',buffer))
                for i, v in pairs(GiftCfg) do
                    if v.shopId == tab.goodsID then
                        tCurActId = v.actId
                        break
                    end
                end
                Gift_BuyTimes[tCurActId] = 0
                for i, v in ipairs(tab.skinRandomInfo) do
                    if v.isGot then
                        Gift_BuyTimes[tCurActId] = Gift_BuyTimes[tCurActId]+1
                    end
                end
                Gift_TotalTimes[tCurActId] = #tab.skinRandomInfo
                if callBack then
                    callBack(tab.skinRandomInfo)
                end
    end)
end
---体力活动检测红点
function ActivityControl.CheckPowerRedDot()
    RedDotControl.GetDotData("PowerCost"):SetState(false)
    local isOpen = ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.ACTIVE_TILI)
    if not isOpen then
        return
    end
    local tActData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.ACTIVE_TILI)
    --遍历成就任务
    local tData = TaskControl.GetAchievementDataByID(tActData.TaskList)
    if tData then
        for k,v in pairs(tData) do
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                RedDotControl.GetDotData("PowerCost"):SetState(true)
                break
            end
        end
    end
end
---刷新时间
function ActivityControl.RefreshTime()
    for i, v in pairs(AllActivityInfo) do
        if v.unlockTime ~= 0 and v.beginTime_Stamp == 0 then
            v:RefreshTime()
        end
    end
end

function ActivityControl.Clear()
    CacheActivityData = {}
    AllActivityInfo = {}
    FirstChargeCfg = {}
    CanGet = {}
    DialogData = {}
    IsReqData = false
    FirstChargeState = 0
    ActivityControl.AllActivityInfoGet = false
    ActivityControl.PageType = nil
    BossLevelList = {}
    CurBossLevel = nil
    IsGetBossData = true
    LimitSignData = {}
    ChapterTask = {}
    ChapterTaskInfo = {}
    GiftCfg = {}
    Gift_BuyTimes = {}
    Gift_TotalTimes = {}
end

return ActivityControl