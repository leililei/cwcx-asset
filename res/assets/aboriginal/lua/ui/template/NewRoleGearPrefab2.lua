-- Code Auto Create Begin
local M = Class('NewRoleGearPrefab2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/NewRoleGearPrefab2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NewRoleGearPrefab2','/',2},{'GearWornPrefab','GearWornPrefab',2},{'Gear_Img_Suo_hui','GearWornPrefab/Gear_Img_Suo_hui',2},{'Gear_Img_Suo','GearWornPrefab/Gear_Img_Suo',2},{'CoreLockPressArea','GearWornPrefab/CoreLockPressArea',2},{'GearRankKuangImg','GearWornPrefab/GearIconPanel/GearRankKuangImg',2},{'Jiaobiao','GearWornPrefab/GearIconPanel/Jiaobiao',2},{'Pinzhi','GearWornPrefab/GearIconPanel/Jiaobiao/Pinzhi',2},{'GearIconImg','GearWornPrefab/GearIconPanel/GearIconImg',2},{'Xingdi','GearWornPrefab/GearIconPanel/Xingdi',2},{'EmptyGearStar','GearWornPrefab/GearIconPanel/EmptyGearStar',2},{'GearStarPrefab','GearWornPrefab/GearIconPanel/GearStarPrefab',2},{'GearStarPanel','GearWornPrefab/GearIconPanel/GearStarPanel',2},{'QiconBg_Gong','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong',2},{'Qicon','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon',2},{'QiconFrame','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon/QiconFrame',2},{'QiconBg_Fang','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang',2},{'Qicon01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon',2},{'QiconFrame01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon/QiconFrame',2},{'GearInfoPanel','GearWornPrefab/GearInfoPanel',2},{'GearInfoPrefab1','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1',2},{'Img_Shuxingdi','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/Img_Shuxingdi',2},{'VoidIconBG','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/VoidIconBG',2},{'GearInfoIcon','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoIcon',2},{'GearInfoPrefab2','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2',2},{'Img_Shuxingdi01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/Img_Shuxingdi',2},{'VoidIconBG01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/VoidIconBG',2},{'GearInfoIcon01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoIcon',2},{'GearSkillPrefab','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab',2},{'Img_SkillXian','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Img_SkillXian',2},{'VoidGearIcon','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Btn_Chakan',2},{'SelectIconImg','SelectIconImg',2},{'RedDotIcon','RedDotIcon',2},
        -- UITemplate 列表
        {'NewRoleGearPrefab201','/',10},
        -- TextMeshProUGUI 列表
        {'GearUpgradeText','GearWornPrefab/GearUpgradeText',20},{'GearNameTxt','GearWornPrefab/GearNameTxt',20},{'GearInfoText','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoText',20},{'GearInfoNameTxt','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNameTxt',20},{'GearInfoNull','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNull',20},{'GearInfoText01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoText',20},{'GearInfoNameTxt01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNameTxt',20},{'GearInfoNull01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNull',20},{'GearSkillNameText','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/GearSkillNameText',20},
    }
end
-- Code Auto Create End
require("LocalData/SkillLocalData")
function M:OnInit()
     self.coreData = nil
     ---获取技能节点
     self.skillName = self.GearSkillNameText()

     UIEvent.LuaClick(self.GearSkillPrefab().gameObject,function()
        if self.coreData.level >= 0 and self.coreData.skill ~= nil and self.coreData.skill ~= 0 then
            MgrUI.Pop(UID.CoreSkill_UI,self.coreData.skill,true)
        else
            Log.Error("查看技能错误，核心等级不足或无技能id")
        end
    end)
    ---创建最大星
    local maxStar = BagViewModel.GetCoreStarMax()
    self.starList = {}
    for i = 1, maxStar do
        self.starList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.GearStarPanel().gameObject.transform,false).transform
    end
    -- ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)

    -- ---创建最大基础属性词条
     self.attrList = {}

    self.attrList[1] =self.GearInfoPrefab1().gameObject.transform
    self.attrList[2] = self.GearInfoPrefab2().gameObject.transform

    -- ---隐藏选取框
    self.SelectIconImg().gameObject:SetActive(false)

     UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnCoreChipClick))
end

