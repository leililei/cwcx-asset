---@class Event4ShopData 外传活动商店数据
Event4ShopData = Class("Event4ShopData")
-------------构造方法-------------
function Event4ShopData:ctor(id)
    local config = GashaponLocalData.tab[id]
    self.id = id
    self.actId = config[2]    --活动id
    self.type = config[3]     --类型 1普通2无限
    self.frontId = config[4]   --上一商店id
    self.pool = config[5]     --商店池id
    self.unlockItem = config[6]   --解锁所需物品id
    self.price = config[7]    --单抽价格
    self.labelPic = config[8]    --标签图
    self.tabPic = config[9]    --预览底图
    self.nextId = config[10]   --下一商店id
    self.unlockType = config[11]        ---解锁类型（0 需要关键道具解锁,1 需要卡池抽空解锁）
end

---获取池子数据
function Event4ShopData:GetPoolData(_specialItem)
    local data = DropLocalData.tab[self.pool]
    local str = string.split(data[4],",")
    local idx = #_specialItem+1
    local arr = {}
    local sortID = idx
    local isSpecialItem = false
    for k,v in ipairs(str) do
        if arr[v] == nil then
            local tItemStrD = string.split(v,"_")
            for i, itemData in ipairs(_specialItem) do
                local special = string.split(itemData,"_")
                if special[1] == tItemStrD[1] and special[2] == tItemStrD[2] then
                    sortID = idx
                    idx = i
                    isSpecialItem = true
                end
            end
            if not isSpecialItem then
                idx = sortID + 1
            else
                idx = idx + 1
            end
            arr[v] = {
                item = ItemControl.GetItemByIdAndType(tonumber(tItemStrD[2]),tonumber(tItemStrD[1])),
                count = tonumber(tItemStrD[3]),
                totalCount = 1,
                sort = idx,
                str = v
            }
        else
            arr[v].totalCount = arr[v].totalCount + 1
        end
    end
    local tab = {}
    for k,v in pairs(arr) do
        table.insert(tab,v)
    end
    Global.Sort(tab, { "sort" },false)
    return tab
end

---获取货币数据
function Event4ShopData:GetCurrencyData()
    local data = ItemControl.GetItemByIdAndType(tonumber(string.split(self.price,"_")[2]),tonumber(string.split(self.price,"_")[1]))
    if data then
        return data
    end
    return nil
end

return Event4ShopData