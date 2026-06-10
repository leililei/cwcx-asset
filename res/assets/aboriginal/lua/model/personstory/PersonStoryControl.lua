require("LocalData/RoleuiskincompletedLocalData")
require("Model/PersonStory/Data/PersonStoryData")
require("Model/Event4/Data/Event4ShopData")

---个人剧情管理器
PersonStoryControl = {}

---@type EventRaidData 个人剧情活动数据
local PersonInfo = nil
---@type ActivityData 活动数据
local PersonActData = nil
---@type PersonStoryData 个人剧情皮肤数据
local PersonSkinData = {}
---活动章节列表
local ChapterData = {}
---战斗章节列表
local BattleChapter = {}
---剧情章节数据
local PlotChapter = nil
---@type Event4ShopData 扭蛋池数据
local ShopInfo = {}
---当前蛋池id
local CurPoolId = nil
---蛋池剩余道具
local ClientPoolItems = nil
---特殊物品列表
local SpecialItems = {}
---扭蛋结果是否包含特殊道具roleBonus
local isContainsSpecial = false
---角色加成数据
local RoleUpData = {
    --UP角色
    RoleUp = {},
    --UP角色道具
    RoleUpItem = {}
}
---是否进入个人剧情活动
PersonStoryControl.InPerson = false

function PersonStoryControl.Init()
    for k,v in pairs(ActivityLocalData.tab) do
        if v[2] == ActivityControl.activityTypeEnum.PERSON_STORY then
            PersonInfo = EventRaidData.New()
            PersonInfo:PushData(v[1])
        end
    end
    for i, v in pairs(RoleuiskincompletedLocalData.tab) do
        PersonSkinData[i] = PersonStoryData.New(v)
    end
    
    PersonActData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.PERSON_STORY)
    --角色加成数据
    PersonStoryControl.InitRoleUpData()
    --扭蛋池
    PersonStoryControl.InitShopData()
end
---打开个人剧情主界面
function PersonStoryControl.OpenHome()
    PersonStoryControl.InPerson = true
    if UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "PersonStoryPlot"..PersonInfo.id) ~= "1" and PersonInfo.plot ~= "0" then
        PlotViewModel.OpenPlotUI(PersonInfo.plot,function()
            MgrUI.GoHide(UID.PersonStory_UI)
        end,true,nil)
        UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "PersonStoryPlot"..PersonInfo.id,"1")
    else
        MgrUI.GoHide(UID.PersonStory_UI)
    end
end
---打开剧情界面
function PersonStoryControl.OpenPlotUI()
    MgrUI.GoHide(UID.PersonPlot_UI)
end
---打开扭蛋商店界面
function PersonStoryControl.OpenShopUI()
    if CurPoolId == 0 then
        local tCurPoolId = ShopInfo[1].id
        PersonStoryControl.GameUp(PersonActData.activityId,tCurPoolId,function()
            MgrUI.GoHide(UID.PersonShop_UI)
        end)
    else
        MgrUI.GoHide(UID.PersonShop_UI)
    end
end
---角色加成数据
function PersonStoryControl.InitRoleUpData()
    if PersonActData.roleBonus == nil then
        UnityEngine.DebugEx.Log("角色加成数据找不到")
        return
    end
    local tRolelist = {}
    for i, v in ipairs(PersonActData.roleBonus) do
        for j, curUp in ipairs(v.roleBonusRole) do
            if tRolelist[curUp.roleID] == nil then
                tRolelist[curUp.roleID] = {}
                
                table.insert(RoleUpData.RoleUp, curUp.roleID)
            end
            for n, itemData in ipairs(curUp.roleBonusItem) do
                if tRolelist[curUp.roleID][itemData.item] == nil then
                    local tData = {
                        roleID = curUp.roleID,
                        item = itemData.item,
                        BonusPer = itemData.BonusPer
                    }
                    tRolelist[curUp.roleID][itemData.item] = itemData.BonusPer
                    table.insert(RoleUpData.RoleUpItem,tData)
                end
            end
        end
    end
end

---关卡角色额外掉落奖励
function PersonStoryControl.GetRoleUpData()
    return RoleUpData
end

---@return EventRaidData 获取个人剧情数据
function PersonStoryControl.GetPersonData()
    return PersonInfo
end

---@return ActiveChapterData
---活动章节列表
function PersonStoryControl.GetChapterData()
    if #ChapterData == 0 then
        ChapterData = ActiveChapterControl.GetChapterData(PersonInfo.chapterId)
    end

    return ChapterData
end
---战斗章节列表
function PersonStoryControl.GetBattleChapter()
    if #BattleChapter == 0 then
        local tChapterData = PersonStoryControl.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.Ticket then
                table.insert(BattleChapter, v[1])
            end
        end
    end

    return BattleChapter
end
---根据章节ID，获取关卡列表
function PersonStoryControl.GetLevelByChapterId(_id)
    
    return ChapterData[_id]
