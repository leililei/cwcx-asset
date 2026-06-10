-- Code Auto Create Begin
local M = Class('PVPTimeNumPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPTimeNumPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPTimeNumPop].prefab'
    self.Name = 'Form[PVPTimeNumPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 30
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ReturnBg','ReturnBg',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_xian','Img_Tanchuangdi/Img_xian',2},{'Img_xian01','Img_Tanchuangdi/Img_xian',2},{'Img_xian02','Img_Tanchuangdi/Img_xian',2},{'Img_xian03','Img_Tanchuangdi/Img_xian',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Quedingdi','Btn_Confirm/Img_Quedingdi',2},{'ReplyCountPanel','ReplyCountPanel',2},{'ReplyVolumePanel','ReplyVolumePanel',2},{'JT','ReplyVolumePanel/JT',2},{'DrugPanel','DrugPanel',2},{'Img_Shuliangdi','DrugPanel/Img_Shuliangdi',2},{'Btn_Max','DrugPanel/Btn_Max',2},{'Btn_Min','DrugPanel/Btn_Min',2},{'Btn_LvUpHighLight','DrugPanel/Btn_Add/Btn_LvUpHighLight',2},{'+(hei)2','DrugPanel/Btn_Add/Btn_LvUpHighLight/+(hei)2',2},{'Btn_LvUp','DrugPanel/Btn_Add/Btn_LvUp',2},{'+(hui)2','DrugPanel/Btn_Add/Btn_LvUp/+(hui)2',2},{'Btn_LvDownHighLight','DrugPanel/Btn_Reduce/Btn_LvDownHighLight',2},{'-(hei)2','DrugPanel/Btn_Reduce/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvDown','DrugPanel/Btn_Reduce/Btn_LvDown',2},{'-(hui)2','DrugPanel/Btn_Reduce/Btn_LvDown/-(hui)2',2},{'CostRoughPanel','CostRoughPanel',2},{'bg','NeedPanel/bg',2},{'NeedPanelRoot','NeedPanel/bg/NeedPanelRoot',2},{'ItemPreFab','NeedPanel/ItemPreFab',2},{'RewardRankImg','NeedPanel/ItemPreFab/RewardRankImg',2},{'RewardIconImg','NeedPanel/ItemPreFab/RewardIconImg',2},{'Img_ItemCountBg','NeedPanel/ItemPreFab/Img_ItemCountBg',2},{'ItemCountText','NeedPanel/ItemPreFab/Img_ItemCountBg/ItemCountText',2},{'StarPanel','NeedPanel/ItemPreFab/StarPanel',2},{'EmptyStarRoot','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot',2},{'EmptyStar','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','NeedPanel/ItemPreFab/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','NeedPanel/ItemPreFab/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','NeedPanel/ItemPreFab/StarPanel/ItemStarPrefab',2},{'Img_Selected','NeedPanel/ItemPreFab/Img_Selected',2},{'Img_Biaotixian2','NeedPanel/Img_Biaotixian2',2},
        -- Text 列表
        {'Text_Title','Img_Tanchuangdi/Text_Title',3},
        -- TextMeshProUGUI 列表
        {'Text_Queding','Btn_Confirm/Text_Queding',20},{'Text_Huifucishu','ReplyCountPanel/Text_Huifucishu',20},{'Text_ReplyCount','ReplyCountPanel/Text_ReplyCount',20},{'Text_ReplyVolume','ReplyVolumePanel/Text_ReplyVolume',20},{'Text_CurVolume','ReplyVolumePanel/Text_CurVolume',20},{'Text_txt','ReplyVolumePanel/Text_txt',20},{'Text_ItemCount','DrugPanel/Text_ItemCount',20},{'BtnMaxLV_Txt','DrugPanel/Btn_Max/BtnMaxLV_Txt',20},{'BtnMinLV_Txt','DrugPanel/Btn_Min/BtnMinLV_Txt',20},{'Text_Shiyongshuliang','DrugPanel/Text_Shiyongshuliang',20},{'Text_Xiaohaojiejing','CostRoughPanel/Text_Xiaohaojiejing',20},{'Text_CostRough','CostRoughPanel/Text_CostRough',20},{'ItemRemainText1','NeedPanel/ItemPreFab/Img_ItemCountBg/ItemCountText/ItemRemainText1',20},{'Text_Buchongfangshi','NeedPanel/Text_Buchongfangshi',20},
    }
