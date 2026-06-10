-- Code Auto Create Begin
local M = Class('Blueprint_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Blueprint_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Blueprint_UI].prefab'
    self.Name = 'Form[Blueprint_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','Scroll/ImgBg',2},{'Content','Scroll/Content',2},{'NodeMap','Scroll/Content/NodeMap',2},{'ImgChip','Scroll/Content/ImgChip',2},{'ImgIcon','Scroll/Content/ImgChip/ImgIcon',2},{'SkillUnder','Scroll/Content/ImgChip/SkillUnder',2},{'ImgUnActive','Scroll/Content/ImgChip/SkillUnder/ImgUnActive',2},{'ImgActive','Scroll/Content/ImgChip/SkillUnder/ImgUnActive/ImgActive',2},{'PanelActive','Scroll/Content/ImgChip/SkillUnder/PanelActive',2},{'Img_SkillLock','Scroll/Content/ImgChip/SkillUnder/Img_SkillLock',2},{'Img_SkillUnLock','Scroll/Content/ImgChip/SkillUnder/Img_SkillUnLock',2},{'SkillAbove','Scroll/Content/ImgChip/SkillAbove',2},{'ImgUnActive01','Scroll/Content/ImgChip/SkillAbove/ImgUnActive',2},{'ImgActive01','Scroll/Content/ImgChip/SkillAbove/ImgUnActive/ImgActive',2},{'PanelActive01','Scroll/Content/ImgChip/SkillAbove/PanelActive',2},{'Img_SkillLock01','Scroll/Content/ImgChip/SkillAbove/Img_SkillLock',2},{'Img_SkillUnLock01','Scroll/Content/ImgChip/SkillAbove/Img_SkillUnLock',2},{'ImgActiveBg','ImgActiveBg',2},{'BtnTotalProp','ImgActiveBg/BtnTotalProp',2},{'BtnSelRole','BtnSelRole',2},{'BtnSelCareer','BtnSelCareer',2},{'PanelMenu','PanelMenu',2},{'BtnMenuMask','PanelMenu/BtnMenuMask',2},{'ImgMenuBg','PanelMenu/ImgMenuBg',2},{'PageCareer','PanelMenu/ImgMenuBg/PageCareer',2},{'PageRole','PanelMenu/ImgMenuBg/PageRole',2},{'CardSortPanel','PanelMenu/ImgMenuBg/PageRole/CardSortPanel',2},{'Tg_CardSort','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort',2},{'Normal','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Normal',2},{'Icon_Rise','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Normal/Icon_Rise',2},{'Btn_HighLight','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Icon_RiseDown','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseDown',2},{'Icon_RiseUp','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Btn_HighLight/Icon_RiseUp',2},{'Frame','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'BtnFilter','PanelMenu/ImgMenuBg/PageRole/BtnFilter',2},{'ToggleCareer','PanelMenu/toggles/ToggleCareer',2},{'ImgCareerNormal','PanelMenu/toggles/ToggleCareer/ImgCareerNormal',2},{'Icon','PanelMenu/toggles/ToggleCareer/ImgCareerNormal/Icon',2},{'ImgCareerSelect','PanelMenu/toggles/ToggleCareer/ImgCareerSelect',2},{'Icon01','PanelMenu/toggles/ToggleCareer/ImgCareerSelect/Icon',2},{'ToggleRole','PanelMenu/toggles/ToggleRole',2},{'ImgRoleNormal','PanelMenu/toggles/ToggleRole/ImgRoleNormal',2},{'Icon02','PanelMenu/toggles/ToggleRole/ImgRoleNormal/Icon',2},{'ImgRoleSelect','PanelMenu/toggles/ToggleRole/ImgRoleSelect',2},{'Icon03','PanelMenu/toggles/ToggleRole/ImgRoleSelect/Icon',2},{'PanelDetail','PanelDetail',2},{'BtnDetailMask','PanelDetail/BtnDetailMask',2},{'ImgDetailBg','PanelDetail/ImgDetailBg',2},{'ImgLine','PanelDetail/ImgLine',2},{'SkillContent','PanelDetail/ScrollBlueSkill/SkillContent',2},{'ImgLineCost','PanelDetail/ImgLineCost',2},{'BtnActive','PanelDetail/BtnActive',2},{'UpperBtnPanel','UpperBtnPanel',2},{'BtnBack','UpperBtnPanel/BtnBack',2},{'BtnHome','UpperBtnPanel/BtnHome',2},{'ImgLine01','UpperBtnPanel/ImgLine',2},{'BtnHelp','UpperBtnPanel/BtnHelp',2},{'BtnCoin','BtnCoin',2},{'ImgCoinIcon','BtnCoin/ImgCoinIcon',2},{'PanelTotalProp','PanelTotalProp',2},{'BtnTotalPropBg','PanelTotalProp/BtnTotalPropBg',2},{'ImgLine02','PanelTotalProp/ImgLine',2},{'ImgLIne','PanelTotalProp/ImgLIne',2},{'ImgTotalPropFg','PanelTotalProp/ImgTotalPropFg',2},{'ImgTitle','PanelTotalProp/ImgTotalPropFg/ImgTitle',2},{'ScrollTotalProp','PanelTotalProp/ImgTotalPropFg/ScrollTotalProp',2},
        -- Button 列表
        {'BtnCoin01','BtnCoin',4},
        -- UITemplate 列表
        {'BlueprintItem','Scroll/node/BlueprintItem',10},{'BlueprintCareerItemS','PanelMenu/ImgMenuBg/PageCareer/ScrollCareer/BlueprintCareerItemS',10},{'BlueprintRoleItemS','PanelMenu/ImgMenuBg/PageRole/ScrollRole/BlueprintRoleItemS',10},{'Blueprint_SkillItem','PanelDetail/ScrollBlueSkill/Blueprint_SkillItem',10},{'BlueprintCostItem','PanelDetail/ScrollCost/BlueprintCostItem',10},{'BlueprintTotalPropItem','PanelTotalProp/ImgTotalPropFg/ScrollTotalProp/BlueprintTotalPropItem',10},
        -- Toggle 列表
        {'Tg_CardSort01','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort',13},{'ToggleCareer01','PanelMenu/toggles/ToggleCareer',13},{'ToggleRole01','PanelMenu/toggles/ToggleRole',13},
        -- LoopScrollRect 列表
        {'ScrollCareer','PanelMenu/ImgMenuBg/PageCareer/ScrollCareer',18},{'ScrollRole','PanelMenu/ImgMenuBg/PageRole/ScrollRole',18},{'ScrollProperty','PanelDetail/ScrollProperty',18},{'ScrollBlueSkill','PanelDetail/ScrollBlueSkill',18},{'ScrollCost','PanelDetail/ScrollCost',18},{'ScrollTotalProp01','PanelTotalProp/ImgTotalPropFg/ScrollTotalProp',18},
        -- TextMeshProUGUI 列表
        {'TextName','Scroll/Content/ImgChip/TextName',20},{'TextActiveCount','ImgActiveBg/TextActiveCount',20},{'TextActiveTotal','ImgActiveBg/TextActiveTotal',20},{'Text','BtnSelRole/Text',20},{'Text01','BtnSelCareer/Text',20},{'Text_CN','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN01','PanelMenu/ImgMenuBg/PageRole/CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},{'TextProperty','PanelDetail/TextProperty',20},{'TextProperty01','PanelDetail/ScrollProperty/TextProperty',20},{'TextCost','PanelDetail/TextCost',20},{'TextActive','PanelDetail/BtnActive/TextActive',20},{'TextActiveTip','PanelDetail/TextActiveTip',20},{'TextTitle','UpperBtnPanel/TextTitle',20},{'TextCoinCount','BtnCoin/TextCoinCount',20},{'TextTitle01','PanelTotalProp/ImgTotalPropFg/ImgTitle/TextTitle',20},{'TextTotalPropClose','PanelTotalProp/TextTotalPropClose',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---技能图标列表
    ---@type UnityEngine.Transform[]
    self.SkillItemList = nil
    self:FillSkillIconList()
    
    -- 左上按钮
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
    -- 盾币
    local bag = ItemControl.GetAllItems();
    self.TextCoinCount().text = JNStrTool.numberAbbr(bag[100001] and bag[100001].count or 0);
    -- 创建/刷新图
    self:BuildMap();
    Event.Add("BlueprintRefresh", Handle(self, self.OnBlueprintRefresh));
    -- 呼出/隐藏列表面板
    self.PanelMenu().gameObject:SetActive(false);
    UIEvent.LuaClick(self.BtnSelCareer().gameObject, Handle(self, function()
        self.PanelMenu().gameObject:SetActive(true);
        self.ToggleCareer01().isOn = true;
        self:OnToggleCareerClicked();
    end));
    UIEvent.LuaClick(self.BtnSelRole().gameObject, Handle(self, function()
        self.PanelMenu().gameObject:SetActive(true);
        self.ToggleRole01().isOn = true;
        self:OnToggleRoleClicked();
    end));
    UIEvent.LuaClick(self.BtnMenuMask().gameObject, Handle(self, function()
        self.PanelMenu().gameObject:SetActive(false);
    end));
    -- 列表面板上的toggle
    Tools.ToggleValueChange(self.ToggleCareer01(), function(isOn)
        if isOn then
            self:OnToggleCareerClicked();
            if self.m_needRefreshCareer then
                self.m_needRefreshCareer = false;
                self:RefreshScrollCareer();
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
    -- 列表面板上的scroll
    self.ScrollCareer():SetLuaCellEvent(Handle(self, self.OnCareerItemRender));
    self.m_careers = { 11, 1, 2, 3, 4 };
    self:RefreshScrollCareer();
    self.m_needRefreshCareer = false;
    self.ScrollRole():SetLuaCellEvent(Handle(self, self.OnRoleItemRender));
    UIEvent.LuaClick(self.BtnFilter().gameObject, Handle(self, self.OnBtnFilterClicked));
    self:InitRoleSort();
    self.m_toggleSort[1].isOn= true;
    self.m_btnSortNormal[1]:SetActive(false);
    self.m_btnSortHigh[1]:SetActive(true);
    self.m_needRefreshRole = true;
    ---点击类型
    self.TouchType = nil
    ---技能ID
    self.SkillId = nil
    ---技能需要升到的等级
    self.ToSkillLv = nil
    -- 呼出/隐藏详情面板
    self.PanelDetail().gameObject:SetActive(false);
    Event.Add("BlueprintOpenDetail", Handle(self, self.OnBlueprintOpenDetail));
    UIEvent.LuaClick(self.BtnDetailMask().gameObject, Handle(self, function()
        self.PanelDetail().gameObject:SetActive(false);
    end));
    -- 升级属性列表
    self.ScrollProperty():SetLuaCellEvent(Handle(self, self.OnPropertyItemRender));
    -- 升级消耗列表
    self.ScrollCost():SetLuaCellEvent(Handle(self, self.OnCostItemRender));
    UIEvent.LuaClick(self.BtnActive().gameObject, Handle(self, self.OnBtnActiveClicked));
    -- 呼出/隐藏总属性列表
    UIEvent.LuaClick(self.ImgActiveBg().gameObject, Handle(self, function()
        self.PanelTotalProp().gameObject:SetActive(true);
        self.m_totalProps = BlueprintViewModel.GetTotalProps();
        self.ScrollTotalProp01().totalCount = #self.m_totalProps;
        self.ScrollTotalProp01():RefillCells();
    end));
    UIEvent.LuaClick(self.BtnTotalPropBg().gameObject, Handle(self, function()
        self.PanelTotalProp().gameObject:SetActive(false);
    end));
    -- 属性总览列表
    self.ScrollTotalProp01():SetLuaCellEvent(Handle(self, self.OnTotalPropItemRender));
    Event.Add("BlueprintChange", Handle(self, self.OnBlueprintChange));
    --技能属性
    self.ScrollBlueSkill():SetLuaCellEvent(Handle(self, self.SkillItem))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey));
    Event.Remove("BlueprintRefresh", Handle(self, self.OnBlueprintRefresh));
    Event.Remove("BlueprintOpenDetail", Handle(self, self.OnBlueprintOpenDetail));
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

-- x, y, 线旋转， 线长度， 表内order值
local g_configs = {
    -- 左一
    { x = -300, y = 0, rot = 0, len = 220, order = 101, },
    { x = -440, y = 140, rot = -45, len = 220, order = 102, },
    { x = -580, y = 0, rot = 0, len = 220, order = 103, },
    { x = -440, y = -140, rot = 45, len = 220, order = 104, },
    -- 左二
    { x = -760, y = 0, rot = 0, len = 220, order = 105, },
    { x = -900, y = 140, rot = -45, len = 220, order = 106, },
    { x = -1040, y = 0, rot = 0, len = 220, order = 107, },
    { x = -900, y = -140, rot = 45, len = 220, order = 108, },
    -- 左三
    { x = -1220, y = 0, rot = 0, len = 220, order = 109, },
    { x = -1360, y = 140, rot = -45, len = 220, order = 110, },
    { x = -1500, y = 0, rot = 0, len = 220, order = 111, },
    { x = -1360, y = -140, rot = 45, len = 220, order = 112, },
    -- 左二上
    { x = -1040, y = 280, rot = -45, len = 220, order = 113, },
    { x = -900, y = 420, rot = -135, len = 220, order = 114, },
    { x = -1040, y = 560, rot = -90, len = 220, order = 115, },
    { x = -1180, y = 420, rot = -45, len = 220, order = 116, },
    -- 左二下
    { x = -1040, y = -280, rot = 45, len = 220, order = 117, },
    { x = -900, y = -420, rot = 135, len = 220, order = 118, },
    { x = -1040, y = -560, rot = 90, len = 220, order = 119, },
    { x = -1180, y = -420, rot = 45, len = 220, order = 120, },    
    -- 左三上
    { x = -1500, y = 280, rot = -45, len = 220, order = 121, },
    { x = -1360, y = 420, rot = -135, len = 220, order = 122, },
    { x = -1500, y = 560, rot = -90, len = 220, order = 123, },
    { x = -1640, y = 420, rot = -45, len = 220, order = 124, },
    -- 左三下
    { x = -1500, y = -280, rot = 45, len = 220, order = 125, },
    { x = -1360, y = -420, rot = 135, len = 220, order = 126, },
    { x = -1500, y = -560, rot = 90, len = 220, order = 127, },
    { x = -1640, y = -420, rot = 45, len = 220, order = 128, },
    -- 左四
    { x = -1680, y = 0, rot = 0, len = 220, order = 129, },
    { x = -1820, y = 140, rot = -45, len = 220, order = 130, },
    { x = -1960, y = 0, rot = 0, len = 220, order = 131, },
    { x = -1820, y = -140, rot = 45, len = 220, order = 132, },
    -- 左四上
    { x = -1960, y = 280, rot = -45, len = 220, order = 133, },
    { x = -1820, y = 420, rot = -135, len = 220, order = 134, },
    { x = -1960, y = 560, rot = -90, len = 220, order = 135, },
    { x = -2100, y = 420, rot = -45, len = 220, order = 136, },
    -- 左四下
    { x = -1960, y = -280, rot = 45, len = 220, order = 137, },
    { x = -1820, y = -420, rot = 135, len = 220, order = 138, },
    { x = -1960, y = -560, rot = 90, len = 220, order = 139, },
    { x = -2100, y = -420, rot = 45, len = 220, order = 140, },
    -- 左五
    { x = -2140, y = 0, rot = 0, len = 220, order = 141, },
    { x = -2280, y = 140, rot = -45, len = 220, order = 142, },
    { x = -2420, y = 0, rot = 0, len = 220, order = 143, },
    { x = -2280, y = -140, rot = 45, len = 220, order = 144, },
    -- 左五上
    { x = -2420, y = 280, rot = -45, len = 220, order = 145, },
    { x = -2280, y = 420, rot = -135, len = 220, order = 146, },
    { x = -2420, y = 560, rot = -90, len = 220, order = 147, },
    { x = -2560, y = 420, rot = -45, len = 220, order = 148, },
    -- 左五下
    { x = -2420, y = -280, rot = 45, len = 220, order = 149, },
    { x = -2280, y = -420, rot = 135, len = 220, order = 150, },
    { x = -2420, y = -560, rot = 90, len = 220, order = 151, },
    { x = -2560, y = -420, rot = 45, len = 220, order = 152, },
    -- 左六
    { x = -2600, y = 0, rot = 0, len = 220, order = 153, },
    { x = -2740, y = 140, rot = -45, len = 220, order = 154, },
    { x = -2880, y = 0, rot = 0, len = 220, order = 155, },
    { x = -2740, y = -140, rot = 45, len = 220, order = 156, },
    -- 左六上
    { x = -2880, y = 280, rot = -45, len = 220, order = 157, },
    { x = -2740, y = 420, rot = -135, len = 220, order = 158, },
    { x = -2880, y = 560, rot = -90, len = 220, order = 159, },
    { x = -3020, y = 420, rot = -45, len = 220, order = 160, },
    -- 左六下
    { x = -2880, y = -280, rot = 45, len = 220, order = 161, },
    { x = -2740, y = -420, rot = 135, len = 220, order = 162, },
    { x = -2880, y = -560, rot = 90, len = 220, order = 163, },
    { x = -3020, y = -420, rot = 45, len = 220, order = 164, },
    -- 左七
    { x = -3060, y = 0, rot = 0, len = 220, order = 165, },
    { x = -3200, y = 140, rot = -45, len = 220, order = 166, },
    { x = -3340, y = 0, rot = 0, len = 220, order = 167, },
    { x = -3200, y = -140, rot = 45, len = 220, order = 168, },
    -- 左七上 (逆时针 下右上左)
    { x = -3340, y = 280, rot = -45, len = 220, order = 169, },
    { x = -3200, y = 420, rot = -135, len = 220, order = 170, },
    { x = -3340, y = 560, rot = -90, len = 220, order = 172, },
    { x = -3480, y = 420, rot = -45, len = 220, order = 171, },
    -- 左七下 (顺时针 上右下左)
    { x = -3340, y = -280, rot = 45, len = 220, order = 177, },
    { x = -3200, y = -420, rot = 135, len = 220, order = 179, },
    { x = -3340, y = -560, rot = 90, len = 220, order = 180, },
    { x = -3480, y = -420, rot = 45, len = 220, order = 178, },
    -- 左八 (逆时针 右上左下)
    { x = -3520, y = 0, rot = 0, len = 220, order = 173, },
    { x = -3660, y = 140, rot = -45, len = 220, order = 174, },
    { x = -3800, y = 0, rot = 0, len = 220, order = 176, },
    { x = -3660, y = -140, rot = 45, len = 220, order = 175, },
    -- 右一
    { x = 300, y = 0, rot = 180, len = 220, order = 201, },
    { x = 440, y = 140, rot = -135, len = 220, order = 202, },
    { x = 580, y = 0, rot = 180, len = 220, order = 203, },
    { x = 440, y = -140, rot = 135, len = 220, order = 204, },
    -- 右二
    { x = 760, y = 0, rot = 180, len = 220, order = 205, },
    { x = 900, y = 140, rot = -135, len = 220, order = 206, },
    { x = 1040, y = 0, rot = 180, len = 220, order = 207, },
    { x = 900, y = -140, rot = 135, len = 220, order = 208, },
    -- 右三
    { x = 1220, y = 0, rot = 180, len = 220, order = 209, },
    { x = 1360, y = 140, rot = -135, len = 220, order = 210, },
    { x = 1500, y = 0, rot = 180, len = 220, order = 211, },
    { x = 1360, y = -140, rot = 135, len = 220, order = 212, },
    -- 右二上
    { x = 1040, y = 280, rot = -135, len = 220, order = 213, },
    { x = 900, y = 420, rot = -45, len = 220, order = 214, },
    { x = 1040, y = 560, rot = -90, len = 220, order = 215, },
    { x = 1180, y = 420, rot = -135, len = 220, order = 216, },
    -- 右二下
    { x = 1040, y = -280, rot = 135, len = 220, order = 217, },
    { x = 900, y = -420, rot = 45, len = 220, order = 218, },
    { x = 1040, y = -560, rot = 90, len = 220, order = 219, },
    { x = 1180, y = -420, rot = 135, len = 220, order = 220, },
    -- 右三上
    { x = 1500, y = 280, rot = -135, len = 220, order = 221, },
    { x = 1360, y = 420, rot = -45, len = 220, order = 222, },
    { x = 1500, y = 560, rot = -90, len = 220, order = 223, },
    { x = 1640, y = 420, rot = -135, len = 220, order = 224, },
    -- 右三下
    { x = 1500, y = -280, rot = 135, len = 220, order = 225, },
    { x = 1360, y = -420, rot = 45, len = 220, order = 226, },
    { x = 1500, y = -560, rot = 90, len = 220, order = 227, },
    { x = 1640, y = -420, rot = 135, len = 220, order = 228, },
    -- 右四
    { x = 1680, y = 0, rot = 180, len = 220, order = 229, },
    { x = 1820, y = 140, rot = -135, len = 220, order = 230, },
    { x = 1960, y = 0, rot = 180, len = 220, order = 231, },
    { x = 1820, y = -140, rot = 135, len = 220, order = 232, },
    -- 右四上
    { x = 1960, y = 280, rot = -135, len = 220, order = 233, },
    { x = 1820, y = 420, rot = -45, len = 220, order = 234, },
    { x = 1960, y = 560, rot = -90, len = 220, order = 235, },
    { x = 2100, y = 420, rot = -135, len = 220, order = 236, },
    -- 右四下
    { x = 1960, y = -280, rot = 135, len = 220, order = 237, },
    { x = 1820, y = -420, rot = 45, len = 220, order = 238, },
    { x = 1960, y = -560, rot = 90, len = 220, order = 239, },
    { x = 2100, y = -420, rot = 135, len = 220, order = 240, },
    -- 右五
    { x = 2140, y = 0, rot = 180, len = 220, order = 241, },
    { x = 2280, y = 140, rot = -135, len = 220, order = 242, },
    { x = 2420, y = 0, rot = 180, len = 220, order = 243, },
    { x = 2280, y = -140, rot = 135, len = 220, order = 244, },
    -- 右五上
    { x = 2420, y = 280, rot = -135, len = 220, order = 245, },
    { x = 2280, y = 420, rot = -45, len = 220, order = 246, },
    { x = 2420, y = 560, rot = -90, len = 220, order = 247, },
    { x = 2560, y = 420, rot = -135, len = 220, order = 248, },
    -- 右五下
    { x = 2420, y = -280, rot = 135, len = 220, order = 249, },
    { x = 2280, y = -420, rot = 45, len = 220, order = 250, },
    { x = 2420, y = -560, rot = 90, len = 220, order = 251, },
    { x = 2560, y = -420, rot = 135, len = 220, order = 252, },
    -- 右六
    { x = 2600, y = 0, rot = 180, len = 220, order = 253, },
    { x = 2740, y = 140, rot = -135, len = 220, order = 254, },
    { x = 2880, y = 0, rot = 180, len = 220, order = 255, },
    { x = 2740, y = -140, rot = 135, len = 220, order = 256, },
    -- 右六上
    { x = 2880, y = 280, rot = -135, len = 220, order = 257, },
    { x = 2740, y = 420, rot = -45, len = 220, order = 258, },
    { x = 2880, y = 560, rot = -90, len = 220, order = 259, },
    { x = 3020, y = 420, rot = -135, len = 220, order = 260, },
    -- 右六下
    { x = 2880, y = -280, rot = 135, len = 220, order = 261, },
    { x = 2740, y = -420, rot = 45, len = 220, order = 262, },
    { x = 2880, y = -560, rot = 90, len = 220, order = 263, },
    { x = 3020, y = -420, rot = 135, len = 220, order = 264, },
    -- 右七
    { x = 3060, y = 0, rot = 180, len = 220, order = 265, },
    { x = 3200, y = 140, rot = -135, len = 220, order = 266, },
    { x = 3340, y = 0, rot = 180, len = 220, order = 267, },
    { x = 3200, y = -140, rot = 135, len = 220, order = 268, },
    -- 右七上 (顺时针 下左上右)
    { x = 3340, y = 280, rot = -135, len = 220, order = 269, },
    { x = 3200, y = 420, rot = -45, len = 220, order = 270, },
    { x = 3340, y = 560, rot = -90, len = 220, order = 272, },
    { x = 3480, y = 420, rot = -135, len = 220, order = 271, },
    -- 右七下 (逆时针 上左下右)
    { x = 3340, y = -280, rot = 135, len = 220, order = 277, },
    { x = 3200, y = -420, rot = 45, len = 220, order = 278, },
    { x = 3340, y = -560, rot = 90, len = 220, order = 280, },
    { x = 3480, y = -420, rot = 135, len = 220, order = 279, },
    -- 右八 (逆时针 左上右下)
    { x = 3520, y = 0, rot = 180, len = 220, order = 273, },
    { x = 3660, y = 140, rot = -135, len = 220, order = 274, },
    { x = 3800, y = 0, rot = 180, len = 220, order = 275, },
    { x = 3660, y = -140, rot = 135, len = 220, order = 276, },
}
function M:BuildMap()
    -- 创建图
    self.m_items = {};
    for i = #g_configs, 1, -1 do
        local conf = g_configs[i];
        local obj = GameObject.Instantiate(self.BlueprintItem().gameObject, self.NodeMap().transform);
        obj.gameObject:SetActive(true);
        obj.gameObject.transform.localPosition = Vector3(conf.x, conf.y, 0);
        local item = obj.gameObject:GetComponent("UITemplate");
        table.insert(self.m_items, item);
    end
    self:RefreshMap();
end

function M:OnBlueprintRefresh()
    self.PanelMenu().gameObject:SetActive(false);
    self:RefreshMap();
end

function M:RefreshMap()
    -- 刷新图
    local activePaths = {
        [1] = "Blueprint/btn_blueprint_fangwei_s",
        [2] = "Blueprint/btn_blueprint_gongji_s",
        [3] = "Blueprint/btn_blueprint_huoli_s",
        [4] = "Blueprint/btn_blueprint_zhiyuan_s",
        [11] = "Blueprint/btn_blueprint_chaoyue_s",
    };
    if 1 == BlueprintViewModel.CurType() then
        -- 职业
        local bgPaths = {
            [1] = "Blueprint/icon_fangwei_chip",
            [2] = "Blueprint/icon_gongji_chip",
            [3] = "Blueprint/icon_huoli_chip",
            [4] = "Blueprint/icon_zhiyuan_chip",
            [11] = "Blueprint/icon_chaoyue_chip",
        }
        local career = BlueprintViewModel.CurCareer();
        MgrRes.LoadSprite(self.ImgIcon(), bgPaths[career]);
        local careerLan = {
            [1] = "ui_tongyong_text207",
            [2] = "ui_tongyong_text24",
            [3] = "ui_tongyong_text208",
            [4] = "ui_tongyong_text141",
            [11] = "ui_tongyong_text256",
        }
        self.TextName().text = string.format(MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_09"), MgrLanguageData.GetLanguageByKey(careerLan[career]));
        MgrRes.LoadSprite(self.ImgActiveBg(), activePaths[career]);
        --self.TextActiveTotal().text = "/" .. BlueprintViewModel.GetCareerTotalPoint(career);
        --self.TextActiveCount().text = BlueprintViewModel.GetCareerPoint(career);
        self.TextActiveTotal().text = string.format("<color=#FFFFFF>%d</color>/%d",BlueprintViewModel.GetCareerPoint(career),BlueprintViewModel.GetCareerTotalPoint(career))
    elseif 2 == BlueprintViewModel.CurType() then
        -- 角色
        local heroData = RoleCardViewModel.GetHeroByID(BlueprintViewModel.CurRoleId());
        MgrRes.LoadQIcon(self.ImgIcon(), heroData.skin);
        self.TextName().text = string.format(MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_09"), heroData.name);
        MgrRes.LoadSprite(self.ImgActiveBg(), activePaths[heroData.career]);
        self.TextActiveTotal().text = string.format("<color=#FFFFFF>%d</color>/%d",BlueprintViewModel.GetRolePoint(heroData.id),BlueprintViewModel.GetRoleTotalPoint(heroData.id))
        --self.TextActiveCount().text = BlueprintViewModel.GetRolePoint(heroData.id);
    end
    for i, item in pairs(self.m_items) do
        local conf = g_configs[#g_configs - i + 1];
        item:SetData({ conf.rot, conf.len, conf.order, });
    end
    --技能刷新
    self:RefreshSkill(BlueprintViewModel.CurType())
end

function M:OnToggleCareerClicked()
    -- 切到职业列表
    self.ImgCareerNormal().gameObject:SetActive(false);
    self.ImgCareerSelect().gameObject:SetActive(true);
    self.ImgRoleNormal().gameObject:SetActive(true);
    self.ImgRoleSelect().gameObject:SetActive(false);
    self.PageCareer().gameObject:SetActive(true);
    self.PageRole().gameObject:SetActive(false);
end

function M:OnToggleRoleClicked()
    -- 切到角色列表
    self.ImgCareerNormal().gameObject:SetActive(true);
    self.ImgCareerSelect().gameObject:SetActive(false);
    self.ImgRoleNormal().gameObject:SetActive(false);
    self.ImgRoleSelect().gameObject:SetActive(true);
    self.PageCareer().gameObject:SetActive(false);
    self.PageRole().gameObject:SetActive(true);
end

function M:OnCareerItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_careers[idx], idx});
end

function M:OnRoleItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_roles[idx], idx});
end

