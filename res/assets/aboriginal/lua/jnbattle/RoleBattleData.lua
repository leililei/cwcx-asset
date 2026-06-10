---@class RoleBattleData
RoleBattleData = Class('RoleBattleData')

function RoleBattleData:ctor()
    self.uid = 0
    self.roleId = 0

    self.isLeft = true
    self.pos = 0
    self.isInit = true

    self.level = 0
    self.rank = 0
    self.star = 0
    self.isAwaken = false

    self.curHp = 0
    self.maxHp = 0
    self.shield = 0
    self.atk = 0
    self.def = 0
    self.agi = 0
    self.crit = 0
    self.cDamage = 0
    self.dReduce = 0
    self.agiliDmg = 0
    self.support = 0

    self.buffList = {}
    self.exProps = {};
end


local PropEnum = {
    Level = 1,
    Star = 2,
    Awaken = 3,
    Rank = 4,
    CurHp = 5,
    MaxHp = 6,
    Shield = 7,
    Atk = 8,
    Def = 9,
    Agi = 10,
    Crit = 11,
    CDamage = 12,
    DReduce = 13,
    AgiliDmg = 14,
    Support = 15,
    TotalDamage = 16,
}

function RoleBattleData:InitWithSelfRoleInfo(info)
    
end

function RoleBattleData:InitWithMonsterInfo(info)
    
end

function RoleBattleData:InitWithVideoInfo(fighter)
    self.uid = fighter.uID
    self.roleId = fighter.cfgID

    self.isLeft = fighter.isLeft
    self.pos = fighter.pos
    self.isInit = fighter.Init

    self:UpdateProps(fighter.props, true)
end

function RoleBattleData:UpdateProps(props, isInit)
    for i, v in ipairs(props) do
        if v.field == PropEnum.Level then
            self.level = v.value
        elseif v.field == PropEnum.Rank then
            self.rank = v.value
        elseif v.field == PropEnum.Star then
            self.star = v.value
        elseif v.field == PropEnum.Awaken then
            self.isAwaken = v.value == 1
        elseif v.field == PropEnum.CurHp then
            Event.Go("BattleUpdateCurHp", self.uid, v.value)
            self.hp = v.value
        elseif v.field == PropEnum.Shield then
            if not isInit then
                Event.Go("BattleUpdateShield", self.uid, v.value)
            end
            self.shield = v.value
        elseif v.field == PropEnum.Atk then
            self.atk = v.value
        elseif v.field == PropEnum.Def then
            Event.Go("BattleUpdateDef", self.uid, v.value)
            self.def = v.value
        elseif v.field == PropEnum.Agi then
            Event.Go("BattleUpdateAgi", self.uid, v.value)
            self.agi = v.value
        elseif v.field == PropEnum.Crit then
            self.crit = v.value
        elseif v.field == PropEnum.CDamage then
            self.cDamage = v.value
        elseif v.field == PropEnum.DReduce then
            self.dReduce = v.value
        elseif v.field == PropEnum.MaxHp then
            if not isInit then
                local delta = v.value - self.maxHp
                Event.Go("BattleUpdateMaxHp", self.uid, delta)
            end
            self.maxHp = v.value
        elseif v.field == PropEnum.AgiliDmg then
            self.agiliDmg = v.value
        elseif v.field == PropEnum.Support then
            self.support = v.value
        elseif v.field == PropEnum.TotalDamage then
            BattleViewModel.DamageTotal[self.uid] = v.value
        else
            self.exProps[v.field] = v.value;
        end
    end
end

function RoleBattleData:UpdateBuffs(buffs)
    -- 检查是否有 buff 被抹除，即设置剩余时间为 0. 对于这类 buff 需要检查并删除图标
    -- 删除图标需要当前轮数，而 UI 数据和这里的逻辑数据不同步。
    -- 因此，需要在此时，UI 数据和逻辑数据同步时删除 buff 图标。(同时事件也会移除特效)
    for i, v in ipairs(buffs) do
        if v.duration == 0 and self.buffList[v.buffID] then
            Event.Go("BattleRemoveBuff", self.uid, v.skillID, self.buffList[v.buffID].duration)
        end
    end
    
    -- 实际修改逻辑 buff 数据
    for i, v in ipairs(buffs) do
        self.buffList[v.buffID] = v
    end

    -- 不需要再触发一次移除事件
    --self:CheckBuffDuration()
    local newList = {}
    for id, info in pairs(self.buffList) do
        if info.duration ~= 0 then
            newList[id] = info
        end
    end
    self.buffList = newList
end

function RoleBattleData:AutoMinusBuffDuration()
    for i, v in pairs(self.buffList) do
        if v.duration > 0 then
            v.duration = v.duration - 1
        end
    end

    -- 这里会检查逻辑数据中时长归 0 的 Buff，触发移除事件。
    -- 此时，UI 数据也会为 0，因此可以这样移除图标。
    -- 因为目前 UI 的 AutoMinus 会在这个方法之前调用。即 BattleViewModel 中 VTurnBuff 时点中执行。
    self:CheckBuffDuration()
end

function RoleBattleData:CheckBuffDuration()
    local newList = {}
    for id, info in pairs(self.buffList) do
        if info.duration ~= 0 then
            newList[id] = info
        else
            Event.Go("BattleRemoveBuff", self.uid, info.skillID)
        end
    end
    self.buffList = newList
end

return RoleBattleData