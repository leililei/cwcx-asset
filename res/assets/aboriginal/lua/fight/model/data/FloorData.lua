---@class FloorData 地板数据
FloorData = Class("FloorData")
---构造
---@param idx number 百位为0是坐标，百位大于0是右边
function FloorData:ctor(x,y,isLeft,uid)
    self.uid = uid
    self.x = x
    self.y = y
    self.isLeft = isLeft
    self.posV3 = Vector3.zero
    self.path = "ABOriginal/Prefab/Fight/FightFloor.prefab"
    if isLeft then
        self.posName = "left"
    else
        self.posName = "Right"
    end
end
function FloorData:PushData(pos)
    self.posV3 = pos
end

return FloorData