-- Code Auto Create Begin
local M = Class('RoleCard_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleCard_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleCard_UI].prefab'
    self.Name = 'Form[RoleCard_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGround','BackGround',2},{'dian','dian',2},{'dianPrefab','dianPrefab',2},{'Frame','Frame',2},{'L_RoleCardItem','L_ScrollMask/L_RoleCardScroll/L_RoleCardItem',2},{'Btn_Next','Btn_Next',2},{'Normal','Btn_Next/Normal',2},{'HighLight','Btn_Next/HighLight',2},{'Btn_Last','Btn_Last',2},{'Normal01','Btn_Last/Normal',2},{'HighLight01','Btn_Last/HighLight',2},{'CardTypePanel','LeftTop/CardTypePanel',2},{'Tg_CardType','LeftTop/CardTypePanel/Tg_CardType',2},{'Normal02','LeftTop/CardTypePanel/Tg_CardType/Normal',2},{'HighLight02','LeftTop/CardTypePanel/Tg_CardType/HighLight',2},{'Frame01','LeftTop/CardTypePanel/Tg_CardType/HighLight/Frame',2},{'EquipType','LeftTop/CardTypeMask/EquipType',2},{'Btn_Back','LeftTop/Btn_Back',2},{'Btn_I','LeftTop/Btn_I',2},{'RightTop','RightTop',2},{'CardSortPanel','RightTop/CardSortPanel',2},{'Tg_CardSort','RightTop/CardSortPanel/Tg_CardSort',2},{'Normal03','RightTop/CardSortPanel/Tg_CardSort/Normal',2},{'Icon_Rise','RightTop/CardSortPanel/Tg_CardSort/Normal/Icon_Rise',2},{'Btn_HighLight','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Icon_RiseDown','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseDown',2},{'Icon_RiseUp','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseUp',2},{'Frame02','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'Btn_Filter','RightTop/Btn_Filter',2},
        -- UITemplate 列表
        {'L_RoleCardItem01','L_ScrollMask/L_RoleCardScroll/L_RoleCardItem',10},{'RoleCardItem','RoleCardScroll/RoleCardItem',10},{'SpecialRoleCardItem','SpecialCardScroll/SpecialRoleCardItem',10},
        -- Toggle 列表
        {'dianPrefab01','dianPrefab',13},{'Tg_CardType01','LeftTop/CardTypePanel/Tg_CardType',13},{'Tg_CardSort01','RightTop/CardSortPanel/Tg_CardSort',13},
        -- RawImage 列表
        {'L_RoleCardScroll','L_ScrollMask/L_RoleCardScroll',15},{'L_RoleCardContent','L_ScrollMask/L_RoleCardScroll/L_RoleCardContent',15},{'RoleCardScroll','RoleCardScroll',15},{'RoleCardContent','RoleCardScroll/RoleCardContent',15},{'RoleCardItem01','RoleCardScroll/RoleCardItem',15},{'SpecialCardScroll','SpecialCardScroll',15},{'SpecialCardContent','SpecialCardScroll/SpecialCardContent',15},{'SpecialRoleCardItem01','SpecialCardScroll/SpecialRoleCardItem',15},
        -- LoopScrollRect 列表
        {'L_RoleCardScroll01','L_ScrollMask/L_RoleCardScroll',18},{'RoleCardScroll01','RoleCardScroll',18},{'SpecialCardScroll01','SpecialCardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_CN','LeftTop/CardTypePanel/Tg_CardType/Normal/Text_CN',20},{'Text_EN','LeftTop/CardTypePanel/Tg_CardType/Normal/Text_EN',20},{'Text_CN01','LeftTop/CardTypePanel/Tg_CardType/HighLight/Text_CN',20},{'Text_EN01','LeftTop/CardTypePanel/Tg_CardType/HighLight/Text_EN',20},{'Text_CN02','RightTop/CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN03','RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},
    }
end
-- Code Auto Create End
---佣兵UI初始化
function M:OnInit()
    ---播放角色界面BGM

    self.CurCardIndex = 1        ---当前显示界面 (1角色卡池，2超限装备)
    self.CurCardSort = 1        ---当前排序类型(1等级，2星级，3取得时间, 4稀有度，5好感度)
    self.CurCardFilter = {      ---当前筛选类型true为开启项(0全部，1护卫，2强击，3轰炸，4支援 与配置表一致)
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false                        
    }
    self.CurCardRise = true    ---当前升降序(true升序，false降序)
    self.CardScrollGroup = {
        [1] = { scroll = self.RoleCardScroll01(), filterType = RoleCardViewModel.FilterType.Role, type = 1, sortGroup = {1,2,3} },
        [2] = { scroll = self.SpecialCardScroll01(), filterType = RoleCardViewModel.FilterType.Special, type = 1, sortGroup = {4,2,3} },
        --[2] = self.L_RoleCardScroll01()
    }
    ---排序标签
    self.SortGroup = {
        [1] = { name = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"), sort = 1 },    --等级
        [2] = { name = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"), sort = 2 },    --星级
        [3] = { name = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_quality"), sort = 3 },    --稀有度
        [4] = { name = MgrLanguageData.GetLanguageByKey("bag_ui_core_zhuanshugongming_2"), sort = 1 },    --超限等级
    }
    self:RegisterScroll()       ---注册loopScroll
    self:InitCardType()         ---初始化左上卡池类型标签
    self:InitBtnBack()          ---初始化返回按钮
    self:InitBtnI()          ---初始化帮助按钮
    self:InitLastNextBtn()      ---初始化滑动按钮
    self:InitCardSort()         ---初始化排序标签
    self:InitFilterBtn()        ---初始化筛选器按钮
    self:UpdataDian()

    ---新手引导事件
    Event.Clear("RoleCloseScroll")
    Event.Add("RoleCloseScroll",function()
        self.RoleCardScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").adsorbent = false
        self.RoleCardScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = false
    end)
    Event.Clear("RoleOpenScroll")
    Event.Add("RoleOpenScroll",function()
        self.RoleCardScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").adsorbent = true
        self.RoleCardScroll01().gameObject.transform:GetComponent("LoopHorizontalScrollRect").horizontal = true
    end)
end


function M:OnUpdateUI()
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113015][2],0.2)
end

function M:OnShowFinish()

end

function M:UpdataDian()
    MgrTimer.Cancel("RoleCardDian")
    Tools.ClearAllChild(self.Frame().gameObject)
    local DianObj = GameObject.Instantiate(self.dian().gameObject,self.Frame().gameObject.transform,false)
    DianObj:SetActive(true)
    local tCurData = self.CardScrollGroup[self.CurCardIndex]
    if self.CurCardIndex == 1 then
        local count = math.ceil(#RoleCardViewModel.GetRoleData(self.CurCardFilter,self.CurCardSort,self.CurCardRise)/10)
        if count>1 then
            for i = 1, count - 1 do
                local obj = GameObject.Instantiate(self.dianPrefab().gameObject,self.Frame().gameObject.transform,false)
                obj:SetActive(true)
            end
            local curIndex = 0
            MgrTimer.AddRepeat("RoleCardDian",0,function()
                if curIndex~=math.floor(tCurData.scroll.curItemIndex/10) then
                    curIndex = math.floor(tCurData.scroll.curItemIndex/10)
                    DianObj.transform:SetSiblingIndex(curIndex)
                end
            end,-1,nil)
        end
    elseif self.CurCardIndex == 2 then
        local count = math.ceil(#RoleCardViewModel.GetRoleData(self.CurCardFilter,self.CurCardSort,self.CurCardRise,tCurData.filterType)/10)
        if count>1 then
            for i = 1, count - 1 do
                local obj = GameObject.Instantiate(self.dianPrefab().gameObject,self.Frame().gameObject.transform,false)
                obj:SetActive(true)
            end
            local curIndex = 0
            MgrTimer.AddRepeat("RoleCardDian",0,function()
                if curIndex~=math.floor(tCurData.scroll.curItemIndex/10) then
                    curIndex = math.floor(tCurData.scroll.curItemIndex/10)
                    DianObj.transform:SetSiblingIndex(curIndex)
                end
            end,-1,nil)
        end
    end
    self.dian().gameObject:SetActive(false)
    self.dianPrefab().gameObject:SetActive(false)
end
---刷新界面
function M:OnShow()
    ---设置默认界面
    self.Tg_ViewTypeArr[self.CurCardIndex].isOn = false
    self.Tg_ViewTypeArr[self.CurCardIndex].isOn = true
    ---设置默认排序
    self.Tg_ViewSortArr[self.CurCardSort].isOn= false
    self.Tg_ViewSortArr[self.CurCardSort].isOn= true
    ---设置默认筛选
    self.CurCardFilter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false
    }

end

function M:OnBackShow()
    self:ResetCardItem(self.CurTab)
end

---注册滑块回调
function M:RegisterScroll()
    for type, group in pairs(self.CardScrollGroup) do
        group.scroll:SetLuaCellEvent(Handle(self,self.CellItem))
    end
end
---滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],idx})
end
---设置滑动数据
function M:ResetCardItem(offset,isScroll)   
    local tCardData = self.CardScrollGroup[self.CurCardIndex]
    ---设置当前Loop数据
    self.CurLoopList = RoleCardViewModel.GetRoleData(self.CurCardFilter,self.CurCardSort,self.CurCardRise,tCardData.filterType)
    ---设置Loop数量
    tCardData.scroll.totalCount = #self.CurLoopList
    --更新排序标签名称
    self:UpdateSortGroupName()
    if offset then
        if isScroll then
            tCardData.scroll:ScrollToCell(offset, 3500)      ---将LoopScroll滑动到指定index
        else
            tCardData.scroll:RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
        end
    else
        tCardData.scroll:RefreshCells()               ---只刷新数据
    end
