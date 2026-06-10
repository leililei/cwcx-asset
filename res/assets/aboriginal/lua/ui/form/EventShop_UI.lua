-- Code Auto Create Begin
local M = Class('EventShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventShop_UI].prefab'
    self.Name = 'Form[EventShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_lifa','Img_lifa',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'Btn_JYJuan','TopView/Huobi/Btn_JYJuan',2},{'Btn_Add','TopView/Huobi/Btn_JYJuan/Btn_Add',2},{'Img_JYicon','TopView/Huobi/Btn_JYJuan/Img_JYicon',2},{'Btn_TaoFaBi','TopView/Huobi/Btn_TaoFaBi',2},{'Img_Taofaicon','TopView/Huobi/Btn_TaoFaBi/Img_Taofaicon',2},{'Btn_Add01','TopView/Huobi/Btn_TaoFaBi/Btn_Add',2},{'Btn_FriendshipCoin','TopView/Huobi/Btn_FriendshipCoin',2},{'Btn_Add02','TopView/Huobi/Btn_FriendshipCoin/Btn_Add',2},{'Img_Friendshopicon','TopView/Huobi/Btn_FriendshipCoin/Img_Friendshopicon',2},{'ShopPanel','ShopPanel',2},{'EventShopItem','ShopPanel/ShopItemScroll/EventShopItem',2},
        -- Text 列表
        {'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',3},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',3},{'Text_JYJCount','TopView/Huobi/Btn_JYJuan/Text_JYJCount',3},{'Text_TFCount','TopView/Huobi/Btn_TaoFaBi/Text_TFCount',3},{'Text_FCCount','TopView/Huobi/Btn_FriendshipCoin/Text_FCCount',3},
        -- UITemplate 列表
        {'EventShopItem01','ShopPanel/ShopItemScroll/EventShopItem',10},
        -- RawImage 列表
        {'ShopItemScroll','ShopPanel/ShopItemScroll',15},
        -- LoopScrollRect 列表
        {'ShopItemScroll01','ShopPanel/ShopItemScroll',18},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.EventShopItem().gameObject:SetActive(false)
    ---注册滑块
    self:RegisterLoopScroll()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---初始化按钮
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---帮助界面
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(101)
    end))
end

function M:OnUpdateUI()
    self:ReloadData(0)
    self.ShopItemScroll01():ScrollToCell(0, 3000)
    ---刷新货币
    self:ChangeWallet()
end


---注册滑块
function M:RegisterLoopScroll()
    self.ShopItemScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end
---任务回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.ShopItems[idx],self})
end
---设置滑动数据
function M:ReloadData(offset)
    ---获取当前loop数据
    ---@type ShopItemData[]
    self.ShopItems = {}
    local shopitems = ShopControl.GetCertainTypeShopData(ShopControl.childShopType.activity)
    for i,v in pairs(shopitems) do
        self.ShopItems[#self.ShopItems + 1] = v
    end
    ---设置Loop数量
    self.ShopItemScroll01().totalCount = #self.ShopItems
    if offset then
        self.ShopItemScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.ShopItemScroll01():RefreshCells()              ---只刷新数据
    end
end
---刷新滑块
function M:Refresh()
    self.ShopItemScroll01():ScrollToCell(0, 3000)
end

---刷新货币
function M:ChangeWallet()
    MgrRes.LoadSprite(self.Img_JYicon(),"Item/" ..ItemControl.GetItemByIdAndType(200001,4).icon)
    self.Text_JYJCount().text = ItemControl.GetItemByIdAndType(200001,4).count
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M