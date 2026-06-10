require("Model/CardDraw/Data/RoleDrawData")
require("Model/CardDraw/Data/EquipDrawData")
require("Model/CardDraw/Data/SpecialDrawData")
require("LocalData/RolerecruitLocalData")
require("LocalData/EquipmentsupplyLocalData")
require("LocalData/CardtypeLocalData")
require("LocalData/RarerolerecruitLocalData")

CardDrawControl = {}
---@type RoleDrawData[] 所有抽角色数据
local CacheRoleDrawList = {}
---@type EquipDrawData[] 所有抽装备数据
local CacheEquipDrawList = {}
---@type RoleDrawData[] 新手卡池
local CacheNoviceList = {}
---@type SpecialDrawData[] 特殊卡池光暗抽奖
local CacheSpecialDrawList = {}
---所有抽取数据
local AllCacheDrawList = {}

CardDrawControl.TypeIndex = nil
CardDrawControl.CardPoolIndex = nil

--- 卡池类型（对应角色招募表 cardType）
---@alias PoolCardType number
CardDrawControl.PoolCardType = {
    Role = 1, -- 角色
    Equip = 2, -- 装备
    Step = 3, -- 阶梯
    LightDark = 4, -- 光暗/超越
    Freedom = 5, -- 自选
}
---装备卡池抽取次数类型
CardDrawControl.EquipDrawType = {
    --一到十抽
    OneToTen = 1,
    --十到百抽
    TenToHundred = 2,
}
---当前装备抽取次数类型
CardDrawControl.CurEquipDrawType = 1
---抽取物品结果
CardDrawControl.LightDarkItemDrawResult = {}
---光暗池抽到角色的数量
CardDrawControl.HeroCount = 0
---自选卡池列表
local SelectPoolList = {}
---自选弹窗类型
CardDrawControl.SelPopType = {
    ---详情弹窗
    DetailPop = 1,
    ---自选弹窗
    SelectPop = 2
}
---自选卡池角色
local SelectRole = {}
---自选卡池过期时间回调
local SelectBack = nil

---抽卡校验id
local recruitIndices = {};

