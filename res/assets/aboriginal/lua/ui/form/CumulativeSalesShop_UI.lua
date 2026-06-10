-- Code Auto Create Begin
local M = Class('CumulativeSalesShop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CumulativeSalesShop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CumulativeSalesShop_UI].prefab'
    self.Name = 'Form[CumulativeSalesShop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'RoleRoot','MainPanel/RoleRoot',2},{'Img_RoleSpine','MainPanel/RoleRoot/Img_RoleSpine',2},{'RoleClickArea','MainPanel/RoleRoot/Img_RoleSpine/RoleClickArea',2},{'Img_RoleVoiceBg','MainPanel/RoleRoot/Img_RoleVoiceBg',2},{'ShopContent','MainPanel/ShopList/ShopScroll/ShopContent',2},{'ShopCell','MainPanel/ShopList/ShopScroll/ShopCell',2},{'CoinItem','UpperRightPanel/CoinRoot/CoinItem',2},{'Img_Bg','UpperRightPanel/CoinRoot/CoinItem/Img_Bg',2},{'Img_Coin','UpperRightPanel/CoinRoot/CoinItem/Img_Coin',2},{'UpperLeftPanel','UpperLeftPanel',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Split','UpperLeftPanel/Img_Split',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},
        -- UITemplate 列表
        {'ShopCell01','MainPanel/ShopList/ShopScroll/ShopCell',10},
        -- LoopScrollRect 列表
        {'ShopScroll','MainPanel/ShopList/ShopScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_RoleVoice','MainPanel/RoleRoot/Img_RoleVoiceBg/Text_RoleVoice',20},{'Text_Coin','UpperRightPanel/CoinRoot/CoinItem/Text_Coin',20},{'Text_Title_CN','UpperLeftPanel/TitleRoot/Text_Title_CN',20},
    }
end
-- Code Auto Create End
---@class CumulativeSalesShop_UI : UIBase
---@field m_data CumulativeSalesShop_UI.DataCls
---@field Btn_Back fun():UnityEngine.UI.Image
---@field Btn_GoMenu fun():UnityEngine.UI.Image
---@field Btn_Help fun():UnityEngine.UI.Image
---@field CoinRoot fun():UnityEngine.UI.Image
---@field CoinItem fun():UnityEngine.UI.Image
---@field RoleClickArea fun():UnityEngine.UI.Image
---@field Img_RoleSpine fun():UnityEngine.UI.Image
---@field Img_RoleVoiceBg fun():UnityEngine.UI.Image
---@field Text_RoleVoice fun():TMPro.TextMeshProUGUI
---@field ShopScroll fun():UnityEngine.UI.LoopScrollRect
local FormCls = M
---@type CumulativeSalesShop_UI.DataCls
local DataCls
local VoiceTimerKey = "CumulativeSalesShopRoleVoice"
local VoiceReadType_Normal = 97
local VoiceReadType_Exchange = 98

--region 生命周期
function FormCls:OnArg()
    ---@type CumulativeSalesShop_UI.CoinItemData[]
    self.CoinItemList = {}
    ---@type UnityEngine.GameObject
    self.RoleSpineGo = nil
end

function FormCls:OnInit()
    self.m_data = DataCls.New()
    self.m_data:OnInit()

    --- 通用操作
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, self.BackPanel))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        Global.PopTip("Click help", nil, true)
    end)
    Event.Add(EID.BackKey, Handle(self, self.OnBackKey))

    --- 角色点击
    UIEvent.LuaClick(self.RoleClickArea().gameObject, Handle(self, self.OnRoleClick))

    --- 商品列表
    ---@param trans UnityEngine.Transform
    ---@param index int
    self.ShopScroll():SetLuaCellEvent(function(trans, index)
        trans:GetComponent("UITemplate"):SetData(self.m_data.shopInputList[index])
    end)
end

function FormCls:OnHide()
    self:DoHide()
end

function FormCls:OnClose()
    self:DoHide()
end

---@protected
function FormCls:DoHide()
    MgrTimer.Cancel(VoiceTimerKey)
    MgrSound.Stop(3, tostring(self.m_data.npcId), false)
    Event.Remove(EID.BackKey, Handle(self, self.OnBackKey))
end

