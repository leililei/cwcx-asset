-- Code Auto Create Begin
local M = Class('CakeGiftBox_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CakeGiftBox_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CakeGiftBox_UI].prefab'
    self.Name = 'Form[CakeGiftBox_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'RoleRoot','MainPanel/RoleRoot',2},{'SpineRole','MainPanel/RoleRoot/SpineRole',2},{'RoleClickArea','MainPanel/RoleRoot/SpineRole/RoleClickArea',2},{'Img_SoundTextBG','MainPanel/RoleRoot/Img_SoundTextBG',2},{'ImgRole','MainPanel/ImgRole',2},{'BoxPanel','MainPanel/BoxPanel',2},{'PrizeItem','MainPanel/BoxPanel/PrizePanel/Scr_Prizes/PrizeItem',2},{'Img_SoldOut','MainPanel/BoxPanel/PrizePanel/Scr_Prizes/PrizeItem/Img_SoldOut',2},{'OverRoot','MainPanel/BoxPanel/PrizePanel/OverRoot',2},{'Img_Over','MainPanel/BoxPanel/PrizePanel/OverRoot/Img_Over',2},{'Huobi','MainPanel/BoxPanel/CoinPanel/Huobi',2},{'Img_BG','MainPanel/BoxPanel/CoinPanel/Huobi/Img_BG',2},{'CurrencyIcon','MainPanel/BoxPanel/CoinPanel/Huobi/CurrencyIcon',2},{'Btn_Once','MainPanel/BoxPanel/Btn_Once',2},{'Img_Icon','MainPanel/BoxPanel/Btn_Once/Img_Icon',2},{'Btn_Times','MainPanel/BoxPanel/Btn_Times',2},{'Img_Icon01','MainPanel/BoxPanel/Btn_Times/Img_Icon',2},{'ReturnPanel','TopPanel/ReturnPanel',2},{'Btn_GoMenu','TopPanel/ReturnPanel/Btn_GoMenu',2},{'Btn_Back','TopPanel/ReturnPanel/Btn_Back',2},{'Btn_Help','TopPanel/ReturnPanel/Btn_Help',2},{'Img_SplitLine','TopPanel/ReturnPanel/Img_SplitLine',2},{'ResultPanel','TopPanel/ResultPanel',2},{'Img_ResultBg','TopPanel/ResultPanel/Img_ResultBg',2},{'Img_ResultTitle','TopPanel/ResultPanel/Img_ResultTitle',2},{'ResultItem','TopPanel/ResultPanel/Scr_ResultItems/ResultItem',2},
        -- Text 列表
        {'Text_CurrencyCount','MainPanel/BoxPanel/CoinPanel/Huobi/Text_CurrencyCount',3},
        -- UITemplate 列表
        {'GoodsItem','MainPanel/BoxPanel/PrizePanel/Scr_Prizes/PrizeItem/GoodsItem',10},{'GoodsItem01','TopPanel/ResultPanel/Scr_ResultItems/ResultItem/GoodsItem',10},
        -- RawImage 列表
        {'Content','MainPanel/BoxPanel/PrizePanel/Scr_Prizes/Content',15},{'Content01','TopPanel/ResultPanel/Scr_ResultItems/Content',15},
        -- LoopScrollRect 列表
        {'Scr_Prizes','MainPanel/BoxPanel/PrizePanel/Scr_Prizes',18},{'Scr_ResultItems','TopPanel/ResultPanel/Scr_ResultItems',18},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','MainPanel/RoleRoot/Img_SoundTextBG/RoleVoiceWordText',20},{'Txt_PrizeCount','MainPanel/BoxPanel/PrizePanel/Scr_Prizes/PrizeItem/Txt_PrizeCount',20},{'Txt_Count','MainPanel/BoxPanel/Btn_Once/Txt_Count',20},{'Txt_Count01','MainPanel/BoxPanel/Btn_Times/Txt_Count',20},{'Txt_Title_CN','TopPanel/ReturnPanel/TitleRoot/Txt_Title_CN',20},{'Txt_Title_EN','TopPanel/ReturnPanel/TitleRoot/Txt_Title_EN',20},{'Txt_CloseTip','TopPanel/ResultPanel/Txt_CloseTip',20},
    }
