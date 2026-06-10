-- Code Auto Create Begin
local M = Class('Event4Shop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event4Shop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event4Shop_UI].prefab'
    self.Name = 'Form[Event4Shop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Role','Role',2},{'SpineRole','Role/SpineRole',2},{'RoleClickArea','Role/SpineRole/RoleClickArea',2},{'UI_Canvas','UI_Canvas',2},{'GashaponPanel','UI_Canvas/RightPanel/GashaponPanel',2},{'UpperRightPanel','UI_Canvas/RightPanel/GashaponPanel/UpperRightPanel',2},{'Huobi','UI_Canvas/RightPanel/GashaponPanel/UpperRightPanel/Huobi',2},{'Img_BG','UI_Canvas/RightPanel/GashaponPanel/UpperRightPanel/Huobi/Img_BG',2},{'CurrencyIcon','UI_Canvas/RightPanel/GashaponPanel/UpperRightPanel/Huobi/CurrencyIcon',2},{'Niudanji','UI_Canvas/RightPanel/GashaponPanel/Niudanji',2},{'Img_Niudanji','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Img_Niudanji',2},{'NiudanjiBianhao','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Img_Niudanji/NiudanjiBianhao',2},{'Btn_Chou1ci','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou1ci',2},{'Btn_Chou10ci','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou10ci',2},{'Btn_Xiayige','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Xiayige',2},{'Btn_GashaponDetails','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_GashaponDetails',2},{'Btn_SellOut','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_SellOut',2},{'NiudanjiXiangqing','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing',2},{'Img_Niudanji_hei','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/Img_Niudanji_hei',2},{'NiudanjiTab','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/Img_Niudanji_hei/NiudanjiTab',2},{'NiudanReward','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/ShopItemScroll/NiudanReward',2},{'Btn_Close','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/Btn_Close',2},{'Img_Close','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/Btn_Close/Img_Close',2},{'CollectionPanel','UI_Canvas/RightPanel/CollectionPanel',2},{'CaiDan_All','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All',2},{'CaiDan','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/CaiDan',2},{'Food','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food',2},{'food7','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food7',2},{'food5','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food5',2},{'food4','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food4',2},{'food6','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food6',2},{'food1','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food1',2},{'food2','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food2',2},{'food3','UI_Canvas/RightPanel/CollectionPanel/CaiDan_All/Food/food3',2},{'Jindu','UI_Canvas/RightPanel/CollectionPanel/Jindu',2},{'Img_JindutiaoBarBg','UI_Canvas/RightPanel/CollectionPanel/Jindu/Img_JindutiaoBarBg',2},{'Img_JindutiaoProgressBar','UI_Canvas/RightPanel/CollectionPanel/Jindu/Img_JindutiaoBarBg/Img_JindutiaoProgressBar',2},{'JiangliPrefab1','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab1',2},{'Icon','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab1/Icon',2},{'Yilingqu','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab1/Yilingqu',2},{'Gou','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab1/Yilingqu/Gou',2},{'JiangliPrefab2','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab2',2},{'Icon01','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab2/Icon',2},{'Yilingqu01','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab2/Yilingqu',2},{'Gou01','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab2/Yilingqu/Gou',2},{'JiangliPrefab3','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab3',2},{'Icon02','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab3/Icon',2},{'Yilingqu02','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab3/Yilingqu',2},{'Gou02','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab3/Yilingqu/Gou',2},{'JiangliPrefab4','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab4',2},{'Icon03','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab4/Icon',2},{'Yilingqu03','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab4/Yilingqu',2},{'Gou03','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab4/Yilingqu/Gou',2},{'JiangliPrefab5','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab5',2},{'Icon04','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab5/Icon',2},{'Yilingqu04','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab5/Yilingqu',2},{'Gou04','UI_Canvas/RightPanel/CollectionPanel/Jindu/JiangliContent/JiangliPrefab5/Yilingqu/Gou',2},{'Collection','UI_Canvas/SwitchPanel/Collection',2},{'Collection_Normal','UI_Canvas/SwitchPanel/Collection/Collection_Normal',2},{'Collection_Hlight','UI_Canvas/SwitchPanel/Collection/Collection_Hlight',2},{'CollectionRedPoint','UI_Canvas/SwitchPanel/Collection/CollectionRedPoint',2},{'Gashapon','UI_Canvas/SwitchPanel/Gashapon',2},{'Gashapon_Normal','UI_Canvas/SwitchPanel/Gashapon/Gashapon_Normal',2},{'Gashapon_Hlight','UI_Canvas/SwitchPanel/Gashapon/Gashapon_Hlight',2},{'ReturnBg','UI_Canvas/ReturnBg',2},{'Btn_GoMenu','UI_Canvas/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UI_Canvas/ReturnBg/Btn_Back',2},{'Btn_Help','UI_Canvas/ReturnBg/Btn_Help',2},{'Img_Fenggexian','UI_Canvas/ReturnBg/Img_Fenggexian',2},{'Ball','UI_Canvas/Ball',2},{'UnClickBg','UI_Canvas/UnClickBg',2},{'neon','UI_Canvas/neon',2},{'white','UI_Canvas/white',2},{'Img_SoundTextBG','UI_Canvas/Img_SoundTextBG',2},
        -- Text 列表
        {'Text_CurrencyCount','UI_Canvas/RightPanel/GashaponPanel/UpperRightPanel/Huobi/Text_CurrencyCount',3},
        -- UITemplate 列表
        {'NiudanReward01','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/ShopItemScroll/NiudanReward',10},
        -- RawImage 列表
        {'ShopItemScroll','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/ShopItemScroll',15},{'Content','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/ShopItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'ShopItemScroll01','UI_Canvas/RightPanel/GashaponPanel/NiudanjiXiangqing/ShopItemScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_shuliang','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou1ci/Text_shuliang',20},{'Text_xiaohao','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou1ci/Text_xiaohao',20},{'Text_TenDraw','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou10ci/Text_TenDraw',20},{'Text_TebDrawPrice','UI_Canvas/RightPanel/GashaponPanel/Niudanji/Btn_Chou10ci/Text_TebDrawPrice',20},{'Text_Jindu','UI_Canvas/RightPanel/CollectionPanel/Jindu/Text_Jindu',20},{'Text_Jindushu','UI_Canvas/RightPanel/CollectionPanel/Jindu/Text_Jindushu',20},{'Text_Title_CN','UI_Canvas/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UI_Canvas/ReturnBg/Text_Title/Text_Title_EN',20},{'RoleVoiceWordText','UI_Canvas/Img_SoundTextBG/RoleVoiceWordText',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    --UI
    self.Collection_Normal().gameObject:SetActive(true)
    self.Collection_Hlight().gameObject:SetActive(false)
    self.Gashapon_Normal().gameObject:SetActive(false)
    self.Gashapon_Hlight().gameObject:SetActive(true)
    self.GashaponPanel().gameObject:SetActive(true)
    self.CollectionPanel().gameObject:SetActive(false)
    self.NiudanjiXiangqing().gameObject:SetActive(false)
    self.NiudanReward().gameObject:SetActive(false)
    self.Btn_Help().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.neon().gameObject:SetActive(false)
    self.white().gameObject:SetActive(false)
    self.CaiDan_All().gameObject:SetActive(false)
    self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt3")
    self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt16")
    --菜谱
    self.food = {
        [60002001] = self.food1().gameObject,
        [60002002] = self.food2().gameObject,
        [60002003] = self.food3().gameObject,
        [60002004] = self.food4().gameObject,
        [60002005] = self.food5().gameObject,
        [60002006] = self.food6().gameObject,
        [60002007] = self.food7().gameObject,
    }
    --奖励
    self.awardObj = {
        self.JiangliPrefab1().gameObject,
        self.JiangliPrefab2().gameObject,
        self.JiangliPrefab3().gameObject,
        self.JiangliPrefab4().gameObject,
        self.JiangliPrefab5().gameObject,
        --self.JiangliPrefab6().gameObject,
        --self.JiangliPrefab7().gameObject,
    }
    ---当前章节ID
    self.CurActID = Event4Control.GetCurActID()
    --活动数据
    self.Event4Data = Event4Control.GetEvent4Data()[self.CurActID]
    --成就任务
    self.task = Event4Control.GetCollectionList(self.CurActID)
    --注册滑动
    self.ShopItemScroll01():SetLuaCellEvent(Handle(self, self.ItemCell))
    --红点
    self:CheckRedPoint()
    --初始化按钮
    self:InitBtn()  
    --默认显示商店
    self:RefreshShop()
end

---注册按钮事件
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --点击返回上一级
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    --点击返回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
        --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey(""),2},true)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.Event4Data.group)
    end)
    --扭蛋机
    UIEvent.LuaClick(self.Gashapon().gameObject,function()
        if self.GashaponPanel().gameObject.activeSelf then
            return
        end
        self:CreatSpine(self.SpineRole(),EventRaidControl.NpcType.EggToys)
        self.Collection_Normal().gameObject:SetActive(true)
        self.Collection_Hlight().gameObject:SetActive(false)
        self.Gashapon_Normal().gameObject:SetActive(false)
        self.Gashapon_Hlight().gameObject:SetActive(true)
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt3")
        self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt16")
        self:RefreshShop()
    end)
    --收藏品
    UIEvent.LuaClick(self.Collection().gameObject,function()
        if self.CollectionPanel().gameObject.activeSelf then
            return
        end
        self:CreatSpine(self.SpineRole(),EventRaidControl.NpcType.Collect)
        self.Collection_Normal().gameObject:SetActive(false)
        self.Collection_Hlight().gameObject:SetActive(true)
        self.Gashapon_Normal().gameObject:SetActive(true)
        self.Gashapon_Hlight().gameObject:SetActive(false)
        self.Text_Title_CN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt11")
        self.Text_Title_EN().text = MgrLanguageData.GetLanguageByKey("ui_externalevent_txt12")
        self.CaiDan_All().gameObject:SetActive(true)
        --self:PageTurn(function()
        --
        --end)
        self:RefreshCollection()
    end)
    --点击详情
    UIEvent.LuaClick(self.Btn_GashaponDetails().gameObject,function()
        self.Niudanji().gameObject:SetActive(false)
        self.NiudanjiXiangqing().gameObject:SetActive(true)
        self:ReloadDetail(0)
    end)
    --关闭详情
    UIEvent.LuaClick(self.Btn_Close().gameObject,function()
        self.Niudanji().gameObject:SetActive(true)
        self.NiudanjiXiangqing().gameObject:SetActive(false)
    end)
    --单抽一次
    UIEvent.LuaClick(self.Btn_Chou1ci().gameObject,function()
        local curPool = Event4Control.GetCurShop()
        local money = curPool:GetCurrencyData()
        local price = tonumber(string.split(curPool.price,"_")[3])
        if money.count >= price then  --如果货币足够
            Event4Control.Lottery(curPool.actId,curPool.id,1,function()
                self:ShowEffect()
                self:RefreshShop()
                self:GetCurWords(98)
                self:CheckRedPoint()
            end)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
        end
    end)
    --抽多次
    UIEvent.LuaClick(self.Btn_Chou10ci().gameObject,function()
        local curPool = Event4Control.GetCurShop()
        local money = curPool:GetCurrencyData()
        local price = tonumber(string.split(curPool.price,"_")[3])
        local remainingCount = Event4Control.GetPoolItemsCount()      --卡池剩余物品数量
        local count = curPool.type == 1 and 50 or 100   --类型是1的 抽50次，类型是2的抽100次
        local coin = ItemControl.GetItemByIdAndType(tonumber(string.split(curPool.price,"_")[2]),tonumber(string.split(curPool.price,"_")[1]))    --货币数据
        local canBuyCount = math.floor(coin.count / price)   --可购买的数量
        --池子里还有足够的物品
        if remainingCount >= count then
            --如果货币足够
            if money.count >= price * count then
                Event4Control.Lottery(curPool.actId,curPool.id,count,function()
                    self:ShowEffect()
                    self:RefreshShop()
                    self:GetCurWords(98)
                    self:CheckRedPoint()
                end)
            else
                --抽取可抽取的次数
                if canBuyCount < 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                else
                    --抽可抽的次数
                    Event4Control.Lottery(curPool.actId,curPool.id,canBuyCount,function()
                        self:ShowEffect()
                        self:RefreshShop()
                        self:GetCurWords(98)
                        self:CheckRedPoint()
                    end)
                end
            end
        else
            --如果货币足够
            if money.count >= price * remainingCount then
                --抽完卡池剩余物品
                Event4Control.Lottery(curPool.actId,curPool.id,remainingCount,function()
                    self:ShowEffect()
                    self:RefreshShop()
                    self:GetCurWords(98)
                    self:CheckRedPoint()
                end)
            else
                if canBuyCount < 1 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventshopitem_tips2"),1},true)
                else
                    --抽可抽的次数
                    Event4Control.Lottery(curPool.actId,curPool.id,canBuyCount,function()
                        self:ShowEffect()
                        self:RefreshShop()
                        self:GetCurWords(98)
                        self:CheckRedPoint()
                    end)
                end
            end
        end
    end)
    --下一个卡池
    UIEvent.LuaClick(self.Btn_Xiayige().gameObject,function()
        local curPool = Event4Control.GetCurShop()
        if curPool.type == 1 then  --普通池
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_externalevent_txt18"),function()
                --特殊物品是否抽出
                if Event4Control.CheckSpecialItemSellOut() then
                    Event4Control.GameUp(curPool.actId,curPool.nextId,function()
                        self:RefreshShop()
                    end)
                else
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey(""),1},true)
                end
            end,nil,2 },true)
        else
            --特殊池
            if Event4Control.GetPoolItemsCount() > 0 then  --池子还有物品
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey(""),1},true)
                return
            end
            Event4Control.PoolReset(curPool.actId,curPool.id,function()
                self:RefreshShop()
            end)
        end
    end)
    --收藏奖励领取
    UIEvent.LuaClick(self.JiangliPrefab1().gameObject,function()
        self:ReceiveReward(7000300)
    end)
    UIEvent.LuaClick(self.JiangliPrefab2().gameObject,function()
        self:ReceiveReward(7000301)
    end)
    UIEvent.LuaClick(self.JiangliPrefab3().gameObject,function()
        self:ReceiveReward(7000302)
    end)
    UIEvent.LuaClick(self.JiangliPrefab4().gameObject,function()
        self:ReceiveReward(7000303)
    end)
    UIEvent.LuaClick(self.JiangliPrefab5().gameObject,function()
        self:ReceiveReward(7000304)
    end)
    --UIEvent.LuaClick(self.JiangliPrefab6().gameObject,function()
    --    self:ReceiveReward(7000305)
    --end)
    --UIEvent.LuaClick(self.JiangliPrefab7().gameObject,function()
    --    self:ReceiveReward(7000306)
    --end)
    --点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:GetCurWords(97)
    end))
