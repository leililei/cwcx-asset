-- Code Auto Create Begin
local M = Class('RoleGearCore_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleGearCore_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleGearCore_UI].prefab'
    self.Name = 'Form[RoleGearCore_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NomalBg','NomalBg',2},{'Blur','Blur',2},{'LeftPanel','LeftPanel',2},{'youxian1','LeftPanel/youxian1',2},{'youxian2','LeftPanel/youxian2',2},{'NewRoleGearPrefab2','LeftPanel/GearDetailScroll/NewRoleGearPrefab2',2},{'GearDetailContent','LeftPanel/GearDetailScroll/GearDetailContent',2},{'Btn_FilterBtnPanelClose','LeftPanel/Btn_FilterBtnPanelClose',2},{'SwitchPanel','LeftPanel/SwitchPanel',2},{'Img_di','LeftPanel/SwitchPanel/Img_di',2},{'Jingong','LeftPanel/SwitchPanel/Jingong',2},{'Icon','LeftPanel/SwitchPanel/Jingong/Icon',2},{'Fangshou','LeftPanel/SwitchPanel/Fangshou',2},{'Icon01','LeftPanel/SwitchPanel/Fangshou/Icon',2},{'ArmorSelect','LeftPanel/SwitchPanel/ArmorSelect',2},{'Gong1','LeftPanel/SwitchPanel/Gong1',2},{'NGong1','LeftPanel/SwitchPanel/Gong1/NGong1',2},{'SGong1','LeftPanel/SwitchPanel/Gong1/SGong1',2},{'Gong2','LeftPanel/SwitchPanel/Gong2',2},{'NGong2','LeftPanel/SwitchPanel/Gong2/NGong2',2},{'SGong2','LeftPanel/SwitchPanel/Gong2/SGong2',2},{'Fang1','LeftPanel/SwitchPanel/Fang1',2},{'NFang1','LeftPanel/SwitchPanel/Fang1/NFang1',2},{'SFang1','LeftPanel/SwitchPanel/Fang1/SFang1',2},{'Fang2','LeftPanel/SwitchPanel/Fang2',2},{'NFang2','LeftPanel/SwitchPanel/Fang2/NFang2',2},{'SFang2','LeftPanel/SwitchPanel/Fang2/SFang2',2},{'qiehuandi(you)','LeftPanel/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','LeftPanel/GearSortPanel/GearSortToggleGroup',2},{'GearBagSortToggle','LeftPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',2},{'FilterPanelPivot','LeftPanel/FilterPanelPivot',2},{'GearFilterToggleGroup','LeftPanel/FilterPanelPivot/Mask/GearFilterToggleGroup',2},{'GearBagFilterToggle','LeftPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',2},{'Btn_GearFilter','LeftPanel/FilterPanelPivot/Btn_GearFilter',2},{'shaixuandi','LeftPanel/FilterPanelPivot/Btn_GearFilter/shaixuandi',2},{'GearFilterNormal','LeftPanel/FilterPanelPivot/Btn_GearFilter/GearFilterNormal',2},{'GearFilterHighLight','LeftPanel/FilterPanelPivot/Btn_GearFilter/GearFilterHighLight',2},{'RoleGear1Panel','RoleGear1Panel',2},{'GearUnWornPrefab','RoleGear1Panel/GearUnWornPrefab',2},{'GearWornPrefab','RoleGear1Panel/GearWornPrefab',2},{'Img_Landi','RoleGear1Panel/GearWornPrefab/Img_Landi',2},{'GearIconImg','RoleGear1Panel/GearWornPrefab/GearIconImg',2},{'Img_Num','RoleGear1Panel/Img_Num',2},{'RoleGear2Panel','RoleGear2Panel',2},{'GearUnWornPrefab01','RoleGear2Panel/GearUnWornPrefab',2},{'GearWornPrefab01','RoleGear2Panel/GearWornPrefab',2},{'Img_Landi01','RoleGear2Panel/GearWornPrefab/Img_Landi',2},{'Gear_Img_Suo_hui','RoleGear2Panel/GearWornPrefab/Gear_Img_Suo_hui',2},{'Gear_Img_Suo','RoleGear2Panel/GearWornPrefab/Gear_Img_Suo',2},{'CoreLockPressArea','RoleGear2Panel/GearWornPrefab/CoreLockPressArea',2},{'GearIconImg01','RoleGear2Panel/GearWornPrefab/GearIconImg',2},{'GearInfoPanel','RoleGear2Panel/GearWornPrefab/GearInfoPanel',2},{'GearInfoPrefab1','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1',2},{'Img_Shuxingdi','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/Img_Shuxingdi',2},{'VoidIconBG','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/VoidIconBG',2},{'GearInfoIcon','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoIcon',2},{'GearInfoPrefab2','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2',2},{'Img_Shuxingdi01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/Img_Shuxingdi',2},{'VoidIconBG01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/VoidIconBG',2},{'GearInfoIcon01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoIcon',2},{'GearSkillPrefab','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab',2},{'Img_SkillXian','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Img_SkillXian',2},{'VoidGearIcon','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Btn_Chakan',2},{'Img_Num01','RoleGear2Panel/Img_Num',2},{'RightPanel','RightPanel',2},{'HpNamePanel','RightPanel/RoleInfoPanel/HpNamePanel',2},{'AtkNamePanel','RightPanel/RoleInfoPanel/AtkNamePanel',2},{'SupNamePanel','RightPanel/RoleInfoPanel/SupNamePanel',2},{'DefNamePanel','RightPanel/RoleInfoPanel/DefNamePanel',2},{'CriNamePanel','RightPanel/RoleInfoPanel/CriNamePanel',2},{'ChdNamePanel','RightPanel/RoleInfoPanel/ChdNamePanel',2},{'AgrNamePanel','RightPanel/RoleInfoPanel/AgrNamePanel',2},{'RoleInfo','RightPanel/RoleInfo',2},{'CurImg_Suo_hui','RightPanel/RoleInfo/CurImg_Suo_hui',2},{'CurImg_Suo','RightPanel/RoleInfo/CurImg_Suo',2},{'CurLockPressArea','RightPanel/RoleInfo/CurLockPressArea',2},{'GearInfoPanel01','RightPanel/RoleInfo/GearInfoPanel',2},{'CurInfoPrefab1','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1',2},{'Img_Shuxingdi02','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1/Img_Shuxingdi',2},{'VoidIconBG02','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1/VoidIconBG',2},{'CurInfoIcon','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1/CurInfoIcon',2},{'CurInfoPrefab2','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2',2},{'Img_Shuxingdi03','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2/Img_Shuxingdi',2},{'VoidIconBG03','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2/VoidIconBG',2},{'CurInfoIcon01','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2/CurInfoIcon',2},{'Btn_SwitchGear','RightPanel/Btn_SwitchGear',2},{'Btn_UnWearGear','RightPanel/Btn_UnWearGear',2},{'Btn_WearHighLight','RightPanel/Btn_WearHighLight',2},{'Btn_Wear','RightPanel/Btn_Wear',2},{'Btn_Upgrade','RightPanel/Btn_Upgrade',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_xian','ReturnBg/Img_xian',2},{'DownPanel','DownPanel',2},
        -- UITemplate 列表
        {'NewRoleGearPrefab201','LeftPanel/GearDetailScroll/NewRoleGearPrefab2',10},{'GearBagSortToggle01','LeftPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',10},{'GearBagFilterToggle01','LeftPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',10},
        -- Toggle 列表
        {'Gong101','LeftPanel/SwitchPanel/Gong1',13},{'Gong201','LeftPanel/SwitchPanel/Gong2',13},{'Fang101','LeftPanel/SwitchPanel/Fang1',13},{'Fang201','LeftPanel/SwitchPanel/Fang2',13},{'GearBagSortToggle02','LeftPanel/GearSortPanel/GearSortToggleGroup/GearBagSortToggle',13},{'GearBagFilterToggle02','LeftPanel/FilterPanelPivot/Mask/GearFilterToggleGroup/GearBagFilterToggle',13},{'Btn_GearFilter01','LeftPanel/FilterPanelPivot/Btn_GearFilter',13},
        -- RawImage 列表
        {'GearDetailScroll','LeftPanel/GearDetailScroll',15},
        -- LoopScrollRect 列表
        {'GearDetailScroll01','LeftPanel/GearDetailScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Jingong','LeftPanel/SwitchPanel/Jingong/Text_Jingong',20},{'Text_Fangshou','LeftPanel/SwitchPanel/Fangshou/Text_Fangshou',20},{'GearFilterBtnText','LeftPanel/FilterPanelPivot/Btn_GearFilter/GearFilterBtnText',20},{'GearUpgradeText','RoleGear1Panel/GearWornPrefab/Img_Landi/GearUpgradeText',20},{'GearUpgradeText01','RoleGear2Panel/GearWornPrefab/Img_Landi/GearUpgradeText',20},{'GearNameTxt','RoleGear2Panel/GearWornPrefab/GearNameTxt',20},{'GearInfoText','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoText',20},{'GearInfoNameTxt','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNameTxt',20},{'GearInfoNull','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNull',20},{'GearInfoText01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoText',20},{'GearInfoNameTxt01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNameTxt',20},{'GearInfoNull01','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNull',20},{'GearSkillNameText','RoleGear2Panel/GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/GearSkillNameText',20},{'HpInfoText','RightPanel/RoleInfoPanel/HpNamePanel/HpInfoText',20},{'AtkInfoText','RightPanel/RoleInfoPanel/AtkNamePanel/AtkInfoText',20},{'SupInfoText','RightPanel/RoleInfoPanel/SupNamePanel/SupInfoText',20},{'DefInfoText','RightPanel/RoleInfoPanel/DefNamePanel/DefInfoText',20},{'CriInfoText','RightPanel/RoleInfoPanel/CriNamePanel/CriInfoText',20},{'ChdInfoText','RightPanel/RoleInfoPanel/ChdNamePanel/ChdInfoText',20},{'AgrInfoText','RightPanel/RoleInfoPanel/AgrNamePanel/AgrInfoText',20},{'CurNameTxt','RightPanel/RoleInfo/CurNameTxt',20},{'CurGearUpgrade','RightPanel/RoleInfo/CurGearUpgrade',20},{'CurInfoText','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1/CurInfoText',20},{'CurInfoNameTxt','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab1/CurInfoNameTxt',20},{'CurInfoText01','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2/CurInfoText',20},{'CurInfoNameTxt01','RightPanel/RoleInfo/GearInfoPanel/CurInfoPrefab2/CurInfoNameTxt',20},{'Btn_WearTxt','RightPanel/Btn_SwitchGear/Btn_WearTxt',20},{'Btn_WearTxt01','RightPanel/Btn_UnWearGear/Btn_WearTxt',20},{'Btn_WearTxt02','RightPanel/Btn_WearHighLight/Btn_WearTxt',20},{'Btn_WearTxt03','RightPanel/Btn_Wear/Btn_WearTxt',20},{'Btn_UpgradeText','RightPanel/Btn_Upgrade/Btn_UpgradeText',20},{'CnBgTitle','ReturnBg/CnBgTitle',20},{'EnBgTitle','ReturnBg/EnBgTitle',20},
    }
