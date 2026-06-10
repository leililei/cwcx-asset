-- Code Auto Create Begin
local M = Class('RoleGearPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleGearPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleGearPrefab','/',2},{'GearWornPrefab','GearWornPrefab',2},{'selected','GearWornPrefab/selected',2},{'unselected','GearWornPrefab/unselected',2},{'nameBG','GearWornPrefab/nameBG',2},{'LvBG','GearWornPrefab/LvBG',2},{'GearIconPanel','GearWornPrefab/GearIconPanel',2},{'tubiaodi3','GearWornPrefab/GearIconPanel/tubiaodi3',2},{'GearIconImg','GearWornPrefab/GearIconPanel/tubiaodi3/GearIconImg',2},{'Stardi','GearWornPrefab/GearIconPanel/Stardi',2},{'RankKuangImg','GearWornPrefab/GearIconPanel/RankKuangImg',2},{'EmptyStarPanelRoot','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab01','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab02','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab03','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab04','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab05','GearWornPrefab/GearIconPanel/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'GearStarPrefab','GearWornPrefab/GearIconPanel/GearStarPrefab',2},{'HighLight','GearWornPrefab/GearIconPanel/GearStarPrefab/HighLight',2},{'HighLight_juexing','GearWornPrefab/GearIconPanel/GearStarPrefab/HighLight_juexing',2},{'StarPanelRoot','GearWornPrefab/GearIconPanel/StarPanelRoot',2},{'QiconBg','GearWornPrefab/GearIconPanel/QiconBg',2},{'Qicon','GearWornPrefab/GearIconPanel/QiconBg/Qicon',2},{'QiconFrame','GearWornPrefab/GearIconPanel/QiconBg/Qicon/QiconFrame',2},{'LockBottom','GearWornPrefab/GearIconPanel/LockBottom',2},{'CoreLocked','GearWornPrefab/GearIconPanel/LockBottom/CoreLocked',2},{'CoreUnlocked','GearWornPrefab/GearIconPanel/LockBottom/CoreUnlocked',2},{'CoreLockPressArea','GearWornPrefab/GearIconPanel/LockBottom/CoreLockPressArea',2},{'GearInfoPrefab','GearWornPrefab/GearInfoPrefab',2},{'GearIconBG','GearWornPrefab/GearInfoPrefab/GearIconBG',2},{'GearInfoIcon','GearWornPrefab/GearInfoPrefab/GearInfoIcon',2},{'GearInfoPanel','GearWornPrefab/GearInfoPanel',2},{'Xian','GearWornPrefab/Xian',2},{'GearSkillPrefab','GearWornPrefab/GearSkillPrefab',2},{'GearIconBG01','GearWornPrefab/GearSkillPrefab/GearIconBG',2},{'GearInfoIcon01','GearWornPrefab/GearSkillPrefab/GearInfoIcon',2},{'Image','GearWornPrefab/GearSkillPrefab/GearInfoNameTxt/Image',2},{'SelectIconImg','SelectIconImg',2},{'SelectIconImg1','SelectIconImg/SelectIconImg1',2},
        -- Text 列表
        {'GearNamtText','GearWornPrefab/nameBG/GearNamtText',3},{'RankText','GearWornPrefab/LvBG/RankText',3},{'GearInfoText','GearWornPrefab/GearInfoPrefab/GearInfoText',3},{'GearInfoNameTxt','GearWornPrefab/GearInfoPrefab/GearInfoNameTxt',3},{'GearInfoNameTxt01','GearWornPrefab/GearSkillPrefab/GearInfoNameTxt',3},
        -- UITemplate 列表
        {'RoleGearPrefab01','/',10},
    }
end
-- Code Auto Create End
require("LocalData/SkillLocalData")
function M:OnInit()
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
    self.SkillObj = GameObject.Instantiate(self.GearSkillPrefab().gameObject,self.GearInfoPanel().gameObject.transform,false).gameObject
    self.SkillObj:SetActive(false)
    ---隐藏基础词条预制
    self.GearInfoPrefab().gameObject:SetActive(false)
    ---隐藏追加词条预制
    self.GearSkillPrefab().gameObject:SetActive(false)
    ---隐藏选取框
    self.SelectIconImg().gameObject:SetActive(false)

    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnCoreChipClick))
