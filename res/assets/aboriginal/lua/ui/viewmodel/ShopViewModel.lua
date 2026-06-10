require("LocalData/ShopLocalData") ---商品配置
require("LocalData/LanguageerrorLocalData")
---商店
ShopViewModel = {}

---@alias ShopType int
ShopViewModel.ShopType = {
    -- 钻石购置(充值)
    RECHARGE = 114000,
    -- 首页推荐
    RECOMMEND = 114001,
    -- 物资补给
    SUPPLY = 114002,
    -- 兑换商店
    EXCHANGE = 114003,
    -- 结晶商店
    CRYSTAL = 114004,
    -- 荣誉凭证
    HONOUR = 400000,
    -- 皮肤商城
    SKIN = 1000,
}

---是否从成就或任务界面跳转商店
ShopViewModel.WhetherJumpIn = false
---跳转到哪个页面
ShopViewModel.Page = nil
ShopViewModel.EnterShopTime = nil

---IOS支付信息缓存
ShopViewModel.IOSPayCache = {}

---打开讨伐商店
function ShopViewModel.OpenLHTFShopUI()
    --MgrUI.GoHide(UID.WorldBossShop_UI)
    ---跳转物资补给商店
    ShopViewModel.WhetherJumpIn = true
    ShopViewModel.Page = { shopID=114003,ChildShopID = 305}
    ShopViewModel.OpenShopUI()
end

---打开商店
function ShopViewModel.OpenShopUI()
    ShopViewModel.RequestRandomData(function()
        MgrUI.GoHide(UID.Shop_UI)
    end)
end

--- 跳转至商城首页
---@param shopType int? @ 决定左侧页签
function ShopViewModel.JumpToRecommend(shopType)
    ShopViewModel.WhetherJumpIn = true
    ShopViewModel.Page = { shopID = ShopViewModel.ShopType.RECOMMEND, ChildShopID = shopType }
    ShopViewModel.OpenShopUI()
end

function ShopViewModel.JumpToShopUI(type)
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("shopviewmodel_tips1"),1},true)
end

