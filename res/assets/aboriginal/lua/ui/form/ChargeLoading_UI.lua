-- Code Auto Create Begin
local M = Class('ChargeLoading_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ChargeLoading_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ChargeLoading_UI].prefab'
    self.Name = 'Form[ChargeLoading_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'heidi','heidi',2},{'loadingtiao(xiao)2','heidi/loadingtiao(xiao)2',2},{'SliderMap','heidi/SliderMap',2},{'Mask','Mask',2},
        -- TextMeshProUGUI 列表
        {'PointText','heidi/PointText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    -- 加载条
    M.SliderMap=self.SliderMap().gameObject
    -- 进度文本
    M.PointText = self.PointText().gameObject
end

function M:OnShow()
    -- 文本动画
    local pointStr = ""
    MgrTimer.Cancel("ChargeLoading_Point")
    MgrTimer.AddRepeat("ChargeLoading_Point", 0.3, function()
        pointStr = pointStr.."."
        if string.len(pointStr) > 3 then
            pointStr = ""
        end
        if M.PointText.gameObject ~= nil then
            -- statements
            M.PointText:GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("ui_loading_text")..pointStr
        end
    end, nil, nil)

    -- 滑块动画
    local dir = true --true -> left ,fase -> right
    local frame = 1.0 / 30
    MgrTimer.Cancel("ChargeLoading_Slider")
    MgrTimer.AddRepeat("ChargeLoading_Slider", frame, function()
        if M.SliderMap.gameObject ~= nil then
            -- statements
            local amount = M.SliderMap:GetComponent("Image").fillAmount
            if amount == 0 or amount == 1 then
                dir = not dir
                M.SliderMap:GetComponent("Image").fillClockwise = not M.SliderMap:GetComponent("Image").fillClockwise
            end
            if dir then
                amount = amount + frame
            else
                amount = amount - frame
            end
            M.SliderMap:GetComponent("Image").fillAmount = amount
        end
    end, nil, nil)
end

function M.OnBack()
    MgrUI.PopHide(UID.ChargeLoading_UI)
end

return M