function M:OnUpdateUI(args)
    ---@type CoreData
    local pData = args[1]
    self.parentSelf = args[2]
    --UnityEngine.Debug.LogError(self.parentSelf.ObjRoot.transform.name)
    self.coreData = pData
    self.GearNameTxt().text = pData.name
    -- ---强化等级
    self.GearUpgradeText().text = "+"..pData.level

    ---设置星级
    local starCount = CoreControl.GetSingleCoreData(self.coreData.uid).star-- self.pData.star
    self.GearStarPanel().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            local specialActive = self.coreData.quality == 5
            Obj.gameObject:SetActive(starActive)
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
    -- ---设置基础属性词条
    for i = 1, #self.attrList do
        --if i <= #self.pData.attrs then
        if self.coreData.attrs[i] then
            ---显示可用词条
            --self.attrList[i].gameObject:SetActive(true) GearInfoNull
            self.attrList[i]:Find("GearInfoNull").gameObject:SetActive(false)
            self.attrList[i]:Find("VoidIconBG").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoIcon").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoText").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoNameTxt").gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"),self.coreData.attrs[i].attrIcon)
            ---属性值
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = self.coreData.attrs[i].type == 1 and string.format("%.2f%s",self.coreData.attrs[i].attribute,"%") or string.format("%.0f",self.coreData.attrs[i].attribute)
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = self.coreData.attrs[i].attrName
        else
            ---隐藏不可用词条
            --self.attrList[i].gameObject:SetActive(false)
            self.attrList[i]:Find("GearInfoNull").gameObject:SetActive(true)
            self.attrList[i]:Find("VoidIconBG").gameObject:SetActive(false)
            self.attrList[i]:Find("GearInfoIcon").gameObject:SetActive(false)
            ---属性值
            self.attrList[i]:Find("GearInfoText").gameObject:SetActive(false)
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt").gameObject:SetActive(false)
        end
    end

    ---设置技能
    if self.coreData.level >= 0 and self.coreData.skill ~= nil and self.coreData.skill ~= 0 then
        self.GearSkillPrefab().gameObject:SetActive(true)
        local sData = SkillLocalData.tab[self.coreData.skill]
        ---更新技能属性
        self.GearSkillNameText().text = sData[12]
    else
        self.GearSkillPrefab().gameObject:SetActive(false)
    end
    ---隐藏技能预制
    self.GearSkillPrefab().gameObject:SetActive(false)
    ---设置核心图标
    MgrRes.LoadSprite(self.GearIconImg(),pData.icon)
    -- ---设置品质图片
    MgrRes.LoadSprite(self.GearRankKuangImg(),self:GetQualityName(pData.iconFrameGear))
    ---设置已装备头像0进攻 1防守
    self.QiconBg_Gong().gameObject:SetActive(false)
    self.QiconBg_Fang().gameObject:SetActive(false)
    for i = 1, #self.coreData.armorGroup do
        local QiconBg = self.QiconBg_Gong().gameObject
        if self.coreData.armorGroup[i].group == 1 then
            QiconBg = self.QiconBg_Fang().gameObject
        end
        QiconBg:SetActive(true)
        local Qicon = CJNUIMgr.GetSunUseName(QiconBg, "Qicon"):GetComponent("Image")
        local skinData = HeroControl.GetSkinDataByRoleID(self.coreData.armorGroup[i].roleID)
        MgrRes.LoadCircleIcon(Qicon, skinData.id)
    end
    ---是否已经上锁
    self.isLocked = CoreControl.GetCoreLock(self.coreData.uid)
    if self.isLocked == 1 then
        self.Gear_Img_Suo().gameObject:SetActive(true)
    else
        self.Gear_Img_Suo().gameObject:SetActive(false)
    end
    -- ---更新选取状态
    self.SelectIconImg().gameObject:SetActive(pData.isSelect)
    -- ---注册上锁按钮事件
    UIEvent.LuaClick(self.CoreLockPressArea().gameObject,Handle(self,self.ClickLockIcon))
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

function M:OnCoreChipClick()
    self.parentSelf:ReloadPuzzleBtn(self.coreData)
end
---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill)
    MgrUI.Pop(UID.RolePreview_UI,{nil,3,_Skill},true)
end

---点击弹出技能详情界面(new)
function M:InitCoreSkillPanel(_skillId)
    MgrUI.Pop(UID.CoreSkill_UI,_skillId,true)
end

---点击锁
function M:ClickLockIcon()
    if self.isLocked == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            CoreControl.SaveCoreLock(self.coreData.uid,0,function ()
                self.isLocked = 0
                self.Gear_Img_Suo().gameObject:SetActive(false)
                self.Gear_Img_Suo_hui().gameObject:SetActive(true)
                self.parentSelf:InitToGearPanel()
            end)
        end,nil,2},true)
    else
        CoreControl.SaveCoreLock(self.coreData.uid,1,function ()
            self.isLocked = 1
            self.Gear_Img_Suo().gameObject:SetActive(true)
            self.Gear_Img_Suo_hui().gameObject:SetActive(false)
            self.parentSelf:InitToGearPanel()
        end)
    end
end
return M