end
---初始化卡片类型标签
function M:InitCardType()
    local toggleName = {
        ---驾驶员
        [1] = MgrLanguageData.GetLanguageByKey("ui_tongyong_text61"),
        --[2] = MgrLanguageData.GetLanguageByKey("rolecard_ui_arms"),
        ---超限装备
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_zhuanshugongming_1"),
    }
    if SysLockControl.CheckSysLock(1006) then
        self.EquipType().raycastTarget = true
    else
        self.EquipType().raycastTarget = false
    end
    UIEvent.LuaClick(self.EquipType().gameObject,Handle(self,function()
        if not SysLockControl.CheckSysLock(1006) then
            MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("rolecard_ui_tips"),SysLockControl.GetUnlockLevel(1006)),1},true)
            return
        else
            self.EquipType().raycastTarget = false
        end
    end))
    self.Tg_ViewTypeArr = {}
    for i, name in ipairs(toggleName) do
        local obj = GameObject.Instantiate(self.Tg_CardType().gameObject,self.CardTypePanel().gameObject.transform,false)
        local objChild = {
            obj.transform:Find("Normal").gameObject,
            obj.transform:Find("HighLight").gameObject
        }
        local nameArr = string.split(name,"_")
        for k, v in pairs(objChild) do
            v.transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = nameArr[1]
            v.transform:Find("Text_EN"):GetComponent("TextMeshProUGUI").text = nameArr[2]
        end
        objChild[2]:SetActive(false)
        self.Tg_ViewTypeArr[i] = obj:GetComponent("Toggle")
        Tools.ToggleValueChange(self.Tg_ViewTypeArr[i],Handle(self, function(self,isOn)
            objChild[1]:SetActive(not isOn)
            objChild[2]:SetActive(isOn)
            if isOn then
                self.CurCardIndex = i
                for idx, group in pairs(self.CardScrollGroup) do
                    group.scroll.gameObject:SetActive(idx == i)
                    self.CurTab=0
                end
                self:UpdataDian()
                if i == 1 then
                    self:ResetCardItem()
                else
                    self:ResetCardItem(0)
                end

            end
        end),nil)
    end
    ---隐藏标签预制
    self.Tg_CardType().gameObject:SetActive(false)
    --self.CardTypePanel().gameObject:SetActive(false)
