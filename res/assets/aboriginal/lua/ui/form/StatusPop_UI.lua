-- Code Auto Create Begin
local M = Class('StatusPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StatusPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StatusPop_UI].prefab'
    self.Name = 'Form[StatusPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Tanchuang','Tanchuang',2},{'Img_Xian2','Tanchuang/Img_Xian2',2},{'Img_Xian1','Tanchuang/Img_Xian1',2},{'Img_Biaotixian','Tanchuang/Text_Title/Img_Biaotixian',2},{'Img_OpenFilterdi','Tanchuang/Btn_OpenFilter/Img_OpenFilterdi',2},{'Pailieicon','Tanchuang/Btn_OpenFilter/Pailieicon',2},{'RoleStatusPrefab','Tanchuang/RoleStatusScroll/RoleStatusPrefab',2},{'Img_di','Tanchuang/Btn_Chongzhizhuangtai/Img_di',2},{'Img_Xiaohaotili','Tanchuang/Btn_Chongzhizhuangtai/Img_Xiaohaotili',2},{'Img_Tiliicon','Tanchuang/Btn_Chongzhizhuangtai/Img_Xiaohaotili/Img_Tiliicon',2},{'Img_di01','Tanchuang/Btn_Chongzhizhuangtai_hui/Img_di',2},{'Img_Xiaohaotili01','Tanchuang/Btn_Chongzhizhuangtai_hui/Img_Xiaohaotili',2},{'Img_Tiliicon01','Tanchuang/Btn_Chongzhizhuangtai_hui/Img_Xiaohaotili/Img_Tiliicon',2},
        -- Button 列表
        {'Btn_OpenFilter','Tanchuang/Btn_OpenFilter',4},{'Btn_Chongzhizhuangtai','Tanchuang/Btn_Chongzhizhuangtai',4},{'Btn_Chongzhizhuangtai_hui','Tanchuang/Btn_Chongzhizhuangtai_hui',4},
        -- UITemplate 列表
        {'RoleStatusPrefab01','Tanchuang/RoleStatusScroll/RoleStatusPrefab',10},
        -- RawImage 列表
        {'Btn_OpenFilter01','Tanchuang/Btn_OpenFilter',15},{'RoleStatusScroll','Tanchuang/RoleStatusScroll',15},
        -- LoopScrollRect 列表
        {'RoleStatusScroll01','Tanchuang/RoleStatusScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title','Tanchuang/Text_Title',20},{'Text_Pailie','Tanchuang/Btn_OpenFilter/Text_Pailie',20},{'Text_Tips','Tanchuang/Text_Tips',20},{'Text_Chongzhicishu','Tanchuang/Text_Chongzhicishu',20},{'Text_Chongzhizhuangtai','Tanchuang/Btn_Chongzhizhuangtai/Text_Chongzhizhuangtai',20},{'Text_PCNum','Tanchuang/Btn_Chongzhizhuangtai/Img_Xiaohaotili/Text_PCNum',20},{'Text_Chongzhizhuangtai01','Tanchuang/Btn_Chongzhizhuangtai_hui/Text_Chongzhizhuangtai',20},{'Text_PCNum01','Tanchuang/Btn_Chongzhizhuangtai_hui/Img_Xiaohaotili/Text_PCNum',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Text_Chongzhicishu().gameObject:SetActive(false)
    ---初始化角色滚动条
    self:InitRoleStatusScroll()
    ---初始化按钮
    self:InitButton()
    ---初始化UI
    self:InitUI()
end

function M:OnUpdateUI()
    ---获取服务器血量
    local heroHP = YueTaViewModel.GetServerData().towerHero
    if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        heroHP = YueTaViewModel.GetServerData().innerTowerHero
    end
    local MyHeros = HeroControl.GetHaveHero()
    self:FreshRoleScroll(heroHP,MyHeros)
end

function M:InitButton()
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        MgrUI.ClosePop(self.Uid)
    end)
    ---打开排序窗口
    UIEvent.LuaClick(self.Btn_OpenFilter().gameObject,Handle(self,function()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            ---获取排序规则
            self.CurCardFilter = filter
            self.CurCardSort = sort
            self.CurCardRise = rise
            ---刷新UI
            self:ReloadSelectRole()
        end,2},true)
    end))
    ---重置角色血量
    UIEvent.LuaClick(self.Btn_Chongzhizhuangtai().gameObject,Handle(self,function()
        local count = YueTaViewModel.GetServerData().heroResetCount
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            count = YueTaViewModel.GetServerData().innerHeroResetCnt
            if count >= YueTaViewModel.GetHardResetHeroLimit() then
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_40"), 1}, true)
                return
            end
        end
        local zsCount = 0
        if count == nil or count == 0 or YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        else
            zsCount = YueTaViewModel.ReturnResetCost().count
        end
        if zsCount > ItemControl.GetItemByID(YueTaViewModel.ReturnResetCost().id).count then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("shopviewmodel_tips2"), 1}, true)
        else
            MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_6"),zsCount),function()
                YueTaViewModel.ResetAllHeroHPReq(function()
                    self:FreshRoleScroll(YueTaViewModel.GetServerData().towerHero,HeroControl.GetHaveHero())
                    self.Text_Chongzhizhuangtai().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_1"),YueTaViewModel.ResetCountTime()-YueTaViewModel.GetServerData().heroResetCount,YueTaViewModel.ResetCountTime())
                   
                    Event.Go("ResetYueTaHPCallback")
                    ---刷新一下次数和货币数量
                    self:InitUI()
                end
                )
            end,nil,2},true)
        end
    end))
