---@class PersonStoryData 活动技能数据
PersonStoryData = Class("PersonStoryData")
-------------构造方法-------------
function PersonStoryData:ctor(data)
    self.skinId = data.id                               ---id
    self.badgename1 = data.badgename1                   ---未完成的徽章
    self.badgename2 = data.badgename2                   ---完成的徽章
    self.plotItem = nil     ---剧情解锁道具
    self.pieceItem = {}     ---碎片解锁道具
    self.pieceSortOut = nil    ---解锁进度归类(包含剧情和碎片的道具)

    local tList = {}
    --剧情解锁道具
    if data.plotitem ~= "0" then
        self.plotItem = string.split(data.plotitem,';')
        tList[1] = self.plotItem
    end
    --碎片解锁道具
    if data.plotcgitem ~= "0" then
        local tPieceList = string.split(data.plotcgitem,';')
        for i, v in ipairs(tPieceList) do
            local tStr = string.split(v,',')
            if tList[tonumber(tStr[1])] == nil then
                tList[tonumber(tStr[1])] = {}
            end
            table.insert(tList[tonumber(tStr[1])],tStr[2])
            table.insert(self.pieceItem, tStr[2])
        end
    end
    self.pieceSortOut = tList
end

---检查皮肤碎片收集进度是否完成
function PersonStoryData:CheckPiece()
    --剧情解锁道具
    for i, v in ipairs(self.plotItem) do
        local tStr = string.split(v,"_")
        local item = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
        if item ~= nil and item.count <= 0 then
            return false
        end
    end
    --碎片解锁道具
    for i, v in ipairs(self.pieceItem) do
        local tStr = string.split(v,"_")
        local item = ItemControl.GetItemByIdAndType(tonumber(tStr[2]),tonumber(tStr[1]))
        if item ~= nil and item.count <= 0 then
            return false
        end
    end
    
    return true
end

return PersonStoryData