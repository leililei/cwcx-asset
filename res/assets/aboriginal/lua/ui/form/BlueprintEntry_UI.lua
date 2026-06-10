-- Code Auto Create Begin
local M = Class('BlueprintEntry_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BlueprintEntry_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BlueprintEntry_UI].prefab'
    self.Name = 'Form[BlueprintEntry_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','ImgBg',2},{'PageCareer','PageCareer',2},{'ScrollCareer','PageCareer/ScrollCareer',2},{'PageRole','PageRole',2},{'ScrollRole','PageRole/ScrollRole',2},{'RightTop','PageRole/RightTop',2},{'CardSortPanel','PageRole/RightTop/CardSortPanel',2},{'Tg_CardSort','PageRole/RightTop/CardSortPanel/Tg_CardSort',2},{'Normal','PageRole/RightTop/CardSortPanel/Tg_CardSort/Normal',2},{'Icon_Rise','PageRole/RightTop/CardSortPanel/Tg_CardSort/Normal/Icon_Rise',2},{'Btn_HighLight','PageRole/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Icon_RiseDown','PageRole/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseDown',2},{'Icon_RiseUp','PageRole/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseUp',2},{'Frame','PageRole/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'BtnFilter','PageRole/RightTop/BtnFilter',2},{'ToggleCareer','toggles/ToggleCareer',2},{'ImgCareerNormal','toggles/ToggleCareer/ImgCareerNormal',2},{'Icon','toggles/ToggleCareer/ImgCareerNormal/Icon',2},{'ImgCareerSelect','toggles/ToggleCareer/ImgCareerSelect',2},{'Icon01','toggles/ToggleCareer/ImgCareerSelect/Icon',2},{'ToggleRole','toggles/ToggleRole',2},{'ImgRoleNormal','toggles/ToggleRole/ImgRoleNormal',2},{'Icon02','toggles/ToggleRole/ImgRoleNormal/Icon',2},{'ImgRoleSelect','toggles/ToggleRole/ImgRoleSelect',2},{'Icon03','toggles/ToggleRole/ImgRoleSelect/Icon',2},{'UpperBtnPanel','UpperBtnPanel',2},{'BtnBack','UpperBtnPanel/BtnBack',2},{'BtnHome','UpperBtnPanel/BtnHome',2},{'ImgLine','UpperBtnPanel/ImgLine',2},{'BtnHelp','UpperBtnPanel/BtnHelp',2},
        -- UITemplate 列表
        {'BlueprintCareerItem','PageCareer/ScrollCareer/BlueprintCareerItem',10},{'BlueprintRoleItem','PageRole/ScrollRole/BlueprintRoleItem',10},
        -- Toggle 列表
        {'Tg_CardSort01','PageRole/RightTop/CardSortPanel/Tg_CardSort',13},{'ToggleCareer01','toggles/ToggleCareer',13},{'ToggleRole01','toggles/ToggleRole',13},
        -- RawImage 列表
        {'RoleContent','PageRole/ScrollRole/RoleContent',15},{'BlueprintRoleItem01','PageRole/ScrollRole/BlueprintRoleItem',15},
        -- LoopScrollRect 列表
        {'ScrollCareer01','PageCareer/ScrollCareer',18},{'ScrollRole01','PageRole/ScrollRole',18},
        -- TextMeshProUGUI 列表
        {'Text_CN','PageRole/RightTop/CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN01','PageRole/RightTop/CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},{'TextTitle','UpperBtnPanel/TextTitle',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey));
    UIEvent.LuaClick(self.BtnBack().gameObject, function()
        MgrUI.GoBack();
    end);
    UIEvent.LuaClick(self.BtnHome().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI);
    end);
    UIEvent.LuaClick(self.BtnHelp().gameObject, function()
        HelpViewModel.Go(117);
    end);
    
    Tools.ToggleValueChange(self.ToggleCareer01(), function(isOn)
        if isOn then
            self:OnToggleCareerClicked();
            if self.m_needRefreshCareer then
                self.m_needRefreshCareer = false;
                self:RefreshScrollRole();
            end
        end
    end);
    Tools.ToggleValueChange(self.ToggleRole01(), function(isOn)
        if isOn then
            self:OnToggleRoleClicked();
            if self.m_needRefreshRole then
                self.m_needRefreshRole = false;
                self:RefreshScrollRole();
            end
        end
    end);
    self.ToggleCareer01().isOn = true;
    self:OnToggleCareerClicked();

    self.ScrollCareer01():SetLuaCellEvent(Handle(self, self.OnCareerItemRender));
    self.m_careers = { 11, 1, 2, 3, 4 };
    self:RefreshScrollCareer();
    self.m_needRefreshCareer = false;

    self.ScrollRole01():SetLuaCellEvent(Handle(self, self.OnRoleItemRender));
    UIEvent.LuaClick(self.BtnFilter().gameObject, Handle(self, self.OnBtnFilterClicked));
    self:InitRoleSort();
    self.m_toggleSort[1].isOn= true;
    self.m_btnSortNormal[1]:SetActive(false);
    self.m_btnSortHigh[1]:SetActive(true);
    self.m_needRefreshRole = true;
    Event.Add("BlueprintChange", Handle(self, self.OnBlueprintChange));
end

function M:OnToggleCareerClicked()
    self.ImgCareerNormal().gameObject:SetActive(false);
    self.ImgCareerSelect().gameObject:SetActive(true);
    self.ImgRoleNormal().gameObject:SetActive(true);
    self.ImgRoleSelect().gameObject:SetActive(false);
    self.PageCareer().gameObject:SetActive(true);
    self.PageRole().gameObject:SetActive(false);
end

function M:OnToggleRoleClicked()
    self.ImgCareerNormal().gameObject:SetActive(true);
    self.ImgCareerSelect().gameObject:SetActive(false);
    self.ImgRoleNormal().gameObject:SetActive(false);
    self.ImgRoleSelect().gameObject:SetActive(true);
    self.PageCareer().gameObject:SetActive(false);
    self.PageRole().gameObject:SetActive(true);
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey));
    Event.Remove("BlueprintChange", Handle(self, self.OnBlueprintChange));
