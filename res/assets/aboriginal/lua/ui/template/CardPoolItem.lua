-- Code Auto Create Begin
local M = Class('CardPoolItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CardPoolItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RolePoolPanel','RolePoolPanel',2},{'BackGroundImg','RolePoolPanel/BackGroundImg',2},{'Btn_Chakan','RolePoolPanel/BackGroundImg/Btn_Chakan',2},{'InfoIcon','RolePoolPanel/BackGroundImg/Btn_Chakan/InfoIcon',2},{'Btn_Info','RolePoolPanel/BackGroundImg/Btn_Info',2},{'InfoIcon01','RolePoolPanel/BackGroundImg/Btn_Info/InfoIcon',2},{'DuihuanPanel','RolePoolPanel/BackGroundImg/DuihuanPanel',2},{'Img_Xiangqingdi','RolePoolPanel/BackGroundImg/DuihuanPanel/Img_Xiangqingdi',2},{'Xiangqingicon','RolePoolPanel/BackGroundImg/DuihuanPanel/Img_Xiangqingdi/Xiangqingicon',2},{'Btn_Duihuan','RolePoolPanel/BackGroundImg/DuihuanPanel/Btn_Duihuan',2},{'CardDrawBtnPanel','RolePoolPanel/CardDrawBtnPanel',2},{'ProRecruitPanel','RolePoolPanel/CardDrawBtnPanel/ProRecruitPanel',2},{'Btn_ProRecruit','RolePoolPanel/CardDrawBtnPanel/ProRecruitPanel/Btn_ProRecruit',2},{'NeedIcon','RolePoolPanel/CardDrawBtnPanel/ProRecruitPanel/NeedIcon',2},{'ProTenRecruitPanel','RolePoolPanel/CardDrawBtnPanel/ProTenRecruitPanel',2},{'Btn_ProTenRecruit','RolePoolPanel/CardDrawBtnPanel/ProTenRecruitPanel/Btn_ProTenRecruit',2},{'NeedIcon01','RolePoolPanel/CardDrawBtnPanel/ProTenRecruitPanel/NeedIcon',2},{'NovicePanel','RolePoolPanel/CardDrawBtnPanel/NovicePanel',2},{'Btn_ProTenRecruit01','RolePoolPanel/CardDrawBtnPanel/NovicePanel/Btn_ProTenRecruit',2},{'NeedIcon02','RolePoolPanel/CardDrawBtnPanel/NovicePanel/NeedIcon',2},{'GearVoidPanel','GearVoidPanel',2},{'Img_VoidBg','GearVoidPanel/Img_VoidBg',2},{'Btn_TenGearVoid','GearVoidPanel/Btn_TenGearVoid',2},{'Img_Bujidi(Gongmingshi)1','GearVoidPanel/Btn_TenGearVoid/Img_Bujidi(Gongmingshi)1',2},{'Gongmingshiicon1','GearVoidPanel/Btn_TenGearVoid/Gongmingshiicon1',2},{'Btn_GearVoid','GearVoidPanel/Btn_GearVoid',2},{'Img_Bujidi(Gongmingshi)2','GearVoidPanel/Btn_GearVoid/Img_Bujidi(Gongmingshi)2',2},{'Gongmingshiicon2','GearVoidPanel/Btn_GearVoid/Gongmingshiicon2',2},{'Btn_TenCoin','GearVoidPanel/Btn_TenCoin',2},{'Img_Bujidi(Dunbi)1','GearVoidPanel/Btn_TenCoin/Img_Bujidi(Dunbi)1',2},{'Dunbiicon1','GearVoidPanel/Btn_TenCoin/Dunbiicon1',2},{'Btn_Coin','GearVoidPanel/Btn_Coin',2},{'Img_Bujidi(Dunbi)2','GearVoidPanel/Btn_Coin/Img_Bujidi(Dunbi)2',2},{'Dunbiicon2','GearVoidPanel/Btn_Coin/Dunbiicon2',2},{'Btn_VoidInfo','GearVoidPanel/Btn_VoidInfo',2},{'InfoIcon02','GearVoidPanel/Btn_VoidInfo/InfoIcon',2},
        -- UITemplate 列表
        {'CardPoolItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Xiangqing','RolePoolPanel/BackGroundImg/Btn_Chakan/Text_Xiangqing',20},{'Text_Xiangqing01','RolePoolPanel/BackGroundImg/Btn_Info/Text_Xiangqing',20},{'Text_Time','RolePoolPanel/BackGroundImg/Text_Time',20},{'Text_Dianshu','RolePoolPanel/BackGroundImg/DuihuanPanel/Text_Dianshu',20},{'Text_Duihuan','RolePoolPanel/BackGroundImg/DuihuanPanel/Btn_Duihuan/Text_Duihuan',20},{'ProRecruitText','RolePoolPanel/CardDrawBtnPanel/ProRecruitPanel/ProRecruitText',20},{'Btn_Text','RolePoolPanel/CardDrawBtnPanel/ProRecruitPanel/Btn_Text',20},{'ProRecruitText01','RolePoolPanel/CardDrawBtnPanel/ProTenRecruitPanel/ProRecruitText',20},{'Btn_Text01','RolePoolPanel/CardDrawBtnPanel/ProTenRecruitPanel/Btn_Text',20},{'ProRecruitText02','RolePoolPanel/CardDrawBtnPanel/NovicePanel/ProRecruitText',20},{'Btn_Text02','RolePoolPanel/CardDrawBtnPanel/NovicePanel/Btn_Text',20},{'Text_Time2','GearVoidPanel/Text_Time2',20},{'Text_Dunbishu2','GearVoidPanel/Btn_TenGearVoid/Text_Dunbishu2',20},{'Text_TenGearVoid','GearVoidPanel/Btn_TenGearVoid/Text_TenGearVoid',20},{'Text_Dunbishu201','GearVoidPanel/Btn_GearVoid/Text_Dunbishu2',20},{'Text_GearVoid','GearVoidPanel/Btn_GearVoid/Text_GearVoid',20},{'Text_Dunbishu202','GearVoidPanel/Btn_TenCoin/Text_Dunbishu2',20},{'Text_TenCoin','GearVoidPanel/Btn_TenCoin/Text_TenCoin',20},{'Text_Dunbishu203','GearVoidPanel/Btn_Coin/Text_Dunbishu2',20},{'Text_Coin','GearVoidPanel/Btn_Coin/Text_Coin',20},{'Text_Xiangqing02','GearVoidPanel/Btn_VoidInfo/Text_Xiangqing',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitButton()
    self.UpRoleId = 0

    Event.Add("CardPoolItemFade",function()
        --切页效果
        if self.PoolData.cardType == 1 then
            self.BackGroundImg().color = Color(1,1,1,0)
            Tools.DoPFade(self.BackGroundImg(),1,0.5,0,1,false,0,0,nil)
        else
            self.Img_VoidBg().color = Color(1,1,1,0)
            Tools.DoPFade(self.Img_VoidBg(),1,0.5,0,1,false,0,0,nil)
        end
    end)
end

function M:OnUpdateUI(pData) --timeType
    self.PoolData = pData[1]
    self.Parent = pData[2]
    self.idx = pData[3]
    ---如果是角色池
    if self.PoolData.cardType == 1 then
        ---@type RoleDrawData
        self.PoolData = pData[1]
        self.RolePoolPanel().gameObject:SetActive(true)
        self.GearVoidPanel().gameObject:SetActive(false)
        self.StoneCost = tonumber(string.split(self.PoolData.singleDrawPrice,"_")[3]) ---石头单抽价格
        self.StoneTenCost = tonumber(string.split(self.PoolData.tenDrawPrice,"_")[3]) ---石头十连抽价格
        ---背景图
        MgrRes.LoadSprite(self.BackGroundImg(),"Poolicon/"..self.PoolData.showRole)
        self.CostItemId = tonumber(string.split(self.PoolData.singleDrawPrice,"_")[2])
        ---单抽文本
        self.ProRecruitPanel().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..self.StoneCost
        ---十连文本
        self.ProTenRecruitPanel().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..self.StoneTenCost
        ---当前卡池id
        self.CurRecruitID = self.PoolData.id
        self.limitCount = self.PoolData.limit
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.singleDrawPrice,"_")[2]),tonumber(string.split(self.PoolData.singleDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.ProRecruitPanel().transform:Find("NeedIcon"):GetComponent("Image"),item.icon)
        MgrRes.LoadSprite(self.ProTenRecruitPanel().transform:Find("NeedIcon"):GetComponent("Image"),item.icon)
        local roleIds = string.split(self.PoolData.roleatlas,",")
        local roleIds2 ={}
        for i = 1, #roleIds do
            table.insert(roleIds2,tonumber(roleIds[i]))
        end
        UIEvent.LuaClick(self.Btn_Chakan().gameObject,function()
            IllustrationViewModel.OpenRoleXiangqing(tonumber(roleIds[1]),roleIds2)
        end)

        ---刷新卡池积分道具数量
        if self.PoolData.item ~= "0" then
            local ExchangeProp = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.item,"_")[2]),tonumber(string.split(self.PoolData.item,"_")[1]))
            self.Text_Dianshu().text = ExchangeProp.count
            self.DuihuanPanel().gameObject:SetActive(true)
        else
            self.DuihuanPanel().gameObject:SetActive(false)
        end
        local openTime = string.split(self.PoolData.timeOpen,'-')
        local endTime =  string.split(self.PoolData.timeEnd,'-')
        self.Text_Time().gameObject:SetActive(self.PoolData.timeType == 1)  --是否是限时开放
        self.Text_Time2().gameObject:SetActive(false)  --隐藏装备卡池的时间文本
        self.Text_Time().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]
    else ---如果是装备池
        ---@type EquipDrawData
        self.PoolData = pData[1]
        self.CoinId = tonumber(string.split(self.PoolData.singleDrawGoldPrice,"_")[2]) ---货币id
        self.CostItemId = tonumber(string.split(self.PoolData.singleDrawPrice,"_")[2]) ---石头id
        self.CoinCost = tonumber(string.split(self.PoolData.singleDrawGoldPrice,"_")[3]) ---金币单抽价格
        self.CoinTenCost = tonumber(string.split(self.PoolData.tenDrawGoldPrice,"_")[3]) ---金币十连抽价格
        self.StoneCost = tonumber(string.split(self.PoolData.singleDrawPrice,"_")[3]) ---石头单抽价格
        self.StoneTenCost = tonumber(string.split(self.PoolData.tenDrawPrice,"_")[3]) ---石头十连抽价格
        self.Btn_TenCoin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..self.CoinTenCost
        self.Btn_Coin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..self.CoinCost
        self.Btn_GearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..self.StoneCost
        self.Btn_TenGearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..self.StoneTenCost
        self.Btn_Coin().transform:Find("Text_Coin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),1)
        self.Btn_TenCoin().transform:Find("Text_TenCoin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),11)
        self.Btn_GearVoid().transform:Find("Text_GearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),1)
        self.Btn_TenGearVoid().transform:Find("Text_TenGearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),11)
        self.RolePoolPanel().gameObject:SetActive(false)
        self.GearVoidPanel().gameObject:SetActive(true)
        local mineralItem = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.singleDrawPrice,"_")[2]),tonumber(string.split(self.PoolData.singleDrawPrice,"_")[1]))
        local goldItem = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.singleDrawGoldPrice,"_")[2]),tonumber(string.split(self.PoolData.singleDrawGoldPrice,"_")[1]))
        MgrRes.LoadSprite(self.Dunbiicon2(),goldItem.icon)  ---金币图标
        MgrRes.LoadSprite(self.Dunbiicon1(),goldItem.icon)
        MgrRes.LoadSprite(self.Gongmingshiicon1(),mineralItem.icon)  ---共鸣石图标
        MgrRes.LoadSprite(self.Gongmingshiicon2(),mineralItem.icon)
        ---价格为0时按钮隐藏
        self.Btn_Coin().gameObject:SetActive(self.CoinCost ~= 0)
        self.Btn_TenCoin().gameObject:SetActive(self.CoinTenCost ~= 0)

        local openTime = string.split(self.PoolData.timeOpen,'-')
        local endTime =  string.split(self.PoolData.timeEnd,'-')
        self.Text_Time().gameObject:SetActive(false)
        self.Text_Time2().gameObject:SetActive(self.PoolData.timeType == 1)
        self.Text_Time2().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]
    end

    ---装备补给引导
    NoviceViewModel.CheckCurID(52405,function()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            MessageEvent.Go(EID.NoviceCheck)
        end)
    end)
    ---如果是新手池
    if self.CurRecruitID == 999999 then
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.singleDrawPrice,"_")[2]),tonumber(string.split(self.PoolData.singleDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.NovicePanel().transform:Find("NeedIcon"):GetComponent("Image"),item.icon)
        self.ProRecruitPanel().gameObject:SetActive(false)
        self.ProTenRecruitPanel().gameObject:SetActive(false)
        self.NovicePanel().gameObject:SetActive(true)
        self.Btn_Info().gameObject:SetActive(false)
        ---开始新手卡池引导
        NoviceViewModel.CheckCurID(20403,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
                MessageEvent.Go(EID.NoviceCheck)
            end)
        end)
        ---装备补给引导
        NoviceViewModel.CheckCurID(52405,function()
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
                MessageEvent.Go(EID.NoviceCheck)
            end)
        end)
    else
        self.ProRecruitPanel().gameObject:SetActive(true)
        self.ProTenRecruitPanel().gameObject:SetActive(true)
        self.NovicePanel().gameObject:SetActive(false)
        self.Btn_Info().gameObject:SetActive(true)
    end
    ---价格为0时按钮隐藏
    self.ProRecruitPanel().gameObject:SetActive(self.StoneCost ~= 0)
    self.ProTenRecruitPanel().gameObject:SetActive(self.StoneTenCost ~= 0)
