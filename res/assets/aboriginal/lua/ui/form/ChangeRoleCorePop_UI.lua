-- Code Auto Create Begin
local M = Class('ChangeRoleCorePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ChangeRoleCorePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ChangeRoleCorePop_UI].prefab'
    self.Name = 'Form[ChangeRoleCorePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'ChoosePlayerRole','ChoosePlayerRole',2},{'Img_Tanchudi','ChoosePlayerRole/bg/Img_Tanchudi',2},{'Img_Tanchuxian','ChoosePlayerRole/bg/Img_Tanchuxian',2},{'Img_Touxiangdi','ChoosePlayerRole/bg/Img_Touxiangdi',2},{'Img_Xian1','ChoosePlayerRole/bg/Img_Xian1',2},{'Img_Xian2','ChoosePlayerRole/bg/Img_Xian2',2},{'Btn_ChooseRoleBack','ChoosePlayerRole/Btn_ChooseRoleBack',2},{'qiehuandi(you)','ChoosePlayerRole/GearSortPanel/qiehuandi(you)',2},{'GearSortToggleGroup','ChoosePlayerRole/GearSortPanel/GearSortToggleGroup',2},{'PlayerSortToggle','ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',2},{'SwitchPanel','ChoosePlayerRole/SwitchPanel',2},{'Img_di','ChoosePlayerRole/SwitchPanel/Img_di',2},{'Jingong','ChoosePlayerRole/SwitchPanel/Jingong',2},{'Icon','ChoosePlayerRole/SwitchPanel/Jingong/Icon',2},{'Fangshou','ChoosePlayerRole/SwitchPanel/Fangshou',2},{'Icon01','ChoosePlayerRole/SwitchPanel/Fangshou/Icon',2},{'ArmorSelect','ChoosePlayerRole/SwitchPanel/ArmorSelect',2},{'RoleContent','ChoosePlayerRole/PlayerRoleScroll/RoleContent',2},{'Btn_Core1','ChoosePlayerRole/Btn_Core1',2},{'Btn_Cutpage','ChoosePlayerRole/Btn_Core1/Btn_Cutpage',2},{'Btn_UnCore1','ChoosePlayerRole/Btn_UnCore1',2},{'Btn_Cutpage(Selected)','ChoosePlayerRole/Btn_UnCore1/Btn_Cutpage(Selected)',2},{'Btn_Core2','ChoosePlayerRole/Btn_Core2',2},{'Btn_Cutpage01','ChoosePlayerRole/Btn_Core2/Btn_Cutpage',2},{'Btn_UnCore2','ChoosePlayerRole/Btn_UnCore2',2},{'Btn_Cutpage(Selected)01','ChoosePlayerRole/Btn_UnCore2/Btn_Cutpage(Selected)',2},{'Img_Xian201','RoleChangePanel/Img_Xian2',2},{'Img_Xian101','RoleChangePanel/Img_Xian1',2},{'RoleInfoBgPanel','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel',2},{'RoleInfoIconPanel','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel',2},{'TX_BGImage_1','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_1',2},{'TX_BGImage_2','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_2',2},{'TX_BGImage_3','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_BGImage_3',2},{'Background','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Background',2},{'Fill','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Fill Area/Fill',2},{'Image','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image',2},{'Image(1)','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider/Image (1)',2},{'TX_Image_1','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_1',2},{'HpIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_1/HpIcon',2},{'TX_Image_2','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_2',2},{'AtkIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_2/AtkIcon',2},{'TX_Image_3','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_3',2},{'DefIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_3/DefIcon',2},{'TX_Image_4','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_4',2},{'BaojiIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_4/BaojiIcon',2},{'TX_Image_5','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_5',2},{'MingjieIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_5/MingjieIcon',2},{'TX_Image_6','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_6',2},{'BaoshangIcon','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/TX_Image_6/BaoshangIcon',2},{'Img_Biaotixian1','RoleChangePanel/Text_SkillTitle/Img_Biaotixian1',2},{'CoreSkill','RoleChangePanel/CoreSkill',2},{'Img_Jinengdi','RoleChangePanel/CoreSkill/Img_Jinengdi',2},{'Img_JT(xiao)','RoleChangePanel/CoreSkill/Img_JT(xiao)',2},{'Iconbg','RoleChangePanel/CoreSkill/Iconbg',2},{'SkillIcon','RoleChangePanel/CoreSkill/SkillIcon',2},{'CurEmptyCore','RoleChangePanel/CurEmptyCore',2},{'CurCore','RoleChangePanel/CurCore',2},{'RankKuangImg','RoleChangePanel/CurCore/RankKuangImg',2},{'GearImage','RoleChangePanel/CurCore/RankKuangImg/GearImage',2},{'landi3','RoleChangePanel/CurCore/RankKuangImg/GearImage/landi3',2},{'GearIcon','RoleChangePanel/CurCore/RankKuangImg/GearImage/GearIcon',2},{'RankPlusPanel','RoleChangePanel/CurCore/RankKuangImg/GearImage/RankPlusPanel',2},{'RankPlusIconImg','RoleChangePanel/CurCore/RankKuangImg/GearImage/RankPlusPanel/RankPlusIconImg',2},{'Stardi','RoleChangePanel/CurCore/RankKuangImg/GearImage/Stardi',2},{'StarRoot','RoleChangePanel/CurCore/RankKuangImg/GearImage/StarRoot',2},{'GearStarPrefab','RoleChangePanel/CurCore/RankKuangImg/GearImage/StarRoot/GearStarPrefab',2},{'HighLight','RoleChangePanel/CurCore/RankKuangImg/GearImage/StarRoot/GearStarPrefab/HighLight',2},{'QiconBg','RoleChangePanel/CurCore/RankKuangImg/GearImage/QiconBg',2},{'Qicon','RoleChangePanel/CurCore/RankKuangImg/GearImage/QiconBg/Qicon',2},{'QiconFrame','RoleChangePanel/CurCore/RankKuangImg/GearImage/QiconBg/Qicon/QiconFrame',2},{'TargetCore','RoleChangePanel/TargetCore',2},{'RankKuangImg01','RoleChangePanel/TargetCore/RankKuangImg',2},{'GearImage01','RoleChangePanel/TargetCore/RankKuangImg/GearImage',2},{'landi301','RoleChangePanel/TargetCore/RankKuangImg/GearImage/landi3',2},{'GearIcon01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/GearIcon',2},{'RankPlusPanel01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/RankPlusPanel',2},{'RankPlusIconImg01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/RankPlusPanel/RankPlusIconImg',2},{'Stardi01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/Stardi',2},{'StarRoot01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/StarRoot',2},{'GearStarPrefab01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/StarRoot/GearStarPrefab',2},{'HighLight01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/StarRoot/GearStarPrefab/HighLight',2},{'QiconBg01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/QiconBg',2},{'Qicon01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/QiconBg/Qicon',2},{'QiconFrame01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/QiconBg/Qicon/QiconFrame',2},{'Img_Arrow','RoleChangePanel/Img_Arrow',2},{'Btu_Wear','RoleChangePanel/Btu_Wear',2},{'Img_Zhuangbeidi','RoleChangePanel/Btu_Wear/Img_Zhuangbeidi',2},{'Btu_UnWear','RoleChangePanel/Btu_UnWear',2},{'Img_Zhuangbeidi01','RoleChangePanel/Btu_UnWear/Img_Zhuangbeidi',2},
        -- Slider 列表
        {'ZhiYuanSlider','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanSlider',5},
        -- UITemplate 列表
        {'PlayerSortToggle01','ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',10},{'RoleCoreItem','ChoosePlayerRole/PlayerRoleScroll/RoleCoreItem',10},
        -- Toggle 列表
        {'PlayerSortToggle02','ChoosePlayerRole/GearSortPanel/GearSortToggleGroup/PlayerSortToggle',13},
        -- RawImage 列表
        {'PlayerRoleScroll','ChoosePlayerRole/PlayerRoleScroll',15},
        -- LoopScrollRect 列表
        {'PlayerRoleScroll01','ChoosePlayerRole/PlayerRoleScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Jingong','ChoosePlayerRole/SwitchPanel/Jingong/Text_Jingong',20},{'Text_Fangshou','ChoosePlayerRole/SwitchPanel/Fangshou/Text_Fangshou',20},{'Text_title','ChoosePlayerRole/Btn_Core1/Text_title',20},{'Text_title01','ChoosePlayerRole/Btn_UnCore1/Text_title',20},{'Text_title02','ChoosePlayerRole/Btn_Core2/Text_title',20},{'Text_title03','ChoosePlayerRole/Btn_UnCore2/Text_title',20},{'HpNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HpNameTxt',20},{'AtkNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt',20},{'AtkInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/AtkNameTxt/AtkInfoTxt',20},{'ZhiYuanNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt',20},{'ZhiYuanInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/ZhiYuanNameTxt/ZhiYuanInfoTxt',20},{'DefNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefNameTxt',20},{'BaojiNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiNameTxt',20},{'BaoShangNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoShangNameTxt',20},{'MinjieNameTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieNameTxt',20},{'HPInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/HPInfoTxt',20},{'DefInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/DefInfoTxt',20},{'BaojiInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaojiInfoTxt',20},{'BaoshangInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/BaoshangInfoTxt',20},{'MinjieInfoTxt','RoleChangePanel/RoleInfoPanel/RoleInfoBgPanel/RoleInfoIconPanel/MinjieInfoTxt',20},{'Text_SkillTitle','RoleChangePanel/Text_SkillTitle',20},{'TargetSkillText','RoleChangePanel/CoreSkill/TargetSkillText',20},{'CurSkillText','RoleChangePanel/CoreSkill/CurSkillText',20},{'RankText','RoleChangePanel/CurCore/RankKuangImg/GearImage/landi3/RankText',20},{'NameText','RoleChangePanel/CurCore/RankKuangImg/GearImage/NameText',20},{'RankText01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/landi3/RankText',20},{'NameText01','RoleChangePanel/TargetCore/RankKuangImg/GearImage/NameText',20},{'Text_WearTitle','RoleChangePanel/Btu_Wear/Text_WearTitle',20},{'Text_UnWearTitle','RoleChangePanel/Btu_UnWear/Text_UnWearTitle',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.change = false
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.Btn_Core1().gameObject:SetActive(false)
    self.Btn_UnCore1().gameObject:SetActive(true)
    self.Btn_Core2().gameObject:SetActive(true)
    self.Btn_UnCore2().gameObject:SetActive(false)
    ---已拥有角色
    self.HasHeroCacheData = HeroControl.GetHaveHero()
    ---当前选择角色
    self.CurHero = self.HasHeroCacheData[1]
    self.CurHero.RoleCoreSelect = true
    ---当前选择槽位
    self.Index = 1
    ---注册滑块监听
    self:RegisterScroll()
    ---初始化选择角色
    self:InitChooseRole()

    self.CurRoleCore = nil

    self.CurStarList = {}
    for i = 1, 6 do
        self.CurStarList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.StarRoot().gameObject.transform,false).transform
    end
    self.TargetStarList = {}
    for i = 1, 6 do
        self.TargetStarList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.StarRoot01().gameObject.transform,false).transform
    end
    ---装备攻、防类型 0攻 1防
    self.armorType = 0
    ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)

    ---返回
    UIEvent.LuaClick(self.Btn_ChooseRoleBack().gameObject,Handle(self,function ()
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
        self.parent:UpdataGearInfo(self.parent.CurOperationCore)
    end))
    ---核心1
    UIEvent.LuaClick(self.Btn_Core1().gameObject,Handle(self,function ()
        self.Index = 1
        self:SwitchCoreIndex(1)
    end))
    ---核心2
    UIEvent.LuaClick(self.Btn_Core2().gameObject,Handle(self,function ()
        self.Index = 2
        self:SwitchCoreIndex(2)
    end))
    ---进攻核心组
    UIEvent.LuaClick(self.Jingong().gameObject,Handle(self, function()
        self.armorType = 0
        self.Index = 1
        self:SwitchCoreIndex(1)
        
        self.ArmorSelect().transform.localPosition = self.Jingong().transform.localPosition
    end))
    ---防守核心组
    UIEvent.LuaClick(self.Fangshou().gameObject,Handle(self, function()
        self.armorType = 1
        self.Index = 1
        self:SwitchCoreIndex(1)

        self.ArmorSelect().transform.localPosition = self.Fangshou().transform.localPosition
    end))
    ---装备
    UIEvent.LuaClick(self.Btu_Wear().gameObject,Handle(self,function ()
        if self.CurRoleCore then
            if self.CurRoleCore.id == self.targetCore.id then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips1"),1},true)
                return
            end
            self:OnClickChange()
        else
            self:OnClickWear()
        end
    end))
    UIEvent.LuaClick(self.Btu_UnWear().gameObject,Handle(self,function()
        self:OnClickTakeOff()
    end))

    Event.Clear("NoviceRoleWear")
    Event.Add("NoviceRoleWear",function ()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            self:OnClickWear()
        end)
        MessageEvent.Go(EID.NoviceCheck)
    end)
    Event.Clear("NovicePanelBack")
    Event.Add("NovicePanelBack",function ()
        MgrUI.ClosePop(self.Uid)
        self.parent:UpdataGearInfo(self.parent.CurOperationCore)
        NoviceViewModel.DoNext()
    end)
    Event.Clear("RoleCoreCloseScroll")
    Event.Add("RoleCoreCloseScroll",function ()
        self.PlayerRoleScroll01().gameObject.transform:GetComponent("LoopVerticalScrollRect").vertical = false
    end)
    Event.Clear("RoleCoreOpenScroll")
    Event.Add("RoleCoreOpenScroll",function ()
        self.PlayerRoleScroll01().gameObject.transform:GetComponent("LoopVerticalScrollRect").vertical = true
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
        self.parent:UpdataGearInfo(self.parent.CurOperationCore)
    end
end

function M:SwitchCoreIndex(type)
    if type == 1 then
        self.Btn_Core1().gameObject:SetActive(false)
        self.Btn_UnCore1().gameObject:SetActive(true)
        self.Btn_Core2().gameObject:SetActive(true)
        self.Btn_UnCore2().gameObject:SetActive(false)
    elseif type == 2 then
        self.Btn_Core1().gameObject:SetActive(true)
        self.Btn_UnCore1().gameObject:SetActive(false)
        self.Btn_Core2().gameObject:SetActive(false)
        self.Btn_UnCore2().gameObject:SetActive(true)
    end
    ---增加共鸣基础属性
    self:InitVoidAttr()
    ---更新核心
    self:UpdateCore()
end

function M:OnShow(pData)
    ---@type CoreData
    self.targetCore = pData[1]
    self.parent = pData[2]
    ---增加共鸣基础属性
    self:InitVoidAttr()
    ---更新核心
    self:UpdateCore()
end

function M:OnShowFinish()

end
---增加共鸣基础属性
function M:InitVoidAttr()
    self.CurHeroAttr = self.CurHero:GetHeroAttr()
    --local arr = self.CurHero:GetVoidEquip()
    local arr = self.CurHero:GetHeroVoidEquip()
    for i, v in pairs(arr) do
        if v.lockState then
            for m, n in pairs(v.attrs) do
                ReadData.SetAdd_Abt(self.CurHeroAttr ,n.attrID,n.attribute)
            end
        end
    end
end
---初始化选择角色
function M:InitChooseRole()
    self.CurRoleSort = 1        ---当前排序类型(1稀有度,2取得)
    self.RoleIsRise = false
    ---排序器
    local sorts = {
        [1] = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_quality"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_get")
    }
    self.t_sort = self:CreateFilterToggle(sorts,self.PlayerSortToggle().gameObject,self.GearSortToggleGroup().gameObject.transform,Handle(self,function(self,sort,isRise,offset)
        if self.CurRoleSort == sort and self.RoleIsRise == isRise then
            print("重复待处理2")
        end

        if self.CurRoleSort ~= sort then
        --上次点击
            local normal_l = CJNUIMgr.GetSunUseName(self.t_sort[self.CurRoleSort].gameObject, "Normal")
            local HighLight_l = CJNUIMgr.GetSunUseName(self.t_sort[self.CurRoleSort].gameObject, "HighLight")
            normal_l.gameObject:SetActive(true)
            HighLight_l.gameObject:SetActive(false)

            local normal_2 = CJNUIMgr.GetSunUseName(self.t_sort[sort].gameObject, "Normal")
            local HighLight_2 = CJNUIMgr.GetSunUseName(self.t_sort[sort].gameObject, "HighLight")
            normal_2.gameObject:SetActive(false)
            HighLight_2.gameObject:SetActive(true)
            self.RoleIsRise = true
        else 
            self.RoleIsRise = not self.RoleIsRise
        end

        self.CurRoleSort = sort
        
        self:ResetRoleItem(offset)
    end))
    self.PlayerSortToggle().gameObject:SetActive(false)
    ---默认排序
    self.t_sort[1].isOn = false
    self.t_sort[1].isOn = true
