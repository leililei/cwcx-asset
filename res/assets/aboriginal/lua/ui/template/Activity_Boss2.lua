-- Code Auto Create Begin
local M = Class('Activity_Boss2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Boss2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Boss2','/',2},{'Btn_Chakan','Btn_Chakan',2},{'Btn_Chakan1','Btn_Chakan/Btn_Chakan1',2},{'Img_ShengYu','HuoDongShiJian/Img_ShengYu',2},{'Btn_Qianwangtaofa','Btn_Qianwangtaofa',2},
        -- UITemplate 列表
        {'Activity_Boss201','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ShiJian','HuoDongShiJian/Text_ShiJian',20},{'Text_XiaoShi','HuoDongShiJian/Text_XiaoShi',20},{'Text_ShengYuTian','HuoDongShiJian/Img_ShengYu/Text_ShengYuTian',20},{'Text_Taofa','Btn_Qianwangtaofa/Text_Taofa',20},
    }
end
-- Code Auto Create End
return M