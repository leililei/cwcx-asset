-- Code Auto Create Begin
local M = Class('PlayerRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlayerRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Touxiangdi','Img_Touxiangdi',2},{'Img_RoleIcon','Img_RoleIcon',2},{'Img_Iddi','Img_Iddi',2},{'Img_Kuang','Img_Kuang',2},{'Img_Selected','Img_Kuang/Img_Selected',2},{'Img_Select','Img_Select',2},{'xihuan','xihuan',2},{'suo','suo',2},{'suoicon','suo/suoicon',2},
        -- UITemplate 列表
        {'PlayerRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Choose','Img_Kuang/Img_Selected/Text_Choose',20},{'Text_Name','Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_Select().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)
    ---设置名称
    ---@type RoleData
    self.hero = pData[1]
    self.parent =  pData[2]
    self.index = pData[3]
    self.heroSkin = HeroControl.GetSkinDataBySkinId(self.hero.skin)
    MgrRes.LoadNormalIcon(self.Img_RoleIcon(),self.heroSkin == nil and self.hero.id  or self.heroSkin.id)
    MgrRes.LoadSprite(self.Img_Kuang(),self.hero.iconFrame)
    if self.hero.id == PlayerControl.GetPlayerData().curRoleID or self.hero.id == ArkViewModel.CurRole then
        self.Img_Selected().gameObject:SetActive(true)
    else
        self.Img_Selected().gameObject:SetActive(false)
    end
    if self.hero.isSelect then
        self.Text_Name().text ="<color=#39FFDC>".. self.hero.name.."</color>"
        self.Img_Select().gameObject:SetActive(true)
        --MgrFx.CancelSelectFrameFlash(self.Img_Select(),self.hero.id)
        --MgrFx.SelectFrameFlash(self.Img_Select(),self.hero.id)
    else
        self.Text_Name().text ="<color=#FFFFFF>".. self.hero.name.."</color>"
        self.Img_Select().gameObject:SetActive(false)
        --MgrFx.CancelSelectFrameFlash(self.Img_Select(),self.hero.id)
    end
    self.suo().gameObject:SetActive(false)
    if self.hero.unlock or self.hero.unlock==nil then
        self.suo().gameObject:SetActive(false)
    else
        self.suo().gameObject:SetActive(true)
    end
    if self.hero.like then
        self.xihuan().gameObject:SetActive(true)
    else
        self.xihuan().gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.RoleOnClick))
end

function M:RoleOnClick()
    self.parent:RoleItemOnClick(self.hero,self.index)
end



return M