end
-- Code Auto Create End
require("LocalData/JyarenabuyLocalData")

require("LocalData/PlbuyLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.ItemPreFab().gameObject:SetActive(false)
    ---@type ItemData
    self.CurItem = nil --- 当前选择物品
    self.CurBuyNumber = PlayerControl.BigPVPBuyNumber    ---当前购买次数
    self.BuyId =   self.CurBuyNumber +1   ---当前购买id
    self.CurItemCount = 0   ---当前物品选择数量
    self.CurType = 1
    self:InitNeedPanel()
    self:ItemClick(100000)
    self:InitButton()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end
---确认操作回调
function M:OnShow(callback)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    self.Callback = callback
end

function M:InitButton()
    UIEvent.AlwaysLongClick(self.Btn_LvUpHighLight().gameObject,Handle(self, self.DrugAdd))
    UIEvent.AlwaysLongClick(self.Btn_LvDownHighLight().gameObject,Handle(self, self.DrugReduce))
    UIEvent.LuaClick(self.Btn_Min().gameObject,Handle(self, self.DrugMin))
    UIEvent.LuaClick(self.Btn_Max().gameObject,Handle(self, self.DrugMax))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self, self.ConfirmClick))
    UIEvent.LuaClick(self.ReturnBg().gameObject,Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end))
end

function M:InitNeedPanel()
    self.selectedObj = {}
    local itemId =
    {
        [1] = 100000,
        [2] = 110040,
    }
    for i, v in pairs(itemId) do
        ---@type ItemData
        local itemData = ItemControl.GetItemByID(v)
        if itemData.count>0 or v == 100000 then
            local obj =  GameObject.Instantiate(self.ItemPreFab().gameObject,self.NeedPanelRoot().gameObject.transform,false)
            obj:SetActive(true)
            local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
            local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
            local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText/ItemRemainText1"):GetComponent("TextMeshProUGUI")
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
            ItemCountText.text = JNStrTool.numberAbbr(itemData.count) --itemData.count >= 10000 and math.floor(tonumber(itemData.count)/1000).."K" or itemData.count
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
    self.CurItemCount = 0
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

--- 1 为消耗原石  2 为券
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
--- 1 为消耗原石  2 为券
function M:UpdataPanel(type)
    self.YSCanBuy = true
    self.costCount = 0
    self.CurType = type
    local sum = 0
    self.Text_CurVolume().text = PVPViewModel.HighCard
    if type == 1 then
        local max = #JyarenabuyLocalData.tab
        local item = JyarenabuyLocalData.tab[self.BuyId]
        if item == nil then
            item =  PVPViewModel.HighCard
            self.Text_CostRough().text = 0
            self.YSCanBuy = false
        else
            sum = tonumber(item[3]) + PVPViewModel.HighCard
            self.Text_CostRough().text = JNStrTool.strSplit("_",item[4])[3]
            self.costCount = JNStrTool.strSplit("_",item[4])[3]
        end
        self.Text_ReplyCount().text = (max - self.CurBuyNumber).."/"..max
        self.Text_ReplyVolume().text = sum
    elseif type == 2 then
        self:SwitchDownOrUp()
        self.Text_ItemCount().text = self.CurItemCount
        local vigor =JNStrTool.strSplit("_",self.CurItem.fall)[3]
        self.Text_ReplyVolume().text = self.CurItemCount*tonumber(vigor) + PVPViewModel.HighCard
        self.UseGetCount = self.CurItemCount*tonumber(vigor)
    end
end
---添加药
function M:DrugAdd()
    local count = self.CurItemCount + 1
    if count > self.CurItem.count then
        return
    else
        if PVPViewModel.HighCard + count > tonumber(SteamLocalData.tab[107010][2]) then
            return
        end
        self.CurItemCount = count
        self:UpdataPanel(2)
    end

    ---如果按钮被关闭 清除长按方法防止一直调用
    if self.Btn_LvUpHighLight().gameObject.activeSelf == false then
        UIEvent.ClearFun(self.Btn_LvUpHighLight().gameObject)
    end

