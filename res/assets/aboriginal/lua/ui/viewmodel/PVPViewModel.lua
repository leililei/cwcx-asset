require("LocalData/SeniorPVPLocalData")
require("LocalData/SteamLocalData")
require("LocalData/UiskinlockLocalData")
---PVP
PVPViewModel = {}

PVPViewModel.AllRole = {}
---玩家是否是进攻方
PVPViewModel.PlayerIsAtk = true
---连续战斗
PVPViewModel.continue = false
---连续战斗次数
PVPViewModel.continueCount = 0
---连续战斗ACK/NTF
PVPViewModel.continueACK = nil
PVPViewModel.continueNTF = nil
---是否在回放
PVPViewModel.IsViewRecord = false
PVPViewModel.RecordResult = {}  ---回放结果
PVPViewModel.type = 1   ---0为小天梯(初级)   1 为大天梯(高级)
---
PVPViewModel.LowCard = 0  ---小天梯次数
PVPViewModel.LowCardTime = 0   ---小天梯时间
PVPViewModel.HighCard = 0   ---大天梯次数
PVPViewModel.HighCardTime = 0  ---大天梯时间
PVPViewModel.startTime = 0
PVPViewModel.endTime = 0
PVPViewModel.RankLevel = 0  ---段位
PVPViewModel.isSettle = false  ---是否结算
PVPViewModel.CurRankData = nil   ---当前天梯数据

PVPViewModel.RoleCacheList = {}  ---玩家英雄缓存
---
PVPViewModel.CurToken = 0   ---当前匹配的唯一标识

PVPViewModel.CurRankVersion = 0   ---当前赛季
PVPViewModel.MessageRankVersion = 0 ---当前消息是第几赛季
---
---@type RoleData[]
PVPViewModel.TargetTeam = {}  ---对手角色 及阵容数据
---@type RoleData[]
PVPViewModel.OwnTeam = {}  ---自己角色 及阵容数据

PVPViewModel.TargetTeamSkin = {}

PVPViewModel.OwnTeamSkin = {}

PVPViewModel.BanRoleList = {}  ---小天梯ban人列表

PVPViewModel.PVPRightRoleData = {}  ---PVP右侧角色数据(用于PVP获得右侧阵容角色数据是否设置技能等级)
---
PVPViewModel.TargetInfo = {
    name = "",
    score = 0,
    rank = 0,
    rankLevel = 0
}
PVPViewModel.OwnInfo = {
    name = "",
    score = 0,
    rank = 0,
    rankLevel = 0
}
---PVP结果
PVPViewModel.resultData = {
    goods = {},
    aScore = 0,
    aRank = 0,
    dScore = 0,
    dRank = 0,
    day = {},
    week = {},
    month = {},
    glory = {},
}
---PVP连续战斗结果
PVPViewModel.ResultData_Continue_Gather = {}
PVPViewModel.resultData_continue = {
    name = "",
    score = 0,
    rank = 0,
    selfName = "",
    selfScore = 0,
    selfRank = 0,
    token = "",
    goods = {},
    result = 0,
    aScore = 0,
    aRank = 0,
    dScore = 0,
    dRank = 0,
    day = {},
    week = {},
    month = {},
    glory = {},
}

---第一次请求天梯数据
PVPViewModel.isFirstSend = true
PVPViewModel.FirstEnterPVPUI = true
PVPViewModel.ReadyCallBack = nil

PVPViewModel.ReadyMap = nil
PVPViewModel.FightMap = nil

PVPViewModel.PVPPreviousScore = 0
PVPViewModel.PVPNewScore = 0
PVPViewModel.PVPPreviousRank = 0
PVPViewModel.PVPNewRank = 0
---PVP上场人数
PVPViewModel.RoleLimit = 0
---设置的挂机次数
PVPViewModel.bCount = 0
---设置的挂机开始时间
PVPViewModel.bTime = 0
---挂机pvp间隔时间
PVPViewModel.Continue_PVP_Separate = tonumber(SteamLocalData.tab[108015][2])
---挂机PVP统计结果
PVPViewModel.Continue_PVP_Result = {}
---是否有未存在PVP结算
PVPViewModel.existBattleRecord = false
---武道会PVP数据
local BuDoukaiPvpDataList = {}
---初始化
function PVPViewModel.Init()
    PVPViewModel.isFirstSend = true
    PVPViewModel.RoleCacheList = HeroControl.GetHaveHero()
    PVPViewModel.SendGetLadderScoreInfoReq(function()
        PVPViewModel.GetPvPData(PVPViewModel.type);
    end);
end

function PVPViewModel.FriendPVPInit()
    PVPViewModel.RoleCacheList = HeroControl.GetHaveHero()
end
---销毁
function PVPViewModel.Close()
    MgrBattle.CloseFight()
end

-----------跳转--------------------
---打开UI
function PVPViewModel.OpenPVPReadyUI()
    PVPViewModel.FirstEnterPVPUI = true
    ---用当前段位加载对应地图
    local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
    MgrBattle.GoFight(MgrBattle.fightType.pvp,nil,rankData[15])
end
---打开战斗UI
function PVPViewModel.OpenBattleUI()
    --MgrUI.GoClose(UID.PvPStartPop_UI)
    MgrUI.GoClose2(UID.PvPStartPop_UI)
end
---打开结算UI
function PVPViewModel.OpenCompleteUI()
    ---显示结果
    PVPViewModel.ShowResultData()
end

---移除缓存池英雄数据
function PVPViewModel.RemoveHeroData(heroId)
    for i, data in pairs(PVPViewModel.RoleCacheList) do
        if data.id == heroId then
            table.remove(PVPViewModel.RoleCacheList,i)
            break
        end
    end
end

---为缓存池添加英雄数据
function PVPViewModel.AddHeroData(heroId)
    table.insert(PVPViewModel.RoleCacheList,HeroControl.GetRoleDataByID(heroId))
end

---@return RoleData[] 获取筛选排序后的英雄数据
function PVPViewModel.GetSortAndFilterHeroArr(filters,sort,rise,isBan)
    local array = PVPViewModel.RoleCacheList
    ---有类型时筛选
    if filters and not filters[0] then
        ---筛选
        local filterGroup = {}
        for i, v in pairs(filters) do
            if v then
                table.insert(filterGroup,i)
            end
        end
        array = PVPViewModel.RoleFilter(array, "New_Career", filterGroup)
    end
    if isBan then
        for i, v in pairs(PVPViewModel.BanRoleList) do
            for m, n  in ipairs(array) do
                if n.id == v then
                    table.remove(array,m)
                    break
                end
            end
        end
    end
    ---排序(1等级，2星级，3取得时间, 4稀有度，5好感度)
    local sortGroupArr = {
        [1] = {"level","awaken","rank","star","cTime","favor","id"},
        [2] = {"star","awaken","rank","level","cTime","favor","id"},
        [3] = {"rank","awaken","star","level","cTime","favor","id"},
        [4] = {"favor","awaken","rank","star","level","cTime","id"},
        [5] = {"cTime","awaken","rank","star","level","favor","id"}
    }
    Global.Sort(array,sortGroupArr[sort],{rise,not rise,rise,rise,rise,rise,rise})
    return array
