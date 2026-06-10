require("LocalData/SignineventLocalData")
require("LocalData/BirthdaysignLocalData")
require("LocalData/BirthdaygiftLocalData")

CakeControl = {}
---生日活动数据
local ActivityCakeData = nil
---生日签到数据
local SignItemData = {}
---烘焙数据
local BakeryData = {}
---回礼数据
local GiftDataByID = {}
local GiftDataByOrder = {}
---当前赠礼数据
local CurGiftData = nil
---赠礼类型
CakeControl.SendGiftType = {
    ReturnGift = 0,
    Plot = 1
}
---@field ActivityCakeData ActivityData
function CakeControl.Init()
    ActivityCakeData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.CAKESIGN)
    ---初始化签到数据
    CakeControl.InitSignData()
    ---初始化烘焙数据
    CakeControl.InitBakeryData()
    ---初始化回礼数据
    CakeControl.InitGiftData()
end
---生日签到界面
function CakeControl.OpenSign()
    MgrUI.GoHide(UID.CakeSign_UI)
end
---生日任务界面
function CakeControl.OpenTask()
    MgrUI.GoHide(UID.CakeTask_UI)
end
---生日烘焙界面
function CakeControl.OpenBakery()
    if ActivityCakeData.activityId == 46000 then
        MgrUI.GoHide(UID.CakeBakery_UI)
    elseif ActivityCakeData.activityId == 46002 then
        MgrUI.GoHide(UID.CakeGiftBox_UI)
    else
        MgrUI.GoHide(UID.Pubs_UI)
    end
end
---生日赠礼界面
function CakeControl.OpenGift()
    MgrUI.GoHide(UID.CakeGiftGiving_UI)
end
---初始化签到数据
function CakeControl.InitSignData()
    if ActivityCakeData == nil then
        return
    end
    for i, v in ipairs(SignineventLocalData.tab) do
        if ActivityCakeData.activityId == v.activityid and ActivityCakeData.version == v.group then
            table.insert(SignItemData, v)
        end
    end
    Global.Sort(SignItemData, { "day" })
end
---初始化烘焙数据
function CakeControl.InitBakeryData()
    if ActivityCakeData == nil then
        return
    end
    for i, v in ipairs(BirthdaysignLocalData.tab) do
        if ActivityCakeData.activityId == v.activityid then
            local tList = {
                id = v.id,
                activityid = v.activityid,
                use = string.split(v.use, ','),
                daytask = v.daytask,
                taskrole = v.taskrole,
                -- 部分情况才可能有的扭蛋池id
                gashaponId = nil,
            }
            BakeryData = tList
        end
    end
end
---初始化回礼数据
function CakeControl.InitGiftData()
    if ActivityCakeData == nil then
        return
    end
    for i, v in ipairs(BirthdaygiftLocalData.tab) do
        if ActivityCakeData.activityId == v.activityid and ActivityCakeData.version == v.version then
            local tList = {
                id = v.id,
                activityid = v.activityid,
                version = v.version,
                role = v.role,
                gift = string.split(v.gift,';'),
                type = v.type,
                award = string.split(v.award,','),
                plot = v.plot,
                text = v.text~="0" and v.text or "",
                isGive = false,
                isReturn = false
            }
            
            table.insert(GiftDataByOrder, tList)
            GiftDataByID[v.id] = tList
        end
    end
end

---活动数据
function CakeControl.GetActivityInfo()
    return ActivityCakeData
end
---获取签到界面数据
function CakeControl.GetSignItemData()
    return SignItemData
end
---获取烘焙界面数据
function CakeControl.GetBakeryData()
    return BakeryData
end
---获取回礼界面数据
function CakeControl.GetGiftData()
    return GiftDataByID,GiftDataByOrder
end
---已签到天数
function CakeControl.GetSeverSignDay()
    if ActivityCakeData == nil then
        return 0
    end
    local tSignData = ActivityControl.GetLimitSignData(ActivityCakeData.activityId)

    return tSignData and tSignData.day or 0
end
---可签到第几天
function CakeControl.GetSeverSignTimes()
    if ActivityCakeData == nil then
        return 0
    end
    local tSignData = ActivityControl.GetLimitSignData(ActivityCakeData.activityId)

    return tSignData and tSignData.ableDay or 0
end

---每日任务数据
function CakeControl.GetDailyTaskData()
    local array = TaskControl.GetEventRaidTaskData(BakeryData.daytask)    --附带判断任务是否解锁
    table.sort(array, function(a, b)
        --按照是否已完成和已领取排序
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
---当前赠礼数据
function CakeControl.SetCurGiftData(_data)
    CurGiftData = _data
end
function CakeControl.GetCurGiftData()
    return CurGiftData
end

---烘焙蛋糕
function CakeControl.CakeBuild(_cakeID, callBack)
    local req = {
        cakeID = _cakeID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientCakeBuildReq', req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CAKE_BUILD_REQ, bytes, 1, nil, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientCakeBuildAck', buffer))
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientCakeBuildNtf', buffer))
        if tab then
            ---更新消耗
            ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
            ---更新物品奖励
            ItemControl.PushGroupItemData(tab.reward, ItemControl.PushEnum.add)
            if callBack then
                callBack(tab.reward)
            end
        end
    end)