end
-- Code Auto Create End
---@class CakeGiftBox_UI : UIBase
---@field m_data CakeGiftBox_UI.DataCls
---@field m_spineObj UnityEngine.GameObject
---@field SpineRole fun():UnityEngine.UI.Image @ 角色Spine相关
---@field RoleClickArea fun():UnityEngine.UI.Image
---@field Img_SoundTextBG fun():UnityEngine.UI.Image
---@field RoleVoiceWordText fun():TMPro.TextMeshProUGUI
---@field Btn_GoMenu fun():UnityEngine.UI.Image @ 通用返回按钮
---@field Btn_Back fun():UnityEngine.UI.Image
---@field Btn_Help fun():UnityEngine.UI.Image
---@field ImgRole fun():UnityEngine.UI.Image @ 角色立绘
---@field Btn_Once fun():UnityEngine.UI.Image @ 抽奖按钮
---@field Img_Icon fun():UnityEngine.UI.Image
---@field Txt_Count fun():TMPro.TextMeshProUGUI
---@field Btn_Times fun():UnityEngine.UI.Image
---@field Img_Icon01 fun():UnityEngine.UI.Image
---@field Txt_Count01 fun():TMPro.TextMeshProUGUI
---@field CurrencyIcon fun():UnityEngine.UI.Image @ 货币显示
---@field Text_CurrencyCount fun():TMPro.TextMeshProUGUI
---@field OverRoot fun():UnityEngine.UI.Image @ 奖品显示
---@field Scr_Prizes fun():UnityEngine.UI.LoopScrollRect
---@field ResultPanel fun():UnityEngine.UI.Image @ 结果显示
---@field Img_ResultBg fun():UnityEngine.UI.Image
---@field Scr_ResultItems fun():UnityEngine.UI.LoopScrollRect
local FormCls = M
---@type CakeGiftBox_UI.DataCls
local DataCls

local VoiceTimerKey = "CakeGiftBox_RoleVoice"
--- 最大抽奖次数
local MaxDrawTimes = 10

--region 生命周期

--- 界面创建时执行
---@protected
function FormCls:OnInit()
    self.m_data = DataCls.New()
    self.m_data:OnInit()
    self:InitUI()
    self:InitEvent()
end

--- 每次显示/刷新界面时执行
---@protected
function FormCls:OnUpdateUI()
    CakeControl.InitGashaPool(function() 
        self:RefreshPanel()
    end)
    
    -- 考虑到角色加载与功能的独立性，不放在界面刷新中
    -- 该界面仅显示立绘图
    --self:CreateRoleSpine()
end

---@protected
function FormCls:OnHide()
    self:OnDark()
end

---@protected
function FormCls:OnClose()
    self:OnDark()
end

--endregion 生命周期

--region Logic

---@private
function FormCls:InitUI()
    self.ResultPanel().gameObject:SetActive(false)
    
    --UIEvent.LuaClick(self.RoleClickArea().gameObject, function() 
    --    self:PlayRoleWords(CommonViewModel.ActorLinesReadType.ActivityShopNormal)
    --end)
    CommonViewModel.CommonReturnBtns(self.Btn_Back().gameObject, self.Btn_GoMenu().gameObject, self.Btn_Help().gameObject)
    UIEvent.LuaClick(self.Btn_Once().gameObject, Handle(self, self.OnBtnOnceClick))
    UIEvent.LuaClick(self.Btn_Times().gameObject, Handle(self, self.OnBtnTimesClick))
    
    -- 这两个组件上要挂载关闭的 CanvasGroup 以阻止点击效果
    UIEvent.LuaClick(self.ResultPanel().gameObject, function() 
        self.ResultPanel().gameObject:SetActive(false)
    end)
    -- 阻止点击传到到背景
    UIEvent.LuaClick(self.Img_ResultBg().gameObject, function()  end)
    
    self.Scr_Prizes():SetLuaCellEvent(Handle(self, self.PrizeItemCellEvent))
    self.Scr_ResultItems():SetLuaCellEvent(Handle(self, self.ResultItemCellEvent))
end

---@private
function FormCls:InitEvent()
    Event.Add(EID.BackKey, Handle(self, self.OnBackKey))
end

--- 界面隐藏或关闭时调用
---@private
function FormCls:OnDark()
    --MgrTimer.Cancel(VoiceTimerKey)
    --MgrSound.Stop(3, tostring(self.m_data.npcId), false)
    Event.Remove(EID.BackKey, Handle(self, self.OnBackKey))
end

--- 刷新界面时调用
function FormCls:RefreshPanel()
    self.m_data:RefreshData()
    self:DoRefreshUI()
end

