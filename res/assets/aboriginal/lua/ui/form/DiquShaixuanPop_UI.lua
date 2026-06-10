-- Code Auto Create Begin
local M = Class('DiquShaixuanPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DiquShaixuanPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DiquShaixuanPop_UI].prefab'
    self.Name = 'Form[DiquShaixuanPop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'ScrollbarVertical','TeamPopScroll/ScrollbarVertical',2},{'Handle','TeamPopScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Img_RoleTeamdi','TeamPopScroll/RoleTeamPrefab/Img_RoleTeamdi',2},{'CampIcon','TeamPopScroll/RoleTeamPrefab/CampIcon',2},{'CampIconName','TeamPopScroll/RoleTeamPrefab/CampIcon/CampIconName',2},{'Img_Touxiangdi','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Img_Touxiangdi',2},{'Img_RoleIcon','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Img_RoleIcon',2},{'ownMask','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/ownMask',2},{'Img_Iddi','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Img_Iddi',2},{'Icon_Career','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Icon_Career',2},{'Img_Kuang','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Img_Kuang',2},{'RoleRoot','TeamPopScroll/RoleTeamPrefab/RoleScroll/RoleRoot',2},{'Content','TeamPopScroll/Content',2},{'Btn_Diqushaixuan','Btn_Diqushaixuan',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'DiquShaixuanPop','DiquShaixuanPop',2},{'BlueMask','DiquShaixuanPop/BlueMask',2},{'Img_Tanchuangdi','DiquShaixuanPop/Img_Tanchuangdi',2},{'Img_Xian2','DiquShaixuanPop/Img_Tanchuangdi/Img_Xian2',2},{'Img_Xian1','DiquShaixuanPop/Img_Tanchuangdi/Img_Xian1',2},{'Img_TitleXian','DiquShaixuanPop/Img_Tanchuangdi/Text_Title/Img_TitleXian',2},{'Tog_Diqu','DiquShaixuanPop/Img_Tanchuangdi/Tog_Diqu',2},{'Normal','DiquShaixuanPop/Img_Tanchuangdi/Tog_Diqu/Normal',2},{'HighLight','DiquShaixuanPop/Img_Tanchuangdi/Tog_Diqu/HighLight',2},{'ShaixuanContent','DiquShaixuanPop/Img_Tanchuangdi/ShaixuanContent',2},{'Btn_Queding','DiquShaixuanPop/Img_Tanchuangdi/Btn_Queding',2},{'Img_Quedingdi','DiquShaixuanPop/Img_Tanchuangdi/Btn_Queding/Img_Quedingdi',2},
        -- Button 列表
        {'CampIconName01','TeamPopScroll/RoleTeamPrefab/CampIcon/CampIconName',4},
        -- RawImage 列表
        {'TeamPopScroll','TeamPopScroll',15},
        -- LoopScrollRect 列表
        {'TeamPopScroll01','TeamPopScroll',18},{'RoleScroll','TeamPopScroll/RoleTeamPrefab/RoleScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_CampName','TeamPopScroll/RoleTeamPrefab/Text_CampName',20},{'Text_Name','TeamPopScroll/RoleTeamPrefab/RoleScroll/DSP_TeamRoleItem/Text_Name',20},{'Text_Diqushaixuan','Btn_Diqushaixuan/Text_Diqushaixuan',20},{'Text_RoleTeam_CN','UpperLeftPanel/Text_RoleTeam/Text_RoleTeam_CN',20},{'Text_RoleTeam_EN','UpperLeftPanel/Text_RoleTeam/Text_RoleTeam_EN',20},{'Text_Title','DiquShaixuanPop/Img_Tanchuangdi/Text_Title',20},{'Text_Normal_Diqu','DiquShaixuanPop/Img_Tanchuangdi/Tog_Diqu/Normal/Text_Normal_Diqu',20},{'Text_Hight_Diqu','DiquShaixuanPop/Img_Tanchuangdi/Tog_Diqu/HighLight/Text_Hight_Diqu',20},{'Text_Queding','DiquShaixuanPop/Img_Tanchuangdi/Btn_Queding/Text_Queding',20},
    }
end
-- Code Auto Create End
function M:OnInit()
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

    UIEvent.LuaClick(self.Btn_Diqushaixuan().gameObject,function()
        self.DiquShaixuanPop().gameObject:SetActive(true)
    end)

    UIEvent.LuaClick(self.BlueMask().gameObject,function()
        self.DiquShaixuanPop().gameObject:SetActive(false)
    end)

    UIEvent.LuaClick(self.Btn_Queding().gameObject,function()
        self.currentAreaType = self.tempAreaType
        self:RefillCells()
        self.DiquShaixuanPop().gameObject:SetActive(false)
        self:RefreshAreaTxt(self.currentAreaType)
    end)

    self.TeamPopScroll01():SetLuaCellEvent(Handle(self, self.TeamItemCell))
    self:InitData()
    self:RefillCells()

    self:InitAreaData()
    self:InitAreaObj()
    self:RefreshAreaToggle(self.currentAreaType)

    self:RefreshAreaTxt(self.currentAreaType)
end

function M:OnUpdateUI(pData)
    
end

--刷新区域文本
function M:RefreshAreaTxt(index)
    for i, v in ipairs(self.areaList) do
        if v.type == index then
            self.Text_Diqushaixuan().text = MgrLanguageData.GetLanguageByKey("ui_qita_text155") .. v.name
        end
    end
end

