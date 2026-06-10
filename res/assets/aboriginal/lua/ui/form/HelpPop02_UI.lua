-- Code Auto Create Begin
local M = Class('HelpPop02_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HelpPop02_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HelpPop02_UI].prefab'
    self.Name = 'Form[HelpPop02_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Switchdi','Img_Switchdi',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchRoot','SwitchRoot',2},{'SwitchPanel','SwitchRoot/SwitchPanel',2},{'Img_Qieyexian','SwitchRoot/SwitchPanel/Img_Qieyexian',2},{'SwitchPrefab','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab',2},{'Btn_Switch','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_Switch',2},{'Img_Qieyedian','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'AllRedDotIcon','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/AllRedDotIcon',2},{'Img_Qieyedi','SwitchRoot/SwitchPanelSecond/Img_Qieyedi',2},{'Img_Qieyedi_H','SwitchRoot/SwitchPanelSecond/Img_Qieyedi_H',2},{'Img_Qieyekuang','SwitchRoot/SwitchPanelSecond/Img_Qieyedi_H/Img_Qieyekuang',2},{'Btn_Last','RightPanel/Btn_Last',2},{'Btn_Next','RightPanel/Btn_Next',2},{'Panel','RightPanel/Panel',2},{'Tu','RightPanel/Panel/Tu',2},{'Img_Dian','RightPanel/Panel/Tu/Img_Dian',2},{'Img_Dangqiandian','RightPanel/Panel/Tu/Img_Dangqiandian',2},{'Shiyitu','RightPanel/Panel/Tu/Shiyitu',2},{'ScrollView','RightPanel/Panel/Tu/Scroll View',2},{'Viewport','RightPanel/Panel/Tu/Scroll View/Viewport',2},{'Help_Instruction_Content','RightPanel/Panel/Tu/Scroll View/Viewport/Help_Instruction_Content',2},{'Help_Instruction_Image','RightPanel/Panel/Tu/Scroll View/Viewport/Help_Instruction_Image',2},{'Img_Biaotidi','RightPanel/Panel/Zi/Img_Biaotidi',2},{'Text_Instruction','RightPanel/Panel/Zi/Text_Instruction',2},{'Viewport01','RightPanel/Panel/Zi/Text_Instruction/Viewport',2},
        -- Toggle 列表
        {'SwitchPrefab01','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab',13},
        -- RawImage 列表
        {'SwitchScroll','SwitchRoot/SwitchPanel/SwitchScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchRoot/SwitchPanel/SwitchScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Help_CN','UpperLeftPanel/Text_Help/Text_Help_CN',20},{'Text_Help_EN','UpperLeftPanel/Text_Help/Text_Help_EN',20},{'CNText','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_Switch/CNText',20},{'CNText01','SwitchRoot/SwitchPanel/SwitchScroll/Content/SwitchPrefab/Btn_SwitchHighLight/CNText',20},{'Text_Qieyeming','SwitchRoot/SwitchPanelSecond/Text_Qieyeming',20},{'Text_Title','RightPanel/Panel/Zi/Img_Biaotidi/Text_Title',20},{'Text_HelpUI_Instruction','RightPanel/Panel/Zi/Text_Instruction/Viewport/Content/Text_HelpUI_Instruction',20},
    }
end
-- Code Auto Create End
return M