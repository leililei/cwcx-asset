-- Code Auto Create Begin
local M = Class('BathTaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BathTaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MissionBg','MissionBg',2},{'RewardItem','RewardItem',2},{'RewardRankImg','RewardItem/RewardRankImg',2},{'RewardIconImg','RewardItem/RewardIconImg',2},{'Img_ItemCountBg','RewardItem/Img_ItemCountBg',2},{'StarPanel','RewardItem/StarPanel',2},{'EmptyStarRoot','RewardItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItem/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItem/Img_Received',2},{'RewardPanel','RewardPanel',2},{'Img_TaskProgressBarBg','Img_TaskProgressBarBg',2},{'Img_TaskProgressBar','Img_TaskProgressBarBg/Img_TaskProgressBar',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'CompletedPanel','CompletedPanel',2},{'Img_CompletedDi','CompletedPanel/Img_CompletedDi',2},
        -- UITemplate 列表
        {'BathTaskItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItem/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItem/Img_Received/Text_Yilingqu2',20},{'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskProgress','Text_TaskProgress',20},{'Text_Completed','CompletedPanel/Img_CompletedDi/Text_Completed',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    --点击完成任务
    UIEvent.LuaClick(self.Img_CanReceivebg().gameObject,function()
        if self.taskData.isComplete == 1 then
            return
        end
        ActivationTaskViewModel.TaskPerform(0, self.taskData.id,nil,0,function()
            self.parent:RefreshTask()
            self.parent:RefreshLobby(self.parent.RoleData.roleId)
        end)
    end)
end

function M:OnUpdateUI(data)
    ---@type AchievementTaskData
    self.taskData = data[1]
    self.parent = data[2]

    local progressStr = JNStrTool.strSplit("_", self.taskData.complete)
    local value = ActivationTaskViewModel.GetStatisticValue(self.taskData.type, tonumber(progressStr[1]))
    if value > tonumber(progressStr[3]) then
        value = tonumber(progressStr[3])
    end
    self.Text_TaskTitle().text = self.taskData.txt
    self.Text_TaskProgress().text = Global.GetConciseCount(value) .. "<color=#CF6692>/" .. Global.GetConciseCount(tonumber(progressStr[3])).. "</color>"
    self.Img_TaskProgressBar().fillAmount = value / tonumber(progressStr[3])
    --清理子物体
    Tools.ClearAllChild(self.RewardPanel().gameObject)
    --隐藏预制
    self.RewardItem().gameObject:SetActive(false)
    --生成奖励预制
    for k,v in pairs(self.taskData.reward) do
        local obj = GameObject.Instantiate(self.RewardItem().gameObject,self.RewardPanel().gameObject.transform,false)
        obj:SetActive(true)
        ---@type ItemData
        local itemData = ItemControl.GetItemByType(v.goodsType, v.goodsID)
        local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
        local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local Img_Received = obj.transform:Find("Img_Received").gameObject
        local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
        local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        --设置品质
        MgrRes.LoadSprite(RewardRankImg, "Item/Rank/ItemRank_" .. itemData.quality)
        --设置图标
        MgrRes.LoadSprite(RewardIconImg, "Item/" .. itemData.icon)
        --设置数量
        ItemCountText.text = JNStrTool.numberAbbr(v.goodsNum)
        --设置星级
        if itemData.itemstar == 0 then
            StarPanel:SetActive(false)
        else
            StarPanel:SetActive(true)
            self:InitStarPanel(itemData.itemstar, ItemStarRoot, ItemStarPrefab)
            ItemStarPrefab:SetActive(false)
        end
        --是否已领取
        if self.taskData.isComplete == 1 then
            Img_Received:SetActive(true)
        else
            Img_Received:SetActive(false)
        end
        --点击奖励
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(v.goodsID, v.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function()
            end }, true)
        end))
    end

    ---是否已完成
    if self.taskData.isComplete == 1 then
        self.CompletedPanel().gameObject:SetActive(true)
        self.Img_CanReceivebg().gameObject:SetActive(false)
    else
        ---是否可领取
        if value >= tonumber(progressStr[3]) then
            self.CompletedPanel().gameObject:SetActive(false)
            self.Img_CanReceivebg().gameObject:SetActive(true)
        else
            self.CompletedPanel().gameObject:SetActive(false)
            self.Img_CanReceivebg().gameObject:SetActive(false)
        end
    end
end

function M:InitStarPanel(_StarLV, _Root, _Prefab)
    if _StarLV == nil or _StarLV <= 0 then
        return
    end
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        self:CreatStar(_Root, _Prefab)
    end
end

return M