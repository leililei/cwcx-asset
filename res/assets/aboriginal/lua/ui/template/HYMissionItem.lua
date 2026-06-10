-- Code Auto Create Begin
local M = Class('HYMissionItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HYMissionItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MissionBg','MissionBg',2},{'JinDuTiaoDi','JinDuTiaoDi',2},{'JinDuTiao','JinDuTiao',2},{'XingXing','JinDuTiao/XingXing',2},{'RewardItem','RewardItem',2},{'RewardRankImg','RewardItem/RewardRankImg',2},{'RewardIconImg','RewardItem/RewardIconImg',2},{'Img_ItemCountBg','RewardItem/Img_ItemCountBg',2},{'StarPanel','RewardItem/StarPanel',2},{'EmptyStarRoot','RewardItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItem/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItem/Img_Received',2},{'RewardPanel','RewardPanel',2},{'Img_TaskState','Img_TaskState',2},{'ReceivedZhezhao','ReceivedZhezhao',2},{'Img_yilingqu','ReceivedZhezhao/Img_yilingqu',2},
        -- UITemplate 列表
        {'HYMissionItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_mission','Text_mission',20},{'Text_JiaGe','Text_JiaGe',20},{'ItemCountText','RewardItem/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItem/Img_Received/Text_Yilingqu2',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItem().gameObject:SetActive(false)
    self.JinDu_Width = self.JinDuTiao().transform.rect.width
    self.Star_Width = self.XingXing().transform.rect.width
    
    self.AwardItems = {}
    self.ItemRecState = false
end

function M:OnUpdateUI(pData)
    local taskData = pData[1]
    self.Parent = pData[2]
    self.taskId = taskData.id
    self.taskType = taskData.type

    ---设置文本
    self.Text_mission().text = taskData.txt
    ---设置进度条
    local progressStr = JNStrTool.strSplit("_", taskData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(taskData.type, tonumber(progressStr[1]))
    if value > tonumber(progressStr[3]) then
        value = tonumber(progressStr[3])
    end
    self.JinDuTiao().fillAmount = value / tonumber(progressStr[3])
    ---进度文本
    self.Text_JiaGe().text = Global.GetConciseCount(value) .. "/" .. Global.GetConciseCount(tonumber(progressStr[3]))
    ---星星的位置
    self.XingXing().transform.anchoredPosition = Vector2(self.JinDu_Width*self.JinDuTiao().fillAmount-self.Star_Width*0.5,0)
    ---是否已完成
    if taskData.isComplete == 1 then
        self.ReceivedZhezhao().gameObject:SetActive(true)
        self.XingXing().gameObject:SetActive(false)
        self.Img_TaskState().gameObject:SetActive(true)
        
        MgrRes.LoadSprite(self.MissionBg(), "Activity/HaiYue/renwukuang")
        MgrRes.LoadSprite(self.Img_TaskState(), "Activity/HaiYue/Img_yilingqu", nil, true)
    else
        self.ItemRecState = false
        self.ReceivedZhezhao().gameObject:SetActive(false)
        self.XingXing().gameObject:SetActive(true)

        MgrRes.LoadSprite(self.MissionBg(), "Activity/HaiYue/renwukuang")
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            self.ItemRecState = true
            self.Img_TaskState().gameObject:SetActive(true)
            MgrRes.LoadSprite(self.MissionBg(), "Activity/HaiYue/renwukuangwanchengrenwu")
            MgrRes.LoadSprite(self.Img_TaskState(), "Activity/HaiYue/renwuwancheng", nil, true)
        else
            self.Img_TaskState().gameObject:SetActive(false)
        end
    end

    ---奖品
    local tId = 1
    for i, v in pairs(taskData.reward) do
        if not self.AwardItems[i] then
            self.AwardItems[i] = self:CreatGo(self.RewardItem().gameObject,self.RewardPanel())
        end
        
        self:SetAward(self.AwardItems[i].gameObject, v, taskData.isComplete)
        tId = tId+1
    end
    for i = tId, #self.AwardItems do
        self.AwardItems[i].gameObject:SetActive(false)
    end

    ---点击领取奖励
    UIEvent.LuaClick(self.MissionBg().gameObject, Handle(self, function()
        if not self.ItemRecState then
            return
        end
        local taskType = self.taskType
        if taskData.taskGroupID then
            taskType = 0
        end
        ActivationTaskViewModel.TaskPerform(taskType, self.taskId,nil,nil,function()
            self.Parent:RefreshRedPoint()
            self.Parent:ReloaData()
        end)
    end))
end

function M:SetAward(_obj, _item, _isComplete)
    _obj:SetActive(true)
    local RewardRankImg = _obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local RewardIconImg = _obj.transform:Find("RewardIconImg"):GetComponent("Image")
    local ItemCountText = _obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local Img_Received = _obj.transform:Find("Img_Received").gameObject
    local ItemStarPrefab = _obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local ItemStarRoot = _obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local StarPanel = _obj.transform:Find("StarPanel").gameObject
    local itemData = ItemControl.GetItemByType(_item.goodsType,_item.goodsID)
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
    ---钻石边框闪烁
    if itemData.quality == 1 or itemData.quality == 2 then
        RewardRankImg.transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
    elseif itemData.quality == 3 then
        RewardRankImg.transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
    elseif itemData.quality == 4 then
        RewardRankImg.transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
    end
    ---设置图标
    MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
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
        self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
        ItemStarPrefab:SetActive(false)
    end
    UIEvent.LuaClick(_obj, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(_item.goodsID,_item.goodsType)
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
end
---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

return M