---@private
function FormCls:CreateRoleSpine()
    --- 销毁旧的Role
    if not Global.IsNil(self.m_spineObj) then
        GameObject.Destroy(self.m_spineObj)
    end
    
    CommonViewModel.CreateNpcSpine(self.m_data.npcId, self.SpineRole().gameObject, function(spineObj) 
        self.m_spineObj = spineObj
    end)
    
    self:PlayRoleWords(CommonViewModel.ActorLinesReadType.ActivityShopNormal)
end

-- TO-DO(Arno) 抽完也要播语音 该界面仅显示立绘图
---@param readType ActorLinesReadType
function FormCls:PlayRoleWords(readType)
    CommonViewModel.PlayNpcVoice(self.m_data.npcId, readType, self.m_spineObj, self.RoleVoiceWordText(), 
            self.Img_SoundTextBG().gameObject, VoiceTimerKey)
end

---@param rewards goods[]
function FormCls:ShowResults(rewards)
    self.m_data:PushRewards(rewards)

    self.ResultPanel().gameObject:SetActive(true)
    self.Scr_ResultItems().totalCount = #self.m_data.resultList
    self.Scr_ResultItems():RefillCells()
end

--endregion Logic

--region UI

--- 基于数据，刷新UI显示
---@private
function FormCls:DoRefreshUI()
    MgrRes.LoadSprite(self.ImgRole(), self.m_data.roleImg)
    local coinImg = self.m_data.coinItem.icon
    MgrRes.LoadSprite(self.Img_Icon(), coinImg)
    MgrRes.LoadSprite(self.Img_Icon01(), coinImg)
    MgrRes.LoadSprite(self.CurrencyIcon(), coinImg)
    self:DoRefreshUI_Coin()
    self:DoRefreshUI_PrizeList(true)
end

---@private
function FormCls:DoRefreshUI_Coin()
    local costCoin = CheckNumber(self.m_data.costGoods.goodsNum)
    local haveCoin = CheckNumber(self.m_data.coinItem.count)
    local affTimes = self.m_data.affordableTimes

    --- 货币
    self.Text_CurrencyCount().text = haveCoin
    --- 多抽
    self.Txt_Count01().text = string.format("x%d", affTimes * costCoin)
end

---@private
---@param bFirst boolean
function FormCls:DoRefreshUI_PrizeList(bFirst)
    local bAllOver = self.m_data.bAllOver
    self.OverRoot().gameObject:SetActive(bAllOver)
    self.Scr_Prizes().gameObject:SetActive(not bAllOver)
    self.Scr_Prizes().totalCount = #self.m_data.prizeList
    if bFirst then
        MgrTimer.AddDelayNoName(0.01, function()
            self.Scr_Prizes():RefillCells()
        end)
    else
        self.Scr_Prizes():RefillCells()
    end
end

--endregion UI

--region Callback

function FormCls:OnBackKey()
    CommonViewModel.CommonBackKey(self.Uid)
end

---@private
function FormCls:OnBtnOnceClick()
    self:OnDrawClick(1)
end

---@private
function FormCls:OnBtnTimesClick()
    self:OnDrawClick(self.m_data.affordableTimes)
end

---@private
---@param times int
function FormCls:OnDrawClick(times)
    if self.m_data.bAllOver then
        return
    end
    
    local haveCoin = self.m_data.coinItem.count
    local needCoin = self.m_data.costGoods.goodsNum * times
    if needCoin > haveCoin then
        Global.PopTip("eventshopitem_tips2")
        return
    end
    
    local bsData = CakeControl.GetBakeryData()
    CakeControl.RequestGashaLottery(bsData.activityid, bsData.gashaponId, times, function(rewards) 
        self:ShowResults(rewards)
        
        self.m_data:RefreshData()
        self:DoRefreshUI_Coin()
        self:DoRefreshUI_PrizeList()
    end)
end

--endregion Callback

--region 列表子项

---@private
---@param trans UnityEngine.Transform
---@param index int
function FormCls:PrizeItemCellEvent(trans, index)
    ---@type UnityEngine.Transform
    local goodsTr = trans:Find("GoodsItem")
    ---@type UnityEngine.Transform
    local countTr = trans:Find("Txt_PrizeCount")
    ---@type UnityEngine.Transform
    local soldOutTr = trans:Find("Img_SoldOut")
    local prizeData = self.m_data.prizeList[index]

    if not Global.IsNil(goodsTr) then
        ---@type UITemplate
        local luaComp = goodsTr:GetComponent("UITemplate")
        luaComp:SetData(prizeData.prizeIData)
    end
    if not Global.IsNil(countTr) then
        ---@type TMPro.TextMeshProUGUI
        local txtComp = countTr:GetComponent("TextMeshProUGUI")
        txtComp.text = string.format(MgrLanguageData.GetLanguageByKey("ui_externalevent_txt34"), prizeData.prizeCount)
    end
    if not Global.IsNil(soldOutTr) then
        soldOutTr.gameObject:SetActive(prizeData.prizeCount == 0)
    end
