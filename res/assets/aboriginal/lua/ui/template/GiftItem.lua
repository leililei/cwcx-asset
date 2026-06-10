-- Code Auto Create Begin
local M = Class('GiftItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GiftItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Giftdi','Img_Giftdi',2},{'GiftIcon','GiftIcon',2},{'GiftAmount','GiftAmount',2},{'Img_Love','FavorabilityValue/Img_Love',2},{'Img_Shiyongshuliangdi','AmountAdd/Img_Shiyongshuliangdi',2},{'Btn_LvDownHighLight','AmountAdd/Btn_LvDownHighLight',2},{'-(hei)2','AmountAdd/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvUpHighLight','AmountAdd/Btn_LvUpHighLight',2},{'+(hei)2','AmountAdd/Btn_LvUpHighLight/+(hei)2',2},
        -- UITemplate 列表
        {'GiftItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Amount','GiftAmount/Text_Amount',20},{'Text_Gift','Text_Gift',20},{'Text_FavorabilityValue','FavorabilityValue/Text_FavorabilityValue',20},{'Text_Amount01','AmountAdd/Text_Amount',20},
    }
end
-- Code Auto Create End
return M