function M:OnBtnFilterClicked()
    -- 角色筛选
    MgrUI.Pop(UID.SortFilterPop_UI,{ Handle(self, self.FilterCallBack), 2, {self.m_roleFilter,self.m_roleSortType,self.m_roleSortDown}},true);
end

function M:InitRoleSort()
    -- 角色排序
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
    self.ScrollCareer().totalCount = #self.m_careers;
    self.ScrollCareer():RefillCells();    
end

function M:RefreshScrollRole()
    -- 刷新角色列表
    self.m_roles = BlueprintViewModel.GetRoles(self.m_roleFilter, self.m_roleSortType, self.m_roleSortDown);
    self.ScrollRole().totalCount = #self.m_roles;
    self.ScrollRole():RefillCells();
end

function M:OnBlueprintOpenDetail(conf, data)
    self.TouchType = "attribute"
    self.PanelDetail().gameObject:SetActive(true);
    self.m_detailConf = conf;
    self.m_detailData = data;
    self:RefreshDetail();
end

function M:RefreshDetail()
    self.ScrollProperty().gameObject:SetActive(true)
    self.ScrollBlueSkill().gameObject:SetActive(false)
    self.ScrollProperty().totalCount = 1;
    self.ScrollProperty():RefillCells();
    if nil ~= self.m_detailData and self.m_detailData.level >= self.m_detailConf.max then
        -- 升满了
        self.TextCost().gameObject:SetActive(false);
        self.ImgLineCost().gameObject:SetActive(false);
        self.ScrollCost().gameObject:SetActive(false);
        self.BtnActive().gameObject:SetActive(false);
        self.TextActiveTip().gameObject:SetActive(true);
        self.TextActiveTip().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_06");
    else
        -- 没升满
        self.TextCost().gameObject:SetActive(true);
        self.ImgLineCost().gameObject:SetActive(true);
        self.ScrollCost().gameObject:SetActive(true);
        local levelCosts = string.split(self.m_detailConf.use, ";");
        self.m_activeCosts = nil;
        if nil == self.m_detailData or self.m_detailData.level < 1 then
            self.m_activeCosts = string.split(levelCosts[1], ",");
        else
            self.m_activeCosts = string.split(levelCosts[self.m_detailData.level + 1], ",");
        end
        self.ScrollCost().totalCount = #self.m_activeCosts;
        self.ScrollCost():RefillCells();

        local canActive = false;
        if 0 == self.m_detailConf.front then
            canActive = true;
        else
            local frontData = BlueprintViewModel.GetDataByID(self.m_detailConf.front);
            if nil ~= frontData and frontData.level >= self.m_detailConf.frontlevel then
                canActive = true;
            end
        end
        if true == canActive then
            -- 可激活
            self.BtnActive().gameObject:SetActive(true);
            self.TextActiveTip().gameObject:SetActive(false);
            self.TextActive().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_05")
        else
            -- 不可激活
            self.BtnActive().gameObject:SetActive(false);
            self.TextActiveTip().gameObject:SetActive(true);
            self.TextActiveTip().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_11");
        end
    end
