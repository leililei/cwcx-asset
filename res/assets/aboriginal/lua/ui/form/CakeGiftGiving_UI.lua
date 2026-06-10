-- Code Auto Create Begin
local M = Class('CakeGiftGiving_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CakeGiftGiving_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CakeGiftGiving_UI].prefab'
    self.Name = 'Form[CakeGiftGiving_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Bg_Songli','Bg_Songli',2},{'Img_Role','Bg_Songli/Img_Role',2},{'Img_xiangkuang','Bg_Songli/Img_xiangkuang',2},{'UI_QinRenJie_BianKuang','Bg_Songli/Img_xiangkuang/UI_QinRenJie_BianKuang',2},{'GiftPanel','GiftPanel',2},{'Btn_xuanze','GiftPanel/Btn_xuanze',2},{'GiftItem','GiftPanel/RoleScroll/GiftItem',2},{'Img_Head','GiftPanel/RoleScroll/GiftItem/Img_Head',2},{'Img_xiangkuang2','GiftPanel/RoleScroll/GiftItem/Img_Head/Img_xiangkuang2',2},{'Img_yizengsong','GiftPanel/RoleScroll/GiftItem/Img_yizengsong',2},{'Img_Xuanze','GiftPanel/RoleScroll/GiftItem/Img_Xuanze',2},{'GiftltContent','GiftPanel/RoleScroll/GiftltContent',2},{'XinPanel','XinPanel',2},{'ScrollView','XinPanel/ScrollView',2},{'Viewport','XinPanel/ScrollView/Viewport',2},{'RewardBackItem','XinPanel/RewardBackScroll/RewardBackItem',2},{'RewardRankImg','XinPanel/RewardBackScroll/RewardBackItem/RewardRankImg',2},{'RewardIconImg','XinPanel/RewardBackScroll/RewardBackItem/RewardIconImg',2},{'Img_ItemCountBg','XinPanel/RewardBackScroll/RewardBackItem/Img_ItemCountBg',2},{'StarPanel','XinPanel/RewardBackScroll/RewardBackItem/StarPanel',2},{'EmptyStarRoot','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot',2},{'EmptyStar','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','XinPanel/RewardBackScroll/RewardBackItem/StarPanel/ItemStarPrefab',2},{'Img_Received','XinPanel/RewardBackScroll/RewardBackItem/Img_Received',2},{'Content','XinPanel/RewardBackScroll/Content',2},{'Btn_yijianlingqu','XinPanel/Btn_yijianlingqu',2},{'Btn_Coin','Btn_Coin',2},{'Btn_Add','Btn_Coin/Btn_Add',2},{'Img_Zuanshicon','Btn_Coin/Img_Zuanshicon',2},{'Huobi','Huobi',2},
        -- LoopScrollRect 列表
        {'RoleScroll','GiftPanel/RoleScroll',18},{'RewardBackScroll','XinPanel/RewardBackScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'MailContentTxt','XinPanel/ScrollView/Viewport/MailContentTxt',20},{'ItemCountText','XinPanel/RewardBackScroll/RewardBackItem/Img_ItemCountBg/ItemCountText',20},{'Text_Yilingqu2','XinPanel/RewardBackScroll/RewardBackItem/Img_Received/Text_Yilingqu2',20},{'Text_ZSCount','Btn_Coin/Text_ZSCount',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.GiftData,self.GiftDataByOrder = CakeControl.GetGiftData()
    self.Select = nil
    self.CoinList = {}
    self.AwardList = {}
    
    self.RoleScroll():SetLuaCellEvent(Handle(self, self.CellRole))
    self.RewardBackScroll():SetLuaCellEvent(Handle(self, self.CellItem))
    
    self:InitButton()
    self:InitRoleScroll()
    self:UpdateCoin()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        if self.XinPanel().gameObject.activeSelf then
            self.GiftPanel().gameObject:SetActive(true)
            self.XinPanel().gameObject:SetActive(false)
        else
            MgrUI.GoBack()
        end
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_yijianlingqu().gameObject, function()
        CakeControl.ReturnGift(CakeControl.GetCurGiftData().id,function()
            self.GiftPanel().gameObject:SetActive(true)
            self.XinPanel().gameObject:SetActive(false)
        end)
    end)
    ---确定送礼角色按钮
    UIEvent.LuaClick(self.Btn_xuanze().gameObject,function()
        if CakeControl.GetCurGiftData().isGive then
            if CakeControl.GetCurGiftData().type == CakeControl.SendGiftType.Plot then
                PlotViewModel.OpenPlotUI(CakeControl.GetCurGiftData().plot,function()

                end,true,nil)
            else
                self.GiftPanel().gameObject:SetActive(false)
                self.XinPanel().gameObject:SetActive(true)
                self.MailContentTxt().text = CakeControl.GetCurGiftData().text

                self.AwardList = CakeControl.GetCurGiftData().award
                self.RewardBackScroll().totalCount = #self.AwardList
                self.RewardBackScroll():RefillCells()
                self.Btn_yijianlingqu().gameObject:SetActive(not CakeControl.GetCurGiftData().isReturn)
            end
        else
            local tGiftID = string.split(CakeControl.GetCurGiftData().gift[1],'_')[2]
            CakeControl.GiveGift(CakeControl.GetCurGiftData().id,tonumber(tGiftID),function(info)
                ---刷新界面
                self.Select = nil
                self.GiftData,self.GiftDataByOrder = CakeControl.GetGiftData()
                self.RoleScroll():RefreshCells()
                
                local tData = self.GiftData[info.gift.id]
                if tData then
                    if tData.type == CakeControl.SendGiftType.Plot then
                        PlotViewModel.OpenPlotUI(tData.plot,function()
                            ---弹出奖励窗口
                            MgrUI.Pop(UID.ItemAchievePop_UI,{info.reward},true)
                        end,true,nil)
                    else
                        self.GiftPanel().gameObject:SetActive(false)
                        self.XinPanel().gameObject:SetActive(true)
                        self.MailContentTxt().text = CakeControl.GetCurGiftData().text

                        self.AwardList = tData.award
                        self.RewardBackScroll().totalCount = #self.AwardList
                        self.RewardBackScroll():RefillCells()
                        self.Btn_yijianlingqu().gameObject:SetActive(true)
                    end
                end
                ---刷新货币
                self:ChangeWallet()
            end)
        end
    end)
