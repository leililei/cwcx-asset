-- Code Auto Create Begin
local M = Class('PlayerBadgeItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlayerBadgeItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PlayerBadgeItem','/',2},{'Icon','Icon',2},{'Selectedbg','Icon/Selectedbg',2},{'Img_BadgeIcon','Icon/Img_BadgeIcon',2},{'VFX','Icon/VFX',2},{'Img_Xunzhangmingdi','Icon/Img_Xunzhangmingdi',2},{'Img_Bianhaodi','Icon/Img_Bianhaodi',2},{'SelectedImg','Icon/SelectedImg',2},{'LimitTimeBg','Icon/LimitTimeBg',2},{'lmg_Suo','lmg_Suo',2},
        -- UITemplate 列表
        {'PlayerBadgeItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_BadgeName','Icon/Text_BadgeName',20},{'Text_EquipNum','Icon/Img_Bianhaodi/Text_EquipNum',20},{'LimitTime','Icon/LimitTimeBg/LimitTime',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type HideLocalData
    self.badgeData = pData[1]
    self.parent = pData[2]
    self.isEquip,self.index = PlayerAvatarViewModel.CheckBadgeEquip(self.badgeData.id)
    if self.isEquip then
        self.Img_Bianhaodi().gameObject:SetActive(true)
        self.Text_EquipNum().text = self.index
    else
        self.Img_Bianhaodi().gameObject:SetActive(false)
    end

    if self.badgeData.anime and self.badgeData.anime ~= "0" then
        Tools.ClearAllChild(self.VFX().gameObject)
        self.Img_BadgeIcon().gameObject:SetActive(false)
        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
        MgrRes.GetPrefab(self.vfx_path..self.badgeData.anime..".prefab",function(Obj)
            if Obj == nil then return end
            Obj.transform:SetParent(self.VFX().gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(42,42,1)
        end)
    else
        Tools.ClearAllChild(self.VFX().gameObject)
        self.Img_BadgeIcon().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.Img_BadgeIcon(),"Item/"..self.badgeData.icon)
    end

    if ItemControl.GetItemByIdAndType(self.badgeData.id,4).count > 0 then
        self.lmg_Suo().gameObject:SetActive(false)
        self.Icon().gameObject:GetComponent("CanvasGroup").alpha = 1
    else
        self.lmg_Suo().gameObject:SetActive(true)
        self.Icon().gameObject:GetComponent("CanvasGroup").alpha = 0.5
    end
    if self.badgeData.isSelect then
        self.Selectedbg().gameObject:SetActive(true)
        self.SelectedImg().gameObject:SetActive(true)
        self.Text_BadgeName().text ="<color=#39FFDC>".. self.badgeData.name.."</color>"
    else
        self.Selectedbg().gameObject:SetActive(false)
        self.SelectedImg().gameObject:SetActive(false)
        self.Text_BadgeName().text ="<color=#FFFFFF>".. self.badgeData.name.."</color>"
    end
    --限时道具
    self.LimitTimeBg().gameObject:SetActive(false)
    local tLimitItem = ItemControl.GetLimitItemByID(4,self.badgeData.id)
    if tLimitItem then
        self.LimitTimeBg().gameObject:SetActive(true)
        --获取格式时间 剩余xx天/时/分
        self.LimitTime().text = Global.GetTimeMode(tLimitItem.ETime-Global.GetCurTime(),"eventshopitem_surplus")
    end
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.BadgeOnClick))
end
function M:BadgeOnClick()
    self.parent:BadgeItemOnClick(self.badgeData,self.isEquip)
end
return M