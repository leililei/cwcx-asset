-- Code Auto Create Begin
local M = Class('StormItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StormItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Icon','Panel/Img_Icon',2},{'Img_Juanhaodi','Panel/Img_Juanhaodi',2},{'Img_Volumedi','Panel/Img_Volumedi',2},{'Panel_Lock','Panel/Panel_Lock',2},{'Img_Zhezhao(bai)','Panel/Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Xian1','Panel/Panel_Lock/Img_Xian1',2},{'Img_Xian2','Panel/Panel_Lock/Img_Xian2',2},{'Img_Suo','Panel/Panel_Lock/Img_Suo',2},{'Img_Jiaobiao','Panel/Panel_Lock/Img_Jiaobiao',2},{'ScrollRedDotIcon','Panel/ScrollRedDotIcon',2},
        -- UITemplate 列表
        {'StormItem','/',10},
        -- RawImage 列表
        {'Panel','Panel',15},
        -- TextMeshProUGUI 列表
        {'Text_Number','Panel/Text_Number',20},{'Text_Volume','Panel/Img_Volumedi/Text_Volume',20},{'Text','Panel/Panel_Lock/Text',20},{'Text_Lock','Panel/Panel_Lock/Text_Lock',20},
    }
end
-- Code Auto Create End
return M