-- Code Auto Create Begin
local M = Class('VigorInfoPanel', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VigorInfoPanel
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VigorInfoPanel].prefab'
    self.Name = 'Form[VigorInfoPanel]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ReturnBg','Ani/ReturnBg',2},{'Img_Tanchuangdi1','Ani/Img_Tanchuangdi1',2},{'Img_xian1','Ani/Img_Tanchuangdi1/Img_xian1',2},{'Img_xian2','Ani/Img_Tanchuangdi1/Img_xian2',2},{'Img_xian3','Ani/Img_Tanchuangdi1/Img_xian3',2},{'Img_xian4','Ani/Img_Tanchuangdi1/Img_xian4',2},{'Btn_Confirm','Ani/Btn_Confirm',2},{'Img_Quedingdi','Ani/Btn_Confirm/Img_Quedingdi',2},{'ReplyCountPanel','Ani/ReplyCountPanel',2},{'ReplyVolumePanel','Ani/ReplyVolumePanel',2},{'JT','Ani/ReplyVolumePanel/JT',2},{'DrugPanel','Ani/DrugPanel',2},{'Img_Shuliangdi','Ani/DrugPanel/Img_Shuliangdi',2},{'Btn_Max','Ani/DrugPanel/Btn_Max',2},{'Btn_Min','Ani/DrugPanel/Btn_Min',2},{'Btn_LvUpHighLight','Ani/DrugPanel/Btn_Add/Btn_LvUpHighLight',2},{'+(hei)2','Ani/DrugPanel/Btn_Add/Btn_LvUpHighLight/+(hei)2',2},{'Btn_LvUp','Ani/DrugPanel/Btn_Add/Btn_LvUp',2},{'+(hui)2','Ani/DrugPanel/Btn_Add/Btn_LvUp/+(hui)2',2},{'Btn_LvDownHighLight','Ani/DrugPanel/Btn_Reduce/Btn_LvDownHighLight',2},{'-(hei)2','Ani/DrugPanel/Btn_Reduce/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvDown','Ani/DrugPanel/Btn_Reduce/Btn_LvDown',2},{'-(hui)2','Ani/DrugPanel/Btn_Reduce/Btn_LvDown/-(hui)2',2},{'CostRoughPanel','Ani/CostRoughPanel',2},{'bg','Ani/NeedPanel/bg',2},{'ScrollView','Ani/NeedPanel/bg/Scroll View',2},{'Viewport','Ani/NeedPanel/bg/Scroll View/Viewport',2},{'NeedPanelRoot','Ani/NeedPanel/bg/Scroll View/Viewport/NeedPanelRoot',2},{'ItemPreFab','Ani/NeedPanel/ItemPreFab',2},{'RewardRankImg','Ani/NeedPanel/ItemPreFab/RewardRankImg',2},{'RewardIconImg','Ani/NeedPanel/ItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','Ani/NeedPanel/ItemPreFab/Img_ItemCountBg',2},{'StarPanel','Ani/NeedPanel/ItemPreFab/StarPanel',2},{'EmptyStarRoot','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar1','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar1',2},{'EmptyStar2','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar2',2},{'EmptyStar3','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar3',2},{'EmptyStar4','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar4',2},{'EmptyStar5','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar5',2},{'EmptyStar6','Ani/NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar6',2},{'ItemStarRoot','Ani/NeedPanel/ItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Ani/NeedPanel/ItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Selected','Ani/NeedPanel/ItemPreFab/Img_Selected',2},{'Img_Biaotixian2','Ani/NeedPanel/Img_Biaotixian2',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','Ani/Img_Tanchuangdi1/Text_Title',20},{'Text_Queding','Ani/Btn_Confirm/Text_Queding',20},{'Text_Huifucishu','Ani/ReplyCountPanel/Text_Huifucishu',20},{'Text_ReplyCount','Ani/ReplyCountPanel/Text_ReplyCount',20},{'Text_Huifuliang','Ani/ReplyVolumePanel/Text_Huifuliang',20},{'Text_ReplyVolume','Ani/ReplyVolumePanel/Text_ReplyVolume',20},{'Text_CurVolume','Ani/ReplyVolumePanel/Text_CurVolume',20},{'Text_ItemCount','Ani/DrugPanel/Text_ItemCount',20},{'BtnMaxLV_Txt','Ani/DrugPanel/Btn_Max/BtnMaxLV_Txt',20},{'BtnMinLV_Txt','Ani/DrugPanel/Btn_Min/BtnMinLV_Txt',20},{'Text_Shiyongshuliang','Ani/DrugPanel/Text_Shiyongshuliang',20},{'Text_Fangshoufang','Ani/CostRoughPanel/Text_Fangshoufang',20},{'Text_CostRough','Ani/CostRoughPanel/Text_CostRough',20},{'ItemCountText','Ani/NeedPanel/ItemPreFab/Img_ItemCountBg/ItemCountText',20},{'Text_Buchongfangshi','Ani/NeedPanel/Text_Buchongfangshi',20},
    }
