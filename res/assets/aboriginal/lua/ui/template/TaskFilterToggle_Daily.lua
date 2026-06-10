-- Code Auto Create Begin
local M = Class('TaskFilterToggle_Daily', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TaskFilterToggle_Daily.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Normal','Normal',2},{'NormalIcon','Normal/NormalIcon',2},{'HighLight','HighLight',2},{'NormalIcon01','HighLight/NormalIcon',2},{'RedDotIcon_Daily','RedDotIcon_Daily',2},
        -- Text 列表
        {'Btn_FiltterText','Normal/Btn_FiltterText',3},{'Btn_EnFiltterText','Normal/Btn_EnFiltterText',3},{'Btn_FiltterText01','HighLight/Btn_FiltterText',3},{'Btn_EnFiltterText01','HighLight/Btn_EnFiltterText',3},
        -- UITemplate 列表
        {'TaskFilterToggle_Daily','/',10},
        -- Toggle 列表
        {'TaskFilterToggle_Daily01','/',13},
    }
end
-- Code Auto Create End
return M