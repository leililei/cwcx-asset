-- Code Auto Create Begin
local M = Class('RoleGearUpPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleGearUpPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleGearUpPrefab','/',2},{'GearWornPrefab','GearWornPrefab',2},{'selected','GearWornPrefab/selected',2},{'unselected','GearWornPrefab/unselected',2},{'nameBG','GearWornPrefab/nameBG',2},{'LvBG','GearWornPrefab/LvBG',2},{'GearIconPanel','GearWornPrefab/GearIconPanel',2},{'GearImage','GearWornPrefab/GearIconPanel/GearImage',2},{'GearIconImg','GearWornPrefab/GearIconPanel/GearImage/GearIconImg',2},{'Stardi','GearWornPrefab/GearIconPanel/GearImage/Stardi',2},{'StarPanelRoot','GearWornPrefab/GearIconPanel/GearImage/StarPanelRoot',2},{'GearStarPrefab','GearWornPrefab/GearIconPanel/GearImage/GearStarPrefab',2},{'HighLight','GearWornPrefab/GearIconPanel/GearImage/GearStarPrefab/HighLight',2},{'SpecialHighLight','GearWornPrefab/GearIconPanel/GearImage/GearStarPrefab/SpecialHighLight',2},{'QiconBg','GearWornPrefab/GearIconPanel/QiconBg',2},{'Qicon','GearWornPrefab/GearIconPanel/QiconBg/Qicon',2},{'QiconFrame','GearWornPrefab/GearIconPanel/QiconBg/Qicon/QiconFrame',2},{'RankKuangImg','GearWornPrefab/GearIconPanel/RankKuangImg',2},{'GearInfoPrefab','GearWornPrefab/GearInfoPrefab',2},{'GearIconBG','GearWornPrefab/GearInfoPrefab/GearIconBG',2},{'GearInfoIcon','GearWornPrefab/GearInfoPrefab/GearInfoIcon',2},{'GearInfoPanel','GearWornPrefab/GearInfoPanel',2},{'Xian','GearWornPrefab/Xian',2},{'GearSkillPrefab','GearWornPrefab/GearSkillPrefab',2},{'GearIconBG01','GearWornPrefab/GearSkillPrefab/GearIconBG',2},{'GearInfoIcon01','GearWornPrefab/GearSkillPrefab/GearInfoIcon',2},{'Image','GearWornPrefab/GearSkillPrefab/GearInfoNameTxt/Image',2},{'SelectIconImg','SelectIconImg',2},
        -- Text 列表
        {'GearNamtText','GearWornPrefab/nameBG/GearNamtText',3},{'RankText','GearWornPrefab/LvBG/RankText',3},{'GearInfoText','GearWornPrefab/GearInfoPrefab/GearInfoText',3},{'GearInfoNameTxt','GearWornPrefab/GearInfoPrefab/GearInfoNameTxt',3},{'GearInfoNameTxt01','GearWornPrefab/GearSkillPrefab/GearInfoNameTxt',3},
        -- UITemplate 列表
        {'RoleGearUpPrefab01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---获取技能节点
    self.skillName = self.GearInfoNameTxt()
    self.coreData = nil
    ---创建最大星
    local maxStar = 6
    self.starList = {}
    for i = 1, maxStar do
        self.starList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.StarPanelRoot().gameObject.transform,false).transform
    end
    ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)

    ---创建最大基础属性词条
    local maxAttr = 2
    self.attrList = {}
    for i = 1, maxAttr do
        self.attrList[i] = GameObject.Instantiate(self.GearInfoPrefab().gameObject,self.GearInfoPanel().gameObject.transform,false).transform
    end

    ---隐藏基础词条预制
    self.GearInfoPrefab().gameObject:SetActive(false)
    ---隐藏追加词条预制
    self.GearSkillPrefab().gameObject:SetActive(false)
    ---隐藏选取框
    self.SelectIconImg().gameObject:SetActive(false)
    ---设置技能词条节点
    self.GearSkillPrefab().transform:SetParent(self.GearInfoPanel().gameObject.transform,false)
    ---隐藏技能词条预制
    self.GearSkillPrefab().gameObject:SetActive(false)


    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnCoreChipClick))
end

