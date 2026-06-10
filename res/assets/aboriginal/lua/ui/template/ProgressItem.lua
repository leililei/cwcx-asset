-- Code Auto Create Begin
local M = Class('ProgressItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ProgressItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Progressdi','Img_Progressdi',2},{'Img_LoveRank','Img_LoveRank',2},{'Img_LoveRank_H','Img_LoveRank_H',2},{'Img_Lock','Img_Lock',2},
        -- UITemplate 列表
        {'ProgressItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_AbilityBoost','Text_ AbilityBoost',20},{'Text_Rank','Img_LoveRank/Text_Rank',20},{'Text_Rank01','Img_LoveRank_H/Text_Rank',20},{'Text_PersonalData','Img_Lock/Text_ PersonalData',20},
    }
end
-- Code Auto Create End
return M