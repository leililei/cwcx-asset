require("LocalData/SigninLocalData")
require("LocalData/MosigninLocalData")

---签到VM
SignViewModel = {}

-----签到类型
SignViewModel.SignData = 0  --签到日期数量
SignViewModel.WeekSignData = {}
---是否是最后一天weekSign
SignViewModel.lastWeekSign = false

---初始化
function SignViewModel.Init()
    ---检测签到
    SignViewModel.CheckPopSignUI()
    ---开启检测器
    --SignViewModel.CheckTimerRepeat()
end
function SignViewModel.Close()
    if SignViewModel.SignData == 31 then
        ---打开月签到
        MgrUI.ClosePop(UID.DailySign_UI)
        ---如果七日签到未完成，这打开七日签到
        SignViewModel.OpenUIAndWeekSign()
    end
end
-------------------------跳转--------------------------
---检测是否弹出签到
function SignViewModel.CheckPopSignUI()
    --新手引导不弹出签到
    if NoviceViewModel.Noviceing then
        return
    end
    ---获取数据
    if RedDotControl.GetDotData("LimitSignAll").State then
        --百日签到
        SignViewModel.OpenSignAll()
    elseif PlayerControl.GetPlayerData().monthSignFlag then
        --        ---如果未签到，则打开月签到界面
        SignViewModel.OpenUIAndSign()
    end
    ---周签到(暂未使用)
    --SignViewModel.Init(PlayerManager.GetWeekSignData())
end
---计时器一小时检测一次
function SignViewModel.CheckTimerRepeat()
    MgrTimer.AddRepeat("CheckSign", 3600, function()
        ---检测签到是否弹出UI
        SignViewModel.CheckPopSignUI()
    end , -1, nil)
end
-----------------------业务逻辑-------------------------
---跳转UI并且打开月签到界面
function SignViewModel.OpenUIAndSign()
    ---当前未签到并且首次新手引导已完成才弹出签到
    if PlayerControl.GetPlayerData().monthSignFlag and NoviceViewModel.Noviceing == false then
        --MgrUI.Pop(UID.DailySign_UI)
        --SignViewModel.AutoSign()  --自动签到
        ActivityControl.OpenHuoDong(ActivityControl.activityTypeEnum.SIGN)
    end
end
---跳转UI并且打开七日签到界面
function SignViewModel.OpenUIAndWeekSign()
    local tday = Global.GetCreateRoleDays()
    local tIsSignFull = false
    SignViewModel.WeekSignData,tIsSignFull = PlayerControl.GetWeekSignData()
    ---如果创角时间超过七日签到的长度,则隐藏
    if tIsSignFull or tday > tonumber(SteamLocalData.tab[111009][2]) then
        return
    end
    ---当前未签到并且首次新手引导已完成且每日签到已完成才弹出签到
    --if not PlayerControl.GetWeekSignState() and NoviceControl.GroupsIsTrigger(tonumber(SteamLocalData.tab[120001][2])) and NoviceViewModel.Noviceing == false then
    --    MgrUI.Pop(UID.SevenDaySign_UI)
    --end
end
---百日签到
function SignViewModel.OpenSignAll()
    --有红点时，每次登录弹出
    ActivityControl.OpenHuoDong(ActivityControl.activityTypeEnum.SIGNALL)
end
---获取累计签到天数
function SignViewModel.GetCumulativeSign()
    return SignViewModel.SignData
end
---@type SigninLocalData[] 月配置缓存
SignViewModel.CacheMonthLocalData = {}
---获取月配置
function SignViewModel.GetMonthLocalData()
    if #SignViewModel.CacheMonthLocalData < 1 then
        ---没有重本地表获取
        for id, data in pairs(SigninLocalData.tab) do
            if data.type ==  tostring(tonumber(os.date("%m",Global.GetCurTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)))  then
                SignViewModel.CacheMonthLocalData[(data.sort)] = data
            end
        end
    end
    return SignViewModel.CacheMonthLocalData
end
---@type SigninLocalData[] 周配置缓存
SignViewModel.CacheWeekLocalData = {}
---获取周配置
function SignViewModel.GetWeekLocalData()
    if #SignViewModel.CacheWeekLocalData < 1 then
        ---没有重本地表获取
        for id, data in pairs(MosigninLocalData.tab) do
            --if data.type == "0" then
                SignViewModel.CacheWeekLocalData[(data.sort)] = data
            --end
        end
    end
    return SignViewModel.CacheWeekLocalData
end
---获取奖励内物品名称
function SignViewModel.GetSignRewardName(str)
    return Global.GetLocalDataByGoods(str).name
end
---获取奖励内物品图片
function SignViewModel.GetSignRewardIcon(str)
    return Global.GetLocalDataByGoods(str).icon