end
-- Code Auto Create End
require("LocalData/SteamLocalData")

function M:OnInit()
    self.switch = false
    self.IsFirst = true
    --self.IsOther = false
    ---当前核心附加人物属性
    self.Tab_CurRoleAbt={}
    --当前两个槽位核心唯一ID
    self.GearPanel1UID=0
    self.GearPanel2UID=0
    ---左右槽核心
    self.GearData1= nil
    self.GearData2= nil
    ---当前点击核心
    ---@type CoreData
    self.CurSelectCore = nil
    --当前选择槽位
    self.TopIndex = RoleCardViewModel.CurCoreIndex
    ---当前操作 false为槽位，true为核心背包
    self.IsChoose = false
    ---当前装备的核心数据
    self.CurGearData = nil
    
    self.GearWornPrefab().gameObject:SetActive(false)
    self.GearUnWornPrefab().gameObject:SetActive(true)
    self.GearWornPrefab01().gameObject:SetActive(false)
    self.GearUnWornPrefab01().gameObject:SetActive(true)
   
    ---@type RoleData
    self.CurHero = RoleCardViewModel.CurrentHero
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    self.RoleId = RoleCardViewModel.CurrentHero.id
    ReadData.SetCoreType(RoleCardViewModel.CurArmorType)
    self.CurBattleRole = ReadData.GetRoleAttr(self.CurHero.id,self.CurHero.level,self.CurHero.star,self.CurHero:GetHeroSkillLevel(),self.CurHero.awaken)
    self:InitVoidAttr()
    ---初始化槽位核心信息
    self:InitToGearPanel()
    ---核心背包初始化
    self:InitDetailGearBag()
    self:InitButton()
    self:SwitchWearBtnType(1)
    self:SwitchUpgradeBtnType()
    --self:SwitchArmorType(RoleCardViewModel.CurArmorType)
end
---增加共鸣基础属性
function M:InitVoidAttr()
    --local arr = self.CurHero:GetVoidEquip()
    local arr = self.CurHero:GetHeroVoidEquip()
    for i, v in pairs(arr) do
        if v.lockState then
            for m, n in pairs(v.attrs) do
                ReadData.SetAdd_Abt(self.CurHeroAttr ,n.attrID,n.attribute)
                ReadData.SetAdd_Abt(self.CurBattleRole ,n.attrID,n.attribute)
            end
        end
    end