end
---注册滑块监听
function M:RegisterScroll()
    self.PlayerRoleScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
---面板娘滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self})
end
---设置面板娘滑动数据
function M:ResetRoleItem(offset)
    ---设置当前Loop数据
    self.CurLoopList =  self:GetRoleData(self.CurRoleSort,self.RoleIsRise)
    ---设置Loop数量
    self.PlayerRoleScroll01().totalCount = #self.CurLoopList
    if offset then
        self.PlayerRoleScroll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
    end
end
---获取角色数据缓存
function M:GetRoleData(sort,rise)
    local array = self.HasHeroCacheData
    ---排序(1稀有度,2取得时间)
    local sortGroupArr = {
        [1] = {"rank","cTime"},
        [2] = {"cTime","rank"}
    }
    Global.Sort(array,sortGroupArr[sort],rise)
    if NoviceViewModel.CurTaskId == 20713 then
        local t = {
            [1] = HeroControl.GetRoleDataByID(tonumber(SteamLocalData.tab[120003][2]))
        }
        for i, v in pairs(array) do
            if v.id ~= tonumber(SteamLocalData.tab[120003][2]) then
                table.insert(t,v)
            end
        end
        array = t
    end
    return array
end
---创建标签
function M:CreateFilterToggle(filters,prefab,parentTrans,callback)
    local toggles = {}
    for idx, name in ipairs(filters) do
        local togTrans = GameObject.Instantiate(prefab,parentTrans,false).transform
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(idx,...)
        end})
        toggles[idx] = togTrans:GetComponent("Toggle")
    end
    return toggles
