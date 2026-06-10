-- Code Auto Create Begin
local M = Class('HalfAnniversaryShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryShop_UI].prefab'
    self.Name = 'Form[HalfAnniversaryShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Panel','Panel',2},{'Role','Panel/Role',2},{'SpineRole','Panel/Role/SpineRole',2},{'RoleClickArea','Panel/Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Panel/Role/Img_SoundTextBG',2},{'Shop','Panel/Shop',2},{'CommodityItem','Panel/Shop/CommodityItemScroll/CommodityItem',2},{'Img_Kuang','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Kuang',2},{'Img_Frame','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Frame',2},{'Img_Icon','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Icon',2},{'Img_Name','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Name',2},{'Img_ShengYu','Panel/Shop/CommodityItemScroll/CommodityItem/Img_ShengYu',2},{'Img_Coin','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Coin',2},{'HuobiIcon','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Coin/CoinPlane/HuobiIcon',2},{'StarPanel','Panel/Shop/CommodityItemScroll/CommodityItem/StarPanel',2},{'ItemStarPrefab','Panel/Shop/CommodityItemScroll/CommodityItem/StarPanel/ItemStarPrefab',2},{'HighLight','Panel/Shop/CommodityItemScroll/CommodityItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','Panel/Shop/CommodityItemScroll/CommodityItem/StarPanel/ItemStarRoot',2},{'Img_SoldOut','Panel/Shop/CommodityItemScroll/CommodityItem/Img_SoldOut',2},{'UpperLightPanel','UpperLightPanel',2},{'Btn_GoMenu','UpperLightPanel/Btn_GoMenu',2},{'Btn_Back','UpperLightPanel/Btn_Back',2},{'Img_Fenggexian','UpperLightPanel/Img_Fenggexian',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_Coin','UpperRightPanel/Btn_Coin',2},{'Img_BG01','UpperRightPanel/Btn_Coin/Img_BG',2},{'Img_Coin01','UpperRightPanel/Btn_Coin/Img_Coin',2},{'Huobi','UpperRightPanel/Huobi',2},
        -- RawImage 列表
        {'CommodityItemScroll','Panel/Shop/CommodityItemScroll',15},{'Content','Panel/Shop/CommodityItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'CommodityItemScroll01','Panel/Shop/CommodityItemScroll',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Panel/Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_Name','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Name/Text_Name',20},{'Text_ShengYu','Panel/Shop/CommodityItemScroll/CommodityItem/Img_ShengYu/Text_ShengYu',20},{'Text_JiaGe','Panel/Shop/CommodityItemScroll/CommodityItem/Img_Coin/CoinPlane/Text_JiaGe',20},{'Text_CantBuy','Panel/Shop/CommodityItemScroll/CommodityItem/Img_SoldOut/Text_CantBuy',20},{'Text_Title_CN','UpperLightPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLightPanel/Text_Title/Text_Title_EN',20},{'Text_Count','UpperRightPanel/Btn_Coin/Text_Count',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.curRoleId = 0
    self.ActiveData = HalfAnniControl.GetData()
    self.mCurCoin = 0
    self.CoinList = {}
    self.CoinObjList = {}

    for i, v in ipairs(self.ActiveData.shopType) do
        self.curRoleId = ShoptypeLocalData.tab[v].npcid
        --添加音效
        MgrSound.AddCue("Audio/role/".. self.curRoleId..".acb")
    end
    HalfAnniControl.curShopType = self.ActiveData.shopType[1]
    
    self:InitScroll()   --初始化滑块
    self:InitButton()   --初始化按钮事件
    self:RefreshCurShop(0)

    self:CreatSpine(self.SpineRole(),HalfAnniControl.curShopType)
    ---背景音乐
    if self.ActiveData and self.ActiveData ~= "" then
        MgrSound.PlayBGM(self.ActiveData.music,0.2,nil,true)
    end
end

---初始化按钮事件
function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击退出
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)

    ---点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:GetCurWords(97)
    end))
end

---初始化滑块
function M:InitScroll()
    self.CommodityItemScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:CellItem(trans,idx)
    self:ShopItem(trans.gameObject, self.shopItemList[idx], idx)
end

