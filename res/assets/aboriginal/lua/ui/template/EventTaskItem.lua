-- Code Auto Create Begin
local M = Class('EventTaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/EventTaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_NoIntegralBg','Img_BgDi/Img_NoIntegralBg',2},{'Img_IntegralBg','Img_BgDi/Img_IntegralBg',2},{'Huoyueduicon2','Img_BgDi/Img_IntegralBg/Huoyueduicon2',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'Btu_Receive','Btu_Receive',2},{'Img_Lingqudi','Btu_Receive/Img_Lingqudi',2},{'Btu_GoTo','Btu_GoTo',2},{'Img_Qianwangdi','Btu_GoTo/Img_Qianwangdi',2},{'Img_Jiantou(huang)','Btu_GoTo/Img_Jiantou(huang)',2},{'Btu_Completed','Btu_Completed',2},{'Img_Yiwanchengdi','Btu_Completed/Img_Yiwanchengdi',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'RewardItemPreFab1','RewardPanel/item1/RewardItemPreFab1',2},{'RewardRankImg','RewardPanel/item1/RewardItemPreFab1/RewardRankImg',2},{'Img_Rareblue','RewardPanel/item1/RewardItemPreFab1/RewardRankImg/Ui_TX_035/Img_Rareblue',2},{'Img_Rarepurple','RewardPanel/item1/RewardItemPreFab1/RewardRankImg/Ui_TX_035/Img_Rarepurple',2},{'Img_Raregold','RewardPanel/item1/RewardItemPreFab1/RewardRankImg/Ui_TX_035/Img_Raregold',2},{'RewardIconImg','RewardPanel/item1/RewardItemPreFab1/RewardIconImg',2},{'Img_ItemCountBg','RewardPanel/item1/RewardItemPreFab1/Img_ItemCountBg',2},{'Img_Received','RewardPanel/item1/RewardItemPreFab1/Img_Received',2},{'item2','RewardPanel/item2',2},{'RewardItemPreFab2','RewardPanel/item2/RewardItemPreFab2',2},{'RewardRankImg01','RewardPanel/item2/RewardItemPreFab2/RewardRankImg',2},{'Img_Rareblue01','RewardPanel/item2/RewardItemPreFab2/RewardRankImg/Ui_TX_035/Img_Rareblue',2},{'Img_Rarepurple01','RewardPanel/item2/RewardItemPreFab2/RewardRankImg/Ui_TX_035/Img_Rarepurple',2},{'Img_Raregold01','RewardPanel/item2/RewardItemPreFab2/RewardRankImg/Ui_TX_035/Img_Raregold',2},{'RewardIconImg01','RewardPanel/item2/RewardItemPreFab2/RewardIconImg',2},{'Img_ItemCountBg01','RewardPanel/item2/RewardItemPreFab2/Img_ItemCountBg',2},{'Img_Received01','RewardPanel/item2/RewardItemPreFab2/Img_Received',2},{'item3','RewardPanel/item3',2},{'RewardItemPreFab3','RewardPanel/item3/RewardItemPreFab3',2},{'RewardRankImg02','RewardPanel/item3/RewardItemPreFab3/RewardRankImg',2},{'Img_Rareblue02','RewardPanel/item3/RewardItemPreFab3/RewardRankImg/Ui_TX_035/Img_Rareblue',2},{'Img_Rarepurple02','RewardPanel/item3/RewardItemPreFab3/RewardRankImg/Ui_TX_035/Img_Rarepurple',2},{'Img_Raregold02','RewardPanel/item3/RewardItemPreFab3/RewardRankImg/Ui_TX_035/Img_Raregold',2},{'RewardIconImg02','RewardPanel/item3/RewardItemPreFab3/RewardIconImg',2},{'Img_ItemCountBg02','RewardPanel/item3/RewardItemPreFab3/Img_ItemCountBg',2},{'Img_Received02','RewardPanel/item3/RewardItemPreFab3/Img_Received',2},{'Bg_TaskProgressBar','TaskProgressBar/Bg_TaskProgressBar',2},{'Img_TaskProgressBar','TaskProgressBar/Img_TaskProgressBar',2},{'Img_Des','Img_Des',2},{'CompletedPanel','CompletedPanel',2},{'Img_CompletedDi','CompletedPanel/Img_CompletedDi',2},
        -- Text 列表
        {'Text_Lingqu','Btu_Receive/Text_Lingqu',3},{'Text_Qianwang','Btu_GoTo/Text_Qianwang',3},{'Text_Yiwancheng','Btu_Completed/Text_Yiwancheng',3},{'ItemCountText','RewardPanel/item1/RewardItemPreFab1/Img_ItemCountBg/ItemCountText',3},{'Text_Yilingqu2','RewardPanel/item1/RewardItemPreFab1/Img_Received/Text_Yilingqu2',3},{'ItemCountText01','RewardPanel/item2/RewardItemPreFab2/Img_ItemCountBg/ItemCountText',3},{'Text_Yilingqu201','RewardPanel/item2/RewardItemPreFab2/Img_Received/Text_Yilingqu2',3},{'ItemCountText02','RewardPanel/item3/RewardItemPreFab3/Img_ItemCountBg/ItemCountText',3},{'Text_Yilingqu202','RewardPanel/item3/RewardItemPreFab3/Img_Received/Text_Yilingqu2',3},{'Text_TaskTitle','TaskProgressBar/Text_TaskTitle',3},{'Text_TaskProgress','TaskProgressBar/Text_TaskProgress',3},{'Text_Integration','Img_Des/Text_Integration',3},{'Text_Completed','CompletedPanel/Img_CompletedDi/Text_Completed',3},
        -- UITemplate 列表
        {'EventTaskItem','/',10},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    ---@type DayTaskData
    self.eventTaskData = pData[1]
    ---EventTask_UI
    self.parent = pData[2]
    ---判断任务类型
    self.taskType = {
        Day = 1, ---每日任务
        Achieve = 2, ---成就任务
    }
    if tonumber(JNStrTool.strSplit("_", self.eventTaskData.complete)[1]) >= 1000000 then
        self.type = self.taskType.Achieve
        self.subType = self.eventTaskData.type
    else
        self.type = self.taskType.Day
    end
    ---奖励显示
    self.items = {
        self.RewardItemPreFab1().gameObject,
        self.RewardItemPreFab2().gameObject,
        self.RewardItemPreFab3().gameObject,
    }
    for i = 1, #self.items do
        self.items[i]:SetActive(false)
    end
    for i = 1, #self.eventTaskData.reward do
        self.items[i]:SetActive(true)
        local go = self.items[i]
        ---@type ItemData
        local item = ItemControl.GetItemByIdAndType(self.eventTaskData.reward[i].goodsID, self.eventTaskData.reward[i].goodsType)
        if self.eventTaskData.reward[i].goodsType == 4 and string.split(item.icon, "/")[1] ~= "Item" then
            MgrRes.LoadSprite(go.transform:Find("RewardIconImg").transform:GetComponent("Image"), "Item/" .. item.icon)
        else
            MgrRes.LoadSprite(go.transform:Find("RewardIconImg").transform:GetComponent("Image"), item.icon)
        end
        go.transform:Find("Img_ItemCountBg").transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI").text = self.eventTaskData.reward[i].goodsNum
    end

    UIEvent.LuaClick(self.Btu_Receive().gameObject, Handle(self, self.ReceiveClick))
    UIEvent.LuaClick(self.Btu_GoTo().gameObject, Handle(self, self.GotoClick))

    ---是否已完成/可领取
    if self.type == self.taskType.Achieve then
        ---成就
        if self.eventTaskData.isComplete == 1 then
            --可领取但是已完成
            self.Btu_GoTo().gameObject:SetActive(false)
            self.Img_CanReceivebg().gameObject:SetActive(false)
            self.Btu_Receive().gameObject:SetActive(false)
            self.Btu_Completed().gameObject:SetActive(true)
            self.CompletedPanel().gameObject:SetActive(true)
            self.Img_Received().gameObject:SetActive(true)
            self.Img_Received01().gameObject:SetActive(true)
            self.Img_Received02().gameObject:SetActive(true)
        else
            if self.eventTaskData.isReceive == 1 then
                self.parent.CanReceiveCount = self.parent.CanReceiveCount + 1
                self.Btu_GoTo().gameObject:SetActive(false)
                self.Img_CanReceivebg().gameObject:SetActive(true)
                self.Btu_Receive().gameObject:SetActive(true)
                self.Btu_Completed().gameObject:SetActive(false)
                self.CompletedPanel().gameObject:SetActive(false)
                self.Img_Received().gameObject:SetActive(false)
                self.Img_Received01().gameObject:SetActive(false)
                self.Img_Received02().gameObject:SetActive(false)
            else
                self.Btu_GoTo().gameObject:SetActive(true)
                self.Img_CanReceivebg().gameObject:SetActive(false)
                self.Btu_Receive().gameObject:SetActive(false)
                self.Btu_Completed().gameObject:SetActive(false)
                self.CompletedPanel().gameObject:SetActive(false)
                self.Img_Received().gameObject:SetActive(false)
                self.Img_Received01().gameObject:SetActive(false)
                self.Img_Received02().gameObject:SetActive(false)
            end
        end
        ---完成度
        self.Text_TaskProgress().text = AchievementViewModel.GetStatisticValue(tonumber(string.split(self.eventTaskData.complete, "_")[1])) .. "<color=#7A7A7A>/" .. string.split(self.eventTaskData.complete, "_")[3] .. "</color>"
        ---完成度蓝条
        self.Img_TaskProgressBar().fillAmount = AchievementViewModel.GetStatisticValue(tonumber(string.split(self.eventTaskData.complete, "_")[1])) / tonumber(string.split(self.eventTaskData.complete, "_")[3])
    else
        ---日常任务
        if self.eventTaskData.isComplete == 1 then
            self.Btu_GoTo().gameObject:SetActive(false)
            self.Img_CanReceivebg().gameObject:SetActive(false)
            self.Btu_Receive().gameObject:SetActive(false)
            self.Btu_Completed().gameObject:SetActive(true)
            self.CompletedPanel().gameObject:SetActive(true)
            self.Img_Received().gameObject:SetActive(true)
            self.Img_Received01().gameObject:SetActive(true)
            self.Img_Received02().gameObject:SetActive(true)
        else
            if self.eventTaskData.isReceive == 1 then
                self.parent.CanReceiveCount = self.parent.CanReceiveCount + 1
                self.Btu_GoTo().gameObject:SetActive(false)
                self.Img_CanReceivebg().gameObject:SetActive(true)
                self.Btu_Receive().gameObject:SetActive(true)
                self.Btu_Completed().gameObject:SetActive(false)
                self.CompletedPanel().gameObject:SetActive(false)
                self.Img_Received().gameObject:SetActive(false)
                self.Img_Received01().gameObject:SetActive(false)
                self.Img_Received02().gameObject:SetActive(false)
            else
                self.Btu_GoTo().gameObject:SetActive(true)
                self.Img_CanReceivebg().gameObject:SetActive(false)
                self.Btu_Receive().gameObject:SetActive(false)
                self.Btu_Completed().gameObject:SetActive(false)
                self.CompletedPanel().gameObject:SetActive(false)
                self.Img_Received().gameObject:SetActive(false)
                self.Img_Received01().gameObject:SetActive(false)
                self.Img_Received02().gameObject:SetActive(false)
            end
        end
        ---完成度
        self.Text_TaskProgress().text = ActivationTaskViewModel.GetStatisticValue(TaskControl.DayTaskType.EVENT_RAID, tonumber(string.split(self.eventTaskData.complete, "_")[1])) .. "<color=#7A7A7A>/" .. string.split(self.eventTaskData.complete, "_")[3] .. "</color>"
        ---完成度蓝条
        self.Img_TaskProgressBar().fillAmount = ActivationTaskViewModel.GetStatisticValue(TaskControl.DayTaskType.EVENT_RAID, tonumber(string.split(self.eventTaskData.complete, "_")[1])) / tonumber(string.split(self.eventTaskData.complete, "_")[3])
    end
    ---任务描述
    self.Text_TaskTitle().text = self.eventTaskData.txt
end

function M:ReceiveClick()
    if self.parent.CurTaskType == self.parent.TaskType.DAILY then
        ActivationTaskViewModel.TaskPerform(51, self.eventTaskData.id, self.parent)
    else
        AchievementViewModel.TaskPerform(0, self.eventTaskData.id, self.parent)
    end

end
function M:GotoClick()
    self:EventTaskJump(self.eventTaskData)
end

function M:EventTaskJump(data)
    local transformInfo = {}
    if self.parent.CurTaskType == self.parent.TaskType.DAILY then
        if TaskControl.EventRaidTaskDataList[data.id].gotoID == "0" then
        end
        transformInfo = string.split(TaskControl.EventRaidTaskDataList[data.id].gotoID, "_")
    else
        if TaskControl.AchievementDataList[data.id].gotoID == "0" then
        end
        transformInfo = string.split(TaskControl.AchievementDataList[data.id].gotoID, "_")
    end
    ---跳转到对应界面
    MgrLink.LinkStart(transformInfo)
end

return M