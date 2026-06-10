-- Code Auto Create Begin
local M = Class('PlayerRankUp_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayerRankUp_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayerRankUp_UI].prefab'
    self.Name = 'Form[PlayerRankUp_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Ani/Mask',2},{'Img_Tanchuangdi','Ani/Img_Tanchuangdi',2},{'Aijisiicon','Ani/Img_Tanchuangdi/Aijisiicon',2},{'Img_Sanjiaoxian1','Ani/Img_Tanchuangdi/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','Ani/Img_Tanchuangdi/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','Ani/Img_Tanchuangdi/Img_Wangdianzuo',2},{'Img_Wangdianyou','Ani/Img_Tanchuangdi/Img_Wangdianyou',2},{'Img_Bian_zuo','Ani/LvInfo/Img_Bian_zuo',2},{'Img_Bian_you','Ani/LvInfo/Img_Bian_you',2},{'Img_Huang','Ani/LvInfo/Img_Huang',2},{'Img_Dengjidi','Ani/LvInfo/Img_Dengjidi',2},{'Img_Jingyantiao','Ani/LvInfo/Img_Jingyantiao',2},{'DuanweiIcon','Ani/LvInfo/DuanweiIcon',2},{'Img_bg','Ani/Content/Detail1/Img_bg',2},{'Img_>','Ani/Content/Detail1/Img_>',2},{'Img_bg01','Ani/Content/Detail2/Img_bg',2},{'Img_>2','Ani/Content/Detail2/Img_>2',2},
        -- TextMeshProUGUI 列表
        {'Text_TouchToExit','Ani/Text_TouchToExit',20},{'Text_Tilihuifu','Ani/Content/Detail1/Text_Tilihuifu',20},{'Text_OldTili','Ani/Content/Detail1/Text_OldTili',20},{'Text_NewTili','Ani/Content/Detail1/Text_NewTili',20},{'Text_Tilishangxiantisheng','Ani/Content/Detail2/Text_Tilishangxiantisheng',20},{'Text_OldUpperLimit','Ani/Content/Detail2/Text_OldUpperLimit',20},{'Text_NewUpperLimit','Ani/Content/Detail2/Text_NewUpperLimit',20},
    }
end
-- Code Auto Create End
require("LocalData/SeniorPVPLocalData")
function M:OnShow(pData)
    local tab = SeniorPVPLocalData.tab
    local previousRank = tab[#tab + 1 - PVPViewModel.PVPPreviousRank]
    local newRank = tab[#tab + 1 - PVPViewModel.RankLevel]
    self.Text_OldTili().text = previousRank[2]
    self.Text_NewTili().text = newRank[2]
    self.Text_OldUpperLimit().text = previousRank[18]
    self.Text_NewUpperLimit().text = newRank[18]
    MgrRes.LoadSprite(self.DuanweiIcon(),"Level/" .. newRank[3])
    UIEvent.LuaClick(self.Mask().gameObject,function()
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnClose()
    Event.Remove("PlayerRankUpPop",PVPViewModel.PlayerRankUpPop)
end

return M