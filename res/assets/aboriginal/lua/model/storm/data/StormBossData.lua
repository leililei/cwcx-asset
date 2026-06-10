---挑战boss数据
---@class StormBossData
---@field --monsterData MonsterData
---@field monsterData RoleData
---@field rankInfos BossRankInfo[]
StormBossData = Class('StormBossData')
---构造方法
function StormBossData:ctor(id)
    self.id = id                    ---魔王ID
    self.activityid = nil           ---活动ID
    self.monster = nil              ---魔王战斗数据
    self.map = nil                  ---战斗地图
    self.thumbnail_map = nil        ---背景图
    self.thumbnail_drawing = nil    ---模拟战Boss图标
    self.maxHp = 0                  ---魔王最大血量
    self.type = 0                   ---挑战难度
    self.recomlevel = 0             ---推荐等级
    self.integral = 0               ---积分倍率
    self.prohibit = nil             ---UI显示用禁用技能表
    self.monsterData = {}           ---连讨怪物数据
    self.ContinuousCombatType = 0   ---站位类型
    self.BossData = nil             ---BOSS数据
end
---添加配置
function StormBossData:PushConfig(config)
    self.id = config[1]                    ---魔王ID
    self.activityid = config[2]           ---活动ID
    local monsterStr = string.split(config[3],"_")

    table.insert(self.monsterData, StormBossData:CreateMonsters(config[3]))
    if config[20] ~= "0" and config[20] ~= nil then
        table.insert(self.monsterData, StormBossData:CreateMonsters(config[20]))
        if config[21] == BattleManager.MonsterStandType.MONSTER_BOSS then
            ---小怪-Boss
            self.BossData = self.monsterData[2][1]
        else
            ---Boss-小怪 Boss-Boss 
            self.BossData = self.monsterData[1][1]
        end
    else
        self.BossData = self.monsterData[1][1]
    end
    self.map = config[4]
    self.thumbnail_map = config[5]
    self.thumbnail_drawing = config[6]
    self.maxHp = config[7]
    self.type = config[8]
    self.recomlevel = config[9]
    self.integral = config[10]
    self.prohibit = config[12]
    self.bg = config[16]
    self.diffIcon = config[17]
    self.diffTXT = config[18]
    self.ContinuousCombatType = config[21]
end
---@class BossRankInfo 世界boss排名信息
local rankInfo = {
    score = 0,
    rank = 0,
    nike = "",
    head = 1,
    headFrame = 0,
    level = 0,
    count = 0,
    title = "",
    id = -1,
}
---@class ServerBossData 服务器定义的boss数据结构
---@field goods goods
---@field rankInfo BossRankInfo[]
local bossData = {
    hp = 0,
    subKey = 0,
    nowRank = 0,
    goods = {},
    rewardRank = 0,
    isGetReward = 0,
    rankInfo = {},
    score = 0,
    maxScore = 0,
    count = 0,
}
---@param data ServerBossData 更新当前boss信息
function StormBossData:PushData(data)
    self.hp = data.hp
    self.subKey = data.subKey
    self.nowRank = data.nowRank
    self.reward = data.goods
    self.rewardRank = data.rewardRank
    self.getReward = data.isGetReward
    ---首次获取首页30条排名及玩家当前排名左右30条,以玩家id保存相同id能够直接覆盖当前名次
    self.rankInfos = {}
    if data.rankInfo ~= nil then
        ---保存已知的排名
        for i, v in pairs(data.rankInfo) do
            self.rankInfos[v.rank] = v
        end
        for i, v in ipairs(self.rankInfos) do
            if v == nil then
                ---补全空余的排名为查询中
                ---@type BossRankInfo
                local info = {
                    score = nil,
                    rank = #self.rankInfos + 1,
                    nike = MgrLanguageData.GetLanguageByKey("stormbossdata_tips1"),
                    head = 1,
                    headFrame = 0,
                    level = nil,
                    count = nil,
                    title = "",
                    id = -1,
                }
                self.rankInfos[i] = info
            end
        end
    end
    self.count = data.count
    ---更新boss今日分数
    self.score = data.score
