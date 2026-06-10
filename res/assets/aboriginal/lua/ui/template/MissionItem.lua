-- Code Auto Create Begin
local M = Class('MissionItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MissionItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Unfinish','Mission/Unfinish',2},{'Receive','Mission/Receive',2},{'Background','Mission/Slider/Background',2},{'Fill','Mission/Slider/Fill Area/Fill',2},{'Received','Received',2},{'ReceiveComplete','Received/ReceiveComplete',2},{'ProgressBar','Received/ ProgressBar',2},{'Progress','Received/ ProgressBar/Progress',2},{'icon','icon',2},{'RewardRankImg','icon/RewardRankImg',2},{'RewardIconImg','icon/RewardIconImg',2},{'Img_ItemCountBg','icon/Img_ItemCountBg',2},
        -- Slider 列表
        {'Slider','Mission/Slider',5},
        -- UITemplate 列表
        {'MissionItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_RenWuJinDu','Mission/Slider/Text_RenWuJinDu',20},{'Text_RenWuJinDu01','Received/ ProgressBar/Text_RenWuJinDu',20},{'ItemCountText','icon/Img_ItemCountBg/ItemCountText',20},{'Text_MissionContent','Text_MissionContent',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击奖励弹出详情
    UIEvent.LuaClick(self.icon().gameObject, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(self.reward.goodsID, self.reward.goodsType)
        MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function()
        end }, true)
    end))
    ---点击领取
    UIEvent.LuaClick(self.Receive().gameObject,function()
        ActivationTaskViewModel.TaskPerform(0, self.pData.id,nil,self.pData.type,function()
            self.parent:Refresh()
            TaskControl.CheckGuide()
            Event.Go("ActivityDot")
        end)
    end)
end

function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    self.pData = pData[1]
    self.parent = pData[2]
    self.reward = self.pData.reward[1]
    ---@type ItemData
    local itemData = ItemControl.GetItemByType(self.reward.goodsType, self.reward.goodsID)
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(), "Item/Rank/ItemRank_" .. itemData.quality)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(), "Item/" .. itemData.icon)
    ---设置数量
    self.ItemCountText().text = JNStrTool.numberAbbr(self.reward.goodsNum) --self.reward.goodsNum >= 10000 and math.floor(tonumber(self.reward.goodsNum) / 1000) .. "K" or self.reward.goodsNum
    ---设置任务内容
    self.Text_MissionContent().text = self.pData.txt
    local progressStr = JNStrTool.strSplit("_", self.pData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(self.pData.type, tonumber(progressStr[1]))
    if self.pData.isComplete == 1 then
        self.Unfinish().gameObject:SetActive(false)
        self.Receive().gameObject:SetActive(false)
        self.Received().gameObject:SetActive(true)
    else
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            self.parent.CanReceiveCount = self.parent.CanReceiveCount + 1
            self.Unfinish().gameObject:SetActive(false)
            self.Received().gameObject:SetActive(false)
            self.Receive().gameObject:SetActive(true)
            self.Text_RenWuJinDu().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text82")
            self.Slider().value = value / tonumber(progressStr[3])
        else
            self.Unfinish().gameObject:SetActive(true)
            self.Received().gameObject:SetActive(false)
            self.Receive().gameObject:SetActive(false)
            self.Text_RenWuJinDu().text = string.format("%s<color=#535658>/%s</color>",value,tonumber(progressStr[3]))
            self.Slider().value = value / tonumber(progressStr[3])
        end
    end
end

return M