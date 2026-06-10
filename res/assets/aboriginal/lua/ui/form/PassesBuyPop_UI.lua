-- Code Auto Create Begin
local M = Class('PassesBuyPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PassesBuyPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PassesBuyPop_UI].prefab'
    self.Name = 'Form[PassesBuyPop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Bg','Bg',2},{'Img_Senior','RightPanel/Img_Senior',2},{'Img_ChengSe','RightPanel/Img_Senior/Img_ChengSe',2},{'PassesPreviewItem','RightPanel/Img_Senior/MengBan/PassesPreviewItem',2},{'Btn_Buy','RightPanel/Img_Senior/Btn_Buy',2},{'Img_isBought','RightPanel/Img_Senior/Img_isBought',2},{'Img_Normal','RightPanel/Img_Normal',2},{'Img_ChengSe01','RightPanel/Img_Normal/Img_ChengSe',2},{'PassesPreviewItem01','RightPanel/Img_Normal/MengBan/PassesPreviewItem',2},{'Btn_Buy01','RightPanel/Img_Normal/Btn_Buy',2},{'Img_isBought01','RightPanel/Img_Normal/Img_isBought',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},
        -- UITemplate 列表
        {'PassesPreviewItem02','RightPanel/Img_Senior/MengBan/PassesPreviewItem',10},{'PassesPreviewItem03','RightPanel/Img_Normal/MengBan/PassesPreviewItem',10},
        -- RawImage 列表
        {'MengBan','RightPanel/Img_Senior/MengBan',15},{'MengBan01','RightPanel/Img_Normal/MengBan',15},
        -- LoopScrollRect 列表
        {'MengBan02','RightPanel/Img_Senior/MengBan',18},{'MengBan03','RightPanel/Img_Normal/MengBan',18},
        -- TextMeshProUGUI 列表
        {'Text_JiaGe','RightPanel/Img_Senior/Text_JiaGe',20},{'Text_Name','RightPanel/Img_Senior/Text_Name',20},{'Text_Bought(TMP)','RightPanel/Img_Senior/Img_isBought/Text_Bought (TMP)',20},{'Text_Describe1','RightPanel/Img_Senior/Text_Describe1',20},{'Text_Describe2','RightPanel/Img_Senior/Text_Describe2',20},{'Text_JiaGe01','RightPanel/Img_Normal/Text_JiaGe',20},{'Text_Name01','RightPanel/Img_Normal/Text_Name',20},{'Text_Bought(TMP)01','RightPanel/Img_Normal/Img_isBought/Text_Bought (TMP)',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
require("LocalData/PaidgoodsLocalData")
function M:OnInit()
    self:InitClick()
    self.PassesList = nil
    ---获取通行证商品数据
    for k,v in pairs(ShopViewModel.SortChildData(114001)) do
        if v.id == 0 then
            self.PassesList = ShopViewModel.SortItemData(v)
            break
        end
    end
    self.MyPasses = {
        self.Img_Normal().gameObject,
        self.Img_Senior().gameObject,
    }
    self:InitScroll()
    self:InitPasses()
end

function M:OnShow(args)

end

function M:InitClick()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackToFirst()
    end)
    ---点击返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

function M:InitPasses()
    self.isBoughtNormal = ShopControl.GetSingLeShopItemData(119997).buyCount >= 1   --是否购买普通通行证
    self.isBoughtSenior = ShopControl.GetSingLeShopItemData(119998).buyCount >= 1   --是否购买高级通行证
    self.isBoughtPerfect = ShopControl.GetSingLeShopItemData(119999).buyCount >= 1  --是否购买完美通行证
    ---如果已购买完美通行证
    if self.isBoughtPerfect then
        local arr = self:SetPassesList(119998)
        self:RefreshPasses(arr)
    else
        ---如果已购买普通通行证
        if self.isBoughtNormal then
            local arr = self:SetPassesList(119999)
            self:RefreshPasses(arr)
        else
            local arr = self:SetPassesList(119998)
            self:RefreshPasses(arr)
        end
    end
    if PassportViewModel.InitPassport ~= nil then
        PassportViewModel.InitPassport()
    end
end

function M:RefreshPasses(list)
    local num = 0
    for i = 1, #list do
        if ShopControl.GetSingLeShopItemData(list[i].id).buyCount >= 1 then
            num = i --解锁到哪个通行证
        end
    end
    for k,v in ipairs(self.MyPasses) do
        v.transform:Find("Text_Name"):GetComponent("TextMeshProUGUI").text = list[k].name
        local price = 0
        for i,v in pairs(PaidgoodsLocalData.tab) do     ---找到价格
            if v[3] == list[k].id then
                price = v[8]
                break
            end
        end
        v.transform:Find("Text_JiaGe"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("ui_shop_money").. price
        v.transform:Find("Img_isBought").gameObject:SetActive(k <= num)
        self.fallList = string.split(MonthpassbuyLocalData.tab[list[k].id][4],";")   --list[k].ladderItems[0]
        self.passesData = MonthpassbuyLocalData.tab[list[k].id]
        self:ReloadScroll(v.transform:Find("MengBan"):GetComponent("LoopVerticalScrollRect"),0)
        UIEvent.LuaClick(v.transform:Find("Btn_Buy").gameObject,function()
            -----如果已购买
            if ShopControl.GetSingLeShopItemData(list[k].id).buyCount >= 1 then
                return
            end
            ShopViewModel.FlyFunBuyGoods(list[k].id,Handle(self,self.InitPasses))
            --ShopViewModel.Test(function() self:InitPasses() end)
        end)
    end
end

function M:SetPassesList(excludeId)
    local arr = {}
    for k,v in pairs(self.PassesList) do
        if v.id ~= excludeId then
            table.insert(arr,v)
        end
    end
    return arr
end

---初始化滑块
function M:InitScroll()
    self.MengBan02():SetLuaCellEvent(Handle(self,self.CellItem))
    self.MengBan03():SetLuaCellEvent(Handle(self,self.CellItem))
end

---item回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.fallList[idx],self.passesData,idx})
end

function M:ReloadScroll(scroll,offset)
    scroll.totalCount = #self.fallList
    if offset then
        scroll:RefillCells(offset)
    else
        scroll:RefreshCells()
    end
end

return M