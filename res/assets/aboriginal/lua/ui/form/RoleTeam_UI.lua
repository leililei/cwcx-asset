-- Code Auto Create Begin
local M = Class('RoleTeam_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleTeam_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleTeam_UI].prefab'
    self.Name = 'Form[RoleTeam_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Switchdi','Img_Switchdi',2},{'Img_Zhezhao','Img_Zhezhao',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'RoleTeamSwitchItem','SwitchPanel/SwitchScroll/RoleTeamSwitchItem',2},{'Btn_Switch','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_Switch',2},{'Img_Qieyedian','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'Img_Jieshaozhezhao','RightPanel/Img_Jieshaozhezhao',2},{'Img_IDtiao','RightPanel/Text_DiquName/Img_IDtiao',2},{'Img_Xian','RightPanel/TeamPanel/Img_Xian',2},{'Img_Tanchuangdi','RightPanel/TeamPanel/Img_Tanchuangdi',2},{'ScrollbarVertical','RightPanel/TeamPanel/TeamScroll/ScrollbarVertical',2},{'Handle','RightPanel/TeamPanel/TeamScroll/ScrollbarVertical/SlidingArea/Handle',2},{'RoleTeamContent','RightPanel/TeamPanel/TeamScroll/RoleTeamContent',2},{'TeamPrefab','RightPanel/TeamPanel/TeamScroll/TeamPrefab',2},{'TeamIcon','RightPanel/TeamPanel/TeamScroll/TeamPrefab/TeamIcon',2},{'Btn_Duiyuanzonglan','RightPanel/Btn_Duiyuanzonglan',2},{'ZonglanIcon','RightPanel/Btn_Duiyuanzonglan/ZonglanIcon',2},
        -- Toggle 列表
        {'RoleTeamSwitchItem01','SwitchPanel/SwitchScroll/RoleTeamSwitchItem',13},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},{'TeamScroll','RightPanel/TeamPanel/TeamScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'TeamScroll01','RightPanel/TeamPanel/TeamScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_RoleTeam_CN','UpperLeftPanel/Text_RoleTeam/Text_RoleTeam_CN',20},{'Text_RoleTeam_EN','UpperLeftPanel/Text_RoleTeam/Text_RoleTeam_EN',20},{'CNText','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_Switch/CNText',20},{'CNText01','SwitchPanel/SwitchScroll/RoleTeamSwitchItem/Btn_SwitchHighLight/CNText',20},{'Text_DiquName','RightPanel/Text_DiquName',20},{'Text_Jieshao','RightPanel/Text_Jieshao',20},{'Text_TeamName','RightPanel/TeamPanel/TeamScroll/TeamPrefab/Text_TeamName',20},{'Text_Duiyuanzonglan','RightPanel/Btn_Duiyuanzonglan/Text_Duiyuanzonglan',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---注册按钮
    self:InitBtn()
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.CellData))
    self.TeamScroll01():SetLuaCellEvent(Handle(self, self.TeamCell))
    self.canScroll = false
end

function M:OnShow()
    ---地区数据 刷新左侧页签
    self.AreaData = TeamAtlasControl.GetRegionData()
    self.SwitchScroll01().totalCount = #self.AreaData
    self.TeamScroll01():RefillCells()
    ---小队数据
    self:RefreshTeamScroll(self.AreaData[1])
    ---所有小队数据
    self.AllTeamData = TeamAtlasControl.GetFilteredTeamDate()
end

---初始化按钮事件
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
    ---点击队员总览
    UIEvent.LuaClick(self.Btn_Duiyuanzonglan().gameObject,function()
        MgrUI.GoHide(UID.DiquShaixuanPop_UI)
    end)
end

function M:CellData(trans, idx)
    self:RefreshSwitch(trans.gameObject, idx)
end

function M:TeamCell(trans, idx)
    self:RefreshTeamItem(trans.gameObject, idx)
end

---刷新页签
function M:RefreshSwitch(obj,index)
    local data = self.AreaData[index]
    local tog = obj.transform:GetComponent("Toggle")
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")

    normalText.text = data[1].AreaName
    highText.text = data[1].AreaName
    ---toggle组赋值
    tog.group = self.SwitchScroll01().content.gameObject:GetComponent("ToggleGroup")

    Tools.ToggleValueChange(tog,function(isOn)
        if isOn then
            normal:SetActive(false)
            highLight:SetActive(true)
            self:RefreshTeamScroll(data)
            if self.canScroll == false then
                self.canScroll = true
            else
                ---滑动
                self.SwitchScroll01():ScrollToCell(index,3500)
            end
        else
            normal:SetActive(true)
            highLight:SetActive(false)
        end
        ---刷新自适应组件
        --Tools.ReContentSizeGroup(self.SwitchScroll01().content.gameObject)
    end,nil)
    ---默认显示
    normal:SetActive(true)
    highLight:SetActive(false)
    if index == 1 then
        tog.isOn = true
    else
        tog.isOn = false
    end
end

---刷新小队Item
function M:RefreshTeamItem(obj,idx)
    local data = self.TeamData[idx]
    local icon = CJNUIMgr.GetSunUseName(obj,"TeamIcon"):GetComponent("Image")
    local name = CJNUIMgr.GetSunUseName(obj,"Text_TeamName"):GetComponent("TextMeshProUGUI")

    ---小队图标
    MgrRes.LoadSprite(icon,"Attribute/" .. data:GetTeamIcon())
    ---小队名字
    name.text = data.TeamName
    ---点击事件
    UIEvent.LuaClick(obj,function()
        local str = string.split(data.characterID,",")
        TeamAtlasControl.OpenRoleArchive(tonumber(str[1]))
    end)
end

---刷新小队滑块
function M:RefreshTeamScroll(data)
    ---@type TeamAtlasData 当前小队数据
    self.TeamData = data
    self.TeamScroll01().totalCount = #data
    self.TeamScroll01()
    self.TeamScroll01():RefillCells()
    ---地区背景变化
    MgrRes.LoadSprite(self.Img_BG(),data[1].AreaBg)
    ---地区标题
    self.Text_DiquName().text = data[1].AreaTitle
    ---地区简介
    self.Text_Jieshao().text = data[1].AreaTxt
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M