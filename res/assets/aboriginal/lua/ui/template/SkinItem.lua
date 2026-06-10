-- Code Auto Create Begin
local M = Class('SkinItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkinItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SkinItem','/',2},{'Unchoose','Unchoose',2},{'Unchoose_Back','Unchoose/Unchoose_Back',2},{'UnchooseSkin','Unchoose/UnchooseSkin',2},{'kuang','Unchoose/UnchooseSkin/kuang',2},{'ChooseIcon_UnChoose','Unchoose/UnchooseSkin/ChooseIcon_UnChoose',2},{'Weihuoqu','Unchoose/UnchooseSkin/Weihuoqu',2},{'di','Unchoose/UnchooseSkin/Weihuoqu/di',2},{'Choose','Choose',2},{'ChooseSkin_Back','Choose/ChooseSkin_Back',2},{'ChooseSkin','Choose/ChooseSkin',2},{'kuang01','Choose/ChooseSkin/kuang',2},{'ChooseIcon','Choose/ChooseSkin/ChooseIcon',2},{'Weihuoqu01','Choose/ChooseSkin/Weihuoqu',2},{'di01','Choose/ChooseSkin/Weihuoqu/di',2},
        -- UITemplate 列表
        {'SkinItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Weihuoqu','Unchoose/UnchooseSkin/Weihuoqu/Text_Weihuoqu',20},{'Text_Weihuoqu01','Choose/ChooseSkin/Weihuoqu/Text_Weihuoqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()

end
function M:OnUpdateUI(pData)
    ---@type RoleSkinData
    self.skinData = pData[1]
    if self.skinData.id == nil then
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(false)
        return
    end
    self.parent = pData[2]
    self.index = pData[3]
    ---图片
    MgrRes.LoadLongIcon(self.UnchooseSkin(),self.skinData.id,0.5,true) --用角色id找 文件里的长条图片
    MgrRes.LoadLongIcon(self.ChooseSkin(),self.skinData.id,1,true)

    ---是否为解锁皮肤
    --if HeroControl.CheckSkinUnlocked(self.skinData.id) then
    --    self.ChooseIcon01().gameObject:SetActive(true)
    --    self.ChooseIcon().gameObject:SetActive(true)
    --else
    --    self.ChooseIcon01().gameObject:SetActive(false)
    --    self.ChooseIcon().gameObject:SetActive(false)
    --end

    ---是否已穿着
    if self.parent.currentRoleSkinData.id == self.skinData.id then
        self.ChooseIcon_UnChoose().gameObject:SetActive(true)
        self.ChooseIcon().gameObject:SetActive(true)
    else
        self.ChooseIcon_UnChoose().gameObject:SetActive(false)
        self.ChooseIcon().gameObject:SetActive(false)
    end

    ---是否被选中
    if self.skinData.id == self.parent.currentChooseSkinData.id then
        self.beChoosed = true
    else
        self.beChoosed = false
    end
    if self.beChoosed then
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(true)
    else
        self.Unchoose().gameObject:SetActive(true)
        self.Choose().gameObject:SetActive(false)
    end

    ---是否已拥有
    --local item = ItemControl.GetItemByIdAndType(self.skinData.unlock.goodsID,self.skinData.unlock.goodsType)
    --if item ~= nil and item.count <= 0 then
    if not self.skinData.unlockState then
        self.Weihuoqu01().gameObject:SetActive(true)
        self.Weihuoqu().gameObject:SetActive(true)
    else
        self.Weihuoqu01().gameObject:SetActive(false)
        self.Weihuoqu().gameObject:SetActive(false)
    end

    self.Unchoose().transform:Find("Unchoose_Back").transform:GetComponent("Canvas").sortingOrder = self.parent:GetLayer() + 6
    self.Unchoose().transform:Find("UnchooseSkin").transform:GetComponent("Canvas").sortingOrder = self.parent:GetLayer() + 7
    self.Choose().transform:Find("ChooseSkin_Back").transform:GetComponent("Canvas").sortingOrder = self.parent:GetLayer() + 8
    self.Choose().transform:Find("ChooseSkin").transform:GetComponent("Canvas").sortingOrder = self.parent:GetLayer() + 9
    ---点击
    UIEvent.LuaClick(self.ObjRoot,function()
        self.parent.tempIdx = self.index
        self.parent.currentChooseSkinData = self.skinData
        self.beChoosed = true
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(true)
        self.parent:ChooseSkin(self.index)
    end)

end

function M:ItemUpdate(pData)
    self.beChoosed = pData[1]
    if self.skinData.id == nil then
        return
    end
    if self.beChoosed then
        self.parent.currentChooseSkinData = self.skinData
        self.parent.tempIdx = self.index
        self.parent.idx = self.index
        self.Unchoose().gameObject:SetActive(false)
        self.Choose().gameObject:SetActive(true)
        self.parent:ShowSkin(self.skinData)
        self.parent:FreshSkinItem()
        self.parent:CurBanner().transform:SetSiblingIndex((self.index - 2))
    else
        self.Unchoose().gameObject:SetActive(true)
        self.Choose().gameObject:SetActive(false)
    end
    if self.beChoosed then
        if self.skinData.id == self.parent.currentRoleSkinData.id then    --当前皮肤已穿戴
            --self.parent:SkinChangeBtn(true,self.skinData)
            self.parent:NewSkinChangeBtn(true,self.skinData)
        else
            --self.parent:SkinChangeBtn(false,self.skinData)
            self.parent:NewSkinChangeBtn(false,self.skinData)
        end
    end
end

return M