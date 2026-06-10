-- Code Auto Create Begin
local M = Class('VoidGearItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/VoidGearItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img__GMZBdi','Img__GMZBdi',2},{'Panel_Info','Panel_Info',2},{'Img_Yuandi','Panel_Info/zhuangbei1/Img_Yuandi',2},{'Img_Icon','Panel_Info/zhuangbei1/Img_Icon',2},{'Lock','Panel_Info/zhuangbei1/Lock',2},{'Img_Yuan(hei)','Panel_Info/zhuangbei1/Img_Yuan(hei)',2},{'Img_Yuan(bai)','Panel_Info/zhuangbei1/Img_Yuan(bai)',2},{'Img_Frame','Panel_Info/zhuangbei1/Img_Frame',2},{'EquipRole','Panel_Info/zhuangbei1/EquipRole',2},{'RoleIconFrame','Panel_Info/zhuangbei1/EquipRole/RoleIconFrame',2},{'RoleIcon','Panel_Info/zhuangbei1/EquipRole/RoleIcon',2},{'Img_Dengjidi','Img_Dengjidi',2},{'NewTag','NewTag',2},{'NewTagdi','NewTag/NewTagdi',2},
        -- UITemplate 列表
        {'VoidGearItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Weihuoqu','Panel_Info/zhuangbei1/Lock/Text_Weihuoqu',20},{'Text_Level','Img_Dengjidi/Text_Level',20},
    }
end
-- Code Auto Create End
---共鸣装备初始化
function M:OnInit()
    self.cg = self.Panel_Info().gameObject:GetComponent("CanvasGroup")
    UIEvent.LuaClick(self.Img__GMZBdi().gameObject,function()
        MgrUI.Pop(UID.EquipInfoPop_UI,{self.pData,self.parent},true)
    end)
end
---更新
function M:OnUpdateUI(pData)
    ---@type EquipData
    self.pData = pData[1]
    self.parent = pData[2]
    self.Lock().gameObject:SetActive(not self.pData.lockState)
    self.Text_Name().text = self.pData.name
    self.Text_Level().text = string.format("<color=#FE7D1D>%s</color> %s", MgrLanguageData.GetLanguageByKey("ui_tips_1"), self.pData.level)
    MgrRes.LoadSprite(self.Img_Icon(),self.pData.icon)
    MgrRes.LoadSprite(self.Img_Frame(),self.pData.iconFrame)
    self.EquipRole().gameObject:SetActive(self.pData.lockState)
    if self.pData.lockState then
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s",self.pData.equipID))
        if isNew == nil or isNew == "" then
            self.NewTag().gameObject:SetActive(true)
        else
            self.NewTag().gameObject:SetActive(false)
        end
        local roleData = self.pData:GetRole()
        if roleData ~= nil and roleData.lockState then
            self.EquipRole().gameObject:SetActive(true)
            local skinData = HeroControl.GetSkinDataByRoleID(roleData.id)
            MgrRes.LoadCircleIcon(self.RoleIcon():GetComponent("Image"),skinData.id)
        else
            self.EquipRole().gameObject:SetActive(false)
        end
        self.cg.alpha = 1
    else
        self.NewTag().gameObject:SetActive(false)
        self.cg.alpha = 0.5
    end
end
return M