function M:ShopItem(_obj, _itemData, _idx)
    local _ShopName = CJNUIMgr.GetSunUseName(_obj, "Text_Name").gameObject:GetComponent("TextMeshProUGUI")
    local _ShopNum = CJNUIMgr.GetSunUseName(_obj, "Text_ShengYu").gameObject:GetComponent("TextMeshProUGUI")
    local _ItemCoin = CJNUIMgr.GetSunUseName(_obj, "Text_JiaGe").gameObject:GetComponent("TextMeshProUGUI")
    local _ItemCantBuy = CJNUIMgr.GetSunUseName(_obj, "Text_CantBuy").gameObject:GetComponent("TextMeshProUGUI")
    local _ImgCoin = CJNUIMgr.GetSunUseName(_obj, "HuobiIcon").gameObject:GetComponent("Image")
    local _ImgItem = CJNUIMgr.GetSunUseName(_obj, "Img_Icon").gameObject:GetComponent("Image")
    local _ImgBack = CJNUIMgr.GetSunUseName(_obj, "Img_Frame").gameObject:GetComponent("Image")
    local _ImgTitleBack = CJNUIMgr.GetSunUseName(_obj, "Img_Name").gameObject:GetComponent("Image")
    local _SoldOut = CJNUIMgr.GetSunUseName(_obj, "Img_SoldOut")
    local _StarPanel = CJNUIMgr.GetSunUseName(_obj, "StarPanel")
    local _ItemStarRoot = CJNUIMgr.GetSunUseName(_obj, "ItemStarRoot")
    local _ItemStarPrefab = CJNUIMgr.GetSunUseName(_obj, "ItemStarPrefab")
    _ItemStarPrefab.gameObject:SetActive(false)
    
    _ShopName.text = _itemData.name
    ---道具ICON
    MgrRes.LoadSprite(_ImgItem,_itemData.icon)
    ---道具品质
    MgrRes.LoadSprite(_ImgBack,"Activity/HalfAnniversary/Img_Shopkuangdi".._itemData.rank)
    MgrRes.LoadSprite(_ImgTitleBack,"Activity/HalfAnniversary/Img_ShopNamedi".._itemData.rank)

    if _itemData.shopType2 == 100 then
        local price
        local priceGoods = _itemData:GetPrice()
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(_ImgCoin,priceIcon)
        ---策划需求 100008商品直接读数目
        if _itemData:GetPrice().goodsID == 100008 then
            _ItemCoin.text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        else
            for i,v in pairs(PaidgoodsLocalData.tab) do
                ---找到价格
                if v[3] == _itemData.id then
                    price = v[8]
                    break
                end
            end
            _ItemCoin.text = price
        end
    else
        local priceGoods = _itemData:GetPrice()
        _ItemCoin.text = JNStrTool.numberAbbr(priceGoods.goodsNum)
        local priceIcon = string.format("Item/%s",Global.GetLocalDataByGoods(priceGoods).icon)
        MgrRes.LoadSprite(_ImgCoin,priceIcon)
    end

    if _itemData.buyMaxCount ~= 0 then
        if not SysLockControl.CheckSysLock(_itemData.buyLimit) then
            _ItemCantBuy.text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text120")
            _SoldOut.gameObject:SetActive(true)
        elseif _itemData.buyMaxCount - _itemData.buyCount == 0 then
            _ItemCantBuy.text = MgrLanguageData.GetLanguageByKey("ui_qita_text36")
            _SoldOut.gameObject:SetActive(true)
        else
            _SoldOut.gameObject:SetActive(false)
        end
    else
        ---检查该商品是否满足解锁条件
        if _itemData.buyLimit ~= 0 then
            if SysLockControl.CheckSysLock(_itemData.buyLimit) == false then
                --self.ShopCanvasGroup.alpha = 0.5
                _ItemCantBuy.text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text120")
                _SoldOut.gameObject:SetActive(true)
            else
                --self.ShopCanvasGroup.alpha = 1
                _SoldOut.gameObject:SetActive(false)
            end
        else
            --self.ShopCanvasGroup.alpha = 1
            _SoldOut.gameObject:SetActive(false)
        end
    end

    if _itemData.buyMaxCount == 0 then
        _ShopNum.text = MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limitless")
    else
        _ShopNum.text = string.format(MgrLanguageData.GetLanguageByKey("shopgoodsitem_inventorysurplus_limit"),_itemData.buyMaxCount - _itemData.buyCount)
    end

    if _itemData:GetBuyItem() ~= {} and _itemData:GetBuyItem()[1].goodsType == 2 then
        _StarPanel.gameObject:SetActive(true)
        local itemData = ItemControl.GetItemByIdAndType(_itemData.ladderItems[0][1].goodsID,_itemData.ladderItems[0][1].goodsType)
        --大于0更新星级显示
        if itemData.star > 0 then
            if _ItemStarRoot.transform.childCount > 0 then
                Tools.ClearAllChild(_ItemStarRoot.gameObject)
            end
            ---初始化最大星级
            for i = 1, 6 do
                local obj = GameObject.Instantiate(_ItemStarPrefab.gameObject,_ItemStarRoot.gameObject.transform,false)
                obj.gameObject:SetActive(true)
                local starHLObj = obj.transform:Find("HighLight").gameObject
                starHLObj:SetActive(i <= itemData.star)
            end
        end
    else
        _StarPanel.gameObject:SetActive(false)
    end
    ---购买商品
    UIEvent.LuaClick(_obj,function()
        ---为0表示没有解锁条件
        if _itemData.buyLimit ~= 0 then
            ---如果此商品未解锁
            if SysLockControl.CheckSysLock(_itemData.buyLimit) == false then
                MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(_itemData.buyLimit)})
                return
            end
        end

        local price = _itemData:GetPrice()     --价格:货币ID/货币数量/物品表第几页
        local data = ItemControl.GetItemByIdAndType(price.goodsID,price.goodsType)      --手中持有的货币数量
        local pMax = math.floor(data.count / price.goodsNum)                        --最大可买数量
        local bMax = _itemData.buyMaxCount - _itemData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
        ---如果超过最大可买数量
        if _itemData.buyMaxCount ~= 0 and _itemData.buyCount + 1 > _itemData.buyMaxCount then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips1"),1},true)
            return
        end
        MgrUI.Pop(UID.BuyPop_UI,{_itemData,function(count)
            ---没有货物数据或总价超出所持有的货币数
            if data == nil or price.goodsNum * count >  data.count then
                if data and data.id == 100000 then --只有是原初结晶才跳转到充值界面
                    MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("pvptimenumpop_tips6"),data.name),Handle(self, function()
                       
                    end),nil,2})
                else
                    MgrUI.Pop(UID.PopTip_UI,{string.format(MgrLanguageData.GetLanguageByKey("shop_ui_buyfail1"),data.name)},true)
                end
                return
            end
            ShopViewModel.SendBuyGoods({_itemData.id,count},function()
                ---播放语音
                self:GetCurWords(98)
                ---刷新商品
                self:RefreshCurShop()
                ---刷新货币
                self:ChangeWallet()
                ---任务相关红点
                HalfAnniControl.CheckTaskRedPoint()
            end)
        end,1,bMax,true,pMax},true)
    end)
