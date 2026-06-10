-- Code Auto Create Begin
local M = Class('DiscountShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DiscountShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DiscountShop_UI].prefab'
    self.Name = 'Form[DiscountShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Role','Ani/Role',2},{'SpineRole','Ani/Role/SpineRole',2},{'RoleClickArea','Ani/Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Ani/Role/Img_SoundTextBG',2},{'TopGroup','Ani/RIghtGroup/TopGroup',2},{'Shop1','Ani/RIghtGroup/TopGroup/Shop1',2},{'Img_Plot2','Ani/RIghtGroup/TopGroup/Shop1/Unchecked/Img_Plot2',2},{'Img_Plot1','Ani/RIghtGroup/TopGroup/Shop1/Checked/Img_Plot1',2},{'RedDotIcon1','Ani/RIghtGroup/TopGroup/Shop1/RedDotIcon1',2},{'Shop2','Ani/RIghtGroup/TopGroup/Shop2',2},{'Img_Plot201','Ani/RIghtGroup/TopGroup/Shop2/Unchecked/Img_Plot2',2},{'Img_Plot101','Ani/RIghtGroup/TopGroup/Shop2/Checked/Img_Plot1',2},{'RedDotIcon101','Ani/RIghtGroup/TopGroup/Shop2/RedDotIcon1',2},{'black','Ani/RIghtGroup/black',2},{'DiscoutShopItem','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem',2},{'Img_Icon','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/Img_Icon',2},{'HuobiIcon','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/CoinPlane/HuobiIcon',2},{'Img_SoldOut','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/Img_SoldOut',2},{'StarPanel','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/StarPanel',2},{'ItemStarPrefab','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/StarPanel/ItemStarPrefab',2},{'HighLight','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/StarPanel/ItemStarRoot',2},{'Btn_Coin','Ani/Btn_Coin',2},{'Btn_Add','Ani/Btn_Coin/Btn_Add',2},{'Img_Zuanshicon','Ani/Btn_Coin/Img_Zuanshicon',2},{'Huobi','Ani/Huobi',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- Toggle 列表
        {'Shop101','Ani/RIghtGroup/TopGroup/Shop1',13},{'Shop201','Ani/RIghtGroup/TopGroup/Shop2',13},
        -- RawImage 列表
        {'CommodityGroup','Ani/RIghtGroup/CommodityGroup',15},
        -- LoopScrollRect 列表
        {'CommodityGroup01','Ani/RIghtGroup/CommodityGroup',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Ani/Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_name','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/Text_name',20},{'Text_ShengYu','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/Text_ShengYu',20},{'Text_JiaGe','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/CoinPlane/Text_JiaGe',20},{'Text_CantBuy','Ani/RIghtGroup/CommodityGroup/Mask/DiscoutShopItem/Img_SoldOut/Text_CantBuy',20},{'Text_ZSCount','Ani/Btn_Coin/Text_ZSCount',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Btn_Coin().gameObject:SetActive(false)
    
    self.curRoleId = 0
    self.CoinList = {}
    self.CoinObjList = {}
    self.activityData = ActivityControl.GetActivityInfo(ActivityControl.activityTypeEnum.DISCOUNT_SHOP)

    self.curRoleId = ShoptypeLocalData.tab[tonumber(self.activityData.shopType)].npcid
    --添加音效
    MgrSound.AddCue("Audio/role/".. self.curRoleId..".acb")
    
    self:InitScroll()   --初始化滑块
    self:InitButton()   --初始化按钮事件

    self:CreatSpine(self.SpineRole(),HaiYueControl.curShopType)

    self:RefreshCurShop(0)
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
        MgrUI.GetUICamera().orthographic = false
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
    self.CommodityGroup01():SetLuaCellEvent(Handle(self,self.CellItem))
end

function M:CellItem(trans,idx)
    self:ShopItem(trans.gameObject, self.shopItemList[idx], idx)
end

function M:ShopItem(_obj, _itemData, _idx)
    local _ShopName = CJNUIMgr.GetSunUseName(_obj, "Text_name").gameObject:GetComponent("TextMeshProUGUI")
    local _ShopNum = CJNUIMgr.GetSunUseName(_obj, "Text_ShengYu").gameObject:GetComponent("TextMeshProUGUI")
    local _ItemCoin = CJNUIMgr.GetSunUseName(_obj, "Text_JiaGe").gameObject:GetComponent("TextMeshProUGUI")
    local _ItemCantBuy = CJNUIMgr.GetSunUseName(_obj, "Text_CantBuy").gameObject:GetComponent("TextMeshProUGUI")
    local _ImgCoin = CJNUIMgr.GetSunUseName(_obj, "HuobiIcon").gameObject:GetComponent("Image")
    local _ImgItem = CJNUIMgr.GetSunUseName(_obj, "Img_Icon").gameObject:GetComponent("Image")
    local _SoldOut = CJNUIMgr.GetSunUseName(_obj, "Img_SoldOut")
    local _StarPanel = CJNUIMgr.GetSunUseName(_obj, "StarPanel")
    local _ItemStarRoot = CJNUIMgr.GetSunUseName(_obj, "ItemStarRoot")
    local _ItemStarPrefab = CJNUIMgr.GetSunUseName(_obj, "ItemStarPrefab")

    _ShopName.text = _itemData.name
    ---道具ICON
    MgrRes.LoadSprite(_ImgItem,_itemData.icon)
    ---道具品质
    MgrRes.LoadSprite(_obj.gameObject:GetComponent("Image"),_itemData.rankIcon)

    if _itemData.shopType2 == 986 then
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
        local bMax = _itemData.buyMaxCount - _itemData.buyCount   --剩余可购买次数  buyCount是已经购买了的次数 / buyMaxCount是读表的最大购买次数
        MgrUI.Pop(UID.BuyDiscountPop_UI, {_itemData, function()
            ShopViewModel.FlyFunBuyGoods(_itemData.id, function()
                ---播放语音
                self:GetCurWords(98)
                ---刷新商品
                self:RefreshCurShop()
            end)
        end, bMax})
    end)
end

---刷新商店道具
function M:RefreshCurShop(offset)
    self.shopData = ShopControl.GetCertainTypeShopData(tonumber(self.activityData.shopType))
    self.shopItemList = {}
    ---取出对应商店类型的数据
    for k,v in pairs(self.shopData) do
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
    self.CommodityGroup01().totalCount = #self.shopItemList
    if offset then
        self.CommodityGroup01():RefillCells(offset)
    else
        self.CommodityGroup01():RefreshCells()
    end
    self:UpdateCoin()  --刷新货币
end

---创建立绘
function M:CreatSpine(_Root, _ShopType)
    local id = self.curRoleId
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
    local _ActorLinesType = ShoptypeLocalData.tab[tonumber(self.activityData.shopType)].npcid   --当前台词组别
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

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("DiscountShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.curRoleId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("DiscountShopRoleVoice")
        end
    end,-1,nil)
end

function M:OnHide()
    MgrTimer.Cancel("DiscountShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end

function M:OnClose()
    MgrTimer.Cancel("DiscountShopRoleVoice")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

---更新货币
function M:UpdateCoin()
    local tCfg = ShoptypeLocalData.tab[tonumber(self.activityData.shopType)]
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
    local tAdd = CJNUIMgr.GetSunUseName(_obj, "Btn_Add")
    local tCoinText = CJNUIMgr.GetSunUseName(_obj, "Text_ZSCount"):GetComponent("TextMeshProUGUI")
    local tCoinIcon = CJNUIMgr.GetSunUseName(_obj, "Img_Zuanshicon"):GetComponent("Image")

    local tCoinData = string.split(_data,',')
    local tCoin = string.split(tCoinData[1],'_')
    if tCoinData[2] ~= "0" then
        tAdd.gameObject:SetActive(true)
        UIEvent.LuaClick(_obj, function()
            if tCoinData[2] == "tz_sc_cz_01" then
                self.Tog_Recharge01().isOn = true
            else
                MgrLink.LinkStart(tCoinData[2])
            end
        end)
    else
        tAdd.gameObject:SetActive(false)
        UIEvent.ClearFun(_obj)
    end
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

return M