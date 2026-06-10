-- Code Auto Create Begin
local M = Class('ChooseSkin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ChooseSkin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ChooseSkin_UI].prefab'
    self.Name = 'Form[ChooseSkin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'ChoosePlayerRole','ChoosePlayerRole',2},{'SelectSkinPanel','ChoosePlayerRole/SelectSkinPanel',2},{'Img_Tanchuxian','ChoosePlayerRole/SelectSkinPanel/Img_Tanchuxian',2},{'Img_Tips','ChoosePlayerRole/SelectSkinPanel/Img_Tips',2},{'SelectScroll','ChoosePlayerRole/SelectSkinPanel/SelectScroll',2},{'Normal','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/Normal',2},{'Img_RoleIndex','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/Img_RoleIndex',2},{'Img_NoData','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/Img_NoData',2},{'SelectRole','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/SelectRole',2},{'RoleIcon','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/SelectRole/RoleIcon',2},{'Img_Kuang','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/SelectRole/Img_Kuang',2},{'Img_Del','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/SelectRole/Img_Del',2},{'MainSkinPanel','ChoosePlayerRole/MainSkinPanel',2},{'MainSkinScroll','ChoosePlayerRole/MainSkinPanel/MainSkinScroll',2},{'MainSkin','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin',2},{'RoleIcon01','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin/RoleIcon',2},{'Img_Kuang01','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin/Img_Kuang',2},{'Img_Add','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin/Img_Add',2},{'Img_board_selected','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin/Img_board_selected',2},{'CardSortPanel','CardSortPanel',2},{'Tg_CardSort','CardSortPanel/Tg_CardSort',2},{'Normal01','CardSortPanel/Tg_CardSort/Normal',2},{'Btn_HighLight','CardSortPanel/Tg_CardSort/Btn_HighLight',2},{'Frame','CardSortPanel/Tg_CardSort/Btn_HighLight/Frame',2},{'Btn_Back','Btn_Back',2},
        -- Toggle 列表
        {'Select_MainSkin','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin',13},{'Tg_CardSort01','CardSortPanel/Tg_CardSort',13},
        -- RawImage 列表
        {'MainSkinContent','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkinContent',15},
        -- LoopScrollRect 列表
        {'SelectScroll01','ChoosePlayerRole/SelectSkinPanel/SelectScroll',18},{'MainSkinScroll01','ChoosePlayerRole/MainSkinPanel/MainSkinScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Tips','ChoosePlayerRole/SelectSkinPanel/Img_Tips/Text_Tips',20},{'Text_Index','ChoosePlayerRole/SelectSkinPanel/SelectScroll/Select_MainSkin/Img_RoleIndex/Text_Index',20},{'Text_Num','ChoosePlayerRole/MainSkinPanel/MainSkinScroll/MainSkin/Img_board_selected/Text_Num',20},{'Text_CN','CardSortPanel/Tg_CardSort/Normal/Text_CN',20},{'Text_CN01','CardSortPanel/Tg_CardSort/Btn_HighLight/Text_CN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.SelectKey = PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles"
    ---选中皮肤列表
    self.SelectList = {}
    ---由皮肤id为key，顺序id为value，做筛选
    self.SelectList_RoleId = {}
    ---角色和皮肤表
    self.SkinList = {}
    
    self.CurTogName = nil
    self.TogData = {
        --驾驶员
        [1] = { togName = MgrLanguageData.GetLanguageByKey("ui_tongyong_text61"), data = HeroControl.GetHaveHero() },
        --装扮
        [2] = { togName = MgrLanguageData.GetLanguageByKey("ui_qita_text184"), data = HeroControl.GetHaveSkin() },
    }
    --注册滑块
    self.SelectScroll01():SetLuaCellEvent(Handle(self, self.SelectedCell))
    self.MainSkinScroll01():SetLuaCellEvent(Handle(self, self.SkinCell))

    self:InitBtn()
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --点击返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        self:OnBackKey()
    end)

    --左侧，已选择的皮肤
    local isNew = UnityEngine.PlayerPrefs.GetString(self.SelectKey)
    if isNew ~= nil and isNew ~= "" then
        local str = string.split(isNew,',')
        for i, v in ipairs(str) do
            local t = string.split(v,'_')
            self.SelectList[tonumber(t[1])] = tonumber(t[2])
            self.SelectList_RoleId[tonumber(t[2])] = tonumber(t[1])
        end
    end
    self.SelectScroll01().totalCount = 10
    self.SelectScroll01():RefillCells(0)
    --右侧，皮肤展示
    for i, v in ipairs(self.TogData) do
        local togTrans = GameObject.Instantiate(self.Tg_CardSort().gameObject,self.CardSortPanel().transform,false):GetComponent("Toggle")
        
        local Normal = togTrans.transform:Find("Normal").gameObject
        local HighLight = togTrans.transform:Find("Btn_HighLight").gameObject
        Normal.transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = v.togName
        HighLight.transform:Find("Text_CN"):GetComponent("TextMeshProUGUI").text = v.togName
        
        Tools.ToggleValueChange(togTrans,function(isOn)
            Normal:SetActive(not isOn)
            HighLight:SetActive(isOn)
            if isOn and self.CurTogName ~= v.togName then
                self:UpdateMainSkin(v.togName, v.data, 0)
                self.CurTogName = v.togName
            end
        end)
        if i == 1 then
            Normal:SetActive(false)
            HighLight:SetActive(true)
            self.CurTogName = v.togName
            self:UpdateMainSkin(v.togName, v.data, 0)
        else
            Normal:SetActive(true)
            HighLight:SetActive(false)
        end
    end
    self.Tg_CardSort().gameObject:SetActive(false)
end

---更新角色和皮肤列表
function M:UpdateMainSkin(_type, data, offset)
    local skinList = {}
    if _type == MgrLanguageData.GetLanguageByKey("ui_tongyong_text61") then
        --驾驶员
        for i, v in ipairs(data) do
            local tData = {
                id = v.id,
                iconFrame = v.iconFrame,
                rank = v.rank,
                selectId = self.SelectList_RoleId[v.id] and self.SelectList_RoleId[v.id] or v.id
            }
            table.insert(skinList, tData)
        end
    elseif _type == MgrLanguageData.GetLanguageByKey("ui_qita_text184") then
        --装扮
        for i, v in ipairs(data) do
            local roleData = HeroControl.GetRoleDataByID(v.roleId)
            local tData = {
                id = v.id,
                roleId = v.roleId,
                iconFrame = roleData.iconFrame,
                rank = roleData.rank,
                selectId = self.SelectList_RoleId[v.id] and self.SelectList_RoleId[v.id] or v.id
            }
            table.insert(skinList, tData)
        end
    end
    
    self.SkinList = skinList
    Global.Sort(self.SkinList, { "selectId","rank" }, { false,true })
    self.MainSkinScroll01().totalCount = #self.SkinList
    if offset then
        self.MainSkinScroll01():RefillCells(offset)
    else
        self.MainSkinScroll01():RefreshCells()
    end
end

---选中皮肤
function M:SelectedCell(trans,idx)
    local tSelectRole = CJNUIMgr.GetSunUseName(trans.gameObject, "SelectRole")
    local tIndex = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Index"):GetComponent("TextMeshProUGUI")
    local tRoleIcon = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleIcon"):GetComponent("Image")
    local tRoleFrame = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Kuang"):GetComponent("Image")
    
    local tRoleId = self.SelectList[idx]
    if tRoleId then
        MgrRes.LoadNormalIcon(tRoleIcon, tRoleId,nil,nil,true)
        local heroData = nil
        if self.CurTogName == MgrLanguageData.GetLanguageByKey("ui_tongyong_text61") then
            --驾驶员
            heroData = HeroControl.GetRoleDataByID(tRoleId)
        else
            --装扮
            heroData = HeroControl.GetSkinDataBySkinId(tRoleId)
        end
        if heroData then
            MgrRes.LoadSprite(tRoleFrame, heroData.iconFrame)
        end
        --删除选中皮肤
        UIEvent.LuaClick(tSelectRole.gameObject, function()
            self:SetSelectList(tRoleId)
        end, nil, tRoleIcon)
    end
    tIndex.text = idx
    tSelectRole.gameObject:SetActive(tRoleId~=nil)
end
---皮肤列表
function M:SkinCell(trans,idx)
    local tRoleIcon = CJNUIMgr.GetSunUseName(trans.gameObject, "RoleIcon"):GetComponent("Image")
    local tRoleFrame = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_Kuang"):GetComponent("Image")
    local tRoleSelect = CJNUIMgr.GetSunUseName(trans.gameObject, "Img_board_selected")
    local tSelectNum = CJNUIMgr.GetSunUseName(trans.gameObject, "Text_Num"):GetComponent("TextMeshProUGUI")
    
    local data = self.SkinList[idx]
    MgrRes.LoadNormalIcon(tRoleIcon, data.id, nil, nil, true)
    MgrRes.LoadSprite(tRoleFrame, data.iconFrame)
    if self.SelectList_RoleId[data.id] then
        tRoleSelect.gameObject:SetActive(true)
        tSelectNum.text = self.SelectList_RoleId[data.id]
    else
        tRoleSelect.gameObject:SetActive(false)
    end
    
    UIEvent.LuaClick(trans.gameObject, function()
        self:SetSelectList(data.id)
    end)
end

--设置选择列表
function M:SetSelectList(roleID)
    if #self.SelectList >= 10 and not table.Contains(self.SelectList,roleID) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text185"),2},true)
        return
    end
    
    if table.Contains(self.SelectList,roleID) then
        if #self.SelectList <= 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text150"),2},true)
            return
        end
        for i, v in pairs(self.SelectList) do
            if v == roleID then
                table.remove(self.SelectList,i)
            end
        end
    else
        table.insert(self.SelectList,roleID)
    end
    --更新顺序
    self.SelectList_RoleId = {}
    for i, v in ipairs(self.SelectList) do
        self.SelectList_RoleId[v] = i
    end
    
    self.SelectScroll01():RefreshCells()
    self:UpdateMainSkin(self.CurTogName,self.SkinList)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if #self.SelectList < 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text150"),2},true)
            return
        end
        MgrUI.GoBack()
    end
end
---数据保存
function M:SaveData()
    local IsCurDel = true
    local str = ""
    local tCurSelectRole = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole","")
    local tRoleStr = string.split(tCurSelectRole,'_')
    for i, v in ipairs(self.SelectList) do
        if #tRoleStr == 2 and tonumber(tRoleStr[2]) == v then
            UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",i .. "_" .. v)
            IsCurDel = false
        end
        str = str .. i .. "_" .. v
        if i < #self.SelectList then
            str = str .. ","
        end
    end
    --如果被删掉,则重置
    if IsCurDel then
        UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",1 .. "_" .. self.SelectList[1])
    end
    print("最终输出的字符串为：" .. str)
    UnityEngine.PlayerPrefs.SetString(self.SelectKey,str)
end

function M:OnClose()
    self:SaveData()
end

return M