end

---@private
---@param trans UnityEngine.Transform
---@param index int
function FormCls:ResultItemCellEvent(trans, index)
    trans:GetComponent("UITemplate"):SetData(self.m_data.resultList[index])
end

--endregion 列表子项


--region DataCls

---@class CakeGiftBox_UI.PrizeInputData
---@field prizeIData GoodsItem.InputData
---@field prizeCount int @ 剩余数量

---@class CakeGiftBox_UI.DataCls
---@field roleImg string
---@field costGoods goods
---@field coinItem ItemDataBase
---@field prizeList CakeGiftBox_UI.PrizeInputData[]
---@field bAllOver boolean @ 全部抽完
---@field affordableTimes int @ 可负担的最大抽取数 [1,MaxDrawTimes]
---@field resultList table[] @ 见 RewardItem
DataCls = Class("CakeGiftBox_UI.DataCls")

--- 创建界面时执行
function DataCls:OnInit()
    self.costGoods = {}
    self.coinItem = {}
    self.prizeList = {}
    self.bAllOver = true
    self.affordableTimes = 1
    self.resultList = {}
end

--- 需要刷新数据时调用
function DataCls:RefreshData()
    local bsData = CakeControl.GetBakeryData()
    local costGoods = CakeControl.GetGashaCost()
    local coinItem = ItemControl.GetItemByIdAndType(costGoods.goodsID, costGoods.goodsType)

    --- 统计奖品列表
    -- 拿取所有掉落，确定顺序
    local allPrizes = CakeControl.GetGashaDrops()
    -- 查询池子剩余物品，更新数量
    -- 注意，该列表是源数据！！
    local originalPoolPrizes = CakeControl.GetGashaGoods()
    -- 抽完的奖品要放到后面
    ---@type CakeGiftBox_UI.PrizeInputData[]
    local emptyPrizes = {}
    -- 最终奖品
    ---@type CakeGiftBox_UI.PrizeInputData[]
    local prizeList = {}
    
    for _, newGoods in ipairs(allPrizes) do
        ---@type DropGoods
        local realGoods = nil
        for _, poolGoods in pairs(originalPoolPrizes) do
            if Global.CompDropGoods(newGoods, poolGoods) then
                realGoods = poolGoods
                break
            end
        end

        local prizeCount = 0
        -- 空则视为没有该物品
        if realGoods then
            prizeCount = realGoods.dropCount
        end
        newGoods.dropCount = prizeCount
        
        ---@type GoodsItem.InputData
        local iData = {
            goods = newGoods,
            defaultClick = 1,
        }
        ---@type CakeGiftBox_UI.PrizeInputData
        local data = {
            prizeIData = iData,
            prizeCount = newGoods.dropCount,
        }

        if prizeCount > 0 then
            table.insert(prizeList, data)
        else
            table.insert(emptyPrizes, data)
        end
    end
    
    -- 采用配表顺序，但已抽完的排到后面
    for _, data in ipairs(emptyPrizes) do
        table.insert(prizeList, data)
    end
    
    --- 统计是否全部抽完
    local bAllOver = true
    for _, data in ipairs(prizeList) do
        if data.prizeCount > 0 then
            bAllOver = false
            break
        end
    end
    
    --- 统计最大可抽数量
    local allCnt = 0
    for _, data in ipairs(prizeList) do
        allCnt = allCnt + data.prizeCount
    end
    local coinCnt = math.floor(coinItem.count / costGoods.goodsNum)
    local affTimes = math.max(1, math.min(MaxDrawTimes, math.min(allCnt, coinCnt)))
    
    self.roleImg = bsData.taskrole
    self.costGoods = costGoods
    self.coinItem = coinItem
    self.prizeList = prizeList
    self.bAllOver = bAllOver
    self.affordableTimes = affTimes
end

---@param rewards goods[]
function DataCls:PushRewards(rewards)
    local resultList = {}
    for i, r in ipairs(rewards) do
        local itemConfig = ItemControl.GetItemByType(r.goodsType, r.goodsID)
        local rewardData = {
            itemConfig,
            r.goodsNum,
            r.goodsType,
        }
        table.insert(resultList, rewardData)
    end
    self.resultList = resultList
end

--endregion DataCls

return M