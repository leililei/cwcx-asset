-- Code Auto Create Begin
local M = Class('NewPostMail_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewPostMail_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewPostMail_UI].prefab'
    self.Name = 'Form[NewPostMail_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Bg','Img_Bg',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_Back','UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftBtnPanel/Btn_I',2},{'MainContentBtnPanel','MainContentBtnPanel',2},{'RecieveBtnPanel','MainContentBtnPanel/RecieveBtnPanel',2},{'Btn_Check','MainContentBtnPanel/RecieveBtnPanel/Btn_Check',2},{'Btn_Delete','MainContentBtnPanel/RecieveBtnPanel/Btn_Delete',2},{'MailMainContentPanel','MailMainContentPanel',2},{'Img_Xian1','MailMainContentPanel/Img_Xian1',2},{'Img_Xian2','MailMainContentPanel/Img_Xian2',2},{'Img_Youjianicon','MailMainContentPanel/Panel/Img_Youjianicon',2},{'Btn_Shoucang','MailMainContentPanel/Panel/Btn_Shoucang',2},{'ScrollView','MailMainContentPanel/Scroll View',2},{'Viewport','MailMainContentPanel/Scroll View/Viewport',2},{'ScrollbarVertical','MailMainContentPanel/Scroll View/ScrollbarVertical',2},{'Handle','MailMainContentPanel/Scroll View/ScrollbarVertical/SlidingArea/Handle',2},{'FengeShort','MailMainContentPanel/FengeShort',2},{'MailRewardPrefab','MailMainContentPanel/RewardPanel/MailRewardPrefab',2},{'RewardRoot','MailMainContentPanel/RewardPanel/RewardRoot',2},{'MailContentPanel','MailContentPanel',2},{'MailPrefab','MailContentPanel/MailScroll/MailPrefab',2},{'MailRoot','MailContentPanel/MailScroll/MailRoot',2},{'EmptyIcon','MailContentPanel/EmptyIcon',2},{'MailBtnPanel','MailContentPanel/MailBtnPanel',2},{'Btn_RecieveAll','MailContentPanel/MailBtnPanel/Btn_RecieveAll',2},{'Btn_DelAllReaded','MailContentPanel/MailBtnPanel/Btn_DelAllReaded',2},{'ShoucangMailPanel','ShoucangMailPanel',2},{'BlurMask','ShoucangMailPanel/BlurMask',2},{'Tanchuangdi','ShoucangMailPanel/Tanchuangdi',2},{'Image','ShoucangMailPanel/Tanchuangdi/Image',2},{'EmptyIcon2','ShoucangMailPanel/EmptyIcon2',2},{'MailBirthdayPrefab','ShoucangMailPanel/ShoucangMailScroll/MailBirthdayPrefab',2},{'MailRoot01','ShoucangMailPanel/ShoucangMailScroll/MailRoot',2},{'ShoucangMailMain','ShoucangMailPanel/ShoucangMailMain',2},{'ScrollView01','ShoucangMailPanel/ShoucangMailMain/Scroll View',2},{'Viewport01','ShoucangMailPanel/ShoucangMailMain/Scroll View/Viewport',2},{'ScrollbarVertical01','ShoucangMailPanel/ShoucangMailMain/Scroll View/Scrollbar Vertical',2},{'Handle01','ShoucangMailPanel/ShoucangMailMain/Scroll View/Scrollbar Vertical/Sliding Area/Handle',2},{'ScrollbarVertical02','ShoucangMailPanel/ShoucangMailMain/ScrollbarVertical',2},{'Handle02','ShoucangMailPanel/ShoucangMailMain/ScrollbarVertical/SlidingArea/Handle',2},{'FengeShort01','ShoucangMailPanel/ShoucangMailMain/FengeShort',2},{'BithdayrRewardPanel','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel',2},{'RewardPrefab','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab',2},{'ItemKuangImg','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemKuangImg',2},{'Img_Xingdi','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/Img_Xingdi',2},{'ItemIcon','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemIcon',2},{'VFXItem','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/VFXItem',2},{'Img_Xing(hui)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui)',2},{'Img_Xing(hui)(1)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui) (1)',2},{'Img_Xing(hui)(2)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui) (2)',2},{'Img_Xing(hui)(3)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui) (3)',2},{'Img_Xing(hui)(4)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui) (4)',2},{'Img_Xing(hui)(5)','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/EmptyStarPanel/Img_Xing(hui) (5)',2},{'StarPrefab','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/StarPrefab',2},{'ItemCountBg','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemCountBg',2},{'ItemTimeBg','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemTimeBg',2},{'shijianicon','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemTimeBg/shijianicon',2},{'RewardRecievedImg','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/RewardRecievedImg',2},{'RewardRoot01','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardRoot',2},{'Img_Youjianicon01','ShoucangMailPanel/MailContent/Img_Youjianicon',2},{'Img_Biaotixian','ShoucangMailPanel/Text_Name/Img_Biaotixian',2},{'Img_Xian201','ShoucangMailPanel/Img_Xian2',2},{'Img_Xian101','ShoucangMailPanel/Img_Xian1',2},
        -- UITemplate 列表
        {'MailRewardPrefab01','MailMainContentPanel/RewardPanel/MailRewardPrefab',10},{'MailPrefab01','MailContentPanel/MailScroll/MailPrefab',10},{'MailBirthdayPrefab01','ShoucangMailPanel/ShoucangMailScroll/MailBirthdayPrefab',10},
        -- RawImage 列表
        {'RewardPanel','MailMainContentPanel/RewardPanel',15},{'MailScroll','MailContentPanel/MailScroll',15},{'ShoucangMailScroll','ShoucangMailPanel/ShoucangMailScroll',15},
        -- LoopScrollRect 列表
        {'RewardPanel01','MailMainContentPanel/RewardPanel',18},{'MailScroll01','MailContentPanel/MailScroll',18},{'ShoucangMailScroll01','ShoucangMailPanel/ShoucangMailScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Mail_CN','UpperLeftBtnPanel/Text_Mail/Text_Mail_CN',20},{'Text_Mail_EN','UpperLeftBtnPanel/Text_Mail/Text_Mail_EN',20},{'Btn_Txt','MainContentBtnPanel/RecieveBtnPanel/Btn_Check/Btn_Txt',20},{'Btn_Txt01','MainContentBtnPanel/RecieveBtnPanel/Btn_Delete/Btn_Txt',20},{'MailCountNameTxt','MailMainContentPanel/Panel/MailCountNameTxt',20},{'MailCountTxt','MailMainContentPanel/Panel/MailCountTxt',20},{'Btn_Txt02','MailMainContentPanel/Panel/Btn_Shoucang/Btn_Txt',20},{'SenderNameTxt','MailMainContentPanel/SenderNameTxt',20},{'MailTitleTxt','MailMainContentPanel/MailTitleTxt',20},{'MailContentTxt','MailMainContentPanel/Scroll View/Viewport/MailContentTxt',20},{'Text_Wuyoujian','MailContentPanel/EmptyIcon/Text_Wuyoujian',20},{'Btn_Txt03','MailContentPanel/MailBtnPanel/Btn_RecieveAll/Btn_Txt',20},{'Btn_Txt04','MailContentPanel/MailBtnPanel/Btn_DelAllReaded/Btn_Txt',20},{'Text_Wuyoujian01','ShoucangMailPanel/EmptyIcon2/Text_Wuyoujian',20},{'MailTitleTxt01','ShoucangMailPanel/ShoucangMailMain/MailTitleTxt',20},{'SenderNameTxt01','ShoucangMailPanel/ShoucangMailMain/SenderNameTxt',20},{'MailContentTxt01','ShoucangMailPanel/ShoucangMailMain/Scroll View/Viewport/MailContentTxt',20},{'RewardCountTxt','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemCountBg/RewardCountTxt',20},{'Text_Time','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/item/ItemTimeBg/Text_Time',20},{'Text_Yilingqu','ShoucangMailPanel/ShoucangMailMain/BithdayrRewardPanel/RewardPrefab/RewardRecievedImg/Text_Yilingqu',20},{'MailCountNameTxt01','ShoucangMailPanel/MailContent/MailCountNameTxt',20},{'MailCountTxt01','ShoucangMailPanel/MailContent/MailCountTxt',20},{'Text_Name','ShoucangMailPanel/Text_Name',20},
    }
