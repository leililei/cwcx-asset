-- Code Auto Create Begin
local M = Class('FavorabilityRankPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.FavorabilityRankPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[FavorabilityRankPop_UI].prefab'
    self.Name = 'Form[FavorabilityRankPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_Xian2','Img_Xian2',2},{'Img_Xian1','Img_Xian1',2},{'Tanchuangdi','Tanchuangdi',2},{'di','Tanchuangdi/di',2},{'Img_Haogandudi','Tanchuangdi/Img_Haogandudi',2},{'RoleFavorabilityPanel','Tanchuangdi/RoleFavorabilityPanel',2},{'CenterFavorSlider','Tanchuangdi/RoleFavorabilityPanel/CenterFavorSlider',2},{'FavorabilityRankPanel','Tanchuangdi/FavorabilityRankPanel',2},{'ItemPanel','Tanchuangdi/ItemPanel',2},{'Btn_Confirm','Tanchuangdi/Btn_Confirm',2},{'Btn_Cancel','Tanchuangdi/Btn_Cancel',2},
        -- UITemplate 列表
        {'FavorabilityRankItem','Tanchuangdi/FavorabilityRankPanel/Content/FavorabilityRankItem',10},{'FavorabilityRankItem(1)','Tanchuangdi/FavorabilityRankPanel/Content/FavorabilityRankItem (1)',10},{'FavorabilityRankItem(2)','Tanchuangdi/FavorabilityRankPanel/Content/FavorabilityRankItem (2)',10},{'FavorabilityRankItem(3)','Tanchuangdi/FavorabilityRankPanel/Content/FavorabilityRankItem (3)',10},{'ItemPrefab','Tanchuangdi/ItemPanel/ItemPrefab',10},
        -- LoopScrollRect 列表
        {'FavorabilityRankPanel01','Tanchuangdi/FavorabilityRankPanel',18},{'ItemPanel01','Tanchuangdi/ItemPanel',18},
        -- TextMeshProUGUI 列表
        {'Text_Haogandu','Tanchuangdi/Img_Haogandudi/Text_Haogandu',20},{'FavorabilityRankText','Tanchuangdi/RoleFavorabilityPanel/CurRoleFavorabilityText/FavorabilityRankText',20},{'Text_Exp','Tanchuangdi/RoleFavorabilityPanel/Text_Exp',20},{'Text_Confirm','Tanchuangdi/Btn_Confirm/Text_Confirm',20},{'Text_Cancel','Tanchuangdi/Btn_Cancel/Text_Cancel',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---初始化按钮
    self:InitButton()
end
function M:OnShow(pData)
    ---@type RoleData
    self.hero = pData[1]
    self.parent = pData[2]
    if pData[3] ~= nil then
        self.grandParent = pData[3]
    end
    ---总好感提升值
    self.totalFavorUp = {
        [1] = 0,
        [2] = 0,
        [3] = 0
    }
    ---各种物品数量
    self.totalCount = {}
    self.Successful = false
    ---UI刷新
    self:FreshUI()
    ---加载好感度等级奖励
    self:RegisterLoopScroll()
    ---加载好感度物品
    self:RegisterItemPanel()
    self:Fresh(0)
end
---刷新好感
function M:FreshUI()
    self.tCurFavorLv, self.tExpRatio, self.tLvLimit,self.tCurExp, self.tCurExpLimit = Global.CheckFavorLv(self.hero.favor)
    ---当前
    self.FavorabilityRankText().text = self.tCurFavorLv
    self.CenterFavorSlider().fillAmount = self.tCurFavorLv / self.tLvLimit
    self.CenterFavorSlider().fillAmount = self.tExpRatio
    self.Text_Exp().text = MgrLanguageData.GetLanguageByKey("ui_tips_2") ..":  <color=#1effe8>".. self.tCurExp .."</color>/" .. self.tCurExpLimit
end
---刷新物品
function M:Fresh(offset)
    ---好感度奖励
    ---获取当前loop数据
    self.favorData = HeroControl.GetFavorAbility(self.hero.id)
    Global.Sort(self.favorData,{"favorAbility"},false)
    ---设置Loop数量
    self.FavorabilityRankPanel01().totalCount = #self.favorData
    if offset then
        self.FavorabilityRankPanel01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.FavorabilityRankPanel01():RefreshCells()              ---只刷新数据
    end
    BagViewModel.ReloadCacheData()
    ---背包物品
    local BagItems = BagViewModel.GetItemData(3)
    self.BagItems = ItemControl.GetFriendItemData()
    for i, v in pairs(BagItems) do
        if v.costeffect[1] == 1 then
            --table.insert(self.BagItems,v)
            for k,val in pairs(self.BagItems) do
                if val.id == v.id then
                    val.count = v.count
                end
            end
        end
    end
    table.sort(self.BagItems,function(a, b)
        if a.id > b.id then
            return false
        else
            return true
        end
    end)
    self.ItemPanel01().totalCount = #self.BagItems
    if offset then
        self.ItemPanel01():RefillCells(offset)
    else
        self.ItemPanel01():RefreshCells()
    end
end

function M:RegisterLoopScroll()
    self.FavorabilityRankPanel01():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:RegisterItemPanel()
    self.ItemPanel01():SetLuaCellEvent(Handle(self,self.CellBagItem))
end

function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.favorData[idx],self,idx})
end