end
---更新核心
function M:UpdateCore()
    self.GearData1 = nil
    self.GearData2 = nil
    self.CurRoleCore = nil
    if self.armorType == 0 then
        if self.CurHero.armor1~=0 and self.CurHero.armor1~=nil then
            self.GearData1 = CoreControl.GetSingleCoreData(self.CurHero.armor1)
        end
        if self.CurHero.armor2~=0 and self.CurHero.armor2~=nil then
            self.GearData2 = CoreControl.GetSingleCoreData(self.CurHero.armor2)
        end
    else
        if self.CurHero.heroDefArmor1~=0 and self.CurHero.heroDefArmor1~=nil then
            self.GearData1 = CoreControl.GetSingleCoreData(self.CurHero.heroDefArmor1)
        end
        if self.CurHero.heroDefArmor2~=0 and self.CurHero.heroDefArmor2~=nil then
            self.GearData2 = CoreControl.GetSingleCoreData(self.CurHero.heroDefArmor2)
        end
    end
    
    if self.Index == 1 then
        if self.GearData1 ~= nil and self.GearData1.uid == self.targetCore.uid then
            self.Btu_Wear().gameObject:SetActive(false)
            self.Btu_UnWear().gameObject:SetActive(true)
        else
            self.Btu_Wear().gameObject:SetActive(true)
            self.Btu_UnWear().gameObject:SetActive(false)
        end
        if self.GearData1 then
            self.CurEmptyCore().gameObject:SetActive(false)
            self.CurCore().gameObject:SetActive(true)
            self.CurRoleCore = self.GearData1       ---获得装备数据
            self:UpdataGearInfo(self.CurCore().gameObject,self.CurRoleCore,false)
        else
            self.CurSkillText().text = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")
            self.CurCore().gameObject:SetActive(false)
            self.CurEmptyCore().gameObject:SetActive(true)
        end
    elseif self.Index == 2 then
        if self.GearData2 ~= nil and self.GearData2.uid == self.targetCore.uid then
            self.Btu_Wear().gameObject:SetActive(false)
            self.Btu_UnWear().gameObject:SetActive(true)
        else
            self.Btu_Wear().gameObject:SetActive(true)
            self.Btu_UnWear().gameObject:SetActive(false)
        end
        if self.GearData2 then
            self.CurEmptyCore().gameObject:SetActive(false)
            self.CurCore().gameObject:SetActive(true)
            self.CurRoleCore = self.GearData2       ---获得装备数据
            self:UpdataGearInfo(self.CurCore().gameObject,self.CurRoleCore,false)
        else
            self.CurSkillText().text = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")
            self.CurCore().gameObject:SetActive(false)
            self.CurEmptyCore().gameObject:SetActive(true)
        end
    end
    self:UpdataGearInfo(self.TargetCore().gameObject,self.targetCore,true)
    ---比较属性
    self:CompareCoreAttr()
    ---隐藏UI
    self.CurCore().gameObject:SetActive(false)
    self.TargetCore().gameObject:SetActive(false)
    self.CurEmptyCore().gameObject:SetActive(false)
    self.Img_Arrow().gameObject:SetActive(false)
    self.CoreSkill().gameObject:SetActive(false)
