-- Code Auto Create Begin
local M = Class('PVPRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardItemPreFab','RewardItemPreFab',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RewardItemPreFab/StarPanel/ItemStarPrefab',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'RankIcon','RankIcon',2},{'Img_Demanddi2','Img_Demanddi2',2},{'Text_Demand2','Text_Demand2',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'PVPRewardItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Score','Text_Score',20},{'Img_Rank','Img_Rank',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)
    ---物品父物体
    self.RewardObj =
    {
        [1] = self.item1(),
        [2] = self.item2(),
        [3] = self.item3()
    }
end

function M:OnUpdateUI(pData)
    local arr = JNStrTool.strSplit(",",pData[1])
    local index = pData[2]
    self.parent = pData[3]
    local rankInfo = self.parent.RankInfo[index]
    ---更新段位信息
    self.Img_Rank().text = rankInfo.txt
    ---排名
    if index == 1 then
        self.Text_Score().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text54") .. 1
    elseif rankInfo.percent ~= 0 then
        self.Text_Score().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text54") .. rankInfo.percent .. "%"
    else
        self.Text_Score().text = MgrLanguageData.GetLanguageByKey("pvppause_ui_score") .. rankInfo.score
    end
    MgrRes.LoadSprite(self.RankIcon(),"Level/"..rankInfo.icon)
    ---根据玩家段位显示选中
    if rankInfo.txt == self.parent.PlayerRank then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end
    ---清除物体
    for i, v in pairs(self.RewardObj) do
        Tools.ClearAllChild(v.gameObject)
        v.enabled = true
    end
    ---创建奖励
    for i, v in pairs(arr) do
        if not self.RewardObj[i] then
            break
        end
        self.RewardObj[i].enabled = false
        local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject,self.RewardObj[i].transform,false)
        obj.transform.localPosition = Vector3.zero;
        obj.transform.localScale = Vector3.one;
        obj:SetActive(true)
        local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
        local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
        local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
        local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        local goods = JNStrTool.strSplit("_",v)
        local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
        ---设置品质
        MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
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
        ItemCountText.text = JNStrTool.numberAbbr(tonumber(goods[3])) --tonumber(goods[3]) >= 10000 and math.floor(tonumber(goods[3])/1000).."K" or goods[3]

        if itemData.itemstar > 0 then
            StarPanel:SetActive(true)
            ---设置星级
            self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
        else
            StarPanel:SetActive(false)
        end
        ItemStarPrefab:SetActive(false)
        ---物品详细弹窗
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(tonumber(goods[2]),tonumber(goods[1]))
            self.parent.mask.enabled = false  --关闭特效遮罩
            MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end,function()
                self.parent.mask.enabled = true  --打开特效遮罩
            end },true)
        end))
    end
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