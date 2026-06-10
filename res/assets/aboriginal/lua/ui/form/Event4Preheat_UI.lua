-- Code Auto Create Begin
local M = Class('Event4Preheat_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event4Preheat_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event4Preheat_UI].prefab'
    self.Name = 'Form[Event4Preheat_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'YureHome','YureHome',2},{'Bg_Event4yure','YureHome/Bg_Event4yure',2},{'DramaPrefab','YureHome/DramaPrefab',2},{'Image','YureHome/DramaPrefab/Text_Name/Image',2},{'Img_Role','YureHome/DramaPrefab/Img_Role',2},{'Btn_Ticket','YureHome/Ticket/Btn_Ticket',2},{'img_event4_ticket_R','YureHome/Ticket/Btn_Ticket/img_event4_ticket_R',2},{'img_event4_ticket_L','YureHome/Ticket/Btn_Ticket/img_event4_ticket_L',2},{'TicketRedDotIcon','YureHome/Ticket/Btn_Ticket/TicketRedDotIcon',2},{'Btn_map','YureHome/Btn_map',2},{'Btn_ClickMap','YureHome/Btn_map/Btn_ClickMap',2},{'MapRedDotIcon','YureHome/Btn_map/MapRedDotIcon',2},{'UpperLeftBtnPanel','YureHome/UpperLeftBtnPanel',2},{'Btn_Back','YureHome/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','YureHome/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','YureHome/UpperLeftBtnPanel/Btn_Help',2},{'HelpPop','YureHome/HelpPop',2},{'Img_Mask3','YureHome/HelpPop/Img_Mask3',2},{'Img_bg','YureHome/HelpPop/PopPanel/Img_bg',2},{'Img_Xian2','YureHome/HelpPop/PopPanel/Img_Xian2',2},{'Img_Xian1','YureHome/HelpPop/PopPanel/Img_Xian1',2},{'Img_Biaotixian','YureHome/HelpPop/PopPanel/Img_Biaotixian',2},{'Balloon','YureHome/Balloon',2},{'Ballon_mask','YureHome/Balloon/Ballon_mask',2},{'bg_balloon_mask','YureHome/Balloon/Ballon_mask/bg_balloon_mask',2},{'Img_balloon_o','YureHome/Balloon/Img_balloon_o',2},{'Img_balloon_p','YureHome/Balloon/Img_balloon_p',2},{'Img_balloon_b','YureHome/Balloon/Img_balloon_b',2},{'Img_En','YureHome/Balloon/Img_En',2},{'Img_pattem1','YureHome/Balloon/Img_pattem1',2},{'Img_pattem2','YureHome/Balloon/Img_pattem2',2},{'Map','Map',2},{'MapPanel','Map/MapPanel',2},{'Map_mask','Map/MapPanel/Map_mask',2},{'bg_event4_map','Map/MapPanel/bg_event4_map',2},{'item1','Map/MapPanel/item1',2},{'img_event4_bg','Map/MapPanel/item1/img_event4_bg',2},{'Btn_photo','Map/MapPanel/item1/Btn_photo',2},{'Btn_new','Map/MapPanel/item1/Btn_new',2},{'Btn_question','Map/MapPanel/item1/Btn_question',2},{'item2','Map/MapPanel/item2',2},{'img_event4_bg01','Map/MapPanel/item2/img_event4_bg',2},{'Btn_photo01','Map/MapPanel/item2/Btn_photo',2},{'Btn_new01','Map/MapPanel/item2/Btn_new',2},{'Btn_question01','Map/MapPanel/item2/Btn_question',2},{'item3','Map/MapPanel/item3',2},{'img_event4_bg02','Map/MapPanel/item3/img_event4_bg',2},{'Btn_photo02','Map/MapPanel/item3/Btn_photo',2},{'Btn_new02','Map/MapPanel/item3/Btn_new',2},{'Btn_question02','Map/MapPanel/item3/Btn_question',2},{'item4','Map/MapPanel/item4',2},{'img_event4_bg03','Map/MapPanel/item4/img_event4_bg',2},{'Btn_photo03','Map/MapPanel/item4/Btn_photo',2},{'Btn_new03','Map/MapPanel/item4/Btn_new',2},{'Btn_question03','Map/MapPanel/item4/Btn_question',2},{'item5','Map/MapPanel/item5',2},{'img_event4_bg04','Map/MapPanel/item5/img_event4_bg',2},{'Btn_photo04','Map/MapPanel/item5/Btn_photo',2},{'Btn_new04','Map/MapPanel/item5/Btn_new',2},{'Btn_question04','Map/MapPanel/item5/Btn_question',2},{'item6','Map/MapPanel/item6',2},{'img_event4_bg05','Map/MapPanel/item6/img_event4_bg',2},{'Btn_photo05','Map/MapPanel/item6/Btn_photo',2},{'Btn_new05','Map/MapPanel/item6/Btn_new',2},{'Btn_question05','Map/MapPanel/item6/Btn_question',2},{'PhotoPanel','Map/PhotoPanel',2},{'Photo_mask','Map/PhotoPanel/Photo_mask',2},{'img_event4_photo','Map/PhotoPanel/img_event4_photo',2},{'img_event4_bg06','Map/PhotoPanel/img_event4_photo/img_event4_bg',2},
        -- Button 列表
        {'Btn_Ticket01','YureHome/Ticket/Btn_Ticket',4},{'Btn_ClickMap01','YureHome/Btn_map/Btn_ClickMap',4},
        -- TextMeshProUGUI 列表
        {'Text_Name','YureHome/DramaPrefab/Text_Name',20},{'Text_Dialog','YureHome/DramaPrefab/Text_Dialog',20},{'Text_Shuzi1','YureHome/Ticket/Btn_Ticket/Text_Shuzi1',20},{'Text_Shuzi2','YureHome/Ticket/Btn_Ticket/Text_Shuzi2',20},{'Text_map','YureHome/Btn_map/Text_map',20},{'Text_Mail_CN','YureHome/UpperLeftBtnPanel/Text_Mail/Text_Mail_CN',20},{'Text_Mail_EN','YureHome/UpperLeftBtnPanel/Text_Mail/Text_Mail_EN',20},{'Text_Txt','YureHome/HelpPop/PopPanel/Text_Txt',20},{'Text_Title','YureHome/HelpPop/PopPanel/Text_Title',20},{'Text_Tiaoxuan','YureHome/Balloon/Text_Tiaoxuan',20},{'Text_Shuoming','Map/PhotoPanel/img_event4_photo/Text_Shuoming',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Map().gameObject:SetActive(false)
    self.Balloon().gameObject:SetActive(false)
    self.HelpPop().gameObject:SetActive(false)
    self.PhotoPanel().gameObject:SetActive(false)
    self.MapRedDotIcon().gameObject:SetActive(false)
    self.TicketRedDotIcon().gameObject:SetActive(false)

    ---添加音频  
    MgrSound.AddCue("Audio/common/BGM.acb")
    ---获取本次活动签到小游戏数据
    self.mPreheaData = Event4Control.GetEvent4Preheat()
    ---今日可签到次数
    self.mSignCount = 0
    ---对话数据
    self.mDialogData = ActivityControl.GetDialogData()
    ---激活道具ID
    self.mActiveItemID = 0
    self.mCurPhoto = nil
    self.mCurPhotoItem = nil
    self.mCurNewItemm = nil
    ---签到是否完成
    self.mSignComplete = false

    self:InitUI()
    self:InitButton()
end

function M:InitUI()
    ---体力查询
    self:CheckVigor()
    ---角色对话
    self:SetDialog()
    ---初始化地图
    self:UpdataMap()
    ---红点检测
    self:CheckRedDot()

    Event.Add("ItemAchievePopClose",function()
        if self.mSignComplete then
            self.Btn_Ticket01().interactable = false
            self.mSignComplete = false
        end
    end)

    ---背景音乐
    local tPreheatBGM = Event4Control.GetBGM()
    if tPreheatBGM then
        MgrSound.PlayBGM(tPreheatBGM,0.2,nil,true)
    end
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject,function()
        self.HelpPop().gameObject:SetActive(true)
    end)
    UIEvent.LuaClick(self.Img_Mask3().gameObject,function()
        self.HelpPop().gameObject:SetActive(false)
    end)
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---收藏按钮
    UIEvent.LuaClick(self.Btn_ClickMap().gameObject,function()
        self.Map().gameObject:SetActive(true)
    end,nil,self.Btn_ClickMap())
    ---关闭收藏界面
    UIEvent.LuaClick(self.Map_mask().gameObject,function()
        self.Map().gameObject:SetActive(false)
    end)
    ---地图收藏
    UIEvent.LuaClick(self.Photo_mask().gameObject,function()
        if self.mActiveItemID > 0 then
            ShopViewModel.SendBuyGoods({ self.mActiveItemID, 1 },function()
                self.mActiveItemID = 0
                self.PhotoPanel().gameObject:SetActive(false)

                self.mCurNewItemm.gameObject:SetActive(false)
                self.mCurPhoto.gameObject:SetActive(true)
                self.mCurPhotoItem.gameObject:SetActive(true)
                ---红点检测
                self:CheckRedDot()
            end)
        else
            self.PhotoPanel().gameObject:SetActive(false)
        end
    end)
    ---签到抽奖按钮
    UIEvent.LuaClick(self.Btn_Ticket().gameObject,function()
        if self.mSignCount <= 0 then
            ---未能签到时给提示
            if self.img_event4_ticket_R().gameObject.activeSelf then
                MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetLanguageByKey("ui_daqijiu_txt2"),1 },true)
            end
            return
        end
        self.Balloon().gameObject:SetActive(true)
    end)
    ---签到气球
    local tSignBtn = { self.Img_balloon_b(),self.Img_balloon_p(),self.Img_balloon_o() }
    for i = 1, #tSignBtn do
        UIEvent.LuaClick(tSignBtn[i].gameObject,function()
            Event4Control.Sign(function()
                ---清空该按钮的监听
                UIEvent.ClearFun(tSignBtn[i].gameObject)
                ---签到完成
                self.Balloon().gameObject:SetActive(false)

                self.mSignComplete = true
                --self:CheckVigor()
                ---红点检测
                self:CheckRedDot()
                ---更新地图
                self:UpdataMap()
            end)
        end)
    end