end
-- Code Auto Create End
require("LocalData/MailLocalData")
function M:OnInit()
    self.RewardPanel01():SetLuaCellEvent(Handle(self,self.MailCell))
    self.MailRewardPrefab().gameObject:SetActive(false)
    self.ShoucangMailPanel().gameObject:SetActive(false)
    ---@type MailData
    self.CurSelectMail = nil
    self.CurSelectBirthdayMail = nil
    self.CurIndex = 0
    self.CurBirthdayIndex = 1
    self.MailOverdueTime = ""
    self.MailBirthdayOverdueTime = ""
    self.isRecieved = false
    self.isBirthdayRecieved = false
    self:InitButton()
    --self:InitUpperBtnPanel()
    self:InitScroll()
    self:InitBrithdayScroll()
    self:UpdataMailCount()
    self.RewardPrefab().gameObject:SetActive(false)
    if #PostMailViewModel.MailCaCheData == 0 then
        self.EmptyIcon().gameObject:SetActive(true)
        self:ClearDetail()
    else
        self.EmptyIcon().gameObject:SetActive(false)
        self.CurSelectMail = PostMailViewModel.MailCaCheData[1]
        self.CurSelectMail.isSelect = true
        self.CurIndex = 1
        if self.CurSelectMail.eTime == 0 then
            self.MailOverdueTime = MgrLanguageData.GetLanguageByKey("newpostmail_ui_indefinite")
        else
            self.MailOverdueTime = PostMailViewModel.TimeDiff(os.time(),self.CurSelectMail.eTime,0)
        end
        ---是否过期
        self.isOverdue = Global.GetCurTime() >= self.CurSelectMail.eTime
        self:ResetItem()
        self:InitMailDetail()
    end
    ---隐藏UI
    --self.PowerDetail().gameObject:SetActive(false)
    ---注册玩家属性变更通知
    PlayerControl.AddNotify(Handle(self,self.RefreshPower))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:OnBackKey()
    if self.ShoucangMailPanel().gameObject.activeSelf then
        self.ShoucangMailPanel().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        PostMailViewModel.Close()
    end
end

function M:OnShowFinish()
    NoviceViewModel.CheckFirstGuide(40)
    ---刷新体力
    self:RefreshPower()
    MgrUI.UnLock("OpenMail")
