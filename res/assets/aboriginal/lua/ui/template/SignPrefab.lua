-- Code Auto Create Begin
local M = Class('SignPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SignPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SignPrefab','/',2},{'bg_activity_xs_n','Signitem/bg_activity_xs_n',2},{'ItemPanel','Signitem/ItemPanel',2},{'SignItemRankImg','Signitem/ItemPanel/SignItemRankImg',2},{'SignItemIconImg','Signitem/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot','Signitem/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','Signitem/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','Signitem/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi','Signitem/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},{'img_activity_xs_mask','Signitem/img_activity_xs_mask',2},{'img_activity_xs_claimed','Signitem/img_activity_xs_mask/img_activity_xs_claimed',2},{'bg_activity_xs_h_S','Signitem_Light/bg_activity_xs_h_S',2},{'bg_activity_xs_h_X','Signitem_Light/bg_activity_xs_h_X',2},{'bg_activity_xs_h_02','Signitem_Light/bg_activity_xs_h_02',2},{'bg_activity_xs_h','Signitem_Light/bg_activity_xs_h',2},{'ItemPanel01','Signitem_Light/ItemPanel',2},{'SignItemRankImg01','Signitem_Light/ItemPanel/SignItemRankImg',2},{'SignItemIconImg01','Signitem_Light/ItemPanel/SignItemIconImg',2},{'Img_ItemCountPivot01','Signitem_Light/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg01','Signitem_Light/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao01','Signitem_Light/ItemPanel/Img_Zhezhao',2},{'Img_Yilingqudi01','Signitem_Light/ItemPanel/Img_Zhezhao/Img_Yilingqudi',2},
        -- UITemplate 列表
        {'SignPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_day','Signitem/bg_activity_xs_n/Text_day',20},{'Text_sign','Signitem/bg_activity_xs_n/Text_sign',20},{'Text_shuzi','Signitem/bg_activity_xs_n/Text_shuzi',20},{'Text_ItemCount','Signitem/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','Signitem/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},{'Text_day01','Signitem_Light/bg_activity_xs_h/Text_day',20},{'Text_sign01','Signitem_Light/bg_activity_xs_h/Text_sign',20},{'Text_shuzi01','Signitem_Light/bg_activity_xs_h/Text_shuzi',20},{'Text_ItemCount01','Signitem_Light/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu01','Signitem_Light/ItemPanel/Img_Zhezhao/Text_Yilingqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()

end

function M:OnUpdateUI(pData)
end
return M