-- Code Auto Create Begin
local M = Class('FullLoading_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.FullLoading_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[FullLoading_UI].prefab'
    self.Name = 'Form[FullLoading_UI]'
    self.Layer = UILayerLv.Guide
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'loadingbeijing','loadingbeijing',2},{'shangxiaheidi','shangxiaheidi',2},{'LoadingBottom','bottom/loading/LoadingBottom',2},{'LoadingMap','bottom/loading/LoadingMap',2},{'texiaozi','bottom/texiaozi',2},
        -- TextMeshProUGUI 列表
        {'TipsText','shangxiaheidi/TipsText',20},{'PointText','bottom/loading/PointText',20},{'PercentText','bottom/loading/PercentText',20},
    }
end
-- Code Auto Create End
function M:OnInit()

end
---1播放时长，2回调
function M:OnShow(pData)
    self.stayTime = pData[1]
    self.finishCell = pData[2]
    self.endCell = pData[3]
    self.isWait = pData[4]
    self.LoadingMap().fillAmount = 0
    self.PercentText().text = "0%"
    --- 点文本动画
    local pointStr = ""
    MgrTimer.AddRepeat("FullLoading_Point", 0.3, function()
        pointStr = pointStr.."."
        if string.len(pointStr) > 3 then
            pointStr = ""
        end
        self.PointText().text = "Loading"..pointStr
    end, -1, nil)
    --- 进度条，进度文本动画
    Tools.SetImgFillRate(self.LoadingMap().gameObject, self.isWait and 0.99 or 1, self.stayTime - 0.5, self.PercentText().gameObject)
    --- 结束回调
    if self.isWait ~= true then
        MgrTimer.AddDelay("FullLoading_End",self.stayTime,function()
            MgrUI.PopHide(self.Uid)
            if self.endCell then
                self.endCell()
            end
        end)
    end
    if self.finishCell then
        self.finishCell()
    end
end
function M:OnHide()
    MgrTimer.Cancel("FullLoading_Point")
    MgrTimer.Cancel("FullLoading_End")
end
function M:OnClose()
    MgrTimer.Cancel("FullLoading_Point")
    MgrTimer.Cancel("FullLoading_End")
end
return M