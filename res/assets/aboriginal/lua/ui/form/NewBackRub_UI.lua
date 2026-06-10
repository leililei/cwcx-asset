-- Code Auto Create Begin
local M = Class('NewBackRub_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewBackRub_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewBackRub_UI].prefab'
    self.Name = 'Form[NewBackRub_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Img_Maintenancedi','Content/MaintenancePanel/Btn_Maintenance/Img_Maintenancedi',2},{'Img_Zhuangshi','Content/MaintenancePanel/Btn_Maintenance/Img_Zhuangshi',2},{'VoiceIcon','Content/MaintenancePanel/Btn_Maintenance/VoiceIcon',2},{'loveIcon_n','Content/MaintenancePanel/Btn_Maintenance/Content/loveIcon/loveIcon_n',2},{'loveIcon_d','Content/MaintenancePanel/Btn_Maintenance/Content/loveIcon/loveIcon_d',2},{'Img_Duck','Content/MaintenancePanel/Btn_Maintenance_suo/Img_Duck',2},{'Img_Tips','Content/MaintenancePanel/Btn_Maintenance_suo/Img_Tips',2},{'Img_Maintenancedi2','Content/MaintenancePanel/Btn_Maintenance_suo/Img_Maintenancedi2',2},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'Text_Name','Content/MaintenancePanel/Btn_Maintenance/Text_Name',20},{'Text_weihuoqu','Content/MaintenancePanel/Btn_Maintenance_suo/Img_Tips/Text_weihuoqu',20},{'Text_Name01','Content/MaintenancePanel/Btn_Maintenance_suo/Img_Maintenancedi2/Text_Name',20},
    }
end
-- Code Auto Create End
return M