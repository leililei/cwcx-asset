require("LocalData/NewshowerLocalData")
require("Model/Bath/BathRoleData")
BathControl = {}
---@type BathRoleData[] 搓澡角色数据
local BathRoleArr = {}
---小游戏id
BathControl.GameId = nil
BathControl.GameData = nil
---小游戏类型
BathControl.GameType = nil
---小游戏完成后剧情名
BathControl.PlotAfter = nil
---小游戏分数
BathControl.score = 0

function BathControl.Init()
    ---初始化角色数据
    for k,v in pairs(NewshowerLocalData.tab) do
        BathRoleArr[k] = BathRoleData.New(v)
    end

    BathControl.GetGameInfoReq()
end

---获取角色
function BathControl.GetRole(page)
    local arr = {}
    for k,v in pairs(BathRoleArr) do
        if tonumber(v.Page) == page then
            table.insert(arr,v)
        end
    end
    Global.Sort(arr,{"sort"},false)
    return arr
end

---@return BathRoleData 获取单个角色
function BathControl.GetSingleRole(roleId)
    for k,v in pairs(BathRoleArr) do
        if roleId == v.roleId then
            return v
        end
    end
    return nil
end

---检查当前角色数据是否有奖励可领取
function BathControl.TryGetUnReceiveAward(roleId)
    ---@type BathRoleData
    local data = BathControl.GetSingleRole(roleId)
    for k,v in pairs(data.gameIds) do
        if data:CheckCanReceiveReward(tonumber(k)) then
            return tonumber(k)
        end
    end
    return false
end

---@return AchievementTaskData 获取搓澡任务
function BathControl.GetTaskList(id)
    local arr = {}
    for k,v in pairs(TaskControl.AchievementDataList) do
        if v.taskGroupID == id then
            if TaskControl.CheckComplete(v.id) then
                v.isComplete = 1
            else
                v.isComplete = 0
            end
            if TaskControl.CheckAchieveReceived(v) then
                v.isReceive = 1
            else
                v.isReceive = 0
            end
            table.insert(arr,v)
        end
    end
    Global.Sort(arr,{"id"},false)
    return arr
end

---检查角色是否升过阶段
function BathControl.CheckRoleLockState(roleId)
    for k,v in pairs(BathRoleArr) do
        if v.roleId == roleId then
            if  v.curPhase == 0 then
                return false
            else
                return true
            end
        end
    end
    return false
end

---检查对应角色是否通关指定游戏id
function BathControl.CheckPassGameId(roleId,GameId)
    local role = BathControl.GetSingleRole(roleId)
    for k,v in pairs(role.gameIds) do
        if GameId == v then
            return true
        end
    end
    return false
end

---打开搓澡主界面
function BathControl.OpenBathHome()
    if SysLockControl.CheckSysLock(1611) then
        MgrUI.GoHide(UID.BathHome_UI)
    else
        MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1611)},true)
    end
end

---打开搓澡游戏
---@param data BathRoleData
function BathControl.OpenBathGame(type,id,data,plot)
    BathControl.GameType = type
    BathControl.GameId = id
    BathControl.GameData = data
    BathControl.PlotAfter = nil
    --如果存在游戏后剧情
    if plot and plot ~= "0" then
        BathControl.PlotAfter = plot
    end
    MgrUI.GoHide(UID.BathGame_UI)
end

---打开搓澡结束界面
function BathControl.OpenBathGameEnd()
    --播放usm
    MgrUI.Pop(UID.UsmPlay,{"BathEndVedio",function()
        MgrUI.GoHide(UID.BathGameEnd_UI)
    end })
end

---获取游戏信息
function BathControl.GetGameInfoReq()
    local BaseREQ = {
        rev = "1"
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetNGameInfoREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_N_GAME_INFO_REQ,bytes,0,nil, BathControl.GetGameInfoAck,BathControl.GetGameInfoNtf)
end

function BathControl.GetGameInfoAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetNGameInfoACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkcontrol_tips1"),2},true)
    end
end

function BathControl.GetGameInfoNtf(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetNGameInfoNTF',buffer))
    --如果存在数据
    if tab.GameS then
        for k,v in pairs(tab.GameS) do
            for  i,data in pairs(BathRoleArr) do
                if v.RoleID == data.roleId then
                    data:PushData(v.Phase,v.GameIDs,v.GameReward)
                end
            end
        end
    end
end

---游戏升级
function BathControl.GameUpREQ(id,curPhase,gameID,callback)
    local BaseREQ = {
        RoleID = id,
        Phase = curPhase,
        GameID = gameID,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientNGamePhaseUPREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_N_GAME_PHASE_UP_REQ,bytes,0,nil, BathControl.GameUpACK,function(...)
        BathControl.GameUpNTF(...,nil,callback)
    end)
end

function BathControl.GameUpACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientNGamePhaseUPACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetErrorByKey(tab.errNo), 2 }, true)
        ---修改点击特效
        CMgrUI.Instance:CleanClickAllChild()
        MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/llx_dianji.prefab',function(clickeff)
            CMgrUI.Instance:SetClickEffect(clickeff)
        end)
        ---回到登录界面
        MgrSdk.BackToLogin()
    end
end

function BathControl.GameUpNTF(buffer,tag,callback)
    local tab = assert(pb.decode('PBClient.ClientNGamePhaseUPNTF',buffer))
    --推送数据
    for k,v in pairs(BathRoleArr) do
        if v.roleId == tab.GameS.RoleID then
            v:PushData(tab.GameS.Phase,tab.GameS.GameIDs,tab.GameS.GameReward)
        end
    end
    --物品消耗
    if tab.cost then
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    end
    --更新统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if callback then
        callback()
    end
end

function BathControl.NGameRewardREQ(roleId,gameID,callback)
    local BaseREQ = {
        RoleID = roleId,
        GameID = gameID,
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientNGameRewardREQ',BaseREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_N_GAME_REWARD_REQ,bytes,0,nil, BathControl.NGameRewardACK,function(...)
        BathControl.NGameRewardNTF(...,nil,callback)
    end)
end

function BathControl.NGameRewardACK(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientNGameRewardACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("arkcontrol_tips1"),2},true)
    end
end

function BathControl.NGameRewardNTF(buffer,tag,callback)
    local tab = assert(pb.decode('PBClient.ClientNGameRewardNTF',buffer))
    --推送数据
    for k,v in pairs(BathRoleArr) do
        if v.roleId == tab.GameS.RoleID then
            v:PushData(tab.GameS.Phase,tab.GameS.GameIDs,tab.GameS.GameReward)
        end
    end
    --物品添加
    if tab.reward then
        --将奖励推送进背包
        ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
        --弹出奖励弹窗
        MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
        ---重新初始化加载图片数据
        SettingViewModel.LoadingImageInit()
    end
    --更新统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    if callback then
        callback()
    end
end

function BathControl.Clear()
    BathRoleArr = {}
    BathControl.GameId = nil
    BathControl.GameData = nil
    BathControl.GameType = nil
    BathControl.PlotAfter = nil
    BathControl.score = 0
end

return BathControl