end

---角色筛选
function PVPViewModel.RoleFilter(list, key, values)
    local t = {}
    for _, data in pairs(list) do
        for _, v in pairs(values) do
            if data[key] == v then
                ---任一类型相同时添加
                table.insert(t,data)
                break
            end
        end
    end
    return t
end

---获取自动排序攻击顺序id
function PVPViewModel.GetAutoAtkOrderByList(idList)
    ---@type RoleData[]
    local dataList = {}
    for _, id in pairs(idList) do
        dataList[#dataList + 1] = HeroControl.GetRoleDataByID(id)
    end
    Global.Sort(dataList,{"New_Career","level","awaken","rank","star","cTime","favor","id"},true)
    local list = {}
    for i, v in ipairs(dataList) do
        list[i] = v.id
    end
    return list
end

---@param fighterAttrs --FighterAttr[] 创建角色数据
---@return RoleData[]
function PVPViewModel.GetPvPRole(fighterAttrs,skins)
    local arr = {}
    local skinId = nil
    for i, fighterAttr in pairs(fighterAttrs) do
        if skins then
            for j ,v in pairs(skins) do
                for k ,values in pairs(UiskinlockLocalData.tab) do
                    if values.id == v and values.roleid == fighterAttr.base.roleID then
                        skinId = v
                        break
                    end
                end
            end
            if skinId then
                arr[#arr + 1] = HeroControl.CreateSingleHero(fighterAttr,skinId)
                skinId = nil
            else
                arr[#arr + 1] = HeroControl.CreateSingleHero(fighterAttr)
            end
        else
            arr[#arr + 1] = HeroControl.CreateSingleHero(fighterAttr)
        end
    end
    return arr
end

---@return number[] 获取所有角色Id
function PVPViewModel.GetAllRoleId(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.id
    end
    return arr
end
function PVPViewModel.GetAllRoleSEquip(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = EquipControl.CreatSingleSpecialEquip(v.SEquipID,v.SEquipLevel,v.SEquipGrade)
    end
    return arr
end
---@return bool[] 获得所有设置技能标记
function PVPViewModel.GetAllFlags(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.heroFlag
    end
    return arr
end

---@return number[] 获取所有角色skinId
function PVPViewModel.GetAllRoleSkin(isLeft)
    local t = {}
    local skins = nil
    if isLeft then
        t = PVPViewModel.OwnTeam
        skins = PVPViewModel.OwnTeamSkin
    else
        t = PVPViewModel.TargetTeam
        skins = PVPViewModel.TargetTeamSkin
    end
    local arr = {}
    if skins then
        for i, skin in ipairs(skins) do
            for _, value in pairs(UiskinlockLocalData.tab) do
                if value.id == skin then
                    for j, v in pairs(t) do
                        if value.roleid == v.id then
                            if isLeft then
                                PVPViewModel.OwnTeam[j].skin = skin
                            else
                                PVPViewModel.TargetTeam[j].skin = skin
                            end
                            arr[j] = skin
                            break
                        else
                            if arr[j] == nil then
                                arr[j] = v.id
                            end
                        end
                    end
                end
            end
        end
    else
        for i, v in ipairs(t) do
            arr[i] = v.id
        end
    end
    return arr
end
---@return number[] 获取所有怪物等级
function PVPViewModel.GetAllRoleLevel(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.level
    end
    return arr
end
---@return number[] 获取所有怪物星级
function PVPViewModel.GetAllRoleStar(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.star
    end
    return arr
end
---@return number[] 获取所有怪物觉醒状态
function PVPViewModel.GetAllRoleAwaken(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.awaken
    end
    return arr
end
---@return number[] 获取所有怪物技能等级
function PVPViewModel.GetAllRoleSkillLv(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.skillLevel
    end
    return arr
end
---@return number[] 获取所有怪物位置索引
function PVPViewModel.GetAllRoleSIndex(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.index
    end
    return arr
end
---@return number[] 获取所有怪物缩放
function PVPViewModel.GetAllRoleScale(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.body
    end
    return arr
end
---@return number[] 获取所有角色核心1ID
function PVPViewModel.GetAllRoleCoreID1(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor1
    end
    return arr
end
---@return number[] 获取所有角色核心2ID
function PVPViewModel.GetAllRoleCoreID2(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor2
    end
    return arr
end
---@return number[] 获取所有角色核心1属性
function PVPViewModel.GetAllRoleCoreAttr1(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor1Pro
    end
    return arr
end
---@return number[] 获取所有角色核心2属性
function PVPViewModel.GetAllRoleCoreAttr2(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor2Pro
    end
    return arr
end
---@return number[] 获取所有角色核心1Skill
function PVPViewModel.GetAllRoleCoreSkill1(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor1Skill
    end
    return arr
end
---@return number[] 获取所有角色核心2Skill
function PVPViewModel.GetAllRoleCoreSkill2(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.armor2Skill
    end
    return arr
end
---@return number[] 获取所有角色核心装备等级
function PVPViewModel.GetAllRoleEquipLevel(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.equipLvArr
    end
    return arr
end
---@return number[] 获取所有角色好感度
function PVPViewModel.GetAllRoleFavor(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.favor
    end
    return arr
end
---@return number[] 获取所有怪物是否为Boss
function PVPViewModel.GetAllRoleIsBoss(isLeft)
    local t = {}
    if isLeft then
        t = PVPViewModel.OwnTeam
    else
        t = PVPViewModel.TargetTeam
    end
    local arr = {}
    for i, v in ipairs(t) do
        arr[i] = v.boss
    end
    return arr
end

---获取天梯数据返回
function PVPViewModel.GetPvPACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderDataACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true)
    end
end

function PVPViewModel.GetPvPNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderDataNTF',buffer))

    if tab.attack.info then
        table.sort(tab.attack.info, function(a,b)
            return a.time > b.time
        end)
    end
    if tab.defense.info then
        table.sort(tab.defense.info, function(a,b)
            return a.time > b.time
        end)
    end
    if tab.banRole then
        PVPViewModel.BanRoleList = tab.banRole
    else
        PVPViewModel.BanRoleList = nil
    end
    if PVPViewModel.type == 0 then
        PVPViewModel.LowCard = tab.card
        PVPViewModel.LowCardTime = tab.cardUTime
    elseif PVPViewModel.type == 1 then
        PVPViewModel.HighCard = tab.card
        PVPViewModel.HighCardTime = tab.cardUTime
    end
    PVPViewModel.CurRankData = tab
    if tag == 0 then
        if PVPViewModel.isFirstSend then
            PVPViewModel.isFirstSend = false
            PVPViewModel.OpenPVPReadyUI()
        else
            PVPViewModel.ReadyCallBack()
        end
    elseif tag == 1 then
        if PVPViewModel.IsViewRecord then
            PVPViewModel.IsViewRecord = false
        end
        ---用当前段位加载对应地图
        local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
        MgrBattle.GoFight(MgrBattle.fightType.pvp,nil,rankData[15])
    elseif tag == 2 then

    end
    if tab.bCount ~= 0 then
        PVPViewModel.bCount = tab.bCount
    else
        PVPViewModel.bCount = 0
    end
    if tab.bTime ~= 0 then
        PVPViewModel.bTime = tab.bTime
    else
        PVPViewModel.bTime = 0
    end
    --是否还有未结算的PVP胜场
    if tab.existBattleRecord == 1 then
        PVPViewModel.existBattleRecord = true
    else
        PVPViewModel.existBattleRecord = false
    end
    ---结算中的时间
    if tab.startTime ~= nil and tab.startTime ~= 0 then
        PVPViewModel.startTime = tab.startTime
    end
    if tab.endTime ~= nil and tab.endTime ~= 0 then
        PVPViewModel.endTime = tab.endTime
    end
    if tab.RankLevel ~= nil then
        PVPViewModel.RankLevel = tab.RankLevel
    end
    if tab.isSettle ~= nil then
        PVPViewModel.isSettle = tab.isSettle
    end
end

---获取天梯数据
function PVPViewModel.GetPvPData(type,isComplete,callBack)
    local tag = 0
    if isComplete then
        tag = 1
    elseif isComplete == nil then
        tag = 0
    else
        tag = 2
    end
    local BaseREQ  =
    {
        type = type
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderDataREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_DATA_REQ,bytes,tag,nil,PVPViewModel.GetPvPACK,function(...)PVPViewModel.GetPvPNTF(...)
        if callBack then
            callBack()
        end
    end)
end


---天梯匹配
function PVPViewModel.PvPBattleData(type,funcACK,funcNTF)
    local BaseREQ  =
    {
        type = type
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleExREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_BATTLE_EX_REQ,bytes,0,nil,funcACK,funcNTF)
end
---天体匹配连续战斗
function PVPViewModel.StartContinuousPVP()
    if PVPViewModel.continue and PVPViewModel.continueCount > 0 then
        ---判断一下人数是否超出
        ---天梯数据
        PVPViewModel.GetPvPData(PVPViewModel.type,false,function()
            ---PVP数据
            local rankData = PVPViewModel.GetPvPRank(PVPViewModel.CurRankData.RankLevel)
            PVPViewModel.RoleLimit = rankData[18]
            ---找出PVP队伍
            local team = nil
            if PVPViewModel.type == 0 then
                team = TeamControl.GetTeamData(10000)
            elseif PVPViewModel.type == 1 then
                team = TeamControl.GetTeamData(10001)
            end
            local newTeam = clone(team)
            local count = #newTeam.info
            if count > PVPViewModel.RoleLimit then
                for i = count, 1, -1 do
                    if i > PVPViewModel.RoleLimit then
                        table.remove(newTeam.info,i)
                    else
                        break
                    end
                end
            end
            if PVPViewModel.type == 0 then
                ---拷贝阵容到选中阵型
                TeamControl.ChangeTeamInfo(10000,newTeam.info)
                TeamControl.SendSaveTeamData({10000},false,function() PVPViewModel.PvPBattleData(PVPViewModel.type,PVPViewModel.continueACK,PVPViewModel.continueNTF) end)
            elseif PVPViewModel.type == 1 then
                TeamControl.ChangeTeamInfo(10001,newTeam.info)
                TeamControl.SendSaveTeamData({10001},false,function() PVPViewModel.PvPBattleData(PVPViewModel.type,PVPViewModel.continueACK,PVPViewModel.continueNTF) end)
            end
        end)
    else
        PVPViewModel.continue = false
        PVPViewModel.continueCount = 0
    end
end

function PVPViewModel.FriendPvP(userID,funcACK,funcNTF)
    local BaseREQ  =
    {
        userID = userID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientFriendFightReq',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_FRIEND_FIGHT_REQ,bytes,0,nil,funcACK,funcNTF)
end
---汇报战况
--function PVPViewModel.BattleResultACK(buffer, tag)
--    if tag~= 0 then
--        return
--    end
--    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleResultACK',buffer))
--    print(tab.errNo)
--    if tab.errNo~=0 then
--        MgrUI.Pop(UID.PopTip_UI,{"汇报战况失败",2},true)
--    end
--end
--
--function PVPViewModel.BattleResultNTF(buffer, tag)
--    if tag~= 0 then
--        return
--    end
--    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleResultNTF',buffer))
--    ---获取出战角色
--    tab.RoleIDList = PVPViewModel.GetAllRoleId(true)
--    ---更新物品奖励
--    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
--    ---记录统计
--    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
--    ---打开结算界面
--    MgrUI.Pop(UID.PVPComplete_UI,tab,true)
--end
---汇报战况
--function PVPViewModel.BattleResultData(result)
--    local BaseREQ  =
--    {
--        token = PVPViewModel.CurToken,
--        result = result
--    }
--    ---序列化
--    local bytes = assert(pb.encode('PBClient.ClientHighLadderBattleResultREQ',BaseREQ))
--    ---发送数据
--    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_BATTLE_RESULT_REQ,bytes,0,nil,PVPViewModel.BattleResultACK,PVPViewModel.BattleResultNTF)
--end
---获取排位
function PVPViewModel.GetPvPRank(ranklevel)
    local tab = SeniorPVPLocalData.tab
    if ranklevel == nil then
        ranklevel = 1
    end
    return tab[#tab + 1 - ranklevel]
end

---显示PVP结果
function PVPViewModel.ShowResultData()
    local tab = PVPViewModel.resultData
    if tab then
        ---获取出战角色
        tab.RoleIDList = PVPViewModel.GetAllRoleId(true)
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---记录统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---打开结算界面
        MgrUI.Pop(UID.PVPComplete_UI,tab,true)
    end
end

function PVPViewModel.Show_Unliquidated_Result()
    local tab = PVPViewModel.resultData
    if tab then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        ---记录统计
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        ---打开结算界面
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.goods,nil},true)
    end
    PVPViewModel.existBattleRecord = false
end

function PVPViewModel.PlayerRankUpPop()
    local previousRank = PVPViewModel.GetPvPRank(PVPViewModel.PVPPreviousRank)
    local newRank = PVPViewModel.GetPvPRank(PVPViewModel.RankLevel)
    if newRank ~= previousRank and PVPViewModel.PVPPreviousScore ~= 0 and PVPViewModel.PVPNewScore ~= 0 then
        MgrUI.Pop(UID.PlayerRankUp_UI,nil,true)
        PVPViewModel.PVPPreviousScore = 0
        PVPViewModel.PVPPreviousRank = 0
        PVPViewModel.PVPNewScore = 0
        PVPViewModel.PVPNewRank = 0
    end
end
---回放战斗
function PVPViewModel.ViewRecordACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderPlayBackExACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        if tab.errNo == 203 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpviewmodel_tips1"),2},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpviewmodel_tips2"),2},true)
        end
    end
end
---回放战斗
function PVPViewModel.ViewRecordNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHighLadderBattleExNTF',buffer))
    --local tab = assert(pb.decode('PBClient.ClientHighLadderPlayBackNTF',buffer))
    if PVPViewModel.PlayerIsAtk then    --进攻回放
        PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.team,tab.dSkin)
        PVPViewModel.OwnTeam =PVPViewModel.GetPvPRole(tab.selfTeam,tab.aSkin)
        PVPViewModel.TargetTeamSkin = tab.dSkin
        PVPViewModel.OwnTeamSkin = tab.aSkin
        PVPViewModel.TargetInfo.name = tab.name
        PVPViewModel.TargetInfo.score = tab.score
        PVPViewModel.TargetInfo.rank = tab.rank
        PVPViewModel.TargetInfo.rankLevel = tab.RankLevel
        PVPViewModel.OwnInfo.name = tab.selfName
        PVPViewModel.OwnInfo.score = tab.selfScore
        PVPViewModel.OwnInfo.rank = tab.selfRank
        PVPViewModel.OwnInfo.rankLevel = tab.selfRankLevel
    else                                --防守回放
        PVPViewModel.TargetTeam = PVPViewModel.GetPvPRole(tab.selfTeam,tab.aSkin)
        PVPViewModel.OwnTeam =PVPViewModel.GetPvPRole(tab.team,tab.dSkin)
        PVPViewModel.TargetTeamSkin = tab.aSkin
        PVPViewModel.OwnTeamSkin = tab.dSkin
        PVPViewModel.TargetInfo.name = tab.selfName
        PVPViewModel.TargetInfo.score = tab.selfScore
        PVPViewModel.TargetInfo.rank = tab.selfRank
        PVPViewModel.TargetInfo.rankLevel = tab.selfRankLevel
        PVPViewModel.OwnInfo.name = tab.name
        PVPViewModel.OwnInfo.score = tab.score
        PVPViewModel.OwnInfo.rank = tab.rank
        PVPViewModel.OwnInfo.rankLevel = tab.RankLevel
    end
    if PVPViewModel.continue then
        BattleManager.ClearLuaData()
    end
    ---整理PVP队伍
    for i = 1, #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
    end
    for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
        table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
    end
    -----video整理进FightVideo
    --BattleViewModel.GeneVideo(tab.video)

    if (tab.result == 2 and tab.selfName == PlayerControl.GetPlayerData().nickname) or (tab.result == 1 and tab.name == PlayerControl.GetPlayerData().nickname) then --进攻方获胜
        BattleViewModel.isLeftWin = true
    else
        BattleViewModel.isLeftWin = false
    end

    PVPViewModel.RecordResult = {
        result = tab.result,    --PVP结果
        winScore = tab.aScore,  --攻击方积分
        losScore = tab.dScore,  --防守方积分
        dRankN = tab.dRank,     --防守方战后积分
        aRankN = tab.aRank      --攻击方战后积分
    }
    return tab;
end
PVPViewModel.m_recordTokens = {};
PVPViewModel.m_curRecordIdx = 1;
function PVPViewModel.ClearViewRecords()
    PVPViewModel.m_recordTokens = {};
    PVPViewModel.m_curRecordIdx = 1;
end
function PVPViewModel.ViewRecords(tokens, panelType)
    PVPViewModel.m_recordTokens = tokens;
    PVPViewModel.m_curRecordIdx = 1;
    PVPViewModel.PanelType = panelType;
    PVPViewModel.ViewSingleRecord(tokens[PVPViewModel.m_curRecordIdx], function(tab)
        MgrUI.Pop(UID.ViewRecord_UI, tab, true);
    end);
end
PVPViewModel.DirectEnterMaster = false;
function PVPViewModel.GetViewRecordsCount()
    return #PVPViewModel.m_recordTokens;
end
function PVPViewModel.ViewPrevRecord(callback)
    if #PVPViewModel.m_recordTokens <= 1 then
        return;
    end
    PVPViewModel.m_curRecordIdx = PVPViewModel.m_curRecordIdx - 1;
    if PVPViewModel.m_curRecordIdx < 1 then
        PVPViewModel.m_curRecordIdx = #PVPViewModel.m_recordTokens;
    end
    PVPViewModel.ViewSingleRecord(PVPViewModel.m_recordTokens[PVPViewModel.m_curRecordIdx], callback);
end
function PVPViewModel.ViewNextRecord(callback)
    if #PVPViewModel.m_recordTokens <= 1 then
        return;
    end
    PVPViewModel.m_curRecordIdx = PVPViewModel.m_curRecordIdx + 1;
    if PVPViewModel.m_curRecordIdx > #PVPViewModel.m_recordTokens then
        PVPViewModel.m_curRecordIdx = 1;
    end
    PVPViewModel.ViewSingleRecord(PVPViewModel.m_recordTokens[PVPViewModel.m_curRecordIdx], callback);
end
---回放战斗  0 小天梯，1大天梯
function PVPViewModel.ViewSingleRecord(token, callback)
    PVPViewModel.CurToken = token
    local BaseREQ  =
    {
        token = token
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHighLadderPlayBackExREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HIGH_LADDER_PLAY_BACK_EX_REQ,bytes,0,nil,PVPViewModel.ViewRecordACK, function(...)
        local tab = PVPViewModel.ViewRecordNTF(...);
        if nil ~= callback then
            callback(tab);
        end
    end)
end
---获取排行数据  0 小天梯，1大天梯
function PVPViewModel.GetRankData(type,version,pack,funcACK,funcNTF)
    local BaseREQ  =
    {
        type = type,
        version = version,
        pack = pack
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetHighLadderRankREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_HIGH_LADDER_RANK_REQ,bytes,0,nil,funcACK,funcNTF)
end

function PVPViewModel.ContinuePVP(curCount,callBack)
    local req =
    {
        type = PVPViewModel.type,
        count = curCount,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientPVPBackgroundSetREQ',req))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_PVP_BACKGROUND_SET_REQ,bytes,0,nil,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientPVPBackgroundSetACK',buffer))
        if tab.errNo ~= 0 then
            if tab.errNo == 6 then
            else
                if tab.errNo == 501 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_rankcensus"),1},true)
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guanka_text46"),1},true)
                end
            end
        end
    end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientPVPBackgroundSetNTF',buffer))
        print("连续战斗设置成功")
        if tab.count ~= nil then
            PVPViewModel.bCount = tab.count
        end
        if tab.time ~= nil then
            PVPViewModel.bTime = tab.time
        end
        ---剩余PVP次数
        if tab.nowCount ~= nil then
            PVPViewModel.HighCard = tab.nowCount
        end
        if callBack then
            callBack()
        end
    end)
end

---武道会PVP数据
function PVPViewModel.SetBuDoukaiPvpData(tab,isAtk)
    if isAtk then
        local BuDoukaiPvpData = {
            ---玩家是否是进攻方
            PlayerIsAtk = isAtk,
            ---自己玩家名
            OwnName = tab.atkName,
            ---对手玩家名
            TargetName = tab.defName,
            ---自己角色 及阵容数据
            OwnTeam = PVPViewModel.GetPvPRole(tab.atkTeam,tab.atkSkin),
            ---对手角色 及阵容数据
            TargetTeam = PVPViewModel.GetPvPRole(tab.defTeam,tab.defSkin),
            ---右侧阵容数据
            RightTeamData = tab.defTeam,
            ---自己角色皮肤
            OwnTeamSkin = tab.atkSkin,
            ---对手角色皮肤
            TargetTeamSkin = tab.defSkin,
            ---匹配的唯一标识
            Token = tab.token,
            ---匹配的唯一标识
            Token = tab.token,
            ---战斗播片
            video = tab.video,
            ---胜负状态 2胜利 1失败
            result = tab.result
        }
        table.insert(BuDoukaiPvpDataList, BuDoukaiPvpData)
    else
        local BuDoukaiPvpData = {
            ---玩家是否是进攻方
            PlayerIsAtk = isAtk,
            ---自己玩家名
            OwnName = tab.atkName,
            ---对手玩家名
            TargetName = tab.defName,
            ---自己角色 及阵容数据
            OwnTeam = PVPViewModel.GetPvPRole(tab.defTeam,tab.defSkin),
            ---对手角色 及阵容数据
            TargetTeam = PVPViewModel.GetPvPRole(tab.atkTeam,tab.atkSkin),
            ---右侧阵容数据
            RightTeamData = tab.atkTeam,
            ---自己角色皮肤
            OwnTeamSkin = tab.defSkin,
            ---对手角色皮肤
            TargetTeamSkin = tab.atkSkin,
            ---匹配的唯一标识
            Token = tab.token,
            ---战斗播片
            video = tab.video,
            ---胜负状态 2胜利 1失败 （由于进攻方是对手，胜负需要反过来结算）
            result = tab.result
        }
        table.insert(BuDoukaiPvpDataList, BuDoukaiPvpData)
    end
end

function PVPViewModel.CheckBuDoukaiPvpData()
    if #BuDoukaiPvpDataList > 0 then
        tab = BuDoukaiPvpDataList[1]
        PVPViewModel.PlayerIsAtk = tab.PlayerIsAtk
        PVPViewModel.OwnInfo.name = tab.OwnName
        PVPViewModel.TargetInfo.name = tab.TargetName
        PVPViewModel.OwnTeam = tab.OwnTeam
        PVPViewModel.TargetTeam = tab.TargetTeam
        PVPViewModel.OwnTeamSkin = tab.OwnTeamSkin
        PVPViewModel.TargetTeamSkin = tab.TargetTeamSkin
        PVPViewModel.CurToken = tab.token

        BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
        --设置技能等级右侧角色数据
        PVPViewModel.PVPRightRoleData = {}
        PVPViewModel.PVPRightRoleData = tab.RightTeamData

        BattleManager.ClearLuaData()
        PVPViewModel.AllRole = {}
        ---整理PVP队伍
        for i = 1, #PVPViewModel.OwnTeam do
            table.insert(PVPViewModel.AllRole,i,PVPViewModel.OwnTeam[i])
        end
        for i = 1 + #PVPViewModel.OwnTeam, #PVPViewModel.TargetTeam + #PVPViewModel.OwnTeam do
            table.insert(PVPViewModel.AllRole,i,PVPViewModel.TargetTeam[i - #PVPViewModel.OwnTeam])
        end

        ---video整理进FightVideo
        BattleViewModel.GeneVideo(tab.video)
        --设置当前进攻还是防守
        BuDoukaiControl.SetCurAtkOrDef(false)
        ---结果 左侧胜负状态 2胜利 1失败（由于进攻方是对手，胜负需要反过来结算）
        BattleViewModel.isLeftWin = tab.result == 1 and true or false
        
        BattleManager.BattleAgain = true
        ---打开玩家立绘
        MgrTimer.AddDelayNoName(0,function()
            BattleManager.GameMode = BattleManager.GameModeType.BuDoukaiPVP
            PVPViewModel.OpenBattleUI()
        end,nil)
        
        BuDoukaiPvpDataList = {}
        return true
    end
    
    return false
end

function PVPViewModel.Clear()
    PVPViewModel.PlayerIsAtk = true
    PVPViewModel.continue = false
    PVPViewModel.continueCount = 0
    PVPViewModel.continueACK = nil
    PVPViewModel.continueNTF = nil
    PVPViewModel.IsViewRecord = false
    PVPViewModel.RecordResult = {}
    PVPViewModel.type = 1
    PVPViewModel.LowCard = 0
    PVPViewModel.LowCardTime = 0
    PVPViewModel.HighCard = 0
    PVPViewModel.HighCardTime = 0
    PVPViewModel.CurRankData = nil
    PVPViewModel.RoleCacheList = {}
    PVPViewModel.CurToken = 0
    PVPViewModel.CurRankVersion = 0
    PVPViewModel.MessageRankVersion = 0
    PVPViewModel.TargetTeam = {}
    PVPViewModel.OwnTeam = {}
    PVPViewModel.BanRoleList = {}
    PVPViewModel.TargetInfo = {
        name = "",
        score = 0,
        rank = 0
    }
    PVPViewModel.OwnInfo = {
        name = "",
        score = 0,
        rank = 0
    }
    ---PVP结果
    PVPViewModel.resultData = {
        goods = {},
        aScore = 0,
        aRank = 0,
        dScore = 0,
        dRank = 0,
        day = {},
        week = {},
        month = {},
        glory = {},
    }
    PVPViewModel.resultData_continue = {
        name = "",
        score = 0,
        rank = 0,
        selfName = "",
        selfScore = 0,
        selfRank = 0,
        token = "",
        goods = {},
        result = 0,
        aScore = 0,
        aRank = 0,
        dScore = 0,
        dRank = 0,
        day = {},
        week = {},
        month = {},
        glory = {},
    }
    PVPViewModel.isFirstSend = true
    PVPViewModel.ReadyCallBack = nil
    PVPViewModel.ReadyMap = nil
    PVPViewModel.FightMap = nil
    PVPViewModel.isSettle = false
    BuDoukaiPvpDataList = {}
end

function PVPViewModel.SendGetLadderScoreInfoReq(callBack)
    local req = assert(pb.encode('PBClient.ClientGetLadderScoreInfoReq', {}));
    MgrNet.SendReq(MID.CLIENT_GET_LADDER_SCORE_INFO_REQ, req, 0,nil, PVPViewModel.OnGetLadderScoreInfoAck,function(...)
        PVPViewModel.OnGetLadderScoreInfoNtf(...);
        if callBack then
            callBack()
        end
    end)
end

function PVPViewModel.OnGetLadderScoreInfoAck(buffer)
    local ack = assert(pb.decode('PBClient.ClientGetLadderScoreInfoAck', buffer));
    print("PVPViewModel.OnGetLadderScoreInfoAck. errNo: " .. ack.errNo);
    if ack.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true) -- todo xpxp
    end
end

PVPViewModel.season = 0;
PVPViewModel.subSeason = 0;
PVPViewModel.tryHeros = {};
PVPViewModel.tryHerosCache = {};

function PVPViewModel.OnGetLadderScoreInfoNtf(buffer)
    local ntf = assert(pb.decode('PBClient.ClientGetLadderScoreInfoNtf', buffer));
    PVPViewModel.season = ntf.season;
    PVPViewModel.subSeason = ntf.subVersion;
    PVPViewModel.tryHeros = {};
    PVPViewModel.tryHerosCache = {};
    if nil ~= ntf.items and nil ~= ntf.items.data then
        for k, v in pairs(ntf.items.data) do
            local role = RoleData.New(v.cfgID);
            role:SetTryHeroInfo(v.uID, v.props);
            table.insert(PVPViewModel.tryHeros, role);
            table.insert(PVPViewModel.tryHerosCache, role);
        end
    end
    Event.Go("PVPRefreshSeason");
end

function PVPViewModel.GetTryHero(uid, cfgID)
    if nil == PVPViewModel.tryHeros then
        return nil;
    end
    for k, v in pairs(PVPViewModel.tryHeros) do
        if v.tryHeroUID == uid and v.id == cfgID then
            return v;
        end
    end
    return nil;
end

function PVPViewModel.GetSortAndFilterTryHeroArr(filters,sort,rise)
    local array = PVPViewModel.tryHerosCache
    ---有类型时筛选
    if filters and not filters[0] then
        ---筛选
        local filterGroup = {}
        for i, v in pairs(filters) do
            if v then
                table.insert(filterGroup,i)
            end
        end
        array = PVPViewModel.RoleFilter(array, "New_Career", filterGroup)
    end
    ---排序(1等级，2星级，3取得时间, 4稀有度，5好感度)
    local sortGroupArr = {
        [1] = {"level","awaken","rank","star","cTime","favor","id"},
        [2] = {"star","awaken","rank","level","cTime","favor","id"},
        [3] = {"rank","awaken","star","level","cTime","favor","id"},
        [4] = {"favor","awaken","rank","star","level","cTime","id"},
        [5] = {"cTime","awaken","rank","star","level","favor","id"}
    }
    Global.Sort(array,sortGroupArr[sort],{rise,not rise,rise,rise,rise,rise,rise})
    return array
end

function PVPViewModel.RemoveTryHeroCache(heroId)
    for i, data in pairs(PVPViewModel.tryHerosCache) do
        if data.id == heroId then
            table.remove(PVPViewModel.tryHerosCache, i)
            break
        end
    end
end

function PVPViewModel.AddTryHeroCache(uid, cfgID)
    table.insert(PVPViewModel.tryHerosCache, PVPViewModel.GetTryHero(uid, cfgID))
end

function PVPViewModel.AddHeroEx(role)
    if nil == role then
        return;
    end
    if nil ~= role.tryHeroUID then
        PVPViewModel.AddTryHeroCache(tonumber(role.tryHeroUID), tonumber(role.ID));
    else
        PVPViewModel.AddHeroData(tonumber(role.ID))
    end
end

function PVPViewModel.RemoveHeroEx(role)
    if nil == role then
        return;
    end
    if nil ~= role.tryHeroUID then
        PVPViewModel.RemoveTryHeroCache(tonumber(role.ID));
    else
        PVPViewModel.RemoveHeroData(tonumber(role.ID))
    end
end

function PVPViewModel.GetHeroEx(role)
    if nil ~= role and nil ~= role.tryHeroUID then
        return PVPViewModel.GetTryHero(role.tryHeroUID, tonumber(role.ID));
    else
        return HeroControl.GetRoleDataByID(tonumber(role.ID));
    end
end

-- rank

function PVPViewModel.SendGetChampionScoreRankReq(callBack)
    local req = assert(pb.encode('PBClient.ClientGetChampionScoreRankReq', {
        version = PVPViewModel.season,
    }));
    MgrNet.SendReq(MID.CLIENT_GET_CHAMPION_SCORE_RANK_REQ, req, 0,nil, PVPViewModel.OnGetChampionScoreRankAck,function(...)
        PVPViewModel.OnGetChampionScoreRankNtf(...);
        if callBack then
            callBack()
        end
    end)
end

function PVPViewModel.OnGetChampionScoreRankAck(buffer)
    local ack = assert(pb.decode('PBClient.ClientGetChampionScoreRankAck', buffer));
    print("PVPViewModel.OnGetChampionScoreRankAck. errNo: " .. ack.errNo);
    if ack.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true) -- todo xpxp
    end
end

PVPViewModel.championRank = nil;
PVPViewModel.championRankOwn = nil;

function PVPViewModel.OnGetChampionScoreRankNtf(buffer)
    local ntf = assert(pb.decode('PBClient.ClientGetChampionScoreRankNtf', buffer));
    PVPViewModel.championRank = ntf.info;
    PVPViewModel.championRankOwn = ntf.ownInfo;
end

PVPViewModel.testXP = false;
-- champion
-- 请求的赛季 0为当前赛季 其他为往期届数
PVPViewModel.MasterSeasonReq = 0;
-- 显示的赛季
PVPViewModel.MasterSeasonOnShow = 1;
-- 当前进行中的赛季是第几届
PVPViewModel.CurMasterSeason = 1;
PVPViewModel.championInfos = {};

function PVPViewModel.SendGetChampionMatchReq(season, ackCallcack, ntfCallcack)
    PVPViewModel.MasterSeasonReq = season;
    local req = assert(pb.encode('PBClient.ClientGetChampionMatchREQ', {
        version = season,
    }));
    MgrNet.SendReq(MID.CLIENT_GET_CHAMPION_MATCH_REQ, req, 0,nil, function(...)
        PVPViewModel.OnGetChampionMatchAck(ackCallcack, ...);
    end, function(...)
        PVPViewModel.OnGetChampionMatchNtf(...);
        if ntfCallcack then
            ntfCallcack()
        end
    end)
end

function PVPViewModel.OnGetChampionMatchAck(ackCallcack, buffer)
    local ack = assert(pb.decode('PBClient.ClientGetChampionMatchACK', buffer));
    print("PVPViewModel.ClientGetChampionMatchACK. errNo: " .. ack.errNo);
    if ack.errNo ~= 0 then
    end
    if ackCallcack then
        ackCallcack(ack);
    end
end

function PVPViewModel.OnGetChampionMatchNtf(buffer)
    local ntf = assert(pb.decode('PBClient.ClientGetChampionMatchNTF', buffer));
    PVPViewModel.MasterSeasonOnShow = ntf.version;
    if 0 == PVPViewModel.MasterSeasonReq then
        PVPViewModel.CurMasterSeason = ntf.version;
    end
    local serverTime = MgrNet.GetServerTime();
    PVPViewModel.MasterPrepareStart = serverTime + ntf.prepareStart;
    PVPViewModel.MasterFrozenStart = serverTime + ntf.frozenStart;
    PVPViewModel.MasterRewardStart = serverTime + ntf.rewardStart;
    PVPViewModel.championInfos[16] = ntf.sixteen;
    PVPViewModel.championInfos[8] = ntf.eight;
    PVPViewModel.championInfos[4] = ntf.four;
    if 0 ~= ntf.champion.matchID then
        PVPViewModel.championInfos[2] = { ntf.champion };
    else
        PVPViewModel.championInfos[2] = nil;
    end
    -- 季军赛放在64里
    if 0 ~= ntf.thirdPlace.matchID then
        PVPViewModel.championInfos[64] = { ntf.thirdPlace };
    else
        PVPViewModel.championInfos[64] = nil;
    end
    PVPViewModel.MasterTicketLeft = ntf.ticketLeft;
    PVPViewModel.MasterTotalEnd = ntf.totalEnd;
    PVPViewModel.MasterGuessHistory = ntf.record;
    PVPViewModel.IsMasterDeploy = ntf.isDeploy;
end
-- 当前大师赛是否开启
function PVPViewModel.MasterIsOpen()
    return PVPViewModel.MasterTotalEnd > 0;
end
-- 当前大师赛是否已进入决赛阶段
function PVPViewModel.MasterFinalIsOpen()
    return nil ~= PVPViewModel.championInfos[2] and nil ~= PVPViewModel.championInfos[64];
end
-- 检查玩家是否在某轮比赛中
function CheckPlayerInMasterMatchs(matchs, playerid)
    if nil == matchs then
        return false;
    end
    for _, math in ipairs(matchs) do
        if math.player1.id == playerid or math.player2.id == playerid then
            return true;
        end
    end
    return false;
end
-- 是否入围大师赛
function PVPViewModel.InPVPMaster(playerid)
    if 0 ~= PVPViewModel.MasterSeasonReq then
        -- 往届不算
        return false;
    end
    -- 进了16强就算
    return CheckPlayerInMasterMatchs(PVPViewModel.championInfos[16], playerid);
end
-- 是否在大师赛中仍未被淘汰
function PVPViewModel.AlivePVPMaster(playerid)
    if 0 ~= PVPViewModel.MasterSeasonReq then
        -- 往届不算
        return false;
    end
    -- 决赛阶段
    if PVPViewModel.MasterFinalIsOpen() then
        return CheckPlayerInMasterMatchs(PVPViewModel.championInfos[2], playerid) or CheckPlayerInMasterMatchs(PVPViewModel.championInfos[64], playerid);
    end
    -- 4强阶段
    if nil ~= PVPViewModel.championInfos[4] then
        return CheckPlayerInMasterMatchs(PVPViewModel.championInfos[4], playerid);
    end
    -- 8强阶段
    if nil ~= PVPViewModel.championInfos[8] then
        return CheckPlayerInMasterMatchs(PVPViewModel.championInfos[8], playerid);
    end
    -- 16强阶段
    if nil ~= PVPViewModel.championInfos[16] then
        return CheckPlayerInMasterMatchs(PVPViewModel.championInfos[16], playerid);
    end
end

function PVPViewModel.GetChampionMatchAndPlayer(type, playerIdx)
    local matchIdx = math.ceil(playerIdx / 2);
    local ret = {
        type = type,
        playerIdx = playerIdx,
        matchIdx = matchIdx,
    };
    if nil == PVPViewModel.championInfos[type] or nil == PVPViewModel.championInfos[type][matchIdx] then
        return ret;
    end
    ret.match = PVPViewModel.championInfos[type][matchIdx];
    if nil == ret.match then
        return ret;
    end
    if playerIdx / 2 == matchIdx then
        ret.player = ret.match.player2;
        ret.isFirst = false;
    else
        ret.player = ret.match.player1;
        ret.isFirst = true;
    end
    return ret;
end

--region history

--- 获取全部赛季的前三名玩家信息，不包括阵容数据
function PVPViewModel.SendGetChampionHistoryReq(callBack)
    local req = assert(pb.encode('PBClient.ClientGetChampionHistoryREQ', {
        version = PVPViewModel.season,
    }));
    MgrNet.SendReq(MID.CLIENT_GET_CHAMPION_HISTORY_REQ, req, 0,nil, PVPViewModel.OnGetChampionHistoryAck,function(...)
        PVPViewModel.OnGetChampionHistoryNtf(...);
        if callBack then
            callBack()
        end
    end)
end

function PVPViewModel.OnGetChampionHistoryAck(buffer)
    local ack = assert(pb.decode('PBClient.ClientGetChampionHistoryACK', buffer));
    print("PVPViewModel.ClientGetChampionHistoryACK. errNo: " .. ack.errNo);
    if ack.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true) -- todo xpxp
    end
end

function PVPViewModel.OnGetChampionHistoryNtf(buffer)
    local ntf = assert(pb.decode('PBClient.ClientGetChampionHistoryNTF', buffer));
    PVPViewModel.ChampionHistory = ntf.info;
    -- 有时数据是乱序的，规范为升序
    Global.Sort(PVPViewModel.ChampionHistory, {"version"}, false)
end

--- 获取某个赛季某个玩家的阵容
---@param playerId int
---@param season int? @ default 当前赛季
---@param callback fun(team:table)? @ team 结构见协议 ClientGetChampionHistoryTeamNTF
function PVPViewModel.SendGetChampionHistoryTeamReq(playerId, season, callback)
    season = season or PVPViewModel.season
    local req = assert(pb.encode("PBClient.ClientGetChampionHistoryTeamREQ", {
        PlayerID = playerId,
        Version = season,
    }))
    MgrNet.SendReq(MID.CLIENT_GET_CHAMPION_HISTORY_TEAM_REQ, req, 0, nil, function(buffer, tag) 
        MgrNet.CommonACK("PBClient.ClientGetChampionHistoryTeamACK", buffer, tag)
    end, function(buffer, tag) 
        local ntf = assert(pb.decode("PBClient.ClientGetChampionHistoryTeamNTF", buffer))
        if callback then
            callback(ntf)
        end
    end)
end

function PVPViewModel.GetChampionHistoryCount()
    if nil == PVPViewModel.ChampionHistory then
        return 0;
    end
    return #PVPViewModel.ChampionHistory;
end

---@param bReverse boolean @ 倒序获取
function PVPViewModel.GetChampionHistoryInfo(idx, bReverse)
    if nil == PVPViewModel.ChampionHistory then
        return nil;
    end
    if bReverse then
        local count = PVPViewModel.GetChampionHistoryCount()
        return PVPViewModel.ChampionHistory[count - idx + 1]
    end
    return PVPViewModel.ChampionHistory[idx];
end

function PVPViewModel.ReformTeam(originTeam)
    -- 返回数组结构
    --{
    --    required int32 ID = 1;
    --    required int32 pos = 2;
    --    optional int32 tryHeroUID = 3;
    --}
    local sortedTeam = {};
    -- team.info FighterBase 类型的数组，数组顺序就是攻击顺序，站位是 index 字段
    for _, selfFighter in ipairs(originTeam.info) do
        table.insert(sortedTeam, {
            ID = selfFighter.roleID,
            pos = selfFighter.index,
        });
    end    
    -- team.tryHero TryHeroInfo 类型的数组，要根据 atkOrder 插入到自有角色序列中去，站位是 pos 字段
    if nil ~= originTeam.tryHero then
        local sortedTryHero = clone(originTeam.tryHero);
        -- 服务器发来的数据可能是无序的，需要先根据atkOrder字段排序
        table.sort(sortedTryHero, function(a, b)
            return a.atkOrder < b.atkOrder;
        end)
        for _, tryFighter in ipairs(sortedTryHero) do
            local hero = PVPViewModel.GetTryHero(tryFighter.uid, tonumber(tryFighter.roleID));
            if nil ~= hero then
                local info = {
                    ID = tryFighter.roleID,
                    pos = tryFighter.pos,
                    tryHeroUID = tryFighter.uid,
                }
                if tryFighter.atkOrder > #sortedTeam + 1 then
                    table.insert(sortedTeam, info);
                else
                    table.insert(sortedTeam, tryFighter.atkOrder, info);
                end
            end
        end
    end
    return sortedTeam;
end

--endregion history

-- vote

function PVPViewModel.SendChampionVoteReq(matchid, playerid, count, callBack)
    local req = assert(pb.encode('PBClient.ClientChampionVoteREQ', {
        matchID = matchid,
        votePlayer = playerid,
        voteNum = count,
    }));
    MgrNet.SendReq(MID.CLIENT_CHAMPION_VOTE_REQ, req, 0,nil, PVPViewModel.OnChampionVoteAck,function(...)
        PVPViewModel.OnChampionVoteNtf(...);
        if callBack then
            callBack()
        end
    end)
end

function PVPViewModel.OnChampionVoteAck(buffer)
    local ack = assert(pb.decode('PBClient.ClientChampionVoteACK', buffer));
    print("PVPViewModel.ClientChampionVoteACK. errNo: " .. ack.errNo);
    if ack.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("playeravatarviewmodel_tips1"),2},true) -- todo xpxp
    end
end

function PVPViewModel.OnChampionVoteNtf(buffer)
    local ntf = assert(pb.decode('PBClient.ClientChampionVoteNTF', buffer));
    PVPViewModel.MasterTicketLeft = ntf.ticketLeft;
    PVPViewModel.MasterGuessHistory = ntf.record;
    Event.Go("PVPMasterTicketRefresh");
end

function PVPViewModel.GetGuessHistoryCount(matchID)
    if nil == PVPViewModel.MasterGuessHistory then
        return 0;
    end
    for _, v in pairs(PVPViewModel.MasterGuessHistory) do
        if v.matchID == matchID then
            return v.voteNum;
        end
    end
    return 0;
end

function PVPViewModel.GetGuessHistoryPlayer(matchID)
    if nil == PVPViewModel.MasterGuessHistory then
        return -1;
    end
    for _, v in pairs(PVPViewModel.MasterGuessHistory) do
        if v.matchID == matchID then
            return v.voteForPlayer;
        end
    end
    return -1;
end
require("LocalData/MasterPVPLocalData")
function PVPViewModel.GetMasterRewards(season)
    local ret = {};
    for _, v in pairs(MasterPVPLocalData.tab) do
        if tonumber(v[3]) == season then
            table.insert(ret, v);
        end
    end
    table.sort(ret, function(a, b) 
        return a[6] < b[6];
    end)
    return ret;
end

function PVPViewModel.GetMasterPlayerInfo(playerid)
    if nil == PVPViewModel.championInfos[16] then
        return nil;
    end
    for _, v in pairs(PVPViewModel.championInfos[16]) do
        if v.player1.id == playerid then
            return v.player1;
        end
        if v.player2.id == playerid then
            return v.player2;
        end
    end
    return nil;
end

return PVPViewModel