end
---减少药
function M:DrugReduce()
    if self.CurItemCount <= 0 then
        return
    end
    local count = self.CurItemCount - 1
    self.CurItemCount = count
    self:UpdataPanel(2)

    ---如果按钮被关闭 清除长按方法防止一直调用
    if self.Btn_LvDownHighLight().gameObject.activeSelf == false then
        UIEvent.ClearFun(self.Btn_LvDownHighLight().gameObject)
    end
end
---最大药
function M:DrugMax()
    if self.CurItemCount == self.CurItem.count then
        return
    end
    self.CurItemCount = self.CurItem.count
    if PVPViewModel.HighCard + self.CurItemCount > tonumber(SteamLocalData.tab[107010][2]) then
        self.CurItemCount = (tonumber(SteamLocalData.tab[107010][2]) - PVPViewModel.HighCard) < 0 and 0 or tonumber(SteamLocalData.tab[107010][2]) - PVPViewModel.HighCard
    end
    self:UpdataPanel(2)
end
---最小药
function M:DrugMin()
    if self.CurItemCount == 0 then
        return
    end
    self.CurItemCount = 0
    self:UpdataPanel(2)
end

function M:ConfirmClick()
    if self.CurItemCount == 0 and self.CurType == 2 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text133"),1},true)
        return
    end
    if not self.YSCanBuy then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips1"),1},true)
        return
    end
    if self.CurType == 1 then
        --原初结晶不足时增加二次弹窗
        local balance = ItemControl.GetItemByIdAndType(100000,1)--原初结晶的数量
        local item = JyarenabuyLocalData.tab[self.BuyId]
        local needNum = tonumber(JNStrTool.strSplit("_",item[4])[3])
        if balance.count >= needNum then
            MgrUI.Pop(UID.ConfirmPop_UI,
            {string.format(MgrLanguageData.GetLanguageByKey("ui_recoveticket_tips"),needNum),
            function() self:SendBuyGoods(self.BuyId) end,nil,2},true)
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
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips2"),2},true)
    elseif tab.errNo == 510 then

    else
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips9"),2},true)
    end
end
function M:UseGoodsNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientUseGoodsNTF',buffer))
    print(tab)
    ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
    ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips2"),1},true)
    PVPViewModel.HighCard =  PVPViewModel.HighCard + self.UseGetCount
    if self.Callback ~= nil then
        self.Callback()
    end
    MgrUI.ClosePop(self.Uid)
end

---购买体力
function M:SendBuyGoods(id)
    if id > tonumber(SteamLocalData.tab[107017][2]) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips4"),2},true)
        return
    end
    if PVPViewModel.HighCard + JyarenabuyLocalData.tab[id][3] > tonumber(SteamLocalData.tab[107010][2]) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips5"),2},true)
        return
    end
    local itemData = ItemControl.GetItemByID(100000)
    if itemData.count < tonumber(self.costCount) then
        MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips6"),itemData.name) ,2},true)
        return
    end

    local buyGoods = {
        id = id
    }
    ---序列化pb
    local bytes = assert(pb.encode('PBClient.ClientBuySpecialREQ',buyGoods))
    ItemControl.AckError = true
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_BUY_BLADDER_REQ,bytes,7,nil,Handle(self,self.ReceiveBuyGoodsACK),Handle(self,self.ReceiveBuyGoodsNTF))
end
---购买回调
function M:ReceiveBuyGoodsACK(buffer, tag)
    if tag ~= 7 then
        return
    end
    local tab = assert(pb.decode('PBClient.ClientBuySpecialACK',buffer))
    print(tab.errNo)
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("need_more_diamond"),function()
            local tLinkMark = {"tz","sc","cz","01"}
            MgrLink.LinkStart(tLinkMark)
        end,nil,2})
    end
end
---购买回调
function M:ReceiveBuyGoodsNTF(buffer, tag)
    if tag ~= 7 then
        return
    end
    local tab = assert(pb.decode('PBClient.ClientBuySpecialNTF',buffer))
    ---消耗物品
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
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
    if self.CurItemCount >= self.CurItem.count or self.CurItemCount + PVPViewModel.HighCard >= tonumber(SteamLocalData.tab[107010][2]) then
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
return M