--初始化数据
function M:InitData()
    self.currentAreaType = 0 --当前地区类型
    --地区数据
    self.AreaData = TeamAtlasControl.GetRegionData()
    ---所有小队数据
    self.AllTeamData = TeamAtlasControl.GetFilteredTeamDate()
    self.realAllTeamData = TeamAtlasControl.GetFilteredTeamDate()
end

--加载小队列表
function M:RefillCells()
    if self.currentAreaType ~= 0 then
        local list = {}
        for i, v in ipairs(self.realAllTeamData) do
            if v.AreaType == self.currentAreaType then
                table.insert(list,v)
            end
        end
        self.AllTeamData = list
    else
        self.AllTeamData = self.realAllTeamData
    end

    self.TeamPopScroll01().totalCount = #self.AllTeamData
    self.TeamPopScroll01():RefillCells()
end

function M:TeamItemCell(trans, idx)
    self:RefreshPopTeamItem(trans.gameObject, idx)
end

function M:RefreshPopTeamItem(obj,idx)
    local data = self.AllTeamData[idx]
    local icon = CJNUIMgr.GetSunUseName(obj,"CampIcon"):GetComponent("Image")
    local teamName = CJNUIMgr.GetSunUseName(obj,"Text_CampName"):GetComponent("TextMeshProUGUI")
    ---@type UnityEngine.UI.LoopScrollRect
    local roleScroll = CJNUIMgr.GetSunUseName(obj, "RoleScroll"):GetComponent("LoopScrollRect")
    local str = string.split(data.characterID,",")

    ---小队图标
    MgrRes.LoadSprite(icon,"Attribute/" .. data:GetTeamIcon())
    ---小队名字
    teamName.text = data.TeamName

    roleScroll:SetLuaCellEvent(function(trans, index) 
        self:RefreshTeamRoleItem(trans.gameObject, tonumber(str[index]))
    end)
    roleScroll.totalCount = #str
    roleScroll:RefillCells()
    
    -- 超出范围的才允许拖动
    local bOverScroll = roleScroll.transform.rect.width < #str * roleScroll.prefabSource.poolPrefab.transform.rect.width
    roleScroll.horizontal = bOverScroll
end

function M:RefreshTeamRoleItem(obj, roleId)
    local roleIcon = CJNUIMgr.GetSunUseName(obj,"Img_RoleIcon"):GetComponent("Image")
    local roleName = CJNUIMgr.GetSunUseName(obj,"Text_Name"):GetComponent("TextMeshProUGUI")
    local careerIcon = CJNUIMgr.GetSunUseName(obj,"Icon_Career"):GetComponent("Image")
    local Img_Kuang = CJNUIMgr.GetSunUseName(obj,"Img_Kuang"):GetComponent("Image")
    local mask = CJNUIMgr.GetSunUseName(obj,"ownMask")
    local roleData = HeroControl.GetRoleDataByID(roleId)

    ---角色头像
    MgrRes.LoadQIcon(roleIcon,roleData.id)
    --头像框 "Quality/RankF_4"   "Quality/RankFL_".. roleData.rank
    MgrRes.LoadSprite(Img_Kuang,"Quality/RankFL_".. roleData.rank)
    ---角色名
    roleName.text = roleData.name
    ---角色职业图标
    MgrRes.LoadSprite(careerIcon,roleData.iconCareer)
    ---是否拥有遮罩
    mask:SetActive(roleData.lockState == false)
    ---点击跳转角色详情
    UIEvent.LuaClick(roleIcon.gameObject,function()
        TeamAtlasControl.OpenRoleArchive(roleData.id)
    end)
end

--初始化区域数据
function M:InitAreaData()
    self.tempAreaType = 0 --临时区域类型
    self.areaList = {}
    table.insert(self.areaList,{
        type = 0,
        name = MgrLanguageData.GetLanguageByKey("bag_ui_character_type1")
    })

    for i, v in ipairs(self.AreaData) do
        table.insert(self.areaList,{
            type = v[1].AreaType,
            name = v[1].AreaName
        })
    end
end

--初始化区域预制体
function M:InitAreaObj()
    self.areaObjList = {}
    for i, v in ipairs(self.areaList) do
        local p = GameObject.Instantiate(self.Tog_Diqu().gameObject,self.ShaixuanContent().transform,false)
        local areaNormalTxt = CJNUIMgr.GetSunUseName(p , "Text_Normal_Diqu"):GetComponent("TextMeshProUGUI")
        local areaHightTxt = CJNUIMgr.GetSunUseName(p , "Text_Hight_Diqu"):GetComponent("TextMeshProUGUI")
        p:SetActive(true)
        areaNormalTxt.text = self.areaList[i].name
        areaHightTxt.text = self.areaList[i].name

        UIEvent.LuaClick(p,function()
            self:RefreshAreaToggle(self.areaList[i].type)
        end)
        self.areaObjList[i] = p
    end
end
function M:OnBackKey()
    if self.DiquShaixuanPop().gameObject.activeSelf then
        self.DiquShaixuanPop().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
--刷新区域选项
function M:RefreshAreaToggle(index)
    for i, v in ipairs(self.areaList) do
        if v.type == index then
            self.areaObjList[i].transform:Find("HighLight").gameObject:SetActive(true)
            self.areaObjList[i].transform:Find("Normal").gameObject:SetActive(false)
        else
            self.areaObjList[i].transform:Find("HighLight").gameObject:SetActive(false)
            self.areaObjList[i].transform:Find("Normal").gameObject:SetActive(true)
        end
    end
    self.tempAreaType = index
end

return M