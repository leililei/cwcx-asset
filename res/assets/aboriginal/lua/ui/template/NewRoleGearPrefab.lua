-- Code Auto Create Begin
local M = Class('NewRoleGearPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/NewRoleGearPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NewRoleGearPrefab','/',2},{'GearWornPrefab','GearWornPrefab',2},{'Img_Landi','GearWornPrefab/Img_Landi',2},{'Gear_Img_Suo_hui','GearWornPrefab/Gear_Img_Suo_hui',2},{'Gear_Img_Suo','GearWornPrefab/Gear_Img_Suo',2},{'CoreLockPressArea','GearWornPrefab/CoreLockPressArea',2},{'GearRankKuangImg','GearWornPrefab/GearIconPanel/GearRankKuangImg',2},{'Jiaobiao','GearWornPrefab/GearIconPanel/Jiaobiao',2},{'Pinzhi','GearWornPrefab/GearIconPanel/Jiaobiao/Pinzhi',2},{'GearIconImg','GearWornPrefab/GearIconPanel/GearIconImg',2},{'Xingdi','GearWornPrefab/GearIconPanel/Xingdi',2},{'EmptyGearStar','GearWornPrefab/GearIconPanel/EmptyGearStar',2},{'GearStarPrefab','GearWornPrefab/GearIconPanel/GearStarPrefab',2},{'GearStarPanel','GearWornPrefab/GearIconPanel/GearStarPanel',2},{'QiconBg_Gong','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong',2},{'Qicon','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon',2},{'QiconFrame','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon/QiconFrame',2},{'QiconBg_Fang','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang',2},{'Qicon01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon',2},{'QiconFrame01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon/QiconFrame',2},{'GearInfoPanel','GearWornPrefab/GearInfoPanel',2},{'GearInfoPrefab1','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1',2},{'Img_Shuxingdi','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/Img_Shuxingdi',2},{'VoidIconBG','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/VoidIconBG',2},{'GearInfoIcon','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoIcon',2},{'GearInfoPrefab2','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2',2},{'Img_Shuxingdi01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/Img_Shuxingdi',2},{'VoidIconBG01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/VoidIconBG',2},{'GearInfoIcon01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoIcon',2},{'GearSkillPrefab','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab',2},{'Img_SkillXian','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Img_SkillXian',2},{'VoidGearIcon','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/Btn_Chakan',2},{'SelectIconImg','SelectIconImg',2},{'SelectIconImg2','SelectIconImg2',2},{'RedDotIcon','RedDotIcon',2},
        -- UITemplate 列表
        {'NewRoleGearPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'GearUpgradeText','GearWornPrefab/Img_Landi/GearUpgradeText',20},{'GearNameTxt','GearWornPrefab/GearNameTxt',20},{'GearInfoText','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoText',20},{'GearInfoNameTxt','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNameTxt',20},{'GearInfoNull','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab1/GearInfoNull',20},{'GearInfoText01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoText',20},{'GearInfoNameTxt01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNameTxt',20},{'GearInfoNull01','GearWornPrefab/GearInfoPanel/GearDataPanel/GearInfoPrefab2/GearInfoNull',20},{'GearSkillNameText','GearWornPrefab/GearInfoPanel/GearDataPanel/GearSkillPrefab/GearSkillNameText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --在回收状态是否被选择
    self.isRecycleSelect = false
    ---获取技能节点
    self.skillName = self.GearSkillNameText()
    ---注册查看技能
    UIEvent.LuaClick(self.GearSkillPrefab().gameObject,function()
        if self.pData.level >= 0 and self.pData.skill ~= nil and self.pData.skill ~= 0 then
            MgrUI.Pop(UID.CoreSkill_UI,self.pData.skill,true)
        else
            Log.Error("查看技能错误，核心等级不足或无技能id")
        end
    end)

    --创建最大星CoreControl.GetSingleCoreData(self.pData.id).star
    local maxStar = BagViewModel.GetCoreStarMax()
    self.starList = {}
    for i = 1, maxStar do
        self.starList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.GearStarPanel().gameObject.transform,false).transform
    end
    -- ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)
    -- ---创建最大基础属性词条
     local maxAttr = BagViewModel.GetCoreAttrMax()
     self.attrList = {}
    -- for i = 1, maxAttr do
    --     self.attrList[i] = GameObject.Instantiate(self.GearAttrPrefab().gameObject,self.GearInfoPanel().gameObject.transform,false).transform
    -- end

    self.attrList[1] =self.GearInfoPrefab1().gameObject.transform
    self.attrList[2] = self.GearInfoPrefab2().gameObject.transform
    -- ---隐藏属性词条预制
     --self.GearAttrPrefab().gameObject:SetActive(false)
    -- ---设置技能词条节点
    -- self.GearSkillPrefab().transform:SetParent(self.GearAttrRoot().gameObject.transform,false)
    -- ---隐藏技能词条预制
    -- self.GearSkillPrefab().gameObject:SetActive(false)
    -- --self.Img_Select().gameObject:SetActive(false)

    UIEvent.LuaClick(self.ObjRoot,function()
        if self.parentSelf.Uid == UID.EnergyFactory_UI then
            ---是否为批量选取模式
            if self.parentSelf.isCoreSelect then
                ---如果装备上锁，则提示请先解锁装备
                if CoreControl.GetCoreLock(self.pData.uid) == 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("geardetailitem_tips1"),1},true)
                    return
                end
                ---获取批选缓存数据
                local selectData = BagViewModel.GetCoreSelects(self.pData.uid)
                ---如果不为空则表示已选
                local isSelect = selectData ~= nil
                ---已选移除，未选添加
                BagViewModel.SetCoreSelects(self.pData,not isSelect)
                ---更新显示
                self.SelectIconImg().gameObject:SetActive(not isSelect)
                ---刷新文本
                self.parentSelf:RefreshRecoveryCount()
            else
                if self.parentSelf.curCoreTemplate ~= nil then
                    self.parentSelf.curCoreTemplate.Img_Select().gameObject:SetActive(false)
                end
                self.parentSelf.curCoreTemplate = self
                ArkViewModel.CurrentCore = self.pData
                self.SelectIconImg().gameObject:SetActive(true)
            end
        else
             if self.parentSelf.Uid == UID.Bag_UI and self.parentSelf.RecycleState and self.parentSelf.RecycleState == 1 then--在回收状态下
                self.isRecycleSelect = not self.isRecycleSelect
                if self.isRecycleSelect then
                    self.parentSelf.RecycleList[self.pData.goods.goodsID] = self.pData.goods
                else
                    self.parentSelf.RecycleList[self.pData.goods.goodsID] = nil
                end
                self:UpdateRecycleState()
                return
            end

            ---是否为批量选取模式
            if self.parentSelf.isCoreSelect then
                ---如果装备上锁，则提示请先解锁装备
                if CoreControl.GetCoreLock(self.pData.uid) == 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("geardetailitem_tips1"),1},true)
                    return
                end
                ---获取批选缓存数据
                local selectData = BagViewModel.GetCoreSelects(self.pData.uid)
                ---如果不为空则表示已选
                local isSelect = selectData ~= nil
                ---已选移除，未选添加
                BagViewModel.SetCoreSelects(self.pData,not isSelect)
                ---更新显示
                self.SelectIconImg().gameObject:SetActive(not isSelect)
                ---更新数量
                self.parentSelf.Text_RecycleItemCount().text = BagViewModel.GetCoreSelectAllCount()
            else
                if self.parentSelf.curCoreTemplate ~= nil then
                    self.parentSelf.curCoreTemplate.SelectIconImg().gameObject:SetActive(false)
                end
                self.parentSelf.curCoreTemplate = self
                BagViewModel.CurrentCore = self.pData
                self.SelectIconImg().gameObject:SetActive(true)

                if NoviceViewModel.CurTaskId == 20710 then
                    MgrUI.PopHide(UID.NoviceFrame_UI)
                    NoviceViewModel.DoNext()
                end
                if  self.parentSelf.Name ~= "Form[Bag_UI]" then return end
                --取消红点
                UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",self.pData.id),self.pData.id)
                self:UpdateItemRedDot()

                local state = false
                for i, v in pairs(BagViewModel.GetCoreData(self.parentSelf.CoreFilter,self.parentSelf.CoreSort,self.parentSelf.CoreIsRise)) do --TODO
                    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",v.id))
                        if isNew == nil or isNew == "" then
                            state = true
                        break
                    end
                end
                RedDotControl.GetDotData("MechaCore"):SetState(state)

                if RedDotControl.GetDotData("MechaCore").State then
                    self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(true)
                    self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(true)
                else
                    self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(false)
                    self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(false)
                end
            end
        end
    end)
