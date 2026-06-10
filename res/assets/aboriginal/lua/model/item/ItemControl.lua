require("Model/Base/ItemDataBase")
require("Model/Item/Data/ItemData")
require("Model/Item/Data/CoreChipData")
require("Model/Item/Data/HideItemData")
require("Model/Item/Data/RandomItemData")
require("LocalData/ItemLocalData")
---物品配置表
require("LocalData/CorechipLocalData")
require("LocalData/HideLocalData")
require("LocalData/SynthesisLocalData")
require("LocalData/RoleuiskinLocalData")
---物品管理器
ItemControl = {}

---@alias GoodsTypeEnum int
GoodsTypeEnum = {
    Item = 1, -- 普通物品
    CoreChip = 2, -- 碎片
    Core = 3, -- 核心
    HideItem = 4, -- 隐藏物品
    Equip = 5, -- 共鸣装备(也是随机物品)
}

ItemControl.AckError = false
ItemControl.EquipAckError = false

---@type ItemData[] 物品数据
local ItemDataList = {}
---@type CoreChipData[] 核心碎片数据
local CoreChipDataList = {}
---@type HideItemData[] 隐藏物品数据
local HideItemDataList = {}
---@type RandomItemData[] 随机物品数据
local RandomItemList = {}
---填充类型
---@alias ItemPushEnum int
ItemControl.PushEnum = {
    none = 0, ---空
    cover = 1, ---覆盖
    add = 2, ---添加
    consume = 3, ---消耗
}
---限时道具
local LimitItemList = {}
-------------提供接口-------------
---获取背包含数量为0的无类型物品
function ItemControl.GetAllItems()
    return ItemDataList
end

---获取背包物品数据
function ItemControl.GetItemByID(ID)
    if ID == nil then
        return
    end
    if ItemDataList[ID] then
        return ItemDataList[ID]
    else
        local goods = {
            goodsType = 1,
            goodsID = ID,
            goodsNum = 0
        }
        ItemDataList[ID] = ItemData.New()
        ItemDataList[ID]:PushData(goods, ItemControl.PushEnum.none)
        return ItemDataList[ID]
    end
end

---获取本地物品数据
function ItemControl.GetItemByType(type, id)
    if type == 1 then
        return ItemLocalData.tab[id]
    elseif type == 2 then
        return CorechipLocalData.tab[id]
    elseif type == 3 then
        return CoreLocalData.tab[id]
    elseif type == 4 then
        return HideLocalData.tab[id]
    elseif type == 5 then
        return ItemControl.GetItemByIdAndType(id, type)
    end
end

---获取背包物品数据
---@return ItemDataBase
function ItemControl.GetItemByIdAndType(ID, type)
    local item = nil
    if type == 1 then
        item = ItemDataList[ID]
    elseif type == 2 then
        item = CoreChipDataList[ID]
    elseif type == 3 then
    elseif type == 4 then
        item = HideItemDataList[ID]
    elseif type == 5 then
        item = RandomItemList[ID]
    end
    if item then
        return item
    else
        local goods = {
            goodsType = type,
            goodsID = ID,
            goodsNum = 0
        }
        if type == 1 then
            ItemDataList[ID] = ItemData.New()
            ItemDataList[ID]:PushData(goods, ItemControl.PushEnum.none)
            return ItemDataList[ID]
        elseif type == 2 then
            CoreChipDataList[ID] = CoreChipData.New()
            CoreChipDataList[ID]:PushData(goods, ItemControl.PushEnum.none)
            return CoreChipDataList[ID]
        elseif type == 3 then
        elseif type == 4 then
            HideItemDataList[ID] = HideItemData.New()
            HideItemDataList[ID]:PushData(goods, ItemControl.PushEnum.none)
            return HideItemDataList[ID]
        elseif type == 5 then
            RandomItemList[ID] = RandomItemData.New()
            RandomItemList[ID]:PushData(goods, ItemControl.PushEnum.none)
            return RandomItemList[ID]
        end
    end
end

