-- Code Auto Create Begin
local M = Class('ActStormScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ActStormScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bg','Panel/bg',2},{'Img_Icon','Panel/Img_Icon',2},{'Img_Mask2','Panel/Img_Mask2',2},{'Img_Juanbiaodi','Panel/Img_Juanbiaodi',2},{'Panel_UnLock','Panel/Panel_UnLock',2},{'Img_Jindudi','Panel/Panel_UnLock/Img_Jindudi',2},{'Jindutiao(hei)','Panel/Panel_UnLock/Jindutiao(hei)',2},{'Img_Rate','Panel/Panel_UnLock/Img_Rate',2},{'Panel_Lock','Panel/Panel_Lock',2},{'Img_Zhezhao(bai)','Panel/Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Xian1','Panel/Panel_Lock/Img_Xian1',2},{'Img_Xian2','Panel/Panel_Lock/Img_Xian2',2},{'Img_Suo','Panel/Panel_Lock/Img_Suo',2},{'Img_Jiaobiao','Panel/Panel_Lock/Img_Jiaobiao',2},
        -- UITemplate 列表
        {'ActStormScrollItem','/',10},
        -- RawImage 列表
        {'Panel','Panel',15},
        -- TextMeshProUGUI 列表
        {'Text_CurPoint','Panel/Panel_UnLock/Text_CurPoint',20},{'Text_RateName','Panel/Panel_UnLock/Img_Jindudi/Text_RateName',20},{'Text_Rate','Panel/Panel_UnLock/Text_Rate',20},{'Text_Name2','Panel/Panel_UnLock/Text_Name2',20},{'Text_Info','Panel/Panel_UnLock/Text_Info',20},{'Text','Panel/Panel_Lock/Text',20},{'Text_Lock','Panel/Panel_Lock/Text_Lock',20},
    }
end
-- Code Auto Create End
return M