end
---获取送礼和回礼数据
function CakeControl.GetGiftInfo()
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.CAKESIGN) then
        return
    end
    local req = {
        activityID = ActivityCakeData.activityId
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetGiftInfoReq', req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_GIFT_INFO_REQ, bytes, 1, nil, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGetGiftInfoAck', buffer))
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGetGiftInfoNtf', buffer))
        if tab then
            if tab.gift == nil or #tab.gift == 0 then
                return
            end
            ---更新赠礼状态
            for i, v in ipairs(tab.gift) do
                if GiftDataByID[v.id] then
                    GiftDataByID[v.id].isGive = true
                    GiftDataByID[v.id].isReturn = v.claimed
                end
            end
        end
    end)
end
---送礼
function CakeControl.GiveGift(_id,_giftID,callBack)
    local req = {
        cfgID = _id,
        giftID = _giftID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSendGiftReq', req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SEND_GIFT_REQ, bytes, 1, nil, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSendGiftAck', buffer))
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientSendGiftNtf', buffer))
        if tab then
            ---更新消耗
            ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
            ---更新物品奖励
            ItemControl.PushGroupItemData(tab.reward, ItemControl.PushEnum.add)
            ---更新赠礼状态
            if GiftDataByID[tab.gift.id] then
                GiftDataByID[tab.gift.id].isGive = true
                GiftDataByID[tab.gift.id].isReturn = tab.gift.claimed
            end

            if callBack then
                callBack(tab)
            end
        end
    end)
end
---回礼
function CakeControl.ReturnGift(_id,callBack)
    local req = {
        cfgID = _id
    }
    local ReturnId = _id
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientReturnGiftReq', req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_RETURN_GIFT_REQ, bytes, 1, nil, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientReturnGiftAck', buffer))
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientReturnGiftNtf', buffer))
        if tab then
            ---更新物品奖励
            ItemControl.PushGroupItemData(tab.reward, ItemControl.PushEnum.add)
            ---弹出奖励窗口
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)

            GiftDataByID[ReturnId].isReturn = true
            if callBack then
                callBack()
            end
        end
    end)
end

---红点检测
function CakeControl.CheckDot()
    RedDotControl.GetDotData("CakeSign"):SetState(false)
    RedDotControl.GetDotData("CakeTask"):SetState(false)
    RedDotControl.GetDotData("Cake"):SetState(false)

    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.CAKESIGN) then
        return
    end
    ---生日签到
    local tCanSignDay = CakeControl.GetSeverSignTimes()
    local tSignDay = CakeControl.GetSeverSignDay()
    if tCanSignDay > 0 then
        RedDotControl.GetDotData("CakeSign"):SetState(tCanSignDay > tSignDay)
    end

    ---遍历任务
    for k, v in pairs(CakeControl.GetDailyTaskData()) do
        local progressStr = JNStrTool.strSplit("_", v.complete)
        local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
        if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
            RedDotControl.GetDotData("CakeTask"):SetState(true)
            break
        end
    end

    if RedDotControl.GetDotData("CakeSign").State or 
       RedDotControl.GetDotData("CakeTask").State
    then
        RedDotControl.GetDotData("Cake"):SetState(true)
    else
        RedDotControl.GetDotData("Cake"):SetState(false)
    end
end

--region 扭蛋池
--- 紧急的打补丁形式增加的功能支持

-- TODO(Arno) 考虑优化，限制外部修改 dropGoodsList
---@class CakeGashaData
---@field activityId int
---@field poolId int
---@field dropGoodsList DropGoods[] @ 池子内剩余物品，无法确保顺序。不得随意修改该列表

--- 仅允许以下几个 _方法 修改，不允许其它位置(除Clear)访问
---@type CakeGashaData[] @ activityId 为键
local _CakeGashaMap = {}

---@param actId int
---@param data CakeGashaData
local _SetCakeGashaData = function(actId, data)
    _CakeGashaMap[actId] = data
end

---@param actId int
---@return CakeGashaData
local _GetCakeGashaData = function(actId) 
    return _CakeGashaMap[actId]
end

---@private
---@param poolId int
---@param poolStr string
function CakeControl.PushPoolData(actId, poolId, poolStr)
    ---@type CakeGashaData
    local newData = {
        activityId = actId,
        poolId = poolId,
    }

    ---@type DropGoods[]
    local dropGoodsList = {}
    local tempMap = RapidJson.decode(poolStr)
    for dropStr, dropCount in pairs(tempMap) do
        local dropSp1 = string.split(dropStr, "_")
        ---@type DropGoods
        local newGoods = {
            goodsType = CheckNumber(dropSp1[1]),
            goodsID = CheckNumber(dropSp1[2]),
            goodsNum = CheckNumber(dropSp1[3]),
            dropCount = CheckNumber(dropCount),
        }
        table.insert(dropGoodsList, newGoods)
    end

    newData.dropGoodsList = dropGoodsList
    _SetCakeGashaData(actId, newData)
