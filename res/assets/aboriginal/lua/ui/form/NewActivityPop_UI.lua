-- Code Auto Create Begin
local M = Class('NewActivityPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewActivityPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewActivityPop_UI].prefab'
    self.Name = 'Form[NewActivityPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'dengchudi','dengchudi',2},{'Btn_Enter','dengchudi/Btn_Enter',2},{'Btn_Close','dengchudi/Btn_Close',2},
        -- TextMeshProUGUI 列表
        {'Text_Queding','dengchudi/Btn_Enter/Text_Queding',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.LinkStr = nil
    self.CurId = 1
    UIEvent.LuaClick(self.Btn_Enter().gameObject, function()
        --跳转
        MgrLink.LinkStart(self.LinkStr)
        MgrUI.ClosePop(UID.NewActivityPop_UI)
    end)
    UIEvent.LuaClick(self.BlurMask().gameObject, function()
        if self.CurId < #self.OpenList then
            self.CurId = self.CurId+1
            --更新活动界面
            self:UpdateActivity()
        else
            MgrUI.ClosePop(UID.NewActivityPop_UI)                                                                                                                
        end
    end)
end

function M:OnShow(pData)
    self.OpenList = pData[1]
    --更新活动界面
    self:UpdateActivity()
end
---更新活动界面
function M:UpdateActivity()
    self.CurActID = self.OpenList[self.CurId]
    ---@type ActivityData
    local tActData = ActivityControl.GetActivityByID(self.CurActID)
    if tActData == nil then
        return
    end
    self.LinkStr = tActData.MainLink
    MgrRes.LoadSprite(self.dengchudi(),tActData.LinkIcon)
end

return M