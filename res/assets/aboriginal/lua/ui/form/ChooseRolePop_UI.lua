-- Code Auto Create Begin
local M = Class('ChooseRolePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ChooseRolePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ChooseRolePop_UI].prefab'
    self.Name = 'Form[ChooseRolePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'ChooseRolePanel','ChooseRolePanel',2},{'Title','ChooseRolePanel/Title',2},{'tiao','ChooseRolePanel/Title/tiao',2},{'Scorll','ChooseRolePanel/Scorll',2},{'Content','ChooseRolePanel/Scorll/Content',2},{'Btn_Quxiao','ChooseRolePanel/Btn_Quxiao',2},{'Btn_Queding','ChooseRolePanel/Btn_Queding',2},
        -- UITemplate 列表
        {'ChooseRoleItem','ChooseRolePanel/Scorll/ChooseRoleItem',10},
        -- LoopScrollRect 列表
        {'Scorll01','ChooseRolePanel/Scorll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title','ChooseRolePanel/Title/Text_Title',20},{'Text_Yixuanze','ChooseRolePanel/Text_Yixuanze',20},{'Text_Quxiao','ChooseRolePanel/Btn_Quxiao/Text_Quxiao',20},{'Text_Queding','ChooseRolePanel/Btn_Queding/Text_Queding',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --已选择的列表
    self.selectList = {}
    self.curRoleList = {}

    self:InitSelectList()
    self:RegisterScroll()
    self:ResetRoleItem(0,true)
    self.curRoleList = self:GetRoleData(1, true,true)
    self:SetXuanZeTxt()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    UIEvent.LuaClick(self.Btn_Queding().gameObject, function()
        if #self.selectList <= 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text150"),2},true)
            return
        end
        local str = ""
        for i, v in ipairs(self.selectList) do
            if i == 1 then
                UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "curHomeUISelectRole",i .. "_" .. v)
            end
            str = str .. i .. "_" .. v
            if i < #self.selectList then
                str = str .. ","
            end
        end
        print("最终输出的字符串为：" .. str)
        UnityEngine.PlayerPrefs.SetString(PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles",str)
        MgrSound.Stop(3, tostring(PlayerControl.GetPlayerData().HomeRole), false)
        Event.Go("ChangeHomeRoleList")
        MgrUI.ClosePop(self.Uid)
    end)
end

--初始化选择列表
function M:InitSelectList()
    local isNew = UnityEngine.PlayerPrefs.GetString(PlayerControl.GetPlayerData().UID .. "HomeUISelectRoles")
    if isNew ~= nil and isNew ~= "" then
        local str = string.split(isNew,',')
        for i, v in ipairs(str) do
            local t = string.split(v,'_')
            self.selectList[tonumber(t[1])] = tonumber(t[2])
        end
    end
end

function M:OnUpdateUI()

end

---注册滑块监听
function M:RegisterScroll()
    self.Scorll01():SetLuaCellEvent(Handle(self, self.CellItem))
end

---面板娘滑块回调
function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.CurLoopList[idx], self })
end

---设置面板娘滑动数据
function M:ResetRoleItem(offset,isHead)
    ---设置当前Loop数据
    if #self.curRoleList == 0 then
        self.CurLoopList = self:GetRoleData(1, true,isHead)
    else
        self.CurLoopList = self.curRoleList
    end
    
    ---设置Loop数量
    self.Scorll01().totalCount = #self.CurLoopList
    if offset then
        self.Scorll01():RefillCells(offset)      ---将LoopScroll跳转到指定index并刷新数据
    else
        self.Scorll01():RefreshCells()           ---只刷新数据
    end
end

---获取角色数据缓存
function M:GetRoleData(sort, rise,isHead)
    ---获取角色数据
    local array = HeroControl.GetHaveHero()
    ---获取看板娘数据
    --local PosterGirlArray = PosterGirlControl.GetAllPosterGirl()
    ---看板娘加入队列
    -- for i, v in pairs(PosterGirlArray) do
    --     table.insert(array, v)
    -- end
    ---排序(1稀有度,2取得时间)
    local sortGroupArr = {
        [1] = { "rank", "level" },
    }
    Global.Sort(array, sortGroupArr[sort], rise)
    if isHead then
        return self:SortList(array)
    else
        return array
    end
    --return self:SortList(array)
end

--将选择的角色前置
function M:SortList(list)
    local t = {}
    for i, v in ipairs(self.selectList) do
        for k, j in ipairs(list) do
            if v == j.id then
                table.insert(t,j)
            end
        end
    end
    for i, v in ipairs(list) do
        if not self:IsInTable(v.id,self.selectList) then
            table.insert(t,v)
        end
    end
    return t
end

-- 遍历数组
function M:IsInTable(value, tbl)
    for k,v in ipairs(tbl) do
      if v == value then
        return true
      end
    end
    return false
end

--设置选择列表
function M:SetSelectList(roleID)
    if #self.selectList >= 5 and not table.Contains(self.selectList,roleID) then
        print("超过选择最大数量")
        return
    end

    if table.Contains(self.selectList,roleID) then
        for i, v in pairs(self.selectList) do
            if v == roleID then
                table.remove(self.selectList,i)
            end
        end
    else
        table.insert(self.selectList,roleID)
    end
    self:ResetRoleItem()
    self:SetXuanZeTxt()
end

--Text_Yixuanze
--设置选择文本
function M:SetXuanZeTxt()
    self.Text_Yixuanze().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text34") .. #self.selectList .. "/5"
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
return M