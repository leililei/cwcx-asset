
--region 类型声明
---@class FriendServerData
---@field userID long
---@field friendLv int
---@field nike string @ 昵称
---@field head int
---@field headFrame int
---@field loginTime long
---@field online int
---@field status int @ 0 - 路人; 1 - 好友; 不确定是否还有其他状态
---@field remark string
---@field signature string
---@field tags int
---@field support HeroSupportServerData[]

---@class HeroSupportServerData
---@field heroID int
---@field heroLevel int
---@field heroStar int
---@field slot int
---@field equip int[]
---@field heroAwaken int
---@field heroCTime long
---@field heroCurSkill int
---@field heroSkillLevel int
---@field heroExp int
---@field heroFavor int
---@field heroFlag boolean
--endregion 类型声明

FriendViewModel = {}

---@type FriendServerData[]
FriendViewModel.FriendCache = {}

FriendViewModel.CurFriendID = nil
---好友列表数据是否变动
FriendViewModel.FriendListChanged = false
---好友支援阵容信息缓存
FriendViewModel.CacheSupportList = {}
---好友支援阵容信息
FriendViewModel.FriendSupportData = {}
---好友支援阵容回调数据
FriendViewModel.SupportData = {}
---战斗结束待邀请的陌生人数据
FriendViewModel.StrangersData = {}
---在此界面已申请过好友的玩家列表
FriendViewModel.AppliedList = {}
---好友点赞表
FriendViewModel.LikeData = {}
---批量选中好友列表
---@type long[] @ userID
FriendViewModel.BatchSelectFriendList = {}
---添加好友跳转标志
FriendViewModel.JumpToAddFriends = false
---点赞次数
FriendViewModel.likeCount = 0
-- TODO Arno(好友优化) 从服务端数据初始化
---是否屏蔽了好友申请
---@private
---@type boolean
FriendViewModel.bBlockFriendApply = false

FriendViewModel.parent = nil


function FriendViewModel.OpenFriendUI(callback)
    ---清空列表
    FriendViewModel.AppliedList = {}
    FriendViewModel.FriendCache = {}
    MgrUI.GoHide(UID.Friend_UI,function()
        if callback then
            callback()
        end
    end)
end

function FriendViewModel.Close()
    MgrUI.GoBack()
end

---获取战斗支援
function FriendViewModel.GetBattleSupport()
    FriendViewModel.BattleSupportREQ()
end

---------------------------------好友列表-------------------------------------------
---获取好友数据
function FriendViewModel.GetFriendInfoREQ(CurPage,CurStatus,FuncACK,FuncNTF)
    local BaseREQ  =
    {
        page = CurPage,
        status = CurStatus,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetFriendInfoREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_FRIEND_INFO_REQ,bytes,0,nil,FuncACK,FuncNTF)
end

---------------------------------好友申请-------------------------------------------
function FriendViewModel.FriendApplyACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApplyACK',buffer))
    print(tab.errNo)
    if tab.errNo==0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_applysuccess"),2},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("addfriendpop_ui_tips3"),2},true)
    end
end
function FriendViewModel.FriendApplyNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApplyNTF',buffer))
    print(tab)
    if FriendViewModel.parent then
        FriendViewModel.parent:ClosePop()
    end
end

function FriendViewModel.FriendApply(ID,callBackNode)
    FriendViewModel.parent = callBackNode
    local BaseREQ =
    {
        userID = ID
    }
    local bytes = assert(pb.encode('PBClient.ClientFriendApplyREQ',BaseREQ))
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_FRIEND_APPLY_REQ,bytes,0,nil, FriendViewModel.FriendApplyACK,FriendViewModel.FriendApplyNTF)
end

--- 是否屏蔽了好友申请
---@return boolean
function FriendViewModel.IsFriendApplyBlocked()
    return FriendViewModel.bBlockFriendApply
end

--- 设置好友申请屏蔽
---@param bBlocked boolean
function FriendViewModel.SetFriendApplyBlocked(bBlocked)
    if FriendViewModel.bBlockFriendApply == bBlocked then
        return
    end
    FriendViewModel.bBlockFriendApply = bBlocked
    Event.Go(EID.FriendApplyBlockStateChanged, bBlocked)
end

