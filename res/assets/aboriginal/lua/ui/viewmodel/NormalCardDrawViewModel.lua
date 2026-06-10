---佣兵补给VM
---
require("LocalData/RolerecruitLocalData")
require("LocalData/EquipmentsupplyLocalData")
require("LocalData/DrawpoolgotoLocalData")
---公共方法和业务逻辑和数据处理放这里
NormalCardDrawViewModel = {}
---抽卡返回的角色信息
--- 以数组形式存储角色数据
--- 1-heroID
--- 2-是否为道具(1/0=true/false)
NormalCardDrawViewModel.HeroList = {}
---抽卡返回的共鸣信息
NormalCardDrawViewModel.EquipList = {}
---- 0 是单抽  ， 1 是十连, 2 是百抽
NormalCardDrawViewModel.CountType = 0
---- 0 是普通，1是精英，2是新手，3是限时，4是装备
NormalCardDrawViewModel.RecruitType = 0
---当前抽的卡池
NormalCardDrawViewModel.CurRecruit = 0
---当前消耗物品类型  0为普通券，1为精英券，2为金币，3为共鸣石
NormalCardDrawViewModel.CurCostType = 0
---当前卡池抽卡限制
NormalCardDrawViewModel.limitCount = 0
---当前卡池面板小人
NormalCardDrawViewModel.Qban = nil
---当前奖池信息
NormalCardDrawViewModel.LotteryList = {}
---所有卡池
NormalCardDrawViewModel.CardPoolList = {}
---所有卡池的Up角色
NormalCardDrawViewModel.RoleUpList = {}
---所有卡池的当前选择的Up角色
NormalCardDrawViewModel.CurPoolRoleUpList = {}
---当前选择的页签索引
NormalCardDrawViewModel.CurTab = nil
---开武器池还是角色池
NormalCardDrawViewModel.PoolType = nil
--十连抽卡前所拥有的角色
NormalCardDrawViewModel.RoleDataBefore = {}
NormalCardDrawViewModel.CardDropList = {}

NormalCardDrawViewModel.PageType = {
    timeLimit = 1,
    normal = 2,
    equip = 3,
    novice = 4,
}
---跳转页签
NormalCardDrawViewModel.LinkType = NormalCardDrawViewModel.PageType.timeLimit

--- 招募券缺少时的行为类型
---@alias TicketLackType int
NormalCardDrawViewModel.TicketLackType = {
    -- 仅弹出提示
    TIP = 1,
    -- 支持快捷购买
    BUY = 2,
    -- 跳转至商店
    GOTO = 3,
}


---初始化
function NormalCardDrawViewModel.Init(callback)
    NormalCardDrawViewModel.CardPoolList = NormalCardDrawViewModel.ReloadCardPool()
    NormalCardDrawViewModel.ReloadLotteryInfo()
    NormalCardDrawViewModel.InitCurPoolRoleUpList()
    NormalCardDrawViewModel.OpenCardDrawUI(callback)
end


function NormalCardDrawViewModel.Close()
    ---退出UI
    MgrUI.GoBack()
    NormalCardDrawViewModel.CurTab = nil
    CardDrawControl.TypeIndex = nil
    CardDrawControl.CardPoolIndex = nil
    CardDrawControl.CurEquipDrawType = CardDrawControl.EquipDrawType.OneToTen
end

---初始化up角色
function NormalCardDrawViewModel.InitCurPoolRoleUpList()
    for i, v in pairs(NormalCardDrawViewModel.RoleUpList) do
        local id = UnityEngine.PlayerPrefs.GetString(string.format("%s",i))
        if id == nil or id == "" then
            NormalCardDrawViewModel.CurPoolRoleUpList[i] = tonumber(v)
        else
            NormalCardDrawViewModel.CurPoolRoleUpList[i] = tonumber(id)
        end
    end
end

