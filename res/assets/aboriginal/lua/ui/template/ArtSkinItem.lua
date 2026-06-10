-- Code Auto Create Begin
local M = Class('ArtSkinItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ArtSkinItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_RolePlotdi','Img_RolePlotdi',2},{'RolePlotMask','RolePlotMask',2},{'Img_Role','RolePlotMask/Img_Role',2},{'Img_RoleLock','RolePlotMask/Img_RoleLock',2},{'Img_SkinName','Img_SkinName',2},{'Img_RoleName','Img_RoleName',2},{'ScrollRedDotIcon','ScrollRedDotIcon',2},
        -- UITemplate 列表
        {'ArtSkinItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_SkinName','Img_SkinName/Text_SkinName',20},{'Text_RoleName','Img_RoleName/Text_RoleName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CurSkinData = nil
    self.CurRoleData = nil
    UIEvent.LuaClick(self.Img_RolePlotdi().gameObject,function()
        if not self.CurSkinData.unlockState then
            --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_skin_ui_text4"),1},true)
            local itemData = ItemControl.GetItemByIdAndType(self.CurSkinData.unlock.goodsID, self.CurSkinData.unlock.goodsType)
            
            MgrUI.Pop(UID.PopTip_UI,{itemData.describe,1},true)
            return
        end
        if self.CurRoleData then
            ArtAtlasControl.SetSkinUI(true)
            HeroControl.SetCurArtSkinData(self.CurSkinData)
            RoleCardViewModel.CurrentHero = self.CurRoleData
            MgrUI.GoHide(UID.RoleSkin_UI)
        end
    end)
end

function M:OnUpdateUI(args)
    ---@type RoleSkinData
    self.CurSkinData = args
    self.CurRoleData = HeroControl.GetRoleDataByID(self.CurSkinData.roleId)
    --皮肤立绘
    MgrRes.LoadRectIcon(self.Img_Role(),self.CurSkinData.id)
    MgrRes.LoadRectIcon(self.Img_RoleLock(),self.CurSkinData.id)
    --皮肤名
    self.Text_SkinName().text = self.CurSkinData.skinName
    --角色名
    self.Text_RoleName().text = self.CurSkinData.roleName
    --根据解锁状态显示
    if self.CurSkinData.unlockState then
        MgrRes.LoadSprite(self.Img_RolePlotdi(),"UIMusk/Img_Skin_Bg")
        MgrRes.LoadSprite(self.Img_SkinName(),"UIMusk/Img_NameBg_Normal")
        MgrRes.LoadSprite(self.Img_RoleName(),"UIMusk/Img_Mask")
        self.Img_Role().gameObject:SetActive(true)
        self.Img_RoleLock().gameObject:SetActive(false)
    else
        MgrRes.LoadSprite(self.Img_RolePlotdi(),"UIMusk/Img_Skin_Bg_Locked")
        MgrRes.LoadSprite(self.Img_SkinName(),"UIMusk/Img_NameBg_Lock")
        MgrRes.LoadSprite(self.Img_RoleName(),"UIMusk/Img_Mask_Lock")
        --未解锁角色添加材质调色
        --self.Img_Role().material = MgrRes.SetShader(self.Img_Role().material,"WJJ/UI_HeiBai")
        --self.Img_Role().material:SetFloat("_QuSe_Scale",0.3)
        self.Img_Role().gameObject:SetActive(false)
        self.Img_RoleLock().gameObject:SetActive(true)
    end
end

return M