--- 请求设置好友申请屏蔽
---@param bBlocked boolean
function FriendViewModel.FriendApplyBlockREQ(bBlocked)
    if bBlocked == FriendViewModel.IsFriendApplyBlocked() then
        -- 出现设置状态和当前状态一致时，一般考虑是 UI 交互状态不正确
        -- 因此这里视为设置成功，触发一次事件
        Event.Go(EID.FriendApplyBlockStateChanged, bBlocked)
        return
    end
    local BaseREQ = {
        status = bBlocked and 1 or 0,
    }
    local bytes = assert(pb.encode('PBClient.ClientSetFriendBlockReq', BaseREQ))
    MgrNet.SendReq(MID.CLIENT_SET_FRIEND_BLOCK_REQ, bytes, 0, nil, 
        function(buffer, tag) 
            local tab = assert(pb.decode('PBClient.ClientSetFriendBlockAck', buffer))
            print(tab.errNo)
            if tab.errNo ~= 0 then
                Global.PopTip("Error" .. tab.errNo, 2, true)
            end
        end, 
        function(buffer, tag)
            ---@type {status:int}
            local tab = assert(pb.decode('PBClient.ClientSetFriendBlockNtf', buffer))
            print(tab)
            FriendViewModel.SetFriendApplyBlocked(tab.status == 1)
        end)
end
---------------------------------好友审批-------------------------------------------
---好友审批数据回调
function FriendViewModel.GetFriendApprovalACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApprovalACK',buffer))
    print(tab.errNo)
    if tab.errNo == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips1"),2},true)
    elseif tab.errNo == 630 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips7"),2},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    end
end
function FriendViewModel.GetFriendApprovalNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendApprovalNTF',buffer))
    print(tab)
    ---刷新列表
    if(FriendViewModel.ApprovalListCallBack) then
        FriendViewModel.ApprovalListCallBack()
    end
    if tab.result == 1 then
        FriendViewModel.FriendListChanged = true
        FriendViewModel.BattleSupportREQ()
    end
end
---请求好友审批数据
function FriendViewModel.GetFriendApprovalREQ(ID,Result)
    local BaseREQ  =
    {
        userID = ID,
        result = Result,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendApprovalREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_APPROVAL_REQ,bytes,0,nil,FriendViewModel.GetFriendApprovalACK,FriendViewModel.GetFriendApprovalNTF)
end


---------------------------------好友搜索-------------------------------------------
---搜索好友回调
function FriendViewModel.GetFriendSearchACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendSearchACK',buffer))
    print(tab.errNo)
    if tab.errNo == 609 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips3"),1},true)
    else
        if tab.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips4")..tab.errNo,1},true)
        end
    end
end

---搜索好友请求
function FriendViewModel.GetFriendSearchREQ(UserID,funcNTF)
    local BaseREQ  =
    {
        userID = UserID   ---非0 搜索特定用户 0 随机10人
    }
    FriendViewModel.RandomFriend = UserID == 0
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSearchREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SEARCH_REQ,bytes,0,nil, FriendViewModel.GetFriendSearchACK,funcNTF)
end

function FriendViewModel.FriendSearchREQ(UserID,funcACK,funcNTF)
    local BaseREQ  =
    {
        userID = UserID   ---非0 搜索特定用户 0 随机10人
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSearchREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SEARCH_REQ,bytes,0,nil,funcACK,funcNTF)
end

---------------------------------好友点赞-------------------------------------------
---好友点赞数据发送
function FriendViewModel.FriendLikeREQ(FriendID,funcACK,funcNTF)
    local BaseREQ  =
    {
        friendID = FriendID   ---要点赞的好友ID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendLikeREQ',BaseREQ))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_LIKE_REQ,bytes,0,nil,funcACK,funcNTF)
end

---一键点赞
function FriendViewModel.OneClickLikeREQ(callback)
    local BaseREQ = {
        friendID = -1
    }
    local bytes = assert(pb.encode('PBClient.ClientFriendLikeREQ',BaseREQ))
    ItemControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_LIKE_REQ,bytes,0,nil,function(...)
        FriendViewModel.OneClickLikeACK(...)
    end ,function(...)
        FriendViewModel.OneClickLikeNTF(...)
        if callback then
            callback()
        end
    end)
end

function FriendViewModel.OneClickLikeACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendLikeACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips4"),2},true)
    end
end

