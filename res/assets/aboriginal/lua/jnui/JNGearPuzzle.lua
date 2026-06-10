JNGearPuzzle={}

function JNGearPuzzle:new(_ID,_UID,_Count,_InfoTab)
    -- statements
    GearPuzzle = {}
    setmetatable(GearPuzzle, self)
    self.__index = self
    GearPuzzle.ID=_ID
    GearPuzzle.UID=_UID
    GearPuzzle.Count=_Count
    GearPuzzle.InfoTab=_InfoTab
    GearPuzzle.NeedCount=0
    for key, value in pairs(GameData.tab.synthesis) do
        if value[2] == "".._ID then
            -- 匹配到对应碎片
            GearPuzzle.NeedCount=tonumber(value[3])
        end
    end
    return GearPuzzle
end

return JNGearPuzzle