end

---刷新收藏
function M:RefreshCollection()
    self.GashaponPanel().gameObject:SetActive(false)
    self.CollectionPanel().gameObject:SetActive(true)
    --检查物品是否拥有
    for k,v in pairs(Event4Control.GetSpecialItemList()) do
        if v.count >= 1  then
            self.food[v.id]:SetActive(true)
        else
            self.food[v.id]:SetActive(false)
        end
    end
    --检查奖励是否可领取
    self.completeCount = 0
    for i = 1,#self.awardObj do
        local complete = CJNUIMgr.GetSunUseName(self.awardObj[i],"Gou")  --已领取图标
        local receiveMask = CJNUIMgr.GetSunUseName(self.awardObj[i],"Yilingqu"):GetComponent("Image")   --不可领取遮罩
        local icon = CJNUIMgr.GetSunUseName(self.awardObj[i],"Icon"):GetComponent("Image")   --图标
        ---@type ItemData
        local award = ItemControl.GetItemByIdAndType(self.task[i].reward[1].goodsID,self.task[i].reward[1].goodsType)   --奖励物品
        MgrRes.LoadSprite(icon,award.icon)
        if self.task[i] then
            local progressStr = JNStrTool.strSplit("_", self.task[i].complete)
            local value = ActivationTaskViewModel.GetStatisticValue(self.task[i].type, tonumber(progressStr[1]))
            if self.task[i].isComplete == 1 then   --已领取
                complete:SetActive(true)
                receiveMask.enabled = false
                self.completeCount = self.completeCount + 1
            else
                if value >= tonumber(progressStr[3]) then  --可领取
                    complete:SetActive(false)
                    receiveMask.enabled = false
                    self.completeCount = self.completeCount + 1
                else
                    --未领取且不可领取
                    receiveMask.enabled = true
                    complete:SetActive(false)
                end
            end
        else
            --未领取且不可领取
            receiveMask.enabled = true
            complete:SetActive(false)
        end
    end
    self.Img_JindutiaoProgressBar().fillAmount = self.completeCount / #self.awardObj
    self.Text_Jindushu().text = Event4Control.GetSpecialItemCount().."/"..self.Food().gameObject.transform.childCount
