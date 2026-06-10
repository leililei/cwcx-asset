-- Code Auto Create Begin
local M = Class('HalfAnniversaryGame_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryGame_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryGame_UI].prefab'
    self.Name = 'Form[HalfAnniversaryGame_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Panel','Panel',2},{'Btn_Start','Panel/Btn_Start',2},{'Img_Startdi','Panel/Btn_Start/Img_Startdi',2},{'Img_StartText','Panel/Btn_Start/Img_StartText',2},{'Xiaohao','Panel/Btn_Start/Xiaohao',2},{'HuobiIcon','Panel/Btn_Start/Xiaohao/CoinPlane/HuobiIcon',2},{'Btn_Plot','Panel/Btn_Plot',2},{'Img_Plot','Panel/Btn_Plot/Img_Plot',2},{'Img_PlotText','Panel/Btn_Plot/Img_PlotText',2},{'PlotRedDotIcon','Panel/Btn_Plot/PlotRedDotIcon',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'Btn_Help','ReturnBg/Btn_Help',2},{'UpperRightPanel','UpperRightPanel',2},{'Cailiao','UpperRightPanel/Cailiao',2},{'Img_BG','UpperRightPanel/Cailiao/Img_BG',2},{'Img_Icon','UpperRightPanel/Cailiao/Img_Icon',2},{'Donghua','Donghua',2},{'Img_Mask','Donghua/Img_Mask',2},{'Img_Donghuadi','Donghua/Img_Donghuadi',2},{'Img_JieSuan','Donghua/Img_Donghuadi/Img_JieSuan',2},{'Img_Sign','Img_Sign',2},
        -- TextMeshProUGUI 列表
        {'Text_Xiaohao','Panel/Btn_Start/Xiaohao/CoinPlane/Text_Xiaohao',20},{'Text_JiaGe','Panel/Btn_Start/Xiaohao/CoinPlane/Text_JiaGe',20},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'Text_Shu','UpperRightPanel/Cailiao/Text_Shu',20},{'Text_Pigua','Donghua/Text_Pigua',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.mGameData = HalfAnniControl.GetSignData()
    self.GoodsList = nil
    --self.SignImg = self.Img_Sign().gameObject:GetComponent("CanvasGroup")
    MgrUI.GetUICamera().orthographic = true
    self.GameCost = HalfAnniControl.GetGameCost()
    
    self:CostIcon()
    self:InitButton()
end

function M:OnUpdateUI()
    self:RefreshRedDot()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    UIEvent.LuaClick(self.Img_Mask().gameObject,function()
        self:ShowAward(self.GoodsList)
    end)
    UIEvent.LuaClick(self.Btn_Plot().gameObject,function()
        HalfAnniControl.OpenSignGamePlot()
    end)
    ---开始模拟
    UIEvent.LuaClick(self.Btn_Start().gameObject,function()
        if tonumber(self.Text_Shu().text) >= tonumber(self.Text_JiaGe().text) then
            --self.Img_Sign().gameObject:SetActive(true)
            HalfAnniControl.Sign(Handle(self,self.ShowDongHua))
            ---按钮状态
            MgrRes.LoadSprite(self.Img_Startdi(), "Activity/HalfAnniversary/Img_GameStartBtn2")
            --MgrTimer.AddRepeat("halfAnniGameStar",0.1,function()
            --    if self.SignImg.alpha >= 1 then
            --        HalfAnniControl.Sign(Handle(self,self.ShowDongHua))
            --        MgrTimer.Cancel("halfAnniGameStar")
            --    end
            --    self.SignImg.alpha = self.SignImg.alpha + 0.25
            --end)
        else
            local tStr = string.format(MgrLanguageData.GetLanguageByKey("ui_halfAnniversary_text7"),self.CostName)
            MgrUI.Pop(UID.PopTip_UI,{ tStr,2 },true)
        end
    end)
end

function M:ShowDongHua(_info)
    self:RefreshCost()
    ---
    --self.SignImg.alpha = 0
    --self.Img_Sign().gameObject:SetActive(false)
    local tData = self.mGameData[_info.rewardId]
    if tData == nil then
        return
    end
    self.GoodsList = _info.goods
    ---抽奖背景图
    MgrRes.LoadSprite(self.Img_JieSuan(),tData.ImgBack)
    if tData.dialogue then
        ---抽奖文字
        self.Text_Pigua().text = tData.dialogue
    else
        --添加音效
        MgrSound.AddCue("Audio/role/".. tData.talkRole..".acb")
        ---抽奖文字
        self.Text_Pigua().text = tData.talkData[7]
        ---角色语音
        MgrSound.PlayRole(tData.talkData[13], nil, nil, false, 0, 0,nil)
    end
    --MgrTimer.AddDelay("HalfAnniGame",2,function()
    --    self:ShowAward(self.GoodsList)
    --end,nil)

    self.Donghua().gameObject:SetActive(true)
    ---红点刷新
    self:RefreshRedDot()
end
---弹出奖励窗口
function M:ShowAward(_goods)
    self.Donghua().gameObject:SetActive(false)
    local goodsList = _goods
    
    ---弹出奖励窗口
    if #goodsList > 0 then
        MgrUI.Pop(UID.ItemAchievePop_UI,{goodsList},true)
    end

    ---按钮状态
    MgrRes.LoadSprite(self.Img_Startdi(), "Activity/HalfAnniversary/Img_GameStartBtn1")
end
---消耗材料图
function M:CostIcon()
    local tCostData = ItemControl.GetItemByIdAndType(tonumber(self.GameCost[2]),tonumber(self.GameCost[1]))
    self.CostName = tCostData.name
    ---消耗ICON
    MgrRes.LoadSprite(self.Img_Icon(),tCostData.icon)
    MgrRes.LoadSprite(self.HuobiIcon(),tCostData.icon)
    ---消耗值
    self.Text_Shu().text = tCostData.count
    self.Text_JiaGe().text = self.GameCost[3]
end
---刷新消耗
function M:RefreshCost()
    local tCostData = ItemControl.GetItemByIdAndType(tonumber(self.GameCost[2]),tonumber(self.GameCost[1]))
    self.Text_Shu().text = tCostData.count
end

function M:RefreshRedDot()
    HalfAnniControl.GamePlotRedPoint()
    self.PlotRedDotIcon().gameObject:SetActive(RedDotControl.GetDotData("HalfAnniversaryPlot").State)
end

function M:OnClose()
    MgrTimer.Cancel("halfAnniGameStar")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M