-- Code Auto Create Begin
local M = Class('DaojuzixuanPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DaojuzixuanPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DaojuzixuanPop].prefab'
    self.Name = 'Form[DaojuzixuanPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'RoleInfoPreview','RoleInfoPreview',2},{'ClickBackArea','RoleInfoPreview/ClickBackArea',2},{'ClickBackAreaMask','RoleInfoPreview/ClickBackAreaMask',2},{'Img_Tanchuangdi','RoleInfoPreview/Img_Tanchuangdi',2},{'Img_Xian1','RoleInfoPreview/Img_Tanchuangdi/Img_Xian1',2},{'Img_Xian2','RoleInfoPreview/Img_Tanchuangdi/Img_Xian2',2},{'bg','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/bg',2},{'NeedPanelRoot','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/bg/NeedPanelRoot',2},{'WupinPanel','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel',2},{'Img_Selected','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/Img_Selected',2},{'wpGo','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/wpGo',2},{'WupinIcon','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/wpGo/WupinIcon',2},{'Img_ItemCountPivot','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/wpGo/Img_ItemCountPivot',2},{'Img_ItemCountBg_Wp','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp',2},{'Background','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Background',2},{'Fill','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Fill Area/Fill',2},{'Handle','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle',2},{'Handle(1)','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider/Handle Slide Area/Handle/Handle (1)',2},{'Btn_LvDownLight','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight',2},{'-(hei)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDownLight/-(hei)2',2},{'Btn_LvDown','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDown',2},{'-(hui)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvUpLight','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight',2},{'+(hei)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUpLight/+(hei)2',2},{'Btn_LvUp','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUp',2},{'+(hui)2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Btn_LvUp/+(hui)2',2},{'Btn_Confirm_hui','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui',2},{'Img_Quedingdi','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui/Img_Quedingdi',2},{'Btn_Confirm','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm',2},{'Img_Quedingdi01','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm/Img_Quedingdi',2},{'Btn_Cancel','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel',2},{'Img_Quxiaodi','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel/Img_Quxiaodi',2},{'biaotixian','RoleInfoPreview/Img_Tanchuangdi/biaotixian',2},
        -- Slider 列表
        {'Slider','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Slider',5},
        -- TextMeshProUGUI 列表
        {'ItemRemainText','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/WupinPanel/wpGo/Img_ItemCountPivot/Img_ItemCountBg_Wp/ItemRemainText',20},{'Text_Shuoming1','RoleInfoPreview/Img_Tanchuangdi/NeedPanel/Text_Shuoming1',20},{'Text_WpShu','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu',20},{'Text_WpShu_zuo','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu_zuo',20},{'Text_WpShu_you','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_WpShu_you',20},{'Text_Shuoming2','RoleInfoPreview/Img_Tanchuangdi/WpShuPanel/Text_Shuoming2',20},{'Text_confirm','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm_hui/Text_confirm',20},{'Text_confirm01','RoleInfoPreview/Img_Tanchuangdi/Btn_Confirm/Text_confirm',20},{'Text_cancel','RoleInfoPreview/Img_Tanchuangdi/Btn_Cancel/Text_cancel',20},{'PanelTitleText','RoleInfoPreview/Img_Tanchuangdi/PanelTitleText',20},
    }
end
-- Code Auto Create End
return M