-- Code Auto Create Begin
local M = Class('ShopLaberItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ShopLaberItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ShopLaberItem','/',2},{'Img_Qieye2di','Img_Qieye2di',2},{'Img_hl','Img_hl',2},{'RedDot','RedDot',2},{'Content','Content',2},{'Img_Lock','Content/Img_Lock',2},{'Btn_Lock','Content/Img_Lock/Btn_Lock',2},
        -- UITemplate 列表
        {'ShopLaberItem01','/',10},
        -- Toggle 列表
        {'ShopLaberItem02','/',13},
        -- TextMeshProUGUI 列表
        {'Text_Name','Content/Text_Name',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Tools.ToggleValueChange(self.ShopLaberItem02(), function(isOn)
        if isOn then
            if self.parent.Name ~= "Form[ShopSkin_UI]" and self.parent.Name ~= "Form[ShopHome_UI]" then
                self.parent:UpdateCoin(self.pData.id)
                self.parent.CurChildShop = self.idx
            end
        end
    end, nil)
end

function M:OnUpdateUI(args)
    ---@type ShopChildData
    self.pData = args[1]
    self.idx = args[2]
    self.parent = args[3]
    self.Text_Name().text = self.pData.name

    self.ShopLaberItem02().group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup")
    local tBtnState = false
    if SysLockControl.CheckSysLock(self.pData.ChildSystemOpen) then
        self.Img_Lock().gameObject:SetActive(false)
        if self.parent.isFirstCharge then
            tBtnState = true
            self.parent.isFirstCharge = false
            self.parent.CurChildShop = self.idx
            self.parent:UpdateCoin(self.pData.id)
        end
    else
        self.Img_Lock().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Btn_Lock().gameObject, function()
            local tCfg = ShoptypeLocalData.tab[self.pData.id]
            if tCfg then
                MgrUI.Pop(UID.PopTip_UI, { SysLockControl.GetSystemLockTips(tCfg.systemopen), 1 }, true)
            end
        end)
    end

    self.ShopLaberItem02().isOn = tBtnState

    self.parent.ChildBtnList[self.pData.id] = self.ShopLaberItem02()

    --- 红点
    local isShow = false
    local shopHomeList = self.pData
    if shopHomeList.id == 102 then
        local list = ShopViewModel.SortItemData(shopHomeList)
        for index, value in ipairs(list) do
            if value:IsShowRedDot() then
                isShow = true
                break
            end
        end
    end
    if self.RedDot() then
        self.RedDot().gameObject:SetActive(isShow)
    end
end

return M