function M:OnUpdateUI(args)
    ---@type CoreData
    local pData = args[1]
    self.parentSelf = args[2]
    self.coreData = pData
    self.GearNamtText().text = pData.name
    ---强化等级
    self.RankText().text = "+"..pData.level
    ---设置星级
    local starCount = pData.star
    self.GearInfoPanel().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            Obj.gameObject:SetActive(starActive)
        end
    end
    ---设置基础属性词条
    for i = 1, #self.attrList do
        if i <= #pData.attrs then
            ---显示可用词条
            self.attrList[i].gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"),"Attribute/GearInfoIcon_"..pData.attrs[i].attrID)
            ---属性值
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text =  (math.floor(pData.attrs[i].attribute*10)*0.1)..(pData.attrs[i].type == 1 and "%" or "")
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = pData.attrs[i].attrName
        else
            ---隐藏不可用词条
            self.attrList[i].gameObject:SetActive(false)
        end
    end
    ---设置核心图标
    MgrRes.LoadSprite(self.GearIconImg(),pData.icon)
    ---设置品质图片
    local quality = pData.quality
    MgrRes.LoadSprite(self.RankKuangImg(),"Quality/RankKuang_"..quality)
    --if quality == 4 or quality == 6 then
    --    --self.RankPlusPanel().gameObject:SetActive(true)
    --    MgrRes.LoadSprite(self.RankPlusIconImg(),"Quality/RankKuangPlus_"..quality)
    --else
    --        --self.RankPlusPanel().gameObject:SetActive(false)
    --end
    ---设置已装备头像
    local tRoleD = RoleCardViewModel.GetHeroByID(pData.RoleId)
    if pData.RoleId~= nil and pData.RoleId~= 0 and tRoleD ~= nil then
        self.QiconBg().gameObject:SetActive(true)
        MgrRes.LoadSprite(self.Qicon(),tRoleD.iconEquip)
    else
        self.QiconBg().gameObject:SetActive(false)
    end
    if self.parentSelf.isBatchSelect then
        ---获取批选缓存数据
        local selectData =self.parentSelf:GetSelectedCore(self.coreData.uid)
        ---如果不为空则表示已选
        local isSelect = selectData ~= nil
        ---更新批选状态
        self.SelectIconImg().gameObject:SetActive(isSelect)
        self.unselected().gameObject:SetActive(not isSelect)
    else
        self.SelectIconImg().gameObject:SetActive(pData.isSelect)
        self.unselected().gameObject:SetActive(not pData.isSelect)
    end
    ---设置技能
    if pData.level >= 0 and pData.skill ~= nil and pData.skill ~= 0 then
        self.GearSkillPrefab().gameObject:SetActive(true)
        local sData = SkillLocalData.tab[pData.skill]
        ---更新技能属性
        self.skillName.text = sData[12]
    else
        self.GearSkillPrefab().gameObject:SetActive(false)
    end
    ---重新绑定事件
    UIEvent.ClearFun(self.ObjRoot)
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnClickBtn))
    ---注册查看技能
    UIEvent.LuaClick(self.GearSkillPrefab().gameObject,function()
        if pData.level >= 0 and pData.skill ~= nil and pData.skill ~= 0 then
            MgrUI.Pop(UID.CoreSkill_UI,pData.skill,true)
        else
            Log.Error("查看技能错误，核心等级不足或无技能id")
        end
    end)
end

---事件
function M:OnClickBtn()
    --if self.RoleID == RoleCardViewModel.CurrentHero.id then
    --    return
    --end
    ---是否为批量选取模式
    if self.parentSelf.isBatchSelect then
        ---获取批选缓存数据
        local selectData = self.parentSelf:GetSelectedCore(self.coreData.uid)
        ---如果不为空则表示已选
        local isSelect = selectData ~= nil
        if #self.parentSelf.SingleChooseCoreList >= self.parentSelf.RealCostCoreCount then
            if isSelect then
                ---已选移除，未选添加
                self.parentSelf:AddOrDeleteCore(self.coreData,isSelect)
                ---更新显示
                self.SelectIconImg().gameObject:SetActive(not isSelect)
                self.unselected().gameObject:SetActive(isSelect)
            else
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("gearupbriefitem_tips1"),1},true)
                return
            end
        else
            self.parentSelf:AddOrDeleteCore(self.coreData,isSelect)
            ---更新显示
            self.SelectIconImg().gameObject:SetActive(not isSelect)
            self.unselected().gameObject:SetActive(isSelect)
        end
        if self.parentSelf.CurOperation == 1 then
            if self.parentSelf.isAdvanced then
                self.parentSelf:UpdataAdvanceItem()
            else
                self.parentSelf:UpdataCostItem()
            end
        elseif self.parentSelf.CurOperation == 2 then
            self.parentSelf:UpdataRebuildCostItem()
        end
    else
        self.parentSelf:UpGearClick(self.coreData)
    end
end
return M