end

function M:InitButton()
    ---十连
    UIEvent.LuaClick(self.ProTenRecruitPanel().gameObject,Handle(self, function()
        if self:CheckCount(self.StoneTenCost) then
            NormalCardDrawViewModel.RoleDataBefore = HeroControl.GetHaveHero()
            NormalCardDrawViewModel.CountType = 1
            NormalCardDrawViewModel.limitCount = self.limitCount
            self.Parent:OnClickDrawalCard(self.CurRecruitID,self.CostItemId,10,self.UpRoleId,self.idx-1,self.StoneTenCost)
        end
    end))
    ---单抽
    UIEvent.LuaClick(self.ProRecruitPanel().gameObject,Handle(self, function()
        if self:CheckCount(self.StoneCost) then
            NormalCardDrawViewModel.CountType = 0
            self.Parent:OnClickDrawalCard(self.CurRecruitID,self.CostItemId,1,self.UpRoleId,self.idx-1,self.StoneCost)
        end
    end))

    ---十连共鸣
    UIEvent.LuaClick(self.Btn_TenGearVoid().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType  = 1
        self.Parent:OnClickVoidCard(1,11,self.idx-1,self.CostItemId,self.StoneTenCost,self.PoolData.id)
    end))
    ---单抽共鸣
    UIEvent.LuaClick(self.Btn_GearVoid().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType = 0
        self.Parent:OnClickVoidCard(1,1,self.idx-1,self.CostItemId,self.StoneCost,self.PoolData.id)
    end))
    ---金币十连抽
    UIEvent.LuaClick(self.Btn_TenCoin().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType = 1
        self.Parent:OnClickVoidCard(0,11,self.idx-1,self.CoinId,self.CoinTenCost,self.PoolData.id)
    end))
    ---金币单抽
    UIEvent.LuaClick(self.Btn_Coin().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType = 0
        self.Parent:OnClickVoidCard(0,1,self.idx-1,self.CoinId,self.CoinCost,self.PoolData.id)
    end))
    ---新手抽
    UIEvent.LuaClick(self.NovicePanel().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType = 1
        NormalCardDrawViewModel.limitCount = self.limitCount
        self.Parent:OnClickDrawalCard(self.CurRecruitID,1,10,self.UpRoleId,self.idx-1)
    end))
    ---查看角色信息
    UIEvent.LuaClick(self.Btn_Info().gameObject,Handle(self, function()
        --MgrUI.Pop(UID.CardPoolTip_UI,{self.PoolData.cardPool,self.PoolData.desc,true},true)
        NormalCardDrawViewModel.ClientDropInfoREQ(self.PoolData.cardPool,{self.PoolData.cardPool,self.PoolData.desc,true})
    end))
    ---武器卡池详情
    UIEvent.LuaClick(self.Btn_VoidInfo().gameObject,Handle(self, function()
        --MgrUI.Pop(UID.CardPoolTip_UI,{self.PoolData.cardPool,self.PoolData.desc,false},true)
        NormalCardDrawViewModel.ClientDropInfoREQ(self.PoolData.cardPool,{self.PoolData.cardPool,self.PoolData.desc,false})
    end))

    ---点击兑换角色
    UIEvent.LuaClick(self.DuihuanPanel().gameObject,function()
        local list = ShopControl.GetCertainTypeShopData(tonumber(self.PoolData.shopType))
        local arr = {}
        for k,v in pairs(list) do
            arr[#arr + 1] = v
        end
        Global.Sort(arr,{"id"},false)
        MgrUI.Pop(UID.OptionalPop_UI,{arr,function()
            local ExchangeProp = ItemControl.GetItemByIdAndType(tonumber(string.split(self.PoolData.item,"_")[2]),tonumber(string.split(self.PoolData.item,"_")[1]))
            self.Text_Dianshu().text = ExchangeProp.count
            self.Parent.CardPoolScroll01():RefreshCells()
        end ,2},true,1)
    end)
end

function M:CheckCount(count)
    if self.limitCount~=0 then
        if self.CurRecruitID == 999999 then
            return true
        end
        local lotteryInfo = NormalCardDrawViewModel.GetLotteryInfo(self.CurRecruitID)
        local CanCount =  self.limitCount - lotteryInfo.lotteryCount
        if count > CanCount then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips5")..CanCount,1},true)
            return false
        end
    end
    return true
end

function M:CreateNoviceBtn()
    local obj = GameObject.Instantiate(self.ProTenRecruitPanel().gameObject,self.ProTenRecruitPanel().gameObject.transform,false)
    obj:SetActive(true)
    obj.transform.localPosition =Vector3.zero
    obj.transform.localScale =Vector3.one
    obj.gameObject.name = "NoviceTen"
    UIEvent.LuaClick(obj.gameObject,Handle(self, function()
        NormalCardDrawViewModel.CountType = 1
        NormalCardDrawViewModel.limitCount = self.limitCount
        self.Parent:OnClickDrawalCard(self.CurRecruitID,1,10,self.UpRoleId,self.idx-1)
    end))
end

return M