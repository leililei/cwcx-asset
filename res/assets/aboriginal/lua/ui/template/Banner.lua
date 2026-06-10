-- Code Auto Create Begin
require("LocalData/BannerLocalData")
local M = Class('Banner', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Banner.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Banner','/',2},{'closetime','closetime',2},
        -- UITemplate 列表
        {'Banner01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Shengyushijian','closetime/Text_Shengyushijian',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.LinkStr = nil
    self.NetLinkId = nil
    UIEvent.LuaClick(self.Banner().gameObject,function()
        if self.LinkStr ~= nil then
            MgrLink.LinkStart(self.LinkStr)
        elseif self.NetLinkId ~= nil then
            Tools.OpenUrl(self.NetLinkId)
        end
    end,nil,self.Banner())
    
    local isTouch = false
    UIEvent.LuaPressClick(self.Banner().gameObject, Handle(self, function()
        if isTouch then
            return
        end
        Event.Go("ClearBannerTimer")
        isTouch = true
        MgrTimer.AddRepeat("BannerTouch", 0, function()
            if UIEvent.GetButton_Up() == true then
                MgrTimer.Cancel("BannerTouch")
                Event.Go("AutoBanner")
                isTouch = false
            end
        end, -1, nil)
    end))
end

function M:OnUpdateUI(pData)
    local tData = pData[1]
    MgrRes.LoadSprite(self.Banner(),"NoticeIcon/"..tData.ImgName)
    if tData.imgLinkId ~= "0" then
        self.LinkStr = string.split(tData.imgLinkId,"_")
    else
        self.LinkStr = nil
    end
    self.NetLinkId = tData.netLinkId

    --剩余时间
    if BannerLocalData.tab[tData.id].showtime == "0" then
        self.closetime().gameObject:SetActive(false)
    else
        self.closetime().gameObject:SetActive(true)

        local serverTime = MgrNet.GetServerTime()
        local timeData = TimeControl.GetTimeTable(tData.openTime)
        local tEndTime = timeData.endTime
        local remainTime = tEndTime - serverTime - 1
    
        if remainTime / (3600*24) >= 1 then
            ---剩余天数
            self.Text_Shengyushijian().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..math.modf(remainTime/(3600*24)).." </color>"..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
        else
            ---剩余小时数
            local hour = math.floor(remainTime / 3600) < 1 and 1 or math.floor(remainTime / 3600)
            self.Text_Shengyushijian().text = MgrLanguageData.GetLanguageByKey("eventraid_ui_surplus").." "..hour.." </color>"..MgrLanguageData.GetLanguageByKey("ui_common_hour")
        end
    end
end



return M