---抽装备数据
---@class EquipDrawData
EquipDrawData = Class('EquipDrawData')
function EquipDrawData:ctor(id)
    local config = EquipmentsupplyLocalData.tab[id]
    self.id = id
    self.name = config[2]                  ---卡池名字
    self.cardPool = config[3]              ---卡池角色权重
    self.singleDrawGoldPrice = config[4]   ---金币单抽价格
    self.tenDrawGoldPrice = config[5]      ---金币十连抽价格
    self.HundredDrawGoldPrice = config[28] ---金币百抽价格
    self.singleDrawPrice = config[6]       ---共鸣石单抽
    self.tenDrawPrice = config[7]          ---共鸣石十连抽
    self.HundredDrawPrice = config[29]     ---共鸣石百抽
    self.breakEvenCount = config[8]        ---保底次数
    self.breakEvent = config[9]            ---保底稀有度
    self.timeType = config[10]             ---时间类型 0为永久开发，1为限时开发
    self.timeId = tonumber(config[11])    ---时间索引
    
    self.timeOpen = "0"                 ---卡池开启时间
    self.timeEnd = "0"                  ---卡池结束时间
    --刷新时间
    self:RefreshTime()
    
    self.desc = config[13]                 ---卡池说明
    self.show = config[14]                 ---是否显示 0显示 1不显示
    self.limit = config[15]                ---是否限制次数
    self.showRole = config[16]             ---卡池背景图片
    self.sort = config[17]                 ---卡池排序
    self.cardType = config[18]             ---卡池类型 1角色 2装备
    self.enName = config[19]               ---英文名
    self.Icon = config[20]                 ---卡池入口按钮图标
    self.tag = config[21] == "0" and "0" or string.split(config[21],",")              ---卡池标签 [1]标签底图路径[2]多语言
    self.cardvfx = config[27]           ---卡池特效
end

---卡池是否开启中
function EquipDrawData:WhetherIsOpen()
    if self.timeType == 0 then
        return true
    end
    --如果角色补给未开放
    if SysLockControl.CheckSysLock(1302) == false then
        return false
    end

    local inMiddle = Global.isMiddleTime(self.timeOpen, self.timeEnd)

    return inMiddle
end

function EquipDrawData:WhetherShow()
    if self.show == 0 then
        return true
    elseif self.show == 1 then
        return false
    else
        return false
    end
end

---刷新时间
function EquipDrawData:RefreshTime()
    local timeC = TimeControl.GetTimeTable(self.timeId)
    if timeC then
        self.timeOpen = Global.TimeToDate(timeC.openTime)
        self.timeEnd = Global.TimeToDate(timeC.endTime)
        self.timeOpen_Stamp = timeC.openTime
        self.timeEnd_Stamp = timeC.endTime
    end
end

return EquipDrawData