-- Code Auto Create Begin
local M = Class('GearDetailItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GearDetailItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GearDetailItem','/',2},{'RedDotIcon','RedDotIcon',2},{'Img_Normal','Img_Normal',2},{'SelectGear','SelectGear',2},{'Img_Jiaobiao(xuanzhong)','SelectGear/Img_Jiaobiao(xuanzhong)',2},{'GearAttrPrefab','GearAttrPrefab',2},{'Img_Shuxingicondi','GearAttrPrefab/Img_Shuxingicondi',2},{'GearInfoIcon','GearAttrPrefab/GearInfoIcon',2},{'GearSkillPrefab','GearSkillPrefab',2},{'Btn_Chakan','GearSkillPrefab/Btn_Chakan',2},{'Img_Jinengicondi','GearSkillPrefab/Img_Jinengicondi',2},{'Img_SkillIcon','GearSkillPrefab/Img_SkillIcon',2},{'GearAttrRoot','GearAttrRoot',2},{'jijiamingdi2','jijiamingdi2',2},{'landi2','landi2',2},{'tubiaodi2','GearIconPanel/tubiaodi2',2},{'GearIcon','GearIconPanel/tubiaodi2/GearIcon',2},{'RankKuangImg','GearIconPanel/RankKuangImg',2},{'LockBottom','GearIconPanel/LockBottom',2},{'UnLocked','GearIconPanel/LockBottom/UnLocked',2},{'CoreLocked','GearIconPanel/LockBottom/CoreLocked',2},{'CoreLockPressArea','GearIconPanel/LockBottom/CoreLockPressArea',2},{'EquipRole','GearIconPanel/EquipRole',2},{'RoleIconFrame','GearIconPanel/EquipRole/RoleIconFrame',2},{'RoleIcon','GearIconPanel/EquipRole/RoleIcon',2},{'xingdi2','GearIconPanel/xingdi2',2},{'StarRoot','GearIconPanel/StarRoot',2},{'GearStarPrefab','GearIconPanel/StarRoot/GearStarPrefab',2},{'HighLight','GearIconPanel/StarRoot/GearStarPrefab/HighLight',2},{'HighLight_juexing','GearIconPanel/StarRoot/GearStarPrefab/HighLight_juexing',2},{'StarPanel','GearIconPanel/StarPanel',2},{'Xian','Xian',2},
        -- UITemplate 列表
        {'GearDetailItem01','/',10},
        -- TextMeshProUGUI 列表
        {'GearInfoNameTxt','GearAttrPrefab/GearInfoNameTxt',20},{'GearInfoText','GearAttrPrefab/GearInfoText',20},{'Text_SkillName','GearSkillPrefab/Text_SkillName',20},{'GearNameText','jijiamingdi2/GearNameText',20},{'GearRankText','landi2/GearRankText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---获取技能节点
    self.skillName = self.Text_SkillName()
    ---注册查看技能
    UIEvent.LuaClick(self.GearSkillPrefab().gameObject,function()
        if self.pData.level >= 0 and self.pData.skill ~= nil and self.pData.skill ~= 0 then
            MgrUI.Pop(UID.CoreSkill_UI,self.pData.skill,true)
        else
            Log.Error("查看技能错误，核心等级不足或无技能id")
        end
    end)

    ---创建最大星
    local maxStar = BagViewModel.GetCoreStarMax()
    self.starList = {}
    for i = 1, maxStar do
        self.starList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.StarRoot().gameObject.transform,false).transform
    end
    ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)
    ---创建最大基础属性词条
    local maxAttr = BagViewModel.GetCoreAttrMax()
    self.attrList = {}
    for i = 1, maxAttr do
        self.attrList[i] = GameObject.Instantiate(self.GearAttrPrefab().gameObject,self.GearAttrRoot().gameObject.transform,false).transform
    end
    ---隐藏属性词条预制
    self.GearAttrPrefab().gameObject:SetActive(false)
    ---设置技能词条节点
    self.GearSkillPrefab().transform:SetParent(self.GearAttrRoot().gameObject.transform,false)
    ---隐藏技能词条预制
    self.GearSkillPrefab().gameObject:SetActive(false)
    --self.Img_Select().gameObject:SetActive(false)

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
                --self.Img_Select().gameObject:SetActive(not isSelect)
                ---刷新文本
                self.parentSelf:RefreshRecoveryCount()
            else
                if self.parentSelf.curCoreTemplate ~= nil then
                    self.parentSelf.curCoreTemplate.Img_Select().gameObject:SetActive(false)
                end
                self.parentSelf.curCoreTemplate = self
                ArkViewModel.CurrentCore = self.pData
                --self.Img_Select().gameObject:SetActive(true)
            end
        else
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
                self.SelectGear().gameObject:SetActive(not isSelect)
                ---更新数量
                self.parentSelf.Text_RecycleItemCount().text = BagViewModel.GetCoreSelectAllCount()
            else
                if self.parentSelf.curCoreTemplate ~= nil then
                    self.parentSelf.curCoreTemplate.SelectGear().gameObject:SetActive(false)
                end
                self.parentSelf.curCoreTemplate = self
                BagViewModel.CurrentCore = self.pData
                self.SelectGear().gameObject:SetActive(true)

                if NoviceViewModel.CurTaskId == 20710 then
                    MgrUI.PopHide(UID.NoviceFrame_UI)
                    NoviceViewModel.DoNext()
                end

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
 
                -- if RedDotControl.GetDotData("MechaCore").State then
                --     self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(true)
                --     self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(true)
                -- else
                --     self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(false)
                --     self.parentSelf.GearCoreRedDotIcon().gameObject:SetActive(false)
                -- end
            end
        end
    end)