end
---更新核心详情
---@param data CoreData
function M:UpdataGearInfo(obj,data,isTarget)
    local NameText = obj.transform:Find("RankKuangImg/GearImage/NameText"):GetComponent("TextMeshProUGUI")
    local RankText = obj.transform:Find("RankKuangImg/GearImage/landi3/RankText"):GetComponent("TextMeshProUGUI")
    local RankKuangImg = obj.transform:Find("RankKuangImg"):GetComponent("Image")
    local RankPlusIconImg = obj.transform:Find("RankKuangImg/GearImage/RankPlusPanel/RankPlusIconImg"):GetComponent("Image")
    local GearIcon = obj.transform:Find("RankKuangImg/GearImage/GearIcon"):GetComponent("Image")
    local RankPlusPanel = obj.transform:Find("RankKuangImg/GearImage/RankPlusPanel").gameObject
    local QiconBg = obj.transform:Find("RankKuangImg/GearImage/QiconBg").gameObject
    local Qicon = obj.transform:Find("RankKuangImg/GearImage/QiconBg/Qicon"):GetComponent("Image")

    NameText.text = data.name
    RankText.text ="+"..data.level
    --MgrRes.LoadSprite(RankKuangImg,"Quality/RankKuang_"..data.quality)
    MgrRes.LoadSprite(RankKuangImg,self:GetQualityName(data.quality))

    if data.quality == 4 or data.quality == 6 then
        RankPlusPanel:SetActive(true)
        MgrRes.LoadSprite(RankPlusIconImg,"Quality/RankKuangPlus_"..data.quality)
    else
        RankPlusPanel:SetActive(false)
    end
    MgrRes.LoadSprite(GearIcon,data.icon)
    ---设置核心图标
    if data.RoleId ~= 0 then
        QiconBg:SetActive(true)
        MgrRes.LoadCircleIcon(Qicon,data.RoleId)
    else
        QiconBg:SetActive(false)
    end
    ---星星
    if data.star > 0 then
        local tab = {}
        if isTarget then
            tab = self.TargetStarList
        else
            tab = self.CurStarList
        end
        for i, Obj in ipairs(tab) do
            local starActive = i <= data.star and true or false
            Obj:Find("HighLight").gameObject:SetActive(starActive)
        end
    end

    if data.skill == 0 then
        if isTarget then
            self.TargetSkillText().text = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")
        else
            self.CurSkillText().text = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_none")
        end
    else
        local skill = SkillLocalData.tab[data.skill]
        if isTarget then
            self.TargetSkillText().text = skill[12]
        else
            self.CurSkillText().text =  skill[12]
        end
    end
