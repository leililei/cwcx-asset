require("LocalData/BannerLocalData")
require("Model/Banner/Data/BannerData")
---公告管理器
BannerControl = {}
BannerControl.cBannerData = {}     ---配置活动公告数据

function BannerControl.InitBannerData()
    BannerControl.cBannerData = {}
    for i, v in pairs(BannerLocalData.tab) do
        if BannerControl.cBannerData[i] == nil then
            BannerControl.cBannerData[i] = BannerData.New()
            BannerControl.cBannerData[i]:PushConfig(v)
        end
    end
end

function BannerControl.GetBannerData()
    local tList = {}
    for i, v in pairs(BannerControl.cBannerData) do
        --if Global.GetTimeByStr(v.openTime) < Global.GetCurTime() and Global.GetTimeByStr(v.closeTime) > Global.GetCurTime() then
        local timeData = TimeControl.GetTimeTable(v.openTime)
        if (timeData.openTime == 0 or timeData.endTime == 0) or (timeData.openTime < Global.GetCurTime() and timeData.endTime > Global.GetCurTime()) then
            tList[#tList+1] = v
        end
    end
    
    return tList
end

function BannerControl.Clear()
    BannerControl.cBannerData = {}
end

return BannerControl
