-- Code Auto Create Begin
local M = Class('BagItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BagItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','wupin/RewardRankImg',2},{'RedDotIcon','wupin/RedDotIcon',2},{'RewardIconImg','wupin/RewardIconImg',2},{'StarPanel','wupin/StarPanel',2},{'ItemStarRoot','wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','wupin/StarPanel/ItemStarPrefab',2},{'HighLight','wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','wupin/Img_ItemCountBg',2},
        -- UITemplate 列表
        {'BagItem','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','wupin/Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---初始化最大星级
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnItemClick))
end

--刷新红点显示
function M:UpdateItemRedDot()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",self.pData.id))
    if isNew == nil or isNew == ""  then
        self.RedDotIcon().gameObject:SetActive(true)
    else
        self.RedDotIcon().gameObject:SetActive(false)
    end
end

function M:OnUpdateUI(pData)
    ---@type ItemData 道具预制设置
    self.pData = pData[1]
    self.parent = pData[2]
    ---为0不显示星级
    self.StarPanel().gameObject:SetActive(self.pData.star > 0)
    ---大于0更新星级显示
    if self.pData.star > 0 then
        for i = 1,#self.starHLObj do
            self.starHLObj[i]:SetActive(i <= self.pData.star)
        end
    end
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),self.pData.iconFrame)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.pData.icon)
    ---设置数量
    self.ItemCountText().text = JNStrTool.numberAbbr(self.pData.count) --self.pData.count >= 10000 and math.floor(tonumber(self.pData.count)/1000).."K" or self.pData.count

    ---在好感度界面时的逻辑
    if self.parent and self.parent.__cname == "ItemPrefab" then
        self.ObjRoot.gameObject.transform.localScale = Vector3(1.2,1.2,1)
        self.RedDotIcon().gameObject:SetActive(false)  --策划要求在此界面隐藏红点
    elseif self.parent and self.parent.Uid == UID.CoreChipGroupPop_UI then
        self.RedDotIcon().gameObject:SetActive(false)  --策划要求在此界面隐藏红点
    else
        self:UpdateItemRedDot()
        self.ObjRoot.gameObject.transform.localScale = Vector3(1.5,1.5,1)
    end
end
function M:OnItemClick()
     --取消红点
     UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",self.pData.id),self.pData.id)
     self:UpdateItemRedDot()
     local state = false
     for i, v in pairs(ItemControl.GetNotZeroItems(true)) do
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "BagItem%s",v.id))
        if isNew == nil or isNew == "" then
            state = true
            break
        end
     end
     RedDotControl.GetDotData("BagItem"):SetState(state)
    if self.parent.ItemRedDotIcon then
     if RedDotControl.GetDotData("BagItem").State then
         self.parent.ItemRedDotIcon().gameObject:SetActive(true)
     else
         self.parent.ItemRedDotIcon().gameObject:SetActive(false)
     end
    end
    if self.pData.use == 3 then
        MgrUI.Pop(UID.OptionalPop_UI,{self.pData,function()
            ---刷新物品缓存
            BagViewModel.ReloadCacheData()
            if self.parent ~= nil then
                ---刷新物品
                self.parent:ResetItemView(self.parent.ItemSortType,0)
            end
        end,1},true)
    else
        MgrUI.Pop(UID.ItemDetailPop_UI,{ self.pData, true, function()
            ---刷新物品缓存
            BagViewModel.ReloadCacheData()
            if self.parent ~= nil then
                ---刷新物品
                self.parent:ResetItemView(self.parent.ItemSortType,0)
            end
        end},true)
    end


end
return M