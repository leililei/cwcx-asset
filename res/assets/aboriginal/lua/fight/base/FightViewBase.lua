---@class FightViewBase 战斗表现基类
FightViewBase = Class("FightViewBase")
---构造
function FightViewBase:ctor(args)
    self.fightType = nil
    self.args = args
    self.objRoot = nil
end
---设置战斗类型
function FightViewBase:SetFightType(type)
    self.fightType = type
end
---设置参数
function FightViewBase:SetArgs(args)
    self.args = args
    self.objRoot = Tools.GetOrCreateObj(self.__cname)
    self:OnInit()
end
---设置层级
function FightViewBase:SetLayer(layer)
    Tools.SetLayer(self.objRoot,layer)
end
---重载
function FightViewBase:ReLoad()
    self:OnReload()
end
---暂停
function FightViewBase:Pause()
    self:OnPause()
end
---恢复暂停
function FightViewBase:Resume()
    self:OnResume()
end
---退出
function FightViewBase:Close()
    self:OnClose()
end

------------------------------------------回调接口------------------------------------------
---初始化回调接口
function FightViewBase:OnInit()
end
---重载回调接口
function FightViewBase:OnReload()
end
---暂停回调
function FightViewBase:OnPause()
    self:OnPause()
end
---恢复暂停回调
function FightViewBase:OnResume()
    self:OnResume()
end
---退出回调接口
function FightViewBase:OnClose()
end

return FightViewBase