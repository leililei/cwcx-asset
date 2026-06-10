require("Model/Team/Data/TeamData")
require("LocalData/SteamLocalData")
---阵容管理器
TeamControl = {}

---重置用的默认阵型
TeamControl.faultPVPTeam =  {
    [1] = {index = 1,roleID = tonumber(string.split(SteamLocalData.tab[104018][2],",")[1])},
    [2] = {index = 2,roleID = tonumber(string.split(SteamLocalData.tab[104018][2],",")[2])},
    [3] = {index = 3,roleID = tonumber(string.split(SteamLocalData.tab[104018][2],",")[3])},
}
TeamControl.faultPvp = false
---@type TeamData[] 阵容数据
local TeamListData = {}
---阵容数量限制
local MaxTeam = tonumber(SteamLocalData.tab[110000][2])
--PVP大师赛进攻阵容
TeamControl.PVPMasterAtk = 10007;
--PVP大师赛防守阵容
TeamControl.PVPMasterDef = 10008;
---初始化阵容数据
function TeamControl.InitTeamData(data)
    ---创建默认阵容数据
    for i = 0, MaxTeam do
        TeamListData[i] = TeamData.New(i)
    end
    TeamListData[10000] = TeamData.New(10000)   --小天梯进攻阵容
    TeamListData[10001] = TeamData.New(10001)   --大天梯进攻阵容
    TeamListData[10002] = TeamData.New(10002)   --大天梯防守阵容
    TeamListData[10003] = TeamData.New(10003)   --月塔战斗阵容
    TeamListData[10004] = TeamData.New(10004)   --好友PVP阵容
    TeamListData[10005] = TeamData.New(10005)   --武道会攻击阵容
    TeamListData[10006] = TeamData.New(10006)   --武道会防守阵容
    TeamListData[666] = TeamData.New(666)
    --TeamListData[MultiBossControl.TeamIdx + 1] = TeamData.New(MultiBossControl.TeamIdx + 1);
    --TeamListData[MultiBossControl.TeamIdx + 2] = TeamData.New(MultiBossControl.TeamIdx + 2);
    TeamListData[TeamControl.PVPMasterAtk] = TeamData.New(TeamControl.PVPMasterAtk);
    TeamListData[TeamControl.PVPMasterDef] = TeamData.New(TeamControl.PVPMasterDef);
    ---获取服务器所有阵容
    if data == nil then
        print("尚未存储阵容")
        return
    end
    ---@param team TeamInfo 更新阵容数据
    for i, team in pairs(data) do
        if TeamListData[team.index] == nil then
            print("阵容超出索引："..team.index)
        else
            ---添加到阵容数据
            TeamListData[team.index]:PushData(team)
        end
    end
end