end
--更新属性Panel基础信息
function M:InitRoleInfoPanel()
    if self.CurBattleRole.Occupation == 4 then
        self.SupNamePanel().gameObject:SetActive(true)
        self.AtkNamePanel().gameObject:SetActive(false)
    else
        self.SupNamePanel().gameObject:SetActive(false)
        self.AtkNamePanel().gameObject:SetActive(true)
    end
    --角色属性信息
    if  self.CurBattleRole.RealAtk < 0 then
        self.CurBattleRole.RealAtk = 0
    end
    if  self.CurBattleRole.RealSuppart < 0 then
        self.CurBattleRole.RealSuppart = 0
    end
    if self.CurBattleRole.RealDef < 0 then
        self.CurBattleRole.RealDef = 0
    end
    if  self.CurBattleRole.HP < 0 then
        self.CurBattleRole.HP = 0
    end
    if  self.CurBattleRole.RealAgile < 0 then
        self.CurBattleRole.RealAgile = 0
    end
    if  self.CurBattleRole.RealCrit < 0 then
        self.CurBattleRole.RealCrit = 0
    end
    if  self.CurBattleRole.RealCritDmg < 0 then
        self.CurBattleRole.RealCritDmg = 0
    end
    ReadData.SetCoreType(RoleCardViewModel.CurArmorType)
    --加好感度额外属性
    local tempRole = ReadData.CreatRole(self.CurHeroAttr.ID, self.CurHeroAttr.SkinID, self.CurHeroAttr.LV, self.CurHeroAttr.StartLV, 0, self.CurHeroAttr.IsAwaken, self.CurHero.favor)
    local tempAtk = tempRole.RealAtk  - self.CurBattleRole.RealAtk--额外攻击力
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealAtk,self.CurBattleRole.RealAtk,false) == 0 then
        self.AtkInfoText().text= math.floor(self.CurBattleRole.RealAtk + tempAtk)
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealAtk,self.CurBattleRole.RealAtk,false) == 1 then
        self.AtkInfoText().text= "<color=#3affe1>"..math.floor(self.CurBattleRole.RealAtk + tempAtk).."</color>"
    else
        self.AtkInfoText().text= "<color=#ff2d4f>"..math.floor(self.CurBattleRole.RealAtk + tempAtk).."</color>"
    end
    --额外Suppart
    local tempSuppart = tempRole.RealSuppart - self.CurBattleRole.RealSuppart
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealSuppart,self.CurBattleRole.RealSuppart,true) == 0 then
        self.SupInfoText().text="".. (self.GetInfoCorrect(self.CurBattleRole.RealSuppart + tempSuppart)).."%"
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealSuppart,self.CurBattleRole.RealSuppart,true) == 1 then
        self.SupInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(self.CurBattleRole.RealSuppart + tempSuppart)).."%</color>"
    else
        self.SupInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(self.CurBattleRole.RealSuppart + tempSuppart)).."%</color>"
    end

    --额外Def
    local tempDef = tempRole.RealDef - self.CurBattleRole.RealDef
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealDef,self.CurBattleRole.RealDef,true) == 0 then
        self.DefInfoText().text="".. (self.GetInfoCorrect(self.CurBattleRole.RealDef + tempDef)).."%"
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealDef,self.CurBattleRole.RealDef,true) == 1 then
        self.DefInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(self.CurBattleRole.RealDef + tempDef)).."%</color>"
    else
        self.DefInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(self.CurBattleRole.RealDef + tempDef)).."%</color>"
    end

    --额外hp
    local tempHP = tempRole.HP - self.CurBattleRole.HP
    if self.GetRoleInfoUITxt( self.CurHeroAttr.HP,self.CurBattleRole.HP,false) == 0 then
        self.HpInfoText().text ="".. math.floor(self.CurBattleRole.HP + tempHP)
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.HP,self.CurBattleRole.HP,false) == 1 then
        self.HpInfoText().text= "<color=#3affe1>"..math.floor(self.CurBattleRole.HP + tempHP).."</color>"
    else
        self.HpInfoText().text= "<color=#ff2d4f>"..math.floor(self.CurBattleRole.HP + tempHP).."</color>"
    end

    --额外Agile
    local tempAgile = tempRole.RealAgile - self.CurBattleRole.RealAgile
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealAgile,self.CurBattleRole.RealAgile,true) == 0 then
        self.AgrInfoText().text="".. (self.GetInfoCorrect(self.CurBattleRole.RealAgile + tempAgile)).."%"
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealAgile,self.CurBattleRole.RealAgile,true) == 1 then
        self.AgrInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(self.CurBattleRole.RealAgile + tempAgile)).."%</color>"
    else
        self.AgrInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(self.CurBattleRole.RealAgile + tempAgile)).."%</color>"
    end

    local tempCrit = tempRole.RealCrit - self.CurBattleRole.RealCrit
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealCrit,self.CurBattleRole.RealCrit,true) == 0 then
        self.CriInfoText().text="".. (self.GetInfoCorrect(self.CurBattleRole.RealCrit + tempCrit)).."%"
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealCrit,self.CurBattleRole.RealCrit,true) == 1 then
        self.CriInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(self.CurBattleRole.RealCrit + tempCrit)).."%</color>"
    else
        self.CriInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(self.CurBattleRole.RealCrit + tempCrit)).."%</color>"
    end
    --额外CritDmg
    local tempCritDmg = tempRole.RealCritDmg - self.CurBattleRole.RealCritDmg
    if self.GetRoleInfoUITxt( self.CurHeroAttr.RealCritDmg,self.CurBattleRole.RealCritDmg,true) == 0 then
        self.ChdInfoText().text="".. (self.GetInfoCorrect(self.CurBattleRole.RealCritDmg + tempCritDmg)).."%"
    elseif self.GetRoleInfoUITxt( self.CurHeroAttr.RealCritDmg,self.CurBattleRole.RealCritDmg,true) == 1 then
        self.ChdInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(self.CurBattleRole.RealCritDmg + tempCritDmg)).."%</color>"
    else
        self.ChdInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(self.CurBattleRole.RealCritDmg + tempCritDmg)).."%</color>"
    end
    --Tools.SetSliderValue(self.DefSlider().gameObject,self.CurBattleRole.RealDef)
    --Tools.SetSliderValue(self.CriSlider().gameObject,self.CurBattleRole.RealCrit)
    --Tools.SetSliderValue(self.ChdSlider().gameObject,self.CurBattleRole.RealCritDmg)
    --Tools.SetSliderValue(self.AgrSlider().gameObject,self.CurBattleRole.RealAgile)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
        Event.Go("UpdataDetailPanel")
    end
end

--取整人物信息
function M.GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*10000)/1)
    tempData=tempInt1/100
    return tempData
end
--根据传入的两个数值比较输出UI显示Text字符串
function M.GetRoleInfoUITxt(_Abt1,_Abt2,_IsPercent)
    -- statements
    local isAdd = 1   ---0为不变，1为增加，2为减少
    local str =""
    if _Abt1 < _Abt2 then
        -- 增加情况
        if _IsPercent == true then
            -- 百分比情况
            local value = (_Abt2 - _Abt1)*10000
            str="".."<color=#3affe1>(+"..(math.floor(value)*0.01).."%)</color>"
        else
            --固定值情况.
            str="".."<color=#3affe1>(+"..math.floor(_Abt2 - _Abt1)..")</color>"
        end
        isAdd = 1
    elseif _Abt1 == _Abt2 then
        -- statements
        str=""
        isAdd = 0
    else
        --减少情况
        if _IsPercent == true then
            -- 百分比情况
            local value = (_Abt1 - _Abt2)*10000
            str="".."<color=#ff2d4f>(-"..(math.floor(value)*0.01).."%)</color>"
        else
            --固定值情况.
            str="".."<color=#ff2d4f>(-"..math.floor(_Abt1 - _Abt2)..")</color>"
        end
        isAdd = 2
    end
    return isAdd