end

function M:InitRoleScroll()
    self.RoleScroll().totalCount = #self.GiftDataByOrder
    self.RoleScroll():RefillCells()
end

---角色
function M:CellRole(trans, idx)
    self:RoleUI(trans.gameObject,self.GiftData[self.GiftDataByOrder[idx].id])
end
---回礼道具
function M:CellItem(trans, idx)
    local arr = string.split(self.AwardList[idx],'_')
    local goods =
    {
        goodsID = tonumber(arr[2]),
        goodsType = tonumber(arr[1]),
        goodsNum = tonumber(arr[3]),
    }
    self:ItemUI(trans.gameObject,goods)
end
---角色头像
function M:RoleUI(_obj,data)
    local tImg_Head = CJNUIMgr.GetSunUseName(_obj, "Img_Head"):GetComponent("Image")
    local tImg_yizengsong = CJNUIMgr.GetSunUseName(_obj, "Img_yizengsong")
    local tImg_Xuanze = CJNUIMgr.GetSunUseName(_obj, "Img_Xuanze")
    ---已赠送
    tImg_yizengsong.gameObject:SetActive(data.isGive)
    ---角色头像
    MgrRes.LoadQIcon(tImg_Head,data.role)
    ---头像点击
    UIEvent.LuaClick(_obj,function()
        if self.Select == tImg_Xuanze then
            return
        end
        self.Select.gameObject:SetActive(false)
        self.Select = tImg_Xuanze
        self.Select.gameObject:SetActive(true)
        ---角色
        MgrRes.LoadRectIcon(self.Img_Role(),data.role)
        self.UI_QinRenJie_BianKuang().gameObject:SetActive(data.isGive)
        if data.isGive then
            MgrRes.LoadSprite(self.Btn_xuanze(),"Activity/Cake/btn_xuanze")
        else
            MgrRes.LoadSprite(self.Btn_xuanze(),"Activity/Cake/btn_zengsong")
        end
        
        CakeControl.SetCurGiftData(data)
    end)
    ---选择框
    if CakeControl.GetCurGiftData() == nil or CakeControl.GetCurGiftData() == data then
        CakeControl.SetCurGiftData(data)
        self.Select = tImg_Xuanze
        self.Select.gameObject:SetActive(true)
        ---角色
        MgrRes.LoadRectIcon(self.Img_Role(),data.role)
        self.UI_QinRenJie_BianKuang().gameObject:SetActive(data.isGive)
        if data.isGive then
            MgrRes.LoadSprite(self.Btn_xuanze(),"Activity/Cake/btn_xuanze")
        else
            MgrRes.LoadSprite(self.Btn_xuanze(),"Activity/Cake/btn_zengsong")
        end
    else
        tImg_Xuanze.gameObject:SetActive(false)
    end