function ShopViewModel.SortActivityChildData(id)
    local arr = {}
    local data = ShopControl.GetSingleShopData(id)
    if data ~= nil then
        for i, v in pairs(data.childShop) do
            if v.Childtype == 5 then
                arr[#arr + 1] = v
            end
        end
        ---排序
        Global.Sort(arr,{"id"} ,false)
    end
    return arr
end

---@param id number 商店id
---@return ShopChildData[] 获取子商店数据
function ShopViewModel.SortChildData(id)
    local arr = {}
    local data = ShopControl.GetSingleShopData(id)
    if data ~= nil then
        for i, v in pairs(data.childShop) do
            if v.Childtype ~= 5 and v.Childtype ~= 6 then
                arr[#arr + 1] = v
            end
        end
        ---排序
        Global.Sort(arr,{"id"} ,false)
    end
    ---如果商品都已经过期，就不显示该按钮
    local newArr = {}
    for i,v in ipairs(arr) do
        for j,value in pairs(v.shopItems) do
            if Global.isMiddleTime(value.sellSTime, value.sellETime) then
                newArr[#newArr + 1] = v
                break
            end
        end
    end
    return newArr
end
---@param data ShopChildData 对商品排序
---@return ShopItemData[]
function ShopViewModel.SortItemData(data)
    if data == nil then
        Log.Error("当前获取的商品数据为空")
        return {}
    end
    local arr = {}
    for i, v in pairs(data.shopItems) do
        if v.sellType ~= 1 then
            arr[#arr + 1] = v
        else
            if Global.isMiddleTime(v.sellSTime, v.sellETime) then
                arr[#arr + 1] = v
            end
        end
    end
    ---排序
    Global.Sort(arr,{"sortIdx"} ,false)
    return arr
end

---@param id number 商店id
---@return ShopChildData[] 获取商店首页数据
function ShopViewModel.GetShopHomeList()
    local arr = {}
    local data = ShopControl.GetSingleShopData(114001)
    if data ~= nil then
        for i, v in pairs(data.childShop) do
            if v.Childtype ~= 5 and v.Childtype ~= 1 and v.Childtype ~= 7 then
                arr[#arr + 1] = v
            end
        end
        ---排序
        Global.Sort(arr,{"id"} ,false)
    end
    return arr
end
---@param id number 商店id
---@return ShopChildData[] 获取商店首页数据
---获取不在商城中展示的商品
function ShopViewModel.GetOutShopList()
    local arr = {}
    local data = ShopControl.GetSingleShopData(114001)
    if data ~= nil then
        for i, v in pairs(data.childShop) do
            if v.Childtype == 5 then
                arr[#arr + 1] = v
            end
        end
        ---排序
        Global.Sort(arr,{"id"} ,false)
    end
    return arr
end

function ShopViewModel.GetItemsDisCountTime(callback)
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientShopListReq',{}))
    MgrNet.SendReq(MID.CLIENT_SHOP_LIST_REQ,bytes,0,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientShopListAck',buffer))
        if tab.errNo == 0 then
        else
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientShopListNtf',buffer))
        if tab then
            if callback then
                callback(tab.shopList)
            end
        end
    end)
end

---购买商品
---@param goods int[] @ [1]=ShopItemData.id
---@param ntfFun fun()?
function ShopViewModel.SendBuyGoods(goods,ntfFun)
    local buyGoods = {
        goodsID = goods[1],
        buyNum = goods[2],
    }
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientBuyGoodsREQ',buyGoods))
    ItemControl.AckError = true
    ShopControl.AckError = true
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_BUY_GOODS_REQ,bytes,0,nil,ShopViewModel.ReceiveBuyGoodsACK,function(buffer, tag)
        if tag ~= 0 then
            return
        end
        local tab = assert(pb.decode('PBClient.ClientBuyGoodsNTF',buffer))
        print("购买商品NTF:"..serpent.block(tab))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---消耗物品
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
        ---添加物品
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---更新显示
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
        ---增加购买次数
        ShopControl.GetSingLeShopItemData(buyGoods.goodsID):AddBuyCount(goods[2])
        ---重新初始化加载图片数据
        SettingViewModel.LoadingImageInit()
        ---是否存在基金时效
        if tab.fundCard ~= nil then
            print("购买基金")
            PlayerControl.GetPlayerData().fundVersion = tab.fundCard.version
            PlayerControl.GetPlayerData().fundBuyTime = tab.fundCard.buyTime
        end
        if ntfFun then
            ntfFun()
        end

    end)
end
---购买商品
local m_buyGoods = {};
local m_buyGoodsCallback = nil;

function CardSendBuyGoodsImp()
    local buyGoods = {
        goodsID = m_buyGoods[1].id,
        buyNum = m_buyGoods[1].count,
    }
    table.remove(m_buyGoods, 1);
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientBuyGoodsREQ',buyGoods))
    ItemControl.AckError = true
    ShopControl.AckError = true
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_BUY_GOODS_REQ,bytes,1,nil,function(...)
        ShopViewModel.ReceiveBuyGoodsACK(...);
        if #m_buyGoods > 0 then
            MgrTimer.AddDelayNoName(0,function()
                CardSendBuyGoodsImp();
            end,nil)
        elseif nil ~= m_buyGoodsCallback then
            m_buyGoodsCallback();
            m_buyGoodsCallback = nil;
        end
    end,function(...)
        ShopViewModel.OnCardBuyGoodsNtf(...)
        ---增加购买次数
        ShopControl.GetSingLeShopItemData(tonumber(buyGoods.goodsID)):AddBuyCount()
    end)
end

function ShopViewModel.CardSendBuyGoods(goods, callback)
    if nil == goods or 0 == #goods then
        return;
    end
    m_buyGoods = goods;
    m_buyGoodsCallback = callback;
    CardSendBuyGoodsImp();
end

---购买回调
function ShopViewModel.OnCardBuyGoodsNtf(buffer, tag)
    if tag ~= 1 then
        return
    end
    local tab = assert(pb.decode('PBClient.ClientBuyGoodsNTF',buffer))
    ---消耗物品
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    ---添加物品
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
end

---购买回调
function ShopViewModel.ReceiveBuyGoodsACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBuyGoodsACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        if tab.errNo == ServerErrorCode.BuyGoods_515 then
            ItemControl.RequireBagItem()
        end
    end
end

--function ShopViewModel.Test(callBack)
--    PassportViewModel.SetPassesSeniorLock(true)
--    callBack()
--end

---飞游渠道购买商品
---@param goodsId number 付費商品id
function ShopViewModel.FlyFunBuyGoods(goodsId,callBack)
    MgrUI.Pop(UID.ChargeLoading_UI, {}, true)
    ---获取用户
    local player = PlayerControl.GetPlayerData()
    ---获取商品订单
    MgrNet.HttpGetOrderGenernal(player.UID,goodsId,function(info)
        print("zqx orderinfo:"..serpent.block(info))
        if info.code == 1 then
            ---获取订单成功，判断平台1、安卓谷歌支付 2、IOS谷歌支付 3、飞游支付 来创建透传
            local platform = MgrSdk.GetPlatform()
            ---判断是否为飞游订单逻辑
            platform = 3
            ---ServerId，账号服务器："100"，飞游服务器"101"
            ---拉起支付
            print("拉起支付")
            MgrSdk.FlyFunCharge(tostring(player.UID),player.nickname,tostring(player.level),"101","server",
                    info.data.cp_order_id,info.data.notifyUrl,platform,
                    info.data.cp_price,info.data.product_id,info.data.name,info.data.introduce,info.data.price_jpy,
                    function(request)
                        if MgrSdk.GetPlatform() == "2" then
                            local data = string.split(request,"|")
                            if data[1] == "0" then
                                print(string.format("商品%s,價格%s支付完畢,向服務器發送驗證",info.data.name,info.data.cp_price))
                                ShopViewModel.AddIOSPurchase(info.data.cp_order_id, data[2], data[3])
                                -- 向服务器提交apple支付验证数据
                                ShopViewModel.SendIOSReceipt(info.data.cp_order_id, data[2], data[3], callBack)
                            else
                                print(string.format("商品%s,價格%s支付异常：%s",info.data.name,info.data.cp_price,data[2]))
                            end
                            MgrUI.PopHide(UID.ChargeLoading_UI)
                            return
                        end
                        if request == "0" then
                            print(string.format("商品%s,價格%s支付完畢,等待服務器發放物品",info.data.name,info.data.cp_price))
                            if callBack then
                                callBack()
                            end
                        else
                            print(string.format("商品%s,價格%s支付异常：%s",info.data.name,info.data.cp_price,request))
                        end
                        MgrUI.PopHide(UID.ChargeLoading_UI)
                    end)
        else
            ---获取订单异常
            --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips4"),2},true)
            MgrUI.PopHide(UID.ChargeLoading_UI)
            print(string.format("code=%s,error:%s",info.code,info.message))
            MgrUI.Pop(UID.PopTip_UI, {MgrLanguageData.GetLanguageByKey(LanguageerrorLocalData.tab[info.code][2]) .. " InfoCode:" .. info.code, 1}, true)
            if callBack then
                callBack()
            end
        end
    end)
end

---注册商品推送
function ShopViewModel.RegisterGoodsNtf()
    MgrNet.RegisterNTF(MID.CLIENT_HAS_NEW_ORDER_INFO_NTF,function(buffer,tag)
        ---收到商品推送
        local info = assert(pb.decode('PBClient.ClientHasNewOrderInfoNTF',buffer))
        ---添加物品
        ItemControl.PushGroupItemData(info.allGoods,ItemControl.PushEnum.cover)
        ---添加充值金额
        ActivityControl.UpdateRecharge(info.events)
        ---增加购买次数
        ShopControl.PushGroupShopItem(info.shops)
        ---判断是否有商品表类型为2的,并更改其购买状态
        for i,v in pairs(info.shops) do
            if ShopLocalData.tab[v.shopID] ~= nil and ShopLocalData.tab[v.shopID].type == 2 then
                for key,value in ipairs(HomeViewModel.packageList) do
                    if value.ID == v.shopID then
                        value.Status = true
                    end
                end
            end
        end
        ---是否存在小月卡时效
        if info.card ~= nil then
            PlayerControl.GetPlayerData().monthCardBuyTime = info.card.buyTime
            PlayerControl.GetPlayerData().monthCardRemaining = info.card.remaining
        end
        if nil ~= info.cards then
            PlayerControl.GetPlayerData().newMonthCards = info.cards;
        end
        if nil ~= info.vigor then
            PlayerControl.GetPlayerData():PushVigor(info.vigor)
        end
        ---如果存在通行证经验
        if info.passesLevel ~= nil then
            PassportControl.PushPassportData(info.passesLevel)
            if MgrUI.GetCurUI().Uid == UID.Passes_UI then
                local ui = MgrUI.GetCurUI()
                ui:InitPassport()
            end
        end
        if MgrUI.GetCurUI().Uid == UID.PassesBuyPop_UI then
            local ui = MgrUI.GetCurUI()
            ui:InitPasses()
        end
        ---是否存在大月卡时效
        if info.bigCard ~= nil then
            PassportControl.PushPassport(info.bigCard.version,info.bigCard.buyTime)
            print("有购买时间和持续时间，请处理逻辑")
            if info.bigCard.buyTime ~= 0 and info.bigCard.version == ActivityLocalData.tab[20000][6] then
                PassportViewModel.SetPassesSeniorLock(true)
            end

            PlayerControl.GetPlayerData().bigMonthCardVersion = info.bigCard.version
            PlayerControl.GetPlayerData().bigMonthCardBuyTime = info.bigCard.buyTime
        end
        ---是否存在基金时效
        if info.FundCard ~= nil then
            print("购买基金")
            PlayerControl.GetPlayerData().fundVersion = info.FundCard.version
            PlayerControl.GetPlayerData().fundBuyTime = info.FundCard.buyTime
        end
        if MgrUI.GetCurUI().Uid == UID.Shop_UI then
            Event.Go("FreshChargeUI")
        end
        ---显示获得
        MgrUI.Pop(UID.ItemAchievePop_UI,{info.goods},true)
        ---InitPassport
        if PassportViewModel.ReceivedCallBack ~= nil then
            PassportViewModel.ReceivedCallBack()
        end
        ---首充请求
        Event.Go("ActivityReq")
        Event.Go("ShopHome_UI_ReloadScroll")
        Event.Go("Shop_UI_ChangeWallet")
        Event.Go("Home_UI_RefreshCoin")
        HomeViewModel.HomeUIPackagesBTNControl()
    end)
end
---请求随机商城数据
function ShopViewModel.RequestRandomData(callback)
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientGetRandShopItemREQ', { rev = "" }))
    MgrNet.SendReq(MID.CLIENT_GET_RAND_SHOP_ITEM_REQ,bytes,0,nil,ShopViewModel.RandomDataACK,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGetRandShopItemNTF',buffer))
        ShopControl.PushGroupRandomShopItem(tab.items,2)
        ---推送月卡数据
        if tab.card then
            PlayerControl.GetPlayerData().monthCardBuyTime = tab.card.buyTime
            PlayerControl.GetPlayerData().monthCardBuyTime = tab.card.remaining
        end
        if callback then
            callback()
        end
    end)
end
function ShopViewModel.RandomDataACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetRandShopItemACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{"",1},true)
    end
end
---随机商店购买
function ShopViewModel.BuyRandomGoods(goods,ntfFun)
    local buyGoods = {
        id = goods[1],
        time = goods[2],
        count = goods[3]
    }
    ShopViewModel.tNtfFun = ntfFun
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientBuyRandShopItemREQ',buyGoods))
    MgrNet.SendReq(MID.CLIENT_BUY_RAND_SHOP_ITEM_REQ,bytes,goods[3],nil,ShopViewModel.BuyRandomGoodsACK,ShopViewModel.BuyRandomGoodsNTF)
end
---随机商店购买验证回调
function ShopViewModel.BuyRandomGoodsACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBuyRandShopItemACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        ItemControl.EquipAckError = true
        ItemControl.AckError = true
        TaskControl.AckError = true
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 1 }, true)
        if tab.errNo == ServerErrorCode.BuyRandShopItem_515 then
            ItemControl.RequireBagItem()
        end
    end
end
---随机商店购买回调
function ShopViewModel.BuyRandomGoodsNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientBuyRandShopItemNTF',buffer))
    print("购买商品NTF:"..serpent.block(tab))
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---消耗物品
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    ---更新显示
    local tGoods = {}
    if tab.goods == nil then
        tGoods[1] = {goodsType = 5, goodsID = tab.equip[1].equipID, goodsNum = 1}
    else
        tGoods[1] = tab.goods[1]
        tGoods[1].goodsNum = tGoods[1].goodsNum
    end
    if tab.equip then
        ---添加装备到背包
        EquipControl.PushSingleEquipData(tab.equip[1])
    elseif tab.goods then
        ---添加物品
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    end
    MgrUI.Pop(UID.ItemAchievePop_UI,{tGoods},true)
    ---增加购买次数
    ShopControl.GetSingLeShopItemData(tab.id):AddBuyCount(tag)
    if ShopViewModel.tNtfFun then
        ShopViewModel.tNtfFun()
    end
end

---获取购买次数数据
function ShopViewModel.GetBuyNumber(_type,callBack) --type  0 只获取特殊商店(PVP购买次数、体力购买次数) 1 获取所有商店购买次数
    local BaseREQ  =
    {
        type = _type
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetBuyNumberREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_BUY_NUMBER_REQ,bytes,0,nil, ShopViewModel.BuyNumberACK,function(...)
        ShopViewModel.BuyNumberNTF(...,nil,callBack)
    end)
end

function ShopViewModel.BuyNumberACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetBuyNumberACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.UnLock("BuyProps")
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playercontrol_tips1"),2},true)
    end
end

function ShopViewModel.BuyNumberNTF(buffer, tag,callBack)
    local tab = assert(pb.decode('PBClient.ClientGetBuyNumberNTF',buffer))
    if tab.buyItem then
        ShopControl.PushGroupShopItem(tab.buyItem)
    elseif tab.dayItem then
        ShopControl.PushGroupShopItem(tab.dayItem)
    elseif tab.weekItem then
        ShopControl.PushGroupShopItem(tab.weekItem)
    elseif tab.monthItem then
        ShopControl.PushGroupShopItem(tab.monthItem)
    elseif tab.yearItem then
        ShopControl.PushGroupShopItem(tab.yearItem)
    elseif tab.unResetItem then
        ShopControl.PushGroupShopItem(tab.unResetItem)
    end
    PlayerControl.GetPlayerData().monthCardBuyTime = tab.monthCardBuyTime
    PlayerControl.GetPlayerData().monthCardRemaining = tab.monthCardRemaining
    PlayerControl.GetPlayerData().bigMonthCardBuyTime = tab.bigMonthCardBuyTime
    PlayerControl.GetPlayerData().bigMonthCardVersion = tab.bigMonthCardVersion
    if tab.bigMonthCardBuyTime ~= 0 then
        PassportViewModel.SetPassesSeniorLock(true)
    end
    if nil ~= tab.cards then
        PlayerControl.GetPlayerData().newMonthCards = tab.cards;
    end
    if callBack then
        callBack()
    end
end

function ShopViewModel.RestoreIOS()
    if MgrSdk.GetPlatform() ~= "2" then
        return
    end
    ShopViewModel.IOSPayCache = {}
    local str = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "_IOSPurchase")
    if str ~= "" then
        local json = RapidJson.decode(str)
        ShopViewModel.IOSPayCache = json
        for key, value in pairs(json) do
            -- 向服务器提交apple支付验证数据
            local params = string.split(value, "|")
            ShopViewModel.SendIOSReceipt(key, params[1], params[2])
        end
    end
end

function ShopViewModel.AddIOSPurchase(order, receipt, transactionID)
    ShopViewModel.IOSPayCache[order] = receipt.."|"..transactionID
    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "_IOSPurchase", RapidJson.encode(ShopViewModel.IOSPayCache))
