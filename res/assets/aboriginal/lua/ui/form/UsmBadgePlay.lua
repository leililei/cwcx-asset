-- Code Auto Create Begin
local M = Class('UsmBadgePlay', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.UsmBadgePlay
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[UsmBadgePlay].prefab'
    self.Name = 'Form[UsmBadgePlay]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SwitchPanelVideoPlayer','SwitchPanelVideoPlayer',2},
    }

function M:OnInit()

end

function M:OnShow(pData)
    --Common/Common/
        self.usmName = pData[1]
        local criUI = self.SwitchPanelVideoPlayer().transform:GetComponent("CriManaMovieControllerForUI")
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/"..self.usmName..".usm"))               --给组件的player设置usm视频文件
        criUI.player.statusChangeCallback = function(state)
            if tostring(state) == "PlayEnd: 6" then    --播放完
                criUI.player.statusChangeCallback = nil
                MgrUI.ClosePop(self.Uid)
            end
        end
        criUI:Play()            --播放视频
    end
end
-- Code Auto Create End
return M