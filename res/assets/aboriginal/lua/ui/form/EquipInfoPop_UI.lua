-- Code Auto Create Begin
local M = Class('EquipInfoPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EquipInfoPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EquipInfoPop_UI].prefab'
    self.Name = 'Form[EquipInfoPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Text_TouchToExit','Text_TouchToExit',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'xian1','Img_Tanchuangdi/xian1',2},{'xian2','Img_Tanchuangdi/xian2',2},{'Img_Biaotixian1','Img_Tanchuangdi/Img_Biaotixian1',2},{'yuandi','Img_Tanchuangdi/EquipInfo/yuandi',2},{'Img_Icon','Img_Tanchuangdi/EquipInfo/Img_Icon',2},{'Lock','Img_Tanchuangdi/EquipInfo/Lock',2},{'yuan(bai)','Img_Tanchuangdi/EquipInfo/yuan(bai)',2},{'Img_Frame','Img_Tanchuangdi/EquipInfo/Img_Frame',2},{'EquipRole','Img_Tanchuangdi/xinxi/EquipRole',2},{'RoleIconFrame','Img_Tanchuangdi/xinxi/EquipRole/RoleIconFrame',2},{'RoleIcon','Img_Tanchuangdi/xinxi/EquipRole/RoleIcon',2},{'ScrollDes','Img_Tanchuangdi/xinxi/ScrollDes',2},{'Img_Biaotixian2','Img_Tanchuangdi/xinxi/Img_Biaotixian2',2},{'LvRoot','Img_Tanchuangdi/LV/LvRoot',2},{'LvItem','Img_Tanchuangdi/LV/LvItem',2},{'EquipAttrRoot','Img_Tanchuangdi/EquipAttrRoot',2},{'EquipAttr_1','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_1',2},{'Img_Shuxingicondi','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_1/Img_Shuxingicondi',2},{'Img_AttrIcon1','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_1/Img_AttrIcon1',2},{'EquipAttr_2','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_2',2},{'Img_Shuxingicondi01','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_2/Img_Shuxingicondi',2},{'Img_AttrIcon2','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_2/Img_AttrIcon2',2},{'Btn_GoGrade','Img_Tanchuangdi/Btn_GoGrade',2},
        -- TextMeshProUGUI 列表
        {'Text_GMZBxiangqing','Img_Tanchuangdi/Text_GMZBxiangqing',20},{'Text_Weihuoqu','Img_Tanchuangdi/EquipInfo/Lock/Text_Weihuoqu',20},{'Text_Xianzhi','Img_Tanchuangdi/Text_Xianzhi',20},{'Text_Jueseming','Img_Tanchuangdi/Text_Jueseming',20},{'Text_EquipName','Img_Tanchuangdi/xinxi/Text_EquipName',20},{'Text_Zhuangbeizhong','Img_Tanchuangdi/xinxi/EquipRole/Text_Zhuangbeizhong',20},{'Text_Des','Img_Tanchuangdi/xinxi/ScrollDes/Text_Des',20},{'Text_Lv','Img_Tanchuangdi/LV/Text_Lv',20},{'Text_EquipLv','Img_Tanchuangdi/LV/Text_EquipLv',20},{'Text_10','Img_Tanchuangdi/LV/Text_10',20},{'Text_Attr1','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_1/Text_Attr1',20},{'Text_AttrName1','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_1/Text_AttrName1',20},{'Text_Attr2','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_2/Text_Attr2',20},{'Text_AttrName2','Img_Tanchuangdi/EquipAttrRoot/EquipAttr_2/Text_AttrName2',20},{'Text_Qianwangshengji','Img_Tanchuangdi/Btn_GoGrade/Text_Qianwangshengji',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---取消/关闭
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    ---前往升级界面
    UIEvent.LuaClick(self.Btn_GoGrade().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self:ClosePop()
        RoleCardViewModel.CurrentHero = self.heroData
        RoleCardViewModel.CurrentEquip = self.equipData
        MgrUI.GoHide(UID.VoidGearDetail_UI) --前往升级界面
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:ClosePop()
    end
end

---更新显示 参数1：碎片数据，参数2：前往回调（数量）
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    ---@type EquipData
    self.equipData = args[1]
    self.bagVoid = args[2]
    self.heroData = self.equipData:GetRole()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s",self.equipData.equipID))
    if isNew == nil or isNew == "" then
        UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "GearBag%s",self.equipData.equipID),self.equipData.equipID)
    end
    ---更新装备图标
    MgrRes.LoadSprite(self.Img_Icon(),self.equipData.icon)
    MgrRes.LoadSprite(self.Img_Frame(),self.equipData.iconBFrame)
    self.Lock().gameObject:SetActive(not self.equipData.lockState)
    self.Btn_GoGrade().gameObject:SetActive(self.equipData.lockState)
    self.Text_EquipName().text = self.equipData.name
    self.Text_Des().text = self.equipData.txt
    if self.equipData.lockState then
        if self.heroData.lockState then
            self.EquipRole().gameObject:SetActive(true)
            MgrRes.LoadCircleIcon(self.RoleIcon(),self.heroData.skin)
        else
            self.EquipRole().gameObject:SetActive(false)
        end
    else
        self.EquipRole().gameObject:SetActive(false)
    end
    self.Text_EquipLv().text = self.equipData.level
    local lvItem = self.LvItem().gameObject
    local lvRoot = self.LvRoot().transform
    for i = 1, self.equipData.level do
        GameObject.Instantiate(lvItem,lvRoot,false)
    end
    lvItem:SetActive(false)
    if #self.equipData.attrs == 1 then
        self.EquipAttr_2().gameObject:SetActive(false)
    elseif #self.equipData.attrs == 2 then
    else
        self.EquipAttr_1().gameObject:SetActive(false)
        self.EquipAttr_2().gameObject:SetActive(false)
    end
    if self.equipData.attrs ~= nil then
        local attrStr = ""
        for idx = 1, #self.equipData.attrs do
            if self.equipData.attrs[idx].type == 1 then
                attrStr = string.format("%.2f", self.equipData.attrs[idx].attribute).."%"
            else
                attrStr = string.format("%.0f", self.equipData.attrs[idx].attribute).."%"
            end
            self["Text_Attr"..idx]().text = attrStr
            self["Text_AttrName"..idx]().text = self.equipData.attrs[idx].attrName
            MgrRes.LoadSprite(self["Img_AttrIcon"..idx](),self.equipData.attrs[idx].attrIcon)
        end
    end
    self.Text_Jueseming().text = self.heroData.name
end

function M:ClosePop()
    if self.bagVoid then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self.bagVoid:VoidGearScroll01():RefreshCells()
        self.bagVoid:CheckVoidRot()
        self.bagVoid:CheckRedDot()
    end
    MgrUI.ClosePop(self.Uid)
end
return M