end
---更新boss历史分数
function StormBossData:PushScore(score)
    self.maxScore = score
end
---更新boss世界历史分数
function StormBossData:PushWorldScore(score)
    self.worldScore = score
end
---更新boss今天分数
function StormBossData:PushWorldBossTodayScore(score)
    self.worldBossTodayScore = score
end
function StormBossData:PushWorldBossTodayThreeScore(score)
    self.worldBossTodayThreeScore = score
end
---@return boolean 魔王关卡是否开启
function StormBossData:CheckUnlock()
    return Global.CheckOnTime(TimeControl.GetTimeTable(self.unlockTime))
end
---@return --MonsterData[] 创建关卡怪物数据
---@return RoleData[] 创建关卡怪物数据
function StormBossData:CreateMonsters(str)
    if str == "0" then
        ---为空不创建
        return nil
    end
    local mList = {}
    local list = string.split(str,";")
    for i, v in ipairs(list) do
        if v ~= "" then
            local data = string.split(v,"_")
            local id = tonumber(data[1])
            local star = tonumber(data[2])
            local level = tonumber(data[3])
            local isAwaken = tonumber(data[4])
            local skillLv = tonumber(data[5])
            local sIndex = tonumber(data[6])
            local scale = tonumber(data[7])
            local isBoss = tonumber(data[8])
            local core1Id = tonumber(data[9])
            local core1properties = tonumber(data[10])
            local core1skill = tonumber(data[11])
            local core2Id = tonumber(data[12])
            local core2properties = tonumber(data[13])
            local core2skill = tonumber(data[14])
            local atkOrder = i
            mList[#mList + 1] = MonsterControl.CreateSingleMonster(id,star,level,isAwaken,skillLv,sIndex,scale,isBoss,core1Id,core1properties,core1skill,core2Id,core2properties,core2skill,atkOrder)
        end
    end
    return mList
end
---战斗怪物属性
---str 属性名 battleTimes 连战场次
function StormBossData:GetBattleAllMonster(str,battleTimes)
    local arr = {}
    local mosterData = self.monsterData[battleTimes]
    if mosterData == nil or #mosterData == 0 then
        Log.Error("关卡战斗怪物需要配置,ID:"..self.id)
        return arr
    end
    for i, v in ipairs(mosterData) do
        if str == "Id" then
            arr[i] = v.id
        elseif str == "Level" then
            arr[i] = v.level
        elseif str == "Star" then
            arr[i] = v.star
        elseif str == "Awaken" then
            arr[i] = v.awaken
        elseif str == "SkillLv" then
            arr[i] = v.skillLevel
        elseif str == "SIndex" then
            arr[i] = v.sIndex
        elseif str == "Scale" then
            arr[i] = v.scale
        elseif str == "IsBoss" then
            arr[i] = v.isBoss
        elseif str == "Core1" then
            arr[i] = v.core1Id
        elseif str == "CoreProperties1" then
            arr[i] = v.core1properties
        elseif str == "CoreSkill1" then
            arr[i] = v.core1skill
        elseif str == "Core2" then
            arr[i] = v.core2Id
        elseif str == "CoreProperties2" then
            arr[i] = v.core2properties
        elseif str == "CoreSkill2" then
            arr[i] = v.core2skill
        end
    end
    return arr
end

function StormBossData:GetMonsterDataById(_id)
    local t = StormControl.GetBattleContinu()
    local tMonsterData = self.monsterData[t]
    for i, v in ipairs(tMonsterData) do
        if v.id == _id then
            return v
        end
    end
end
---清空排行数据
function StormBossData:ClearRanks()
    StormBossData.rankInfos = {}
end
return StormBossData