end

function M:OnPropertyItemRender(trans, idx)
    -- 属性列表项
    local descs = string.split(self.m_detailConf.desc, ";");
    if nil == self.m_detailData or self.m_detailData.level < 1 then
        trans:GetComponent("TextMeshProUGUI").text = descs[1];
    else
        trans:GetComponent("TextMeshProUGUI").text = descs[self.m_detailData.level + 1];
    end
end

function M:OnCostItemRender(trans, idx)
    -- 升级消耗列表项
    trans:GetComponent("UITemplate"):SetData({self.m_activeCosts[idx], idx});
end

function M:OnBtnActiveClicked()
    if self.TouchType == "attribute" then
        local level = 1;
        if nil ~= self.m_detailData then
            level = self.m_detailData.level + 1;
        end
        BlueprintViewModel.SendUpgradeBluePrintNodeReq(self.m_detailConf.id, level, function()
            local bag = ItemControl.GetAllItems();
            self.TextCoinCount().text = JNStrTool.numberAbbr(bag[100001] and bag[100001].count or 0);
            self:RefreshMap();
            local order = self.m_detailConf.order;
            self.m_detailConf = BlueprintViewModel.GetConfByOrder(order);
            self.m_detailData = BlueprintViewModel.GetDataByOrder(order);
            self:RefreshDetail();
        end);
    elseif self.TouchType == "skill" then
        local tTarget = nil
        if 2 == BlueprintViewModel.CurType() then
            tTarget = BlueprintViewModel.CurRoleId()
        end
        BlueprintViewModel.SendUpgradeBluePrintSkillReq(self.SkillId,self.ToSkillLv,tTarget,function(tab)
            --self:RefreshSkill(BlueprintViewModel.CurType())
            local heroData = RoleCardViewModel.GetHeroByID(tab.ID)
            local skillType = heroData~=nil and heroData.BlueprintGroup or tab.ID
            local skillList = BlueprintViewModel.GetBlueSkillByType(skillType)
            self:HideSkillIcons()
            if skillList then
                for i, v in ipairs(skillList) do
                    local skillIcon = self.SkillItemList[i]
                    if skillIcon == nil then
                        return
                    end
                    --技能图标
                    local tSkillStr = string.split(v.skill,';')
                    local tStr = string.split(tSkillStr[1],'@')
                    local tSkillData = SkillLocalData.tab[tonumber(tStr[1])]
                    if tSkillData then
                        skillIcon.gameObject:SetActive(true)
                        self:LoadSkillIconSprite(self.SkillItemList[i], "Skill/" .. tSkillData[13])
                    end
                    self:RefreshSkillDetail(v,skillType,i)
                end
            end
        end)
    end