---初始化数据
function CardDrawControl.Init(data)
    ---初始化抽角色数据
    for id,config in pairs(RolerecruitLocalData.tab) do
        AllCacheDrawList[#AllCacheDrawList + 1] = RoleDrawData.New(id)
    end
    ---初始化装备数据
    for id,config in pairs(EquipmentsupplyLocalData.tab) do
        AllCacheDrawList[#AllCacheDrawList + 1] = EquipDrawData.New(id)
    end
    ---初始化光暗抽卡
    for id,config in pairs(RarerolerecruitLocalData.tab) do
        AllCacheDrawList[#AllCacheDrawList + 1] = SpecialDrawData.New(id)
    end
    ---加载数据
    CardDrawControl.ReloadCacheList()
    ---推送服务器数据
    CardDrawControl.PushCardPoolData(data.lotterys,data.LightDarkFreeTime)
    if nil ~= data.recruitIndex then
        for i = 1, #data.recruitIndex do
            recruitIndices[data.recruitIndex[i].recruitID] = data.recruitIndex[i].recruitIndex;
            --print("XPXP recruitIndices. id: " .. data.recruitIndex[i].recruitID .. ", index: " .. data.recruitIndex[i].recruitIndex);
        end
    end
end

function CardDrawControl.GetRecruitIndex(id)
    if nil == recruitIndices[id] then
        recruitIndices[id] = 0;
    end
    --print("XPXP GetRecruitIndex. id: " .. id .. ", index: " .. recruitIndices[id]);
    return recruitIndices[id];
end

function CardDrawControl.SetRecruitIndex(id, index)
    --print("XPXP SetRecruitIndex. id: " .. id .. ", index: " .. index);
    recruitIndices[id] = index;
end

---获取抽卡数据传入id
function CardDrawControl.GetDataById(id)
    for k,v in pairs(AllCacheDrawList) do
        if id == v.id then
            return v
        end
    end
    return nil
end

---获取所有抽卡数据
function CardDrawControl.GetAllDrawData()
    return AllCacheDrawList
end

---获取除了新手卡池外的所有卡池(不含未解锁卡池)
function CardDrawControl.GetAllCanDrawData()
    local arr = {}
    if NoviceViewModel.CurTaskId == 52405 then
        return CardDrawControl.GetNoviceDrawData()
    end
    for k,v in pairs(AllCacheDrawList) do
        if v.id ~= 999999 and v:WhetherIsOpen() then
            if v.cardType == 1 and v:WhetherMaxCount() == false and v:WhetherShow() then
                table.insert(arr,v)
            elseif v.cardType == 2 and v:WhetherShow() then
                table.insert(arr,v)
            end
        end
    end
    return arr
end

---获取所有卡池(不含新手池)
function CardDrawControl.GetAllNormalDrawData()
    local arr = {}
    for k,v in pairs(AllCacheDrawList) do
        if v.cardType == 5 then
            print()
        end
        ---如果是角色池且不是新手池且池子未过期
        if v.id ~= 999999 and v:WhetherIsOpen() then
            if (v.cardType == 1 or v.cardType == 3 or v.cardType == 5) and v:WhetherMaxCount() == false and v:WhetherShow() then
                table.insert(arr,v)
            elseif v.cardType == 2 and v:WhetherShow() and SysLockControl.CheckSysLock(1302) then
                table.insert(arr,v)
            elseif v.cardType == 4 then
                table.insert(arr,v)
            end
        end
    end
    return arr
end

---获取新手卡池
function CardDrawControl.GetNoviceDrawData()
    local arr = {}
    for k,v in pairs(AllCacheDrawList) do
        if v.id == 999999 then
            table.insert(arr,v)
        end
    end
    return arr
end

---获取所有装备卡池
function CardDrawControl.GetEquipDrawData()
    return CacheEquipDrawList
end

---获取UP角色
function CardDrawControl.GetUpRole()
    local arr = {}
    for k,v in pairs(CacheRoleDrawList) do
        arr[v.id] = v.UpRole
    end
    return arr
end

---推送卡池数据
function CardDrawControl.PushCardPoolData(data,lightDark)
    if data then
        for k,v in pairs(data) do
            if nil == EquipmentsupplyLocalData.tab[v.lotteryID] then
                for i,pool in pairs(AllCacheDrawList) do
                    if pool.id == v.lotteryID then
                        pool:PushData(v)
                    end
                end
            end
        end
    end
    if lightDark then
        for i,data in pairs(lightDark) do
            for k,v in pairs(CacheSpecialDrawList) do
                if data.ID == v.id then
                    v.count = data.count
                    v.lastFreeTime = data.freeTime
                end
            end
        end
    end
end

---推送单独卡池数据
function CardDrawControl.PushSinglePoolData(id,count,data)
    for k,v in pairs(CacheRoleDrawList) do
        if v.id == id then
            v.count = count
            return
        end
    end
    for k,v in pairs(CacheNoviceList) do
        if v.id == id then
            v.count = count
            return
        end
    end
    for k,v in pairs(CacheSpecialDrawList) do
        if v.id == id then
            v:PushData(data)
            return
        end
    end
end

---@return CardtypeLocalData
---获取所有卡池类型数据
function CardDrawControl.GetCardTypeData()
    local arr = {}
    for k,v in pairs(CardtypeLocalData.tab) do
        if SysLockControl.CheckSysLock(v.openid) and next(CardDrawControl.GetCardPoolDataByTypeTab(v.cardtype)) ~= nil then
            table.insert(arr,v)
        end
    end
    Global.Sort(arr,{"id"},false)
    return arr
end

function CardDrawControl.GetCardPoolDataByTypeTab(tab)
    local str = string.split(tab,",")
    local arr = {}
    if #str > 1 then
        for k,v in pairs(str) do
            for j,data in pairs(CardDrawControl.GetCardPoolDataByType(tonumber(v))) do
                table.insert(arr,data)
            end
        end
    else
        for j,data in pairs(CardDrawControl.GetCardPoolDataByType(tonumber(tab))) do
            table.insert(arr,data)
        end
    end
    return arr
end

---重新加载卡池数据
function CardDrawControl.ReloadCacheList()
    CacheRoleDrawList = {}
    CacheNoviceList = {}
    CacheEquipDrawList = {}
    CacheSpecialDrawList = {}
    for k,v in pairs(AllCacheDrawList) do
        --初始化角色卡池
        if v.cardType == 1 or v.cardType == 3 or v.cardType == 5 then
            if v.id ~= tonumber(SteamLocalData.tab[113012][2]) and v:WhetherIsOpen() and v:WhetherMaxCount() == false and v:WhetherShow() then
                table.insert(CacheRoleDrawList,v)
            end
        end
        --初始化新手卡池
        if v.id == tonumber(SteamLocalData.tab[113012][2]) then
            table.insert(CacheNoviceList,v)
        end
        --初始化装备卡池
        if v.cardType == 2 then
            if v:WhetherIsOpen() and v:WhetherShow() and SysLockControl.CheckSysLock(1302) then
                table.insert(CacheEquipDrawList,v)
            end
        end
        --初始化特殊卡池
        if v.cardType == 4 then
            if v:WhetherIsOpen() then
                table.insert(CacheSpecialDrawList,v)
            end
        end
    end
    --排序
    Global.Sort(CacheRoleDrawList,{"sort"} ,false)
    Global.Sort(CacheNoviceList,{"sort"} ,false)
    Global.Sort(CacheEquipDrawList,{"sort"} ,false)
    Global.Sort(CacheSpecialDrawList,{"sort"} ,false)
end

function CardDrawControl.GetCardPoolDataByType(type)
    if type == 1 or type == 3 or type == 5 then
        return CacheRoleDrawList
    elseif type == 2 then
        return CacheEquipDrawList
    elseif type == 4 then
        return CacheSpecialDrawList
    end
end

---检查卡池类型红点
function CardDrawControl.CheckRedDot()
    --重新加载数据
    CardDrawControl.ReloadCacheList()
    --红点置为关
    RedDotControl.GetDotData("DrawCardRole"):SetState(false)
    RedDotControl.GetDotData("DrawCardEquip"):SetState(false)
    RedDotControl.GetDotData("DrawCardSpecial"):SetState(false)
    --角色卡池
    CardDrawControl.SetPlayerPrefs("DrawCardRole",CacheRoleDrawList)
    --装备卡池
    CardDrawControl.SetPlayerPrefs("DrawCardEquip",CacheEquipDrawList)
    --特殊卡池光暗抽奖
    CardDrawControl.SetPlayerPrefs("DrawCardSpecial",CacheSpecialDrawList)
    --检查是否有免费抽卡
    for k,v in pairs(CacheSpecialDrawList) do
        if v:GetFreeState()[2] == true then
            RedDotControl.GetDotData("DrawCardSpecial"):SetState(true)
            break
        end
    end
end

function CardDrawControl.SetPlayerPrefs(Str,List)
    if UnityEngine.PlayerPrefs.HasKey(Str..PlayerControl.GetPlayerData().UID) then
        local strTab = string.split(UnityEngine.PlayerPrefs.GetString(Str..PlayerControl.GetPlayerData().UID),",")
        for k,v in pairs(List) do
            if Global.Contains(strTab,tostring(v.id)) == false then
                RedDotControl.GetDotData(Str):SetState(true)
                break
            end
        end
    else
        local str = ""
        for k,v in pairs(List) do
            str = str ..v.id..","
        end
        str = string.sub(str,1,(string.len(str) - 1))
        RedDotControl.GetDotData(Str):SetState(true)
    end
end

---获取对应卡池类型的红点状态
function CardDrawControl.GetRedDotByTypeTab(tab)
    local str = string.split(tab,",")
    for k,v in pairs(str) do
        if tonumber(v) == 1 or tonumber(v) == 3 then
            if RedDotControl.GetDotData("DrawCardRole").State == true then
                return true
            end
        elseif tonumber(v) == 2 then
            if RedDotControl.GetDotData("DrawCardEquip").State == true then
                return true
            end
        elseif tonumber(v) == 4 then
            if RedDotControl.GetDotData("DrawCardSpecial").State == true then
                return true
            end
        end
    end
    return false
end

---推送本地数据
function CardDrawControl.PushPlayerPrefs(type)
    local str = string.split(type,",")
    for k,v in pairs(str) do
        if (tonumber(v) == 1 or tonumber(v) == 3) and RedDotControl.GetDotData("DrawCardRole").State == true then
            local str = ""
            for k,v in pairs(CacheRoleDrawList) do
                str = str ..v.id..","
            end
            str = string.sub(str,1,(string.len(str) - 1))
            UnityEngine.PlayerPrefs.SetString("DrawCardRole"..PlayerControl.GetPlayerData().UID,str)
            RedDotControl.GetDotData("DrawCardRole"):SetState(false)
        elseif tonumber(v) == 2 and RedDotControl.GetDotData("DrawCardEquip").State == true then
            local str = ""
            for k,v in pairs(CacheEquipDrawList) do
                str = str ..v.id..","
            end
            str = string.sub(str,1,(string.len(str) - 1))
            UnityEngine.PlayerPrefs.SetString("DrawCardEquip"..PlayerControl.GetPlayerData().UID,str)
            RedDotControl.GetDotData("DrawCardEquip"):SetState(false)
        elseif tonumber(v) == 4 and RedDotControl.GetDotData("DrawCardSpecial").State == true then
            local str = ""
            for k,v in pairs(CacheSpecialDrawList) do
                str = str ..v.id..","
            end
            str = string.sub(str,1,(string.len(str) - 1))
            UnityEngine.PlayerPrefs.SetString("DrawCardSpecial"..PlayerControl.GetPlayerData().UID,str)
            local _bool = false
            for i,data in pairs(CacheSpecialDrawList) do
                if data:GetFreeState()[2] == true then
                    _bool = true
                    break
                end
            end
            RedDotControl.GetDotData("DrawCardSpecial"):SetState(_bool)
        end
    end
end

---获取光暗卡池掉落
function CardDrawControl.GetLightDarkDropList(id)
    local items = string.split(RarerolerecruitLocalData.tab[id].oldcardpool, ";");
    local arr = {};
    local ratios = {
        tonumber(SteamLocalData.tab[126200][2]),
        tonumber(SteamLocalData.tab[126201][2]),
        tonumber(SteamLocalData.tab[126202][2]),
        tonumber(SteamLocalData.tab[126203][2]),
    }
    for i = 1, #items, 1 do
        table.insert(arr, CardDrawControl.GetSingleLightDarkDropList(items[i], ratios[i]));
    end
    return arr
end

function CardDrawControl.GetSingleLightDarkDropList(args, ratio)
    local strTab = string.split(args,"_")
    local arr = {}
    if arr[1] == nil then
        arr[1] = strTab[2]
    else
        arr[1] = arr[1]..","..strTab[2]
    end
    if arr[3] == nil then
        arr[3] = strTab[2]
    else
        arr[3] = arr[3]..","..strTab[2]
    end
    --总概率
    arr[4] = ratio;
    -- star
    arr[5] = tonumber(strTab[1]) 
    return arr
end

---获取掉落物品字符串
function CardDrawControl.GetItemTempByDropList(str)
    local strTab = string.split(str,",")
    local dropStr = ""
    for k,v in pairs(strTab) do
        if dropStr == "" then
            dropStr = dropStr..DropLocalData.tab[tonumber(v)][4]
        else
            dropStr = dropStr..","..DropLocalData.tab[tonumber(v)][4]
        end
    end
    return dropStr
end

---获取光暗池物品掉落概率
function CardDrawControl.GetSingleItemProbability(str,id,count)
    local weight = 0
    local curWeight = 0

    for k,v in pairs(str) do
        local temp = string.split(v,'_')
        if id == tonumber(temp[2]) and count == tonumber(temp[3]) then
            curWeight = tonumber(temp[4])
        end
        weight = weight + tonumber(temp[4])
    end
    local num = (curWeight / weight)*100
    return num
end

function CardDrawControl.OpenPoolTips(poolData)
    MgrUI.Pop(UID.CardPoolTip_UI,{poolData},true)
end

---获取游戏信息
function CardDrawControl.LightDarkRecruitREQ(id,_count,_isFree,funcNTF, drawType)
    if nil == drawType then
        drawType = 1;
    end
    NormalCardDrawViewModel.SetDrawType(drawType);
    local BaseREQ = {
        recruitID = id,
        count = _count,
        isFree = _isFree,
        gachaType = drawType,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(id),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientLightDarkRecruitREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_LIGHT_DARK_RECRUIT_REQ,bytes,0,nil, CardDrawControl.LightDarkRecruitACK,funcNTF)
end

function CardDrawControl.LightDarkRecruitACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientLightDarkRecruitACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips9") .. tab.errNo,1},true)
    end
end

function CardDrawControl.InitSelectPoolList(data)
    if data == nil or #data == 0 then
        return
    end
    for i, v in ipairs(data) do
        local list = {}
        ---自选角色排序
        if v.selectedUp and #v.selectedUp > 0 then
            for i, v in ipairs(v.selectedUp) do
                local roleD = HeroControl.GetRoleDataByID(v)
                if roleD then
                    local temp = {
                        rank = roleD.rank,
                        roleID = roleD.id,
                        roleData = roleD
                    }
                    table.insert(list,temp)
                end
            end
            Global.Sort(list,{"rank","roleID"}, true)
        end
        
        local lotteryList = {
            ---自选卡池ID
            id = v.lotteryID,
            ---自选卡池Up角色
            selectedUp = list,
            ---自选卡池所有角色
            heroList = {},
            ---自选卡池角色品质阶段
            rank = {},
            ---自选卡池倒计时
            countdown = v.refreshCountdown,
            ---自选卡池类型
            cardType = 5,
            ---结束时间戳
            endTime = v.refreshCountdown+Global.GetCurTime()+1
        }
        SelectPoolList[v.lotteryID] = lotteryList
    end
    if SelectBack then
        SelectBack()
    end
end
---打开自选弹窗
function CardDrawControl.OpenSelectPool(_poolId,_selectType)
    if SelectPoolList[_poolId] == nil or (_selectType == CardDrawControl.SelPopType.SelectPop and #SelectPoolList[_poolId].selectedUp > 0) then
        return
    end
    if #SelectPoolList[_poolId].heroList > 0 then
        if _selectType == CardDrawControl.SelPopType.DetailPop then
            ---详情弹窗
            MgrUI.Pop(UID.CardPoolTip_UI, { SelectPoolList[_poolId] },true)
        elseif _selectType == CardDrawControl.SelPopType.SelectPop and #SelectPoolList[_poolId].selectedUp == 0 then
            ---自选Up角色
            MgrUI.Pop(UID.FreePoolOptional_UI,SelectPoolList[_poolId],true)
        end
        return
    end
    
    ---获取自选卡池所有角色数据
    CardDrawControl.GetSelectPoolData(_poolId,_selectType)
end
---获取自选卡池所有角色数据
function CardDrawControl.GetSelectPoolData(_poolId,_selectType,callBack)
    SelectBack = callBack
    local PoolProps = {
        lotteryID = _poolId
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetPoolPropsReq',PoolProps))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_POOL_PROPS_REQ,bytes,0,nil,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientGetPoolPropsAck',buffer))
        if tab.errNo~=0 then
            --申请角色数据失败
        end
    end, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientGetPoolPropsNtf',buffer))
        if SelectPoolList[tab.lotteryID] then
            SelectPoolList[tab.lotteryID].heroList = tab.poolInfo
            SelectPoolList[tab.lotteryID].rank = CardDrawControl.SelectPoolRank(tab.poolInfo)
            if _selectType == CardDrawControl.SelPopType.DetailPop then
                ---详情弹窗
                MgrUI.Pop(UID.CardPoolTip_UI, { SelectPoolList[_poolId] },true)
            elseif _selectType == CardDrawControl.SelPopType.SelectPop then
                ---自选Up角色
                MgrUI.Pop(UID.FreePoolOptional_UI,SelectPoolList[_poolId],true)
            end
            if callBack then
                callBack()
            end
        end
    end)
end
---自选卡池角色品质阶段
function CardDrawControl.SelectPoolRank(_heroList)
    local star = 0
    local rank = {}
    for i, v in ipairs(_heroList) do
        if star ~= HeroControl.GetRoleDataByID(v.roleID).rank then
            star = HeroControl.GetRoleDataByID(v.roleID).rank
            table.insert(rank,star)
        end
    end

    return rank
end
---获取自选卡池数据
function CardDrawControl.GetSelectData(_poolID)
    return SelectPoolList[_poolID]
end
---自选卡池所选角色
function CardDrawControl.SendSelectRole(_poolID,_roleList,callBack)
    local PoolProps = {
        lotteryID = _poolID,
        roleID = _roleList
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSelectRoleUpReq',PoolProps))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SELECT_ROLE_UP_REQ,bytes,0,nil,function(buffer,tag)
        
    end, function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientSelectRoleUpNtf',buffer))
        if SelectPoolList[tab.lotteryID] then
            local list = {}
            for i, v in ipairs(tab.roleID) do
                local roleD = HeroControl.GetRoleDataByID(v)
                if roleD then
                    local temp = {
                        rank = roleD.rank,
                        roleID = roleD.id,
                        roleData = roleD
                    }
                    table.insert(list,temp)
                end
            end
            Global.Sort(list,{"rank","roleID"}, true)
            SelectPoolList[tab.lotteryID].selectedUp = list
            ---获取自选卡池所有角色数据
            CardDrawControl.GetSelectPoolData(tab.lotteryID,nil,function()
                if callBack then
                    callBack()
                end
            end)
        end
    end)
end
---设置当前自选卡池选中的角色
function CardDrawControl.SetSelectRole(_role)
    if _role == nil then
        return
    end
    local isHave = false
    local sum = 0
    for i = 1, #SelectRole do
        if SelectRole[i].id == _role.id then
            table.remove(SelectRole,i)
            isHave = true
            break
        elseif SelectRole[i].rank == _role.rank then
            sum = sum+1
        end
    end
    if not isHave and sum < 2 then
        table.insert(SelectRole,_role)
    else
        isHave = true
    end
    
    return isHave
end
function CardDrawControl.GetSelectRole(_roleID)
    local roleData = nil
    for i = 1, #SelectRole do
        if SelectRole[i].id == _roleID then
            roleData = SelectRole[i]
        end
    end
    return roleData
end
function CardDrawControl.ClearSelectRole()
    SelectRole = {}
end
---刷新时间
function CardDrawControl.RefreshTime()
    for i, v in pairs(AllCacheDrawList) do
        if v.timeId ~= 0 and v.timeOpen_Stamp == 0 then
            v:RefreshTime()
        end
    end
end

function CardDrawControl.Clear()
    CacheRoleDrawList = {}
    CacheEquipDrawList = {}
    CacheNoviceList = {}
    CacheSpecialDrawList = {}
    AllCacheDrawList = {}
    CardDrawControl.CurEquipDrawType = 1
    CardDrawControl.LightDarkItemDrawResult = {}
    CardDrawControl.HeroCount = 0
    SelectPoolList = {}
    SelectRole = {}
    SelectBack = nil
end

return CardDrawControl