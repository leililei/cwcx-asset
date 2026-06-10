-- Code Auto Create Begin
local M = Class('VoidGearPreviewPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearPreviewPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearPreviewPop].prefab'
    self.Name = 'Form[VoidGearPreviewPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_bg','PopPanel/Img_bg',2},{'Img_Xian2','PopPanel/Img_bg/Img_Xian2',2},{'Img_Xian1','PopPanel/Img_bg/Img_Xian1',2},{'Img_Biaotixian','PopPanel/Img_bg/Text_Title/Img_Biaotixian',2},{'Img_di','PopPanel/Img_bg/Img_di',2},{'Scorll','PopPanel/Img_bg/Scorll',2},{'Image','PopPanel/Img_bg/Scorll/InfoPrefab/Text_Dengji/Image',2},{'Img_Shuxingdi','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/VoidGearPrefab/Img_Shuxingdi',2},{'VoidIconBG','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/VoidGearPrefab/VoidIconBG',2},{'VoidGearIcon','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/VoidGearPrefab/VoidGearIcon',2},{'Img_Shuxingdi01','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/GearSkillPrefab/Img_Shuxingdi',2},{'VoidIconBG01','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/GearSkillPrefab/VoidIconBG',2},{'VoidGearIcon01','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/GearSkillPrefab/VoidGearIcon',2},{'Btn_Chakan','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/GearSkillPrefab/Btn_Chakan',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','PopPanel/Img_bg/Text_Title',20},{'Text_Dengji','PopPanel/Img_bg/Scorll/InfoPrefab/Text_Dengji',20},{'VoidGearInfoText','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/VoidGearPrefab/VoidGearInfoText',20},{'VoidGearText','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/VoidGearPrefab/VoidGearText',20},{'GearSkillNameText','PopPanel/Img_bg/Scorll/InfoPrefab/VoidAttrPanel/GearSkillPrefab/GearSkillNameText',20},
    }
end
-- Code Auto Create End
return M
