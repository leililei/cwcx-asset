-- Code Auto Create Begin
local M = Class('GearUPBriefItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GearUPBriefItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'GearUPBriefItem','/',2},{'GearWornPrefab','GearWornPrefab',2},{'RankKuangImg','GearWornPrefab/GearIconPanel/RankKuangImg',2},{'GearIcon','GearWornPrefab/GearIconPanel/GearIcon',2},{'Xingdi','GearWornPrefab/GearIconPanel/Xingdi',2},{'GearStarPrefab','GearWornPrefab/GearIconPanel/GearStarPrefab',2},{'HighLight','GearWornPrefab/GearIconPanel/GearStarPrefab/HighLight',2},{'SpecialHighLight','GearWornPrefab/GearIconPanel/GearStarPrefab/SpecialHighLight',2},{'StarRoot','GearWornPrefab/GearIconPanel/StarRoot',2},{'QIcon_Panel','GearWornPrefab/GearIconPanel/QIcon_Panel',2},{'QiconBg_Gong','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong',2},{'Qicon','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon',2},{'QiconFrame','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Gong/Qicon/QiconFrame',2},{'QiconBg_Fang','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang',2},{'Qicon01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon',2},{'QiconFrame01','GearWornPrefab/GearIconPanel/QIcon_Panel/QiconBg_Fang/Qicon/QiconFrame',2},{'Img_Landi','GearWornPrefab/Img_Landi',2},{'Suo','GearWornPrefab/Suo',2},{'CoreUnLock','GearWornPrefab/Suo/CoreUnLock',2},{'CoreLocked','GearWornPrefab/Suo/CoreLocked',2},{'CoreLockBtn','GearWornPrefab/Suo/CoreLockBtn',2},{'SelectIcon','SelectIcon',2},
        -- UITemplate 列表
        {'GearUPBriefItem01','/',10},
        -- TextMeshProUGUI 列表
        {'RankText','GearWornPrefab/Img_Landi/RankText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---创建最大星
    local maxStar = BagViewModel.GetCoreStarMax()
    self.starList = {}
    for i = 1, maxStar do
        self.starList[i] = GameObject.Instantiate(self.GearStarPrefab().gameObject,self.StarRoot().gameObject.transform,false).transform
    end
    ---隐藏星预制
    self.GearStarPrefab().gameObject:SetActive(false)
    ---隐藏选取框
    self.SelectIcon().gameObject:SetActive(false)
end

function M:OnUpdateUI(args)
    ---@type CoreData
    local pData = args[1]
    self.parentSelf = args[2]
    self.coreData = pData
    self.RoleID = pData.RoleId
    ---强化等级
    self.RankText().text = "+"..pData.level
    -----强化等级
    --self.NameText().text = pData.name
    ---星级
    local starCount = pData.star
    self.StarRoot().gameObject:SetActive(starCount > 0)
    if starCount > 0 then
        for i, Obj in ipairs(self.starList) do
            local starActive = i <= starCount and true or false
            if starActive then
                if pData.quality == 5 then
                    Obj:Find("SpecialHighLight").gameObject:SetActive(starActive)
                    Obj:Find("HighLight").gameObject:SetActive(not starActive)
                else
                    Obj:Find("SpecialHighLight").gameObject:SetActive(not starActive)
                    Obj:Find("HighLight").gameObject:SetActive(starActive)
                end
            else
                Obj:Find("SpecialHighLight").gameObject:SetActive(false)
                Obj:Find("HighLight").gameObject:SetActive(false)
            end
        end
    end
    ---锁
    self.CoreLockBtn().gameObject:SetActive(CoreControl.GetCoreLock(pData.uid) == 1)
    self.CoreLocked().gameObject:SetActive(CoreControl.GetCoreLock(pData.uid) == 1)
    self.CoreUnLock().gameObject:SetActive(CoreControl.GetCoreLock(pData.uid) ~= 1)
    ---点击锁按钮解锁
    UIEvent.LuaClick(self.CoreLockBtn().gameObject,function()
        self:ClickLockBtn()
    end)

    ---设置核心图标
    MgrRes.LoadSprite(self.GearIcon(),pData.icon)
    ---设置核心图标
    if self.RoleID ~= 0 then
        self.QIcon_Panel().gameObject:SetActive(true)
        local skinData = HeroControl.GetSkinDataByRoleID(self.RoleID)
        MgrRes.LoadCircleIcon(self.Qicon(),skinData.id)
    else
        self.QIcon_Panel().gameObject:SetActive(false)
    end

    ---设置品质图片
    local quality = pData.quality
    --MgrRes.LoadSprite(self.RankKuangImg(),"Quality/RankKuang_"..quality)
    MgrRes.LoadSprite(self.RankKuangImg(),self:GetQualityName(pData.iconFrameGear))
    --if quality == 4 or quality == 6 then
        --self.RankPlusPanel().gameObject:SetActive(true)
        --MgrRes.LoadSprite(self.RankPlusIconImg(),"Quality/RankKuangPlus_"..quality)
    --else
        --self.RankPlusPanel().gameObject:SetActive(false)
    --end
    ---设置品质特效(待完善)
    if quality > 2 then
        --MgrRes.LoadMaterial(self.GearIcon(),"VFX/_Effects/Shaders/NewUI/UI_Maxweapon_00"..quality - 2)
        --MgrRes.LoadMaterial(self.RankKuangImg(),"VFX/_Effects/Shaders/NewUI/UI_Maxweapon_00"..quality % 2)
        --MgrRes.LoadMaterial(self.RankPlusIconImg(),"VFX/_Effects/Shaders/NewUI/UI_Maxweapon_00"..quality % 2)
    end
    ---是否显示特殊类型
    --self.RankPlusPanel().gameObject:SetActive(false) ---特殊判断
    if self.parentSelf.isBatchSelect then
        ---获取批选缓存数据
        local selectData =self.parentSelf:GetSelectedCore(self.coreData.uid)
        ---如果不为空则表示已选
        local isSelect = selectData ~= nil
        ---更新批选状态
        self.SelectIcon().gameObject:SetActive(isSelect)
    else
        ---更新状态
        self.SelectIcon().gameObject:SetActive(pData.isSelect)
    end

    ---重新绑定事件
    UIEvent.ClearFun(self.ObjRoot)
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnClickBtn))
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
---事件
function M:OnClickBtn()
    --if self.RoleID == RoleCardViewModel.CurrentHero.id then
    --    return
    --end
    if CoreControl.GetCoreLock(self.coreData.uid) ~= 1 then
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
                    self.SelectIcon().gameObject:SetActive(not isSelect)
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("gearupbriefitem_tips1"),1},true)
                    return
                end
            else
                if not isSelect then
                    if self.parentSelf.isMax then
                        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("gearupbriefitem_tips2"),1},true)
                        return
                    end
                end
                self.parentSelf:AddOrDeleteCore(self.coreData,isSelect)
                ---更新显示
                self.SelectIcon().gameObject:SetActive(not isSelect)
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
    else
        ---如果不是核心详情
        if  self.parentSelf.CurOperation ~= 3 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("geardetailitem_tips1"),1},true)
        else
            self.parentSelf:UpGearClick(self.coreData)
        end
    end
end

---点击锁按钮
function M:ClickLockBtn()
    --当前核心已锁
    if CoreControl.GetCoreLock(self.coreData.uid) == 1 then
        ---弹出解锁确认界面
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips5"),function()
            self.CoreLockBtn().gameObject:SetActive(false)
            self.CoreLocked().gameObject:SetActive(false)
            self.CoreUnLock().gameObject:SetActive(true)
            CoreControl.SaveCoreLock(self.coreData.uid,0)
        end,nil,2},true)
    end
end

return M