-- Code Auto Create Begin
local M = Class('ArtRoleSkin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ArtRoleSkin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ArtRoleSkin_UI].prefab'
    self.Name = 'Form[ArtRoleSkin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_ReturnInfo','UpperLeftPanel/Btn_ReturnBg/Btn_ReturnInfo',2},{'Btn_ReturnHome','UpperLeftPanel/Btn_ReturnBg/Btn_ReturnHome',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'SkinToggle','SwitchPanel/SwitchScroll/SkinToggle',2},{'Btn_Suo','SwitchPanel/SwitchScroll/SkinToggle/Btn_Suo',2},{'Img_Qieyedian','SwitchPanel/SwitchScroll/SkinToggle/Btn_Suo/Img_Qieyedian',2},{'Img_Suo','SwitchPanel/SwitchScroll/SkinToggle/Btn_Suo/Img_Suo',2},{'Btn_Switch','SwitchPanel/SwitchScroll/SkinToggle/Btn_Switch',2},{'Img_Qieyedian01','SwitchPanel/SwitchScroll/SkinToggle/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchScroll/SkinToggle/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchScroll/SkinToggle/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'SkinScroll','RightPanel/SkinScroll',2},{'Content','RightPanel/SkinScroll/Content',2},{'Btn_Filter','RightPanel/Btn_Filter',2},
        -- Button 列表
        {'Btn_Filter01','RightPanel/Btn_Filter',4},
        -- UITemplate 列表
        {'ArtSkinItem','RightPanel/SkinScroll/ArtSkinItem',10},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'SkinScroll01','RightPanel/SkinScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_ArtAppreciation_CN','UpperLeftPanel/Text_ArtAppreciation/Text_ArtAppreciation_CN',20},{'Text_ArtAppreciation_EN','UpperLeftPanel/Text_ArtAppreciation/Text_ArtAppreciation_EN',20},{'CNText','SwitchPanel/SwitchScroll/SkinToggle/Btn_Switch/CNText',20},{'CNText01','SwitchPanel/SwitchScroll/SkinToggle/Btn_SwitchHighLight/CNText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---皮肤组
    self.SkinTabList = HeroControl.GetArtSkin()
    ---@type RoleSkinData 皮肤列表
    self.SkinList = nil
    ---当前选择的选项卡
    self.CurTab = nil
    self.CurTabName = nil
    ---当前选中选项卡对应的区域
    self.CurPanel = nil
    ---当前筛选类型true为开启项(0全部，1护卫，2强击，3轰炸，4支援 与配置表一致)
    self.CurCardFilter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false
    }
    --注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.SwitchCell))
    self.SkinScroll01():SetLuaCellEvent(Handle(self, self.SkinCell))
    
    self:InitBtn()
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回
    UIEvent.LuaClick(self.Btn_ReturnInfo().gameObject,function()
        self:OnBackKey()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_ReturnHome().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)

    UIEvent.LuaClick(self.Btn_Filter().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            ---获取排序规则
            self.CurCardFilter = filter
            self:FilterTab(filter)
        end,3, {self.CurCardFilter}},true)
    end))
end

function M:OnUpdateUI()
    self.SwitchScroll01().totalCount = #self.SkinTabList
    self.SwitchScroll01():RefillCells(0)
end

function M:SwitchCell(trans,idx)
    self:RefreshSwitch(trans.gameObject,self.SkinTabList[idx])
end

function M:SkinCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.SkinList[idx])
end

---刷新页签
function M:RefreshSwitch(obj,data)
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    --名字
    normalText.text = data.tabName
    highText.text = data.tabName

    ---点击事件
    UIEvent.LuaClick(obj,function()
        self:OnClickSwitch(obj,data)
    end)
    
    if self.CurTabName == nil or self.CurTabName == data.tabName then
        self:OnClickSwitch(obj,data)
        normal:SetActive(false)
        highLight:SetActive(true)
        self.CurTab = obj
    else
        normal:SetActive(true)
        highLight:SetActive(false)
    end
end

---点击选项卡
function M:OnClickSwitch(obj,data)
    if self.CurTabName == data.tabName then
        return
    end
    ---如果当前已选择页签
    if self.CurTab then
        self:ChangeSwitch(self.CurTab,false)
        self:ChangeSwitch(obj,true)
    else
        self:ChangeSwitch(obj,true)
    end
    self.CurTab = obj
    self.CurTabName = data.tabName
    --刷新皮肤列表
    self:RefreshSkinList(data.skinList)
end
---刷新皮肤列表
function M:RefreshSkinList(_skinList)
    self.SkinList = _skinList
    Global.Sort(self.SkinList, {"unlockState","roleId","id"})
    self.SkinScroll01().totalCount = #self.SkinList
    self.SkinScroll01():RefillCells(0)
end

function M:ChangeSwitch(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    normal:SetActive(not state)
    highLight:SetActive(state)
end

function M:FilterTab(filters)
    local tAllSkinList = HeroControl.GetArtSkin()
    self.SkinTabList = {}
    self.CurTabName = nil
    --有类型时筛选
    if filters and not filters[0] then
        ---筛选
        local filterGroup = {}
        for i, v in pairs(filters) do
            if v then
                table.insert(filterGroup,i)
            end
        end
        
        self.SkinTabList = RoleCardViewModel.RoleFilter(tAllSkinList, "New_Career", filterGroup)
        table.insert(self.SkinTabList,1,tAllSkinList[1])
        self.SkinTabList[1].skinList = RoleCardViewModel.RoleFilter(tAllSkinList[1].skinList, "New_Career", filterGroup)
    else
        self.SkinTabList = tAllSkinList
    end
    
    self.SwitchScroll01().totalCount = #self.SkinTabList
    self.SwitchScroll01():RefillCells(0)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    HeroControl.SetCurArtSkinData(nil)
    --将标记去除
    ArtAtlasControl.SetSkinUI(false)
end

return M