end

---刷新商店
function M:RefreshShop()
    local curPool = Event4Control.GetCurShop()
    self.GashaponPanel().gameObject:SetActive(true)
    self.CollectionPanel().gameObject:SetActive(false)
    MgrRes.LoadSprite(self.NiudanjiBianhao(),curPool.labelPic)  --蛋机标签图
    local remainingCount = Event4Control.GetPoolItemsCount()      --卡池剩余物品数量
    if remainingCount <= 0 then
        --当前卡池已售罄
        self.Btn_Chou1ci().gameObject:SetActive(false)
        self.Btn_Chou10ci().gameObject:SetActive(false)
        self.Btn_SellOut().gameObject:SetActive(true)
    else
        self.Btn_Chou1ci().gameObject:SetActive(true)
        self.Btn_Chou10ci().gameObject:SetActive(true)
        self.Btn_SellOut().gameObject:SetActive(false)
    end
    --多次抽取根据卡池数量显示文本
    local count = curPool.type == 1 and 50 or 100
    local price = tonumber(string.split(curPool.price,"_")[3])
    local item = ItemControl.GetItemByIdAndType(tonumber(string.split(curPool.price,"_")[2]),tonumber(string.split(curPool.price,"_")[1]))
    --剩余大于数量
    if remainingCount >= count then
        if item.count >= count * price then
            self.Text_TenDraw().text = count
            self.Text_TebDrawPrice().text = price * count
        else
            --显示可购买的数量
            local canBuyCount = math.floor(item.count / price)
            if canBuyCount < 1 then
                self.Text_TenDraw().text = 1
                self.Text_TebDrawPrice().text = 1 * price
            else
                self.Text_TenDraw().text = canBuyCount
                self.Text_TebDrawPrice().text = canBuyCount * price
            end
        end
    else
        --判断货币是否充足
        if item.count >= remainingCount * price then
            self.Text_TenDraw().text = remainingCount
            self.Text_TebDrawPrice().text = remainingCount * price
        else
            --显示可购买的数量
            local canBuyCount = math.floor(item.count / price)
            if canBuyCount < 1 then
                self.Text_TenDraw().text = 1
                self.Text_TebDrawPrice().text = 1 * price
            else
                self.Text_TenDraw().text = canBuyCount
                self.Text_TebDrawPrice().text = canBuyCount * price
            end
        end
    end
    --下一个蛋池按钮出现条件
    if curPool.type == 1 then
        self.Btn_Xiayige().gameObject:SetActive(Event4Control.CheckSpecialItemSellOut())
    else
        self.Btn_Xiayige().gameObject:SetActive(remainingCount <= 0)
    end
    --刷新货币
    self:RefreshCurrency()