end
---获取剧情章节
function PersonStoryControl.GetPlotChapter()
    if PlotChapter == nil then
        local tChapterData = PersonStoryControl.GetChapterData()
        for i, v in ipairs(tChapterData) do
            if v.Chaptertype == ActiveChapterControl.ChapterType.Plot then
                PlotChapter = v[1]
                break
            end
        end
    end
    
    return PlotChapter
end
---@return PersonStoryData 获取个人剧情皮肤数据
function PersonStoryControl.GetPersonSkinData()
    return PersonSkinData
end

------------------------扭蛋池------------------------
function PersonStoryControl.InitShopData()
    if PersonActData == nil then
        return
    end
    for k, v in ipairs(GashaponLocalData.tab) do
        if PersonInfo.activityID == v[2] then
            table.insert(ShopInfo, Event4ShopData.New(v[1]))
        end
    end
    if #ShopInfo == 0 then
        UnityEngine.DebugEx.LogError("GashaponLocalData未找到活动ID:"..PersonInfo.activityID.."相关数据")
        return
    end

    if PersonActData.poolID then
        CurPoolId = PersonActData.poolID
        ClientPoolItems = PersonStoryControl.GetCurShopPoolList()
    end
    if PersonActData.goods then
        PersonStoryControl.PushClientPoolItems(PersonActData.goods)
    end
end

---@return Event4ShopData[]
function PersonStoryControl.GetShopList()
    return ShopInfo
end

---@return ItemData[] 获取特殊物品
function PersonStoryControl.GetSpecialItemList()
    if #SpecialItems == 0 then
        local str = PersonInfo.specialItem
        for k,v in pairs(str) do
            local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
            table.insert(SpecialItems,item)
        end
    end
    return SpecialItems
end

---获取特殊物品数量
function PersonStoryControl.GetSpecialItemCount()
    local count = 0
    local str = PersonInfo.specialItem
    for k,v in pairs(str) do
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1]))
        if item.count > 0 then
            count = count + 1
        end
    end
    return count
end

---检查商店红点
function PersonStoryControl.CheckShopRedPoint()
    
end

---@return Event4ShopData 获取当前蛋池
function PersonStoryControl.GetCurShop()
    if CurPoolId == nil then
        return nil
    end
    local tId = CurPoolId==0 and ShopInfo[1].id or CurPoolId
    for k,v in pairs(ShopInfo) do
        if v.id == tId then
            return v
        end
    end
end

---@return Event4ShopData 获取当前蛋池掉落数据
function PersonStoryControl.GetCurShopPoolList()
    if CurPoolId == nil then
        return nil
    end
    local id = CurPoolId
    if id == 0 then
        id = ShopInfo[1].id
    end
    for k,v in pairs(ShopInfo) do
        if v.id == id then
            return v:GetPoolData(PersonInfo.specialItem)
        end
    end
end

---根据蛋池id获取蛋池数据
function PersonStoryControl.GetShopPoolByPoolId(pId)
    for k,v in pairs(ShopInfo) do
        if v.pool == pId then
            return v
        end
    end
    return nil
end

---推送当前蛋池数据
function PersonStoryControl.PushClientPoolItems(data)
    if data == nil or data == "" then
        return
    end
    local arr = RapidJson.decode(data)
    local tPoolItems = ClientPoolItems
    for k,v in pairs(tPoolItems) do
        v.totalCount = 0
        for i,value in pairs(arr) do
            if i == v.str then
                v.totalCount = value
            end
        end
    end
end

---获取当前卡池剩余物品数据
function PersonStoryControl.GetClientPoolItems()
    return ClientPoolItems
end

---获取卡池剩余物品数量
function PersonStoryControl.GetPoolItemsCount()
    local count = 0
    for k,v in pairs(ClientPoolItems) do
        count = count + v.totalCount
    end
    return count
end

---检查当前卡池特殊物品是否售罄
function PersonStoryControl.CheckSpecialItemSellOut()
    local tData = nil
    for i, v in ipairs(ShopInfo) do
        if v.id == CurPoolId then
            tData = v
            break
        end
    end
    if tData ~= nil and tData == 0 then
        local arr = PersonStoryControl.GetSpecialItemList()
        for k,v in pairs(ClientPoolItems) do
            for i,item in pairs(arr) do
                if item.id == v.item.id then
                    if v.totalCount > 0 then
                        return false
                    end
                    return true
                end
            end
        end
        return false
    else
        for k,v in pairs(ClientPoolItems) do
            if v.totalCount > 0 then
                return false
            end
        end
        return true
    end
end

---检查抽取结果是否包含特殊道具
function PersonStoryControl.CheckContainsSpecial(data)
    isContainsSpecial = false
    for k,v in pairs(data) do
        for i,item in pairs(PersonStoryControl.GetSpecialItemList()) do
            if item.id == v.goodsID then
                isContainsSpecial = true
                break
            end
        end
    end
end
---获取是否包含特殊道具结果
function PersonStoryControl.GetContainsSpecial()
    return isContainsSpecial
end

