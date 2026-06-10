---@class NoviceActivityStageData
NoviceActivityStageData = Class("NoviceActivityStageData")

-------------构造方法-------------
function NoviceActivityStageData:ctor(id)
    local config = RecruitactivityLocalData.tab[id]
    self.id = config[1]
    self.activityId = config[2]
    self.name = config[3]
    self.resource = config[4]
    self.icon = config[5]
    self.taskId = config[6]
    ---奖励
    local arr = string.split(config[7],"_")
    local goods =
    {
        goodsID = tonumber(arr[2]),
        goodsType = tonumber(arr[1]),
        goodsNum = tonumber(arr[3]),
    }
    self.reward = goods
    self.btnBg = config[8]
    self.btnEffect = config[9]
    self.btnColor = config[10] == "0" and config[10] or string.split(config[10],",")
end

return NoviceActivityStageData