end

---体力查询
function M:CheckVigor()
    local CostVigor = TaskControl.dayStatistics[tonumber(SteamLocalData.tab[109004][2])]
    ---签到次数上限
    local tSignLimit = tonumber(SteamLocalData.tab[122000][2])
    ---每日体力消耗上限
    local Limit = tonumber(SteamLocalData.tab[122001][2])
    if CostVigor then
        CostVigor = CostVigor > Limit and Limit or CostVigor
    else
        CostVigor = 0
    end
    self.Text_Shuzi1().text = CostVigor
    self.Text_Shuzi2().text = SteamLocalData.tab[122001][2]
    
    ---今日已签到次数
    local tSignCount = Event4Control.GetTodaySign()
    ---今日可签到次数
    self.mSignCount = math.modf(CostVigor/Limit)-tSignCount
    
    ---检测今天是否用尽签到次数
    if tSignCount >= tSignLimit then
        self.img_event4_ticket_R().gameObject:SetActive(false)
    end
end
---角色对话
function M:SetDialog()
    local tDialogData = Event4Control.GetDialogData()
    --添加音效
    MgrSound.AddCue("Audio/role/".. tDialogData.talkRoleA..".acb")
    
    self.Text_Name().text = tDialogData.nameA
    self.Text_Dialog().text = tDialogData.talkDataA[7]
    self.Img_Role().transform.anchoredPosition = Vector2(tonumber(tDialogData.positionAx),tonumber(tDialogData.positionAy))
    ---角色语音
    MgrSound.PlayRole(tDialogData.talkDataA[13], nil, nil, false, 0, 0,nil)
