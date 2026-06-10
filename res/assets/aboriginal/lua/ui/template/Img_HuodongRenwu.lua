-- Code Auto Create Begin
local M = Class('Img_HuodongRenwu', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Img_HuodongRenwu.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NoviceMissionItem','/',2},{'Img_Missiondi','Img_Missiondi',2},{'Img_HuodongJindu','Img_HuodongJindu',2},{'Img_Jinduquan(liang)','Img_HuodongJindu/Img_Jinduquan(liang)',2},{'Img_Daojujiangli','Img_Daojujiangli',2},{'Img_Missiondi2','Kelingqu/Img_Missiondi2',2},{'Img_Chengguang','Kelingqu/Img_Chengguang',2},{'Yiwancheng','Yiwancheng',2},{'Img_Yiwanchengdi','Yiwancheng/Img_Yiwanchengdi',2},
        -- Text 列表
        {'Text_Mission','Img_Missiondi/Text_Mission',3},{'Text_Renwushuoming','Text_Renwushuoming',3},{'Text_Jindu','Img_HuodongJindu/Text_Jindu',3},{'Text_Daojuming','Text_Daojuming',3},{'Text_Mission01','Kelingqu/Img_Missiondi2/Text_Mission',3},{'Text_Yiwancheng','Yiwancheng/Text_Yiwancheng',3},
        -- UITemplate 列表
        {'NoviceMissionItem01','/',10},
    }
end
-- Code Auto Create End
return M