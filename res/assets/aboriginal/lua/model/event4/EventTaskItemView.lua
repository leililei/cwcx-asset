---外传活动主界面
EventTaskItemView = Class('EventTaskItemView')

function EventTaskItemView:ctor(Text_TaskTitle, Img_TaskProgressBar, Text_TaskProgress, CompletedPanel, Img_CanReceivebg, RewardItem, RewardPanel, MissionBg)
    self.Text_TaskTitle = Text_TaskTitle
    self.Img_TaskProgressBar = Img_TaskProgressBar
    self.Text_TaskProgress = Text_TaskProgress
    self.CompletedPanel = CompletedPanel
    self.Img_CanReceivebg = Img_CanReceivebg
    self.RewardItem = RewardItem
    self.RewardPanel = RewardPanel
    self.MissionBg = MissionBg
    
    self.ItemRecState = false
    self.AwardItems = {}
end

function EventTaskItemView:OnUpdateUI(pData)
    local taskData = pData[1]
    local Parent = pData[2]
    local taskId = taskData.id
    local taskType = taskData.type
    
    ---设置文本
    self.Text_TaskTitle.text = taskData.txt
    ---设置进度条
    local progressStr = JNStrTool.strSplit("_", taskData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(taskData.type, tonumber(progressStr[1]))
    if value > tonumber(progressStr[3]) then
        value = tonumber(progressStr[3])
    end
    self.Img_TaskProgressBar.fillAmount = value / tonumber(progressStr[3])
    ---进度文本
    self.Text_TaskProgress.text = Global.GetConciseCount(value) .. "/" .. Global.GetConciseCount(tonumber(progressStr[3]))
    ---是否已完成
    if taskData.isComplete == 1 then
        self.CompletedPanel.gameObject:SetActive(true)
    else
        
        self.CompletedPanel.gameObject:SetActive(false)
        self.Img_CanReceivebg.gameObject:SetActive(false)
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            self.ItemRecState = true
            self.Img_CanReceivebg.gameObject:SetActive(true)
        end
    end

    ---奖品
    local tId = 1
    for i, v in pairs(taskData.reward) do
        if not self.AwardItems[i] then
            self.AwardItems[i] = EventTaskItemView:CreatGo(self.RewardItem.gameObject, self.RewardPanel)
        end

        EventTaskItemView:SetAward(self.AwardItems[i].gameObject, v, taskData.isComplete)
        tId = tId + 1
    end
    for i = tId, #self.AwardItems do
        self.AwardItems[i].gameObject:SetActive(false)
    end

    ---点击领取奖励
    UIEvent.LuaClick(self.MissionBg.gameObject, function()
        if not self.ItemRecState then
            return
        end

        if taskData.taskGroupID then
            taskType = 0
        end
        ActivationTaskViewModel.TaskPerform(taskType, taskId, nil, nil, function()
            Parent:RefreshRedPoint()
            Parent:ReloaData()
            ---语音
            Parent:GetCurWords(98)
        end)
    end)
end

function EventTaskItemView:SetAward(_obj, _item, _isComplete)
    _obj:SetActive(true)
    local RewardRankImg = _obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local RewardIconImg = _obj.transform:Find("RewardIconImg"):GetComponent("Image")
    local ItemCountText = _obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local Img_Received = _obj.transform:Find("Img_Received").gameObject
    local ItemStarPrefab = _obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local ItemStarRoot = _obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local StarPanel = _obj.transform:Find("StarPanel").gameObject
    local itemData = ItemControl.GetItemByType(_item.goodsType, _item.goodsID)
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg, "Item/Rank/ItemRank_" .. itemData.quality)
    ---钻石边框闪烁
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
    ItemCountText.text = JNStrTool.numberAbbr(_item.goodsNum) --v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum)/1000).."K" or v.goodsNum
    ---是否已领取
    if _isComplete == 1 then
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
        EventTaskItemView:InitStarPanel(itemData.itemstar, ItemStarRoot, ItemStarPrefab)
        ItemStarPrefab:SetActive(false)
    end
    UIEvent.LuaClick(_obj, function()
        local item = ItemControl.GetItemByIdAndType(_item.goodsID, _item.goodsType)
        MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function()
        end }, true)
    end)
end
---创建一个物体
function EventTaskItemView:CreatGo(_Prefab, _Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---根据星级对对应根节点初始化星星
function EventTaskItemView:InitStarPanel(_StarLV, _Root, _Prefab)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        EventTaskItemView:CreatStar(_Root, _Prefab)
    end
end
---创建星星
function EventTaskItemView:CreatStar(_Root, _Prefab)
    -- statements
    local UnJuxingStar = EventTaskItemView:CreatGo(_Prefab, _Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x, UnJuxingStar.transform.localPosition.y, 0)
end

return EventTaskItemView