end
---初始化槽位核心信息
function M:InitToGearPanel()
    -- statements
    local tArmor1 = self.CurHero.armor1
    local tArmor2 = self.CurHero.armor2
    if RoleCardViewModel.CurArmorType == 1 then
        tArmor1 = self.CurHero.heroDefArmor1
        tArmor2 = self.CurHero.heroDefArmor2
    end
    if self.GearData1 then
        ReadData.InitRoleGear(self.CurBattleRole,self.GearData1.attrs,false)
    end
    if self.GearData2 then
        ReadData.InitRoleGear(self.CurBattleRole,self.GearData2.attrs,false)
    end
    if tArmor1~=0 and tArmor1~=nil then     ---当玩家的第一件装备不为空
        self.GearPanel1UID = tArmor1
        self.GearData1 = CoreControl.GetSingleCoreData(self.GearPanel1UID)       ---获得装备数据
        self.GearWornPrefab().gameObject:SetActive(true)                        ---激活穿戴图片
        self.GearUnWornPrefab().gameObject:SetActive(false)
        --if self.IsFirst then                                                    ---如果是第一次穿，则加属性，否则，要减去之前的属性
            ReadData.InitRoleGear(self.CurBattleRole,self.GearData1.attrs,true)
        --end
        self:InitGearDetailPanel(self.GearData1,self.GearWornPrefab().gameObject) --选中的核心
    else
        self.GearData1 = nil
        self.GearWornPrefab().gameObject:SetActive(false)                       ---激活未穿装备图片
        self.GearUnWornPrefab().gameObject:SetActive(true)
    end

    if tArmor2~=0 and tArmor2~=nil then                 ---第二件装备
        self.GearPanel2UID = tArmor2
        self.GearData2 = CoreControl.GetSingleCoreData(self.GearPanel2UID)
        self.GearWornPrefab01().gameObject:SetActive(true)
        self.GearUnWornPrefab01().gameObject:SetActive(false)
        self:InitGearDetailPanel( self.GearData2,self.GearWornPrefab01().gameObject)
        --if self.IsFirst then
            ReadData.InitRoleGear(self.CurBattleRole,self.GearData2.attrs,true)
        --end
    else
        self.GearData2 = nil
        self.GearWornPrefab01().gameObject:SetActive(false)
        self.GearUnWornPrefab01().gameObject:SetActive(true)
    end
    self:InitRoleInfoPanel()                                                    ---更新角色属性
    self.IsFirst = false
    
    self.RoleGear1Panel().gameObject:SetActive(self.TopIndex==1)
    self.RoleGear2Panel().gameObject:SetActive(self.TopIndex==2)
  --  self.CurBattleRole =  ReadData.GetGearRole(self.CurBattleRole,self.GearData1)
    --更新所选槽位的核心
    if self.TopIndex == 1 then
        self:UpdataCore(self.GearData1)
        self.CurSelectCore = self.GearData1
    else
        self:UpdataCore(self.GearData2)
        self.CurSelectCore = self.GearData2
    end
end
function M:OnBackShow()
    --self:InitToGearPanel()
    --self:ResetCoreView()
    if self.CurSelectCore then
        self:ResetCoreView(nil,true)
        self:ReloadPuzzleBtn(self.CurSelectCore)
    end
    --self.GearDetailScroll01():RefreshCells()
    --self:SwitchWearBtnType(1)
end
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --更新点击事件
    UIEvent.LuaClick(self.RoleGear1Panel().gameObject,Handle(self,function ()
        if self.CurSelectCore then
            self.CurSelectCore.isSelect = false
            self.CurSelectCore = nil
        end
        self.IsChoose = false
        self.TopIndex = 1
        self:CompareCoreAttr()
        self:SwitchWearBtnType(1)
        self:SwitchUpgradeBtnType()
        ---刷新所有数据
        self.GearDetailScroll01():RefreshCells()
        --   Event.Go("DetailGearCardClick")
    end))
    UIEvent.LuaClick(self.RoleGear2Panel().gameObject,Handle(self,function ()
        if self.CurSelectCore then
            self.CurSelectCore.isSelect = false
            self.CurSelectCore = nil
        end
        self.IsChoose = false
        self.TopIndex = 2
        self:CompareCoreAttr()
        self:SwitchWearBtnType(1)
        self:SwitchUpgradeBtnType()
        ---刷新所有数据
        self.GearDetailScroll01():RefreshCells()
        --  Event.Go("DetailGearCardClick")
    end))
    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self, function ()
        if self.IsChoose then
            RoleCardViewModel.CurrentCore = self.CurSelectCore
        else
            if self.TopIndex == 1 then
                RoleCardViewModel.CurrentCore = self.GearData1
            elseif self.TopIndex == 2 then
                RoleCardViewModel.CurrentCore = self.GearData2
            end
        end
        if RoleCardViewModel.CurrentCore.star >= 6 
                and RoleCardViewModel.CurrentCore.quality >= 5 
                and RoleCardViewModel.CurrentCore.level >= 15 then
            BagViewModel.CorePage = 2
            MgrUI.GoHide(UID.NewGearUpgrade_UI)
            BagViewModel.CorePage = nil
        else
            MgrUI.GoHide(UID.NewGearUpgrade_UI)
        end
    end))

    UIEvent.LuaClick(self.Btn_WearHighLight().gameObject,Handle(self, self.OnClickWear))
    UIEvent.LuaClick(self.Btn_SwitchGear().gameObject,Handle(self, self.OnClickChange))
    UIEvent.LuaClick(self.Btn_UnWearGear().gameObject,Handle(self, self.OnClickTakeOff))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, function()
        MgrUI.GoBack()
        Event.Go("UpdataDetailPanel")
    end)
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
--[[    ---进攻核心组
    UIEvent.LuaClick(self.Jingong().gameObject,Handle(self, function()
        if RoleCardViewModel.CurArmorType == 0 then
            return
        end
        RoleCardViewModel.CurArmorType = 0
        self:SwitchArmorType(RoleCardViewModel.CurArmorType)
        
        self:InitToGearPanel()
        self:SwitchWearBtnType(1)
    end))
    ---防守核心组
    UIEvent.LuaClick(self.Fangshou().gameObject,Handle(self, function()
        if RoleCardViewModel.CurArmorType == 1 then
            return
        end
        RoleCardViewModel.CurArmorType = 1
        self:SwitchArmorType(RoleCardViewModel.CurArmorType)
        
        self:InitToGearPanel()
        self:SwitchWearBtnType(1)
    end))]]
    --按钮 核心类型 核心槽位
    local toggleList = {
        [1] = { toggle = self.Gong101(),type = 0,TopIndex = 1 },
        [2] = { toggle = self.Gong201(),type = 0,TopIndex = 2 },
        [3] = { toggle = self.Fang101(),type = 1,TopIndex = 1 },
        [4] = { toggle = self.Fang201(),type = 1,TopIndex = 2 },
    }
    for i, v in ipairs(toggleList) do
        Tools.ToggleValueChange(v.toggle,function(isOn)
            RoleCardViewModel.CurArmorType = v.type
            self.TopIndex = v.TopIndex
            ---清除已选
            self:ClearSelect()
            self:InitToGearPanel()
            self:SwitchWearBtnType(1)
            self:ResetCoreView()
        end)
    end
    --当前选择的槽位
    local tIdx = RoleCardViewModel.CurArmorType*2+self.TopIndex
    toggleList[tIdx].toggle.isOn = true
end
---切换增幅按钮状态(强化/开发)
function M:SwitchUpgradeBtnType()
    if self.IsChoose then
        if self.CurSelectCore then
            self.Btn_Upgrade().gameObject:SetActive(true)
        else
            self.Btn_Upgrade().gameObject:SetActive(false)
        end
    else
        if self.TopIndex == 1 then
            if self.GearData1 then
                self.Btn_Upgrade().gameObject:SetActive(true)
            else
                self.Btn_Upgrade().gameObject:SetActive(false)
            end
        elseif self.TopIndex == 2 then
            if self.GearData2 then
                self.Btn_Upgrade().gameObject:SetActive(true)
            else
                self.Btn_Upgrade().gameObject:SetActive(false)
            end
        end
    end
