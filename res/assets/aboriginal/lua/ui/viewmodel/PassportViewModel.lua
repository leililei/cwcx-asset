require("LocalData/SteamLocalData")
require("LocalData/MonthpassbuyLocalData")
PassportViewModel = {}

PassportViewModel.InitPassport = nil

---高级通行证是否开通
local SeniorPassportLocked = false
---购买通行证的消耗
local consume = string.split(SteamLocalData.tab[111005][2],"_")
local passLevelUpCost = {
    consumeType = tonumber(consume[1]),   --消耗品的类型
    consumeId = tonumber(consume[2]),     --消耗品的ID
    consumeNum = tonumber(consume[3]),    --消耗品的数量
}

--通行证界面上显示的物品
---@type ItemData[] 普通奖励
local normalReward = {}
---@type ItemData[] 高级奖励
local seniorReward = {}
---@type ItemData[] 高级奖励
local seniorReward2 = {}
---@type ItemData[] 所有奖励
local allReward = {}

---提交活动任务数据  //taskType 任务类型 4 活动日常 5 活动周常   //taskID 完成任务id 如果填 非负数 则为完成一条 负数为一键领取   //subType 任务组
function PassportViewModel.TaskPerform(taskType,taskID,subType)
    local BaseREQ  =
    {
        taskType = taskType,
        taskID = taskID,
        subType = subType
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTaskPerformREQ',BaseREQ))
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_TASK_PERFORM_REQ,bytes,0,nil, PassportViewModel.TaskPerformACK,PassportViewModel.TaskPerformNTF)
end
function PassportViewModel.TaskPerformACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformACK',buffer))
    if tag~=0 then
        return
    end
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo == ServerErrorCode.TaskPerform_560 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activationtaskviewmodel_tips1"),2},true)
            TaskControl.GetTaskData()
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("activationtaskviewmodel_tips2"),2},true)
        end
    end
end
function PassportViewModel.TaskPerformNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTaskPerformNTF',buffer))
    if tag~=0 then
        return
    end
    if tab.reward then
        ---添加任务奖励
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
    end
    ---任务完成数量统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---并在通行证总积分上加上本次任务积分
    PassportControl.RefreshPassportScore(tab.events)
    ---刷新以获取的奖励
    if tab.medal then
        ItemControl.PushGroupItemData(tab.medal,ItemControl.PushEnum.add)
    end
    for i, v in pairs(tab.taskID) do        ---记录完成的任务数据
        TaskControl.CompleteTaskData[v] = v
    end
    ---刷新通行证界面
    if PassportViewModel.ReceivedCallBack then
        PassportViewModel.ReceivedCallBack()
    end
    ---加载图片重新初始化
    SettingViewModel.LoadingImageInit()
end