end
---回礼道具
function M:ItemUI(_obj,data)
    _obj:SetActive(true)
    local RewardRankImg = _obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local RewardIconImg = _obj.transform:Find("RewardIconImg"):GetComponent("Image")
    local ItemCountText = _obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local ItemStarPrefab = _obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local ItemStarRoot = _obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local StarPanel = _obj.transform:Find("StarPanel").gameObject
    local itemData = ItemControl.GetItemByType(data.goodsType,data.goodsID)
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
    ---钻石边框闪烁
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
    ItemCountText.text = JNStrTool.numberAbbr(data.goodsNum) --v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum)/1000).."K" or v.goodsNum
    
    if itemData.itemstar == 0 then
        StarPanel:SetActive(false)
    else
        StarPanel:SetActive(true)
        ---设置星级
        UISysTools.InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
        ItemStarPrefab:SetActive(false)
    end
    UIEvent.LuaClick(_obj, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(data.goodsID,data.goodsType)
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
end

---更新货币
function M:UpdateCoin()
    local tStr = self.GiftDataByOrder[1].gift
    local CoinObjList = {}
    for i, v in ipairs(tStr) do
        if #CoinObjList < i then
            CoinObjList[i] = GameObject.Instantiate(self.Btn_Coin().gameObject, self.Huobi().transform, false)
        end
        ---更新货币信息
        self.CoinList[i] = self:CoinCell(CoinObjList[i].gameObject, v)
    end
    self.Btn_Coin().gameObject:SetActive(false)
    ---刷新货币
    self:ChangeWallet()
end
---刷新货币
function M:ChangeWallet()
    for i, v in ipairs(self.CoinList) do
        v.CoinText.text = self:CoinCount(v.CoinID,v.CoinType)
    end
end
function M:CoinCount(Id,Type)
    local count = 0
    local bag = ItemControl.GetItemByIdAndType(Id,Type)
    if bag then
        count = JNStrTool.numberAbbr(bag.count)
    end
    return count
end
---更新货币信息
function M:CoinCell(_obj, _data)
    local tCoinText = CJNUIMgr.GetSunUseName(_obj, "Text_ZSCount"):GetComponent("TextMeshProUGUI")
    local tCoinIcon = CJNUIMgr.GetSunUseName(_obj, "Img_Zuanshicon"):GetComponent("Image")
    
    local tCoin = string.split(_data,'_')
    ---货币icon
    local tItem = ItemControl.GetItemByType(tonumber(tCoin[1]), tonumber(tCoin[2]))
    if tItem then
        MgrRes.LoadSprite(tCoinIcon, "Item/"..tItem.icon)
    end
    ---货币数据
    local CoinData = {
        CoinText = tCoinText,
        CoinID = tonumber(tCoin[2]),
        CoinType = tonumber(tCoin[1])
    }

    return CoinData
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
return M