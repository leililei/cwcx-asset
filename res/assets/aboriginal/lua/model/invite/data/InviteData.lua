---@class InviteData 物品数据
InviteData = Class("InviteData")
-------------构造方法-------------
---@param _data AcquisitionrewardLocalData
function InviteData:ctor(_data)
    self.id = _data.id
    self.version = _data.version
    self.rewardtype = _data.rewardtype
    self.number = _data.number
    local tStr = string.split(_data.rewardid,'_')
    self.reward = {
        goodsType = tonumber(tStr[1]),
        goodsID = tonumber(tStr[2]),
        goodsNum = tonumber(tStr[3])
    }
    ---领取状态
    self.state = false
end

function InviteData:SetState(_state)
    self.state = _state
end

return InviteData