end
--初始化人物界面核心信息
---@param GearData CoreData
function M:InitGearDetailPanel(GearData, _GearWornPrefab)
    --local UpgradeTextObj = CJNUIMgr.GetSunUseName(_GearWornPrefab, "GearUpgradeText"):GetComponent("TextMeshProUGUI")
    --print(UpgradeTextObj)
    
    local GearIconImg = CJNUIMgr.GetSunUseName(_GearWornPrefab, "GearIconImg")
--[[    --基础属性1
    local GearInfoPrefab1 = CJNUIMgr.GetSunUseName(_GearWornPrefab, "GearInfoPrefab1")
    --基础属性2
    local GearInfoPrefab2 = CJNUIMgr.GetSunUseName(_GearWornPrefab, "GearInfoPrefab2")]]
    -- ---强化等级
    --UpgradeTextObj.text = "+" .. GearData.level

--[[    ---是否已经上锁
    self.isLocked = CoreControl.GetCoreLock(GearData.uid)
    if self.isLocked == 1 then
        CoreLocked.gameObject:SetActive(true)
        CoreUnlocked.gameObject:SetActive(false)
    else
        CoreLocked.gameObject:SetActive(false)
        CoreUnlocked.gameObject:SetActive(true)
    end
    -- ---注册上锁按钮事件
    UIEvent.LuaClick(CoreLockPressArea.gameObject, Handle(self, function()
        self:ClickLockIcon(GearData, CoreLocked, CoreUnlocked)
    end))]]

    ---设置核心图标
    MgrRes.LoadSprite(GearIconImg:GetComponent("Image"), GearData.icon)

    --self.attrList = {}
    --self.attrList[1] = GearInfoPrefab1.transform
    --self.attrList[2] = GearInfoPrefab2.transform
    ---- ---设置基础属性词条
    --for i = 1, #self.attrList do
    --    if GearData.attrs[i] then
    --        ---显示可用词条
    --        self.attrList[i]:Find("VoidIconBG").gameObject:SetActive(true)
    --        self.attrList[i]:Find("GearInfoIcon").gameObject:SetActive(true)
    --        self.attrList[i]:Find("GearInfoText").gameObject:SetActive(true)
    --        self.attrList[i]:Find("GearInfoNameTxt").gameObject:SetActive(true)
    --        ---属性图标
    --        MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"), GearData.attrs[i].attrIcon)
    --        ---属性值
    --        self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = GearData.attrs[i].type == 1 and string.format("%.2f%s", GearData.attrs[i].attribute, "%") or string.format("%.0f", GearData.attrs[i].attribute)
    --        ---属性名称
    --        self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = GearData.attrs[i].attrName
    --    else
    --        ---隐藏不可用词条
    --        --self.attrList[i].gameObject:SetActive(false)
    --        self.attrList[i]:Find("VoidIconBG").gameObject:SetActive(false)
    --        self.attrList[i]:Find("GearInfoIcon").gameObject:SetActive(false)
    --        ---属性值
    --        self.attrList[i]:Find("GearInfoText").gameObject:SetActive(false)
    --        ---属性名称
    --        self.attrList[i]:Find("GearInfoNameTxt").gameObject:SetActive(false)
    --    end
    --end
end
---更新选中核心数据
function M:UpdataCore(curData)
    self.attrList = { self.CurInfoPrefab1().transform,self.CurInfoPrefab2().transform }
    
    ---设置基础属性词条
    for i = 1, #self.attrList do
        if curData and curData.attrs[i] then
            local tCurAttr = curData.attrs[i]
            local tCurInfoIcon = self.attrList[i]:Find("CurInfoIcon"):GetComponent("Image")
            local tCurInfoText = self.attrList[i]:Find("CurInfoText"):GetComponent("TextMeshProUGUI")
            local tCurInfoNameTxt = self.attrList[i]:Find("CurInfoNameTxt"):GetComponent("TextMeshProUGUI")
            ---显示可用词条
            self.attrList[i].gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(tCurInfoIcon, tCurAttr.attrIcon)
            ---属性值
            tCurInfoText.text = tCurAttr.type == 1 and string.format("%.2f%s", tCurAttr.attribute, "%") or string.format("%.0f", tCurAttr.attribute)
            ---属性名称
            tCurInfoNameTxt.text = tCurAttr.attrName
        else
            ---隐藏不可用词条
            self.attrList[i].gameObject:SetActive(false)
        end
    end
    if curData == nil then
        self.RoleInfo().gameObject:SetActive(false)
        return
    end
    --核心名称
    self.CurNameTxt().text = curData.name
    --核心等级
    self.CurGearUpgrade().text =  "+" .. curData.level
    ---是否已经上锁
    self.isLocked = CoreControl.GetCoreLock(curData.uid)
    if self.isLocked == 1 then
        self.CurImg_Suo().gameObject:SetActive(true)
    else
        self.CurImg_Suo().gameObject:SetActive(false)
    end
    ---注册上锁按钮事件
    UIEvent.LuaClick(self.CurLockPressArea().gameObject, function()
        self:ClickLockIcon(curData, self.CurImg_Suo(), self.CurImg_Suo_hui())
    end)
    self.RoleInfo().gameObject:SetActive(true)
end

function M:GetQualityName(qualityID)
    local name = ""
    if qualityID == 1 then
        name = "Item/Rank/ItemRank_1"
    elseif qualityID == 2  then
        name = "Item/Rank/ItemRank_2"
    elseif  qualityID == 3 then
        name = "Item/Rank/ItemRank_3"
    elseif  qualityID == 4 then
        name = "Item/Rank/ItemRank_4"
    elseif  qualityID == 5 then
        name = "Item/Rank/ItemRank_5"
    elseif  qualityID == 6 then
        name = "Item/Rank/ItemRank_6"
    end
    return name
end

---点击穿戴装备锁图标
function M:ClickLockIcon(GearData,CoreLocked,CoreUnlocked)
    local isLocked = CoreControl.GetCoreLock(GearData.uid)
    if isLocked == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            CoreControl.SaveCoreLock(GearData.uid,0,function ()
                CoreLocked.gameObject:SetActive(false)
                CoreUnlocked.gameObject:SetActive(true)
                ---刷新所有数据
                self.GearDetailScroll01():RefreshCells()
            end)
        end,nil,2},true)
    else
        CoreControl.SaveCoreLock(GearData.uid,1,function ()
            CoreLocked.gameObject:SetActive(true)
            CoreUnlocked.gameObject:SetActive(false)
            ---刷新所有数据
            self.GearDetailScroll01():RefreshCells()
        end)
    end
end
---点击弹出技能详情界面(new)
function M:InitCoreSkillPanel(_skillId)
    MgrUI.Pop(UID.CoreSkill_UI,_skillId,true)
end
---核心背包初始化
function M:InitDetailGearBag()
    ---设置核心背包详细LoopScroll回调
    self.GearDetailScroll01():SetLuaCellEvent(Handle(self,self.CellCore))
    self:InitCoreFilter()