end
---更新地图
function M:UpdataMap()
    for i = 1, #self.mPreheaData do
        local tItem = self.MapPanel().transform:Find("item"..i)
        if tItem == nil then
            break
        end
        local photo = tItem.transform:Find("Btn_photo").gameObject
        local Img_Photo = tItem.transform:Find("img_event4_bg"):GetComponent("Image")
        local newItem = tItem.transform:Find("Btn_new").gameObject
        local questionItem = tItem.transform:Find("Btn_question").gameObject
        
        ---检测是否拥有激活道具
        local NewItemData = ItemControl.GetItemByIdAndType(self.mPreheaData[i].SpecialAward.goodsID,self.mPreheaData[i].SpecialAward.goodsType)
        local PhotoItemData = ItemControl.GetItemByIdAndType(self.mPreheaData[i].ShowAward.goodsID,self.mPreheaData[i].ShowAward.goodsType)
        ---收藏图
        MgrRes.LoadSprite(Img_Photo,PhotoItemData.icon)
        if PhotoItemData.goods.goodsNum > 0 then
            newItem:SetActive(false)
            questionItem:SetActive(false)
        elseif NewItemData.goods.goodsNum > 0 then
            newItem:SetActive(true)
            photo:SetActive(false)
            questionItem:SetActive(false)
            Img_Photo.gameObject:SetActive(false)
            ---展开收藏图
            UIEvent.LuaClick(newItem,function()
                MgrRes.LoadSprite(self.img_event4_bg06(),PhotoItemData.icon)
                self.Text_Shuoming().text = PhotoItemData.txt
                self.PhotoPanel().gameObject:SetActive(true)
                
                self.mActiveItemID = self.mPreheaData[i].ShopID
                self.mCurPhoto = Img_Photo
                self.mCurPhotoItem = photo.gameObject
                self.mCurNewItemm = newItem
            end)
        else
            photo:SetActive(false)
            newItem:SetActive(false)
            Img_Photo.gameObject:SetActive(false)
        end
        ---展开收藏图
        UIEvent.LuaClick(photo,function()
            MgrRes.LoadSprite(self.img_event4_bg06(),PhotoItemData.icon)
            self.Text_Shuoming().text = PhotoItemData.txt
            self.PhotoPanel().gameObject:SetActive(true)
        end)
    end
end

---红点检测
function M:CheckRedDot()
    Event4Control.CheckRedDot()

    ---签到红点
    local tCurDotState = RedDotControl.GetDotData("Event4PreSign"):GetCurDotState()
    self.TicketRedDotIcon().gameObject:SetActive(tCurDotState)
    ---藏品红点
    tCurDotState = RedDotControl.GetDotData("Event4PreMap"):GetCurDotState()
    self.MapRedDotIcon().gameObject:SetActive(tCurDotState)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M