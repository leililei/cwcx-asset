-- Code Auto Create Begin
local M = Class('HalfAnniversaryPlotItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HalfAnniversaryPlotItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'HalfAnniversaryPlotItem','/',2},{'DreamPlot','DreamPlot',2},{'Img_Plotdi','DreamPlot/Img_Plotdi',2},{'PlotRedDotIcon','DreamPlot/PlotRedDotIcon',2},{'Img_Bianhao','DreamPlot/Img_Bianhao',2},{'Img_Rewardguang','DreamPlot/PlotReward/Img_Rewardguang',2},{'Img_Rewarddi','DreamPlot/PlotReward/Img_Rewarddi',2},{'Img_RewardIcon','DreamPlot/PlotReward/Img_RewardIcon',2},{'PlotMask','DreamPlot/PlotMask',2},{'Img_Suo','DreamPlot/PlotMask/Img_Suo',2},{'Img_Fenggexian','DreamPlot/PlotInfo/Img_Fenggexian',2},
        -- UITemplate 列表
        {'HalfAnniversaryPlotItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_PlotName','DreamPlot/PlotInfo/Text_PlotName',20},{'Text_Jiesuo','DreamPlot/PlotInfo/Img_Fenggexian/Text_Jiesuo',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --self.DreamUp = Vector3(0,82,0)
    --self.DreamDown = Vector3(0,-34,0)
    self.DreamUp = Vector3(0,0,0)
    self.DreamDown = Vector3(0,0,0)
    self.CurPointData = nil
    self.IsLock = false
    
    self:InitButton()
end

function M:InitButton()
    UIEvent.LuaClick(self.DreamPlot().gameObject, Handle(self, function()
        if not self.IsLock then
            return
        end
        ---当前关卡
        StormViewModel.CurPointData = self.CurPointData
        BattleManager.GameMode = BattleManager.GameModeType.Normal
        MgrTimer.AddDelay("GoPlot", 1, function()
            StormViewModel.OpenStormPlotUI(StormViewModel.PointType.activity)
        end, nil)
    end))
end

function M:OnUpdateUI(pData)
    --local tCurLevelId = pData[1]
    self.CurPointData = StormControl.GetStormPointByID(pData[1])
    if self.CurPointData == nil then
        self.DreamPlot().gameObject:SetActive(false)
        return
    else
        self.DreamPlot().gameObject:SetActive(true)
    end
    local tIsUp = pData[2]%2 == 1

    if tIsUp then
        self.DreamPlot().transform.localPosition = self.DreamUp
    else
        self.DreamPlot().transform.localPosition = self.DreamDown
    end
    ---底图
    MgrRes.LoadSprite(self.Img_Plotdi(),self.CurPointData.picture)
    --MgrRes.LoadSprite(self.Img_Bianhao(),"Activity/HalfAnniversary/Img_0"..pData[2])
    self.Text_PlotName().text = self.CurPointData.name
    
    self:CheckPlotState()
end

function M:CheckPlotState()
    local tGameCost = string.split(self.CurPointData.activitypreview2,"_")
    ---判断是否解锁的道具
    local itemNum = ItemControl.GetItemByIdAndType(tonumber(tGameCost[2]),tonumber(tGameCost[1])).count
    ---解锁所需数量
    local needNum = tonumber(tGameCost[3])
    ---提示
    local str = ""

    if self.CurPointData:CheckLock() and itemNum >= needNum then
        if self.CurPointData.star == 0 then
            self.PlotRedDotIcon().gameObject:SetActive(true)
            self.Img_Fenggexian().gameObject:SetActive(true)
            ---点击解锁
            str = MgrLanguageData.GetLanguageByKey("ui_tongyong_text255")

            if self.CurPointData.star == 0 then
                self.PlotRedDotIcon().gameObject:SetActive(true)
            end
            MgrRes.LoadSprite(self.Img_RewardIcon(),"Activity/HalfAnniversary/Img_PlotRewardIcon1")
        else
            MgrRes.LoadSprite(self.Img_RewardIcon(),"Activity/HalfAnniversary/Img_PlotRewardIcon2")
            self.PlotRedDotIcon().gameObject:SetActive(false)
            self.Img_Fenggexian().gameObject:SetActive(false)
        end
        self.PlotMask().gameObject:SetActive(false)
        self.Img_RewardIcon().gameObject:SetActive(true)
        
        self.IsLock = true
    else
        self.Img_RewardIcon().gameObject:SetActive(false)
        self.PlotRedDotIcon().gameObject:SetActive(false)
        self.Img_Fenggexian().gameObject:SetActive(true)
        ---解锁条件
        str = MgrLanguageData.GetLanguageByKey("ui_tongyong_text78").."："
        if itemNum >= needNum then
            ---前置关卡未通过
            str = str..MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text9")
        else
            ---还需X次解锁
            str = str..string.format(MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text8"),(needNum-itemNum))
        end

        self.IsLock = false
    end
    self.Text_Jiesuo().text = str
end
return M