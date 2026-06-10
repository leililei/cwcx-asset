-- Code Auto Create Begin
local M = Class('NoviceMissionItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/NoviceMissionItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NoviceMissionItem','/',2},{'Jump','Jump',2},{'Img_Missiondi','Img_Missiondi',2},{'Img_HuodongJindu','Img_HuodongJindu',2},{'Img_Jinduquan','Img_HuodongJindu/Img_Jinduquan',2},{'Img_Daojujiangli','Img_Daojujiangli',2},{'Kelingqu','Kelingqu',2},{'Img_Missiondi2','Kelingqu/Img_Missiondi2',2},{'Img_Chengguang','Kelingqu/Img_Chengguang',2},{'Yiwancheng','Yiwancheng',2},{'Img_Yiwanchengdi','Yiwancheng/Img_Yiwanchengdi',2},
        -- Text 列表
        {'Text_Mission','Img_Missiondi/Text_Mission',3},{'Text_Renwushuoming','Text_Renwushuoming',3},{'Text_Jindu','Img_HuodongJindu/Text_Jindu',3},{'Text_Daojuming','Text_Daojuming',3},{'Text_Mission01','Kelingqu/Img_Missiondi2/Text_Mission',3},{'Text_Yiwancheng','Yiwancheng/Text_Yiwancheng',3},
        -- UITemplate 列表
        {'NoviceMissionItem01','/',10},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")
function M:OnInit()
end

function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    self.data = pData[1]
    self.parent = pData[2]
    ---任务说明
    self.Text_Renwushuoming().text = self.data.txt
    ---任务完成度
    local completeCondition = string.split(self.data.complete, "_")
    local rate
    local completeNum = TaskControl.gloryStatistics[tonumber(completeCondition[1])] --完成度
    if TaskControl.gloryStatistics[tonumber(completeCondition[1])] then
        rate = completeNum / tonumber(completeCondition[3])
    else
        rate = 0
        completeNum = 0
    end
    if rate > 1 then
        rate = 1
    end
    self.Img_Jinduquan().fillAmount = rate
    self.Text_Jindu().text = "<color=#FFBE02>" .. completeNum .. "</color>/" .. tonumber(completeCondition[3])
    ---奖励道具名
    if self.data.reward[1].goodsID ~= nil and self.data.reward[1].goodsNum ~= nil and self.data.reward[1].goodsType ~= nil then
        self.Text_Daojuming().text = ItemLocalData.tab[self.data.reward[1].goodsID].name .. " x" .. self.data.reward[1].goodsNum
    else
        self.Text_Daojuming().text = ""
    end
    ---奖励道具图片
    if self.data.reward[1].goodsID then
        MgrRes.LoadSprite(self.Img_Daojujiangli(), ItemControl.GetItemByID(self.data.reward[1].goodsID).icon, nil, false)
    else
        self.Img_Daojujiangli().gameObject:SetActive(false)
    end

    self.Kelingqu().gameObject:SetActive(false)
    self.Jump().gameObject:SetActive(false)
    self.Yiwancheng().gameObject:SetActive(false)
    ---可领取
    if self.data.isReceive == 1 then
        self.Kelingqu().gameObject:SetActive(true)
        self.Jump().gameObject:SetActive(false)
        self.Yiwancheng().gameObject:SetActive(false)
    else
        self.Kelingqu().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(true)
    end
    ---是否已完成
    if self.data.isComplete == 1 then
        self.Yiwancheng().gameObject:SetActive(true)
        self.Kelingqu().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(false)
    else
        self.Yiwancheng().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(true)
    end

    UIEvent.LuaClick(self.Jump().gameObject, function()
        self:NoviceTaskJump(self.data)
    end)
    UIEvent.LuaClick(self.Kelingqu().gameObject, function()
        TaskControl.GetNoviceItemReward(self.data, self.parent)
    end)
    UIEvent.LuaClick(self.Img_Daojujiangli().gameObject, function()
        if self.data.reward[1].goodsID then
            MgrUI.Pop(UID.ItemDetailPop_UI, { ItemControl.GetItemByID(self.data.reward[1].goodsID), false, function()
            end }, true)
        end
    end)
end

---新手任务跳转
function M:NoviceTaskJump(noviceData)
    local transformInfo = {}
    transformInfo = string.split(TaskControl.NoviceDataList[noviceData.id].gotoID, "_")

    ---跳转到对应界面
    MgrLink.LinkStart(transformInfo)
end
-----跳转副本界面
--function M:TurnToStormPointPage(plotIndex, stormIndex)
--    --参数：章节,关卡
--    local pData = StormControl.GetStormScrollById(tonumber(plotIndex))
--    local isLock = StormControl.CheckScrollLock(tonumber(plotIndex))
--    local pointData = StormControl.GetStormPointByID(tonumber(stormIndex))
--    StormViewModel.ReloadStormData()
--    if isLock then
--        --StormViewModel.OpenStormPointUI(pData,StormViewModel.PointType.main)
--        StormViewModel.TurnStormPointUI(pData, StormViewModel.PointType.main, pointData)
--    else
--        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips3"), 1 }, true)
--    end
--end
---跳转对应资源界面
function M:TurnToResourcesPointPage(plotIndex, stormIndex)
    --参数：章节,关卡
    local pData = nil
    StormViewModel.ReloadStormData()
    for i, v in ipairs(StormViewModel.CacheAssetScrollData) do
        if v.id == tonumber(plotIndex) then
            if stormIndex == "610000" and SysLockControl.CheckSysLock(1006) then
                if StormControl.CheckPointLock(tonumber(stormIndex)) == false then
                    pData = StormViewModel.CacheAssetScrollData[9]      ---周二三五七开攻击核心
                elseif StormControl.CheckPointLock(tonumber(stormIndex + 1)) == false then
                    pData = StormViewModel.CacheAssetScrollData[i]      ---周一三四六开生命核心
                end
            elseif stormIndex == "620100" and SysLockControl.CheckSysLock(1004) then
                if StormControl.CheckPointLock(tonumber(stormIndex)) == false then
                    pData = StormViewModel.CacheAssetScrollData[8]      ---周二四六七开攻击觉醒
                elseif StormControl.CheckPointLock(tonumber(stormIndex + 1)) == false then
                    pData = StormViewModel.CacheAssetScrollData[12]     ---周一三五七开防卫觉醒
                end
            else
                if StormControl.CheckPointLock(tonumber(stormIndex)) then
                    pData = StormViewModel.CacheAssetScrollData[i]      ---开对应副本
                end
            end
        end
    end
    if not pData then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("mgrlink_tips2"), 1 }, true)
        return
    end
    --[[
    if not StormViewModel.CheckAssetsScroll(pData.type2) then
        MgrUI.Pop(UID.PopTip_UI,{"未达到开启条件",1},true)
        return
    end]]
    ---资源ui创建
    StormViewModel.OpenStormPointUIAfterRequestDrop(pData, StormViewModel.PointType.res)
end

return M