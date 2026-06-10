-- Code Auto Create Begin
local M = Class('Shop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Shop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Shop_UI].prefab'
    self.Name = 'Form[Shop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'UpperLeftBtnPanel','TopView/UpperLeftBtnPanel',2},{'Btn_Back','TopView/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','TopView/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','TopView/UpperLeftBtnPanel/Btn_Help',2},{'Btn_Coin','TopView/Btn_Coin',2},{'Btn_Add','TopView/Btn_Coin/Btn_Add',2},{'Img_Zuanshicon','TopView/Btn_Coin/Img_Zuanshicon',2},{'Huobi','TopView/Huobi',2},{'TitlePanel','TitlePanel',2},{'Qieyedian','TitlePanel/Qieyedian',2},{'Tog_ShopHome','TitlePanel/Tog_ShopHome',2},{'Img_Icon','TitlePanel/Tog_ShopHome/Normal/Img_Icon',2},{'Img_Xuanzhongguang','TitlePanel/Tog_ShopHome/Highlight/Img_Xuanzhongguang',2},{'Img_Icon01','TitlePanel/Tog_ShopHome/Highlight/Img_Icon',2},{'Tog_Asset','TitlePanel/Tog_Asset',2},{'Img_Icon02','TitlePanel/Tog_Asset/Normal/Img_Icon',2},{'Img_Xuanzhongguang01','TitlePanel/Tog_Asset/Highlight/Img_Xuanzhongguang',2},{'Img_Icon03','TitlePanel/Tog_Asset/Highlight/Img_Icon',2},{'Tog_Random','TitlePanel/Tog_Random',2},{'Img_Icon04','TitlePanel/Tog_Random/Normal/Img_Icon',2},{'Img_Xuanzhongguang02','TitlePanel/Tog_Random/Highlight/Img_Xuanzhongguang',2},{'Img_Icon05','TitlePanel/Tog_Random/Highlight/Img_Icon',2},{'Tog_Recharge','TitlePanel/Tog_Recharge',2},{'Img_Icon06','TitlePanel/Tog_Recharge/Normal/Img_Icon',2},{'Img_Xuanzhongguang03','TitlePanel/Tog_Recharge/Highlight/Img_Xuanzhongguang',2},{'Img_Icon07','TitlePanel/Tog_Recharge/Highlight/Img_Icon',2},{'Img_Lock','TitlePanel/Tog_Recharge/Img_Lock',2},{'Tog_Exchange','TitlePanel/Tog_Exchange',2},{'Img_Icon08','TitlePanel/Tog_Exchange/Normal/Img_Icon',2},{'Img_Xuanzhongguang04','TitlePanel/Tog_Exchange/Highlight/Img_Xuanzhongguang',2},{'Img_Icon09','TitlePanel/Tog_Exchange/Highlight/Img_Icon',2},{'Tog_Crystal','TitlePanel/Tog_Crystal',2},{'Img_Icon10','TitlePanel/Tog_Crystal/Normal/Img_Icon',2},{'Img_Xuanzhongguang05','TitlePanel/Tog_Crystal/Highlight/Img_Xuanzhongguang',2},{'Img_Icon11','TitlePanel/Tog_Crystal/Highlight/Img_Icon',2},{'Btn_Exchange','TitlePanel/Btn_Exchange',2},{'Img_Lock01','TitlePanel/Btn_Exchange/Img_Lock',2},{'ShopPanel','ShopPanel',2},{'ShopLaberItem','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',2},{'ShopGoodsItem','ShopPanel/ShopFrame/ShopItemScroll/ShopGoodsItem',2},{'Img_Fenggexian2','ShopPanel/ShopFrame/Img_Fenggexian2',2},{'ShopRechargePanel','ShopRechargePanel',2},{'Btn_Laws1','ShopRechargePanel/Btn_Laws1',2},{'Btn_Laws2','ShopRechargePanel/Btn_Laws2',2},{'ShopChargeItem','ShopRechargePanel/RechargeItemScroll/ShopChargeItem',2},
        -- UITemplate 列表
        {'ShopLaberItem01','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',10},{'ShopGoodsItem01','ShopPanel/ShopFrame/ShopItemScroll/ShopGoodsItem',10},{'ShopChargeItem01','ShopRechargePanel/RechargeItemScroll/ShopChargeItem',10},
        -- Toggle 列表
        {'Tog_ShopHome01','TitlePanel/Tog_ShopHome',13},{'Tog_Asset01','TitlePanel/Tog_Asset',13},{'Tog_Random01','TitlePanel/Tog_Random',13},{'Tog_Recharge01','TitlePanel/Tog_Recharge',13},{'Tog_Exchange01','TitlePanel/Tog_Exchange',13},{'Tog_Crystal01','TitlePanel/Tog_Crystal',13},{'ShopLaberItem02','ShopPanel/ShopLabel/ChildLoopScroll/ShopLaberItem',13},
        -- RawImage 列表
        {'ChildLoopScroll','ShopPanel/ShopLabel/ChildLoopScroll',15},{'ShopItemScroll','ShopPanel/ShopFrame/ShopItemScroll',15},{'Content','ShopPanel/ShopFrame/ShopItemScroll/Content',15},{'RechargeItemScroll','ShopRechargePanel/RechargeItemScroll',15},{'RechargeContent','ShopRechargePanel/RechargeItemScroll/RechargeContent',15},
        -- LoopScrollRect 列表
        {'ChildLoopScroll01','ShopPanel/ShopLabel/ChildLoopScroll',18},{'ShopItemScroll01','ShopPanel/ShopFrame/ShopItemScroll',18},{'RechargeItemScroll01','ShopRechargePanel/RechargeItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','TopView/UpperLeftBtnPanel/Text_Title/Text_Title_EN',20},{'Text_ZSCount','TopView/Btn_Coin/Text_ZSCount',20},{'Text_En','TitlePanel/Tog_ShopHome/Normal/Text_En',20},{'Text_Cn','TitlePanel/Tog_ShopHome/Normal/Text_Cn',20},{'Text_En01','TitlePanel/Tog_ShopHome/Highlight/Text_En',20},{'Text_Cn01','TitlePanel/Tog_ShopHome/Highlight/Text_Cn',20},{'Text_En02','TitlePanel/Tog_Asset/Normal/Text_En',20},{'Text_Cn02','TitlePanel/Tog_Asset/Normal/Text_Cn',20},{'Text_En03','TitlePanel/Tog_Asset/Highlight/Text_En',20},{'Text_Cn03','TitlePanel/Tog_Asset/Highlight/Text_Cn',20},{'Text_En04','TitlePanel/Tog_Random/Normal/Text_En',20},{'Text_Cn04','TitlePanel/Tog_Random/Normal/Text_Cn',20},{'Text_En05','TitlePanel/Tog_Random/Highlight/Text_En',20},{'Text_Cn05','TitlePanel/Tog_Random/Highlight/Text_Cn',20},{'Text_En06','TitlePanel/Tog_Recharge/Normal/Text_En',20},{'Text_Cn06','TitlePanel/Tog_Recharge/Normal/Text_Cn',20},{'Text_En07','TitlePanel/Tog_Recharge/Highlight/Text_En',20},{'Text_Cn07','TitlePanel/Tog_Recharge/Highlight/Text_Cn',20},{'Text_En08','TitlePanel/Tog_Exchange/Normal/Text_En',20},{'Text_Cn08','TitlePanel/Tog_Exchange/Normal/Text_Cn',20},{'Text_En09','TitlePanel/Tog_Exchange/Highlight/Text_En',20},{'Text_Cn09','TitlePanel/Tog_Exchange/Highlight/Text_Cn',20},{'Text_En10','TitlePanel/Tog_Crystal/Normal/Text_En',20},{'Text_Cn10','TitlePanel/Tog_Crystal/Normal/Text_Cn',20},{'Text_En11','TitlePanel/Tog_Crystal/Highlight/Text_En',20},{'Text_Cn11','TitlePanel/Tog_Crystal/Highlight/Text_Cn',20},{'Text_Laws1','ShopRechargePanel/Btn_Laws1/Text_Laws1',20},{'Text_Laws2','ShopRechargePanel/Btn_Laws2/Text_Laws2',20},
    }