end


--刷新红点显示
function M:UpdateItemRedDot()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",self.pData.id))
    if isNew == nil or isNew == ""  and self.parentSelf.Name == "Form[Bag_UI]" then
        self.RedDotIcon().gameObject:SetActive(true)
    else
        self.RedDotIcon().gameObject:SetActive(false)
    end
end

function M:OnUpdateUI(args)
    ---@type CoreData
    self.pData = args[1]
    self.parentSelf = args[2]
    self.idx = args[3]
    self.isRecycleSelect = false
    ---获取批选缓存数据
    local selectData = BagViewModel.GetCoreSelects(self.pData.uid)
    ---更新选框
    if (BagViewModel.CurrentCore ~= nil and BagViewModel.CurrentCore.uid == self.pData.uid) or selectData ~= nil and self.parentSelf.Uid ~= UID.EnergyFactory_UI then
        self.SelectIconImg().gameObject:SetActive(true)
    else
        self.SelectIconImg().gameObject:SetActive(false)
    end

    ---如果当前没有选择核心默认选中第一个
    if BagViewModel.CurrentCore == nil and self.idx == 1 and self.parentSelf.RecycleState == 0 then
        BagViewModel.CurrentCore = self.pData
        self.parentSelf.curCoreTemplate = self
        self.SelectIconImg().gameObject:SetActive(true)
    end

     self.GearNameTxt().text = self.pData.name
    -- ---强化等级
     self.GearUpgradeText().text = "+"..self.pData.level

     local list = CoreControl.GetCores(true)
     --CoreControl.GetSingleCoreData(self.pData.id)
     ---设置星级
    local starCount = CoreControl.GetSingleCoreData(self.pData.uid).star-- self.pData.star
    self.GearStarPanel().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            local specialActive = self.pData.quality == 5
            Obj.gameObject:SetActive(starActive)
            if i <= starCount then
                Obj.gameObject:SetActive(true)
                if specialActive then
                    MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/Img_XingSuper")
                else
                    MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/".."Img_Xing_23")
                end
            else
                Obj.gameObject:SetActive(false)
            end
        end
    end
    -- ---设置基础属性词条
    for i = 1, #self.attrList do
        --if i <= #self.pData.attrs then
        if self.pData.attrs[i] then
            ---显示可用词条
            --self.attrList[i].gameObject:SetActive(true) GearInfoNull
            self.attrList[i]:Find("GearInfoNull").gameObject:SetActive(false)
            self.attrList[i]:Find("VoidIconBG").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoIcon").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoText").gameObject:SetActive(true)
            self.attrList[i]:Find("GearInfoNameTxt").gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"),self.pData.attrs[i].attrIcon)
            ---属性值
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = self.pData.attrs[i].type == 1 and string.format("%.2f%s",self.pData.attrs[i].attribute,"%") or string.format("%.0f",self.pData.attrs[i].attribute)
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = self.pData.attrs[i].attrName
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
    if self.pData.level >= 0 and self.pData.skill ~= nil and self.pData.skill ~= 0 then
        self.GearSkillPrefab().gameObject:SetActive(true)
        local sData = SkillLocalData.tab[self.pData.skill]
        ---更新技能属性
        self.GearSkillNameText().text = sData[12]
    else
        self.GearSkillPrefab().gameObject:SetActive(false)
    end
    ---隐藏技能UI
    self.GearSkillPrefab().gameObject:SetActive(false)
    ---设置核心图标
     MgrRes.LoadSprite(self.GearIconImg(),self.pData.icon)
     --设置图标边框
     MgrRes.LoadSprite(self.GearRankKuangImg(),self:GetQualityName(self.pData.iconFrameGear))
    ---设置已装备头像0进攻 1防守
    self.QiconBg_Gong().gameObject:SetActive(false)
    self.QiconBg_Fang().gameObject:SetActive(false)
    for i = 1, #self.pData.armorGroup do
        local QiconBg = self.QiconBg_Gong().gameObject
        if self.pData.armorGroup[i].group == 1 then
            QiconBg = self.QiconBg_Fang().gameObject
        end
        QiconBg:SetActive(true)
        local Qicon = CJNUIMgr.GetSunUseName(QiconBg, "Qicon"):GetComponent("Image")
        local skinData = HeroControl.GetSkinDataByRoleID(self.pData.armorGroup[i].roleID)
        MgrRes.LoadCircleIcon(Qicon, skinData.id)
    end
    --if self.pData.RoleId ~= nil and self.pData.RoleId ~= 0 then
    --    self.QiconBg().gameObject:SetActive(true)
    --    local skinData = HeroControl.GetSkinDataByRoleID(self.pData.RoleId)
    --    MgrRes.LoadCircleIcon(self.Qicon(), skinData.id)
    --else
    --    self.QiconBg().gameObject:SetActive(false)
    --end
    -- ---是否显示特殊类型
    -- --if self.pData.quality ~= 4 and self.pData.quality ~= 6 then
    --     --self.RankPlusPanel().gameObject:SetActive(false)
    -- --else
    --     --self.RankPlusPanel().gameObject:SetActive(true)
    --     --self.CoreRank_4().gameObject:SetActive(self.pData.quality == 4)
    --     --self.CoreRank_6().gameObject:SetActive(self.pData.quality == 6)
    -- --end
    -- ---是否已经上锁
     self.isLocked = CoreControl.GetCoreLock(self.pData.uid)
    if self.isLocked == 1 then
        self.Gear_Img_Suo().gameObject:SetActive(true)
        self.Gear_Img_Suo_hui().gameObject:SetActive(false)
    else
        self.Gear_Img_Suo().gameObject:SetActive(false)
        self.Gear_Img_Suo_hui().gameObject:SetActive(true)
    end
    ---注册上锁按钮事件
    UIEvent.LuaClick(self.CoreLockPressArea().gameObject,Handle(self,self.ClickLockIcon))
    self:UpdateItemRedDot()
    self:UpdateRecycleState()
