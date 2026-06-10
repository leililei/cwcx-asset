-- Code Auto Create Begin
local M = Class('DamageTotalPop2_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DamageTotalPop2_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DamageTotalPop2_UI].prefab'
    self.Name = 'Form[DamageTotalPop2_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_xian1','Img_Tanchuangdi/Img_xian1',2},{'Img_xian2','Img_Tanchuangdi/Img_xian2',2},{'Img_Biaotixian','Img_Tanchuangdi/Text_Biaoti/Img_Biaotixian',2},{'Img_di','Img_Tanchuangdi/Img_di',2},{'RoleDamageScroll','Img_Tanchuangdi/RoleDamageScroll',2},
        -- UITemplate 列表
        {'RoleDamageItem2','Img_Tanchuangdi/RoleDamageScroll/RoleDamageItem2',10},
        -- LoopScrollRect 列表
        {'RoleDamageScroll01','Img_Tanchuangdi/RoleDamageScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Biaoti','Img_Tanchuangdi/Text_Biaoti',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnShow(pData)
    self.LeftTeam = BattleManager.LeftTeam
    self.newLeftTeamDamage = pData[1]
    self.newleftTeam = pData[2]
    self.newLeftTeamDamageTotalPercent = pData[3]
    self:InitScroll()
    self:InitUIText()
end

function M:InitScroll()
    self.RoleDamageScroll01().totalCount = #self.LeftTeam
    self.RoleDamageScroll01():SetLuaCellEvent(Handle(self,self.LeftCellItem))
    self.RoleDamageScroll01():RefillCells(0)
end

function M:LeftCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.newleftTeam[idx],self.newLeftTeamDamage[idx],self.newLeftTeamDamageTotalPercent[idx], idx,true})
end

function M:InitUIText()

end
function M:OnBackKey()
    local tab = {"BattlePause_UI","PVPPause_UI","WBComplete_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
function M:OnClose()
    self.TotalDamage = nil
    self.LeftTeam = nil
end

return M