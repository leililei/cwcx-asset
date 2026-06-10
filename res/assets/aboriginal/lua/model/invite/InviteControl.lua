require("Model/Invite/Data/InviteData")
---配置表
require("LocalData/AcquisitionrewardLocalData")
---管理器
InviteControl = {}
---@type InviteData[] 新人专属数据
local NewComersData = {}
---@type InviteData[] 邀请任务数据
local InviteTaskData = {}
---邀请码
local InvCode = ""
---已领取的奖励下标列表
local InvIDList = {}
---邀请人数
local InviteNum = 0

function InviteControl.Init()
    for i, v in pairs(AcquisitionrewardLocalData.tab) do
        if v.rewardtype == 0 then
            table.insert(NewComersData, InviteData.New(v))
        else
            table.insert(InviteTaskData, InviteData.New(v))
        end
    end
    InviteControl.AddInviteNtf()
end
---@return InviteData[] 获取新人专属数据
function InviteControl.GetNewComers()
    return NewComersData
end
---@return InviteData[] 获取邀请任务数据
function InviteControl.GetInviteTask()
    return InviteTaskData
end
---邀请码
function InviteControl.GetInvCode()
    return InvCode
end
---已领取的奖励下标列表
function InviteControl.GetInvIdList()
    return InvIDList
end
---邀请人数
function InviteControl.GetInviteNum()
    return InviteNum
end
---获取拉新数据
function InviteControl.GetInviteDataReq()
    if not ActivityControl.CheckActiveOpen(ActivityControl.activityTypeEnum.INVITE) then
        return
    end
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientGetInvCodeReq',{}))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_GET_INV_CODE_REQ,bytes,0,nil,function()  end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientGetInvCodeNtf',buffer))
        InvCode = tab.invCode
        InvIDList = tab.claimRewards == nil and {} or tab.claimRewards
        InviteNum = tab.progress
        InviteControl.UpdateRedDot()
    end)
end
---更新奖励红点
function InviteControl.UpdateRedDot()
    for i, idx in ipairs(InvIDList) do
        local isEnter = false
        for i, v in ipairs(NewComersData) do
            if v.id == idx then
                v:SetState(true)
                isEnter = true
                break
            end
        end
        if not isEnter then
            for i, v in ipairs(InviteTaskData) do
                if v.id == idx then
                    v:SetState(true)
                    break
                end
            end
        end
    end
    
    local isRedDot = false
    for i, v in ipairs(InviteTaskData) do
        if not v.state and InviteNum >= v.number then
            isRedDot = true
        end
    end
    RedDotControl.GetDotData("Invite"):SetState(isRedDot)
    Event.Go("ActivityDot")
end
---添加他人使用本账号的邀请码的监听
function InviteControl.AddInviteNtf()
    MgrNet.RegisterNTF(MID.CLIENT_INV_UPDATE_NTF,function(buffer,tag)
        InviteNum = InviteNum + 1
        InviteControl.UpdateRedDot()
    end)
end
---输入邀请码，领取奖励
function InviteControl.InCodeReq(_invCode,callback)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientUseInvCodeReq',{ invCode = _invCode }))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_USE_INV_CODE_REQ,bytes,0,nil,function()  end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseInvCodeNtf',buffer))
        if tab.reward then
            ---将奖励推送进背包
            ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
        end
        InvIDList = tab.claimRewards
        --更新奖励红点
        InviteControl.UpdateRedDot()
        if callback then
            callback()
        end
    end)
end
---领取他人使用邀请码后的奖励
function InviteControl.ClaimRewardReq(callback)
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientClaimInvRewardReq',{}))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_CLAIM_INV_REWARD_REQ,bytes,0,nil,function()  end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientClaimInvRewardNtf',buffer))
        if tab.reward then
            ---将奖励推送进背包
            ItemControl.PushGroupItemData(tab.reward,ItemControl.PushEnum.add)
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.reward},true)
        end
        InvIDList = tab.claimRewards
        InviteNum = tab.progress
        --更新奖励红点
        InviteControl.UpdateRedDot()

        if callback then
            callback()
        end
    end)
end

function InviteControl.Clear()
    NewComersData = {}
    InviteTaskData = {}
    InvCode = ""
    InvIDList = {}
    InviteNum = 0
end

return InviteControl