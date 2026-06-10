-- Code Auto Create Begin
local M = Class('WudaohuiRewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WudaohuiRewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardItemPreFab','RewardScroll/RewardItemPreFab',2},{'RewardRankImg','RewardScroll/RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardScroll/RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardScroll/RewardItemPreFab/Img_ItemCountBg',2},{'StarPanel','RewardScroll/RewardItemPreFab/StarPanel',2},{'EmptyStarRoot','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','RewardScroll/RewardItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab1','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'ItemStarPrefab2','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'ItemStarPrefab3','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'ItemStarPrefab4','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'ItemStarPrefab5','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'ItemStarPrefab6','RewardScroll/RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'Rank','Rank',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'WudaohuiRewardItem','/',10},
        -- LoopScrollRect 列表
        {'RewardScroll','RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardScroll/RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Score','Text_Score',20},{'Text_Rank','Rank/Text_Rank',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardItemPreFab().gameObject:SetActive(false)
    self.RewardScroll():SetLuaCellEvent(Handle(self, self.OnRewardItemRender));
end

function M:OnRewardItemRender(trans, idx)
    local goods = JNStrTool.strSplit("_", self.m_rewards[idx]);
    local good = {
        goodsType = tonumber(goods[1]),
        goodsID = tonumber(goods[2]),
        goodsNum = tonumber(goods[3])
    }
    local item = ItemData.New()
    item:PushData(good, ItemControl.PushEnum.none)
    trans:GetComponent("UITemplate"):SetData({item, tonumber(goods[3])});
end

function M:OnUpdateUI(pData)
    self.m_rewards = JNStrTool.strSplit(",",pData[1].reward)
    local nowRank = pData[2]

    ---根据玩家段位显示选中
    if nowRank <= pData[1].lastRank and nowRank >= pData[1].firstRank then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end

    if pData[1].firstRank == pData[1].lastRank then
        self.Text_Score().text = pData[1].firstRank
    else
        if pData[1].lastRank == 9999999 then
            self.Text_Score().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_tips27")
        else
            self.Text_Score().text = pData[1].firstRank.."-"..pData[1].lastRank
        end
    end
    
    self.RewardScroll().totalCount = #self.m_rewards;
    self.RewardScroll():RefillCells()
    
    -----清除物体
    --for i, v in pairs(self.RewardObj) do
    --    Tools.ClearAllChild(v.gameObject)
    --    v.enabled = true
    --end
    -----创建奖励
    --for i, v in pairs(arr) do
    --    if not self.RewardObj[i] then
    --        break
    --    end
    --    self.RewardObj[i].enabled = false
    --    local obj = GameObject.Instantiate(self.RewardItemPreFab().gameObject,self.RewardObj[i].transform,false)
    --    obj.transform.localPosition = Vector3.zero;
    --    obj.transform.localScale = Vector3.one;
    --    obj:SetActive(true)
    --    local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
    --    local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
    --    local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    --
    --    local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    --    local StarPanel = obj.transform:Find("StarPanel").gameObject
    --    local goods = JNStrTool.strSplit("_",v)
    --    local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
    --    ---设置品质
    --    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
    --    ---设置图标
    --    MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
    --    ---设置数量
    --    ItemCountText.text = JNStrTool.numberAbbr(tonumber(goods[3]))
    --
    --    if itemData.itemstar > 0 then
    --        StarPanel:SetActive(true)
    --        ---设置星级
    --        self:InitStarPanel(itemData.itemstar,ItemStarRoot)
    --    else
    --        StarPanel:SetActive(false)
    --    end
    --    ---物品详细弹窗
    --    UIEvent.LuaClick(obj, Handle(self, function()
    --        local item = ItemControl.GetItemByIdAndType(tonumber(goods[2]),tonumber(goods[1]))
    --        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end,nil,true},true)
    --    end))
    --end
end

---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root)
    if _StarLV ==nil or _StarLV <= 0 then
        return
    end
    
    for i = 1, _StarLV, 1 do
        CJNUIMgr.GetSunUseName(_Root,"ItemStarPrefab" .. i).gameObject.gameObject:SetActive(true)
    end
end

return M