-- Code Auto Create Begin
local M = Class('TaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_NoIntegralBg','Img_BgDi/Img_NoIntegralBg',2},{'Img_IntegralBg','Img_BgDi/Img_IntegralBg',2},{'Jifen','Img_BgDi/Img_IntegralBg/Jifen',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'Btu_Receive','Btu_Receive',2},{'Img_Lingqudi','Btu_Receive/Img_Lingqudi',2},{'Btu_GoTo','Btu_GoTo',2},{'Img_Qianwangdi','Btu_GoTo/Img_Qianwangdi',2},{'Img_Jiantou(huang)','Btu_GoTo/Img_Jiantou(huang)',2},{'Btu_Completed','Btu_Completed',2},{'Img_Yiwanchengdi','Btu_Completed/Img_Yiwanchengdi',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_TaskProgressBarBg','Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'Img_Des','Img_Des',2},{'CompletedPanel','CompletedPanel',2},{'Img_CompletedDi','CompletedPanel/Img_CompletedDi',2},
        -- UITemplate 列表
        {'TaskItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Jifen','Img_BgDi/Img_IntegralBg/Jifen/Text_Jifen',20},{'Text_Lingqu','Btu_Receive/Text_Lingqu',20},{'Text_Qianwang','Btu_GoTo/Text_Qianwang',20},{'Text_Yiwancheng','Btu_Completed/Text_Yiwancheng',20},{'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskProgress','Text_TaskProgress',20},{'Text_Completed','CompletedPanel/Img_CompletedDi/Text_Completed',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)

    self.RewardObj = {
        [1] = self.item1().gameObject,
        [2] = self.item2().gameObject,
        [3] = self.item3().gameObject
    }
end

