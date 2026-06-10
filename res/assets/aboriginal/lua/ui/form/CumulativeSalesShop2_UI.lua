--- 注意，生成代码会改变父类，请手动修改。
local CumulativeSalesShop_UI = require(UID.CumulativeSalesShop_UI.Path)
-- Code Auto Create Begin
local M = Class('CumulativeSalesShop2_UI', CumulativeSalesShop_UI)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CumulativeSalesShop2_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CumulativeSalesShop2_UI].prefab'
    self.Name = 'Form[CumulativeSalesShop2_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'RoleRoot','MainPanel/RoleRoot',2},{'Img_RoleSpine','MainPanel/RoleRoot/Img_RoleSpine',2},{'RoleClickArea','MainPanel/RoleRoot/Img_RoleSpine/RoleClickArea',2},{'Img_RoleVoiceBg','MainPanel/RoleRoot/Img_RoleVoiceBg',2},{'ShopContent','MainPanel/ShopList/ShopScroll/ShopContent',2},{'ShopCell','MainPanel/ShopList/ShopScroll/ShopCell',2},{'CoinItem','UpperRightPanel/CoinRoot/CoinItem',2},{'Img_Bg','UpperRightPanel/CoinRoot/CoinItem/Img_Bg',2},{'Img_Coin','UpperRightPanel/CoinRoot/CoinItem/Img_Coin',2},{'UpperLeftPanel','UpperLeftPanel',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Split','UpperLeftPanel/Img_Split',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},
        -- UITemplate 列表
        {'ShopCell01','MainPanel/ShopList/ShopScroll/ShopCell',10},
        -- LoopScrollRect 列表
        {'ShopScroll','MainPanel/ShopList/ShopScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_RoleVoice','MainPanel/RoleRoot/Img_RoleVoiceBg/Text_RoleVoice',20},{'Text_Coin','UpperRightPanel/CoinRoot/CoinItem/Text_Coin',20},{'Text_Title_CN','UpperLeftPanel/TitleRoot/Text_Title_CN',20},
    }
end
-- Code Auto Create End
---@class CumulativeSalesShop2_UI : CumulativeSalesShop_UI
local FormCls = M

return M
