-- Code Auto Create Begin
local M = Class('Skillook_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Skillook_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Skillook_UI].prefab'
    self.Name = 'Form[Skillook_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'SwitchItem','SwitchPanel/SwitchScroll/SwitchItem',2},{'TogPanel','SwitchPanel/SwitchScroll/SwitchItem/TogPanel',2},{'Btn_Switch','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_Switch',2},{'Img_Qieyedian','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'SkillLookSwitchItem','SwitchPanel/SwitchScroll/SwitchItem/Scroll/SkillLookSwitchItem',2},{'Img_Qieyedi','SwitchPanel/SwitchScroll/SwitchItem/Scroll/SkillLookSwitchItem/Img_Qieyedi',2},{'Img_Qieyedi_H','SwitchPanel/SwitchScroll/SwitchItem/Scroll/SkillLookSwitchItem/Img_Qieyedi_H',2},{'Img_Qieyekuang','SwitchPanel/SwitchScroll/SwitchItem/Scroll/SkillLookSwitchItem/Img_Qieyedi_H/Img_Qieyekuang',2},{'ScrollbarVertical','SkillPanel/SkillScroll/ScrollbarVertical',2},{'Handle','SkillPanel/SkillScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content','SkillPanel/SkillScroll/Content',2},{'RolePopPanel','RolePopPanel',2},{'BlueMask','RolePopPanel/BlueMask',2},{'Img_xian2','RolePopPanel/Img_xian2',2},{'Img_xian1','RolePopPanel/Img_xian1',2},{'Img_Tanchuangdi','RolePopPanel/Img_Tanchuangdi',2},{'Img_Biaotixian','RolePopPanel/Img_Biaotixian',2},{'Content01','RolePopPanel/RolePopScroll/Content',2},
        -- UITemplate 列表
        {'SkillBookItem','SkillPanel/SkillScroll/SkillBookItem',10},{'RoleItem','RolePopPanel/RolePopScroll/RoleItem',10},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},{'Scroll','SwitchPanel/SwitchScroll/SwitchItem/Scroll',15},{'SkillScroll','SkillPanel/SkillScroll',15},{'RolePopScroll','RolePopPanel/RolePopScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'Scroll01','SwitchPanel/SwitchScroll/SwitchItem/Scroll',18},{'SkillScroll01','SkillPanel/SkillScroll',18},{'RolePopScroll01','RolePopPanel/RolePopScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Skills_CN','UpperLeftPanel/Text_Skills/Text_Skills_CN',20},{'Text_Skills_EN','UpperLeftPanel/Text_Skills/Text_Skills_EN',20},{'CNText','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_Switch/CNText',20},{'CNText01','SwitchPanel/SwitchScroll/SwitchItem/TogPanel/Btn_SwitchHighLight/CNText',20},{'Text_Qieyeming','SwitchPanel/SwitchScroll/SwitchItem/Scroll/SkillLookSwitchItem/Text_Qieyeming',20},{'Text_Biaoti','RolePopPanel/Text_Biaoti',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---注册按钮
    self:InitBtn()
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.CellData))
    self.SkillScroll01():SetLuaCellEvent(Handle(self, self.skillCell))
    self.RolePopScroll01():SetLuaCellEvent(Handle(self, self.RoleCell))
    ---获取页签数据
    self.MainData = SkillAtlasControl.GetMainData()
    ---是否可滑动
    self.canScroll = false
    ---当前选择的类型
    self.CurType = nil
    ---当前选择的技能
    self.CurSkill = nil
end

function M:OnShow()
    self.SwitchScroll01().totalCount = #self.MainData
    self.SwitchScroll01():RefillCells()
end

---初始化按钮点击
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回上一级
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_Home().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击帮助
    UIEvent.LuaClick(self.Btn_I().gameObject,function()

    end)
    ---点击隐藏角色弹窗
    UIEvent.LuaClick(self.BlueMask().gameObject,function()
        self.RolePopPanel().gameObject:SetActive(false)
    end)
    self.RolePopPanel().gameObject:SetActive(false)
end

---标签页回调事件
function M:CellData(trans, idx)
    self:RefreshSwitch(trans.gameObject, idx)
end