end
-- Code Auto Create End
require("LocalData/PlbuyLocalData")
function M:OnInit()
   
    self.ItemPreFab().gameObject:SetActive(false)
    ---@type ItemData
    self.CurItem = nil --- 当前选择物品
    self.CurBuyNumber = PlayerControl.BuyNumber    ---当前购买次数
    self.BuyId =   self.CurBuyNumber +1   ---当前购买id
    self.CurItemCount = 1   ---当前物品选择数量
    self.CurType = 1
    self:InitNeedPanel()
    self:ItemClick(100000)
    self:InitButton()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
---确认操作回调
function M:OnShow(callback)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    if callback and callback[1] then
        self.Callback = callback[1]
    end
    if callback and callback[2] then
        self.closeCallBack = callback[2]
    end
end

function M:InitButton()
    self.IntClicking = false  --是否在长按中
    self.EndClicking = true   --是否结束长按
    self.loopTimer = 0        --长按持续时间
    self.isAdd = true         --是否是增加
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaPressClick(self.Btn_LvUpHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = true

        ---单次点击逻辑
        self:DrugAdd()
        ---长按逻辑
        self:LoopInput()
    end)
    UIEvent.LuaPressClick(self.Btn_LvDownHighLight().gameObject,function()
        if self.IntClicking == true then
            return
        end
        self.IntClicking = true
        self.EndClicking = false
        self.loopTimer = 0
        self.isAdd = false

        ---单次点击逻辑
        self:DrugReduce()
        ---长按逻辑
        self:LoopInput()
    end)
    UIEvent.LuaClick(self.Btn_Min().gameObject,Handle(self, self.DrugMin))
    UIEvent.LuaClick(self.Btn_Max().gameObject,Handle(self, self.DrugMax))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self, self.ConfirmClick))
    UIEvent.LuaClick(self.ReturnBg().gameObject,Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.ClosePop(self.Uid)
    end))
end

---长按逻辑
function M:LoopInput()
    if self.EndClicking == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), self.ObjRoot)
        self.IntClicking = true
        self.loopTimer = self.loopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.loopTimer > 5 then
            if self.isAdd then
                self:DrugAdd()   --增加
            else
                self:DrugReduce()   --减少
            end
        end
        ---循环结束
        if bool_IsUp == false then
            self.IntClicking = false
            self.EndClicking = true
            self.loopTimer = 0
        end
    end
end

function M:InitNeedPanel()
    self.selectedObj = {}
    local itemId =
    {
        [1] = 100000,
        [2] = 110002,
        [3] = 110001,
        [4] = 110000,
    }
    for i, v in pairs(itemId) do
        ---@type ItemData
        local itemData = ItemControl.GetItemByID(v)
        if itemData.count>0 or v == 100000 then
            local obj =  GameObject.Instantiate(self.ItemPreFab().gameObject,self.NeedPanelRoot().gameObject.transform,false)
            obj:SetActive(true)
            local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
            local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
            local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
            local Img_Selected = obj.transform:Find("Img_Selected").gameObject
            local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
            local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
            local StarPanel = obj.transform:Find("StarPanel").gameObject
            Img_Selected:SetActive(false)
            self.selectedObj[v] = Img_Selected
            ---设置品质
            MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
            ---设置图标
            MgrRes.LoadSprite(RewardIconImg,itemData.icon)
            ---设置数量
            ItemCountText.text = JNStrTool.numberAbbr(itemData.count)--itemData.count >= 10000 and math.floor(tonumber(itemData.count)/1000).."K" or itemData.count
            ---设置星级
            if itemData.star > 0 then
                StarPanel:SetActive(true)
                self:InitStarPanel(itemData.star,ItemStarRoot,ItemStarPrefab)
            else
                StarPanel:SetActive(false)
            end
            ItemStarPrefab:SetActive(false)

            UIEvent.LuaClick(obj,Handle(self, function()
                    self:ItemClick(v)
            end))
        end
    end
end