end
function M:InitScroll()
    self.MailScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self:ResetItem(0)
end
require("LocalData/MailLocalData")
--初始化生日邮件
function M:InitBrithdayScroll()
    self.ShoucangMailScroll01():SetLuaCellEvent(Handle(self,self.CellBirthdayItem))
    self:ResetBirthdayItem(0)

    self:OnClickMailBirthday(self.CurBirthdayLoopList[1],1,MailLocalData.tab[self.CurBirthdayLoopList[1]])
end

function M:UpdataMailCount()
    if PostMailViewModel.MailCaCheData then
        self.MailCountTxt().text ="<color=#FFFFFF>".. #PostMailViewModel.MailCaCheData.."</color>".."/100"
        --注释
        --self.NewMailRestTxt().text = #PostMailViewModel.GetUnReadMail()
    else
        self.MailCountTxt().text ="<color=#FFFFFF>".. "0".."</color>".."/100"
        --注释
        --self.NewMailRestTxt().text = 0
    end
    --生日邮件
    if PostMailViewModel.MailBirthdayCaCheData then
        self.MailCountTxt01().text ="<color=#000000>".. #PostMailViewModel.MailBirthdayCaCheData.."</color>"
        --注释
        --self.NewMailRestTxt().text = #PostMailViewModel.GetUnReadMail()
    else
        self.MailCountTxt01().text ="<color=#000000>".. "0".."</color>"
        --注释
        --self.NewMailRestTxt().text = 0
    end
end
---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self,idx})
end

---生日回调
function M:CellBirthdayItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurBirthdayLoopList[idx],self,idx})
end

---设置滑动数据
function M:ResetItem(offset)
    ---获取当前loop数据
    self.CurLoopList = PostMailViewModel.MailCaCheData
    --生日邮件封装为普通邮件TODO
    -- local mailNormal = PostMailViewModel.MailBirthdayUnCaCheData
    -- local tab = {}
    -- for index, value in ipairs(mailNormal) do
    --     local t = {}
    --     t.name = ""
    --     t.content = ""
    --     t.goods = self:GoodsToTable(value)
    --     t.emailParam = ""
    --     t.status = 1
    --     t.id = value
    --     t.gTime = 0
    --     t.headIcon = ""
    --     t.title = ""
    --     t.type = 3
    --     t.eTime = 0
    --     --table.insert(self.CurLoopList,t)
    -- end

    ---设置Loop数量
    if self.CurLoopList then
        self.MailScroll01().totalCount = #self.CurLoopList
    end
    
    if offset then
        self.MailScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.MailScroll01():RefreshCells()               ---只刷新数据
    end
end



--商品字符串转表结构
function M:GoodsToTable(goodsID)
    local goods = {}
    local strs = string.split(MailLocalData.tab[goodsID],',')
    for index, value in ipairs(strs) do
        local t = string.split(value,'_')
        local tab = {}
        tab.goodsNum = tonumber(t[3])
        tab.goodsType = tonumber(t[1])
        tab.goodsID = tonumber(t[2])
        table.insert(goods,tab)
    end
    return goods
end

---设置生日滑动数据
function M:ResetBirthdayItem(offset)
    local mailNormal = PostMailViewModel.MailBirthdayCaCheData --普通邮件
    --local unGetMail = --没有领取的生日邮件

    ---获取当前loop数据
    self.CurBirthdayLoopList = PostMailViewModel.MailBirthdayCaCheData
    ---设置Loop数量
    if self.CurBirthdayLoopList then
        self.ShoucangMailScroll01().totalCount = #self.CurBirthdayLoopList
    end
    if #self.CurBirthdayLoopList <= 0 then
        self.EmptyIcon2().gameObject:SetActive(true)
        self.ShoucangMailMain().gameObject:SetActive(false)
    else
        self.EmptyIcon2().gameObject:SetActive(false)
        self.ShoucangMailMain().gameObject:SetActive(true)
    end

    if offset then
        self.ShoucangMailScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.ShoucangMailScroll01():RefreshCells()               ---只刷新数据
    end
end
---初始化玩家资源
--function M:InitUpperBtnPanel()
--    self.itemCountObj =
--    {
--        [100001] = self.ItemCoinText(),
--        [100000] = self.ItemZSText()
--    }
--    local itemCoin = ItemControl.GetItemByID(100001)
--    local itemZs = ItemControl.GetItemByID(100000)
    --self.ItemZSText().text = itemZs.count
    --self.ItemCoinText().text = itemCoin.count
--end
---@param goods goods
function M:UpdataUpperCount(goods)
    for i, v in pairs(goods) do
        if self.itemCountObj[v.goodsID] then
            local CostCount =self.itemCountObj[v.goodsID]
            local item = ItemControl.GetItemByID(v.goodsID)
            if item.count then
                CostCount.text = item.count
            else
                CostCount.text = 0
            end
        end
    end
