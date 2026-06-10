-- Code Auto Create Begin
local M = Class('RolePlotItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RolePlotItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_RolePlotdi','Img_RolePlotdi',2},{'RolePlotMask','RolePlotMask',2},{'RoleImg','RolePlotMask/RoleImg',2},{'BlackMask','RolePlotMask/BlackMask',2},{'RoleName','RoleName',2},{'RoleNameBG','RoleName/RoleNameBG',2},{'ScrollRedDotIcon','ScrollRedDotIcon',2},
        -- UITemplate 列表
        {'RolePlotItem','/',10},
        -- TextMeshProUGUI 列表
        {'RoleNameTxt','RoleName/RoleNameBG/RoleNameTxt',20},{'Text_Jindu','RoleName/Text_Jindu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.isUnlock = false
    UIEvent.LuaClick(self.RoleImg().gameObject,function()
       -- MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_dex_text4"),1},true)
        if self.isUnlock then
            ArtAtlasControl.OpenPlotAtlasUI(3,self.data.roleId)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_dex_text4"),1},true)
        end
    end)
end

function M:OnUpdateUI(Args)
    ---@type RolePlotData_New
    self.data =  Args[1]
    self.parent = Args[2]
    ---头像
    MgrRes.LoadRectIcon(self.RoleImg(),self.data.roleId)
    ---名字
    self.RoleNameTxt().text = self.data.name
    ---红点
    self.ScrollRedDotIcon().gameObject:SetActive(false)
    ---解锁
    self.isUnlock = ArtAtlasControl.CheckUnLockByRoleID(self.data.roleId)
    self.BlackMask().gameObject:SetActive(not self.isUnlock)
end

return M