function M:skillCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.SkillData[idx],self})
end

function M:RoleCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleIdList[idx],self})
end

---刷新左侧标签页
function M:RefreshSwitch(obj,idx)
    ---获取物体和组件
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    local name = self.MainData[idx]
    local scroll = CJNUIMgr.GetSunUseName(obj, "Scroll"):GetComponent("LoopScrollRect")
    ---文本赋值
    normalText.text = name
    highText.text = name

    ---注册滑块
    scroll:SetLuaCellEvent(function(trans,_idx)
        self:RefreshSonSwitch(trans.gameObject,_idx)
    end)

    ---点击类型
    UIEvent.LuaClick(obj,function()
        self:OnClickType(obj,idx,scroll)
    end)

    ---索引为1则默认高亮
    normal:SetActive(true)
    highLight:SetActive(false)
    scroll.gameObject:SetActive(false)
    if idx == 1 and self.CurType == nil then
        self:OnClickType(obj,idx,scroll)
    end
end

function M:RefreshSonSwitch(obj,idx)
    ---获取子类别组件
    local _normal = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi").gameObject
    local _highLight = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi_H").gameObject
    local _name = CJNUIMgr.GetSunUseName(obj, "Text_Qieyeming"):GetComponent("TextMeshProUGUI")
    local data = self.sonSwitchData[idx]

    ---名字文本赋值
    _name.text = data.type2Name
    ---点击事件
    UIEvent.LuaClick(obj,function()
        self:OnClickSkill(obj,idx)
    end)
    ---索引为1默认显示
    _normal:SetActive(true)
    _highLight:SetActive(false)
    if idx == 1 and self.CurSkill == nil then
        self:OnClickSkill(obj,idx)
    end
end

---刷新右侧技能Item
function M:RefreshItem(type1,type2,offset)
    self.SkillData = SkillAtlasControl.GetItemData(type1,type2)
    self.SkillScroll01().totalCount = #self.SkillData
    if offset then
        self.SkillScroll01():RefillCells(offset)
    else
        self.SkillScroll01():RefreshCells()
    end
end

---刷新角色
function M:RefreshRole(data,offset)
    self.RolePopPanel().gameObject:SetActive(true)
    self.roleIdList = data
    self.RolePopScroll01().totalCount = #self.roleIdList
    if offset then
        self.RolePopScroll01():RefillCells(offset)
    else
        self.RolePopScroll01():RefreshCells()
    end
end

---点击类型
function M:OnClickType(obj,idx,scroll)
    if self.CurType then
        self:ChangeType(self.CurType,false)
        self:ChangeType(obj,true)
    else
        self:ChangeType(obj,true)
    end
    
    self.CurType = obj
    self.CurSkill = nil
    if self.canScroll == false then
        self.canScroll = true
    else
        ---滑动
        self.SwitchScroll01():ScrollToCell(idx - 1 < 0 and 1 or idx - 1,3500)
    end
    self.sonSwitchData = SkillAtlasControl.GetSonData(idx)
    scroll.totalCount = #self.sonSwitchData
    scroll:RefillCells(0)
    ---刷新自适应组件
    Tools.ReContentSizeGroup(self.SwitchScroll01().content.gameObject)
end


function M:ChangeType(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local scroll = CJNUIMgr.GetSunUseName(obj, "Scroll"):GetComponent("LoopScrollRect")
    normal:SetActive(not state)
    highLight:SetActive(state)
    scroll.gameObject:SetActive(state)
    ---刷新自适应组件
    Tools.ReContentSizeGroup(self.SwitchScroll01().content.gameObject)
end

function M:OnClickSkill(obj,idx)
    local data = self.sonSwitchData[idx]
    if self.CurSkill then
        self:ChangeSkill(self.CurSkill,false)
        self:ChangeSkill(obj,true)
    else
        self:ChangeSkill(obj,true)
    end
    self.CurSkill = obj
    self:RefreshItem(data.type1,data.type2,0)   --刷新右侧技能Item
end

function M:ChangeSkill(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi_H").gameObject
    normal:SetActive(not state)
    highLight:SetActive(state)
end
function M:OnBackKey()
    if self.RolePopPanel().gameObject.activeSelf then
        self.RolePopPanel().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M