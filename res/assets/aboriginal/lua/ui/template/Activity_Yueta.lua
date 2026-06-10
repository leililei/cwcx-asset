-- Code Auto Create Begin
local M = Class('Activity_Yueta', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Yueta.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Yueta','/',2},{'Btn_Qianwangtaofa','Btn_Qianwangtaofa',2},
        -- UITemplate 列表
        {'Activity_Yueta01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ShiJian','HuoDongShiJian/Text_ShiJian',20},{'Text_XiaoShi','HuoDongShiJian/Text_XiaoShi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Qianwangtaofa().gameObject,function()
        YueTaViewModel.OpenYuetaUI()
    end)
end
---@param ActivityData ActivityData
function M:OnUpdateUI(ActivityData)
    self.ActivityData = ActivityData[1]
    local b = self.ActivityData.beginTime
    local startTimeStr = string.split(b,"-")
    local strStart = startTimeStr[1].."/"..startTimeStr[2].."/"..startTimeStr[3].." "..startTimeStr[4] ..":"..startTimeStr[5]
    local e = self.ActivityData.endTime
    local endTimeStr = string.split(e,"-")
    local strEnd = endTimeStr[1].."/"..endTimeStr[2].."/"..endTimeStr[3].." "..endTimeStr[4] ..":"..endTimeStr[5]
    self.Text_XiaoShi().text = strStart .. " ~ " .. strEnd
end

return M