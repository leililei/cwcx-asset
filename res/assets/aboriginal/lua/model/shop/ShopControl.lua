require("Model/Shop/Data/ShopData")
require("Model/Shop/Data/ShopChildData")
require("Model/Shop/Data/ShopItemData")
require("LocalData/ShopLocalData")
require("LocalData/ShoptypeLocalData")
require("LocalData/SteamLocalData")
require("LocalData/RandomshopLocalData")

---商店管理器
ShopControl = {}

--region Const Data

--- 一些硬编码数据
--- ChildShopType 也即 ShopType2
ShopControl.ConstData = {
    -- 全部用现金购买的商店
    CASH_CHILD_SHOP_TYPES = { 100, 101, 102, 104, },
}

--endregion Const Data

ShopControl.AckError = false

---@type ShopData[] 商店数据
local ShopList = {}
---@class ShopInfo 商品信息
---@field shopID number 商品id
---@field shopCount number 购买次数
local ShopInfo = {
    shopID = 1,
    shopCount = 2,
}
---初始化商店数据
function ShopControl.InitShopData()
    for i, config in pairs(ShopLocalData.tab) do
        if ShopList[config.type_1] == nil then
            ---不存在商店则新增
            ShopList[config.type_1] = ShopData.New()
            ShopList[config.type_1]:PushConfig(config)
        else
            ---存在商店则添加子商店
            ShopList[config.type_1]:PushShopChild(config)
        end
    end
    for i, v in pairs(RandomshopLocalData.tab) do
        if ShopList[v.type_1] == nil then
            ---不存在商店则新增
            ShopList[v.type_1] = ShopData.New()
            ShopList[v.type_1]:PushConfig(v)
        else
            ---存在商店则添加子商店
            ShopList[v.type_1]:PushShopChild(v)
        end
    end
end

function ShopControl.InitAllShopTime(shopList)
    for i,v in pairs(shopList) do
        local config = ShopLocalData.tab[v.id]
        if config then
            if config.type == 3 then   --限时打折商品
                ShopList[config.type_1].childShop[config.type_2].shopItems[config.id]:ItemDiscountTime(v)
            end
        end
    end
end

---商店子类型
ShopControl.childShopType = {
    activity = 305      --活动
}
---获取某类型商店商品数据
---@return ShopItemData[]
function ShopControl.GetCertainTypeShopData(type)    --商店类型/商店子类型
    --local array = {}
    for i,v in pairs(ShopList) do
        for j,val in pairs(v.childShop) do
            if val.id == type then
                return val.shopItems
            end
        end
    end
end

---@param infos ShopInfo[] 刷新一组商品信息
function ShopControl.PushGroupShopItem(infos)
    if infos == nil or #infos == 0 then
        Log.Error("商品推送数据为空")
        return
    end
    for i, info in pairs(infos) do
        if info ~= nil then
            ShopControl.PushSingleShopItem(info)
        end
    end
end
---@param info ShopInfo 刷新单个商品信息
function ShopControl.PushSingleShopItem(info)
    local conf = ShopLocalData.tab[info.shopID]
    if conf == nil then
        Log.Error(string.format("未找到对应商品,id:%s",info.shopID))
        return
    end
    if ShopList[conf.type_1] == nil then
        Log.Error(string.format("未找到对应商店,id:%s",conf.type_1))
        return
    end
    if ShopList[conf.type_1].childShop[conf.type_2] == nil then
        Log.Error(string.format("未找到对应子商店,id:%s",conf.type_2))
        return
    end
    if ShopList[conf.type_1].childShop[conf.type_2].shopItems[info.shopID] == nil then
        Log.Error(string.format("未找到对应子商店中对应商品,id:%s",info.shopID))
        return
    end
    ShopList[conf.type_1].childShop[conf.type_2].shopItems[info.shopID]:ResetBuyInfo(info)
end
---@return ShopData[] 获取所有商店数据
function ShopControl.GetAllShopData()
    return ShopList
end

---@return ShopData 获取商店数据
function ShopControl.GetSingleShopData(id)
    if ShopList[id] == nil then
        Log.Error(string.format("找不到当前商店，请检查，商店id:%s",id))
        return nil
    end
    return ShopList[id]
end

---@return ShopItemData 获取商品数据
function ShopControl.GetSingLeShopItemData(id)
    for i, shop in pairs(ShopList) do
        for _i, cs in pairs(shop.childShop) do
            for idx, item in pairs(cs.shopItems) do
                if item.id == id then
                    return item
                end
            end
        end
    end
    return nil
end
function ShopControl.PushGroupRandomShopItem(infos, itemType)
    if infos == nil or #infos == 0 then
        Log.Error("商品推送数据为空")
        return
    end
    for i, info in pairs(infos) do
        if info ~= nil then
            ShopControl.PushRandomShopItem(info, itemType)
        end
    end
end
function ShopControl.PushRandomShopItem(info, itemType)
    local conf = RandomshopLocalData.tab[info.id]
    if conf == nil then
        Log.Error(string.format("未找到对应商品,id:%s",info.shopID))
        return
    end
    if ShopList[conf.type_1] == nil then
        Log.Error(string.format("未找到对应商店,id:%s",conf.type_1))
        return
    end
    if ShopList[conf.type_1].childShop[conf.type_2] == nil then
        Log.Error(string.format("未找到对应子商店,id:%s",conf.type_2))
        return
    end
    if ShopList[conf.type_1].childShop[conf.type_2].shopItems[info.id] == nil then
        Log.Error(string.format("未找到对应子商店中对应商品,id:%s",info.shopID))
        return
    end
    if itemType == 1 then
        ShopList[conf.type_1].childShop[conf.type_2].shopItems[info.id]:ResetBuyInfo(info)
    elseif itemType == 2 then
        ShopList[conf.type_1].childShop[conf.type_2].shopItems[info.id]:SetRandomShopItemData(info)
    end
end
---商城皮肤列表
function ShopControl.GetShopSkinData()
    --左边商店标签
    local tShopItemsList = ShopViewModel.SortChildData(10000)
    ---底部皮肤
    ---@type ShopItemData[]
    local skins = {}
    for _, v in pairs(tShopItemsList) do
        local tab = {}
        local index = 1
        
        for i, value in pairs(v.shopItems) do
            if Global.isMiddleTime(value.sellSTime, value.sellETime) then
                tab[index] = value
                index = index + 1
            end
        end
        table.sort(tab,function(a,b)
            if a.sortIdx < b.sortIdx then
                return true
            else
                return false
            end
        end)
        tab[#tab + 1] = {}
        tab[#tab + 1] = {}
        skins[v.id] = tab
    end
    return skins[1000]
end
---刷新时间
function ShopControl.RefreshTime()
    for i,v in pairs(ShopLocalData.tab) do
        local shopData = ShopList[v.type_1].childShop[v.type_2].shopItems[v.id]
        if shopData.timeId ~= 0 and shopData.sellSTime == 0 then   --限时打折商品
            shopData:RefreshTime()
        end
    end
end
 
function ShopControl.Clear()
    ShopList = {}
end

return ShopControl