---重载卡池
function NormalCardDrawViewModel.ReloadCardPool()
    local array = {}
    if NoviceViewModel.CurTaskId == 52405 then
        ---获得新手卡池
        array = CardDrawControl.GetNoviceDrawData()
        NormalCardDrawViewModel.RoleUpList[999999] = "0"
    else
        NormalCardDrawViewModel.LotteryList = {}
        for i, v in pairs(RolerecruitLocalData.tab) do
            if v[1] ~= 999999 then
                NormalCardDrawViewModel.LotteryList[v[1]] =
                {
                    lotteryID = v[1],
                    lotteryCount = 0,
                    lotteryUP = 2
                }
            end
        end
        ---获取所有角色和装备卡池
        array = CardDrawControl.GetAllNormalDrawData()
        NormalCardDrawViewModel.RoleUpList = CardDrawControl.GetUpRole()
    end
    Global.Sort(array,{"cardType","sort"},false)


    --将类型3提前
    local list = {}
    for i, v in ipairs(array) do
        if  v.cardType == 3 then
            table.insert(list,v)
        end
    end
    for i, v in ipairs(array) do
        if  v.cardType ~= 3 then
            table.insert(list,v)
        end
    end
    array = list
    return array
end

---加载奖池信息
function NormalCardDrawViewModel.ReloadLotteryInfo()
    if PlayerControl.GetPlayerData().lotterys then
        for i, v in pairs(PlayerControl.GetPlayerData().lotterys) do
            if  NormalCardDrawViewModel.LotteryList[v.lotteryID] then
                NormalCardDrawViewModel.LotteryList[v.lotteryID].lotteryCount = v.lotteryCount
                NormalCardDrawViewModel.LotteryList[v.lotteryID].lotteryUP = NormalCardDrawViewModel.CalculateUp(v.lotteryID,v.lotteryUP)
            end
        end
    end
end

---获取奖池概率信息
function NormalCardDrawViewModel.GetLotteryInfo(id)
    return NormalCardDrawViewModel.LotteryList[id]
end

---更新奖池概率信息
function NormalCardDrawViewModel.UpdataLotteryInfo(id,count,up)
    local LotteryInfo = NormalCardDrawViewModel.GetLotteryInfo(id)
    LotteryInfo.lotteryCount = count
    LotteryInfo.lotteryUP = NormalCardDrawViewModel.CalculateUp(id,up)
end

---计算up概率
function NormalCardDrawViewModel.CalculateUp(id,up)
    local PoolData = RolerecruitLocalData.tab[id]
    local CardPoolData = JNStrTool.strSplit(",",PoolData[3])
    local pool_up = PoolData[11]
    local target = 0
    local sum = 0
    for i, v in pairs(CardPoolData) do
        local t = JNStrTool.strSplit("_",v)
        if pool_up == tonumber(t[1]) then
            target = tonumber(t[3]) + up
        end
        sum = sum + tonumber(t[3])
    end
    return target/sum*100
end

--十连抽判断是否为新获得的角色
-- 注意，该方法的返回值反了
function NormalCardDrawViewModel.GetIsNewSSR(_id)
    local isNew = false
    local info = NormalCardDrawViewModel.RoleDataBefore
    local nowInfo = HeroControl.GetHaveHero()
    for index, value in ipairs(info) do
        if value.id == _id then
            isNew = true
            break
        end
    end
    return isNew
end

--- 是否为抽取角色的卡池
---@return boolean
function NormalCardDrawViewModel.IsRoleCardDraw()
    local heroList = nil
    local drawPoolData = CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit)
    if drawPoolData and drawPoolData.cardType ~= CardDrawControl.PoolCardType.Equip then
        heroList = NormalCardDrawViewModel.HeroList
    end
    return heroList ~= nil and #heroList > 0
end

--申请卡池概率详情数据
function NormalCardDrawViewModel.ClientDropInfoREQ(str,arg0)
    NormalCardDrawViewModel.CardDropList = {}
    local list = {}
    local dropList = string.split(str,',')
    for i, v in ipairs(dropList) do
        local t = string.split(v,'_')
        table.insert(list, tonumber(t[2]))
    end

    local ClientDropInfoREQ = {
        DropID = list,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientDropInfoREQ',ClientDropInfoREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_DROP_INFO_REQ,bytes,0,nil,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientDropInfoACK',buffer))
        print(tab.errNo)
        if tab.errNo~=0 then
            --申请角色数据失败
        end
    end,
    function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientDropInfoNTF',buffer))
        if #tab.Items > 0 then
            if tab then
                for i, v in ipairs(tab.Items) do
                    NormalCardDrawViewModel.CardDropList[v.id] = v.goods
                end
            end
            MgrUI.Pop(UID.CardPoolTip_UI,arg0,true)
        end
    end)