end

---刷新商店道具
function M:RefreshCurShop(offset)
    self.shopData = HalfAnniControl.GetShopData()
    self.shopItemList = {}
    ---取出对应商店类型的数据
    for k,v in pairs(self.shopData[HalfAnniControl.curShopType]) do
        if v.buyCount == v.buyMaxCount and v.buyMaxCount ~= 0 then
            v.soldOut = 1
        else
            v.soldOut = 0
        end
        table.insert(self.shopItemList,v)
    end
    ---排序
    --Global.Sort(self.shopItemList,{"sortIdx"},false)
    table.sort(self.shopItemList,function(a,b)
        if a.soldOut > b.soldOut then
            return false
        elseif a.soldOut < b.soldOut then
            return true
        else
            return a.sortIdx < b.sortIdx
        end
    end)
    self.CommodityItemScroll01().totalCount = #self.shopItemList
    if offset then
        self.CommodityItemScroll01():RefillCells(offset)
    else
        self.CommodityItemScroll01():RefreshCells()
    end
    self:UpdateCoin()  --刷新货币
end

---创建立绘
function M:CreatSpine(_Root, _ShopType)
    local id = ShoptypeLocalData.tab[_ShopType].npcid
    local _PosInfoTab = CharactercoordinatesLocalData.tab[id].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    MgrRes.LoadWatch3DSpineInUI(_Root, id,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
    end)
    self:GetCurWords(97)
end

---获取当前台词
function M:GetCurWords(type)
    local _ActorLinesType = ShoptypeLocalData.tab[HalfAnniControl.curShopType].npcid   --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[3] == type then
            if value[5] == "0" then
                _CurTotalSumWeight = _CurTotalSumWeight + 10
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            else
                ---切割对应的触发条件得到条件表
                local _TempVarTab = JNStrTool.strSplit("_", value[5])
                local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab, 0)
                if _ReturnVar ~= false then
                    _CurTotalSumWeight = _CurTotalSumWeight + (tonumber(_ReturnVar) * 1000)
                    table.insert(_tempActorLineIdTab, { value[1], _CurTotalSumWeight })
                end
            end
        end
    end
    local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight, _tempActorLineIdTab)
    self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _ActorLineWord = ActorLinesLocalData.tab[_ActorLineId][7]

    if self.SpineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj, _AniName, true)
    end
    ---设置文本框文本
    self.RoleVoiceWordText().text = _ActorLineWord
    self.Img_SoundTextBG().gameObject:SetActive(true)

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,tostring(self.curRoleId))
    self:ListenVoice()
end

---更新货币
function M:UpdateCoin()
    local tCfg = ShoptypeLocalData.tab[HalfAnniControl.curShopType]
    if not tCfg then
        return
    end

    local tStr = string.split(tCfg.icons,';')
    for i, v in ipairs(tStr) do
        if #self.CoinObjList < i then
            self.CoinObjList[i] = GameObject.Instantiate(self.Btn_Coin().gameObject, self.Huobi().transform, false)
        end
        ---更新货币信息
        self.CoinList[i] = self:CoinCell(self.CoinObjList[i].gameObject, v)
        self.CoinObjList[i].gameObject:SetActive(true)
    end
    for i = #tStr+1, #self.CoinObjList do
        self.CoinObjList[i].gameObject:SetActive(false)
    end
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
    local tCoinText = CJNUIMgr.GetSunUseName(_obj, "Text_Count"):GetComponent("TextMeshProUGUI")
    local tCoinIcon = CJNUIMgr.GetSunUseName(_obj, "Img_Coin"):GetComponent("Image")

    local tCoinData = string.split(_data,',')
    local tCoin = string.split(tCoinData[1],'_')
    
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
--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("HYShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.curRoleId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("HYShopRoleVoice")
        end
    end,-1,nil)
end

function M:OnHide()
    MgrTimer.Cancel("HYShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end

function M:OnClose()
    MgrTimer.Cancel("HYShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M