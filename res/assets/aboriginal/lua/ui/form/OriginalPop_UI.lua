-- Code Auto Create Begin
local M = Class('OriginalPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.OriginalPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[OriginalPop_UI].prefab'
    self.Name = 'Form[OriginalPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Img_Biaotixian','Img_Biaotixian',2},{'Img_Lihuidi','RoleHead/Img_Lihuidi',2},{'Icon_RIHead','RoleHead/Icon_RIHead',2},{'Icon_RIFrame','RoleHead/Icon_RIFrame',2},{'Icon_RICareer','RoleHead/Icon_RICareer',2},{'Jinengfanwei','Jinengfanwei',2},{'Img_Fanwei','Jinengfanwei/Img_Fanwei',2},{'Mubiaofanwei','Mubiaofanwei',2},{'Image','Mubiaofanwei/Image',2},{'Img_Mubiao','Mubiaofanwei/Img_Mubiao',2},{'Yuanzuijieshao','Yuanzuixinxi/Yuanzuijieshao',2},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'Text_Rolename','RoleHead/Text_Rolename',20},{'Text_Jinengfanwei','Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','Mubiaofanwei/Text_Mubiaoshuoming',20},{'Text_Yuanzuijieshao','Yuanzuixinxi/Yuanzuijieshao/Text_Yuanzuijieshao',20},{'Text_Shuoming','Yuanzuixinxi/Text_Shuoming',20},
    }
end
-- Code Auto Create End
return M