function M:ItemClick(itemId)
    self.CurItem = ItemControl.GetItemByID(itemId)
    self.CurItemCount = 1
    for i, v in pairs(self.selectedObj) do
        if i == itemId  then
            v:SetActive(true)
        else
            v:SetActive(false)
        end
    end
    if itemId == 100000 then
        self:ChangeCostType(1)
    else
        self:ChangeCostType(2)
    end
end

--- 1 为消耗原石  2 为药
function M:ChangeCostType(type)
    if type == 1 then
        self.CostRoughPanel().gameObject:SetActive(true)
        self.DrugPanel().gameObject:SetActive(false)
        self.ReplyCountPanel().gameObject:SetActive(true)
    elseif type == 2 then
        self.CostRoughPanel().gameObject:SetActive(false)
        self.DrugPanel().gameObject:SetActive(true)
        self.ReplyCountPanel().gameObject:SetActive(false)
    end
    self:UpdataPanel(type)
end
--- 1 为消耗原石  2 为药
function M:UpdataPanel(type)
    self.CanBuy = true
    self.YSCanBuy = true
    self.CurType = type
    local sum = 0
    self.Text_CurVolume().text = PlayerControl.GetVigor()
    if type == 1 then
        local max = #PlbuyLocalData.tab
        local item = PlbuyLocalData.tab[self.BuyId]
        if item == nil then
            item = PlayerControl.GetVigor()
            self.Text_CostRough().text = 0
            self.YSCanBuy = false
        else
            sum = tonumber(item[3]) + PlayerControl.GetVigor()
            self.Text_CostRough().text = JNStrTool.strSplit("_",item[4])[3]
        end
        self.Text_ReplyCount().text = (max - self.CurBuyNumber).."/"..max
        self.Text_ReplyVolume().text = sum
    elseif type == 2 then
        local vigor =JNStrTool.strSplit("_",self.CurItem.fall)[3]
        sum = self.CurItemCount*tonumber(vigor) + PlayerControl.GetVigor()
        if sum > tonumber(SteamLocalData.tab[104017][2]) then
            self.CurItemCount = 1
        end
        self:SwitchDownOrUp()
        self.Text_ItemCount().text = self.CurItemCount
        self.Text_ReplyVolume().text = self.CurItemCount*tonumber(vigor) + PlayerControl.GetVigor()
    end
    if sum > 1000 then
        self.CanBuy = false
    end
    ---体力上限就不能点增加了
    self.Btn_LvUp().gameObject:SetActive(sum > 1000)
    self.Btn_LvUpHighLight().gameObject:SetActive(not (sum > 1000))
end
---添加药
function M:DrugAdd()
    local count = self.CurItemCount + 1
    if count > self.CurItem.count then
        return
    else
        local vigor =JNStrTool.strSplit("_",self.CurItem.fall)[3]
        local maxVigor = count * vigor
        local Limit = tonumber(SteamLocalData.tab[104017][2])
        ---如果用所有药获得的体力大于体力上限
        if maxVigor + PlayerControl.GetVigor() > Limit then
            count = self.CurItemCount
        else
            self.CurItemCount = count
        end
        self:UpdataPanel(2)
    end
end
---减少药
function M:DrugReduce()
    if self.CurItemCount <= 1 then
        return
    end
    local count = self.CurItemCount - 1
    self.CurItemCount = count
    self:UpdataPanel(2)
end
---最大药
function M:DrugMax()
    if self.CurItemCount == self.CurItem.count then
        return
    end
    local vigor =JNStrTool.strSplit("_",self.CurItem.fall)[3]
    local Limit = tonumber(SteamLocalData.tab[104017][2])
    ---如果超出体力最大上限
    if PlayerControl.GetVigor() +tonumber(vigor) > Limit then
        return
    end
    local num = math.floor((Limit - PlayerControl.GetVigor()) / tonumber(vigor))
    ---如果用所有药获得的体力大于体力上限
    if num >= 1 then
        ---如果药剂足够
        if self.CurItem.count > num then
            self.CurItemCount = math.floor((Limit - PlayerControl.GetVigor()) / tonumber(vigor))
        else
            self.CurItemCount = self.CurItem.count
        end
    else
        self.CurItemCount = self.CurItem.count
    end
    ---如果使用次数等于0
    if self.CurItemCount == 0 then
        return
    end
    self:UpdataPanel(2)
end
---最小药
function M:DrugMin()
    if self.CurItemCount == 1 then
        return
    end
    self.CurItemCount = 1
    self:UpdataPanel(2)
end