end
function M:InitUI()
    local tResetHeroLimit = YueTaViewModel.ResetCountTime()
    local tResetHeroCount = YueTaViewModel.ResetCountTime()-YueTaViewModel.GetServerData().heroResetCount
    if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        self.Text_Tips().gameObject:SetActive(false)
        tResetHeroLimit = YueTaViewModel.GetHardResetHeroLimit()
        tResetHeroCount = YueTaViewModel.GetHardResetHeroLimit()-YueTaViewModel.GetServerData().innerHeroResetCnt
    end
    ---重置角色血量次数
    self.Text_Chongzhizhuangtai().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_1"),tResetHeroCount,tResetHeroLimit)
    self.Text_Chongzhizhuangtai01().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_1"),tResetHeroCount,tResetHeroLimit)

    if tResetHeroCount <= 0 then
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(false)
        self.Btn_Chongzhizhuangtai_hui().gameObject:SetActive(true)
    else
        self.Btn_Chongzhizhuangtai().gameObject:SetActive(true)
        self.Btn_Chongzhizhuangtai_hui().gameObject:SetActive(false)
    end
    local restCost = YueTaViewModel.ReturnResetCost()
    if YueTaViewModel.GetServerData().heroResetCount == 0 or YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        self.Text_PCNum().text = 0
        self.Text_PCNum01().text = 0
    else
        self.Text_PCNum().text = restCost.count
        self.Text_PCNum01().text = restCost.count
    end
    MgrRes.LoadSprite(self.Img_Tiliicon(),restCost.icon)
    MgrRes.LoadSprite(self.Img_Tiliicon01(),restCost.icon)
    --self.Text_Chongzhicishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_18"),YueTaViewModel.GetServerData().heroResetCountTotal)
end
function M:FreshRoleScroll(heroHP,MyHeros)
    self.newHeroTab = {}
    for i,v in ipairs(MyHeros) do
        self.newHeroTab[v.id] = {hero = v, hp = 10000}
    end
    if heroHP ~= nil then
        for i,v in pairs(heroHP) do
            if self.newHeroTab[v.heroID] then
                self.newHeroTab[v.heroID].hp = v.hP
            end
        end
    end
    ---按照MyHeros的排序来排顺序
    local tab = {}
    for j,role in ipairs(MyHeros) do
        for i,v in pairs(self.newHeroTab) do
            if role.id == i then
                table.insert(tab,j,v)
            end
        end
    end
    self.newHeroTab = tab
    self.roleData = tab
    self.RoleStatusScroll01().totalCount = #tab
    self.RoleStatusScroll01():RefillCells()
end

function M:InitRoleStatusScroll()
    self.RoleStatusScroll01():SetLuaCellEvent(Handle(self,self.RoleStatusCellItem))
end
function M:RoleStatusCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.newHeroTab[idx])
end
---更新替换队员面板
function M:ReloadSelectRole()
    ---获取拥有的角色
    self.roleData = self:GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    ---把设为喜欢的放到最前面
    --local isLove
    --local newTab = {}
    --local newTab2 = {}
    --for i, v in pairs(self.roleData) do
    --    isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",v.id))
    --    if isLove ~= nil and  isLove ~= "" then
    --        table.insert(newTab,v)
    --    else
    --        table.insert(newTab2,v)
    --    end
    --end
    --for i = 1, #newTab2 do
    --    table.insert(newTab,#newTab + 1,newTab2[i])
    --end
    --self.roleData = newTab

    ---如果是自己的角色，则要把武器等级和核心数据都填上
    for i, v in pairs(self.roleData) do
        ---@type EquipData[]
        local equipData = v:GetHeroVoidEquip()
        for i, value in ipairs(equipData) do
            v.equipLvArr[i] = value.level
        end
    end
    local heroHP = YueTaViewModel.GetServerData().towerHero
    if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        heroHP = YueTaViewModel.GetServerData().innerTowerHero
    end
    self:FreshRoleScroll(heroHP,self.roleData)
end

---@return RoleData[] 获取筛选排序后的英雄数据
function M:GetSortAndFilterHeroArr(filters,sort,rise)
    local array = nil
    array = HeroControl.GetHaveHero()
    ---有类型时筛选
    if filters and not filters[0] then
        ---筛选
        local filterGroup = {}
        for i, v in pairs(filters) do
            if v then
                table.insert(filterGroup,i)
            end
        end
        array = StormViewModel.RoleFilter(array, "New_Career", filterGroup)
    end
    ---排序(1等级，2星级，3稀有度，4好感度,5取得时间)
    local sortGroupArr = {
        [1] = {"level","star","rank","awaken","id"},
        [2] = {"star","level","rank","awaken","id"},
        [3] = {"rank","star","level","id"},
        [4] = {"favor","rank","level","id"},
        [5] = {"cTime","id"},
    }
    Global.Sort(array,sortGroupArr[sort],rise)
    return array
end

return M