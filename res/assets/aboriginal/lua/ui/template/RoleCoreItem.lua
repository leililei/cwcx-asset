-- Code Auto Create Begin
local M = Class('RoleCoreItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleCoreItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Touxiangdi','Img_Touxiangdi',2},{'Img_RoleIcon','Img_RoleIcon',2},{'Img_Iddi','Img_Iddi',2},{'Img_Kuang','Img_Kuang',2},{'Img_Selected','Img_Kuang/Img_Selected',2},{'Img_Select','Img_Select',2},
        -- Text 列表
        {'Text_Name','Text_Name',3},{'Text_Name01','Img_Kuang/Img_Selected/Text_Name',3},
        -- UITemplate 列表
        {'RoleCoreItem','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_Select().gameObject:SetActive(false)
    self.Img_Selected().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)
    ---设置名称
    ---@type RoleData
    self.hero = pData[1]
    self.parent =  pData[2]
    local skinData = HeroControl.GetSkinDataByRoleID(self.hero.id)
    MgrRes.LoadNormalIcon(self.Img_RoleIcon(),skinData.id)
    MgrRes.LoadSprite(self.Img_Kuang(),self.hero.iconFrame)
    if self.hero.RoleCoreSelect then
        self.Text_Name().text ="<color=#39FFDC>".. self.hero.name.."</color>"
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Text_Name().text ="<color=#FFFFFF>".. self.hero.name.."</color>"
        self.Img_Select().gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.RoleOnClick))
end

function M:RoleOnClick()
    self.parent:RoleItemOnClick(self.hero)
    if NoviceViewModel.CurTaskId == 20714 and self.hero.id == tonumber(SteamLocalData.tab[120003][2]) then
        MgrUI.PopHide(UID.NoviceFrame_UI)
        NoviceViewModel.DoNext()
    end
end


return M