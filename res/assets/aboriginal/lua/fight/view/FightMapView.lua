---@class FightMapView:FightViewBase 战斗地图
local M = Class("FightMapView",FightViewBase)

function M:OnInit()
    ---加载地图背景
    MgrRes.GetPrefab(self.args,Handle(self,self.SetPos))
end
function M:OnReload()
end
function M:OnClose()
end
---设置位置
function M:SetPos(obj)
    obj.transform:SetParent(self.objRoot.transform)
end
return M