end

function M:OnBlueprintChange()
    if self.PageCareer().gameObject.activeSelf then
        self:RefreshScrollCareer();
    else
        self.m_needRefreshCareer = true;
    end
    if self.PageRole().gameObject.activeSelf then
        self:RefreshScrollRole();
    else
        self.m_needRefreshRole = true;
    end
end

function M:OnCareerItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_careers[idx], idx});
end

function M:OnRoleItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_roles[idx], idx});
end

function M:OnBtnFilterClicked()
    MgrUI.Pop(UID.SortFilterPop_UI,{ Handle(self, self.FilterCallBack), 2, {self.m_roleFilter,self.m_roleSortType,self.m_roleSortDown}},true);
end

function M:InitRoleSort()
    self.m_roleFilter = {      ---当前筛选类型true为开启项(0全部，1防御，2攻击，3火力，4支援)
       [0] = true,
       [1] = false,
       [2] = false,
       [3] = false,
       [4] = false,
       [11] = false
    }
    self.m_roleSortType = 1;        ---当前排序类型(1等级，2星级，3稀有度)
    self.m_roleSortDown = true;    ---当前升降序(true升序，false降序)
    local toggleName = {
        [1] = MgrLanguageData.GetLanguageByKey("bag_ui_core_level"),
        [2] = MgrLanguageData.GetLanguageByKey("bag_ui_core_starlevel"),
        [3] = MgrLanguageData.GetLanguageByKey("changerolecorepop_ui_quality")
    }
    self.m_btnSortNormal = {}
    self.m_btnSortHigh = {}
    self.m_btnSortDown = {}
    self.m_btnSortUp = {}
    self.m_toggleSort= {}
    for type, name in ipairs(toggleName) do
        local obj = GameObject.Instantiate(self.Tg_CardSort().gameObject,self.CardSortPanel().gameObject.transform,false)
        self.m_btnSortNormal[type] = obj.transform:Find("Normal").gameObject;
        self.m_btnSortNormal[type].transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = name
        self.m_btnSortHigh[type] = obj.transform:Find("Btn_HighLight").gameObject;
        self.m_btnSortHigh[type].transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = name
        self.m_btnSortHigh[type]:SetActive(false)
        self.m_btnSortDown[type] = self.m_btnSortHigh[type].transform:Find("Icon_RiseDown").gameObject;
        self.m_btnSortUp[type] = self.m_btnSortHigh[type].transform:Find("Icon_RiseUp").gameObject;
        self.m_btnSortUp[type]:SetActive(false)
        self.m_toggleSort[type] = obj:GetComponent("Toggle")
        ---排序点击
        Tools.ToggleValueChange(self.m_toggleSort[type],Handle(self, function(self,isOn)
            ---排序状态
            self.m_btnSortNormal[type]:SetActive(not isOn)
            self.m_btnSortHigh[type]:SetActive(isOn)
            if isOn then
                ---升降序状态
                if self.m_roleSortDown then
                    self.m_btnSortDown[type]:SetActive(true)
                    self.m_btnSortUp[type]:SetActive(false)
                else
                    self.m_btnSortDown[type]:SetActive(false)
                    self.m_btnSortUp[type]:SetActive(true)
                end
                self.m_roleSortType = type
                self:RefreshScrollRole()
            end
        end),nil)
        ---升降序点击
        UIEvent.LuaClick(self.m_btnSortHigh[type], Handle(self,function(self)
            self.m_btnSortDown[type]:SetActive(not self.m_btnSortDown[type].activeSelf)
            self.m_btnSortUp[type]:SetActive(not self.m_btnSortUp[type].activeSelf)
            self.m_roleSortDown = not self.m_roleSortDown
            self:RefreshScrollRole()
        end))
    end
    ---隐藏预制
    self.Tg_CardSort().gameObject:SetActive(false)
end

function M:FilterCallBack(filter,sort,rise)

    local allFalse = true
    for _, v in pairs(filter) do
        if v == true then
            allFalse = false
        end
    end
    if allFalse then
        filter[0] = true
    end

    for i, v in pairs(self.m_btnSortNormal) do
        v:SetActive(true)
    end
    for i, v in pairs(self.m_btnSortHigh) do
        v:SetActive(false)
    end
    ---更新角色界面存在的排序状态
    if self.m_btnSortNormal[sort] then
        self.m_toggleSort[sort].isOn= true
        self.m_btnSortNormal[sort]:SetActive(false)
        self.m_btnSortHigh[sort]:SetActive(true)
        self.m_btnSortDown[sort]:SetActive(rise)
        self.m_btnSortUp[sort]:SetActive(not rise)
    end
    ---设置排序筛选升降序属性
    self.m_roleFilter = filter
    self.m_roleSortType = sort
    self.m_roleSortDown = rise
    ---更新并刷新到顶部
    self:RefreshScrollRole();
end

function M:RefreshScrollCareer()
    self.ScrollCareer01().totalCount = #self.m_careers;
    self.ScrollCareer01():RefillCells();
end

function M:RefreshScrollRole()
    self.m_roles = BlueprintViewModel.GetRoles(self.m_roleFilter, self.m_roleSortType, self.m_roleSortDown);
    self.ScrollRole01().totalCount = #self.m_roles;
    self.ScrollRole01():RefillCells();
end

return M