end
---获取奖励内物品品质
function SignViewModel.GetSignRewardQuality(str)
    return Global.GetLocalDataByGoods(str).quality
end
---获取奖励内物品数量
function SignViewModel.GetSignRewardCount(str)
    local reward = string.split(str,'_')
    return reward[3]
end

---发送签到请求
function SignViewModel.SendSign()
    print("签到")
    local time = MgrNet.GetServerTime()
    time = time - 18000
    local ClientSignInREQ = {
        type = 1,
        date = bit2._lshift(1, tonumber(os.date("!*t", time + tonumber(SteamLocalData.tab[112007][2]) * 3600).day) - 1)
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientSignInREQ',ClientSignInREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    print("发送签到"..pb.tohex(bytes))
    MgrNet.SendReq(MID.CLIENT_SIGN_IN_REQ,bytes,tonumber(os.date("!*t", time + tonumber(SteamLocalData.tab[112007][2]) * 3600).day),nil,SignViewModel.SignReceiveACK,SignViewModel.SignReceiveNTF)
end
---签到请求验证
function SignViewModel.SignReceiveACK(buffer, tag)
    print("签到ACK")
    local tab = assert(pb.decode('PBClient.ClientSignInACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
    end
end
---签到数据推送
function SignViewModel.SignReceiveNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSignInNTF',buffer))
    print("签到数据:"..serpent.block(tab)) ---查看table内容
    ---更新签到数据
    SignViewModel.SignData = tab.mSign
    PlayerControl.PushMonthSignData(SignViewModel.SignData)
    PlayerControl.GetPlayerData():PushMonthSignBool(false)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---通知ui变更状态
    Event.Go("DailySignRec")
    
    local goodsList = {}
    for i, v in pairs(tab.goods) do
        if v.hero ~= nil then
            Log.Error("不允许通过签到直接获取角色，请修改签到奖励配置为物品")
        end
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
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if nil ~= tab.vigor then
        PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    end
    
    ---红点禁用
    RedDotControl.GetDotData("Sign"):SetState(false)
    ---刷新红点
    Event.Go("ActivityDot")
    ---刷新主界面货币数目
    HomeViewModel.RefreshCoinCount()
end

---发送七日签到请求
function SignViewModel.SendWeekSign(uiSelf)
    if PlayerControl.GetWeekSignState() then
        return
    end
    print("七日签到")
    SignViewModel.uiWeekSelf = uiSelf
    local ClientSignInREQ = {
        type = 0,
        date = SignViewModel.uiWeekSelf.day
    }
    ---组装数据
    local bytes = assert(pb.encode('PBClient.ClientSignInREQ',ClientSignInREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    print("发送签到"..pb.tohex(bytes))
    MgrNet.SendReq(MID.CLIENT_SIGN_IN_REQ,bytes,SignViewModel.uiWeekSelf.day,nil,SignViewModel.WeekSignReceiveACK,SignViewModel.WeekSignReceiveNTF)
end
---签到请求验证
function SignViewModel.WeekSignReceiveACK(buffer, tag)
    print("签到ACK")
    local tab = assert(pb.decode('PBClient.ClientSignInACK',buffer))
    if tab.errNo ~= 0 then
        if tab.errNo == ServerErrorCode.SignIn_4000 then
            PlayerControl.SetWeekSignState(true)
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
            return
        end
    end
end
---七日签到数据推送
function SignViewModel.WeekSignReceiveNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientSignInNTF',buffer))
    print("签到数据:"..serpent.block(tab)) ---查看table内容
    local signData = PlayerControl.GetWeekSignData()
    ---如果是最后一天签到
    if PlayerControl.GetPlayerData().weekSign == #signData - 1 then
        SignViewModel.lastWeekSign = true
    end
    ---更新签到数据
    SignViewModel.WeekSignData[tag] = 1
    PlayerControl.PushWeekSignData(tag)
   
    local goodsList = {}
    for i, v in pairs(tab.goods) do
        if v.hero ~= nil then
            Log.Error("不允许通过签到直接获取角色，请修改签到奖励配置为物品")
        end
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
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if nil ~= tab.vigor then
        PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    end
    ---红点禁用
    RedDotControl.GetDotData("WeekSign"):SetState(false)
    Event.Go("ActivityDot")
    ---刷新主界面货币数目
    HomeViewModel.RefreshCoinCount()
    ---通知ui变更状态
    SignViewModel.uiWeekSelf:ReceiveChange()
end

function SignViewModel.Clear()
    PlayerControl.GetPlayerData():PushMonthSignBool(true)
    SignViewModel.SignData = 0
    SignViewModel.WeekSignData = {}
    SignViewModel.lastWeekSign = false
end

return SignViewModel