function M:OnUpdateUI(pData)
    ---@type DayTaskData
    local taskData = pData[1]
    self.Parent = pData[2]
    local integral = 0
    self.taskType = taskData.type
    self.taskId = taskData.id
    local progressStr = JNStrTool.strSplit("_", taskData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(taskData.type, tonumber(progressStr[1]))
    if value > tonumber(progressStr[3]) then
        value = tonumber(progressStr[3])
    end
    self.Text_TaskTitle().text = taskData.txt
    self.Text_TaskProgress().text = Global.GetConciseCount(value) .. "<color=#7A7A7A>/" .. Global.GetConciseCount(tonumber(progressStr[3])).. "</color>"
    self.Img_TaskProgressBar().fillAmount = value / tonumber(progressStr[3])

    ---是否已完成
    if taskData.isComplete == 1 then
        self.CompletedPanel().gameObject:SetActive(true)
        --self.Img_IntegralDi().gameObject:SetActive(false)
        self.Img_CanReceivebg().gameObject:SetActive(false)
        self.Btu_Completed().gameObject:SetActive(true)
        self.Btu_GoTo().gameObject:SetActive(false)
        self.Btu_Receive().gameObject:SetActive(false)
        self.TaskItem().transform:GetComponent("CanvasGroup").alpha = 0.5
    else
        self.Img_CanReceivebg().gameObject:SetActive(false)
        self.CompletedPanel().gameObject:SetActive(false)
        --self.Img_IntegralDi().gameObject:SetActive(true)
        self.Btu_Completed().gameObject:SetActive(false)
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            self.Img_CanReceivebg().gameObject:SetActive(true)
            self.Btu_GoTo().gameObject:SetActive(false)
            self.Btu_Receive().gameObject:SetActive(true)
            self.Parent.CanReceiveCount = self.Parent.CanReceiveCount + 1
        else
            self.Img_CanReceivebg().gameObject:SetActive(false)
            self.Btu_GoTo().gameObject:SetActive(true)
            ---为GoTo注册跳转事件
            UIEvent.LuaClick(self.Btu_GoTo().gameObject, Handle(self, function()
                self:TurnToTaskPage(taskData)
            end))
            ---不用跳转的选项隐藏goto按钮
            if self.taskType == TaskControl.DayTaskType.DAILY then
                if TaskControl.DayTaskDataList[taskData.id].gotoID == "0" then
                    self.Btu_GoTo().gameObject:SetActive(false)
                end
            elseif self.taskType == TaskControl.DayTaskType.WEEKLY then
                if TaskControl.WeekTaskDataList[taskData.id].gotoID == "0" then
                    self.Btu_GoTo().gameObject:SetActive(false)
                end
            elseif self.taskType == TaskControl.DayTaskType.MONTHLY then
                if TaskControl.MonthTaskDataList[taskData.id].gotoID == "0" then
                    self.Btu_GoTo().gameObject:SetActive(false)
                end
            end
            self.Btu_Receive().gameObject:SetActive(false)
        end
        self.TaskItem().transform:GetComponent("CanvasGroup").alpha = 1
    end
    for i, v in pairs(self.RewardObj) do
        Tools.ClearAllChild(v)
    end
    ---生成奖励
    for i, v in pairs(taskData.reward) do
        local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject, self.RewardObj[i].transform, false)
        obj.transform.localPosition = Vector3.zero;
        obj.transform.localScale = Vector3.one;
        obj:SetActive(true)
        local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
        local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local Img_Received = obj.transform:Find("Img_Received").gameObject
        local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
        local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        ---@type ItemData
        local itemData = ItemControl.GetItemByType(v.goodsType, v.goodsID)
        if v.goodsType == 4 then
            if v.goodsID == 100003 or v.goodsID == 100004 or v.goodsID == 100005 then
                integral = integral + v.goodsNum
            end
        end
        ---设置品质
        MgrRes.LoadSprite(RewardRankImg, "Item/Rank/ItemRank_" .. itemData.quality)
        ---边框闪烁
        if itemData.quality == 1 or itemData.quality == 2 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
        elseif itemData.quality == 3 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
        elseif itemData.quality == 4 then
            RewardRankImg.transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
        end
        ---设置图标
        MgrRes.LoadSprite(RewardIconImg, "Item/" .. itemData.icon)
        ---设置数量
        ItemCountText.text = JNStrTool.numberAbbr(v.goodsNum) --v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum) / 1000) .. "K" or v.goodsNum
        ---是否已领取
        if taskData.isComplete == 1 then
            Img_Received:SetActive(true)
            RewardRankImg.transform:GetChild(0).gameObject:SetActive(false)
        else
            Img_Received:SetActive(false)
            RewardRankImg.transform:GetChild(0).gameObject:SetActive(true)
        end
        if itemData.itemstar == 0 then
            StarPanel:SetActive(false)
        else
            StarPanel:SetActive(true)
            ---设置星级
            self:InitStarPanel(itemData.itemstar, ItemStarRoot, ItemStarPrefab)
            ItemStarPrefab:SetActive(false)
        end
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(v.goodsID, v.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function()
            end }, true)
        end))
    end

    if integral == 0 then
        self.Img_IntegralBg().gameObject:SetActive(false)
        self.Img_NoIntegralBg().gameObject:SetActive(true)
    else
        self.Img_IntegralBg().gameObject:SetActive(true)
        self.Img_NoIntegralBg().gameObject:SetActive(false)
        --self.Text_IntegralCount().text = integral
    end

    if self.Parent.CanReceiveCount > 0 then
        self.Parent.Btn_AllReceive().gameObject:SetActive(true)
        self.Parent.Btn_UnAllReceive().gameObject:SetActive(false)
    else
        self.Parent.Btn_AllReceive().gameObject:SetActive(false)
        self.Parent.Btn_UnAllReceive().gameObject:SetActive(true)
    end
    UIEvent.LuaClick(self.Btu_Receive().gameObject, Handle(self, self.ReceiveClick))

    self.ObjRoot:SetActive(true)
    self.ObjRoot.transform:GetComponent("Animator").enabled = true
end

function M:ReceiveClick()
    ActivationTaskViewModel.TaskPerform(self.taskType, self.taskId)
end
---创建一个物体
function M:CreatGo(_Prefab, _Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root, _Prefab)
    -- statements
    local UnJuxingStar = self:CreatGo(_Prefab, _Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x, UnJuxingStar.transform.localPosition.y, 0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV, _Root, _Prefab)
    -- statements
    if _StarLV == nil or _StarLV <= 0 then
        return
    end
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root, _Prefab)
    end
end
---跳转到对应任务界面
function M:TurnToTaskPage(taskData)
    self:TaskJump(taskData)
end

function M:TaskJump(taskData)
    local transformInfo = {}
    if self.taskType == TaskControl.DayTaskType.DAILY then
        transformInfo = string.split(TaskControl.DayTaskDataList[taskData.id].gotoID, "_")
    elseif self.taskType == TaskControl.DayTaskType.WEEKLY then
        transformInfo = string.split(TaskControl.WeekTaskDataList[taskData.id].gotoID, "_")
    elseif self.taskType == TaskControl.DayTaskType.MONTHLY then
        transformInfo = string.split(TaskControl.MonthTaskDataList[taskData.id].gotoID, "_")
    end
    ---跳转到对应界面
    MgrLink.LinkStart(transformInfo)
end

return M