function ItemControl.ParsePriceString(priceStr)
    if nil == priceStr then
        UnityEngine.DebugEx.LogError("ItemControl.ParsePriceString. invalid price string: nil");
        return nil;
    end
    local prices = string.split(priceStr, "_");
    if #prices < 3 then
        UnityEngine.DebugEx.LogError("ItemControl.ParsePriceString. invalid price string: " .. priceStr);
        return nil;
    end
    return {
        item = ItemControl.GetItemByIdAndType(tonumber(prices[2]), tonumber(prices[1])),
        price = tonumber(prices[3]);
    }
end

---@return ItemData[] 获取背包数量类型不为的0物品(true键值对id为key,false数组)
function ItemControl.GetNotZeroItems(isList)
    local kv = {}
    local array = {}
    ---筛除空物品
    for k, v in pairs(ItemDataList) do
        if (v.count > 0 or v.giftappear == 1) and v.goodsType ~= 0 then     ---数量大于0或者等于0也显示 两种情况
            kv[k] = v
            table.insert(array, v)
        end
    end
    if isList then
        return kv
    else
        return array
    end
end

function ItemControl.GetHideDataList()
    local array = {}
    for i, v in pairs(HideLocalData.tab) do
        if v.appear == 1 then
            table.insert(array, v)
        elseif v.appear == 2 and ItemControl.GetItemByIdAndType(v.id,4).goods.goodsNum > 0  then
            table.insert(array, v)
        end
    end
    return array
end

--勋章百分比统计用
function ItemControl.GetHideDataListMedal()
    local array = {}
    for i, v in pairs(HideLocalData.tab) do
        if v.appear == 1 then
            table.insert(array, v)
        end
    end
    return array
end

---@return CoreChipData[] 获取背包核心碎片
function ItemControl.GetCoreChips()
    local array = {}
    for i, v in pairs(CoreChipDataList) do
        table.insert(array, v)
    end
    return array
end
---@return HideItemData[] 获取隐藏背包数据
function ItemControl.GetHideData()
    local array = {}
    for i, v in pairs(HideItemDataList) do
        table.insert(array, v)
    end
    return array
end
---获取好友物品数据
function ItemControl.GetFriendItemData()
    local friendItems = {}
    for i,v in pairs(ItemLocalData.tab) do
        if v.costeffect ~= "0" then
            local str = string.split(v.costeffect,"_")
            if str[1] == "1" then
                local item = ItemData.New()
                local goods = {
                    goodsType = 1,
                    goodsID = v.id,
                    goodsNum = 0
                }
                item:PushData(goods, ItemControl.PushEnum.none)
                table.insert(friendItems,item)
            end
        end
    end
    return friendItems
end
---@param goodsGroup goods[] 填充多个物品到道具背包
---@param pushType number 填充类型（覆盖、添加、删除）
function ItemControl.PushGroupItemData(goodsGroup, pushType)
    if not goodsGroup then
        print("推送道具为空")
        return
    end
    for idx, goods in pairs(goodsGroup) do
        ItemControl.PushSingleItemData(goods, pushType)
    end
end

local m_itemsToUse = {};
local m_usingItem = false;

function UseItemImp()
    if 0 == #m_itemsToUse then
        m_usingItem = false;
        return;
    end
    local item = m_itemsToUse[1];
    table.remove(m_itemsToUse, 1);
    ItemControl.UseSelectGoods(item.goods, item.target, function(err, msgId)
        if not err then
            Log.Error("使用类型5失败")
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"), err), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseACK', buffer))
        if tab.errNo ~= 0 then
            Log.Error(string.format("使用物品失败，error = %s", tab.errNo))
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("ItemControl_network_anomaly"), tab.errNo), 1 }, true)
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
        ---更新角色
        local heroList = {}
        if tab.heros ~= nil then
            for _, h in pairs(tab.heros) do
                if h.hero ~= nil then
                    heroList[#heroList + 1] = h.hero
                end
                if h.goods ~= nil then
                    ---更新道具
                    ItemControl.PushGroupItemData(h.goods, ItemControl.PushEnum.add)
                end
            end
        end
        if #heroList > 0 then
            MgrUI.CloseAllPop()
            MgrUI.Pop(UID.DrawResultPop_UI, { heroList }, true)
        end
        for k,v in pairs(heroList) do
            local hd = HeroControl.GetRoleDataByID(v.heroID)
            if hd.lockState == false then
                HeroControl.PushSingleHeroData(v)
            end
        end
        MgrTimer.AddDelayNoName(1, UseItemImp, nil);
    end)