end

function M:ItemCell(trans,idx)
    local isSpecial = false
    for k,v in pairs(Event4Control.GetSpecialItemList()) do
        if v.id == self.PoolList[idx].item.id then
            isSpecial = true
            break
        end
    end
    trans:GetComponent("UITemplate"):SetData({self.PoolList[idx], self, isSpecial})
end

---加载商店详情
function M:ReloadDetail(offset)
    self.PoolList = Event4Control.GetClientPoolItems()
    MgrRes.LoadSprite(self.NiudanjiTab(),Event4Control.GetCurShop().tabPic)  --蛋机预览底图
    self.ShopItemScroll01().totalCount = #self.PoolList
    if offset then
        self.ShopItemScroll01():RefillCells(offset)
    else
        self.ShopItemScroll01():RefreshCells()
    end
end

---刷新货币
function M:RefreshCurrency()
    ---@type ItemData
    local data = Event4Control.GetCurShop():GetCurrencyData()
    MgrRes.LoadSprite(self.CurrencyIcon(),data.icon)
    self.Text_CurrencyCount().text = data.count
end

---领奖
function M:ReceiveReward(id)
    for k,v in pairs(self.task) do
        if v.id == id then
            local progressStr = JNStrTool.strSplit("_", v.complete)
            local value = ActivationTaskViewModel.GetStatisticValue(v.type, tonumber(progressStr[1]))
            --可领取
            if v.isComplete ~= 1 and value >= tonumber(progressStr[3]) then
                AchievementViewModel.TaskPerform(0,id,nil,self.task[1].activeId,function()
                    self.task = Event4Control.GetCollectionList(self.CurActID)
                    self:RefreshCollection()
                    self:GetCurWords(98)
                    Event4Control.CheckShopRedPoint()
                    self:CheckRedPoint()
                end)
                return
            else
                return
            end
        end
    end
    --未找到对应id
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_externalevent_txt17"),1},true)
end