end
---核心预制回调
function M:CellCore(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.CurCoreList[idx], self})
end
---核心背包筛选器
function M:InitCoreFilter()
    ---默认筛选显示全部
    self.CoreFilter = 0
    ---排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
        --[3] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get")
    }
    local t_sort = self:CreateFilterToggle(sorts,self.GearBagSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        self.CoreSort = sort
        self.CoreIsRise = isRise
        self:ResetCoreView(offset)
    end))
    ---筛选器
    local filterNames = SteamLocalData.tab[106011][2]
    local str = string.split(filterNames,"_")
    local filters = {
        str[1],
        str[2],
        str[3],
        str[4],
        str[5],
        str[6],
        str[7],
    }
    local t_filter = self:CreateFilterToggle(filters,self.GearBagFilterToggle().gameObject,self.GearFilterToggleGroup().gameObject.transform,Handle(self,function(self,filter,isOn,offset)
        --if self.CoreFilter == filter and not isOn then
        --    self.CoreFilter = 0
        --else
        --    self.CoreFilter = filter
        --end
        --self:ResetCoreView(offset)
        if isOn then
            self.CoreFilter = filter
            self:ResetCoreView(offset)
        end
    end),true)
    ---筛选器遮罩事件
    UIEvent.LuaClick(self.Btn_FilterBtnPanelClose().gameObject,function()
        self.Btn_GearFilter01().isOn = false
    end)
    ---筛选器动画
    self.Btn_GearFilter01().onValueChanged:AddListener(function(isOn)
        --local y = isOn and 0 or 500
        --Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
        self.Btn_FilterBtnPanelClose().gameObject:SetActive(isOn)
        local y = isOn and self.GearFilterToggleGroup().transform.rect.height or 0
        Global.DoMoveY(self.GearFilterToggleGroup().gameObject,y,0.3)
    end)
    ---隐藏预制
    self.GearBagSortToggle().gameObject:SetActive(false)
    self.GearBagFilterToggle().gameObject:SetActive(false)
    self.Btn_FilterBtnPanelClose().gameObject:SetActive(false)
    ---默认排序
    t_sort[1].isOn = false
    t_sort[1].isOn = true
    ---默认筛选
    self.CoreFilter = 0
    t_filter[1].enabled = false
    t_filter[1].isOn = false
    t_filter[1].isOn = true
    t_filter[1].enabled = true
    ---默认关闭筛选
    self.Btn_GearFilter01().isOn = false
end
---核心背包loopScroll刷新 isInSitu:是否保持原位
function M:ResetCoreView(offset, isInSitu)
    local tOffset = offset
    ---清除已选
    self:ClearSelect()
    ---获取核心数据
    self.CurCoreList,tOffset = self:GetCoreData(self.CoreFilter,self.CoreSort,self.CoreIsRise,isInSitu)
    ---设置核心总数
    self.GearDetailScroll01().totalCount = #self.CurCoreList
    ---刷新滑块
    if tOffset then
        ---刷新offset位置
        self.GearDetailScroll01():RefillCells(tOffset)
    else
        ---刷新数据不刷新位置
        self.GearDetailScroll01():RefreshCells()
    end
end
--isInSitu:是否保持原位
function M:GetCoreData(filterIdx, sortIdx, isRise, isInSitu)
    local array = CoreControl.GetCores()
    ---筛除类型
    if filterIdx and filterIdx ~= 0 then
        local filter_Str = string.split(SteamLocalData.tab[filterIdx][2],",")
        local filter_Num = {}
        for i, v in pairs(filter_Str) do
            filter_Num[i] = tonumber(v)
        end
        local filterGroup = {type = filter_Num}
        array =self:CoreFilters(array,filterGroup)
    end
    ---核心排序
    local sortGroup = {
        [1] = {"level","quality","star","properties"},
        [2] = {"star","quality","level","properties"},
        [3] = {"time","quality","star","properties"}
    }
    Global.Sort(array,sortGroup[sortIdx or 1],isRise or false)
    --将已装备核心放到第一个
    local tId = 0
    for i, v in ipairs(array) do
        if self.CurSelectCore and self.CurSelectCore == v then
            if not isInSitu then
                table.remove(array, i)
                table.insert(array, 1, v)
                v.isSelect = true
            else
                tId = i*0.5
            end
            break
        end
    end
   
    return array,tId
end
---核心筛选
function M:CoreFilters(list,kvs)
    local t = {}
    if not kvs then
        return list
    end
    for _, data in pairs(list) do
        local isSame = false
        for k, v in pairs(kvs) do
            if type(v) == "table" then
                for _, v_type in pairs(v) do
                    if data[k] == v_type then
                        ---类型相同时添加
                        isSame = true
                        break
                    end
                end
            else
                if data[k] == v then
                    ---类型相同时添加
                    isSame = true
                    break
                end
            end
        end
        if isSame then
            ---所有定义类型相同添加到表
            table.insert(t,data)
        end
    end
    return t
end
---选中的数据
function M:ReloadPuzzleBtn(curData)
    if self.CurSelectCore then
        self.CurSelectCore.isSelect = false
    end
    curData.isSelect = true
    self.CurSelectCore = curData
    self.IsChoose = true
    print(self.CurSelectCore.name)
    ---刷新所有数据
    self.GearDetailScroll01():RefreshCells()
    --更新选中核心数据
    self:UpdataCore(curData)

    self:CompareCoreAttr()
    local tArmorGroup = {}
    if self.TopIndex == 1 then
        if not self.GearData1 or #self.CurSelectCore.armorGroup == 0 then
            self:SwitchWearBtnType(0)
            return
        end
        tArmorGroup = self.GearData1.armorGroup
    elseif self.TopIndex == 2 then
        if not self.GearData2 or #self.CurSelectCore.armorGroup == 0 then
            self:SwitchWearBtnType(0)
            return
        end
        tArmorGroup = self.GearData2.armorGroup
    end
    local isSame = false
    for i, v in ipairs(self.CurSelectCore.armorGroup) do
        for j, armor in ipairs(tArmorGroup) do
            if v.roleID == armor.roleID and v.group == armor.group and v.slotID == armor.slotID then
                isSame = true
                break
            end
        end
    end
    if isSame then
        self:SwitchWearBtnType(1)
    else
        self:SwitchWearBtnType(0)
    end
end
function M:CompareCoreAttr()
    
    local roleAttr = table.DeepCopy(self.CurHeroAttr)
    if self.CurSelectCore then
        ReadData.InitRoleGear(roleAttr,self.CurSelectCore.attrs,true)
    else
        self:InitRoleInfoPanel()
        return
    end
    if self.GearData1 then
        if self.GearData1.uid == self.CurSelectCore.uid then
            self:UpdateCompareAttr(self.CurBattleRole,self.CurBattleRole)
            return
        end
    end
    if self.GearData2 then
        if self.GearData2.uid == self.CurSelectCore.uid then
            self:UpdateCompareAttr(self.CurBattleRole,self.CurBattleRole)
            return
        end
    end
    if self.GearData1 == nil and self.GearData2 == nil then
        self:UpdateCompareAttr(roleAttr,self.CurHeroAttr)
    elseif self.GearData1 and self.GearData2 == nil then
        if self.TopIndex == 1 then
            self:UpdateCompareAttr(roleAttr,self.CurBattleRole)
        else
            ReadData.InitRoleGear(roleAttr,self.GearData1.attrs,true)
            self:UpdateCompareAttr(roleAttr,self.CurBattleRole)
        end
    elseif self.GearData2 and self.GearData1 == nil then
        if self.TopIndex == 2 then
            self:UpdateCompareAttr(roleAttr,self.CurBattleRole)
        else
            ReadData.InitRoleGear(roleAttr,self.GearData2.attrs,true)
            self:UpdateCompareAttr(roleAttr,self.CurBattleRole)
        end
    else
        if self.TopIndex == 1 then
            ReadData.InitRoleGear(roleAttr,self.GearData2.attrs,true)
        elseif self.TopIndex == 2 then
            ReadData.InitRoleGear(roleAttr,self.GearData1.attrs,true)
        end
        self:UpdateCompareAttr(roleAttr,self.CurBattleRole)
    end