end

function TryUseItem(goods)
    local conf = Global.GetLocalDataByGoods(goods)
    if nil == conf then
        Log.Error("配置表中未找到该物品ID" .. goods.goodsID .. "类型" .. goods.goodsType);
        return false;
    end
    if 5 ~= conf.use and 8 ~= conf.use then
        return false;
    end
    -- 立即使用
    local falls = string.split(conf.fall, "_");
    table.insert(m_itemsToUse, {
        goods = {
            goodsType = goods.goodsType,
            goodsID = goods.goodsID,
            goodsNum = 1,
        },
        target = {
            goodsType = tonumber(falls[1]),
            goodsID = tonumber(falls[2]),
            goodsNum = tonumber(falls[3]),
        };
    });
    if false == m_usingItem then
        m_usingItem = true;
        UseItemImp();
    end
    return true;
end

---@param goods goods 填充单个物品到背包
---@param pushType ItemPushEnum 填充多个物品到道具背包
function ItemControl.PushSingleItemData(goods, pushType)
    local ids = {60003009, 60003016}
    if goods.goodsNum == 0 and (goods.goodsID < ids[1] or goods.goodsID > ids[2]) then
        ---排除数量为0的物品
        Log.Error("推送道具数量为0,道具ID：" .. goods.goodsID)
        return
    end
    -- 检测是否需要立刻使用
    if true == TryUseItem(goods) then
        return;
    end
    if goods.goodsType == 1 then
        ---添加到道具背包
        if not ItemDataList[goods.goodsID] then
            ---背包没有物品直接添加
            ItemDataList[goods.goodsID] = ItemData.New()
        end
        ---刷新数据
        ItemDataList[goods.goodsID]:PushData(goods, pushType)
    elseif goods.goodsType == 2 then
        ---添加到核心碎片背包
        if not CoreChipDataList[goods.goodsID] then
            ---背包没有物品直接添加
            CoreChipDataList[goods.goodsID] = CoreChipData.New()
        end
        ---刷新数据
        CoreChipDataList[goods.goodsID]:PushData(goods, pushType)
    elseif goods.goodsType == 3 then
        ---核心不处理，不允许在此处添加核心，GoodsItem内核心数据只用作显示
    elseif goods.goodsType == 4 then
        ---添加到隐藏道具背包
        if not HideItemDataList[goods.goodsID] then
            ---隐藏背包没有物品直接添加
            HideItemDataList[goods.goodsID] = HideItemData.New()
        end
        ---刷新数据
        HideItemDataList[goods.goodsID]:PushData(goods, pushType)
        ---解锁皮肤
        if goods.goodsID ~= nil and HeroControl.GetSkinDataBySkinId(goods.goodsID) then
            HeroControl.ChangeSkinLockState(goods.goodsID,true)
        end
    elseif goods.goodsType == 5 then
        ---添加到随机道具背包
        if not RandomItemList[goods.goodsID] then
            ---随机背包没有物品直接添加
            RandomItemList[goods.goodsID] = RandomItemData.New()
        end
        ---刷新数据
        RandomItemList[goods.goodsID]:PushData(goods, pushType)
    else
        Log.Error("非道具、核心碎片请勿添加到ItemData")
    end

end

function ItemControl.RemoveItem(uid, type)
    if type == 1 then
        if ItemDataList[uid] then
            ItemDataList[uid] = nil
        end
    elseif type == 2 then
        if CoreChipDataList[uid] then
            CoreChipDataList[uid] = nil
        end
    elseif type == 3 then
        ---核心不处理，不允许在此处添加核心，GoodsItem内核心数据只用作显示
    elseif type == 4 then
        if HideItemDataList[uid] then
            HideItemDataList[uid] = nil
        end
    elseif type == 5 then
        if RandomItemList[uid] then
            RandomItemList[uid] = nil
        end
    else
        Log.Error("非道具、核心碎片请勿添加到ItemData")
    end