end

--根据品质获品质对应图片名称(新加了带jia的品质，不确定原来的图片是否被其他地方使用，所以不能改名)
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

---比较属性
function M:CompareCoreAttr()
    local curAttr = table.DeepCopy(self.CurHeroAttr)
    local tarAttr = table.DeepCopy(self.CurHeroAttr)

    if self.GearData1 == nil and self.GearData2 == nil then
        ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
        self:UpdateCompareAttr(curAttr,tarAttr)
    elseif self.Index == 1 then
        if self.GearData1 then
            if self.targetCore.uid == self.GearData1.uid then  --卸下当前核心
                if self.GearData2 then
                    ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                    ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.GearData2.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                else
                    ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                end
            else
                --装备新核心
                if self.GearData2 then --是否存在二槽核心
                    if self.targetCore.uid == self.GearData2.uid then --如果把二槽核心装到一槽
                        ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                        ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                        self:UpdateCompareAttr(curAttr,tarAttr)
                    else
                        ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                        ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.GearData2.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                        self:UpdateCompareAttr(curAttr,tarAttr)
                    end
                else
                    ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                end
            end
        else
            --判断是否存在二槽数据
            if self.GearData2 then
                if self.GearData2.uid ~= self.targetCore.uid then
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.GearData2.attrs,true)
                    ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                else
                    ReadData.InitRoleGear(curAttr,self.targetCore.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                end
                self:UpdateCompareAttr(curAttr,tarAttr)
            else
                ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                self:UpdateCompareAttr(curAttr,tarAttr)
            end
        end
    elseif self.Index == 2 then
        if self.GearData2 then
            if self.targetCore.uid == self.GearData2.uid then  --卸下当前槽核心
                if self.GearData1 then --如果存在槽一数据
                    ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                    ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.GearData1.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                else
                    --只计算槽二数据
                    ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                end
            else
                --装备新核心
                if self.GearData1 then
                    if self.targetCore.uid == self.GearData1.uid then --如果把一槽核心装到二槽
                        ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                        ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    else
                        ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                        ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.GearData1.attrs,true)
                        ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    end
                    self:UpdateCompareAttr(curAttr,tarAttr)
                else
                    ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    self:UpdateCompareAttr(curAttr,tarAttr)
                end
            end
        else
            --判断是否存在二槽数据
            if self.GearData1 then
                if self.GearData1.uid ~= self.targetCore.uid then
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.GearData1.attrs,true)
                    ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
                else
                    ReadData.InitRoleGear(curAttr,self.targetCore.attrs,true)
                    ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                end
                self:UpdateCompareAttr(curAttr,tarAttr)
            else
                ReadData.InitRoleGear(tarAttr,self.targetCore.attrs,true)
                self:UpdateCompareAttr(curAttr,tarAttr)
            end
        end
    else
        ReadData.InitRoleGear(curAttr,self.GearData1.attrs,true)
        ReadData.InitRoleGear(curAttr,self.GearData2.attrs,true)
        if self.Index == 1 then
            ReadData.InitRoleGear(tarAttr,self.GearData2.attrs,true)
        else
            ReadData.InitRoleGear(tarAttr,self.GearData1.attrs,true)
        end
        self:UpdateCompareAttr(curAttr,tarAttr)
    end
