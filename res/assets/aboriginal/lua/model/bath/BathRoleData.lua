---@class BathRoleData 共鸣装备数据
BathRoleData = Class("BathRoleData")
-------------构造方法-------------
---@param data NewshowerLocalData
function BathRoleData:ctor(data)
    self.id = data.id
    self.roleId = data.charid
    self.sort = data.sort
    self.name = data.name
    self.roleImg = data.pic
    self.hasVoice = data.voice == 1 and true or false
    self.reward = string.split(data.reward,";")
    self.collection = string.split(data.bashitem,";")
    self.phase = string.split(data.phase,";")
    self.gameType = string.split(data.gametype,";")
    self.lobbyData = {
        [1] = {
            phaseUnlock = data.phase1unlock,
            phaseTask = data.phase1task,
            phaseCondition = string.split(data.phase1condition,";"),
            phaseCost = string.split(data.phase1consumables,";"),
            phaseTitle = string.split(data.phase1title,";"),
            phaseTxt = data.phase1txt,
            phaseSpine = string.split(data.phase1spine,"_"),
            type = self.gameType[1],
            spinePos = data.phase1spinecoor,
            plotBefore = data.phase1plot_before,
            plotAfter = data.phase1plot_after,
        },
        [2] = {
            phaseUnlock = data.phase2unlock,
            phaseTask = data.phase2task,
            phaseCondition = string.split(data.phase2condition,";"),
            phaseCost = string.split(data.phase2consumables,";"),
            phaseTitle = string.split(data.phase2title,";"),
            phaseTxt = data.phase2txt,
            phaseSpine = string.split(data.phase2spine,"_"),
            type = self.gameType[2],
            spinePos = data.phase2spinecoor,
            plotBefore = data.phase2plot_before,
            plotAfter = data.phase2plot_after,
        },
        [3] = {
            phaseUnlock = data.phase3unlock,
            phaseTask = data.phase3task,
            phaseCondition = string.split(data.phase3condition,";"),
            phaseCost = string.split(data.phase3consumables,";"),
            phaseTitle = string.split(data.phase3title,";"),
            phaseTxt = data.phase3txt,
            phaseSpine = string.split(data.phase3spine,"_"),
            type = self.gameType[3],
            spinePos = data.phase3spinecoor,
            plotBefore = data.phase3plot_before,
            plotAfter = data.phase3plot_after,
        }
    }
    self.rewardText = string.split(data.rewardtext,";")
    self.curPhase = 0        --当前阶段
    self.gameIds = {}        --完成的游戏id
    self.rewards = {}        --已领取的奖励id
    self.chooseSpine = data.charspine
    self.Page = data.charpage
    self.chooseSpinePos = data.coordinate
    self.TagPos = data.tagcoordinate
    self.lock = data.lock == 0 and true or false
end

---获取角色是否未开放
function BathRoleData:GetRoleUnlockState()
    return self.lock
end

---推送数据
function BathRoleData:PushData(phase,gameIds,rewards)
    if phase then
        self.curPhase = phase
    end
    if gameIds then
        self.gameIds = RapidJson.decode(gameIds)
    end
    if rewards then
        self.rewards = RapidJson.decode(rewards)
    end
end

---是否通关指定游戏id
function BathRoleData:CheckPassGameId(GameId)
    for k,v in pairs(self.gameIds) do
        if tonumber(k) == GameId then
            return true
        end
    end
    return false
 end

---是否领取指定奖励
function BathRoleData:CheckReceivedReward(GameId)
    for k,v in pairs(self.rewards) do
        if tonumber(k) == GameId then
            return true
        end
    end
    return false
end

---是否可领取奖励
function BathRoleData:CheckCanReceiveReward(GameId)
    for k,v in pairs(self.gameIds) do
        if tonumber(k) == GameId and self:CheckReceivedReward(GameId) == false then
            return true
        end
    end
    return false
end

return BathRoleData