end
---初始化按钮
function M:InitButton()
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        PostMailViewModel.Close()
    end))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(73)
    end))

    --收藏栏
    UIEvent.LuaClick(self.Btn_Shoucang().gameObject,Handle(self,function()
        self.ShoucangMailPanel().gameObject:SetActive(true)
        CJNUIMgr.GetSunUseName(self.MailMainContentPanel().gameObject,"VFXMask").transform:GetComponent("SpriteMask").enabled = false
    end))
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,function()
        self.ShoucangMailPanel().gameObject:SetActive(false)
        CJNUIMgr.GetSunUseName(self.MailMainContentPanel().gameObject,"VFXMask").transform:GetComponent("SpriteMask").enabled = true
    end))
    --UIEvent.LuaClick(self.AddZS().gameObject, Handle(self, ShopViewModel.JumpToShopUI),1)
    --UIEvent.LuaClick(self.AddCoin().gameObject, Handle(self, ShopViewModel.JumpToShopUI),2)
    --注释
    UIEvent.LuaClick(self.Btn_Check().gameObject,Handle(self,function ()
    --有值说明是生日邮件
        local isBirthday = 0 --0:普通邮件 1：生日邮件
        local mainBirthday = MailLocalData.tab[self.CurSelectMail.id]
        if mainBirthday then
            isBirthday = 1
        end
        if self:CheckOverdue() and mainBirthday == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_tips1"),1},true)
            return
        end
        PostMailViewModel.EmailGoodsClick(self.CurSelectMail.id,isBirthday,Handle(self,self.GoodsMailACK),Handle(self,self.GoodsMailNTF))
    end))
    UIEvent.LuaClick(self.Btn_RecieveAll().gameObject,Handle(self,function ()
        if #PostMailViewModel.GetRewardMail() > 0 then
            PostMailViewModel.EmailALLGoodsClick(Handle(self,self.GoodsALLMailACK),Handle(self,self.GoodsALLMailNTF))
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_tips2"),1},true)
        end
    end))
    --注释
    UIEvent.LuaClick(self.Btn_Delete().gameObject,Handle(self,function ()
        if self.CurSelectMail.type == 1 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_tips3"),1},true)
            return
        else
            PostMailViewModel.EmailDeleteClick(self.CurSelectMail.id,Handle(self,self.DeleteMailACK),Handle(self,self.DeleteMailNTF))
        end
    end))
    UIEvent.LuaClick(self.Btn_DelAllReaded().gameObject,Handle(self,function ()
        if #PostMailViewModel.GetReadedMail() > 0 then
            PostMailViewModel.EmailDeleteALLClick(Handle(self,self.DeleteALLMailACK),Handle(self,self.DeleteALLMailNTF))
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_tips4"),1},true)
        end
    end))
    ---长按体力
    --UIEvent.LuaPressClick(self.ItemTili().gameObject,Handle(self, function ()
    --    MgrTimer.Cancel("MailPressPower")
    --    self.PowerDetail().gameObject:SetActive(true)
    --    MgrTimer.AddRepeat("MailPressPower",0,function()
    --        if UIEvent.GetButton_Up() == false  then
    --            self.PowerDetail().gameObject:SetActive(false)
    --        end
    --    end,-1,nil)
    --end))
    ---跳转体力信息面板
    --UIEvent.LuaClick(self.Btn_AddTili().gameObject, Handle(self, function()
    --    MgrUI.Pop(UID.VigorInfoPanel,{nil},true)
    --end))
end

---点击邮件方法
function M:OnClickMail(email,index,time)
    if self.CurSelectMail then
        self.CurSelectMail.isSelect = false
    end
    self.CurIndex = index
    self.CurSelectMail = email
    self.CurSelectMail.isSelect = true
    self.MailOverdueTime = time
    self:ResetItem()
    self:InitMailDetail()
end

---点击生日邮件方法
function M:OnClickMailBirthday(email,index,data)
    if self.CurSelectBirthdayMail then
        self.CurSelectBirthdayMail.isSelect = false
    end
    self.CurBirthdayIndex = index
    self.CurSelectBirthdayMail = data
    --self.CurSelectBirthdayMail.isSelect = true
    --self.MailBirthdayOverdueTime = time
    self:ResetBirthdayItem()
    self:InitMailBirthdayDetail()
end