end
---更新角色属性
function M:UpdateCompareAttr(targetAttr,attr)
    if attr.Occupation == 4 then
        self.ZhiYuanNameTxt().gameObject:SetActive(true)
        self.AtkNameTxt().gameObject:SetActive(false)
    else
        self.ZhiYuanNameTxt().gameObject:SetActive(false)
        self.AtkNameTxt().gameObject:SetActive(true)
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
    --设置核心类型(0进攻 1防守)
    ReadData.SetCoreType(self.armorType)
    local tRole = ReadData.CreatRole(self.CurHeroAttr.ID, self.CurHeroAttr.SkinID, self.CurHeroAttr.LV, self.CurHeroAttr.StartLV, 0, self.CurHeroAttr.IsAwaken, self.CurHero.favor)
    local addAtk = attr.RealAtk - targetAttr.RealAtk
    if self.GetRoleInfoUITxt(targetAttr.RealAtk,attr.RealAtk,false) == 0 then
        self.AtkInfoTxt().text= math.floor(addAtk + tRole.RealAtk)
    elseif self.GetRoleInfoUITxt(targetAttr.RealAtk,attr.RealAtk,false) == 1 then
        self.AtkInfoTxt().text= "<color=#3affe1>"..math.floor(addAtk + tRole.RealAtk).."</color>"
    else
        self.AtkInfoTxt().text= "<color=#ff2d4f>"..math.floor(addAtk + tRole.RealAtk).."</color>"
    end

    local addSuppart = attr.RealSuppart - targetAttr.RealSuppart
    if self.GetRoleInfoUITxt(targetAttr.RealSuppart,attr.RealSuppart,true) == 0 then
        self.ZhiYuanInfoTxt().text="".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealSuppart,attr.RealSuppart,true) == 1 then
        self.ZhiYuanInfoTxt().text="<color=#3affe1>".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%</color>"
    else
        self.ZhiYuanInfoTxt().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addSuppart + tRole.RealSuppart)).."%</color>"
    end

    local addDef = attr.RealSuppart - targetAttr.RealSuppart
    if self.GetRoleInfoUITxt(targetAttr.RealDef,attr.RealDef,true) == 0 then
        self.DefInfoTxt().text="".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealDef,attr.RealDef,true) == 1 then
        self.DefInfoTxt().text="<color=#3affe1>".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%</color>"
    else
        self.DefInfoTxt().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addDef + tRole.RealDef)).."%</color>"
    end

    local addHP = attr.HP - targetAttr.HP
    if self.GetRoleInfoUITxt(targetAttr.HP,attr.HP,false) == 0 then
        self.HPInfoTxt().text ="".. math.floor(addHP + tRole.HP)
    elseif self.GetRoleInfoUITxt(targetAttr.HP,attr.HP,false) == 1 then
        self.HPInfoTxt().text= "<color=#3affe1>"..math.floor(addHP + tRole.HP).."</color>"
    else
        self.HPInfoTxt().text= "<color=#ff2d4f>"..math.floor(addHP + tRole.HP).."</color>"
    end

    local addAgile = attr.RealAgile - targetAttr.RealAgile
    if self.GetRoleInfoUITxt(targetAttr.RealAgile,attr.RealAgile,true) == 0 then
        self.MinjieInfoTxt().text="".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealAgile,attr.RealAgile,true) == 1 then
        self.MinjieInfoTxt().text="<color=#3affe1>".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%</color>"
    else
        self.MinjieInfoTxt().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addAgile + tRole.RealAgile)).."%</color>"
    end

    local addCrit = attr.RealCrit - targetAttr.RealCrit
    if self.GetRoleInfoUITxt(targetAttr.RealCrit,attr.RealCrit,true) == 0 then
        self.BaojiInfoTxt().text="".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealCrit,attr.RealCrit,true) == 1 then
        self.BaojiInfoTxt().text="<color=#3affe1>".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%</color>"
    else
        self.BaojiInfoTxt().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addCrit + tRole.RealCrit)).."%</color>"
    end

    local addCritDmg = attr.RealCritDmg - targetAttr.RealCritDmg
    if self.GetRoleInfoUITxt(targetAttr.RealCritDmg,attr.RealCritDmg,true) == 0 then
        self.BaoshangInfoTxt().text="".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%"
    elseif self.GetRoleInfoUITxt(targetAttr.RealCritDmg,attr.RealCritDmg,true) == 1 then
        self.BaoshangInfoTxt().text="<color=#3affe1>".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%</color>"
    else
        self.BaoshangInfoTxt().text="<color=#ff2d4f>".. (self.GetInfoCorrect(addCritDmg + tRole.RealCritDmg)).."%</color>"
    end
    --[[Tools.SetSliderValue(self.DefenceSlider().gameObject,attr.RealDef)
    Tools.SetSliderValue(self.BaojiSlider().gameObject,attr.RealCrit)
    Tools.SetSliderValue(self.BaoshangSlider().gameObject,attr.RealCritDmg)
    Tools.SetSliderValue(self.MinjieSlider().gameObject,attr.RealAgile)]]