end
--------------------UI跳转----------------------------
---打开佣兵UI
function NormalCardDrawViewModel.OpenCardDrawUI(callback)
  --  MgrUI.Pop(UID.PopTip_UI,{"佣兵补给维护中",1},true)
    MgrUI.GoHide(UID.NormalDraw_UI, function ()
        if callback then
            callback()
        end
    end)
end
---打开佣兵结果UI
function NormalCardDrawViewModel.OpenCardDrawResultUI(callback)
    MgrSound.Stop(3,"CardRoleVoice",false)
    MgrUI.GoClose(UID.DrawResult_UI, function ()
        if callback then
            callback()
        end
    end)
end
---打开佣兵奖励窗口
function NormalCardDrawViewModel.OpenCardDrawTenthResultUI(callback)
    MgrSound.Stop(3,"CardRoleVoice",false)
    MgrUI.GoClose(UID.DrawTenthResult_UI, function ()
        if callback then
            callback()
        end
    end)
end
---打开光暗卡池奖励窗口
function NormalCardDrawViewModel.OpenLightDarkResultUI(callback)
    MgrSound.Stop(3,"CardRoleVoice",false)
    MgrUI.GoClose(UID.DrawFifthResult_UI, function ()
        if callback then
            callback()
        end
    end)
end
---返回到佣兵UI
function NormalCardDrawViewModel.BackToCardDrawUI(callback)
    MgrSound.Stop(3,"CardRoleVoice",false)
    MgrUI.GoClose(UID.NormalDraw_UI, function ()
        if callback then
            callback()
        end
    end)
end
---打开装备补给奖励UI
function NormalCardDrawViewModel.OpenVoidGearDrawResultUI(callback)
    MgrUI.GoClose(UID.GearDrawResult_UI, function ()
        if callback then
            callback()
        end
    end)
end
--- 连续弹出全部徽章动画
--- 基于当前持有的数据判断是否弹出以及弹出哪些徽章
--- 该方法假定当前是抽取角色
---@param callback fun() @ 全部弹出完毕或无弹出均触发
---@param startIndex number @ default 1，起始索引
function NormalCardDrawViewModel.PopAllBadges(callback, startIndex)
    startIndex = startIndex or 1
    local heroList = NormalCardDrawViewModel.HeroList
    local heroCount = #heroList
    
    for i = startIndex, heroCount do
        local heroData = heroList[i]
        local heroID = heroData[1]
        local bIsGoods = heroData[2] == 1
        local badgeName = nil
        -- 非道具
        if not bIsGoods then
            local heroInfo = RoleattributeLocalData.tab[heroID]
            local heroRank = heroInfo[6]
            -- SSR以上
            if heroRank >= 4 then
                local bIsNew = not NormalCardDrawViewModel.GetIsNewSSR(heroID)
                -- 新获得
                if bIsNew then
                    badgeName = heroInfo[86]
                end
            end
        end

        -- 弹出徽章
        if badgeName ~= nil and badgeName ~= "" then
            MgrUI.Pop(UID.UsmBadgePlay, { "Common/SSRDraw/" .. badgeName })
            MgrSound.PlayEffect("yx_ui_huizhang_01", nil, nil, false)
            MgrTimer.AddDelayNoName(1.6, function() 
                NormalCardDrawViewModel.PopAllBadges(callback, i + 1)
            end, nil)
            return
        end
    end

    if callback then
        callback()
    end