---检查红点
function M:CheckRedPoint()
    local AwardState = RedDotControl.GetDotData("Event4Award_"..self.CurActID).State
    self.CollectionRedPoint().gameObject:SetActive(AwardState)
end

---創建spine 类型1扭蛋机类型2收藏品
function M:CreatSpine(_Root,_type)
    --销毁spine
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
    end
    self.groupId = self.Event4Data.npc[_type]
    local _PosInfoTab = CharactercoordinatesLocalData.tab[self.groupId].coordinate10
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    --MgrRes.LoadWatchAuto(_Root, self.groupId,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
    --    self.SpineObj = obj
    --end)
    MgrRes.LoadWatch3DSpineInUI(_Root, self.groupId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        self.SpineObj = obj
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 1,"Default")
        end
    end)
    self:GetCurWords(97)
end

---获取当前台词
function M:GetCurWords(type)
    local _ActorLinesType = self.groupId  --当前台词组别
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
    MgrTimer.AddRepeat("Event4ShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.curRoleId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("Event4ShopRoleVoice")
        end
    end,-1,nil)
end

function M:ShowEffect()
    local ani = self.Ball().gameObject.transform:GetComponent("Animator")
    local count = 0
    self.UnClickBg().gameObject:SetActive(true)
    ani:SetBool("Show",true)
    MgrTimer.AddRepeat("loop",0.1,function()
        count = count + 0.1
        if count >= 0.7 and count < 0.8 then
            if Event4Control.ContainsSpecial then
                self.neon().gameObject:SetActive(true)
            else
                self.white().gameObject:SetActive(true)
            end
        end
        if count >= 0.8 then
            ani:SetBool("Show",false)
            self.neon().gameObject:SetActive(false)
            self.white().gameObject:SetActive(false)
            MgrTimer.AddDelayNoName(0.1,function()
                Event.Go("Event4ShopAwardPop")
            end,self.ObjRoot)
            self.UnClickBg().gameObject:SetActive(false)
            MgrTimer.Cancel("loop")
        end
    end,-1,self.ObjRoot)