function FriendViewModel.OneClickLikeNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendLikeNTF',buffer))
    if(tab.Goods) then
        ItemControl.PushGroupItemData(tab.Goods,ItemControl.PushEnum.add)
        ---计算体力
        local count = 0
        for k,v in pairs(tab.Goods) do
            if v.goodsID == 100001 and v.goodsType == 4 then
                count = count + v.goodsNum
            end
        end
        ---推送体力数据
        local vigorinfo =
        {
            vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + count,
            vigorTime = Global.GetCurTime()
        }
        PlayerControl.GetPlayerData():PushVigor(vigorinfo)
        ---弹出奖励窗口
        MgrUI.Pop(UID.PopTip_UI,{"likeTips",1,nil,count},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("frienditem_tips5"),2},true)
    end
    if tab.friendInfos and next(tab.friendInfos) then
        for k,v in pairs(tab.friendInfos) do
            FriendViewModel.InitLikeData(v.friendID,v.tags)
        end
    end
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    FriendViewModel.likeCount = tab.count  --点赞次数
end

---------------------------------好友备注-------------------------------------------
---修改好友备注请求
function FriendViewModel.FriendSetRemarkREQ(FriendID,Remark,FuncACK,FuncNTF)
    local BaseREQ  =
    {
        friendID = FriendID,   ---要修改备注的好友ID
        remark = Remark,       ---要修改的备注
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendSetRemarkREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_SET_REMARK_REQ,bytes,0,nil, FuncACK,FuncNTF)
end

---------------------------------好友名片-------------------------------------------
---查询好友名片回调
function FriendViewModel.FriendInfoACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendInfoACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips5"),2},true)
    end
end
function FriendViewModel.FriendInfoNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendInfoNTF',buffer))
    print(tab)
    if(tab) then
        MgrUI.Pop(UID.FriendAvatar_UI,{tab},true)
    end
end

---查询好友名片请求
function FriendViewModel.FriendInfoREQ(FriendID)
    local BaseREQ  =
    {
        friendID = FriendID,   ---要查询名片的好友Id
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendInfoREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_INFO_REQ,bytes,0,nil, FriendViewModel.FriendInfoACK,FriendViewModel.FriendInfoNTF)
end

---------------------------------删除好友-------------------------------------------
---删除好友回调
function FriendViewModel.FriendDelACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendDelACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips6")..tab.errNo,2},true)
    end
end
function FriendViewModel.FriendDelNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientFriendDelNTF',buffer))
    print(tab)
    if tab.friendID and tab.friendID[1] then
        local deletedFriendId = tab.friendID[1]
        --- 删除好友
        for i = 1,#FriendViewModel.FriendCache do
            if FriendViewModel.FriendCache[i].userID == deletedFriendId and tab.status == 2 then
                table.remove(FriendViewModel.FriendCache,i)
                break
            end
        end
        --- 删除批量选中
        FriendViewModel.RemoveBatchSelectFriend(deletedFriendId)
    end
    ---刷新好友列表
    if(FriendViewModel.FriendListCallBack) then
        --FriendViewModel.FriendListCallBack()
        FriendViewModel.FriendListCallBack(tab.friendID)
    end
    --FriendViewModel.BattleSupportREQ()
end
---删除好友请求
---@param FriendID long
function FriendViewModel.FriendDelREQ(FriendID)
    local BaseREQ  =
    {
        friendID = { FriendID },   ---要删除的好友Id
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendDelREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_DEL_REQ,bytes,0,nil, FriendViewModel.FriendDelACK,FriendViewModel.FriendDelNTF)
end

--region ---------------------------------批量处理好友---------------------------------
--- 批量选中好友数量
---@return int
function FriendViewModel.CountBatchSelectFriendList()
    return #FriendViewModel.BatchSelectFriendList
end

--- 清空批量选中好友
function FriendViewModel.ClearBatchSelectFriendList()
    if #FriendViewModel.BatchSelectFriendList == 0 then
        return
    end
    FriendViewModel.BatchSelectFriendList = {}
end

--- 移除批量选中好友
---@param userId long
function FriendViewModel.RemoveBatchSelectFriend(userId)
    if #FriendViewModel.BatchSelectFriendList == 0 then
        return
    end
    table.RemoveElementByValue(FriendViewModel.BatchSelectFriendList, userId, true)
end

--- 批量选中好友
---@param constFriendData FriendServerData
function FriendViewModel.AddBatchSelectFriend(constFriendData)
    if table.Contains(FriendViewModel.BatchSelectFriendList, constFriendData.userID) then
        return
    end
    table.insert(FriendViewModel.BatchSelectFriendList, constFriendData.userID)
end

--- 批量选中是否包含指定好友
---@param userId long
---@return boolean
function FriendViewModel.ContainsBatchSelectFriend(userId)
    return table.Contains(FriendViewModel.BatchSelectFriendList, userId)
