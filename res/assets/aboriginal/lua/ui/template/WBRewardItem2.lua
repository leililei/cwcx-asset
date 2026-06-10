-- Code Auto Create Begin
local M = Class('WBRewardItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WBRewardItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'RewardItemPreFab','RewardItemPreFab',2},{'StarPanel','RewardItemPreFab/StarPanel',2},{'ItemStarRoot','RewardItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab1','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1',2},{'HighLight','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab1/HighLight',2},{'ItemStarPrefab2','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2',2},{'HighLight01','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab2/HighLight',2},{'ItemStarPrefab3','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3',2},{'HighLight02','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab3/HighLight',2},{'ItemStarPrefab4','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4',2},{'HighLight03','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab4/HighLight',2},{'ItemStarPrefab5','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5',2},{'HighLight04','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab5/HighLight',2},{'ItemStarPrefab6','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6',2},{'HighLight05','RewardItemPreFab/StarPanel/ItemStarRoot/ItemStarPrefab6/HighLight',2},{'RewardRankImg','RewardItemPreFab/RewardRankImg',2},{'RewardIconImg','RewardItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','RewardItemPreFab/Img_ItemCountBg',2},{'RewardPanel','RewardPanel',2},{'item1','RewardPanel/item1',2},{'item2','RewardPanel/item2',2},{'item3','RewardPanel/item3',2},{'Img_Demanddi2','Img_Demanddi2',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'WBRewardItem2','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','RewardItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Img_Rank','Img_Rank',20},{'Text_Demand','Text_Demand',20},
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
    local arr = JNStrTool.strSplit(",",pData[1][4])
    local data = pData[2]
    self.parent = pData[3]

    ---根据玩家段位显示选中
    if data.nowRank + 1 <= pData[1][3] and data.nowRank + 1 >= pData[1][2] then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end

    if pData[1][2] == pData[1][3] then
        self.Img_Rank().text = pData[1][2]
    else
        if pData[1][3] == 9999999 then
            self.Img_Rank().text = pData[1][2].."+"
        else
            self.Img_Rank().text = pData[1][2].."-"..pData[1][3]
        end
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
        --local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
        local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
        local StarPanel = obj.transform:Find("StarPanel").gameObject
        local goods = JNStrTool.strSplit("_",v)
        local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
        ---设置品质
        MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
        ---设置图标
        MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
        ---设置数量
        ItemCountText.text = JNStrTool.numberAbbr(tonumber(goods[3])) --tonumber(goods[3]) >= 10000 and math.floor(tonumber(goods[3])/1000).."K" or goods[3]

        if itemData.itemstar > 0 then
            StarPanel:SetActive(true)
            ---设置星级
            self:InitStarPanel(itemData.itemstar,ItemStarRoot)
        else
            StarPanel:SetActive(false)
        end
        --ItemStarPrefab:SetActive(false)
        ---物品详细弹窗
        UIEvent.LuaClick(obj, Handle(self, function()
            local item = ItemControl.GetItemByIdAndType(tonumber(goods[2]),tonumber(goods[1]))
            MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end,nil,true},true)
        end))
    end
end

---创建一个物体
--function M:CreatGo(_Prefab,_Root)
--    -- statements
--    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
--    tempObj.gameObject:SetActive(true)
--    tempObj.transform.localPosition = Vector3.zero
--    return tempObj
--end

---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root)
    -- statements
    if _StarLV ==nil or _StarLV <= 0 then
        return
    end
    --Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        CJNUIMgr.GetSunUseName(CJNUIMgr.GetSunUseName(_Root,"ItemStarPrefab" .. i).gameObject,"HighLight").gameObject:SetActive(true)
        -- statements
        --self:CreatStar(_Root,_Prefab)
    end
end
---创建星星
--function M:CreatStar(_Root,_Prefab)
--    -- statements
--    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
--    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
--end

return M