end
---初始化排序标签
function M:InitCardSort()
    --排序标签
    local toggleName = self.CardScrollGroup[self.CurCardIndex].sortGroup
    self.tg_SortArr = {}
    self.tg_RiseArr = {}
    self.Tg_ViewSortArr= {}
    for i, data in ipairs(toggleName) do
        local obj = GameObject.Instantiate(self.Tg_CardSort().gameObject,self.CardSortPanel().gameObject.transform,false)
        ---排序标签
        local objChild = {
            obj.transform:Find("Normal").gameObject,
            obj.transform:Find("Btn_HighLight").gameObject
        }
        self.tg_SortArr[i] = objChild
        ---升降序
        local riseObjArr = {
            [1] = objChild[2].transform:Find("Icon_RiseDown").gameObject,
            [2] = objChild[2].transform:Find("Icon_RiseUp").gameObject,
        }
        self.tg_RiseArr[i] = riseObjArr
        
        objChild[2]:SetActive(false)
        self.Tg_ViewSortArr[i] = obj:GetComponent("Toggle")
        ---排序点击
        Tools.ToggleValueChange(self.Tg_ViewSortArr[i],Handle(self, function(self,isOn)
            ---排序状态
            objChild[1]:SetActive(not isOn)
            objChild[2]:SetActive(isOn)
            if isOn then
                ---升降序状态
                if self.CurCardRise then
                    riseObjArr[1]:SetActive(true)
                    riseObjArr[2]:SetActive(false)
                else
                    riseObjArr[1]:SetActive(false)
                    riseObjArr[2]:SetActive(true)
                end
                local tSortGroupId = self.CardScrollGroup[self.CurCardIndex].sortGroup[i]
                self.CurCardSort = self.SortGroup[tSortGroupId].sort
                self:ResetCardItem(0)
            end
        end),nil)

        riseObjArr[2]:SetActive(false)
        ---升降序点击
        UIEvent.LuaClick(objChild[2],Handle(self,function(self)
            riseObjArr[1]:SetActive(not riseObjArr[1].activeSelf)
            riseObjArr[2]:SetActive(not riseObjArr[2].activeSelf)
            self.CurCardRise = not self.CurCardRise
            self:ResetCardItem(0)
        end))
    end

    --更新排序标签名称
    self:UpdateSortGroupName()
    ---隐藏预制
    self.Tg_CardSort().gameObject:SetActive(false)