end

--- 批量删除好友请求
---@param constUserIdList long[]
---@param NTFCallback fun(tab:{friendID:long[], status:int})?
function FriendViewModel.BatchDeleteFriendsREQ(constUserIdList, NTFCallback)
    local BaseREQ  =
    {
        friendID = constUserIdList,
    }
    local bytes = assert(pb.encode('PBClient.ClientFriendDelREQ', BaseREQ))
    MgrNet.SendReq(MID.CLIENT_FRIEND_DEL_REQ, bytes, 0, nil, 
            function(buffer, tag)
                local tab = assert(pb.decode('PBClient.ClientFriendDelACK', buffer))
                print(tab.errNo)
                if tab.errNo ~= 0 then
                    Global.PopTip(MgrLanguageData.GetLanguageByKey("friendviewmodel_tips6") .. tab.errNo, 2, true)
                end
            end, 
            function(buffer, tag)
                ---@type {friendID:long[], status:int}
                local tab = assert(pb.decode('PBClient.ClientFriendDelNTF', buffer))
                print(tab)
                local deletedFriendIdList = tab.friendID
                if deletedFriendIdList then
                    --- 清理好友列表
                    local friendList = FriendViewModel.FriendCache
                    for i = #friendList, 1, -1 do
                        local friendData = friendList[i]
                        if table.Contains(deletedFriendIdList, friendData.userID) then
                            table.remove(friendList, i)
                        end
                    end
                    --- 清理批量选中
                    for i, friendId in ipairs(deletedFriendIdList) do
                        FriendViewModel.RemoveBatchSelectFriend(friendId)
                    end
                end
                if NTFCallback then
                    NTFCallback(tab)
                end
                -- 这里不再请求支援数据
                -- 支援数据在获取好友数据时是不会读取的，在战斗内会再去获取。
                -- 那为什么接受申请和删除好友要读取？
                --FriendViewModel.BattleSupportREQ()
            end)
end
--endregion ---------------------------------批量处理好友---------------------------------


---好友支援阵容数据请求
function FriendViewModel.BattleSupportREQ()
    if PlayerControl.SupportNum >= PlayerControl.SupportNumMax then
        --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text103"),1},true)
        return
    end
    local BaseREQ  =
    {

    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientBattleSupportREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_BATTLE_SUPPORT_REQ,bytes,0,nil, FriendViewModel.BattleSupportACK,FriendViewModel.BattleSupportNTF)
end
function FriendViewModel.BattleSupportACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientBattleSupportACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        print("获取好友支援阵容失败,错误码为"..tab.errNo)
    end
