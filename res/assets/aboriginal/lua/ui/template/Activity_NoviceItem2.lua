-- Code Auto Create Begin
local M = Class('Activity_NoviceItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_NoviceItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_NoviceItem2','/',2},{'Jump','Jump',2},{'Img_Missiondi','Img_Missiondi',2},{'Kelingqu','Kelingqu',2},{'Img_Missiondi2','Kelingqu/Img_Missiondi2',2},{'Img_HuodongJindu','Img_HuodongJindu',2},{'Img_Jinduquan','Img_HuodongJindu/Img_Jinduquan',2},{'Img_Daojujiangli','Img_Daojujiangli',2},{'Lingqu','Lingqu',2},{'Img_Lingqudi','Lingqu/Img_Lingqudi',2},{'Yiwancheng','Yiwancheng',2},{'Img_Gou','Yiwancheng/Img_Gou',2},
        -- UITemplate 列表
        {'Activity_NoviceItem201','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Mission','Img_Missiondi/Text_Mission',20},{'Text_Mission01','Kelingqu/Img_Missiondi2/Text_Mission',20},{'Text_Renwushuoming','Text_Renwushuoming',20},{'Text_Jindu','Img_HuodongJindu/Text_Jindu',20},{'Text_Daojuming','Text_Daojuming',20},{'Text_Lingqu','Lingqu/Img_Lingqudi/Text_Lingqu',20},
    }
end
-- Code Auto Create End
return M