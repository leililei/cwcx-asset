-- Code Auto Create Begin
local M = Class('Activity_PersonStory', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_PersonStory.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_PersonStory','/',2},{'Btn_Qianwangtaofa','Btn_Qianwangtaofa',2},
        -- UITemplate 列表
        {'Activity_PersonStory01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Qianwangtaofa().gameObject,Handle(self,function ()
        ---跳转到对应界面
        --MgrLink.LinkStart("tz_hd_hdzjm_01")
        PersonStoryControl.OpenHome()
    end))
end
return M