require("Model/YueTa/Data/YueTaData")
require("Model/YueTa/Data/YueTaBuffData")
require("LocalData/AbyssbuffLocalData")
require("LocalData/PlayheadframeLocalData")
YueTaControl = {}
---@type YueTaData
local YueTaInfo = nil
local RankData = nil
local BuffList = {}         ---BUFF列表
YueTaControl.ModeType = {
    EASY = 1,
    HARD = 2,
}
---BUFF品级底图
YueTaControl.TargetRes = {
    "Img_title_wofang","Img_title_difang","Img_title_shuangfang"
}
---特性阶段颜色
YueTaControl.StageColor = {
    [1] = { Color(0.38,0.38,0.38,1),Color(0.86,0.86,0.86,1) },
    [2] = { Color(0,0.87,0.47,1), Color(0.35,1,0.81,1) },
    [3] = { Color(0.77,1,0.98,1), Color(0.35,0.74,1,1) },
    [4] = { Color(0.48,0.09,0.77,1), Color(0.82,0.35,1,1) },
    [5] = { Color(0.91,0.3,0,1), Color(1,0.69,0.28,1) },
}
local YueTaMode = YueTaControl.ModeType.EASY
local CurPoint = nil

function YueTaControl.Init()
    for k,v in pairs(ActivityLocalData.tab) do
        if v[2] == ActivityControl.activityTypeEnum.MONTH_EVENT then
            YueTaInfo = YueTaData.New()
            YueTaInfo:PushYueTaData(v[1])
        end
    end
    ---月塔BUFF
    for k,v in ipairs(AbyssbuffLocalData.tab) do
        if v.enable == 1 then
            BuffList[k] = YueTaBuffData.New(v)
        end
    end
end

function YueTaControl.OpenHome()
    local isSysOpen,str = ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.MONTH_EVENT)
    if not isSysOpen then
        MgrUI.Pop(UID.PopTip_UI, { str, 1 }, true)
        return
    end
    RedDotControl.GetDotData("Yueta"):SetState(false)
    UnityEngine.PlayerPrefs.SetInt("Yueta_" .. YueTaControl.GetYueTaInfo().version .. "_"..PlayerControl.GetPlayerData().UID,1)
    MgrUI.GoHide(UID.NewYueta_UI)
end

function YueTaControl.OpenUI()
    MgrUI.GoHide(UID.Yueta_UI)
end

function YueTaControl.GetYueTaInfo()
    if YueTaInfo == nil then
        YueTaControl.Init()
    end
    return YueTaInfo
end

function YueTaControl.CheckRedPoint()
    --RedDotControl.GetDotData("Yueta"):SetState(false)
    --if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.MONTH_EVENT) then
    --    return
    --end
    --if UnityEngine.PlayerPrefs.GetInt("Yueta_" .. YueTaControl.GetYueTaInfo().version .. "_"..PlayerControl.GetPlayerData().UID) == 0 then
    --    RedDotControl.GetDotData("Yueta"):SetState(true)
    --end
end
---获取BUFF列表
function YueTaControl.GetBuffList()
    return BuffList
end
---打开月塔排行榜，请求排行数据
function YueTaControl.OpenRank(callback)
    local bytes = assert(pb.encode('PBClient.ClientGetMonthTowerRankREQ', { rev = "" }))
    MgrNet.SendReq(MID.CLIENT_GET_MONTH_TOWER_RANK_REQ,bytes,0,nil,YueTaControl.OpenRankAck,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientGetMonthTowerRankNTF', buffer))
        if callback then
            callback(tab)
        end
        RankData = tab
        if RankData.info ~= nil then
            Global.Sort(RankData.info,{"rank"})
        end
        if RankData.lastInfo ~= nil then
            Global.Sort(RankData.lastInfo,{"rank"})
        end
        MgrUI.GoHide(UID.YuetaTop_UI)
    end)
end
function YueTaControl.OpenRankAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientGetMonthTowerRankACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end
---打开BUFF界面
function YueTaControl.OpenBuffUI()
    MgrUI.GoHide(UID.YuetaBuff_UI)
end
---保存BUFF
function YueTaControl.SaveBuff(_buffList,callBack)
    local InnerTowerBuffReq =
    {
        buffIDs = _buffList
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientInnerTowerBuffSelectREQ', InnerTowerBuffReq))
    MgrNet.SendReq(MID.CLIENT_INNER_TOWER_BUFF_SELECT_REQ,bytes,0,nil,YueTaControl.SaveBuffAck,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientInnerTowerBuffSelectNTF', buffer))
        YueTaViewModel.SaveInnerTowerBuff(tab.innerBuff)
        if callBack then
            callBack()
        end
    end)
end
function YueTaControl.SaveBuffAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientInnerTowerBuffSelectACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end
function YueTaControl.GetRankData()
    return RankData
end

function YueTaControl.InnerTowerResetAck(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientInnerTowerResetACK', buffer))
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{"ErrorNumber : " .. tab.errNo,1},true)
    end
end

---月塔模式
function YueTaControl.SetMode(mode)
    YueTaMode = mode
end
function YueTaControl.GetMode()
    return YueTaMode
end
---特性阶段
---当前分数属于的阶段,各阶段文字颜色,设置最大分数
function YueTaControl.CheckStage(_point)
    local tStageList = string.split(SteamLocalData.tab[121005][2],',')
    local tStage = #tStageList
    for i, v in ipairs(tStageList) do
        if _point < tonumber(v) then
            tStage = i
            break
        end
    end
    ---当前分数属于的阶段,各阶段文字颜色,设置最大分数
    return tStage,YueTaControl.StageColor[tStage],tStageList[#tStageList]
end
---当前困难关卡数据
function YueTaControl.SetCurPoint(_point)
    CurPoint = _point
end
function YueTaControl.GetCurPoint()
    return CurPoint
end

function YueTaControl.Clear()
    YueTaInfo = nil
    RankData = nil
    CurPoint = nil
    BuffList = {}
    YueTaMode = YueTaControl.ModeType.EASY
end

return YueTaControl