function PassportViewModel.TaskPerform_New(taskID)
    local BaseREQ  =
    {
        subType = taskID,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTaskRewardOneKeyReq',BaseREQ))
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_TASK_REWARD_ONE_KEY_REQ,bytes,0,nil, PassportViewModel.TaskPerformACK_New,nil)
end
function PassportViewModel.TaskPerformACK_New(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientTaskRewardOneKeyAck',buffer))
    print(tab.errNo)
    if tab.errNo == 0 then
        if tab.tasks then
            for i, v in pairs(tab.tasks) do        ---记录完成的任务数据
                for key,value in pairs(v.taskID)do
                    TaskControl.CompleteTaskData[value] = value
                end
            end
        end
        if tab.reward then
            ---添加任务奖励
            ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
            ---弹出奖励窗口
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
        end
        if tab.medal then
            ItemControl.PushGroupItemData(tab.medal,ItemControl.PushEnum.add)
        end
        if tab.dayScore then
            TaskControl.dayScore = tab.dayScore
        end
        if tab.weekScore then
            TaskControl.weekScore = tab.weekScore
        end
        if tab.monthScore then
            TaskControl.monthScore = tab.monthScore
        end
        --TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        if tab.events then
            ActivityControl.SetActivityInfo(tab.events[1].id,tab.events[1])
        end
        ---刷新通行证界面
        if PassportViewModel.ReceivedCallBack then
            PassportViewModel.ReceivedCallBack()
        end
    else
        ---失败
    end
end

---获取所有高级或者低级的奖励
function PassportViewModel.GetAllReward()
    if allReward ~= nil and #allReward ~= 0 then
        return allReward
    end
    local allPassportReward = PassportControl.GetAllPassportReward(PassportControl.GetPassportData().activityId)
    if allPassportReward == nil then
        UnityEngine.Debug.LogError("无通行证数据")
        return
    end
    for i,v in ipairs(allPassportReward) do
        local normalGoods = {
            goodsType = v.award_0[1],
            goodsID = v.award_0[2],
            goodsNum = v.award_0[3]
        }
        normalReward[i] = ItemData.New()
        normalReward[i]:PushData(normalGoods,ItemControl.PushEnum.none)
        local seniorGoods = {
            goodsType = v.award_1[1],
            goodsID = v.award_1[2],
            goodsNum = v.award_1[3]
        }
        seniorReward[i] = ItemData.New()
        seniorReward[i]:PushData(seniorGoods,ItemControl.PushEnum.none)
        if #v.award_2 ~= 0 then
            local seniorGoods2 = {
                goodsType = v.award_2[1],
                goodsID = v.award_2[2],
                goodsNum = v.award_2[3]
            }
            seniorReward2[i] = ItemData.New()
            seniorReward2[i]:PushData(seniorGoods2,ItemControl.PushEnum.none)
        end
    end
    for i = 1, #normalReward do
        table.insert(allReward,{normalReward[i],seniorReward[i],seniorReward2[i]})
    end
    return allReward

end
---获取活动版本
function PassportViewModel.GetActivityVersion()
    if PassportControl.GetPassportData() == nil then
        UnityEngine.Debug.LogError("无通行证数据")
        return
    end
    return PassportControl.GetPassportData().version
end
function PassportViewModel.SetPassesSeniorLock(tOrf)
    SeniorPassportLocked = tOrf

end
---检查玩家是否已解锁高级通行证
function PassportViewModel.CheckSeniorLock()
    if SeniorPassportLocked then
        return SeniorPassportLocked
    end
    local playerData = PlayerControl.GetPlayerData()
    if playerData.bigMonthCardBuyTime == nil or playerData.bigMonthCardBuyTime == 0 then
        --if playerData.bigMonthCardVersion == nil or playerData.bigMonthCardVersion == 0 --[[or playerData.bigMonthCardVersion ~= 当期大月卡版本]] then
            SeniorPassportLocked = false
            return SeniorPassportLocked
        --end
    end
    if playerData.bigMonthCardVersion == nil or playerData.bigMonthCardVersion == 0 or playerData.bigMonthCardVersion ~= ActivityLocalData.tab[20000][6] then
        SeniorPassportLocked = false
        return SeniorPassportLocked
    end
    SeniorPassportLocked = true
    return SeniorPassportLocked
end
---读表显示通行证任务
function PassportViewModel.GetPassportMission(type)
    local missionList
    missionList = ActivationTaskViewModel.GetDayTask(type)
    return missionList
end
---读表显示通行证当期任务
function PassportViewModel.GetPassportAchievementMission(type)
    local missionList
    missionList = ActivationTaskViewModel.GetDayTask(type)
    return missionList
end

---一键领取所有
function PassportViewModel.AcceptAll(selfUI)
    PassportControl.AcceptAll(selfUI)
end
---解锁高级通行证
function PassportViewModel.UnlockSeniorPassport()
    local arr = {}
    for k,v in pairs(ShopViewModel.SortChildData(114001)) do
        if v.id == 0 then
            arr = ShopViewModel.SortItemData(v)
            break
        end
    end
    if next(arr) == nil then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("artgallery_ui_lock"), 1 }, true)
        return
    end
    MgrUI.GoHide(UID.PassesBuyPop_UI)
    --PassportControl.UnlockSeniorPassport()
end
---购买等级
function PassportViewModel.BuyPassportLevel(parentUI,count)
    ---弹出问询框
    MgrUI.Pop(UID.ConfirmPop_UI,
            {ItemControl.GetItemByID(passLevelUpCost.consumeId).name .. string.format(MgrLanguageData.GetLanguageByKey("passportviewmodel_tips2"),passLevelUpCost.consumeNum * count ) .. string.format(MgrLanguageData.GetLanguageByKey("passportviewmodel_tips3"),tostring(count)),
            function() PassportControl.BuyPassportLevel(parentUI,count) end,nil,2},true)
end
---购买等级耗费
function PassportViewModel.GetConsume()
    return tonumber(consume[3])
end

function PassportViewModel.Clear()
    SeniorPassportLocked = false
    normalReward = {}
    seniorReward = {}
    allReward = {}
end

return PassportViewModel