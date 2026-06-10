-- Code Auto Create Begin
local M = Class('OptionalItem3', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalItem3.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalItem3','/',2},{'Image','Equip/wupin/Image',2},{'RewardRankImg','Equip/wupin/RewardRankImg',2},{'RewardIconImg','Equip/wupin/RewardIconImg',2},{'Img_Zhuangbeimingdi','Img_Zhuangbeimingdi',2},{'user','user',2},{'Btn_Xuanze','Btn_Xuanze',2},{'Img_Zixuanquan','Text_Xiaohao/Img_Zixuanquan',2},{'Img_Yiyongyoudi','Img_Yiyongyoudi',2},{'Img_Suipian','Img_Yiyongyoudi/Img_Suipian',2},
        -- Text 列表
        {'Text_Zhuangbeiming','Img_Zhuangbeimingdi/Text_Zhuangbeiming',3},{'Text_userName','user/Text_userName',3},{'Text','user/Text',3},{'Text_Xuanze','Btn_Xuanze/Text_Xuanze',3},{'Text_Xiaohao','Text_Xiaohao',3},{'Text_Shuliang1','Text_Xiaohao/Text_Shuliang1',3},{'Text_Yiyongyou','Img_Yiyongyoudi/Text_Yiyongyou',3},{'Text_Shuliang2','Img_Yiyongyoudi/Text_Shuliang2',3},
        -- UITemplate 列表
        {'OptionalItem301','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击选择
    UIEvent.LuaClick(self.Btn_Xuanze().gameObject,function()
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_knapsack_exchange"),self.equipName),function()
            self:Exchange()
        end,nil,2 },true)
    end)
end

function M:OnUpdateUI(args)
    self.PData = args[1]
    self.parent = args[2]
    ---@type ItemData
    self.CostItemData = args[3]     --自选券

    ---解析装备
    local str = string.split(self.PData,"_")
    ---@type EquipData
    local equipData = EquipControl.GetSingleEquips(tonumber(str[2]))
    ---刷新物品等级
    MgrRes.LoadSprite(self.RewardRankImg(),equipData.iconFrame)
    ---物品图标
    MgrRes.LoadSprite(self.RewardIconImg(),equipData.icon)
    ---装备名字
    self.equipName = equipData.name
    self.Text_Zhuangbeiming().text = equipData.name
    ---装备归属
    self.Text_userName().text = equipData:GetRole().name
    ---消耗图标
    MgrRes.LoadSprite(self.Img_Zixuanquan(),self.CostItemData.icon)
    ---重复返还
    if equipData.lockState then
        self.Img_Yiyongyoudi().gameObject:SetActive(true)
        local equipData = EquipControl.GetSingleEquips(tonumber(string.split(self.PData,"_")[2]))
        local str = string.split(equipData.keepSake,"_")   ---重复获得的材料
        local item = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
        MgrRes.LoadSprite(self.Img_Suipian(),item.icon)
        self.Text_Shuliang2().text = "x" .. tonumber(str[3])
    else
        self.Img_Yiyongyoudi().gameObject:SetActive(false)
    end

end

---兑换
function M:Exchange()
    local str = string.split(self.PData,"_")
    local target = {
        goodsType = tonumber(str[1]),
        goodsID = tonumber(str[2]),
        goodsNum = tonumber(str[3]),
    }
    local goods = {
        goodsType = self.CostItemData.goods.goodsType,
        goodsID = self.CostItemData.goods.goodsID,
        goodsNum = 1,
    }
    ItemControl.UseSelectGoods(goods, target, function(err, msgId)
        if not err then
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"), err), 1 }, true)
            ---网络异常处理（待处理）
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseACK', buffer))
        if tab.errNo ~= 0 then
            Log.Error(string.format("使用物品失败，error = %s", tab.errNo))
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("ItemControl_network_anomaly"), tab.errNo), 1 }, true)
            ---网络异常处理（待处理）
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
        ---消耗道具
        ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
        ---更新装备
        local equipList = {}
        if tab.equip ~= nil then
            for i,v in pairs(tab.equip) do
                equipList[#equipList + 1] =
                {
                    goodsID = v.equipID,
                    goodsNum = 1,
                    goodsType = 5,
                    level = v.equipLevel
                }
            end
        end
        if tab.goods ~= nil then
            for i,v in pairs(tab.goods) do
                equipList[#equipList + 1] = v
            end
        end
        for k,v in pairs(equipList) do
            if v.goodsType == 5 then
                EquipControl.PushSingleEquipData(
                        {
                            equipID = v.goodsID,
                            equipLevel = v.level
                        }
                )
            else
                local hd = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
                ItemControl.PushSingleItemData(v,ItemControl.PushEnum.add)
            end
        end
        if #equipList > 0 then
            MgrUI.CloseAllPop()
            MgrUI.Pop(UID.ItemAchievePop_UI, { equipList }, true)
        end
        if self.parent.CallBack ~= nil then
            self.parent.CallBack()
        end
    end)
end

return M