end
--- 跳到抽卡结果界面
--- 基于当前持有的数据判断跳到哪个界面
--- 该方法假定目标界面没有开启
---@param callback fun()
function NormalCardDrawViewModel.SkipToDrawResultUI(callback)
    local drawPoolData = CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit)
    local poolCardType = drawPoolData.cardType
    if poolCardType == CardDrawControl.PoolCardType.Role 
    or poolCardType == CardDrawControl.PoolCardType.Step 
    or poolCardType == CardDrawControl.PoolCardType.Freedom then
        local heroList = NormalCardDrawViewModel.HeroList
        local heroCount = #heroList
        if heroCount == 1 then
            NormalCardDrawViewModel.OpenCardDrawResultUI(callback)
        else
            NormalCardDrawViewModel.OpenCardDrawTenthResultUI(callback)
        end
    elseif poolCardType == CardDrawControl.PoolCardType.Equip then
        NormalCardDrawViewModel.OpenVoidGearDrawResultUI(callback)
    elseif poolCardType == CardDrawControl.PoolCardType.LightDark then
        local heroList = NormalCardDrawViewModel.HeroList
        local heroCount = #heroList
        if heroCount == 1 then
            NormalCardDrawViewModel.OpenCardDrawResultUI(callback)
        else
            -- NormalDraw_UI 中有“只有物品(heroCount==0)”的情况，也调用该方法 
            NormalCardDrawViewModel.OpenLightDarkResultUI(callback)
        end
    else
        Log.Error("跳过抽卡视频，出现了不支持的卡池类型")
        NormalCardDrawViewModel.OpenCardDrawResultUI(callback)
    end
end

--region 招募券

--- 缺少招募券时的行为
---@param item ItemData
---@param needCount int
---@param OnConfirm fun()? @ 目前仅在快捷购买类型下使用，确认购买时执行
---@param OnCancel fun()? @ 目前仅在快捷购买类型下使用，取消购买时执行
function NormalCardDrawViewModel.ActionOnLackTicket(item, needCount, OnConfirm, OnCancel)
    if not item then return end
    
    local config = DrawpoolgotoLocalData.tab[item.id]
    local lackType = NormalCardDrawViewModel.TicketLackType.TIP
    if config then
        lackType = config.typeid
    else
        Global.LogError(string.format("未找到缺少招募券(%s)跳转配置", item.id))
    end

    if lackType == NormalCardDrawViewModel.TicketLackType.BUY then
        -- 第四个参数(true)不确定用处，为遗留产物
        MgrUI.Pop(UID.CardBuyPop, {
            MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips6"), 
            item, needCount, true, OnConfirm, OnCancel }, 
            true)
    elseif lackType == NormalCardDrawViewModel.TicketLackType.GOTO then
        local gotoStr = config.gotoid
        Global.PopConfirm(string.format(
            MgrLanguageData.GetLanguageByKey("need_more_diamond_1"), item.name, item.name), 
            function() 
                MgrLink.LinkStart(gotoStr)
            end, nil, 2)
    else
        if lackType ~= NormalCardDrawViewModel.TicketLackType.TIP then
            Global.LogError(string.format("存在不支持的缺少时跳转类型:%s", lackType))
        end
        Global.PopTip(string.format(
            MgrLanguageData.GetLanguageByKey("ui_qita_text152"), item.name),
            nil, true)
    end
end

--endregion 招募券

----------------------业务逻辑（没搬）------------------------------
function NormalCardDrawViewModel.Clear()
    NormalCardDrawViewModel.HeroList = {}
    NormalCardDrawViewModel.EquipList = {}
    NormalCardDrawViewModel.CountType = 0
    NormalCardDrawViewModel.RecruitType = 0
    NormalCardDrawViewModel.CurRecruit = 0
    NormalCardDrawViewModel.CurCostType = 0
    NormalCardDrawViewModel.limitCount = 0
    NormalCardDrawViewModel.Qban = nil
    NormalCardDrawViewModel.LotteryList = {}
    NormalCardDrawViewModel.CardPoolList = {}
    NormalCardDrawViewModel.RoleUpList = {}
    NormalCardDrawViewModel.CurPoolRoleUpList = {}
    NormalCardDrawViewModel.PoolType = nil
    NormalCardDrawViewModel.CurTab = nil
    NormalCardDrawViewModel.LinkType = NormalCardDrawViewModel.PageType.timeLimit
end

local m_drawType = 1;
function NormalCardDrawViewModel.SetDrawType(type)
    if nil == type then
        return;
    end
    m_drawType = type;
end
function NormalCardDrawViewModel.GetDrawType()
    return m_drawType;
end

return NormalCardDrawViewModel