end

---@return int | nil @ 见 GashaponLocalData
function CakeControl.GetGashaId()
    local data = CakeControl.GetBakeryData()
    if data.gashaponId then
        return data.gashaponId
    end

    for id, config in pairs(GashaponLocalData.tab) do
        if config[2] == data.activityid then
            data.gashaponId = id
            return id
        end
    end
    
    return 0
end

---@return goods
function CakeControl.GetGashaCost()
    local gashaId = CakeControl.GetGashaId()
    local gashaConfig = GashaponLocalData.tab[gashaId]
    if not gashaConfig then
        return {}
    end
    
    local priceStr = gashaConfig[7]
    return Global.CheckGoods(priceStr)
end

---@return DropGoods[]
function CakeControl.GetGashaDrops()
    local gashaId = CakeControl.GetGashaId()
    local gashaConfig = GashaponLocalData.tab[gashaId]
    if not gashaConfig then
        return {}
    end
    
    local dropId = gashaConfig[5]
    return Global.DropToGoods(dropId)
end

--- 扭蛋池必须要升级才有
---@param callback fun() @ 未升级的就先升级后回调，否则直接触发 
function CakeControl.InitGashaPool(callback)
    local data = CakeControl.GetBakeryData()
    local actId = data.activityid
    local actData = ActivityControl.GetActivityByID(actId)
    
    if not actData or _GetCakeGashaData(actId) then
        if callback then
            callback()
        end
        return
    end
    
    --- 池子已经开启了
    if actData.poolID and actData.poolID ~= 0 then
        CakeControl.PushPoolData(actId, actData.poolID, actData.goods)
        if callback then
            callback()
        end
        return
    end
    
    --- 开启池子
    local gashaId = CakeControl.GetGashaId()
    CakeControl.RequestGashaGameUp(actId, gashaId, function(poolId, poolGoods) 
        CakeControl.PushPoolData(actId, poolId, poolGoods)
        if callback then
            callback()
        end
    end)
end

---@return DropGoods[] @ 源数据，请勿直接修改！
function CakeControl.GetGashaGoods()
    local data = CakeControl.GetBakeryData()
    local actId = data.activityid
    local gData = _GetCakeGashaData(actId)
    if not gData then
        return {}
    end
    return gData.dropGoodsList
end

---@param activityId int
---@param poolId @ GashapoolLocalData 键
---@param times int
---@param callback fun(rewards:goods[])
function CakeControl.RequestGashaLottery(activityId, poolId, times, callback)
    local req = assert(pb.encode("PBClient.ClientTwisterGameLotteryREQ", {
        eventID = activityId,
        targetID = poolId,
        num = times,
    }))
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_LOTTERY_REQ, req, 0, nil, function(buffer, tag)
        MgrNet.CommonACK("PBClient.ClientTwisterGameLotteryACK", buffer, tag)
    end, function(buffer, tag)
        local ntf = assert(pb.decode("PBClient.ClientTwisterGameLotteryNTF", buffer))
        if ntf.cost then
            ItemControl.PushGroupItemData(ntf.cost, ItemControl.PushEnum.consume)
        end
        if ntf.goods then
            ItemControl.PushGroupItemData(ntf.goods, ItemControl.PushEnum.add)
        end
        TaskControl.ChangeStatistics(ntf.day, ntf.week, ntf.month, ntf.glory)
        BagViewModel.ReloadCacheData()
        
        CakeControl.PushPoolData(activityId, ntf.poolID, ntf.poolGoods)
        
        if callback then
            callback(ntf.goods)
        end
    end)
end

---@param activityId int
---@param poolId @ GashapoolLocalData 键
---@param callback fun(poolId:int, poolGoods:string)
function CakeControl.RequestGashaGameUp(activityId, poolId, callback)
    local req = assert(pb.encode("PBClient.ClientTwisterGameUPREQ", {
        eventID = activityId,
        targetID = poolId,
    }))
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_UP_REQ, req, 0, nil, function(buffer, tag)
        MgrNet.CommonACK("PBClient.ClientTwisterGameUPACK", buffer, tag)
    end, function(buffer, tag)
        local ntf = assert(pb.decode("PBClient.ClientTwisterGameUPNTF", buffer))
        -- 感觉没必要修改，也不太应该修改原始数据，目前仅有该 Control 管理池子物品
        --local actData = ActivityControl.GetActivityByID(activityId)
        --if actData then
        --    actData.poolID = ntf.poolID
        --    actData.goods = ntf.poolGoods
        --end
        if callback then
            callback(ntf.poolID, ntf.poolGoods)
        end
    end)
end

--endregion 扭蛋池

function CakeControl.Clear()
    ActivityCakeData = nil
    SignItemData = {}
    BakeryData = {}
    GiftDataByID = {}
    GiftDataByOrder = {}
    CurGiftData = nil
    _CakeGashaMap = {}
end

return CakeControl