-- Code Auto Create Begin
local M = Class('OptionalItem4', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalItem4.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalItem4','/',2},{'ItemPrefab','ItemPrefab',2},{'RewardRankImg','ItemPrefab/RewardRankImg',2},{'RewardIconImg','ItemPrefab/RewardIconImg',2},{'StarPanel','ItemPrefab/StarPanel',2},{'ItemStarRoot','ItemPrefab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','ItemPrefab/StarPanel/ItemStarPrefab',2},{'HighLight','ItemPrefab/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','ItemPrefab/Img_ItemCountBg',2},{'Img_ItemBg','Img_ItemBg',2},{'Btn_Xuanze','Btn_Xuanze',2},
        -- Text 列表
        {'Text_Xuanze','Btn_Xuanze/Text_Xuanze',3},
        -- UITemplate 列表
        {'OptionalItem401','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','ItemPrefab/Img_ItemCountBg/ItemCountText',20},{'Text_ItemName','Img_ItemBg/Text_ItemName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.goods = nil
    self.target = nil
    UIEvent.LuaClick(self.Btn_Xuanze().gameObject,function()
        if self.goods == nil or self.target == nil then
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_tongyong_text275")),Handle(self, function()
            ItemControl.UseSelectGoods(self.goods,self.target,nil,function()end,function(buffer, tag)
                local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
                if tab then
                    ---物品消耗
                    ItemControl.PushGroupItemData({ tab.cost },ItemControl.PushEnum.consume)    
                    ---更新数据统计
                    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
                    if tab.armor then
                        ---核心添加
                        CoreControl.PushGroupCoreData(tab.armor)
                        ---弹出单奖励窗口
                        MgrUI.Pop(UID.CoreChipSynPop_UI,{CoreControl.GetSingleCoreData(tab.armor[1].ID)},true)
                        if self.parent.CallBack ~= nil then
                            self.parent.CallBack()
                        end
                        self.parent:RefreshUI()
                    end
                end
            end)
        end),nil,2})
    end)
end

function M:OnUpdateUI(args)
    self.PData = args[1]
    self.parent = args[2]
    ---@type ItemData
    self.CostItemData = args[3]     --自选券

    self.goods = {
        goodsType = self.CostItemData.goods.goodsType,
        goodsID = self.CostItemData.goods.goodsID,
        goodsNum = 1
    }
    local itemData = string.split(self.PData,'_')
    self.target = {
        goodsType = tonumber(itemData[1]),
        goodsID = tonumber(itemData[2]),
        goodsNum = tonumber(itemData[3])
    }
    local BagItemData = ItemControl.GetItemByType(self.target.goodsType, self.target.goodsID)
    self.Text_ItemName().text = BagItemData.name
    self:InitItem(self.ItemPrefab().gameObject,BagItemData,self.target.goodsNum)
end

function M:InitItem(_item, BagItem, itemCount)
    local _ItemStarPrefab = CJNUIMgr.GetSunUseName(_item, "ItemStarPrefab")
    local _ItemStarRoot = CJNUIMgr.GetSunUseName(_item, "ItemStarRoot")
    local _ItemCountText = CJNUIMgr.GetSunUseName(_item, "ItemCountText"):GetComponent("TextMeshProUGUI")
    local _RewardRankImg = CJNUIMgr.GetSunUseName(_item, "RewardRankImg"):GetComponent("Image")
    local _RewardIconImg = CJNUIMgr.GetSunUseName(_item, "RewardIconImg"):GetComponent("Image")
    local _Starpanel = CJNUIMgr.GetSunUseName(_item, "StarPanel")
    self.starHLObj = {}
    Tools.ClearAllChild(_ItemStarRoot.gameObject)
    for i = 1, 6 do
        local obj = GameObject.Instantiate(_ItemStarPrefab.gameObject,_ItemStarRoot.gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    ---为0不显示星级
    _Starpanel.gameObject:SetActive(BagItem.itemstar > 0)
    
    if BagItem.itemstar > 0 then
        for i = 1,#self.starHLObj do
            self.starHLObj[i]:SetActive(i <= BagItem.itemstar)
            if BagItem.quality >= 5 then
                MgrRes.LoadSprite(self.starHLObj[i]:GetComponent("Image"),"Item/Img_XingSuper")
            else
                MgrRes.LoadSprite(self.starHLObj[i]:GetComponent("Image"),"Item/Img_Xing_23")
            end
        end
    end

    ---设置品质
    MgrRes.LoadSprite(_RewardRankImg,"Item/Rank/ItemRank_"..BagItem.quality)
    ---设置图标
    MgrRes.LoadSprite(_RewardIconImg,"Item/"..BagItem.icon)
    ---设置数量
    _ItemCountText.text = JNStrTool.numberAbbr(itemCount) --itemCount >= 10000 and math.floor(tonumber(itemCount)/1000).."K" or itemCount
end
return M