-- Code Auto Create Begin
local M = Class('OptionalSkinItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalSkinItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalSkinItem','/',2},{'RewardRankImg','ItemPrefab/wupin/RewardRankImg',2},{'RewardIconImg','ItemPrefab/wupin/RewardIconImg',2},{'Img_ItemCountBg','ItemPrefab/wupin/Img_ItemCountBg',2},{'Img_Juesemingdi','Img_Juesemingdi',2},{'user','user',2},{'Img_Yiyongyoudi','Img_Yiyongyoudi',2},{'Btn_Xuanze','Btn_Xuanze',2},
        -- Text 列表
        {'Text_Jueseming','Img_Juesemingdi/Text_Jueseming',3},{'Text_userName','user/Text_userName',3},{'Text','user/Text',3},{'Text_Yiyongyou','Img_Yiyongyoudi/Text_Yiyongyou',3},{'Text_Xuanze','Btn_Xuanze/Text_Xuanze',3},
        -- UITemplate 列表
        {'OptionalSkinItem01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountText','ItemPrefab/wupin/Img_ItemCountBg/ItemCountText',20},
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
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_formation_text13")),Handle(self, function()
            ItemControl.UseSelectGoods(self.goods,self.target,nil,function()end,function(buffer, tag)
                local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
                if tab then
                    ---物品消耗
                    ItemControl.PushGroupItemData({ tab.cost },ItemControl.PushEnum.consume)
                    ---更新数据统计
                    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
                    if tab.goods then
                        ---物品添加
                        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
                        if tab.goods[1].goodsType == 4 then
                            --皮肤展示
                            self:ShowSkin(tab.goods[1].goodsID)
                        else
                            --道具展示
                            MgrUI.Pop(UID.ItemAchievePop_UI, { tab.goods }, true)
                        end
                       
                        if self.parent.CallBack ~= nil then
                            self.parent.CallBack()
                        end
                        self.parent:RelocalSkin();
                        self.parent:RefreshUI()
                    end
                end
            end)
        end),nil,2})
    end)
end

function M:OnUpdateUI(args)
    ---@type RoleSkinData
    self.PData = args[1]
    self.parent = args[2]
    ---@type ItemData 自选券
    self.CostItemData = args[3]

    UIEvent.ClearFun(self.RewardIconImg().gameObject)
    self.goods = {
        goodsType = self.CostItemData.goods.goodsType,
        goodsID = self.CostItemData.goods.goodsID,
        goodsNum = 1
    }
    if #self.PData == 3 then
        self.target = {
            goodsType = tonumber(self.PData[1]),
            goodsID = tonumber(self.PData[2]),
            goodsNum = tonumber(self.PData[3])
        }
        self.user().gameObject:SetActive(false)
        self.Btn_Xuanze().gameObject:SetActive(true)
    else
        self.target = {
            goodsType = 4,
            goodsID = self.PData.id,
            goodsNum = 1
        }
        --皮肤归属角色
        self.Text_userName().text = self.PData.roleName
        self.Img_Yiyongyoudi().gameObject:SetActive(self.PData.unlockState)
        self.Btn_Xuanze().gameObject:SetActive(not self.PData.unlockState)
        self.user().gameObject:SetActive(true)
        --皮肤展示
        UIEvent.LuaClick(self.RewardIconImg().gameObject,function()
            self:ShowSkin(self.PData.id)
        end,nil,self.RewardIconImg())
    end
   
    local BagItemData = ItemControl.GetItemByType(self.target.goodsType, self.target.goodsID)
    self.Text_Jueseming().text = BagItemData.name
    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..BagItemData.quality)
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..BagItemData.icon)
    self.Img_ItemCountBg().gameObject:SetActive(self.target.goodsNum > 1)
    self.ItemCountText().text = self.target.goodsNum
end

---皮肤展示
function M:ShowSkin(_skinId)
    local skinInfo = {
        heroID = _skinId,         ---id
    }
    MgrUI.Pop(UID.DrawResultPop_UI, { { skinInfo } }, true)
end

return M