---更新生日邮件详情
function M:InitMailBirthdayDetail()
    if self.CurSelectBirthdayMail == nil then
       return
    end
    self.isRecieved = false
    if self.CurSelectBirthdayMail.goods then
        -- self.RecieveBtnPanel().gameObject:SetActive(true)
        -- self.RewardPanel().gameObject:SetActive(true)
        -- if self.CurSelectMail.status == 0 or self.CurSelectMail.status == 1 then
        --     --未领取
        --     --注释
        --     --self.Btn_CheckHighLight().gameObject:SetActive(true)
        --     self.Btn_Check().gameObject:SetActive(false)
        -- elseif self.CurSelectMail.status == 2 then
        --     --已领取
        --     self.Btn_CheckHighLight().gameObject:SetActive(false)
        --     self.Btn_Check().gameObject:SetActive(true)
        --     self.isRecieved = true
        -- end

        local goods = {}
        local strs = string.split(self.CurSelectBirthdayMail.goods,',')
        for index, value in ipairs(strs) do
            local t = string.split(value,'_')
            local tab = {}
            tab.goodsNum = tonumber(t[3])
            tab.goodsType = tonumber(t[1])
            tab.goodsID = tonumber(t[2])
            table.insert(goods,tab)
        end

        -- self.CurSelectBirthdayMail.goods = goods
        Tools.ClearAllChild(self.RewardRoot01().gameObject)
        if self.CurSelectBirthdayMail.goods then
            for i, v in pairs(goods) do
                local item = ItemControl.GetItemByType(v.goodsType,v.goodsID)
                if item == nil then
                    return
                end
                local obj = self:CreatGo(self.RewardPrefab().gameObject,self.RewardRoot01().gameObject)               --邮件附件预制件
                local ItemIcon = obj.transform:Find("item/ItemIcon"):GetComponent("Image")
                local VFXItem = obj.transform:Find("item/VFXItem"):GetComponent("Image")
                local ItemKuangImg = obj.transform:Find("item/ItemKuangImg"):GetComponent("Image")                  --物品框
                local ItemCountTxt = obj.transform:Find("item/ItemCountBg/RewardCountTxt"):GetComponent("TextMeshProUGUI")
                local StartRoot = obj.transform:Find("item/StarPanel").gameObject
                local StartPrefab = obj.transform:Find("item/StarPrefab").gameObject
                local RewardRecievedImg = obj.transform:Find("RewardRecievedImg").gameObject
                local Text_Time = obj.transform:Find("item/ItemTimeBg/Text_Time"):GetComponent("TextMeshProUGUI")
                local CanvasGroup = obj.transform:Find("item"):GetComponent("CanvasGroup")
                local EmptyStarPanel = obj.transform:Find("item/EmptyStarPanel").gameObject
                local Img_Xingdi = obj.transform:Find("item/Img_Xingdi").gameObject
                StartPrefab:SetActive(false)

                --带动画勋章
                if item.anime and item.anime ~= "0" then
                    Tools.ClearAllChild(VFXItem.gameObject)
                    ItemIcon.color = Color(ItemIcon.color.r,ItemIcon.color.g,ItemIcon.color.b,0)
                    self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
                    MgrRes.GetPrefab(self.vfx_path..item.anime..".prefab",function(Obj)
                        if Obj == nil then return end
                        Obj.transform:SetParent(VFXItem.gameObject.transform)
                        Obj.transform.localPosition = Vector3.zero
                        Obj.transform.localScale = Vector3(21,21,1)
                    end)
                else
                    Tools.ClearAllChild(VFXItem.gameObject)
                    MgrRes.LoadSprite(ItemIcon,"Item/"..item.icon)
                end

                MgrRes.LoadSprite(ItemKuangImg,"Item/Rank/ItemRank_"..item.quality)
                if item.quality == 1 or item.quality == 2 then
                    ItemKuangImg.transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
                elseif item.quality == 3 then
                    ItemKuangImg.transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
                elseif item.quality == 4 then
                    ItemKuangImg.transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
                end
                ItemCountTxt.text = JNStrTool.numberAbbr(v.goodsNum) --(v.goodsNum >= 10000 and math.floor(tonumber(v.goodsNum)/1000).."K" or v.goodsNum)
                if self.CurSelectBirthdayMail.eTime == 0 then
                    Text_Time.text = self.MailOverdueTime
                else
                    Text_Time.text = self.MailOverdueTime..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
                end
                if item.itemstar > 0  then
                    StartRoot:SetActive(true)
                    EmptyStarPanel:SetActive(true)
                    Img_Xingdi:SetActive(true)
                    self:InitStar(StartRoot,StartPrefab,item.itemstar)
                else
                    StartRoot:SetActive(false)
                    EmptyStarPanel:SetActive(false)
                    Img_Xingdi:SetActive(false)
                end
                -- if self.isRecieved then
                --     RewardRecievedImg:SetActive(true)
                --     CanvasGroup.alpha = 0.5
                -- else
                --     RewardRecievedImg:SetActive(false)
                --     CanvasGroup.alpha = 1
                -- end

                RewardRecievedImg:SetActive(true)
                CanvasGroup.alpha = 0.5
                ---隐藏UI
                obj.transform:Find("item/ItemTimeBg").gameObject:SetActive(false)
                UIEvent.LuaClick(obj,Handle(self,function ()
                    local BagItem = ItemControl.GetItemByIdAndType(item.id,v.goodsType)
                    MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem,false,function() end},true)
                end))
            end
        end
    else
        self.RecieveBtnPanel().gameObject:SetActive(false)
        self.RewardPanel().gameObject:SetActive(false)
    end

    if string.match(self.CurSelectBirthdayMail.title,MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips1")) then
        self.MailTitleTxt01().text = string.format(MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips2"),self.CurSelectBirthdayMail.emailParam)
    else
        self.MailTitleTxt01().text = self.CurSelectBirthdayMail.title
    end
    self.SenderNameTxt01().text =MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips3")..self.CurSelectBirthdayMail.name
    self.MailContentTxt01().text =self.CurSelectBirthdayMail.txt--string.gsub(self.CurSelectBirthdayMail.content, "%b{}",self.CurSelectBirthdayMail.emailParam)
    --注释
    -- if self.CurSelectMail.type == 1 then
    --     self.Btn_Del().gameObject:SetActive(false)
    -- else
    --     self.Btn_Del().gameObject:SetActive(true)
    -- end
    if self.CurSelectBirthdayMail.status == 0 then
        PostMailViewModel.EmailLookClick(self.CurSelectBirthdayMail.id,Handle(self,self.LookMailACK),Handle(self,self.LookMailNTF))
    end

end


---更新邮件详情
function M:InitMailDetail()
    self.isRecieved = false
    if self.CurSelectMail.goods then
        self.RecieveBtnPanel().gameObject:SetActive(true)
        self.RewardPanel().gameObject:SetActive(true)
        if self.CurSelectMail.status == 0 or self.CurSelectMail.status == 1 then
            --未领取
            --注释
            --self.Btn_CheckHighLight().gameObject:SetActive(true)
            self.Btn_Check().gameObject:SetActive(true)
            self.Btn_Delete().gameObject:SetActive(false)
        elseif self.CurSelectMail.status == 2 then
            --已领取
            --self.Btn_CheckHighLight().gameObject:SetActive(false)
            self.Btn_Check().gameObject:SetActive(false)
            self.Btn_Delete().gameObject:SetActive(true)
            self.isRecieved = true
        end
        Tools.ClearAllChild(self.RewardRoot().gameObject)
        if self.CurSelectMail.goods then
            self:ReloadReward(0)
        end
    else
        Tools.ClearAllChild(self.RewardRoot().gameObject)
        self.RecieveBtnPanel().gameObject:SetActive(false)
        self.RewardPanel().gameObject:SetActive(false)
    end

    if string.match(self.CurSelectMail.title,MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips1")) then
        self.MailTitleTxt().text = string.format(MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips2"),self.CurSelectMail.emailParam)
    else
        self.MailTitleTxt().text = self.CurSelectMail.title
    end
    self.SenderNameTxt().text =MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips3")..self.CurSelectMail.name
    local emailPa = string.split(self.CurSelectMail.emailParam,"_")
    local content = self.CurSelectMail.content
    for i = 1, #emailPa do
        content =string.gsub(content, "%b{}",emailPa[i],1)
    end
    local strSub = {
        [1] = { "\\n","\n" },
        [2] = { "\\t","\t" },
        [3] = { "\\r","\r" },
        [4] = { "\\v","\v" },
        [5] = { "\\a","\a" },
        [6] = { "\\f","\f" },
        [7] = { "\\b","\b" },
        [8] = { "\\0","\0" },
    }
    for i = 1, #strSub do
        content = string.gsub(content,strSub[i][1],strSub[i][2])
    end
    self.MailContentTxt().text = content
    --注释
    -- if self.CurSelectMail.type == 1 then
    --     self.Btn_Del().gameObject:SetActive(false)
    -- else
    --     self.Btn_Del().gameObject:SetActive(true)
    -- end
    if self.CurSelectMail.status == 0 then
        PostMailViewModel.EmailLookClick(self.CurSelectMail.id,Handle(self,self.LookMailACK),Handle(self,self.LookMailNTF))
    end

end
----------------------------------------------------------
---查看邮件返回
function M:LookMailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailLookACK',buffer))
    print(tab.errNo)
end
function M:LookMailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailLookNTF',buffer))
    if tab.emailID then
        for i, v in pairs(tab.emailID) do
            MailControl.GetMailByID(v).status = 1
        end
    end
    self:UpdataMailCount()
    self:ResetItem()
end
----------------------------------------------------------
---获取奖励邮件返回
function M:GoodsMailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailGoodsACK',buffer))
    print(tab.errNo)
    if tab.errNo == 579 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("itemdetailpop_ui_tips1"),1},true)
    elseif tab.errNo == 650 then  --小月卡天数达到上限
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mailcontrol_tips2"),1},true)
    elseif tab.errNo == 651 then --当期通行证已解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mailcontrol_tips3"),1},true)
    end
end

function M:GoodsMailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailGoodsNTF',buffer))
    --如果领取的是生日邮件就从列表中移除TODO周一从这里开始
    local mailBirthday = MailLocalData.tab[tab.emailID]
    
    local tGoods = {}
    if tab.goods then
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        --self:UpdataUpperCount(tab.goods)
        for i, v in ipairs(tab.goods) do
            table.insert(tGoods,v)
        end
    end
    --限时道具
    if tab.limitGoods then
        ItemControl.PushLimitGoods(tab.limitGoods,ItemControl.PushEnum.add)
        for i, v in ipairs(tab.limitGoods) do
            table.insert(tGoods,v)
        end
    end

    if next(tGoods) ~= nil then
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tGoods},true)
    end
    
    if tab.vigor then
        PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    end
    ---刷新月卡状态
    if tab.card then
        PlayerControl.GetPlayerData().monthCardBuyTime = tab.card.buyTime
        PlayerControl.GetPlayerData().monthCardRemaining = tab.card.remaining
    end
    if nil ~= tab.cards then
        PlayerControl.GetPlayerData().newMonthCards = tab.cards;
    end
    ---刷新通行证状态
    if tab.bigCard then
        PassportControl.PushPassport(tab.bigCard.version,tab.bigCard.buyTime)
        if tab.bigCard.buyTime ~= 0 then
            PassportViewModel.SetPassesSeniorLock(true)
        end
        PlayerControl.GetPlayerData().bigMonthCardBuyTime = tab.bigCard.buyTime
        PlayerControl.GetPlayerData().bigMonthCardVersion = tab.bigCard.version
    end

    if tab.shops then
        ---推送商品购买次数
        ShopControl.PushGroupShopItem(tab.shops)
    end

    if mailBirthday then
        PostMailViewModel.SetMailBirthdayRedDotCaChe(mailBirthday.id)--添加红点缓存
        MailControl.DelMailById(tab.emailID)
        table.remove(PostMailViewModel.MailCaCheData,self.CurIndex)
        if #PostMailViewModel.MailCaCheData>0 then
            if self.CurIndex > 1 then
                self.CurIndex = self.CurIndex - 1
            else
                self.CurIndex = 1
            end
            self.CurSelectMail = PostMailViewModel.MailCaCheData[self.CurIndex]
            self.CurSelectMail.isSelect = true
            self:InitMailDetail()
            self.EmptyIcon().gameObject:SetActive(false)
        else
            self.EmptyIcon().gameObject:SetActive(true)
            self:ClearDetail()
        end
        self:ResetItem()
        table.insert(self.CurBirthdayLoopList,tab.emailID)
        self:InitBrithdayScroll()
        self:UpdataMailCount()
        --领取生日邮件删除生日邮件本地缓存
        
         for index, value in ipairs(PostMailViewModel.MailBirthdayUnCaCheData) do
            if value == tab.emailID then
                PostMailViewModel.MailBirthdayUnCaCheData[index] = {}
            end
         end
        return
    end

    if tab.emailID then
        MailControl.GetMailByID(tab.emailID).status = 2
    end

    self:ResetItem()
    self:InitMailDetail()
