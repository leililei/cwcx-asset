-- Code Auto Create Begin
local M = Class('PlotReviewShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlotReviewShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlotReviewShop_UI].prefab'
    self.Name = 'Form[PlotReviewShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Panel','Panel',2},{'Role','Panel/Role',2},{'SpineRole','Panel/Role/SpineRole',2},{'RoleClickArea','Panel/Role/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','Panel/Role/Img_SoundTextBG',2},{'Shop','Panel/Shop',2},{'UpperLeftPanel','UpperLeftPanel',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'UpperRightPanel','UpperRightPanel',2},{'CoinItem','UpperRightPanel/CoinItem',2},{'ImgBg','UpperRightPanel/CoinItem/ImgBg',2},{'ImgCoin','UpperRightPanel/CoinItem/ImgCoin',2},{'CoinRoot','UpperRightPanel/CoinRoot',2},
        -- UITemplate 列表
        {'PlotReviewShopItem','Panel/Shop/CommodityItemScroll/item/PlotReviewShopItem',10},
        -- RawImage 列表
        {'CommodityItemScroll','Panel/Shop/CommodityItemScroll',15},{'Content','Panel/Shop/CommodityItemScroll/Content',15},
        -- LoopScrollRect 列表
        {'CommodityItemScroll01','Panel/Shop/CommodityItemScroll',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','Panel/Role/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},{'TextCount','UpperRightPanel/CoinItem/TextCount',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.GoBack();
    end));
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI);
    end);
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        self:PlayWord(97);
    end))
    Event.Add("PlotReviewShopRefresh", Handle(self, self.OnShopRefresh));
    self.CommodityItemScroll01():SetLuaCellEvent(Handle(self, self.OnScrollItemRender));
end
function M:OnClose()
    MgrTimer.Cancel("PlotReviewShopRoleVoice");
    Event.Remove("PlotReviewShopRefresh", Handle(self, self.OnShopRefresh));
end
function M:OnShow()
    self.m_storyReplayInfo = PlotViewModel.GetStoryReplayInfo(PlotViewModel.ReviewActivityId);
    self.m_shopTypeInfo = ShoptypeLocalData.tab[tonumber(self.m_storyReplayInfo.shoptype)];
    --添加音效
    MgrSound.AddCue("Audio/role/".. self.m_shopTypeInfo.npcid .. ".acb");
    local posAndScale = JNStrTool.strSplit(";", CharactercoordinatesLocalData.tab[self.m_shopTypeInfo.npcid].coordinate10)
    local pos = JNStrTool.strSplit(",", posAndScale[1])
    MgrRes.LoadWatch3DSpineInUI(self.SpineRole(), self.m_shopTypeInfo.npcid, tonumber(pos[1]), tonumber(pos[2]), tonumber(posAndScale[2]), "idle", function(obj)
        self.m_spineObj = obj;
        obj.transform.gameObject.layer = 5;
    end)
    self.m_words = {};
    self:PlayWord(97);
    self:refreshShop();
    self:buildCoins();
    self:refreshCoins();
end
function M:OnShopRefresh()
    self:PlayWord(98)
    self:refreshShop();
    self:refreshCoins();
end
function M:OnScrollItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.shopItemList[idx] });
end
function M:refreshShop()
    local shopData = ShopControl.GetCertainTypeShopData(tonumber(self.m_storyReplayInfo.shoptype));
    self.shopItemList = {}
    for k,v in pairs(shopData) do
        if v.buyCount == v.buyMaxCount and v.buyMaxCount ~= 0 then
            v.soldOut = 1
        else
            v.soldOut = 0
        end
        table.insert(self.shopItemList,v)
    end
    ---排序
    table.sort(self.shopItemList,function(a,b)
        if a.soldOut > b.soldOut then
            return false
        elseif a.soldOut < b.soldOut then
            return true
        else
            return a.sortIdx < b.sortIdx
        end
    end)
    self.CommodityItemScroll01().totalCount = #self.shopItemList;
    self.CommodityItemScroll01():RefillCells();
end
function M:buildCoins()
    self.m_coins = {};
    local coins = string.split(self.m_shopTypeInfo.icons,';')
    for _, coin in ipairs(coins) do
        local obj = GameObject.Instantiate(self.CoinItem().gameObject, self.CoinRoot().transform, false);
        obj:SetActive(true);
        local imgCoin = CJNUIMgr.GetSunUseName(obj, "ImgCoin"):GetComponent("Image");
        local textCount = CJNUIMgr.GetSunUseName(obj, "TextCount"):GetComponent("TextMeshProUGUI");
        local coinInfos = string.split(coin,',');
        local coinInfo = string.split(coinInfos[1],'_');
        local item = ItemControl.GetItemByType(tonumber(coinInfo[1]), tonumber(coinInfo[2]));
        if item then
            MgrRes.LoadSprite(imgCoin, "Item/".. item.icon);
        end
        table.insert(self.m_coins, {
            com = textCount,
            id = tonumber(coinInfo[2]),
            type = tonumber(coinInfo[1]),
        });
    end
end
function M:refreshCoins()
    for _, info in ipairs(self.m_coins) do
        local item = ItemControl.GetItemByIdAndType(info.id, info.type);
        if item then
            info.com.text = JNStrTool.numberAbbr(item.count);
        else
            info.com.text = 0;
        end
    end
end
function M:BuildWords(type)
     local info = {
        totalWeight = 0,
        values = {};
    };
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == self.m_shopTypeInfo.npcid and value[3] == type then
            if value[5] == "0" then
                info.totalWeight = info.totalWeight + 10
                table.insert(info.values,{value[1], info.totalWeight})
            else
                ---切割对应的触发条件得到条件表
                local _TempVarTab = JNStrTool.strSplit("_", value[5])
                local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab, 0)
                if _ReturnVar ~= false then
                    info.totalWeight = info.totalWeight + (tonumber(_ReturnVar) * 1000)
                    table.insert(info.values, { value[1], info.totalWeight })
                end
            end
        end
    end
    self.m_words[type] = info;
end
function M:PlayWord(type)
    if nil == self.m_words[type] then
        self:BuildWords(type);
    end
    local id = PosterGirlViewModel.GetRandIndexByHashTab(self.m_words[type].totalWeight, self.m_words[type].values)
    if id == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[id][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[id][13]
    local _ActorLineWord = ActorLinesLocalData.tab[id][7]
    if self.m_spineObj ~= nil then
        CMgrSpine.Instance:SetSpineAnimation(self.m_spineObj, _AniName, true)
    end
    ---设置文本框文本
    self.RoleVoiceWordText().text = _ActorLineWord
    self.Img_SoundTextBG().gameObject:SetActive(true)
    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,tostring(self.curRoleId))
    MgrTimer.AddRepeat("PlotReviewShopRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(tostring(self.curRoleId)) then
            self.Img_SoundTextBG().gameObject:SetActive(false)
            MgrTimer.Cancel("PlotReviewShopRoleVoice")
        end
    end,-1,nil)
end
return M