end
--根据传入的两个数值比较输出UI显示Text字符串
function M.GetRoleInfoUITxt(_Abt1,_Abt2,_IsPercent)
    -- statements
    local isAdd = 1   ---0为不变，1为增加，2为减少
    if _Abt1 < _Abt2 then
        -- 增加情况
        isAdd = 1
    elseif _Abt1 == _Abt2 then
        isAdd = 0
    else
        --减少情况
        isAdd = 2
    end
    return isAdd
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

---选择点击事件
---@param hero RoleData
function M:RoleItemOnClick(hero)
    if self.CurHero then
        self.CurHero.RoleCoreSelect = false
        self.CurHero.RoleCoreSelect = nil
    end
    hero.RoleCoreSelect = true
    self.CurHero = hero
    self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
    ---增加共鸣基础属性
    self:InitVoidAttr()
    ---更新核心
    self:UpdateCore()
end

function M:ReceiveChipSynthesisACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorACK',buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips2")..tab.errNo,1},true)
    end
    if tag~= 7 then
        return
    end
end

function M:ClientHeroChangeArmorNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroChangeArmorNTF',buffer))
    if tag == 7 then
        ---原来带这件装备的人先解除
        local PreviousRoleData = HeroControl.GetRoleDataByID(tab.data[1].oldHeroID)
        if PreviousRoleData then
            PreviousRoleData:ReLoadHeroCore(tab.data[1].oldSlot,0,tab.data[1].armorGroup)
        end
        ---写入新数据
        local roleData = nil
        local coreData = nil
        if tab.data[1].armorID == 0 then
            roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
            if tab.data[1].armorGroup == 0 then
                if tab.data[1].armorSolt == 1 then
                    roleData.armor1 = 0
                elseif tab.data[1].armorSolt == 2 then
                    roleData.armor2 = 0
                end
            else
                if tab.data[1].armorSolt == 1 then
                    roleData.heroDefArmor1 = 0
                elseif tab.data[1].armorSolt == 2 then
                    roleData.heroDefArmor2 = 0
                end
            end
            coreData = self.targetCore
            
            coreData:ReLoadCore(0,0,tab.data[1].armorGroup)
        else
            local tArmorGroup = {}
            if self.Index == 1 then
                if self.GearData1 ~=nil then
                    self.GearData1.RoleId = 0
                    self.GearData1.slot = 0
                    tArmorGroup = self.GearData1.armorGroup
                end
            else
                if self.GearData2~=nil then
                    self.GearData2.RoleId = 0
                    self.GearData2.slot = 0
                    tArmorGroup = self.GearData2.armorGroup
                end
            end
            for i = 1, #tArmorGroup do
                if tArmorGroup[i].group == tab.data[1].armorGroup then
                    table.remove(tArmorGroup,i)
                    break
                end
            end
            roleData = HeroControl.GetRoleDataByID(tab.data[1].heroID)
            roleData:ReLoadHeroCore(tab.data[1].armorSolt,tab.data[1].armorID,tab.data[1].armorGroup)
            coreData = CoreControl.GetSingleCoreData(tab.data[1].armorID)
            --先卸掉老数据
            local oldRole = HeroControl.GetRoleDataByID(coreData.RoleId)
            if oldRole and tab.data[1].oldSlot then
                if tab.data[1].armorGroup == 0 then
                    if tab.data[1].oldSlot == 1 then
                        oldRole.armor1 = 0
                        oldRole.armor1Pro = 0
                        oldRole.armor1Skill = 0
                    elseif tab.data[1].oldSlot == 2 then
                        oldRole.armor2 = 0
                        oldRole.armor2Pro = 0
                        oldRole.armor2Skill = 0
                    end
                else
                    if tab.data[1].oldSlot == 1 then
                        oldRole.heroDefArmor1 = 0
                    elseif tab.data[1].oldSlot == 2 then
                        oldRole.heroDefArmor2 = 0
                    end
                end
            end
            coreData:ReLoadCore(tab.data[1].armorSolt,tab.data[1].heroID,tab.data[1].armorGroup)
        end
        CoreControl.GetCores()
        RoleCardViewModel.ReloadCacheRoleData()
        ---增加共鸣基础属性
        self:InitVoidAttr()
        ---更新核心
        self:UpdateCore()
        --if self.IsOther then
        --    self:OnClickWear()
        --    self.IsOther = false
        --end
    end