end
function M:UpdateCompareAttr(attr,targetAttr)
    if attr.Occupation == 4 then
        self.SupNamePanel().gameObject:SetActive(true)
        self.AtkNamePanel().gameObject:SetActive(false)
    else
        self.SupNamePanel().gameObject:SetActive(false)
        self.AtkNamePanel().gameObject:SetActive(true)
    end
    --角色属性信息
    if  attr.RealAtk < 0 then
        attr.RealAtk = 0
    end
    if  attr.RealSuppart < 0 then
        attr.RealSuppart = 0
    end
    if attr.RealDef < 0 then
        attr.RealDef = 0
    end
    if  attr.HP < 0 then
        attr.HP = 0
    end
    if  attr.RealAgile < 0 then
        attr.RealAgile = 0
    end
    if  attr.RealCrit < 0 then
        attr.RealCrit = 0
    end
    if  attr.RealCritDmg < 0 then
        attr.RealCritDmg = 0
    end
    ReadData.SetCoreType(RoleCardViewModel.CurArmorType)    
    local tRole  = ReadData.CreatRole(self.CurHeroAttr.ID, self.CurHeroAttr.SkinID, self.CurHeroAttr.LV, self.CurHeroAttr.StartLV, 0, self.CurHeroAttr.IsAwaken, self.CurHero.favor)

    local addAtk = attr.RealAtk - targetAttr.RealAtk
    if self.GetRoleInfoUITxt(targetAttr.RealAtk,attr.RealAtk,false) == 0 then
        self.AtkInfoText().text= math.floor(addAtk + tRole.RealAtk)
    elseif self.GetRoleInfoUITxt(targetAttr.RealAtk,attr.RealAtk,false) == 1 then
        self.AtkInfoText().text= "<color=#3affe1>"..math.floor(addAtk + tRole.RealAtk).."</color>"
    else
        self.AtkInfoText().text= "<color=#ff2d4f>"..math.floor(addAtk + tRole.RealAtk).."</color>"
    end

    local addSuppart = attr.RealSuppart - targetAttr.RealSuppart
    if self.GetRoleInfoUITxt(targetAttr.RealSuppart,attr.RealSuppart,true) == 0 then
        self.SupInfoText().text="".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealSuppart,attr.RealSuppart,true) == 1 then
        self.SupInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%</color>"
    else
        self.SupInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%</color>"
    end

    local addDef = attr.RealDef - targetAttr.RealDef
    if self.GetRoleInfoUITxt(targetAttr.RealDef,attr.RealDef,true) == 0 then
        self.DefInfoText().text="".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealDef,attr.RealDef,true) == 1 then
        self.DefInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%</color>"
    else
        self.DefInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%</color>"
    end
    --生命
    local addHP = attr.HP - targetAttr.HP
    if self.GetRoleInfoUITxt(targetAttr.HP,attr.HP,false) == 0 then
        self.HpInfoText().text ="".. math.floor(addHP + tRole.HP)
    elseif self.GetRoleInfoUITxt(targetAttr.HP,attr.HP,false) == 1 then
        self.HpInfoText().text= "<color=#3affe1>"..math.floor(addHP + tRole.HP).."</color>"
    else
        self.HpInfoText().text= "<color=#ff2d4f>"..math.floor(addHP + tRole.HP).."</color>"
    end
    --支援
    local addAgile = attr.RealAgile - targetAttr.RealAgile
    if self.GetRoleInfoUITxt(targetAttr.RealAgile,attr.RealAgile,true) == 0 then
        self.AgrInfoText().text="".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealAgile,attr.RealAgile,true) == 1 then
        self.AgrInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%</color>"
    else
        self.AgrInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%</color>"
    end

    local addCrit = attr.RealCrit - targetAttr.RealCrit
    if self.GetRoleInfoUITxt(targetAttr.RealCrit,attr.RealCrit,true) == 0 then
        self.CriInfoText().text="".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealCrit,attr.RealCrit,true) == 1 then
        self.CriInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%</color>"
    else
        self.CriInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%</color>"
    end

    local addCritDmg = attr.RealCritDmg - targetAttr.RealCritDmg
    if self.GetRoleInfoUITxt(targetAttr.RealCritDmg,attr.RealCritDmg,true) == 0 then
        self.ChdInfoText().text="".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealCritDmg,attr.RealCritDmg,true) == 1 then
        self.ChdInfoText().text="<color=#3affe1>".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%</color>"
    else
        self.ChdInfoText().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%</color>"
    end
    --Tools.SetSliderValue(self.DefSlider().gameObject,attr.RealDef)
    --Tools.SetSliderValue(self.CriSlider().gameObject,attr.RealCrit)
    --Tools.SetSliderValue(self.ChdSlider().gameObject,attr.RealCritDmg)
    --Tools.SetSliderValue(self.AgrSlider().gameObject,attr.RealAgile)
end
---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback,noIdx)
    local toggles = {}
    for idx, name in ipairs(filters) do
        if noIdx then
            local tStr = string.split(name,',')
            local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
            togTrans:GetComponent("UITemplate"):SetData({tStr[2],function(...)
                callback(tonumber(tStr[1]),...)
            end})
            toggles[idx] = togTrans:GetComponent("Toggle")
        else
            local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
            togTrans:GetComponent("UITemplate"):SetData({name,function(...)
                callback(idx,...)
            end,self.CoreFilter,idx})
            toggles[idx] = togTrans:GetComponent("Toggle")
        end
    end
    return toggles
end
--更改装备/卸下按钮
function M:SwitchWearBtnType(_Type)
    -- statements
    if _Type == 0 then
        -- statements
        if self.TopIndex == 1 then
            if self.GearData1 then
                self.Btn_SwitchGear().gameObject:SetActive(true)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(false)
            else
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(true)
                --self.Btn_Wear().gameObject:SetActive(false)
            end
        elseif self.TopIndex == 2 then
            if self.GearData2 then
                self.Btn_SwitchGear().gameObject:SetActive(true)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(false)
            else
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(true)
                --self.Btn_Wear().gameObject:SetActive(false)
            end
        end
    else
      --  self:ResetCoreView()
        if self.TopIndex == 1 then
            if self.GearData1 then
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(true)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(false)
            else
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(true)
            end
        elseif self.TopIndex == 2 then
            if self.GearData2 then
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(true)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(false)
            else
                self.Btn_SwitchGear().gameObject:SetActive(false)
                self.Btn_UnWearGear().gameObject:SetActive(false)
                self.Btn_WearHighLight().gameObject:SetActive(false)
                --self.Btn_Wear().gameObject:SetActive(true)
            end
        end
        self:SwitchUpgradeBtnType()
    end
    self:SwitchUpgradeBtnType()
end

function M:ReceiveChipSynthesisACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorACK',buffer))
end
function M:ClientHeroChangeArmorACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorACK',buffer))
    if tab.errNo ~= 0 then
        if tab.errNo == 673 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips1"),1},true)
        else
            print("核心： "..tab.errNo)
        end
    end