end
-- Code Auto Create End
--------------初始化---------------
function M:OnInit()
    ---刷新进入商店的时间
    ShopViewModel.EnterShopTime = Global.GetCurTime()
    ---初始化按钮
    self:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---注册返回按钮
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))

        Event.Go("NoviceSkillShowSelf")
        MgrUI.GoBack(function() Event.Go("ShowNewRoleFormationSelf") end)
    end))
    Event.Add("JumpShopWuZi",function (id)
        self.BtnList[id].transform:GetComponent("Toggle").isOn = true
        self.BtnList[id].transform:GetComponent("Toggle").isOn = true
    end)
    ---注册帮助按钮
    UIEvent.LuaClick(self.Btn_Help().gameObject,Handle(self,function()
        HelpViewModel.Go(84)
    end))
    ---当前选择的子商店
    self.CurChildShop = 1
    ---上一次的子商店
    self.LastChildShop = 0
    ---当前商店ID
    self.CurChildShopListId = 114002
    ---@type ShopChildData[] 当前选择的子商店数据
    self.ChildShopList = {}
    ---@type ShopItemData[] 当前商品数据
    self.ShopItemList = {}
    self.mCurCoin = 0
    self.CoinList = {}
    self.CoinObjList = {}
    
    self.ShopRechargePanel().gameObject:SetActive(false)
    self.Btn_Coin().gameObject:SetActive(false)
    ---下标根据商城表来
    self.BtnList = {
        [114000] = self.Tog_Recharge(),
        [114004] = self.Tog_Crystal(),
        [114001] = self.Tog_ShopHome(),
        [114002] = self.Tog_Asset(),
        [114003] = self.Tog_Exchange(),
        [400000] = self.Tog_Random(),
    }
    ---子页签id和按钮
    self.ChildBtnList = {}
    self.CurSelBtn = self.Tog_ShopHome01()
    ---首页推荐商店
    self.HomeNH = {
        self.Tog_ShopHome01().transform:Find("Normal").gameObject,
        self.Tog_ShopHome01().transform:Find("Highlight").gameObject,
    }
    self.HomeNH[1]:SetActive(false)
    self.CurSelBtn.isOn = true
    Tools.ToggleValueChange(self.Tog_ShopHome01(),function(isOn)
        self:OpenShopHome(isOn)
    end,nil)

    ---资源补充商店
    self.AssetNH = {
        self.Tog_Asset01().transform:Find("Normal").gameObject,
        self.Tog_Asset01().transform:Find("Highlight").gameObject,
    }
    self.AssetNH[2]:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Asset01(),function(isOn)
        self.AssetNH[1]:SetActive(not isOn)
        self.AssetNH[2]:SetActive(isOn)
       
        if isOn then
            if self.CurSelBtn == self.Tog_Asset01() then
                return
            end
            self.isFirstCharge = true
            --self.CurChildShop = 1
            self.LastChildShop = 0
            self.CurChildShopListId = 114002
            self.ChildShopList = ShopViewModel.SortChildData(114002)
            self.ChildLoopScroll01().totalCount = #self.ChildShopList
            self.ChildLoopScroll01():RefillCells()

            self:UpdateCoin(self.ChildShopList[1].id)
            
            self.CurSelBtn = self.Tog_Asset01()
            
            print("当前服务器时间："..Global.GetDate())
        end
    end,nil)

    ---兑换商店
    self.ExchangeNH = {
        self.Tog_Exchange01().transform:Find("Normal").gameObject,
        self.Tog_Exchange01().transform:Find("Highlight").gameObject,
    }
    self.ExchangeNH[2]:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Exchange01(),function(isOn)
        self.ExchangeNH[1]:SetActive(not isOn)
        self.ExchangeNH[2]:SetActive(isOn)
        
        if isOn then
            if self.CurSelBtn == self.Tog_Exchange01() then
                return
            end
            self.isFirstCharge = true
            --self.CurChildShop = 0
            self.LastChildShop = 0
            self.CurChildShopListId = 114003
            self.ChildShopList = ShopViewModel.SortChildData(114003)
            self.ChildLoopScroll01().totalCount = #self.ChildShopList
            self.ChildLoopScroll01():RefillCells()
            self.CurSelBtn = self.Tog_Exchange01()

            print("当前服务器时间："..Global.GetDate())
        else
            
        end
    end,nil)
    
    ---随机商店
    self.RandomNH = {
        self.Tog_Random01().transform:Find("Normal").gameObject,
        self.Tog_Random01().transform:Find("Highlight").gameObject,
    }
    self.RandomNH[2]:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Random01(),function(isOn)
        self.RandomNH[1]:SetActive(not isOn)
        self.RandomNH[2]:SetActive(isOn)
        
        if isOn then
            if self.CurSelBtn == self.Tog_Random01() then
                return
            end
            self.isFirstCharge = true
            --self.CurChildShop = 1
            self.LastChildShop = 0
            self.CurChildShopListId = 400000
            self.ChildShopList = ShopViewModel.SortChildData(400000)
            self.ChildLoopScroll01().totalCount = #self.ChildShopList
            self.ChildLoopScroll01():RefillCells()

            self.CurSelBtn = self.Tog_Random01()

            print("当前服务器时间："..Global.GetDate())
        end
    end,nil)

        ---结晶商店
        self.CrystalNH = {
            self.Tog_Crystal01().transform:Find("Normal").gameObject,
            self.Tog_Crystal01().transform:Find("Highlight").gameObject,
        }
        self.CrystalNH[2]:SetActive(false)
        Tools.ToggleValueChange(self.Tog_Crystal01(),function(isOn)
            self.CrystalNH[1]:SetActive(not isOn)
            self.CrystalNH[2]:SetActive(isOn)
            
            if isOn then
                if self.CurSelBtn == self.Tog_Crystal01() then
                    return
                end
                self.isFirstCharge = true
                --self.CurChildShop = 1
                self.LastChildShop = 0
                self.CurChildShopListId = 114004
                self.ChildShopList = ShopViewModel.SortChildData(114004)
                self.ChildLoopScroll01().totalCount = #self.ChildShopList
                self.ChildLoopScroll01():RefillCells()
    
                self.CurSelBtn = self.Tog_Crystal01()
    
                print("当前服务器时间："..Global.GetDate())
            end
        end,nil)
    ---充值
    self.RechargeNH = {
        self.Tog_Recharge01().transform:Find("Normal").gameObject,
        self.Tog_Recharge01().transform:Find("Highlight").gameObject,
    }
    self.RechargeNH[2]:SetActive(false)
    Tools.ToggleValueChange(self.Tog_Recharge01(),function(isOn)
        self:OpenCharge(isOn)
    end,nil)
    
    ---注册左侧子页签滑块
    self.ChildLoopScroll01():SetLuaCellEvent(function(trans, idx)
        ---传入数据
        trans:GetComponent("UITemplate"):SetData({self.ChildShopList[idx],idx, self})
    end)

    ---注册右侧商品列表
    self.ShopItemScroll01():SetLuaCellEvent(function(trans, idx)
        ---传入数据
        trans:GetComponent("UITemplate"):SetData({self.ShopItemList[idx],idx, self,function ()
            self.Tog_Recharge01().isOn = false
            self.Tog_Recharge01().isOn = true
        end})
    end)
    
    ---注册充值列表
    self.RechargeItemScroll01():SetLuaCellEvent(function(trans, idx)
        ---传入数据
        trans:GetComponent("UITemplate"):SetData({self.ShopItemList[idx],idx, self})
    end)

    ---开启检测
    MgrTimer.AddRepeat("ShopClick",0,function()
        ---检查子商店是否改变
        if self.LastChildShop ~= self.CurChildShop then
            self.LastChildShop = self.CurChildShop
            ---刷新商品
            self.ShopItemList = ShopViewModel.SortItemData(self.ChildShopList[self.LastChildShop])
            self.ShopItemScroll01().totalCount = #self.ShopItemList
            self.ShopItemScroll01():RefillCells()
            self:ChangeWallet()
        end
    end,-1,nil)

    ---刷新货币事件
    Event.Add("Shop_UI_ChangeWallet",Handle(self,self.ChangeWallet))

    MgrTimer.AddRepeat("ShopFresh",1,function()
        ---周一早上5点刷新
        local weekday = tonumber(os.date("%w",Global.GetCurTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)) --- 0-6 周日-周六
        local hour = tonumber(os.date("%H",Global.GetCurTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
        local min = tonumber(os.date("%M",Global.GetCurTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
        local sec = tonumber(os.date("%S",Global.GetCurTime() + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600))
        if weekday == 1 and hour == 5 and min == 0 and sec == 0 then
            ShopViewModel.RequestRandomData(function()
                ShopViewModel.GetBuyNumber(1,Handle(self,function()
                    self.ChildShopList = ShopViewModel.SortChildData(self.CurChildShopListId)
                    self:RefreshCurShop()
                end))
            end)
        end
    end,-1,nil)

    ---打开充值界面
    Event.Add("OpenChargeUI",Handle(self,self.OpenCharge))
    Event.Add("FreshChargeUI",Handle(self,self.FreshCharge))
    Event.Add("OpenShopHome",Handle(self,self.OpenShopHome))
    Event.Add("FreshShopHome",Handle(self,self.FreshShopHome))
    Event.Add("TogOn",Handle(self,self.TogOn))
end
---刷新当前商店信息
function M:RefreshCurShop()
    self.ShopItemList = ShopViewModel.SortItemData(self.ChildShopList[self.LastChildShop])
    self.ShopItemScroll01().totalCount = #self.ShopItemList
    self.ShopItemScroll01():RefillCells()
    self:ChangeWallet()
end

function M:OnUpdateUI()
    ---临时需要优化
    local tAllShopData = ShopControl.GetAllShopData()
    for i, v in pairs(tAllShopData) do
        if self.BtnList[i] then
            ---商店名称
            self.BtnList[i].transform:Find("Normal").transform:Find("Text_Cn").transform:GetComponent("TextMeshProUGUI").text = SteamLocalData.tab[i][2]
            self.BtnList[i].transform:Find("Highlight").transform:Find("Text_Cn").transform:GetComponent("TextMeshProUGUI").text = SteamLocalData.tab[i][2]
            ---检查商店是否开启
            local tChildShopList = ShopViewModel.SortChildData(i)
            local tChildLockList = {}
            local tIsOpen = false
            for n = 1, #tChildShopList do
                if tChildShopList[n].ChildSystemOpen ~= 0 and not SysLockControl.CheckSysLock(tChildShopList[n].ChildSystemOpen) and not tIsOpen then
                    tChildLockList[#tChildLockList+1] = tChildShopList[n].ChildSystemOpen
                else
                    tIsOpen = true
                end
            end
            if self.BtnList[i].transform:Find("Btn_Exchange(Clone)") == nil and not tIsOpen then
                self.BtnList[i].transform:Find("Normal").transform:Find("Img_Icon").gameObject:SetActive(false)
                local tLockBtn = GameObject.Instantiate(self.Btn_Exchange().gameObject, self.BtnList[i].transform, false)
                UIEvent.LuaClick(tLockBtn.gameObject,function()
                    local tStr = SysLockControl.GetSystemLockTips(tChildLockList[1])
                    MgrUI.Pop(UID.PopTip_UI,{tStr,1},true)
                end)
            end
        end
    end
    self.Btn_Exchange().gameObject:SetActive(false)
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113021][2],0.2)
    self:ChangeWallet()
    ---根据进入页面的状态判断
    if ShopViewModel.WhetherJumpIn == false then
        ---开启首页推荐
        self:OpenRecommend()
        NoviceViewModel.CheckFirstGuide(43)
    else
        ShopViewModel.WhetherJumpIn = false
        --self.isFirstCharge = true
        self.Tog_ShopHome01().isOn=true
        self.BtnList[ShopViewModel.Page.shopID].transform:GetComponent("Toggle").isOn = true
        self.BtnList[ShopViewModel.Page.shopID].transform:GetComponent("Toggle").isOn = true
        if ShopViewModel.Page.shopID == 114003 then
            ---子页签跳转
            --local tChildData = self.ChildLoopScroll01().transform:Find("Content").transform
            --[[            for i = 0, #self.ChildBtnList do
                            --local tChildName = tChildData:GetChild(i).transform:Find("Content").transform:Find("Text_Name").gameObject:GetComponent("TextMeshProUGUI").text
                            if tChildName == ShopViewModel.Page.ChildShopID then
                                tChildData:GetChild(i).transform:GetComponent("Toggle").isOn = true
                                break
                            end
                        end]]
            if self.ChildBtnList[ShopViewModel.Page.ChildShopID] ~= nil then
                self.ChildBtnList[ShopViewModel.Page.ChildShopID].isOn = true
            end
        elseif ShopViewModel.Page.shopID == ShopViewModel.ShopType.RECOMMEND then
            self:OpenRecommend()
        end
    end
--[[    ---年龄弹窗
    local age = UnityEngine.PlayerPrefs.GetInt(PlayerControl.GetPlayerData().UID .. "Age")
    if age == 0 or age == nil then
        MgrUI.Pop(UID.AgePop_UI)
    end]]
end
---更新货币
function M:UpdateCoin(_shopType)
    local tCfg = ShoptypeLocalData.tab[_shopType]
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

---刷新货币
function M:ChangeWallet()
    local bag = ItemControl.GetAllItems()
    for i, v in ipairs(self.CoinList) do
        --v.CoinText.text = self:CoinCount(v.CoinID, bag)
        --新修改获取货币数量
        local _item = ItemControl.GetItemByIdAndType(v.CoinID, v.CoinType)
        if _item then
            v.CoinText.text = JNStrTool.numberAbbr(_item.count)
        else
            v.CoinText.text = "0"
        end
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"ShopHome_UI"}) and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("ShowNewRoleFormationSelf")
        Event.Go("NoviceSkillHideSelf")
        MgrUI.GoBack()
    end
end

function M:CoinCount(Id,bag)
    local count = 0
    --count = JNStrTool.numberAbbr(bag[Id].count)
    -- if bag[Id] and bag[Id].count > 1000000 then
    --     count = JNStrTool.numberAbbr(bag[Id].count) --tostring(math.floor(bag[Id] and bag[Id].count/1000)).."K"
    -- elseif bag[Id] and bag[Id].count > 1000000000 then
    --     count = JNStrTool.numberAbbr(bag[Id].count) --tostring(math.floor(bag[Id] and bag[Id].count/1000000)).."M"
    -- else
    --     count = bag[Id] and bag[Id].count or 0
    -- end
    if bag[Id] and bag[Id].count then
        count = JNStrTool.numberAbbr(bag[Id].count)
    end
    return count
end

function M:InitBtn()
    ---点击钻石
    --UIEvent.LuaClick(self.Btn_ZuanShi().gameObject,function()
    --    self.Tog_Recharge01().isOn = false
    --    self.Tog_Recharge01().isOn = true
    --end)
    -----点击钻石
    --UIEvent.LuaClick(self.Btn_FreeDia().gameObject,function()
    --    
    --end)
    -- UIEvent.LuaClick(self.Btn_DunBi().gameObject,function()
    --     self.Tog_Asset01().isOn = false
    --     self.Tog_Asset01().isOn = true
    -- end)
    -- ---点击精英纪念币
    -- UIEvent.LuaClick(self.Btn_JYJuan().gameObject,function()
    --     local a = {"tz","yx","jyyx","01"}
    --     MgrLink.LinkStart(a)
    -- end)
    -- ---点击联讨币
    -- UIEvent.LuaClick(self.Btn_TaoFaBi().gameObject,function()
    --     local a = {"tz","zz","lhtf","01"}
    --     MgrLink.LinkStart(a)
    -- end)
    -- ---点击家园币
    -- UIEvent.LuaClick(self.Btn_ArkCoin().gameObject,function()
    --     local a = {"tz","jy","0","01"}
    --     MgrLink.LinkStart(a)
    -- end)
    -- ---点击友情币
    -- UIEvent.LuaClick(self.Btn_FriendshipCoin().gameObject,function()
    --     local a = {"tz","hy","0","01"}
    --     MgrLink.LinkStart(a)
    -- end)
    UIEvent.LuaClick(self.Btn_Laws1().gameObject,function()
        self:OpenLawsPop(3)
    end)
    UIEvent.LuaClick(self.Btn_Laws2().gameObject,function()
        self:OpenLawsPop(4)
    end)
end

function M:OpenCharge(isOn)
    self.RechargeNH[1]:SetActive(not isOn)
    self.RechargeNH[2]:SetActive(isOn)
    self.ShopRechargePanel().gameObject:SetActive(isOn)
    self.ShopPanel().gameObject:SetActive(not isOn)
    if isOn then
        if self.CurSelBtn == self.Tog_Recharge01() then
            return
        end
        self.CurChildShopListId = 114000
        self.ChildShopList = ShopViewModel.SortChildData(114000)
        self.ShopItemList = ShopViewModel.SortItemData(self.ChildShopList[1])
        self.RechargeItemScroll01().totalCount = #self.ShopItemList
        self.RechargeItemScroll01():RefillCells()
        self:UpdateCoin(self.ChildShopList[1].id)
        self.CurSelBtn = self.Tog_Recharge01()
    end
end
function M:FreshCharge()
    if self.CurSelBtn == self.Tog_Recharge01() then
        self.CurChildShopListId = 114000
        self.ChildShopList = ShopViewModel.SortChildData(114000)
        self.ShopItemList = ShopViewModel.SortItemData(self.ChildShopList[1])
        self.RechargeItemScroll01().totalCount = #self.ShopItemList
        self.RechargeItemScroll01():RefillCells()
        self:UpdateCoin(self.ChildShopList[1].id)
    end
end

function M:OpenLawsPop(args)
    MgrUI.Pop(UID.LawsPop_UI,{args},true)
end

function M:OpenShopHome(isOn)
    self.HomeNH[1]:SetActive(not isOn)
    self.HomeNH[2]:SetActive(isOn)
    if isOn then
        if self.CurSelBtn == self.Tog_ShopHome01() then
            return
        end
        self:OpenRecommend()
        NoviceViewModel.CheckFirstGuide(43)
        self.ChildLoopScroll01().totalCount = 0
        self.ChildLoopScroll01():RefillCells()
        self.ShopItemScroll01().totalCount = 0
        self.ShopItemScroll01():RefillCells()
        self.CurSelBtn = self.Tog_ShopHome01()
    else
        MgrUI.ClosePop(UID.ShopHome_UI)
    end
end
function M:FreshShopHome()
    if self.CurSelBtn == self.Tog_ShopHome01() then
        MgrUI.ClosePop(UID.ShopHome_UI)
        self:OpenRecommend()
        NoviceViewModel.CheckFirstGuide(43)
        self.ChildLoopScroll01().totalCount = 0
        self.ChildLoopScroll01():RefillCells()
        self.ShopItemScroll01().totalCount = 0
        self.ShopItemScroll01():RefillCells()
    end
end

function M:TogOn(name,on)
    if name == "Tog_ShopHome" then
        self.Tog_ShopHome01().isOn = on
    elseif name == "Tog_Recharge" then
        self.Tog_Recharge01().isOn = on
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.Remove("Shop_UI_ChangeWallet",Handle(self,self.ChangeWallet))
    ---关闭检测
    MgrTimer.Cancel("ShopClick")
    MgrTimer.Cancel("ShopFresh")
    local PopUI,_ =  MgrUI.GetPopUI(UID.ShopHome_UI)
    if PopUI ~= nil then
        MgrUI.ClosePop(UID.ShopHome_UI)
    end
end

--region 界面操作

--- 打开首页推荐
function M:OpenRecommend()
    MgrUI.Pop(UID.ShopHome_UI,{ function(_type)
        self:UpdateCoin(_type)
    end },true)
end

--endregion 界面操作

return M