end

function M:OnTotalPropItemRender(trans, idx)
    -- 属性总览列表项
    trans:GetComponent("UITemplate"):SetData({self.m_totalProps[idx], idx});
end
---技能刷新
function M:RefreshSkill(_curType)
    self:HideSkillIcons()
    if _curType ~= 1 then
        return
    end
    
    local skillType = BlueprintViewModel.CurCareer()
    local skillList = BlueprintViewModel.GetBlueSkillByType(skillType)

    for i, v in ipairs(skillList) do
        local skillIcon = self.SkillItemList[i]
        if Global.IsNil(skillIcon) then
            UnityEngine.DebugEx.LogError(string.format("蓝图技能数量超出蓝图图标数量(%d)", #self.SkillItemList))
            break
        end
        
        local tSkillLv = BlueprintViewModel.GetBlueSkillLv(skillType, v.order)
        --技能图标
        local tSkillStr = string.split(v.skill,';')
        local tStr = string.split(tSkillStr[1],'@')
        local tSkillData = SkillLocalData.tab[tonumber(tStr[1])]
        if tSkillData then
            skillIcon.gameObject:SetActive(true)
            self:LoadSkillIconSprite(skillIcon, "Skill/" .. tSkillData[13])
        end
        --技能详情按钮
        UIEvent.LuaClick(skillIcon.gameObject, function()
            self.PanelDetail().gameObject:SetActive(true)
            self:RefreshSkillDetail(v,skillType,i)
        end)
        
        self:RefreshSkillIconLock(skillIcon, tSkillLv <= 0)
        -- 等级点点
        self:RefreshSkillIconLevel(skillIcon, tSkillLv, #tSkillStr)
    end
end
---@param _skillData CareerBlueprintSkillLocalData
function M:RefreshSkillDetail(_skillData,_type,_idx)
    self.ScrollProperty().gameObject:SetActive(false)
    self.ScrollBlueSkill().gameObject:SetActive(true)
    self.TouchType = "skill"
    self.SkillId = _skillData.id
    
    local tSkillStr = string.split(_skillData.skill,';')
    local tSkillLv = BlueprintViewModel.GetBlueSkillLv(_type, _skillData.order)
    local bSkillLock = true
    
    --技能升级状态
    if tSkillLv >= #tSkillStr then
        -- 升满了
        tSkillLv = #tSkillStr
        self.ToSkillLv = tSkillLv
        self.TextCost().gameObject:SetActive(false);
        self.ImgLineCost().gameObject:SetActive(false);
        self.ScrollCost().gameObject:SetActive(false);
        self.BtnActive().gameObject:SetActive(false);
        self.TextActiveTip().gameObject:SetActive(true);
        self.TextActiveTip().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_06");
        bSkillLock = false
    else
        -- 没升满
        self.ToSkillLv = tSkillLv + 1
        self.TextCost().gameObject:SetActive(true);
        self.ImgLineCost().gameObject:SetActive(true);
        self.ScrollCost().gameObject:SetActive(true);
        local levelCosts = string.split(_skillData.use, ";");
        self.m_activeCosts = string.split(levelCosts[tSkillLv + 1], ",");
        
        self.ScrollCost().totalCount = #self.m_activeCosts;
        self.ScrollCost():RefillCells();

        local tCurNodeCount = BlueprintViewModel.GetCareerPoint(_skillData.type)
        local canActive = false
        if 0 == tSkillLv and tCurNodeCount >= _skillData.frontnum then
            canActive = true
            self.TextActive().text = MgrLanguageData.GetLanguageByKey("ui_Blueprint_text_05")
        elseif tSkillLv > 0 then
            canActive = true
            self.TextActive().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text15")
            bSkillLock = false
        end
        if true == canActive then
            -- 可激活
            self.BtnActive().gameObject:SetActive(true);
            self.TextActiveTip().gameObject:SetActive(false);
        else
            -- 不可激活
            self.BtnActive().gameObject:SetActive(false);
            self.TextActiveTip().gameObject:SetActive(true);
            self.TextActiveTip().text = string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text278"), _skillData.frontnum)
            bSkillLock = true
        end
    end
    
    local skillIcon = self.SkillItemList[_idx]
    self:RefreshSkillIconLock(skillIcon, bSkillLock)
    -- 等级点点
    self:RefreshSkillIconLevel(skillIcon, tSkillLv, #tSkillStr)
    
    local tNextSkillLv = tSkillLv+1 > #tSkillStr and #tSkillStr or tSkillLv+1
    local tCurSkill = tSkillStr[tNextSkillLv]
    self.SkillList = tCurSkill~=nil and string.split(tCurSkill,'@') or {}
    self.ScrollBlueSkill().totalCount = #self.SkillList
    self.ScrollBlueSkill():RefillCells()
end

-- 技能详情中的技能属性
function M:SkillItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.SkillList[idx] })
    Tools.ReContentSizeGroup(self.SkillContent().gameObject)
end

--region 技能图标操作

---@protected
function M:FillSkillIconList()
    self.SkillItemList = {}
    if self.SkillUnder() then
        table.insert(self.SkillItemList, self.SkillUnder().transform)
    end
    if self.SkillAbove() then
        table.insert(self.SkillItemList, self.SkillAbove().transform)
    end
end

function M:HideSkillIcons()
    for i, v in ipairs(self.SkillItemList) do
        v.gameObject:SetActive(false)
    end
end

---@protected
---@param iconRoot UnityEngine.Transform
---@param spritePath string
function M:LoadSkillIconSprite(iconRoot, spritePath)
    local f_LoadInImg = function(name) 
        local tr = iconRoot:Find(name)
        if not Global.IsNil(tr) then
            local img = tr:GetComponent("Image")
            if not Global.IsNil(img) then
                MgrRes.LoadSprite(img, spritePath)
            end
        end
    end

    f_LoadInImg("Img_SkillLock")
    f_LoadInImg("Img_SkillUnLock")
end

---@protected
---@param root UnityEngine.Transform
---@param bLock boolean
function M:RefreshSkillIconLock(root, bLock)
    local lockTr = root:Find("Img_SkillLock")
    local unlockTr = root:Find("Img_SkillUnLock")
    if not Global.IsNil(lockTr) then
        lockTr.gameObject:SetActive(bLock)
    end
    if not Global.IsNil(unlockTr) then
        unlockTr.gameObject:SetActive(not bLock)
    end
end

---@protected
---@param root UnityEngine.Transform
---@param level int
---@param maxLevel int
function M:RefreshSkillIconLevel(root, level, maxLevel)
    local starPrefab = root:Find("ImgUnActive")
    local levelStarRoot = root:Find("PanelActive")
    if Global.IsNil(starPrefab) then
        UnityEngine.DebugEx.LogError("蓝图图标没有等级星星预制体")
        return
    end
    if Global.IsNil(levelStarRoot) then
        UnityEngine.DebugEx.LogError("蓝图图标没有等级星星根")
        return
    end
    
    Tools.ClearAllChild(levelStarRoot.gameObject)
    if level <= 0 then
        return
    end

    for i = 1, maxLevel do
        local starGo = GameObject.Instantiate(starPrefab.gameObject, levelStarRoot, false)
        starGo:SetActive(true)
        local activeTr = starGo.transform:Find("ImgActive")
        if not Global.IsNil(activeTr) then
            activeTr.gameObject:SetActive(i <= level)
        end
    end
end

--endregion 技能图标操作


return M