---@param args CumulativeSalesShop_UI.InputData
function FormCls:OnShow(args)
    args = args or CumulativeSalesViewModel.GetShopFormArgs()
    self.m_data:InputData(args)
    self:FillData()

    self:InitRefreshUI_Coin()
    self:DoRefreshUI_Shop()

    --- 初始处理
    local data = self.m_data
    -- 添加音效
    MgrSound.AddCue(string.format("Audio/role/%d.acb", data.npcId))
    -- 创建角色 Spine
    CumulativeSalesViewModel.CreatePosterGirlSpine(data.npcId, self.Img_RoleSpine(), data.shopType, function(spineGo) 
        self.RoleSpineGo = spineGo
    end)
    -- 播放初始台词
    local actorLineId = data:GetActorLineId(VoiceReadType_Normal)
    self:PlayRoleVoice(actorLineId)
end

function FormCls:RefreshUIAfterBuy()
    self.m_data:RefreshDataAfterBuy()
    self:FillData()
    self:DoRefreshUI_Coin()
    self:DoRefreshUI_Shop()
end
--endregion 生命周期

--region Data
function FormCls:FillData()
    local shopInputList = self.m_data.shopInputList
    local buyCallback = Handle(self, self.OnShopItemBuy)
    for _, inputData in ipairs(shopInputList) do
        inputData.buyCallback = buyCallback
    end
end
--endregion Data