---扭蛋抽奖
function PersonStoryControl.Lottery(eventId,poolId,num,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
        num = num
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameLotteryREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_LOTTERY_REQ,bytes,0,nil,PersonStoryControl.LotteryACK,function(...)
        PersonStoryControl.LotteryNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋抽奖ACK
function PersonStoryControl.LotteryACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameLotteryACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    end
end
---扭蛋抽奖NTF
function PersonStoryControl.LotteryNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameLotteryNTF',buffer))
    if tab.cost then
        ---物品消耗
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    end
    if tab.goods then
        ---将奖励推送进背包
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---检查是否包含特殊道具
        PersonStoryControl.CheckContainsSpecial(tab.goods)
        Event.Clear("Event4ShopAwardPop")
        Event.Add("Event4ShopAwardPop",function()
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods},true)
        end)
    end
    ---推送成就
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---刷新背包缓存数据
    BagViewModel.ReloadCacheData()
    ---刷新奖池
    PersonStoryControl.PushClientPoolItems(tab.poolGoods)
    ---检查红点
    PersonStoryControl.CheckShopRedPoint()
end

---扭蛋卡池升级
function PersonStoryControl.GameUp(eventId,poolId,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameUPREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_UP_REQ,bytes,0,nil,PersonStoryControl.GameUpACK,function(...)
        PersonStoryControl.GameUpNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋卡池升级ACK
function PersonStoryControl.GameUpACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameUPACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    elseif tab.errNo == 0 then
    end
end
---扭蛋卡池升级NTF
function PersonStoryControl.GameUpNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameUPNTF',buffer))
    ---更新当前蛋池id
    CurPoolId = tab.poolID
    ---刷新奖池
    ClientPoolItems = PersonStoryControl.GetCurShopPoolList()
    PersonStoryControl.PushClientPoolItems(tab.poolGoods)
end

---扭蛋卡池重置
function PersonStoryControl.PoolReset(eventId,poolId,callback)
    local Req =
    {
        eventID = eventId,
        targetID = poolId,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTwisterGameResetREQ',Req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EVENT_TWISTER_GAME_RESET_REQ,bytes,0,nil,PersonStoryControl.PoolResetACK,function(...)
        PersonStoryControl.PoolResetNTF(...)
        if callback then
            callback()
        end
    end)
end
---扭蛋卡池重置ACK
function PersonStoryControl.PoolResetACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameResetACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("friendviewmodel_tips2")..tab.errNo,2},true)
    end
end
---扭蛋卡池重置NTF
function PersonStoryControl.PoolResetNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTwisterGameResetNTF',buffer))
    ---更新当前蛋池id
    CurPoolId = tab.poolID
    ---刷新奖池
    ClientPoolItems = PersonStoryControl.GetCurShopPoolList()
    PersonStoryControl.PushClientPoolItems(tab.poolGoods)
end

---检查所有红点
function PersonStoryControl.CheckAllRedPoint()
    ---任务相关红点
    PersonStoryControl.CheckShopRedPoint()
    ---游戏剧情红点
    HalfAnniControl.GamePlotRedPoint()
end

---@return RoleData[] 获取筛选排序后的英雄数据
function PersonStoryControl.GetSortAndFilterHeroArr(roleList,filters,sort,rise)
    ---@type RoleData[]
    local array = {}

    if PersonStoryControl.InPerson then
        array = clone(roleList)
        for i, v in pairs(array) do
            v.BonusPer = 0
            for k, roleData in ipairs(RoleUpData.RoleUpItem) do
                if roleData.roleID == v.id then
                    v.BonusPer = roleData.BonusPer
                    break
                end
            end
        end
        ---有类型时筛选
        if filters and not filters[0] then
            ---筛选
            local filterGroup = {}
            for i, v in pairs(filters) do
                if v then
                    table.insert(filterGroup,i)
                end
            end
            array = StormViewModel.RoleFilter(array, "New_Career", filterGroup)
        end
        ---排序(1等级，2星级，3稀有度，4好感度,5取得时间)
        local sortGroupArr = {
            [1] = {"BonusPer","level","star","rank","awaken","id"},
            [2] = {"BonusPer","star","level","rank","awaken","id"},
            [3] = {"BonusPer","rank","star","level","id"},
            [4] = {"BonusPer","favor","rank","level","id"},
            [5] = {"BonusPer","cTime","id"},
        }
        local isRise = {
            [1] = { true,rise,rise,rise,rise,rise },
            [2] = { true,rise,rise,rise,rise,rise },
            [3] = { true,rise,rise,rise,rise },
            [4] = { true,rise,rise,rise,rise },
            [4] = { true,rise,rise },
        }
        Global.Sort(array,sortGroupArr[sort],isRise[sort])
    end
    return array
end

function PersonStoryControl.Clear()
    PersonInfo = nil
    ChapterData = {}
    BattleChapter = {}
    PlotChapter = nil
    ShopInfo = {}
    CurPoolId = nil
    ClientPoolItems = nil
    SpecialItems = {}
    isContainsSpecial = false
    PersonActData = nil
    RoleUpData = {
        --UP角色
        RoleUp = {},
        --UP角色道具
        RoleUpItem = {}
    }
    PersonSkinData = {}
end

return PersonStoryControl