end
----------------------------------------------------------
---获取所有奖励邮件返回
function M:GoodsALLMailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailGoodsAllACK',buffer))
    print(tab.errNo)
    if tab.errNo == 650 then  --小月卡天数达到上限
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mailcontrol_tips2"),1},true)
    elseif tab.errNo == 651 then --当期通行证已解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mailcontrol_tips3"),1},true)
    end
end

function M:GoodsALLMailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailGoodsAllNTF',buffer))
    if tab.emailID then
        for i, v in pairs(tab.emailID) do
            MailControl.GetMailByID(v).status = 2
        end
    end

    local tGoods = {}
    if tab.goods then
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
        for i, v in ipairs(tab.goods) do
            table.insert(tGoods,v)
        end
        --self:UpdataUpperCount(tab.goods)
    end
    --限时道具
    if tab.limitGoods then
        ItemControl.PushLimitGoods(tab.limitGoods,ItemControl.PushEnum.add)
        for i, v in ipairs(tab.limitGoods) do
            table.insert(tGoods,v)
        end
    end
    if next(tGoods) ~= nil then
        ---弹出奖励窗口
        MgrUI.Pop(UID.ItemAchievePop_UI,{tGoods},true)
    end
    
    if tab.vigor then
        PlayerControl.GetPlayerData():PushVigor(tab.vigor)
    end
    ---刷新月卡状态
    if tab.card then
        PlayerControl.GetPlayerData().monthCardBuyTime = tab.card.buyTime
        PlayerControl.GetPlayerData().monthCardRemaining = tab.card.remaining
    end
    if nil ~= tab.cards then
        PlayerControl.GetPlayerData().newMonthCards = tab.cards;
    end
    ---刷新通行证状态
    if tab.bigCard then
        PassportControl.PushPassport(tab.bigCard.version,tab.bigCard.buyTime)
        if tab.bigCard.buyTime ~= 0 then
            PassportViewModel.SetPassesSeniorLock(true)
        end
        PlayerControl.GetPlayerData().bigMonthCardBuyTime = tab.bigCard.buyTime
        PlayerControl.GetPlayerData().bigMonthCardVersion = tab.bigCard.version
    end
    ---推送商品购买次数
    if tab.shops then
        ShopControl.PushGroupShopItem(tab.shops)
    end
    self:ResetItem()
    self:InitMailDetail()