end

function M:OnUpdateUI(args)
    ---@type CoreData
    local pData = args[1]
    self.parentSelf = args[2]
    --UnityEngine.Debug.LogError(self.parentSelf.ObjRoot.transform.name)
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
            local specialActive = pData.quality == 5
            Obj:Find("HighLight").gameObject:SetActive(starActive and not specialActive)
            Obj:Find("HighLight_juexing").gameObject:SetActive(starActive and specialActive)
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
            local value = 0
            if pData.attrs[i].type == 0 then
                value = math.floor(pData.attrs[i].attribute)
            else
                value =(math.floor(pData.attrs[i].attribute*100)*0.01).."%"
            end
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = value
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = pData.attrs[i].attrName
        else
            ---隐藏不可用词条
            self.attrList[i].gameObject:SetActive(false)
        end
    end

    ---设置核心技能
    if pData.skill~=0 then
        self.SkillObj:SetActive(true)
        local skill = SkillLocalData.tab[pData.skill]
        local GearInfoNameTxt = self.SkillObj.transform:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI")
        local ChaKan = self.SkillObj.transform:Find("GearInfoNameTxt/Image").gameObject         ---找到要点击的图片
        ----添加技能图标点击详细说明事件
        UIEvent.LuaClick(ChaKan,Handle(self,function()
            self:InitCoreSkillPanel(skill[1])
        end))
        --UIEvent.LuaClick(ChaKan,Handle(self, function ()
        --    -- statements
        --    self:InitCombineSkillPanel(attr.Skill_5_example)
        --end))
        GearInfoNameTxt.text = skill[12]
    else
        self.SkillObj:SetActive(false)
    end
    ---设置核心图标
    MgrRes.LoadSprite(self.GearIconImg(),pData.icon)
    ---设置品质图片
    local quality = pData.quality
    MgrRes.LoadSprite(self.RankKuangImg(),"Quality/RankKuang_"..quality)

    --if quality == 4 or quality == 6 then
        --self.RankPlusPanel().gameObject:SetActive(true)
        --MgrRes.LoadSprite(self.RankPlusIconImg(),"Quality/RankKuangPlus_"..quality)
    --else
        --self.RankPlusPanel().gameObject:SetActive(false)
    --end
    ---设置已装备头像
    if pData.RoleId~= nil and pData.RoleId~= 0 then
        self.QiconBg().gameObject:SetActive(true)
        MgrRes.LoadCircleIcon(self.Qicon(),pData.RoleId)
    else
        self.QiconBg().gameObject:SetActive(false)
    end
    ---装备锁
    self.isLocked = CoreControl.GetCoreLock(self.coreData.uid)
    if self.isLocked == 1 then
        self.CoreLocked().gameObject:SetActive(true)
        self.CoreUnlocked().gameObject:SetActive(false)
    else
        self.CoreLocked().gameObject:SetActive(false)
        self.CoreUnlocked().gameObject:SetActive(true)
    end
    ---更新选取状态
    self.SelectIconImg().gameObject:SetActive(pData.isSelect)
    self.unselected().gameObject:SetActive(not pData.isSelect)
    ---注册上锁按钮事件
    UIEvent.LuaClick(self.CoreLockPressArea().gameObject,Handle(self,self.ClickLockIcon))
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
            self.isLocked = 0
            self.CoreLocked().gameObject:SetActive(false)
            self.CoreUnlocked().gameObject:SetActive(true)
            CoreControl.SaveCoreLock(self.coreData.uid,0)
            self.parentSelf:InitToGearPanel()
        end,nil,2},true)
    else
        self.isLocked = 1
        self.CoreLocked().gameObject:SetActive(true)
        self.CoreUnlocked().gameObject:SetActive(false)
        CoreControl.SaveCoreLock(self.coreData.uid,1)
        self.parentSelf:InitToGearPanel()
    end
end

return M