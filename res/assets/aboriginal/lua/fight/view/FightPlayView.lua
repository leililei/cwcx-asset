---@class FightPlayView:FightViewBase 战斗启动
local M = Class("FightPlayView",FightViewBase)

---初始化
function M:OnInit()
    ---重置战斗相机
    MessageEvent.Go(EID.ReloadFCamera)
end

function M:OnClose()
    --BattleManager.ClearLuaData()
end

return M