end
----------------------------------------------------------
---删除邮件返回
function M:DeleteMailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailDeleteACK',buffer))
    print(tab.errNo)
    if tab.errNo~=0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newpostmail_ui_tips5"),1},true)
    end
end

function M:DeleteMailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailDeleteNTF',buffer))
    MailControl.DelMailById(tab.emailID)
    table.remove(PostMailViewModel.MailCaCheData,self.CurIndex)
    if #PostMailViewModel.MailCaCheData>0 then
        if self.CurIndex > 1 then
            self.CurIndex = self.CurIndex - 1
        else
            self.CurIndex = 1
        end
        self.CurSelectMail = PostMailViewModel.MailCaCheData[self.CurIndex]
        self.CurSelectMail.isSelect = true
        self:InitMailDetail()
        self.EmptyIcon().gameObject:SetActive(false)
    else
        self.EmptyIcon().gameObject:SetActive(true)
        self:ClearDetail()
    end
    self:UpdataMailCount()
    self:ResetItem()
end
----------------------------------------------------------
----------------------------------------------------------
---删除已读邮件返回
function M:DeleteALLMailACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailDeleteAllACK',buffer))
    print(tab.errNo)
end

function M:DeleteALLMailNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEmailDeleteAllNTF',buffer))
    for i, v in pairs(tab.emailID) do
        MailControl.DelMailById(v)
    end
    PostMailViewModel.ReLoadMailData()
    if #PostMailViewModel.MailCaCheData>0 then
        self.CurIndex = 1
        self.CurSelectMail = PostMailViewModel.MailCaCheData[self.CurIndex]
        self.CurSelectMail.isSelect = true
        self:InitMailDetail()
        self.EmptyIcon().gameObject:SetActive(false)
    else
        self.EmptyIcon().gameObject:SetActive(true)
        self:ClearDetail()
    end
    self:UpdataMailCount()
    self:ResetItem(0)