end

--新版回收
function M:UpdateRecycleState()
    if self.parentSelf.RecycleState == 0 then
        self.isRecycleSelect = false
    end
    if self.parentSelf.RecycleList[self.pData.goods.goodsID] == nil then
        self.SelectIconImg2().gameObject:SetActive(false)
    else
        self.SelectIconImg2().gameObject:SetActive(true)
    end
    --self.SelectIconImg2().gameObject:SetActive(self.isRecycleSelect)
    --self.SelectIconImg2().gameObject:SetActive(not self.parentSelf.RecycleList[self.pData.goods.goodsID] == nil)
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


function M:ClickLockIcon()
    if self.parentSelf.RecycleState == 1 then
        self.isRecycleSelect = not self.isRecycleSelect
        if self.isRecycleSelect then
            self.parentSelf.RecycleList[self.pData.goods.goodsID] = self.pData.goods
        else
            self.parentSelf.RecycleList[self.pData.goods.goodsID] = nil
        end
        self:UpdateRecycleState()
        return
    end--回收状态不能锁核心
    if self.isLocked == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            CoreControl.SaveCoreLock(self.pData.uid,0,function()
                self.isLocked = 0
                self.Gear_Img_Suo().gameObject:SetActive(false)
                self.Gear_Img_Suo_hui().gameObject:SetActive(true)
            end)
        end,nil,2},true)
    else
        CoreControl.SaveCoreLock(self.pData.uid,1,function()
            self.isLocked = 1
            self.Gear_Img_Suo().gameObject:SetActive(true)
            self.Gear_Img_Suo_hui().gameObject:SetActive(false)
        end)
    end
end

return M