end
function M:ClientHeroChangeArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorNTF',buffer))
    --if tag == 0 then
    ---原来带这件装备的人先解除
    local PreviousRoleData = HeroControl.GetRoleDataByID(tab.data[1].oldHeroID)
    if PreviousRoleData then
        PreviousRoleData:ReLoadHeroCore(tab.data[1].oldSlot, 0, tab.data[1].armorGroup)
    end
    ---写入新数据
    local roleData = nil
    local coreData = nil
    --设置核心类型(0进攻 1防守)
    ReadData.SetCoreType(tab.data[1].armorGroup)
    if tab.data[1].armorID == 0 then
        roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
        if tab.data[1].armorSolt == 1 then
            ---攻防类型0攻击 1防守
            if tab.data[1].armorGroup == 0 then
                roleData.armor1 = 0
            else
                roleData.heroDefArmor1 = 0
            end
            if self.IsChoose then
                coreData = self.CurSelectCore
            else
                coreData = CoreControl.GetSingleCoreData(self.GearData1.uid)
            end
            if self.CurBattleRole.ID == coreData.RoleId then
                ReadData.InitRoleGear(self.CurBattleRole, coreData.attrs, false)
            end
            self.GearData1 = nil
        elseif tab.data[1].armorSolt == 2 then
            ---攻防类型0攻击 1防守
            if tab.data[1].armorGroup == 0 then
                roleData.armor2 = 0
            else
                roleData.heroDefArmor2 = 0
            end
            if self.IsChoose then
                coreData = self.CurSelectCore
            else
                coreData = CoreControl.GetSingleCoreData(self.GearData2.uid)
            end
            if self.CurBattleRole.ID == coreData.RoleId then
                ReadData.InitRoleGear(self.CurBattleRole, coreData.attrs, false)
            end
            self.GearData2 = nil
        end
        coreData:ReLoadCore(0, 0, tab.data[1].armorGroup)
    else
        local tArmorGroup = {}
        if self.TopIndex == 1 then
            if self.GearData1 ~= nil then
                ReadData.InitRoleGear(self.CurBattleRole, self.GearData1.attrs, false)
                self.GearData1.RoleId = 0
                self.GearData1.slot = 0
                tArmorGroup = self.GearData1.armorGroup
            end
        else
            if self.GearData2 ~= nil then
                ReadData.InitRoleGear(self.CurBattleRole, self.GearData2.attrs, false)
                self.GearData2.RoleId = 0
                self.GearData2.slot = 0
                tArmorGroup = self.GearData2.armorGroup
            end
        end
        for i = 1, #tArmorGroup do
            if tArmorGroup[i].group == tab.data[1].armorGroup then
                table.remove(tArmorGroup, i)
                break
            end
        end
        roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
        roleData:ReLoadHeroCore(tab.data[1].armorSolt, tab.data[1].armorID, tab.data[1].armorGroup)
        coreData = CoreControl.GetSingleCoreData(tab.data[1].armorID)
        coreData:ReLoadCore(tab.data[1].armorSolt, tab.data[1].heroID, tab.data[1].armorGroup)
        --ReadData.InitRoleGear(self.CurBattleRole,coreData.attrs,true)
    end

    if tag == 3 then
        self:ClearSelect()
    end
    CoreControl.GetCores()
    --RoleCardViewModel.ReloadCacheRoleData()
    self:InitToGearPanel()
    --self:ResetCoreView()
    self.GearDetailScroll01():RefreshCells()
    self:SwitchWearBtnType(1)
    if self.switch then
        self.switch = false
    end
    --if self.IsOther then
    --    self:OnClickWear()
    --    self.IsOther = false
    --end
    --end
end

function M:OnClickWear()
    local isChange = false
    for i = 1, #self.CurSelectCore.armorGroup do
        if self.CurSelectCore.armorGroup[i].group == RoleCardViewModel.CurArmorType then
            isChange = true
            break
        end
    end
    if isChange and not self.switch then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips2"),Handle(self, function()
            self.switch = true
            self:OnClickWear()
            --self.IsOther = true
        end),nil,2})
        return
    end
    print("穿上")
    local ArmorREQ =
    {
        data =  {
           [1] = {heroID = self.RoleId,
                  armorID = self.CurSelectCore.uid,
                  armorSolt = self.TopIndex,
                  armorGroup = RoleCardViewModel.CurArmorType
           }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,0,nil,Handle(self,self.ClientHeroChangeArmorACK),Handle(self,self.ClientHeroChangeArmorNTF))
end

function M:OnClickChange()
    print("交换")
    local isChange = false
    for i = 1, #self.CurSelectCore.armorGroup do
        if self.CurSelectCore.armorGroup[i].group == RoleCardViewModel.CurArmorType then
            isChange = true
            break
        end
    end
    if isChange and not self.switch then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips2"),Handle(self, function()
            self.switch = true
            self:OnClickChange()
            --self.IsOther = true
        end),nil,2})
        return
    end
    self.IsChoose = false
    local ArmorREQ =
    {
        data =  {
            [1] = {heroID = self.RoleId,
                   armorID = self.CurSelectCore.uid,
                   armorSolt = self.TopIndex,
                   armorGroup = RoleCardViewModel.CurArmorType
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,0,nil,Handle(self,self.ClientHeroChangeArmorACK),Handle(self,self.ClientHeroChangeArmorNTF))
end

function M:OnClickTakeOff()
    print("脱下")
    local ArmorREQ = {}
    --if self.IsChoose then
    --    ArmorREQ =
    --    {
    --        data =  {
    --            [1] = {heroID = self.CurSelectCore.RoleId,
    --                   armorID = 0,
    --                   armorSolt = self.CurSelectCore.slot,
    --                   armorGroup = RoleCardViewModel.CurArmorType}
    --        }
    --    }
    --else
        ArmorREQ =
        {
            data =  {
                [1] = {heroID = self.RoleId,
                       armorID = 0,
                       armorSolt = self.TopIndex,
                       armorGroup = RoleCardViewModel.CurArmorType
                }
            }
        }
    --end
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,3,nil,Handle(self,self.ClientHeroChangeArmorACK),Handle(self,self.ClientHeroChangeArmorNTF))
end

--创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

--创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
--根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    -- Tools.ClearAllChild(_Root)
    -- for i = 1, _StarLV, 1 do
    --     -- statements
    --     self:CreatStar(_Root,_Prefab)
    -- end

    local starCount = CoreControl.GetSingleCoreData(self.coreData.uid).star-- self.pData.star
    self.GearStarPanel().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            local specialActive = self.coreData.quality == 5
            Obj.gameObject:SetActive(starActive and not specialActive)
            if i <= starCount then
                Obj.gameObject:SetActive(true)
                if specialActive then
                    MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/Img_XingSuper")
                else
                    MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/Img_Xing_23")
                end
            else
                Obj.gameObject:SetActive(false)
            end
        end
    end


end
---攻防组切换0进攻 1防守
function M:SwitchArmorType(_type)
    if _type == 0 then
        self.ArmorSelect().transform.localPosition = self.Jingong().transform.localPosition
    else
        self.ArmorSelect().transform.localPosition = self.Fangshou().transform.localPosition
    end
end

function M:ClearSelect()
    if self.CurSelectCore then
        self.CurSelectCore.isSelect = false
    end
end

function M:OnClose()
    ReadData.SetCoreType(0)
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    if self.CurSelectCore then
        self.CurSelectCore.isSelect = false
        self.CurSelectCore = nil
    end
end

return M