-- Code Auto Create Begin
local M = Class('IntegralItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/IntegralItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'CanReceivePanel','CanReceivePanel',2},{'Img_Chengguang','CanReceivePanel/Img_Chengguang',2},{'Img_Bg','Img_Bg',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Received','RewardItemPreFab/Img_Received',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_IntegralPanel','Img_IntegralPanel',2},{'Img_Integration','Img_Integration',2},{'TaskIcon','TaskIcon',2},{'CompletedPanel','CompletedPanel',2},{'Img_Yiwanchengdi1','CompletedPanel/Img_Yiwanchengdi1',2},
        -- UITemplate 列表
        {'IntegralItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Yiwancheng1','CanReceivePanel/Text_Yiwancheng1',20},{'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','RewardItemPreFab/Img_Received/Text_Yilingqu2',20},{'IntegralCount','Img_IntegralPanel/IntegralCount',20},{'Text_Yiwancheng101','CompletedPanel/Img_Yiwanchengdi1/Text_Yiwancheng1',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)

    self.RewardObj =
    {
        [1] = self.item1().gameObject,
        [2] = self.item2().gameObject,
        [3] = self.item3().gameObject
    }
end

function M:OnUpdateUI(pData)
    ---@type IntegralTaskData
    local taskData = pData[1]

    self.taskId = taskData.id
    if taskData.isComplete == 1 then
        self.CompletedPanel().gameObject:SetActive(true)
        self.Img_IntegralPanel().gameObject:SetActive(false)
        self.CanReceivePanel().gameObject:SetActive(false)
        self.IntegralItem().transform:GetComponent("CanvasGroup").alpha = 0.5
        self.Img_Bg().gameObject:SetActive(true)
    else
        self.CanReceivePanel().gameObject:SetActive(false)
        self.CompletedPanel().gameObject:SetActive(false)
        self.Img_IntegralPanel().gameObject:SetActive(true)
        if TaskControl.CheckCanReceive(tonumber(taskData.type),taskData.id) then
            self.Img_Bg().gameObject:SetActive(false)
            self.IntegralCount().text =""
            self.CanReceivePanel().gameObject:SetActive(true)
        else
            self.Img_Bg().gameObject:SetActive(true)
            self.IntegralCount().text ="<color=#FFFFFF80>"..taskData.num.."</color>"
            self.CanReceivePanel().gameObject:SetActive(false)
        end
        self.IntegralItem().transform:GetComponent("CanvasGroup").alpha = 1
    end

    for i, v in pairs(self.RewardObj) do
        Tools.ClearAllChild(v)
        v:GetComponent("Image").enabled = true
    end
    for i, v in pairs(taskData.reward) do
        if not self.RewardObj[i] then
            break
        end
        self.RewardObj[i]:GetComponent("Image").enabled = false
        local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject,self.RewardObj[i].transform,false)
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
        local itemData = ItemControl.GetItemByType(v.goodsType,v.goodsID)
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
        ItemCountText.text = JNStrTool.numberAbbr(v.goodsNum) --v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum)/1000).."K" or v.goodsNum
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
            self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
            ItemStarPrefab:SetActive(false)
        end
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
            MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
        end))
    end
    UIEvent.LuaClick(self.CanReceivePanel().gameObject, Handle(self,self.ReceiveClick))
end

function M:ReceiveClick()
    ActivationTaskViewModel.GetScoreReward(self.taskId)
end


---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    if _StarLV ==nil or _StarLV <= 0 then
        return
    end
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end
return M