function M:CellBagItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.BagItems[idx],self,idx})
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self,self.ClosePop))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self,self.UseItem))
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,Handle(self,self.ClosePop))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:ClosePop()
    end
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

function M:CumulativeFavor(index,fav,id,count,type)
    local favor = self.hero.favor
    self.totalFavorUp[index] = fav
    for i = 1, #self.totalFavorUp do
        favor = favor + self.totalFavorUp[i]
    end
    self.totalCount[index] = {i = id,c = count,t = type}

    self.tCurFavorLv, self.tExpRatio, self.tLvLimit,self.tCurExp, self.tCurExpLimit = Global.CheckFavorLv(favor)
    UnityEngine.Debug.LogError(self.tCurFavorLv .."  ".. self.tExpRatio .."  ".. self.tLvLimit .."  ".. self.tCurExp .."  ".. self.tCurExpLimit)
    self.FavorabilityRankText().text = self.tCurFavorLv
    self.CenterFavorSlider().fillAmount = self.tCurFavorLv / self.tLvLimit
    self.CenterFavorSlider().fillAmount = self.tExpRatio
    self.Text_Exp().text = MgrLanguageData.GetLanguageByKey("ui_tips_2") .. ":  <color=#1effe8>".. self.tCurExp .."</color>/" .. self.tCurExpLimit

    self.ItemPanel01().totalCount = #self.BagItems
    self.ItemPanel01():RefreshCells()
end

function M:UseItem()
    ---计算最大好感度
    local MaxFavor = Global.MaxFavorLv()
    local tot = 0
    for i = 1, #self.totalFavorUp do
        tot = tot + self.totalFavorUp[i]
    end
    if tot == 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_favorability_fail3"),1},true)
        return
    end
    --if (self.hero.favor + tot) > MaxFavor then
    --    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_favorability_fail2"),1},true)
    --    return
    --end
    local costs = {}
    local idx = 1
    for i, v in pairs(self.totalCount) do
        if v.c ~= 0 then
            table.insert(costs,idx,{
                goodsType = v.t,
                goodsID = v.i,
                goodsNum = v.c
            })
            idx = idx + 1
        end
    end

    local req = {
        heroID = self.hero.id,
        cost = costs
    }
    local bytes = assert(pb.encode('PBClient.ClientHeroFavorUPREQ',req))
    MgrNet.SendReq(MID.CLIENT_HERO_FAVOR_UP_REQ,bytes,0,nil,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientHeroFavorUPACK',buffer))
        print(tab.errNo)
        if tab.errNo~=0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_favorability_fail1"),1},true)
        end
    end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientHeroFavorUPNTF',buffer))
        TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
        HeroControl.PushSingleHeroData(tab.info)
        ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_favorability_up1"),1},true)
        self.Successful = true
        self.ItemPanel01().totalCount = #self.BagItems
        self.ItemPanel01():RefillCells()

        self.totalFavorUp = {
            [1] = 0,
            [2] = 0,
            [3] = 0
        }
        self.totalCount = {}
        self:Fresh(0)
        self:FreshUI()
        if self.parent.Uid == UID.NewRoleDetail2_UI then
            self.parent:UpdataDetailPanel()
            self.parent:UpdateRoleFavorInfo(self.parent.CurHero)
        elseif self.parent.Uid == UID.RoleDocument_UI then
            self.parent:FreshFavor()
            self.parent:InitTxtData()
            self.parent:ReloadPesonalData(0)
            self.grandParent:UpdataDetailPanel()
            self.grandParent:UpdateRoleFavorInfo(self.grandParent.CurHero)
        end

    end)
end

return M