end

---添加道具监听（物品发送改变回调）
function ItemControl.AddItemNotify(uid, type, tag, func)
    if type == 1 then
        if not ItemDataList[uid] then
            ---无此物品时创建数量为零的物品监听
            ItemDataList[uid] = ItemData.New()
        end
        ItemDataList[uid]:AddNotify(tag, func)
    elseif type == 2 then
        Log.Error("碎片类暂时不允许添加监听")
    else
        Log.Error("请输入类型再添加监听")
    end
end

---使用物品
---@param goods goods 物品
---@param funReq function 发送回调
---@param funcACK function 服务器确认回调
---@param funcNTF function 服务器数据回调
function ItemControl.UseGoods(goods, funReq, funcACK, funcNTF)
    local BaseREQ = {
        goods = goods
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientUseGoodsREQ', BaseREQ))
    ItemControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_USE_GOODS_REQ, bytes, 0, funReq, funcACK, funcNTF)
end
---选择使用物品
---@param goods goods 物品
---@param target goods 目标物品
---@param funReq function 发送回调
---@param funcACK function 服务器确认回调
---@param funcNTF function 服务器数据回调
function ItemControl.UseSelectGoods(goods, target, funReq, funcACK, funcNTF)
    local BaseREQ = {
        goods = goods,
        target = target
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientUseGoodsChooseREQ', BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_USE_GOODS_CHOOSE_REQ, bytes, 0, funReq, funcACK, funcNTF)
end

function ItemControl.GetHasMedalNum() --TODO
    local count = 0
    for i, v in pairs(HideItemDataList) do
        --if HideLocalData.tab[i].appear == 1 and v.count >= 1 then
        --    count = count + 1
        --end
        local data = HideLocalData.tab[i]
        if data then
            if data.appear == 1 and v.count >= 1 then
                count = count + 1
            end
        else
            UnityEngine.DebugEx.LogError(string.format("配表中缺少隐藏物品%d", i))
        end
    end
    return count
end

---判断是否拥有该家园看板娘
function ItemControl.IsThereAnyAkrItem(id)
    for key, value in pairs(HideItemDataList) do
        if key==id and value.count > 0 then
            return true
        end
    end
    return false
end

---获得缩进的物品数量(数量超过五位数就按K显示，例:50000 —— 50k)
function ItemControl.GetItemConciseCount(ID)
    if ItemDataList[ID] then
        if ItemDataList[ID].count > 0 and ItemDataList[ID].count < 10000 then
            return ItemDataList[ID].count
        end
        if ItemDataList[ID].count >= 10000 and ItemDataList[ID].count < 10000000 then
            return JNStrTool.numberAbbr(tonumber(ItemDataList[ID].count)) --math.floor(tonumber(ItemDataList[ID].count)/1000).."K"
        elseif ItemDataList[ID].count >= 10000000 and ItemDataList[ID].count < 1000000000 then
            return JNStrTool.numberAbbr(tonumber(ItemDataList[ID].count)) --math.floor(tonumber(ItemDataList[ID].count)/10000).."w"
        elseif ItemDataList[ID].count >= 1000000000 then
            return JNStrTool.numberAbbr(tonumber(ItemDataList[ID].count)) --math.floor(tonumber(ItemDataList[ID].count)/100000000).."e"
        else
            return 0
        end
    else
        return 0
    end
end



--function ItemControl.PushGroupRandomItemData(goodsGroup, pushType)
--    if not goodsGroup then
--        print("推送道具为空")
--        return
--    end
--    for idx, goods in pairs(goodsGroup) do
--        ItemControl.PushRandomItemData(goods, pushType)
--    end
--end
--
--function ItemControl.PushRandomItemData(goods, pushType)
--    ---添加到随机道具背包
--    if not RandomItemList[goods.goodsID] then
--        ---随机背包没有物品直接添加
--        RandomItemList[goods.goodsID] = RandomItemData.New()
--    end
--    ---刷新数据
--    RandomItemList[goods.goodsID]:PushData(goods, pushType)
--end

---多选一兑换道具
function ItemControl.UseOptionalGoods(_goods,_target,callBack)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientUseGoodsChooseREQ',{
        goods = _goods,
        target = _target
    }))
    ---发送数据（发送成功后更新显示，发送不成功不更新)
    MgrNet.SendReq(MID.CLIENT_USE_GOODS_CHOOSE_REQ,bytes,0,nil,function(...)
        ItemControl.UseOptionalGoodsAck(...)
    end,function(...)
        ItemControl.UseOptionalGoodsNtf(...)
        if callBack then
            callBack()
        end
    end)