end

function M:OnClickWear()
    local isChange = false
    for i = 1, #self.targetCore.armorGroup do
        if self.targetCore.armorGroup[i].group == self.armorType then
            isChange = true
            break
        end
    end
    if isChange and not self.change then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips2"),Handle(self,self.OnClickWear),nil,2})
        self.change = true
        return
    end
    self.change = false
    print("穿上")
    local ArmorREQ =
    {
        data =  {
            [1] = {heroID = self.CurHero.id,
                   armorID = self.targetCore.uid,
                   armorSolt = self.Index,
                   armorGroup = self.armorType
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,7,nil,Handle(self,self.ReceiveChipSynthesisACK),Handle(self,self.ClientHeroChangeArmorNTF))
end

function M:OnClickChange()
    print("交换")
    local isChange = false
    for i = 1, #self.targetCore.armorGroup do
        if self.targetCore.armorGroup[i].group == self.armorType then
            isChange = true
            break
        end
    end
    if isChange and not self.change then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_tips2"),Handle(self,self.OnClickChange),nil,2})
        self.change = true
        return
    end
    self.change = false
    local ArmorREQ =
    {
        data =  {
            [1] = {heroID = self.CurHero.id,
                   armorID = self.targetCore.uid,
                   armorSolt = self.Index,
                   armorGroup = self.armorType
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,7,nil,nil,Handle(self,self.ClientHeroChangeArmorNTF))
end
function M:OnClickTakeOff()
    print("脱下")
    local tCore = nil
    for i = 1, #self.targetCore.armorGroup do
        if self.targetCore.armorGroup[i].group == self.armorType then
            tCore = self.targetCore.armorGroup[i]
            break
        end
    end
    local ArmorREQ = {}
    ArmorREQ =
    {
        data =  {
                [1] = {
                    heroID = tCore.roleID,
                    armorID = 0,
                    armorSolt = tCore.slotID,
                    armorGroup = tCore.group
            }
        }
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroChangeArmorREQ',ArmorREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_CHANGE_ARMOR_REQ,bytes,7,nil,Handle(self,self.ReceiveChipSynthesisACK),Handle(self,self.ClientHeroChangeArmorNTF))
end

function M:OnClose()
    ReadData.SetCoreType(0)
    if self.CurHero then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self.CurHero.RoleCoreSelect = false
        self.CurHero.RoleCoreSelect = nil
    end
end

return M