end

---初始化筛选按钮
function M:InitFilterBtn()
    UIEvent.LuaClick(self.Btn_Filter().gameObject,function()
        local filterType = self.CardScrollGroup[self.CurCardIndex].filterType
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            local allFalse = true
            for _, v in pairs(filter) do
                if v == true then
                    allFalse = false
                end
            end
            if allFalse then
                filter[0] = true
            end
            self:FilterCallBack(filter,sort,rise)
        end,2,{self.CurCardFilter,self.CurCardSort,self.CurCardRise},filterType},true)
    end)
end

---事件回调
function M:FilterCallBack(filter,sort,rise)
    for i, v in pairs(self.tg_SortArr) do
        v[1]:SetActive(true)
        v[2]:SetActive(false)
    end
    ---更新角色界面存在的排序状态
    if self.tg_SortArr[sort] then
        self.Tg_ViewSortArr[sort].isOn= true
        self.tg_SortArr[sort][1]:SetActive(false)
        self.tg_SortArr[sort][2]:SetActive(true)
        self.tg_RiseArr[sort][1]:SetActive(rise)
        self.tg_RiseArr[sort][2]:SetActive(not rise)
    end
    ---设置排序筛选升降序属性
    self.CurCardFilter = filter
    self.CurCardSort = sort
    self.CurCardRise = rise
    ---更新并刷新到顶部
    self:ResetCardItem(0)
    self:UpdataDian()
end

---初始化返回按钮
function M:InitBtnBack()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Back().gameObject, function()
        RoleCardViewModel.Close()
        MgrTimer.Cancel("RoleCardDian")
    end)
end

---初始化帮助按钮
function M:InitBtnI()
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(85)
    end))
end

---更新排序标签名称
function M:UpdateSortGroupName()
    for i, objChild in ipairs(self.tg_SortArr) do
        local tSortGroupId = self.CardScrollGroup[self.CurCardIndex].sortGroup[i]
        for k, v in pairs(objChild) do
            v.transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = self.SortGroup[tSortGroupId].name
        end
    end
end

function M:OnHide()
    self.CurTab=self.CardScrollGroup[self.CurCardIndex].scroll.curItemIndex
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("RoleCardDian")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
---初始化页面滑动按钮
function M:InitLastNextBtn()
    UIEvent.LuaClick(self.Btn_Next().gameObject,function()
        local idx = self.CardScrollGroup[self.CurCardIndex].scroll.curItemIndex
        local type = self.CardScrollGroup[self.CurCardIndex].type
        if type == 1 then
            idx = idx + 10
        else
            idx = idx + 5
        end
        idx = idx > (#self.CurLoopList - 1) and (#self.CurLoopList - 1) or idx
        self:ResetCardItem(idx,true)
    end)
    UIEvent.LuaClick(self.Btn_Last().gameObject,function()
        local idx = self.CardScrollGroup[self.CurCardIndex].scroll.curItemIndex
        if type == 1 then
            idx = idx - 10
        else
            idx = idx - 5
        end
        idx = idx < 0 and 0 or idx
        self:ResetCardItem(idx,true)
    end)
end

return M