end


--刷新红点显示TODO
function M:UpdateItemRedDot()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MechaCore%s",self.pData.id))
    if isNew == nil or isNew == ""  then
        self.RedDotIcon().gameObject:SetActive(true)
    else
        self.RedDotIcon().gameObject:SetActive(false)
    end
end

function M:OnUpdateUI(args)
    ---@type CoreData
    self.pData = args[1]
    self.parentSelf = args[2]

    ---获取批选缓存数据
    local selectData = BagViewModel.GetCoreSelects(self.pData.uid)
    ---更新选框
    if (BagViewModel.CurrentCore ~= nil and BagViewModel.CurrentCore.uid == self.pData.uid) or selectData ~= nil and self.parentSelf.Uid ~= UID.EnergyFactory_UI then
        self.SelectGear().gameObject:SetActive(true)
    else
        self.SelectGear().gameObject:SetActive(false)
    end
    if self.parentSelf.Uid == UID.EnergyFactory_UI and ArkViewModel.CurrentCore ~= nil and ArkViewModel.CurrentCore.uid == self.pData.uid then
        --self.Img_Select().gameObject:SetActive(true)
    else
        --self.Img_Select().gameObject:SetActive(false)
    end
    self.GearNameText().text = self.pData.name
    ---强化等级
    self.GearRankText().text = "+"..self.pData.level
    ---设置星级
    local starCount = self.pData.star
    self.StarRoot().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            local specialActive = self.pData.quality == 5
            Obj:Find("HighLight").gameObject:SetActive(starActive and not specialActive)
            Obj:Find("HighLight_juexing").gameObject:SetActive(starActive and specialActive)
        end
    end
    ---设置基础属性词条
    for i = 1, #self.attrList do
        if i <= #self.pData.attrs then
            ---显示可用词条
            self.attrList[i].gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"),self.pData.attrs[i].attrIcon)
            ---属性值
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = self.pData.attrs[i].type == 1 and string.format("%.2f%s",self.pData.attrs[i].attribute,"%") or string.format("%.0f",self.pData.attrs[i].attribute)
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = self.pData.attrs[i].attrName
        else
            ---隐藏不可用词条
            self.attrList[i].gameObject:SetActive(false)
        end
    end
    ---设置技能
    if self.pData.level >= 0 and self.pData.skill ~= nil and self.pData.skill ~= 0 then
        self.GearSkillPrefab().gameObject:SetActive(true)
        local sData = SkillLocalData.tab[self.pData.skill]
        ---更新技能属性
        self.skillName.text = sData[12]
    else
        self.GearSkillPrefab().gameObject:SetActive(false)
    end
    ---设置核心图标
    MgrRes.LoadSprite(self.GearIcon(),self.pData.icon)
    ---设置图标边框
    MgrRes.LoadSprite(self.RankKuangImg(),self.pData.iconFrame)
    ---设置已装备头像
    if self.pData.RoleId ~= nil and self.pData.RoleId ~= 0 then
        self.EquipRole().gameObject:SetActive(true)
        MgrRes.LoadCircleIcon(self.RoleIcon(), self.pData.RoleId)
    else
        self.EquipRole().gameObject:SetActive(false)
    end
    ---是否显示特殊类型
    --if self.pData.quality ~= 4 and self.pData.quality ~= 6 then
        --self.RankPlusPanel().gameObject:SetActive(false)
    --else
        --self.RankPlusPanel().gameObject:SetActive(true)
        --self.CoreRank_4().gameObject:SetActive(self.pData.quality == 4)
        --self.CoreRank_6().gameObject:SetActive(self.pData.quality == 6)
    --end
    ---是否已经上锁
    self.isLocked = CoreControl.GetCoreLock(self.pData.uid)
    if self.isLocked == 1 then
        self.CoreLocked().gameObject:SetActive(true)
        --self.CoreUnlocked().gameObject:SetActive(false)
    else
        self.CoreLocked().gameObject:SetActive(false)
        --self.CoreUnlocked().gameObject:SetActive(true)
    end
    ---注册上锁按钮事件
    UIEvent.LuaClick(self.CoreLockPressArea().gameObject,Handle(self,self.ClickLockIcon))
    self:UpdateItemRedDot()
end

function M:ClickLockIcon()
    if self.isLocked == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            self.isLocked = 0
            self.CoreLocked().gameObject:SetActive(false)
            --self.CoreUnlocked().gameObject:SetActive(true)
            CoreControl.SaveCoreLock(self.pData.uid,0)
        end,nil,2},true)
    else
        self.isLocked = 1
        self.CoreLocked().gameObject:SetActive(true)
        --self.CoreUnlocked().gameObject:SetActive(false)
        CoreControl.SaveCoreLock(self.pData.uid,1)
    end
end

return M