end
function FriendViewModel.BattleSupportNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientBattleSupportNTF',buffer))
    print(tab)
    ---刷新好友支援阵容信息
    if tab.supports ~= nil then
        FriendViewModel.FriendSupportData = {}
        FriendViewModel.SupportData = {}
        FriendViewModel.CacheSupportList = {}
        for k,v in ipairs(tab.supports) do
            FriendViewModel.FriendSupportData[#FriendViewModel.FriendSupportData + 1] = HeroControl.CreateSingleFriendHeroData(v)
            FriendViewModel.CacheSupportList[#FriendViewModel.CacheSupportList + 1] = HeroControl.CreateSingleFriendHeroData(v)
            FriendViewModel.SupportData[tonumber(v.roleID .. v.userID)] = v
        end
        UnityEngine.Debug.Log("刷新好友支援阵容信息,获取到的助战人数："..#tab.supports)
    end
end

---获得完整的支援数据
function FriendViewModel.GetSupportData()
    FriendViewModel.FriendSupportData = {}
    for k,v in pairs(FriendViewModel.CacheSupportList) do
        FriendViewModel.FriendSupportData[#FriendViewModel.FriendSupportData + 1] = v
    end
    print("好友支援角色有"..#FriendViewModel.CacheSupportList.."个")
end

---添加陌生人名单
function FriendViewModel.AddStrangersData(fighter)
    FriendViewModel.StrangersData = {}
    if fighter.userID ~= 0 and fighter.userID ~= nil and fighter.friend == 0 then
        table.insert(FriendViewModel.StrangersData,fighter.userID)
        print("使用了陌生人的支援角色")
    end
end

---移除陌生人名单
function FriendViewModel.RemoveStrangersData(fighter)
    for i,ids in pairs(FriendViewModel.StrangersData) do
        if ids == fighter.userID then
            table.remove(FriendViewModel.StrangersData,i)
            break
        end
    end
end

---计算两个时间戳的差
function FriendViewModel.TimeDiff(starTime,endTime) ---开始时间，结束时间
    local t1 = os.date("%Y%m%d",starTime)
    local t2 = os.date("%Y%m%d",endTime)
    local day1 = {}
    local day2 = {}
    day1.year,day1.month,day1.day = string.match(t1,"(%d%d%d%d)(%d%d)(%d%d)")
    day2.year,day2.month,day2.day = string.match(t2,"(%d%d%d%d)(%d%d)(%d%d)")
    local numDay1 = os.time(day1)
    local numDay2 = os.time(day2)
    local dayTime = 0
    ---相差了多少天
    dayTime = math.floor((numDay2 - numDay1)/(3600*24))

    return dayTime
end

---列表排序
function FriendViewModel.ListSort(List)
    local array = {}
    array = List
    table.sort(array, function(a,b)
        if a.online > b.online then
            return true
        elseif a.online < b.online then
            return false
        else
            if a.friendLv > b.friendLv then
                return true
            elseif a.friendLv < b.friendLv then
                return false
            else
                return a.userID < b.userID
            end
        end
        return false
    end)
    return array
end

---去重
function FriendViewModel.Contains(tb, userID,isMain)
    if isMain == nil or isMain == false then
        for i, v in ipairs(tb) do
            if (v.userID == userID) then
                return true
            end
        end
        return false
    else
        for i, v in ipairs(tb) do
            if (v == userID) then
                return true
            end
        end
        return false
    end

end

function FriendViewModel.AddAAppliedList(id)
    if FriendViewModel.Contains(FriendViewModel.AppliedList,id,true) == false then
        table.insert(FriendViewModel.AppliedList,id)
    end
end

---注册好友监听
function FriendViewModel.RegisterFriend()
    RedDotControl.GetDotData("Friend"):SetState(false)
    FriendViewModel.InitFriendApplyRedPoint(PlayerControl.ApplyFriendNum)
    MgrNet.RegisterNTF(MID.CLIENT_HAS_NEW_FRIEND_INFO_NTF, function()
        print("接收到新好友请求")
        RedDotControl.GetDotData("Friend"):SetState(true)
    end)
end

---初始化点赞数据
function FriendViewModel.InitLikeData(id,tags)
    local curTime = Global.GetCurTime()
    local CanLike = false
    ---上次点赞的时间
    local ClickLikeHour = os.date("!*t",(tags) + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    ---当前的小时
    local curHour = os.date("!*t",curTime + tonumber(SteamLocalData.tab[112007][2]) * 3600)
    ---是否是同一天
    local isSameDay = os.date("%Y-%m-%d",tags) == os.date("%Y-%m-%d",curTime)
    ---如果没有点赞记录
    if(tags == 0) then
        CanLike = true
    else
        if isSameDay then
            ---如果上次点赞时间在5点前当前时间在5点后
            if tonumber(ClickLikeHour.hour) < 5 and tonumber(curHour.hour) >= 5 and tonumber(curHour.min) >= 1 then
                CanLike = true
            else
                CanLike = false
            end
        else
            ---当前时间在5点后刷新点赞
            if tonumber(curHour.hour) >= 5 and tonumber(curHour.min) >= 0 then
                CanLike = true
            else
                ---如果相差时间大于一天
                if curTime - tags >= 86400 then
                    CanLike = true
                else
                    CanLike = false
                end
            end
        end
    end
    FriendViewModel.LikeData[id] = CanLike
end

---初始化好友申请红点
function FriendViewModel.InitFriendApplyRedPoint(num)
    if num == nil then
        return
    end
    if num > 0 then
        RedDotControl.GetDotData("Friend"):SetState(true)
    end
end

function FriendViewModel.Clear()
    FriendViewModel.CurFriendID = nil
    FriendViewModel.FriendListChanged = false
    FriendViewModel.CacheSupportList = {}
    FriendViewModel.FriendSupportData = {}
    FriendViewModel.SupportData = {}
    FriendViewModel.StrangersData = {}
    FriendViewModel.AppliedList = {}
    FriendViewModel.LikeData = {}
    FriendViewModel.ClearBatchSelectFriendList()
    FriendViewModel.JumpToAddFriends = false
    FriendViewModel.bBlockFriendApply = false
    FriendViewModel.parent = nil
    FriendViewModel.likeCount = 0
end

return FriendViewModel