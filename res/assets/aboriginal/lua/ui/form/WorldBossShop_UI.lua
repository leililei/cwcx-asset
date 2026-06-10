-- Code Auto Create Begin
local M = Class('WorldBossShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WorldBossShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WorldBossShop_UI].prefab'
    self.Name = 'Form[WorldBossShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Spine_Luonisi','Spine_Luonisi',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'UpperRightPanel','TopView/UpperRightPanel',2},{'Cailiao1','TopView/UpperRightPanel/Cailiao1',2},{'Img_BG01','TopView/UpperRightPanel/Cailiao1/Img_BG',2},{'Icon1','TopView/UpperRightPanel/Cailiao1/Icon1',2},{'Img_Shopdi','Img_Shopdi',2},{'ShopGoodsItem','ShopItemScroll/ShopGoodsItem',2},
        -- UITemplate 列表
        {'ShopGoodsItem01','ShopItemScroll/ShopGoodsItem',10},
        -- RawImage 列表
        {'ShopItemScroll','ShopItemScroll',15},{'Content','ShopItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'ShopItemScroll01','ShopItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',20},{'Text_Shu','TopView/UpperRightPanel/Cailiao1/Text_Shu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---初始化按钮
    self:InitBtn()
    ---注册右侧商品列表
    self.ShopItemScroll01():SetLuaCellEvent(function(trans, idx)
        ---传入数据
        trans:GetComponent("UITemplate"):SetData({self.ShopItemList[idx],idx, self,Handle(self,self.RefreshCurShop)})
    end)
    ---初始化商店
    self:RefreshCurShop()
end
function M:InitBtn()
     ---点击联讨币，前往联合讨伐
     UIEvent.LuaClick(self.Icon1().gameObject,function()
         local a = {"tz","zz","lhtf","01"}
         MgrLink.LinkStart(a)
     end)
    ---注册返回按钮
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))

    
    ---注册帮助按钮
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(84)
    end))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        MgrUI.GoBack()
    end
end

function M:InitIcon()
    local bag = ItemControl.GetAllItems()
    self.Text_Shu().text = self:CoinCount(100004,bag)
end
function M:CoinCount(Id,bag)
    return JNStrTool.numberAbbr(bag[Id].count)
end
---刷新/初始化当前商店信息
function M:RefreshCurShop()
    self.ChildShopList = ShopViewModel.SortActivityChildData(114003)
    for i ,v in pairs(self.ChildShopList) do
        if v.id == 500 then
            self.ShopItemList = ShopViewModel.SortItemData(v)
            break
        end
    end
    self.ShopItemScroll01().totalCount = #self.ShopItemList
    self.ShopItemScroll01():RefillCells()
    ---初始化货币
    self:InitIcon()
end
return M