end

---翻页特性
function M:PageTurn(callBack)
    if self.CollectionPanel().gameObject.activeSelf then
        return
    end
    self.CollectionPanel().gameObject:SetActive(true)
    self.GashaponPanel().gameObject:SetActive(false)
    Tools.DoGroupFade(self.Food().gameObject.transform:GetComponent("CanvasGroup"),0,0,0,2,false,0,0)
    Tools.DoGroupFade(self.Food().gameObject.transform:GetComponent("CanvasGroup"),1,1,1,2,false,0,0)
    self.Jindu().gameObject:SetActive(false)
    self.CaiDan_All().gameObject:SetActive(true)
    if callBack then
        callBack()
    end
    MgrTimer.AddDelayNoName(1.3,function()
        self.Jindu().gameObject:SetActive(true)
    end,self.ObjRoot)
end

function M:OnUpdateUI()
    --摄像机改为正交
    MgrUI.GetUICamera().orthographic = true
    --设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 2
    --创建spine
    self:CreatSpine(self.SpineRole(),EventRaidControl.NpcType.EggToys)
end

function M:OnHide()
    MgrTimer.Cancel("Event4ShopRoleVoice")
    MgrTimer.Cancel("loop")
    MgrSound.Stop(3, tostring(self.curRoleId), false)
 
    MgrUI.GetUICamera().orthographic = false
end

function M:OnClose()
    MgrTimer.Cancel("Event4ShopRoleVoice")
    MgrTimer.Cancel("loop")
    MgrSound.Stop(3, tostring(self.curRoleId), false)

    MgrUI.GetUICamera().orthographic = false
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M