end
---
function M:ClearDetail()
    --self.Btn_CheckHighLight().gameObject:SetActive(false)
    self.Btn_Check().gameObject:SetActive(false)
    self.RewardPanel().gameObject:SetActive(false)
    --self.Btn_Del().gameObject:SetActive(false)
    self.MailTitleTxt().text = ""
    self.SenderNameTxt().text =""
    self.MailContentTxt().text =""
end

---创建一个物体
function M:CreatGo(_Prefab,_Root)
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

--创建星星
function M:CreatStar(_Root,_Prefab)
    local tempObj= GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x,tempObj.transform.localPosition.y,0)
end
--初始化星星
function M:InitStar(_Root,_Prefab,_Count)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("MailPowerClock")
    MgrTimer.Cancel("MailPressPower")
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("MailPowerClock")
    MgrTimer.Cancel("MailPressPower")
    if self.CurSelectMail then
        self.CurSelectMail.isSelect = false
    end
    local isAll = true
    --判断所有生日邮件是否都已读
    for index, value in ipairs(PostMailViewModel.MailBirthdayUnCaCheData) do
        if value and type(value) == "number" and self:IsIn(value) == -1 then
            isAll = false
        end
    end
    if #PostMailViewModel.GetUnReadMail() == 0 and isAll then
        RedDotControl.GetDotData("Mail"):SetState(false)
    else
        RedDotControl.GetDotData("Mail"):SetState(true)
    end
end

function M:IsIn(id)
    local t = -1
    for index, value in ipairs(PostMailViewModel.MailBirthdayRedDotCaChe) do
        if id == value then
            t = value
        end
    end
    return t
end

---刷新体力
function M:RefreshPower()
    ---如果当前界面已关闭不去刷新
    if self.UState == UIState.Hide or self.UState == UIState.Close then
        return
    end
    self.maxPower = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    self.curPower = PlayerControl.GetPlayerData().vigor.vigorNum
    --self.ItemTiliText().text = self.curPower.."/"..self.maxPower
    --self:InitClock()
end
--function M:InitClock()
--    MgrTimer.Cancel("MailPowerClock")
--    local DiffTime
--    if self.curPower < self.maxPower then
--        local NewTime = Global.GetCurTime()     ---当前服务器时间
--        DiffTime = NewTime - PlayerControl.GetPlayerData().vigor.vigorTime
--    end
--    ---时钟
--    self.curTime =  tonumber(SteamLocalData.tab[104004][2])
--    local tarHour,tarMin,tarSec = self:CheckTime()
--    local min = self.curTime / 60 - 1
--    local sec = 60
--    if DiffTime and DiffTime > 0 then
--        print("时间差+++++++++++++++",DiffTime)
--        local s = DiffTime % 60
--        local m = math.floor(DiffTime % 3600 / 60)
--        sec = sec - s
--        tarSec = 60 - s
--        tarMin = tarMin - m - 1
--        min = min - m
--    end
--    MgrTimer.AddRepeat("MailPowerClock", 1, Handle(self,function()
--        if self.curPower >= self.maxPower then
--            self.Text_TargetTime().text = "00:00:00"
--            self.Text_PowerClock().text = "00:00:00"
--            return
--        end
--        if sec == 0 then
--            min = min -1
--            sec = 60
--        end
--        if tarSec == 0 then
--            if tarMin > 0 then
--                tarMin = tarMin -1
--            else
--                tarMin = 0
--            end
--            tarSec = 60
--        end
--        if tarMin == 0 then
--            tarHour = tarHour - 1
--            if tarHour >= 0 then
--                tarMin = 59
--            else
--                tarHour = 0
--                tarMin = 0
--                tarSec = 0
--            end
--        end
--        if min == -1 then
--            PlayerControl.GetPlayerData().vigor.vigorNum = PlayerControl.GetPlayerData().vigor.vigorNum + 1
--            self.maxPower = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
--            self.curPower = PlayerControl.GetPlayerData().vigor.vigorNum
--            self.Text_Dunbishu().text =self.curPower.."/"..self.maxPower
--            self:RefreshCoinCount()
--            min = self.curTime/60 - 1
--        end
--        sec = sec - 1
--        tarSec = tarSec -1
--        self.Text_PowerClock().text = string.format("%02d:%02d:%02d",0,min,sec)
--        self.Text_TargetTime().text =  string.format("%02d:%02d:%02d",tarHour,tarMin,tarSec)
--    end) , -1, nil)
--end

function M:CheckTime()
    local tiLi =self.maxPower - self.curPower     --要恢复的体力
    if tiLi<=0 then
        return 0,0,0
    end
    local ts = tiLi * 300
    local seconds = ts % 60
    local min = math.modf(ts % 3600 / 60)
    local hour = math.floor(ts/3600)
    return hour,min,seconds
end

---检查是否过期
function M:CheckOverdue()


    if Global.GetCurTime() >= self.CurSelectMail.eTime then
        return true
    end
    return false
end

function M:MailCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.rewardList[idx],self})
end

function M:ReloadReward(offset)
    self.rewardList = self.CurSelectMail.goods
    self.RewardPanel01().totalCount = #self.rewardList
    if offset then
        self.RewardPanel01():RefillCells(offset)
    else
        self.RewardPanel01():RefreshCells()
    end
end

return M