end

function ItemControl.UseOptionalGoodsAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseACK', buffer))
    local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseACK',buffer))
    if tab.errNo ~= 0 then
        Log.Error(string.format("使用物品失败，error = %s", tab.errNo))
        MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("ItemControl_network_anomaly"), tab.errNo), 1 }, true)
        ---网络异常处理（待处理）
    end
end

function ItemControl.UseOptionalGoodsNtf(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    ---更新道具
    ItemControl.PushGroupItemData(tab.goods, ItemControl.PushEnum.add)
    ---消耗道具
    ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
    ---更新角色
    local heroList = {}
    if tab.heros ~= nil then
        for _, h in pairs(tab.heros) do
            if h.hero ~= nil then
                local hd = HeroControl.GetRoleDataByID(h.hero.heroID)
                if hd.lockState == false then
                    HeroControl.PushSingleHeroData(h.hero)
                end
                heroList[#heroList + 1] = h.hero
            else
                ItemControl.PushSingleItemData(h.goods, ItemControl.PushEnum.add)
            end
        end
    end
    if #heroList > 0 then
        MgrUI.CloseAllPop()
        MgrUI.Pop(UID.DrawResultPop_UI, { heroList }, true)
    end
    if tab.goods ~= nil then
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
    end
end

---发送请求背包数据
function ItemControl.RequireBagItem(callback)
    local table = {
    }
    local buffer = assert(pb.encode('PBClient.ClientGoodsREQ',table))
    MgrNet.SendReq(MID.CLIENT_GOODS_REQ,buffer,-1,nil,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGoodsACK',buffer))
        if tab.errNo ~= 0 then
            print("请求背包数据失败")
            return
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGoodsNTF',buffer))
        PlayerControl.PushExpand(tab.expand)
        ItemControl.PushGroupItemData(tab.goods)
        CoreControl.PushGroupCoreData(tab.armor)
        if callback then
            callback()
        end
    end)
end
---限时道具
---//LimitGoodsItem 道具
---message LimitGoodsItem {
---  required int32 goodsType = 1;   // 物品类型
---  required int32 goodsID = 2;     // 物品id
---  required int32 goodsNum = 3;    // 物品数量
---  required int64 ETime = 4;    // 过期时间
---}
function ItemControl.PushLimitGoods(goodsGroup,pushType)
    if goodsGroup==nil or next(goodsGroup) == nil then
        return
    end
    for idx, goods in pairs(goodsGroup) do
        if LimitItemList[goods.goodsType] == nil then
            LimitItemList[goods.goodsType] = {}
        end
        LimitItemList[goods.goodsType][goods.goodsID] = goods
    end
    ItemControl.PushGroupItemData(goodsGroup,pushType)
end
---获取限时道具
function ItemControl.GetLimitItemByID(_goodsType,_goodsId)
    if LimitItemList[_goodsType] == nil then
        return nil
    end
    return LimitItemList[_goodsType][_goodsId]
end

function ItemControl.Clear()
    ItemDataList = {}
    CoreChipDataList = {}
    HideItemDataList = {}
    RandomItemList = {}
    LimitItemList = {}
end

return ItemControl