---@return TeamData[] 获取不含0、10000、10001的所有阵容数据
function TeamControl.GetNormalAllTeamData()
    local arr = {}
    for i, data in pairs(TeamListData) do
        if data.index <= MaxTeam and data.index > 0 then
            arr[#arr + 1] = data
        end
    end
    return arr
end

---@return TeamData[] 获取不含0的所有阵容数据
function TeamControl.GetAllTeamData()
    local arr = {}
    for i, data in pairs(TeamListData) do
        if data.index == 0 then
        else
            arr[#arr + 1] = data
        end
    end
    return arr
end

---@param index number 获取本地阵容,阵容编号(>=0 为单个阵容 0为当前使用的阵容 10000为小天梯阵容,10001为大天梯阵容)
---@return TeamData
function TeamControl.GetTeamData(index)
    if TeamListData[index] == nil then
        print("索引阵容不存在,索引:"..index)
    end
    return TeamListData[index]
end

---@param index number 获取服务器阵容,阵容编号(>=0 为单个阵容 0为当前使用的阵容 <0 为所有阵容 10000为小天梯阵容,10001为大天梯阵容)
function TeamControl.SendTeamData(index)
    local data = {
        index = index
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTeamDataREQ',data))
    ---请求阵容数据
    MgrNet.SendReq(MID.CLIENT_TEAM_DATA_REQ,bytes,0,nil,TeamControl.ReceiveTeamAck,TeamControl.ReceiveTeamNtf)
end
---阵容数据确认提示
function TeamControl.ReceiveTeamAck(buffer, tag)
    local info = assert(pb.decode('PBClient.ClientTeamDataACK',buffer))
    if info.errNo ~= 0 then
        Log.Error(ServerError[info.errNo])
    end
end
---接收阵容数据
function TeamControl.ReceiveTeamNtf(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTeamDataNTF',buffer))
    if tab.data == nil then
        print("尚未存储阵容")
        return
    end
    ---@param team TeamInfo 更新阵容数据
    for i, team in pairs(tab.data) do
        if TeamListData[team.index] == nil then
            print("阵容超出索引："..team.index)
        else
            ---添加到阵容数据
            TeamListData[team.index]:PushData(team)
        end
    end
end
---@param list number[] 请求保存阵型
function TeamControl.SendSaveTeamData(list,isTips,callback)
    ---@type TeamInfo[]
    local teams = {}
    for i, index in pairs(list) do
        teams[#teams + 1] = {
            index = index,
            name = TeamListData[index].name,
            data = TeamListData[index].info,
            tryHero = { data = TeamListData[index].tryHero },
        }
    end
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientTeamSaveREQ',{data = teams}))
    ---请求阵容数据
    MgrNet.SendReq(MID.CLIENT_TEAM_SAVE_REQ,bytes,isTips and 1 or 0,function(err,msgId)
        if not err then
            Log.Error("队伍发送失败")
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"),err),1},true)
            BattleViewModel.TeamCorrect = false
            ---网络异常处理（待处理）
            MgrUI.UnLock("battle_start")
        end
    end,TeamControl.ReceiveSaveTeamAck,function(...)
        TeamControl.ReceiveSaveTeamNtf(...)
        if callback then
            callback()
        end
    end)
end
---阵容数据确认提示
function TeamControl.ReceiveSaveTeamAck(buffer, tag)
    local info = assert(pb.decode('PBClient.ClientTeamSaveACK',buffer))
    if info.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetErrorByKey(info.errNo),1 },true)
        
        PVPViewModel.FirstEnterPVPUI = false
        BattleViewModel.TeamCorrect = false
        MgrUI.UnLock("battle_start")
    else
        if tag == 1 then
            if TeamControl.faultPvp  then
                TeamControl.faultPvp = false
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("teamcontrol_tips2"),1},true)
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("teamcontrol_tips3"),1},true)
            end
        end
    end
end
---接收阵容数据
function TeamControl.ReceiveSaveTeamNtf(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientTeamSaveNTF',buffer))
    if tab.data == nil then
        print("尚未存储阵容")
        BattleViewModel.TeamCorrect = false
        MgrUI.UnLock("battle_start")
        return
    end
    ---@param team TeamInfo 更新阵容数据
    for i, team in pairs(tab.data) do
        if TeamListData[team.index] == nil then
            print("阵容超出索引："..team.index)
            BattleViewModel.TeamCorrect = false
            MgrUI.UnLock("battle_start")
        else
            ---添加到阵容数据
            TeamListData[team.index]:PushData(team)
            BattleViewModel.TeamCorrect = true
        end
    end
end
---修改阵容名称
---@param index number 索引
---@param name string 名称
function TeamControl.ChangeTeamName(index,name)
    if TeamListData[index] == nil then
        print("访问阵型失败,索引："..index)
        return
    end
    TeamListData[index]:SetName(name)
end
---修改阵容阵型
---@param index number 索引
---@param info FighterBase[] 阵型
function TeamControl.ChangeTeamInfo(index,info)
    if TeamListData[index] == nil then
        print("访问阵型不存在,索引："..index)
        return
    end
    TeamListData[index]:SetInfo(info)
    if info == TeamControl.faultPVPTeam then
        TeamControl.faultPvp = true
    else
        TeamControl.faultPvp = false
    end
end
function TeamControl.ChangeTeamInfoEx(index, info, tryHero)
    if TeamListData[index] == nil then
        print("访问阵型不存在,索引："..index)
        return
    end
    TeamListData[index]:SetInfo(info);
    TeamListData[index]:SetTryHero(tryHero);
    if info == TeamControl.faultPVPTeam then
        TeamControl.faultPvp = true
    else
        TeamControl.faultPvp = false
    end
end

---清除我方上阵的列表中助战角色
function TeamControl.ClearFriendRole()
    if TeamListData[0] == nil then
        print("访问阵型不存在,索引："..index)
        return
    end
    for i, v in ipairs(TeamListData[0].info) do
        if v.userID ~= nil then
            table.remove(TeamListData[0].info,i)
        end
    end
end

function TeamControl.Clear()
    TeamListData = {}
end

return TeamControl
