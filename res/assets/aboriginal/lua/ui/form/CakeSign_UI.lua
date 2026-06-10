-- Code Auto Create Begin
local M = Class('CakeSign_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CakeSign_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CakeSign_UI].prefab'
    self.Name = 'Form[CakeSign_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'img_qiandaodi','Ani/img_qiandaodi',2},{'Img_Role','Ani/Img_Role',2},{'Btn_lingqu','Ani/Btn_lingqu',2},{'CakeSignItem','Ani/SignPanel/SignScroll/CakeSignItem',2},{'Content','Ani/SignPanel/SignScroll/Content',2},{'Last','Ani/SignPanel/Last',2},{'LastSignItem','Ani/SignPanel/Last/LastSignItem',2},{'Img_LimitItemdi_H','Ani/SignPanel/Last/LastSignItem/Img_LimitItemdi_H',2},{'ItemPanel','Ani/SignPanel/Last/LastSignItem/ItemPanel ',2},{'SignItemRankImg','Ani/SignPanel/Last/LastSignItem/ItemPanel /SignItemRankImg',2},{'SignItemIconImg','Ani/SignPanel/Last/LastSignItem/ItemPanel /SignItemIconImg',2},{'Img_ItemCountPivot','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_ItemCountPivot',2},{'Img_ItemCountBg','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_ItemCountPivot/Img_ItemCountBg',2},{'Img_Zhezhao','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_Zhezhao',2},{'Img_Yilingqudi','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_Zhezhao/Img_Yilingqudi',2},{'ClickToSign','Ani/SignPanel/Last/LastSignItem/ClickToSign',2},{'Img_kelingqu','Ani/SignPanel/Last/LastSignItem/Img_kelingqu',2},{'Mask','Ani/SignPanel/Last/LastSignItem/Mask',2},{'Img_Gou','Ani/SignPanel/Last/LastSignItem/Mask/Img_Gou',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- UITemplate 列表
        {'CakeSignItem01','Ani/SignPanel/SignScroll/CakeSignItem',10},
        -- LoopScrollRect 列表
        {'SignScroll','Ani/SignPanel/SignScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Shijian','Ani/Text_Shijian',20},{'Text_Lingqu','Ani/Btn_lingqu/Text_Lingqu',20},{'Text_Num','Ani/SignPanel/Last/LastSignItem/Text_Num',20},{'Text_ItemCount','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_ItemCountPivot/Img_ItemCountBg/Text_ItemCount',20},{'Text_Yilingqu','Ani/SignPanel/Last/LastSignItem/ItemPanel /Img_Zhezhao/Text_Yilingqu',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ClickToSign().gameObject:SetActive(false)
    ---获取签到界面数据
    self.SignItemData = CakeControl.GetSignItemData()
    self.SignScroll():SetLuaCellEvent(Handle(self, self.CellItem))
    self.ActivityInfo = CakeControl.GetActivityInfo()
    
    self:InitButton()
    self:InitLastReward()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_lingqu().gameObject, function()
        if not RedDotControl.GetDotData("CakeSign").State then
            return
        end
        ActivityControl.LimitSignReq(self.ActivityInfo.activityId, function()
            self.SignScroll():RefreshCells()
            self:InitLastReward()
        end)
    end)
    
    UIEvent.LuaClick(self.SignItemIconImg().gameObject,function()
        MgrUI.Pop(UID.ItemDetailPop_UI,{self.ItemData, false,nil,nil,true},true)
    end)
end

function M:OnUpdateUI()
    ---活动时间
    local tEndTime = string.split(self.ActivityInfo.endTime,'-')
    local tBeginTime = string.split(self.ActivityInfo.beginTime,'-')
    self.Text_Shijian().text = Global.GetTimeFormat(tBeginTime,tEndTime)
    
    self.SignScroll().totalCount = #self.SignItemData-1
    self.SignScroll():RefillCells()
end

function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.SignItemData[idx], idx })
end

function M:InitLastReward()
    local RewardData = self.SignItemData[#self.SignItemData]
    local index = #self.SignItemData
    
    self.Text_Num().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text170"),index)

    local reward = string.split(RewardData.reward,"_")
    self.ItemData = ItemData.New()
    self.ItemData:PushData({goodsType = tonumber(reward[1]),goodsID = tonumber(reward[2]),goodsNum = tonumber(reward[3])},ItemControl.PushEnum.none)

    MgrRes.LoadSprite(self.SignItemRankImg(),self.ItemData.iconFrame)
    MgrRes.LoadSprite(self.SignItemIconImg(),self.ItemData.icon)
    self.Text_ItemCount().text = self.ItemData.count
    if index <= CakeControl.GetSeverSignDay() then
        self.Img_Zhezhao().gameObject:SetActive(true)
        self.Mask().gameObject:SetActive(true)
        self.Img_kelingqu().gameObject:SetActive(false)
    else
        self.Img_Zhezhao().gameObject:SetActive(false)
        self.Mask().gameObject:SetActive(false)
        self.Img_kelingqu().gameObject:SetActive(CakeControl.GetSeverSignTimes() >= index)
    end
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