function M:ConfirmClick()
    if not self.CanBuy then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("vigorlnfopanel_tips1"),1},true)
        return
    end
    if not self.YSCanBuy then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips1"),1},true)
        return
    end
   
    if self.CurType == 1 then
        --原初结晶不足时增加二次弹窗
        local balance = ItemControl.GetItemByIdAndType(100000,1)--原初结晶的数量
        local item = PlbuyLocalData.tab[self.BuyId]
        local needNum = tonumber(JNStrTool.strSplit("_",item[4])[3])
        if balance.count >= needNum then
            MgrUI.Pop(UID.ConfirmPop_UI,
            {string.format(MgrLanguageData.GetLanguageByKey("ui_recovepower_tips"),needNum),
            function()
                Event.Remove("BackKey", Handle(self, self.OnBackKey))
                 self:SendBuyGoods(self.BuyId)
            end,nil,2},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("shopviewmodel_tips2"),1},true)
        end
    elseif self.CurType == 2 then
        local good =
        {
            goodsType = 1,
            goodsID = self.CurItem.id,
            goodsNum = self.CurItemCount
        }
        ItemControl.UseGoods(good,nil,Handle(self,self.UseGoodsACK),Handle(self,self.UseGoodsNTF))
    end
end

---使用物品返回
function M:UseGoodsACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientUseGoodsACK',buffer))
    print(tab.errNo)
    if tab.errNo == 0 then
    elseif tab.errNo == 579 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips1"),2},true)
    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips3"),2},true)
    end
end
function M:UseGoodsNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientUseGoodsNTF',buffer))
    print(tab)
    ---统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    
    ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips2"),1},true)
    if self.Callback ~= nil then
        self.Callback()
    end
    MgrUI.ClosePop(self.Uid)
end

---购买体力
function M:SendBuyGoods(id)
    local buyGoods = {
        id = id
    }
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientBuySpecialREQ',buyGoods))
    ItemControl.AckError = true
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_BUY_VIGOR_REQ,bytes,0,nil,Handle(self,self.ReceiveBuyGoodsACK),Handle(self,self.ReceiveBuyGoodsNTF))
end
---购买回调
function M:ReceiveBuyGoodsACK(buffer, tag)
    if tag ~= 0 then
        return
    end
    local tab = assert(pb.decode('PBClient.ClientBuySpecialACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        if tab.errNo == 518 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips4") .. tab.errNo,1})
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips4") .. tab.errNo,1})
            --MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("need_more_diamond"),function()
            --    local tLinkMark = {"tz","sc","cz","01"}
            --    MgrLink.LinkStart(tLinkMark)
            --    MgrUI.ClosePop(self.Uid)
            --end,nil,2,function ()
            --    MgrUI.ClosePop(self.Uid)
            --end})
        end

    end
end
---购买回调
function M:ReceiveBuyGoodsNTF(buffer, tag)
    if tag ~= 0 then
        return
    end
    local tab = assert(pb.decode('PBClient.ClientBuySpecialNTF',buffer))
    ---统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ---消耗物品
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    ---添加物品
    if tab.goods.goodsID == 100001 then
        local vigorinfo =
        {
            vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + tab.goods.goodsNum,
            vigorTime = Global.GetCurTime()
        }
        PlayerControl.GetPlayerData():PushVigor(vigorinfo)
        PlayerControl.BuyNumber =  PlayerControl.BuyNumber + 1
    elseif tab.goods.goodsID == 100009 then
        PVPViewModel.HighCard =  PVPViewModel.HighCard + tab.goods.goodsNum
        PlayerControl.BigPVPBuyNumber =  PlayerControl.BigPVPBuyNumber + 1
    end
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips8"),1},true)
    if self.Callback ~= nil then
        self.Callback()
    end
    MgrUI.ClosePop(self.Uid)
end

---切换按钮状态
function M:SwitchDownOrUp()
    if self.CurItemCount >= self.CurItem.count then
        self.Btn_LvUpHighLight().gameObject:SetActive(false)
        self.Btn_LvUp().gameObject:SetActive(true)
    else
        self.Btn_LvUpHighLight().gameObject:SetActive(true)
        self.Btn_LvUp().gameObject:SetActive(false)
    end

    if self.CurItemCount > 0 and self.CurItemCount <= self.CurItem.count then
        self.Btn_LvDownHighLight().gameObject:SetActive(true)
        self.Btn_LvDown().gameObject:SetActive(false)
    else
        self.Btn_LvDownHighLight().gameObject:SetActive(false)
        self.Btn_LvDown().gameObject:SetActive(true)
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

function M:OnClose()
    if self.closeCallBack then
        self.closeCallBack()
    end
end

return M