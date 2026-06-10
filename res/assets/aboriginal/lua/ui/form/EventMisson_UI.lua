-- Code Auto Create Begin
local M = Class('EventMisson_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventMisson_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventMisson_UI].prefab'
    self.Name = 'Form[EventMisson_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Xian4','RightPanel/Img_Xian4',2},{'Img_Xian3','RightPanel/Img_Xian3',2},{'di(you)','RightPanel/di(you)',2},{'TaskContent','RightPanel/VFXMask/TaskScroll/TaskContent',2},{'TypePanel','RightPanel/TypePanel',2},{'Btn_UnAllReceive','RightPanel/Btn_UnAllReceive',2},{'Img_OCReceivedi2','RightPanel/Btn_UnAllReceive/Img_OCReceivedi2',2},{'Btn_AllReceive','RightPanel/Btn_AllReceive',2},{'Img_OCReceivedi1','RightPanel/Btn_AllReceive/Img_OCReceivedi1',2},{'Img_RefreshDi','IntegralPanel/IntegralCountPanel/Img_RefreshDi',2},{'Img_IntegralCountDi','IntegralPanel/IntegralCountPanel/Img_IntegralCountDi',2},{'Img_Jifendianshudi','IntegralPanel/IntegralCountPanel/Img_Jifendianshudi',2},{'VFXMask','IntegralPanel/VFXMask',2},{'Btn_Return','Btn_Return',2},{'Btn_I','Btn_Return/Btn_I',2},
        -- Text 列表
        {'Text_OCReceive2','RightPanel/Btn_UnAllReceive/Text_OCReceive2',3},{'Text_OCReceive1','RightPanel/Btn_AllReceive/Text_OCReceive1',3},{'Text_RefreshTime','IntegralPanel/IntegralCountPanel/Img_RefreshDi/Text_RefreshTime',3},{'Text_IntegralMax','IntegralPanel/IntegralCountPanel/Text_IntegralMax',3},{'Text_CurIntegral','IntegralPanel/IntegralCountPanel/Text_CurIntegral',3},{'Text_IntegralTitle','IntegralPanel/IntegralCountPanel/Img_Jifendianshudi/Text_IntegralTitle',3},
        -- UITemplate 列表
        {'TaskFilterToggle','RightPanel/TypePanel/TaskFilterToggle',10},
        -- Toggle 列表
        {'TaskFilterToggle01','RightPanel/TypePanel/TaskFilterToggle',13},
        -- RawImage 列表
        {'TaskScroll','RightPanel/VFXMask/TaskScroll',15},{'IntegralScroll','IntegralPanel/VFXMask/IntegralScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','RightPanel/VFXMask/TaskScroll',18},{'IntegralScroll01','IntegralPanel/VFXMask/IntegralScroll',18},
    }
end
-- Code Auto Create End
return M