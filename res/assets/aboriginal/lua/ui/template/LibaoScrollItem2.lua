-- Code Auto Create Begin
local M = Class('LibaoScrollItem2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/LibaoScrollItem2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'LibaoScrollItem2','/',2},{'ItemPanel','ItemPanel',2},{'RewardRankImg','ItemPanel/RewardRankImg',2},{'RewardIconImg','ItemPanel/RewardIconImg',2},{'Img_ItemCountPivot','ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},
        -- UITemplate 列表
        {'LibaoScrollItem201','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(args)
    self.itemsInfo = args[1]        --物品信息:物品ID/物品数量/物品类型
    self.idx = args[2]
    self.parent = args[3]
    local item = ItemControl.GetItemByType(self.itemsInfo["goodsType"],self.itemsInfo["goodsID"])
    ---根据礼包内容获取图片路径
    local iconPath = "Item/"..item["icon"]
    MgrRes.LoadSprite(self.RewardIconImg(),iconPath,nil,false)
    ---礼包内容边框
    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..item.quality)
    ---修改物品图标右上角数量
    self.ItemCountText().text = self.itemsInfo["goodsNum"]

    UIEvent.LuaClick(self.RewardIconImg().gameObject,Handle(self,self.OnItemClick))
end

function M:OnItemClick()
    local itemData = ItemControl.GetItemByIdAndType(self.itemsInfo["goodsID"],self.itemsInfo["goodsType"])
    MgrUI.Pop(UID.ItemDetailPop_UI,{itemData, false, function()

    end},true)
end

return M