end

function ShopViewModel.RemoveIOSPurchase(order)
    ShopViewModel.IOSPayCache[order] = nil
    UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "_IOSPurchase", RapidJson.encode(ShopViewModel.IOSPayCache))
end

function ShopViewModel.SendIOSReceipt(order, receipt, transactionID, callback)
    local info = RapidJson.decode(receipt)
    -- UnityEngine.DebugEx.LogError("zqx receipt:"..serpent.block(info))
    MgrNet.HttpPurchaseVerify(PlayerControl.GetPlayerData().UID, order, info.Payload, transactionID, function (ret)
        if ret.code == 1 then
            -- UnityEngine.DebugEx.LogError(string.format("訂單%s驗證完畢,等待服務器發放物品",order))
            ShopViewModel.RemoveIOSPurchase(order)
            if callback then
                callback()
            end
        else
            if ret.code ~= 100 then
                ShopViewModel.RemoveIOSPurchase(order)
            end
            UnityEngine.DebugEx.LogError(string.format("訂單%s驗證錯誤:%s-%s",order, ret.code, ret.message))
        end
    end)
end

function ShopViewModel.FindDollerPrice(id)
    local price = 0
    for i,v in pairs(PaidgoodsLocalData.tab) do
        ---找到价格
        if v[3] == id then
            price = v[8]
            break
        end
    end
    return price
end

return ShopViewModel