--region UI
function FormCls:InitRefreshUI_Coin()
    local costDataList = self.m_data.costDataList
    self:AlignCoinItems(#costDataList)
    for i, costData in ipairs(costDataList) do
        local itemData = self.CoinItemList[i]
        if not itemData then
            break
        end
        if not Global.IsNil(itemData.ImgIcon) then
            MgrRes.LoadSprite(itemData.ImgIcon, costData.goodsIcon)
        end
        if not Global.IsNil(itemData.TxtNum) then
            itemData.TxtNum.text = JNStrTool.numberAbbr(costData.goodsNum)
        end
    end
end

function FormCls:DoRefreshUI_Coin()
    for i, itemData in ipairs(self.CoinItemList) do
        local costData = self.m_data.costDataList[i]
        if costData then
            if not Global.IsNil(itemData.TxtNum) then
                itemData.TxtNum.text = JNStrTool.numberAbbr(costData.goodsNum)
            end
        else
            itemData.RootGo:SetActive(false)
        end
    end
end

---@param count int
function FormCls:AlignCoinItems(count)
    --- 补齐数量
    if #self.CoinItemList < count then
        ---@type UnityEngine.GameObject
        local originalItem = self.CoinItem().gameObject
        ---@type UnityEngine.GameObject
        local coinRoot = originalItem.transform.parent
        for i = #self.CoinItemList + 1, count do
            ---@type CumulativeSalesShop_UI.CoinItemData
            local itemData = {}
            table.insert(self.CoinItemList, itemData)

            local newItem = originalItem
            if i > 1 then
                newItem = GameObject.Instantiate(originalItem, coinRoot)
            end
            itemData.RootGo = newItem

            local iconTr =  newItem.transform:Find("Img_Coin")
            if not Global.IsNil(iconTr) then
                itemData.ImgIcon = iconTr.gameObject:GetComponent("Image")
            end
            local textTr = newItem.transform:Find("Text_Coin")
            if not Global.IsNil(textTr) then
                itemData.TxtNum = textTr.gameObject:GetComponent("TextMeshProUGUI")
            end

            UIEvent.LuaClick(newItem, function()
                self:OnCoinClick(i)
            end)
        end
    end

    --- 设置显隐
    for i, itemData in ipairs(self.CoinItemList) do
        itemData.RootGo:SetActive(i <= count)
    end
end

function FormCls:DoRefreshUI_Shop()
    local shopScroll = self.ShopScroll()
    local shopInputList = self.m_data.shopInputList
    shopScroll.totalCount = #shopInputList
    -- 避免商店项刷新数量不正确
    MgrTimer.AddDelayNoName(0.01, function()
        shopScroll:RefillCells()
    end)
end
--endregion UI

--region Function
function FormCls:BackPanel()
    MgrUI.GoBack()
end

---@param actorLineId int
function FormCls:PlayRoleVoice(actorLineId)
    local content, aniName, audioName = CumulativeSalesViewModel.GetActorLinesContent(actorLineId)
    if not content then
        return
    end
    if not Global.IsNil(self.RoleSpineGo) then
        CMgrSpine.Instance:SetSpineAnimation(self.RoleSpineGo, aniName, true)
    end
    self:SetRoleVoiceContent(content)
    self:SetRoleVoice(audioName, self.m_data.npcId)
end

---@param content string
function FormCls:SetRoleVoiceContent(content)
    if Global.IsStrNil(content) then
        return
    end
    self.Text_RoleVoice().text = content
    self.Img_RoleVoiceBg().gameObject:SetActive(true)
end

---@param audioName string
---@param roleId int
function FormCls:SetRoleVoice(audioName, roleId)
    if Global.IsStrNil(audioName) then
        return
    end
    local roleIdStr = tostring(roleId)
    MgrSound.PlayRole(audioName, nil, nil, false, 0, 0, roleIdStr)
    MgrTimer.AddRepeat(VoiceTimerKey, 0.2, function()
        if MgrSound.CheckRoleStatus(roleIdStr) then
            self.Img_RoleVoiceBg().gameObject:SetActive(false)
            MgrTimer.Cancel(VoiceTimerKey)
        end
    end, -1, nil)
end
--endregion Function

--region Callback
---@protected
function FormCls:OnBackKey()
    if MgrUI.IsPopOpen() or not MgrUI.IsShow(self.Uid) then
        return
    end
    self:BackPanel()
end

---@protected
---@param index int
function FormCls:OnCoinClick(index)
    local costData = self.m_data.costDataList[index]
    if not costData then
        return
    end
    local jumpStr = costData.jumpStr
    if Global.IsStrNil(jumpStr) or jumpStr == "0" then
        return
    end
    MgrLink.LinkStart(jumpStr)
end

---@protected
function FormCls:OnRoleClick()
    local actorLineId = self.m_data:GetActorLineId(VoiceReadType_Normal)
    self:PlayRoleVoice(actorLineId)
end

---@protected
---@param index int
---@param count int
function FormCls:OnShopItemBuy(index, count)
    self:RefreshUIAfterBuy()
    self:PlayRoleVoice(VoiceReadType_Exchange)
end
--endregion Callback


--region DataDefine
---@class CumulativeSalesShop_UI.CoinItemData
---@field RootGo UnityEngine.GameObject
---@field ImgIcon UnityEngine.UI.Image
---@field TxtNum TMPro.TextMeshProUGUI
--endregion DataDefine

--region DataCls
---@class CumulativeSalesShop_UI.InputData
---@field activityId int
---@field shopType int

---@class CumulativeSalesShop_UI.DataCls
---@field inputData CumulativeSalesShop_UI.InputData
---@field shopType int
---@field npcId int
---@field costDataList CumulativeSalesCoinData[]
---@field shopInputList CumulativeSalesShopCell.InputData[]
DataCls = Class("CumulativeSalesShop_UI.DataCls")

function DataCls:OnInit()

end

---@param inputData CumulativeSalesShop_UI.InputData
function DataCls:InputData(inputData)
    if not inputData then
        return
    end
    self.inputData = inputData
    self:RefreshData()
end

function DataCls:RefreshData()
    self.shopType = self.inputData.shopType
    local shopData = ShoptypeLocalData.tab[self.shopType]
    if shopData then
        self.npcId = shopData.npcid or 0
    else
        self.npcId = 0
    end
    self:RefreshData_Coin()
    self:RefreshData_Shop()
end

function DataCls:RefreshDataAfterBuy()
    self:RefreshData_Coin()
    self:RefreshData_Shop()
end

function DataCls:RefreshData_Coin()
    self.costDataList = CumulativeSalesViewModel.GetShopCoinList(self.shopType)
end

function DataCls:RefreshData_Shop()
    local shopType = self.shopType
    self.shopInputList = {}
    local tempShopList = CumulativeSalesViewModel.GetShopItemList(shopType)
    for i, shopItem in ipairs(tempShopList) do
        self.shopInputList[i] = {
            index = i,
            shopItem = shopItem,
        }
    end
end

---@param readType int
---@return int @ 0 表示无
function DataCls:GetActorLineId(readType)
    return CumulativeSalesViewModel.GetRandomActorLinesId(self.npcId, readType)
end
--endregion DataCls

return M
