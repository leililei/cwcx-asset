-- Code Auto Create Begin
local M = Class('NewRoleLevelUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewRoleLevelUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewRoleLevelUpgrade_UI].prefab'
    self.Name = 'Form[NewRoleLevelUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleLvUpPanel','RoleLvUpPanel',2},{'shuxingdi','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/shuxingdi',2},{'icondi1','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/icondi1',2},{'icondi2','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/icondi2',2},{'HpIcon','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/HpIcon',2},{'AtkIcon','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/AtkIcon',2},{'ZhiYuanIcon','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/ZhiYuanIcon',2},{'>','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/HpPanel/PreviewHpText/>',2},{'>01','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/AtkPanel/PreviewAtkSupportText/>',2},{'Panel_UpgradeNeed','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed',2},{'fenggexian','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/fenggexian',2},{'Img_Daojudi','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Img_Daojudi',2},{'Img_Shiyongshuliangdi','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Img_Shiyongshuliangdi',2},{'Lvdi','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Lvdi',2},{'Btn_MaxLv','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Lvdi/Btn_MaxLv',2},{'lvmindi','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/lvmindi',2},{'Btn_MinLv','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/lvmindi/Btn_MinLv',2},{'Btn_LvDownHighLight','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvDownHighLight',2},{'-(hei)2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvDown','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvDown',2},{'-(hui)2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvDown/-(hui)2',2},{'Btn_LvUpHighLight','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvUpHighLight',2},{'+(hei)2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvUpHighLight/+(hei)2',2},{'Btn_LvUp','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvUp',2},{'+(hui)2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Btn_LvUp/+(hui)2',2},{'Upitem1','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1',2},{'RewardRankImg','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/RewardRankImg',2},{'RewardIconImg','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/RewardIconImg',2},{'StarPanel','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel',2},{'ItemStarRoot','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarPrefab',2},{'HighLight','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_ItemCountBg',2},{'TimeCountDownPanel','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/TimeCountDownPanel',2},{'shijian2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/TimeCountDownPanel/shijian2',2},{'Img_Jiaobiao1','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_Jiaobiao1',2},{'Upitem2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2',2},{'RewardRankImg01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/RewardRankImg',2},{'RewardIconImg01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/RewardIconImg',2},{'StarPanel01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel',2},{'ItemStarRoot01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarPrefab',2},{'HighLight01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_ItemCountBg',2},{'TimeCountDownPanel01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/TimeCountDownPanel',2},{'shijian201','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/TimeCountDownPanel/shijian2',2},{'Img_Jiaobiao101','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_Jiaobiao1',2},{'Upitem3','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3',2},{'RewardRankImg02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/RewardRankImg',2},{'RewardIconImg02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/RewardIconImg',2},{'StarPanel02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel',2},{'ItemStarRoot02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarPrefab',2},{'HighLight02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_ItemCountBg',2},{'TimeCountDownPanel02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/TimeCountDownPanel',2},{'shijian202','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/TimeCountDownPanel/shijian2',2},{'Img_Jiaobiao102','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_Jiaobiao1',2},{'Img_GoldNeedIcon','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Img_GoldNeedIcon',2},{'Img_Biaotixian2','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Img_Biaotixian2',2},{'Img_UseCount','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Img_UseCount',2},{'lvtouying','RoleLvUpPanel/RightPanel/RoleLvPanel/lvtouying',2},{'lvdi','RoleLvUpPanel/RightPanel/RoleLvPanel/lvdi',2},{'antiao','RoleLvUpPanel/RightPanel/RoleLvPanel/antiao',2},{'Img_PreviewExpSlider','RoleLvUpPanel/RightPanel/RoleLvPanel/Img_PreviewExpSlider',2},{'Img_CurExpSlider','RoleLvUpPanel/RightPanel/RoleLvPanel/Img_CurExpSlider',2},{'xian1','RoleLvUpPanel/RightPanel/xian1',2},{'xian2','RoleLvUpPanel/RightPanel/xian2',2},{'Btn_Upgrade','RoleLvUpPanel/RightPanel/Btn_Upgrade',2},{'Btn_JueXingPreview','RoleLvUpPanel/RightPanel/Btn_JueXingPreview',2},{'Img_Biaotixian1','RoleLvUpPanel/RightPanel/Img_Biaotixian1',2},{'UpperBtnPanel','RoleLvUpPanel/UpperBtnPanel',2},{'ItemPanelPrefab','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab',2},{'shuliangdi','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab/shuliangdi',2},{'ShieldCoinIcon','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab/ShieldCoinIcon',2},{'+','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab/+',2},{'Img_AddShieldCoin','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab/+/Img_AddShieldCoin',2},{'ItemRoot','RoleLvUpPanel/UpperBtnPanel/ItemRoot',2},{'RoleLvUpSuccessPanel','RoleLvUpSuccessPanel',2},{'Btn_Back','RoleLvUpSuccessPanel/Btn_Back',2},{'BG','RoleLvUpSuccessPanel/BG',2},{'Zhuangshixian(shang)','RoleLvUpSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','RoleLvUpSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi','RoleLvUpSuccessPanel/chenggongdi',2},{'item1','RoleLvUpSuccessPanel/chenggongdi/item1',2},{'Img_Shuxingicondi2','RoleLvUpSuccessPanel/chenggongdi/item1/Img_Shuxingicondi2',2},{'icon1','RoleLvUpSuccessPanel/chenggongdi/item1/Img_Shuxingicondi2/icon1',2},{'item2','RoleLvUpSuccessPanel/chenggongdi/item2',2},{'Img_Shuxingicondi201','RoleLvUpSuccessPanel/chenggongdi/item2/Img_Shuxingicondi2',2},{'icon2','RoleLvUpSuccessPanel/chenggongdi/item2/Img_Shuxingicondi2/icon2',2},{'>02','RoleLvUpSuccessPanel/chenggongdi/>',2},{'>03','RoleLvUpSuccessPanel/chenggongdi/>',2},{'>04','RoleLvUpSuccessPanel/chenggongdi/>',2},{'Img_Dian','RoleLvUpSuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','RoleLvUpSuccessPanel/FightResult/Img_Heidi',2},{'Img_Yinying','RoleLvUpSuccessPanel/FightResult/Img_Yinying',2},
        -- Text 列表
        {'ItemCountText','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/Img_ItemCountBg/ItemCountText',3},{'CountDownText','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem1/TimeCountDownPanel/CountDownText',3},{'ItemCountText01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/Img_ItemCountBg/ItemCountText',3},{'CountDownText01','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem2/TimeCountDownPanel/CountDownText',3},{'ItemCountText02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/Img_ItemCountBg/ItemCountText',3},{'CountDownText02','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Upitem3/TimeCountDownPanel/CountDownText',3},{'Img_EXP','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Img_EXP',3},{'Text_UseCount','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Text_UseCount',3},
        -- TextMeshProUGUI 列表
        {'OriginHpText','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/HpPanel/OriginHpText',20},{'PreviewHpText','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/HpPanel/PreviewHpText',20},{'OriginAtkSupportText','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/AtkPanel/OriginAtkSupportText',20},{'PreviewAtkSupportText','RoleLvUpPanel/RightPanel/LvUpInfoPreviewPanel/AtkPanel/PreviewAtkSupportText',20},{'TitleNameText','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/TitleNameText',20},{'BtnMaxLV_Txt','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/Lvdi/BtnMaxLV_Txt',20},{'BtnMinLV_Txt','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Panel_UseExpBook/lvmindi/BtnMinLV_Txt',20},{'Text_GoldNeedTitle','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Text_GoldNeedTitle',20},{'Text_GoldNeedCount','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Text_GoldNeedCount',20},{'Text_RoleExp','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Text_RoleExp',20},{'Text_AddExp','RoleLvUpPanel/RightPanel/Panel_UpgradeNeed/Text_AddExp',20},{'RoleLvTitle','RoleLvUpPanel/RightPanel/RoleLvPanel/lvdi/RoleLvTitle',20},{'RoleLvText','RoleLvUpPanel/RightPanel/RoleLvPanel/lvdi/RoleLvText',20},{'Text','RoleLvUpPanel/RightPanel/Btn_Upgrade/Text',20},{'Text01','RoleLvUpPanel/RightPanel/Btn_JueXingPreview/Text',20},{'Text_Shengjiyulan','RoleLvUpPanel/RightPanel/Text_Shengjiyulan',20},{'ItemCountText03','RoleLvUpPanel/UpperBtnPanel/ItemPanelPrefab/ItemCountText',20},{'LvText','RoleLvUpSuccessPanel/chenggongdi/LvText',20},{'HpNameText','RoleLvUpSuccessPanel/chenggongdi/HpNameText',20},{'AtkZhiYuanNameText','RoleLvUpSuccessPanel/chenggongdi/AtkZhiYuanNameText',20},{'OriginLVText','RoleLvUpSuccessPanel/chenggongdi/OriginLVText',20},{'OriginHpText01','RoleLvUpSuccessPanel/chenggongdi/OriginHpText',20},{'OriginAtkZhiYuanText','RoleLvUpSuccessPanel/chenggongdi/OriginAtkZhiYuanText',20},{'TargetLVText','RoleLvUpSuccessPanel/chenggongdi/TargetLVText',20},{'TargetHpText','RoleLvUpSuccessPanel/chenggongdi/TargetHpText',20},{'TargetAtkZhiYuanText','RoleLvUpSuccessPanel/chenggongdi/TargetAtkZhiYuanText',20},{'TouchExit','RoleLvUpSuccessPanel/chenggongdi/Touch Exit',20},{'Text_FightResult','RoleLvUpSuccessPanel/FightResult/Text_FightResult',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---经验书物体
    self.ItemObj =
    {
        [1] =self:Upitem1(),
        [2] =self:Upitem2(),
        [3] =self:Upitem3()
    }
    ---获取选择框
    self.Img_Jiaobiao1 = self.Upitem1().transform:Find("Img_Jiaobiao1").gameObject
    self.Img_Jiaobiao2 = self.Upitem2().transform:Find("Img_Jiaobiao1").gameObject
    self.Img_Jiaobiao3 = self.Upitem3().transform:Find("Img_Jiaobiao1").gameObject
    --- 隐藏成功Panel和预制体
    self.RoleLvUpSuccessPanel().gameObject:SetActive(false)
    self.Bool_AddExpBookLock_LVLimit = false ---经验书添加锁(等级上限)
    self.Bool_IsAdd = true ---添加还是减少经验书
    self.Int_LoopTimer = 0 ---循环检测计数器
    self.CurHero = RoleCardViewModel.CurrentHero ---当前选择角色
    self.CurHeroAttr = self.CurHero:GetHeroAttr()  ---当前英雄属性(可变)
    self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()  ---当前英雄属性(不变)
------初始化按钮
    self:InitButton()
    ---初始化顶部玩家资源
    self:InitUpPanel()
    ---初始化经验书结构
    self:InitPlayerExpBookStruct()
    self:UpdataRoleInfoPanel()
    ---初始化属性和UI
    self:InitRoleInfo()
    self:SwitchItem()
    ------初始化页面

    Event.Clear("NoviceLVOnce")
    Event.Add("NoviceLVOnce",function ()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickAddExpBook(self:SwitchExp())
        self.Int_HasClick = 1
        MgrTimer.AddDelayNoName(1,Handle(self, self.IsLoopClick),nil)
        self.Bool_IsAdd = true
        self.IsEndLoopToInput = false
        self:LoopInput()
        NoviceViewModel.DoNext()
    end)    ------初始化页面
    Event.Clear("NoviceLVUPSecond")
    Event.Add("NoviceLVUPSecond",function ()
        if NoviceViewModel.CurTaskId == 20012 then
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
                self:OnClickUpgrade()
            end)
        end
    end)
end
---初始化按钮
function M:InitButton()
    ---升级按钮
    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,self.OnClickUpgrade))
    ---升级成功返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        self.RoleLvUpSuccessPanel().gameObject:SetActive(false)
        self.CurHeroAttr= self.CurHero:GetHeroAttr()
        if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
            Event.Go("BackClick")
            return
        end
        self.UnChangedHeroAttr = self.CurHero:GetHeroAttr()
        self:ClearSelect()
        self:UpdataPlayerExpBookStruct()
        self:UpdataUpPanel()
        self:UpdataRoleInfoPanel()
        self:InitRoleInfo()
    end))
    ---添加经验书
    UIEvent.LuaPressClick(self.Btn_LvUpHighLight().gameObject,Handle(self, function ()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickAddExpBook(self:SwitchExp())
        self.Int_HasClick = 1
        MgrTimer.AddDelayNoName(1,Handle(self, self.IsLoopClick),nil)
        self.Bool_IsAdd = true
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    ---减少经验书
    UIEvent.LuaPressClick(self.Btn_LvDownHighLight().gameObject,Handle(self, function ()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickDeCreaseExpBook(self:SwitchExp())
        self.Int_HasClick = 1
        MgrTimer.AddDelayNoName(1,Handle(self, self.IsLoopClick),nil)
        self.Bool_IsAdd = false
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    if self.CurHero.awaken then
        self.Btn_JueXingPreview().gameObject:SetActive(false)
    else
        self.Btn_JueXingPreview().gameObject:SetActive(true)
    end
    ---觉醒预览
    UIEvent.LuaClick(self.Btn_JueXingPreview().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RoleJueXingPreview_UI)
    end))
    ---添加当前经验书到最大等级
    UIEvent.LuaClick(self.Btn_MaxLv().gameObject,Handle(self,self.MaxLV))
    ---去除所有经验书
    UIEvent.LuaClick(self.Btn_MinLv().gameObject,Handle(self,self.MinLV))
end
---初始化顶部玩家资源
function M:InitUpPanel()
    self.ItemPanelPrefab().gameObject:SetActive(false)
    ---@type ItemData
    local item = ItemControl.GetItemByID(100001)
    Tools.ClearAllChild(self.ItemRoot().gameObject)
    local obj =  GameObject.Instantiate(self.ItemPanelPrefab().gameObject,self.ItemRoot().transform)
    obj:SetActive(true)
    local CostIcon = obj.transform:Find("ShieldCoinIcon"):GetComponent("Image")
    self.CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
    self.CostCount.text = item.count
    MgrRes.LoadSprite(CostIcon,"Item/"..item.id)
end
---更新玩家资源
function M:UpdataUpPanel()
    ---@type ItemData
    local item = ItemControl.GetItemByID(100001)
    self.CostCount.text = item.count
end
---初始化属性和UI
function M:InitRoleInfo()
    ---判断职业类型
    if self.CurHeroAttr.Occupation == 4 then
        self.ZhiYuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
        self.OriginAtkSupportText().text ="".. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart).."%"
    else
        self.ZhiYuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
        self.OriginAtkSupportText().text ="".. math.floor(self.CurHeroAttr.RealAtk)
    end
    ---角色信息更新
    self.RoleLvText().text =""..self.CurHeroAttr.LV
    self.OriginHpText().text ="".. math.floor(self.CurHeroAttr.HP)
    self.PreviewHpText().gameObject:SetActive(false)
    self.PreviewAtkSupportText().gameObject:SetActive(false)
end
---初始化经验书结构
function  M:InitPlayerExpBookStruct()
    --结构体类型
    self.Struct_ExpBook_Low = {
        BookId = 110050, --当前经验书ID
        BookType = 3, --当前经验书类型
        BookSelectSum = 0, --当前选择数量
        BookPlayerSum = 0, --玩家持有数量
        BookExp = 500, --转换成的经验数量
        BookAddLock_SumLimit = false, --经验书添加锁(持有数量上限)
        BookGameObj = nil,
    }   ---500经验书
    self.Struct_ExpBook_Medium = {
        BookId = 110051, --当前经验书ID
        BookType = 2, --当前经验书类型
        BookSelectSum = 0, --当前选择数量
        BookPlayerSum = 0, --玩家持有数量
        BookExp = 1000, --转换成的经验数量
        BookAddLock_SumLimit = false, --经验书添加锁(持有数量上限)
        BookGameObj = nil,
    }  ---1000经验书
    self.Struct_ExpBook_High = {
        BookId = 110052, --当前经验书ID
        BookType = 1, --当前经验书类型
        BookSelectSum = 0, --当前选择数量
        BookPlayerSum = 0, --玩家持有数量
        BookExp = 3000, --转换成的经验数量
        BookAddLock_SumLimit = false, --经验书添加锁(持有数量上限)
        BookGameObj = nil,
    }  ---3000经验书
    self.Tab_ExpBookStruct={}  ---经验书数据结构体存储表
    self.CurrentExpType = 1  ---当前经验书槽位
    self:UpdataPlayerExpBookStruct() ---更新经验书结构
end
---更新经验书结构
function M:UpdataPlayerExpBookStruct()
    --- 初始化经验书
    self.CurItemList ={}
    self.CurItemList[1] = ItemControl.GetItemByID(110052)
    self.CurItemList[2] = ItemControl.GetItemByID(110051)
    self.CurItemList[3] = ItemControl.GetItemByID(110050)
    ---更新道具预制
    for i, v in ipairs(self.ItemObj) do
        self:UpdataItem(v.gameObject,self.CurItemList[i])
        UIEvent.LuaClick(v.gameObject,Handle(self, function ()
            if  self.CurrentExpType ~= i then
                self.CurrentExpType = i
                self:ClearSelect()
                ---更新人物属性
                self:UpdataRoleInfoPanel()
                self:SwitchItem()
            end
            self.Text_UseCount().text = self:SwitchExp().BookSelectSum
        end))
    end
    ---更新经验书结构
    local _Init_Struct_ExpBook=function (pStruct_ExpBook)
        pStruct_ExpBook.BookPlayerSum = 0
        for key, value in pairs(self.CurItemList) do
            if value.id == pStruct_ExpBook.BookId then
                pStruct_ExpBook.BookPlayerSum= value.count
                pStruct_ExpBook.BookType= value.goodsType
            end
        end
        return pStruct_ExpBook
    end
    ---更新经验书结构
    self.Struct_ExpBook_Low=_Init_Struct_ExpBook(self.Struct_ExpBook_Low)
    self.Struct_ExpBook_Low.BookGameObj = self.Upitem3().gameObject
    self.Struct_ExpBook_Medium=_Init_Struct_ExpBook(self.Struct_ExpBook_Medium)
    self.Struct_ExpBook_Medium.BookGameObj = self.Upitem2().gameObject
    self.Struct_ExpBook_High=_Init_Struct_ExpBook(self.Struct_ExpBook_High)
    self.Struct_ExpBook_High.BookGameObj = self.Upitem1().gameObject
    ---更新经验书结构
    self.Tab_ExpBookStruct={self.Struct_ExpBook_Low,self.Struct_ExpBook_Medium,self.Struct_ExpBook_High}
end
---更新人物属性
function M:UpdataRoleInfoPanel()
    ---根据当前经验书池中投入总数计算出总经验值并得出最终机娘等级和剩余经验
    local _InputExp=self:GetCurSumExp()  ---当前输入经验值
    self.CostMoney = 0
    --    local bag = ItemControl.GetAllItems()
    --    self.Text_ShieldCoinCount().text= bag[100001] and bag[100001].count or 0
    local coin = ItemControl.GetAllItems()[100001] and ItemControl.GetAllItems()[100001].count or 0
    local needCoin = _InputExp*0.25      ---消耗金币
        if coin >= needCoin then
        self.Text_GoldNeedCount().text = ""..math.floor(_InputExp*0.25)
    else
        self.Text_GoldNeedCount().text = string.format(" <color=#C33A3A>%s</color>",math.floor(_InputExp*0.25))
    end

    self.CostMoney = _InputExp*0.25
    local _FinalLv = 0  ---输入经验后得到最终人物等级
    local _FinalExp = 0 ---输入经验后得到最终人物剩余经验
    if _InputExp > 0 then
        --- 如果有输入经验
        _FinalLv,_FinalExp=UISysTools.GetFinalRoleLvExp(self.UnChangedHeroAttr.LV,self.UnChangedHeroAttr.EXP,_InputExp,self.UnChangedHeroAttr)
        self.CurHeroAttr =ReadData.GetRoleAttr(self.CurHero.id,_FinalLv,self.CurHero.star,self.CurHero.skillLevel,self.CurHero.awaken,_FinalExp)
    else
        ---没有输入经验则恢复原始属性
        self.CurHeroAttr = self.CurHero:GetHeroAttr()
    end
    ---根据当前的角色属性刷新UI
    self.LocalPreviewLv = self.CurHeroAttr.LV
    ---判断是否为支援角色
    if self.CurHeroAttr.Occupation == 4 then
        self.ZhiYuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
        if self:GetInfoCorrect(self.CurHeroAttr.RealSuppart-self.UnChangedHeroAttr.RealSuppart) == 0 then
            self.PreviewAtkSupportText().gameObject:SetActive(false)
        else
            self.PreviewAtkSupportText().gameObject:SetActive(true)
            self.PreviewAtkSupportText().text ="".. self:GetInfoCorrect(self.CurHeroAttr.RealSuppart).."%".."<color=#1DFFD7>(+"..self:GetInfoCorrect(self.CurHeroAttr.RealSuppart-self.UnChangedHeroAttr.RealSuppart).."%)</color>"
        end
    else
        self.ZhiYuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
        if math.floor(self.CurHeroAttr.RealAtk-self.UnChangedHeroAttr.RealAtk) == 0 then
            self.PreviewAtkSupportText().gameObject:SetActive(false)
        else
            self.PreviewAtkSupportText().gameObject:SetActive(true)
            self.PreviewAtkSupportText().text ="".. math.floor(self.CurHeroAttr.RealAtk).."<color=#1DFFD7>(+"..math.floor(self.CurHeroAttr.RealAtk-self.UnChangedHeroAttr.RealAtk)..")</color>"
        end
    end
    if math.floor(self.CurHeroAttr.HP-self.UnChangedHeroAttr.HP) == 0 then
        self.PreviewHpText().gameObject:SetActive(false)
    else
        self.PreviewHpText().gameObject:SetActive(true)
        ---更新血量
        self.PreviewHpText().text ="".. math.floor(self.CurHeroAttr.HP).."<color=#1DFFD7>(+"..math.floor(self.CurHeroAttr.HP-self.UnChangedHeroAttr.HP)..")</color>"
    end
    ---角色等级变色
    if self.CurHeroAttr.LV > self.UnChangedHeroAttr.LV then
        -- statements
        self.RoleLvText().text= "<color=#1CFFD7>"..self.CurHeroAttr.LV.."</color>"
    else
        self.RoleLvText().text= ""..self.CurHeroAttr.LV
    end
    --- 刷新人物经验槽UI
    --- 预览角色属性等级经验
    local _NextLvExp = BattleRole.ReturnExp(self.CurHeroAttr,tonumber(self.CurHeroAttr.LV))
    local _PreviewExpRate = _FinalExp/tonumber(_NextLvExp)
    --- 更新预览经验条
    Tools.SetImgFillRate(self.Img_PreviewExpSlider().gameObject,_PreviewExpRate,0.2,nil,false,self.Bool_IsAdd)
    --- 当前角色等级经验
    local _OriginNextLvExp = BattleRole.ReturnExp(self.UnChangedHeroAttr,tonumber(self.UnChangedHeroAttr.LV))
    local _OrginExpRate = tonumber(self.UnChangedHeroAttr.EXP)/tonumber(_OriginNextLvExp)

    if self.CurHeroAttr.LV > self.UnChangedHeroAttr.LV then
        ---输入经验已经足够升一级并且有溢出 就不显示黄条
        Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject,0)
    else
        if self.UnChangedHeroAttr.LV >= self.UnChangedHeroAttr.LvMax then
            Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject,0)
        else
            Tools.SetImgFillRate(self.Img_CurExpSlider().gameObject,_OrginExpRate)
        end
    end
    ---更新经验文本
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        --- 如果已经达到满级则不显示下一级经验
        self.Text_RoleExp().text =string.format("<color=#1CFFD7>MAX</color>/MAX<color=#FFC438>（+%d）</color>",_InputExp)
    else
        if _InputExp == 0 then
            self.Text_RoleExp().text =string.format("<color=#1CFFD7>%d</color>/%d",self.CurHeroAttr.EXP,_NextLvExp)
        else
            self.Text_RoleExp().text =string.format("<color=#1CFFD7>%d</color>/%d<color=#FFC438>（+%d）</color>",self.CurHeroAttr.EXP,_NextLvExp,_InputExp)
        end
    end

    ---根据计算完成的等级判断当前是否溢出或小于初始等级
    if self.CurHeroAttr.LV >= self.CurHeroAttr.LvMax then
        self.Bool_AddExpBookLock_LVLimit = true
    else
        self.Bool_AddExpBookLock_LVLimit = false
    end
    if self.CurHeroAttr.LV < self.CurHeroAttr.LvMax then
        self:SwitchBtnState(1)
    else
        self:SwitchBtnState(2)
    end
    if self.CurHeroAttr.LV > self.UnChangedHeroAttr.LV then
        self:SwitchBtnState(3)
    else
        self:SwitchBtnState(4)
    end
end
---@param pData ItemData 道具预制设置
function M:UpdataItem(obj,pData)
    local StarPanel = obj.transform:Find("StarPanel").gameObject
    local StartPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
    ---为0不显示星级
    if pData.star then
        StarPanel:SetActive(pData.star > 0)
        ---大于0更新星级显示
        if pData.star > 0 then
            for i = 1,pData.star do
                local star = GameObject.Instantiate(StartPrefab,ItemStarRoot.transform)
                star:SetActive(true)
            end
        end
    else
        StarPanel:SetActive(false)
    end
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..pData.quality)
    ---设置图标
    MgrRes.LoadSprite(RewardIconImg,pData.icon)
    ---设置数量
    if pData.count then
        ItemCountText.text = JNStrTool.numberAbbr(pData.count) --pData.count >= 10000 and math.floor(tonumber(pData.count)/1000).."K" or pData.count
    else
        ItemCountText.text = "0"
    end
end
---添加当前经验书到最大等级
function M:MaxLV()
    ---已经到最大等级 返回
    if self.LocalPreviewLv >= self.UnChangedHeroAttr.LvMax then
        return
    end
    local maxExp = 0
    self:SwitchExp().BookSelectSum = 0
    local attr = self.CurHero:GetHeroAttr()
    for i = self.CurHero.level,(attr.LvMax - 1) do
        maxExp = maxExp + BattleRole.ReturnExp(attr,i)
    end
    maxExp  = maxExp - self.CurHero.exp - self:GetCurSumExp()
    local differenceExp = (self:SwitchExp().BookPlayerSum*self:SwitchExp().BookExp) - maxExp
    if  differenceExp > 0 then
        self.count = 0
        local coin = ItemControl.GetAllItems()[100001] and ItemControl.GetAllItems()[100001].count or 0
        local needCoin = maxExp * 0.25
        ---如果货币少于所需货币
        if coin < needCoin then
            local exp = math.floor(coin / 0.25)
            self:GetBookByExp(exp)
        else
            self:GetBookByExp(maxExp,true)
        end
        self:SwitchExp().BookSelectSum =  self.count
    else
        self:SwitchExp().BookSelectSum = self:SwitchExp().BookPlayerSum
    end
    ---更新角色属性
    self:UpdataRoleInfoPanel()
end
---去除当前经验书
function M:MinLV()
    self:ClearSelect()
    ---更新人物属性
    self:UpdataRoleInfoPanel()
end
---根据输入经验获取当前经验书数量
function M:GetBookByExp(exp,residual)
    if exp <= 0 then
        return  self.count
    end
    if residual then
        self.count = math.ceil(exp/self:SwitchExp().BookExp)
    else
        self.count = math.floor(exp/self:SwitchExp().BookExp)
    end
    return self.count
end
---获取经验和金币消耗文本
function M:GetCurSumExp()
    local _ReturnExp = 0
    --local booksum = 0
    ---计算所有选择的经验书 经验总和
    for i, v in pairs(self.Tab_ExpBookStruct) do
        _ReturnExp = _ReturnExp + (v.BookExp*v.BookSelectSum)
        --   booksum = booksum + v.BookSelectSum
    end
    ---显示当前选择的经验书数量
    self.Text_UseCount().text = self:SwitchExp().BookSelectSum
    return _ReturnExp
end
---切换选择状态
function M:SwitchItem()
    if self.CurrentExpType == 1 then
        self.Img_Jiaobiao1:SetActive(true)
        self.Img_Jiaobiao2:SetActive(false)
        self.Img_Jiaobiao3:SetActive(false)
    elseif self.CurrentExpType == 2 then
        self.Img_Jiaobiao1:SetActive(false)
        self.Img_Jiaobiao2:SetActive(true)
        self.Img_Jiaobiao3:SetActive(false)
    elseif self.CurrentExpType == 3 then
        self.Img_Jiaobiao1:SetActive(false)
        self.Img_Jiaobiao2:SetActive(false)
        self.Img_Jiaobiao3:SetActive(true)
    end
end
---当前经验书类型
function M:SwitchExp()
    if self.CurrentExpType == 1 then
        return self.Struct_ExpBook_High
    elseif self.CurrentExpType == 2  then
        return self.Struct_ExpBook_Medium
    elseif self.CurrentExpType == 3  then
        return self.Struct_ExpBook_Low
    end
end
---切换按钮高光低光
function M:SwitchBtnState(_BtnType)
    -- statements
    if _BtnType == 1 then
        -- 显示高光等级提升按钮
        self.BtnMaxLV_Txt().text= MgrLanguageData.GetLanguageByKey("ui_levelmax_text")
        Tools.ObjSetLastSibling(self.Btn_LvUpHighLight().gameObject)
    elseif _BtnType == 2 then
        -- 显示低光光等级提升按钮
        self.BtnMaxLV_Txt().text="<color=#A8A8A8>Max</color>"
        self.Int_LoopTimer=0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_LvUp().gameObject)
    elseif _BtnType == 3 then
        -- 显示高光等级减少按钮
        self.BtnMinLV_Txt().text="Min"
        Tools.ObjSetLastSibling(self.Btn_LvDownHighLight().gameObject)
    elseif _BtnType == 4 then
        -- 显示低光等级减少按钮
        self.BtnMinLV_Txt().text="<color=#A8A8A8>Min</color>"
        self.Int_LoopTimer=0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_LvDown().gameObject)
    end
end
---循环检测
function M:IsLoopClick()
    -- statements
    if UIEvent.GetButton_Up() == false  then
        self.Int_HasClick = 0
    end
end
---循环检测按下事件并执行
function M:LoopInput()
    if self.IsEndLoopToInput == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05,Handle(self,self.LoopInput),nil)
        self.Int_HasClick = 1
        self.Int_LoopTimer = self.Int_LoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.Int_LoopTimer > 5 then
            self:LoopFuncSwitch(self:SwitchExp())
        end
        if bool_IsUp == false then
            -- statements
            self.Int_LoopTimer=0
            self.Int_HasClick = 0
            self.IsEndLoopToInput = true
            print("跳出循环...........................")
        end
    end
end
---循环检测长按按钮方法
function M:LoopFuncSwitch(_Struct_ExpBook)
    if self.Bool_IsAdd == true then
        -- 增加经验书
        self:OnClickAddExpBook(_Struct_ExpBook)
    elseif self.Bool_IsAdd == false then
        -- 减少经验书
        self:OnClickDeCreaseExpBook(_Struct_ExpBook)
    end
end
---点击添加经验书
function M:OnClickAddExpBook(_Struct_ExpBook)
    if _Struct_ExpBook.BookAddLock_SumLimit or self.Bool_AddExpBookLock_LVLimit then
        --添加经验书上锁,跳出
        return
    end
    if _Struct_ExpBook.BookPlayerSum == 0 or _Struct_ExpBook.BookPlayerSum == nil or _Struct_ExpBook.BookSelectSum >= _Struct_ExpBook.BookPlayerSum then
        return
    end
    if self.LocalPreviewLv >= self.UnChangedHeroAttr.LvMax then
        return
    end
    MgrSound.PlayEffect("yx_ui_shuzigundong_01",1,nil,false)
    _Struct_ExpBook.BookSelectSum = _Struct_ExpBook.BookSelectSum + 1
    self:UpdataRoleInfoPanel()
end
---点击减少经验书
function M:OnClickDeCreaseExpBook(_Struct_ExpBook)
    if _Struct_ExpBook.BookSelectSum <= 0 then
        return
    end
    _Struct_ExpBook.BookSelectSum = _Struct_ExpBook.BookSelectSum - 1
    MgrSound.PlayEffect("yx_ui_shuzigundong_01",1,nil,false)
    self:UpdataRoleInfoPanel()
end
---升级请求
function M:OnClickUpgrade()
    -- statements
    if  self:GetCurSumExp()<= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newrolelevelupgrade_ui_tips1"),2},true)
        return
    end
    local item = ItemControl.GetItemByID(100001)
    if  item.count < self.CostMoney then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),2},true)
        return
    end
    local index = 1
    local goods = {}
    for i, v in pairs(self.Tab_ExpBookStruct) do
        if v.BookSelectSum~=0 then
            goods[index] =
            {
                goodsID = v.BookId,
                goodsNum = v.BookSelectSum,
                goodsType = v.BookType
            }
            index = index + 1
        end
    end
    local ExpREQ =
    {
        heroID = self.CurHero.id,
        cost = goods
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroLevelUPREQ',ExpREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_LEVEL_UP_REQ,bytes,0,nil,Handle(self,self.ReceiveLevelUpACK),Handle(self,self.ReceiveLevelUpNTF))
end
---升级成功返回
function M:ReceiveLevelUpACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroLevelUPACK',buffer))
    print(tab.errNo)
end
function M:ReceiveLevelUpNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroLevelUPNTF',buffer))
    self:SuccessRecivePanel(tab.info)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
    ---新手引导
    NoviceViewModel.GoCheck(20012)
end

---成功界面
---@param info HeroInfo
function M:SuccessRecivePanel(info)
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    self.RoleLvUpSuccessPanel().gameObject:SetActive(true)
    self.OriginLVText().text = self.UnChangedHeroAttr.LV
    self.TargetLVText().text = self.CurHeroAttr.LV
    self.OriginHpText01().text = self.UnChangedHeroAttr.HP
    self.TargetHpText().text = self.CurHeroAttr.HP
    if NoviceViewModel.CurTaskId ~= 13014 then
        RoleCardViewModel.PlayRoleVoice(6)
    end
    ---判断职业类型
    if self.CurHeroAttr.Occupation == 4 then
        self.AtkZhiYuanNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        MgrRes.LoadSprite(self.icon2(),"Attribute/GearInfoIcon_8")
        self.TargetAtkZhiYuanText().text = ""..self:GetInfoCorrect(self.CurHeroAttr.RealSuppart).."%"
        self.OriginAtkZhiYuanText().text =""..self:GetInfoCorrect(self.UnChangedHeroAttr.RealSuppart).."%"
    else
        self.AtkZhiYuanNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        MgrRes.LoadSprite(self.icon2(),"Attribute/GearInfoIcon_0")
        self.TargetAtkZhiYuanText().text ="".. math.floor(self.CurHeroAttr.RealAtk)
        self.OriginAtkZhiYuanText().text ="".. math.floor(self.UnChangedHeroAttr.RealAtk)
    end
end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*1000)/1)
    tempData=tempInt1/10
    return tempData
end

---清除选择
function M:ClearSelect()
    for i, v in pairs(self.Tab_ExpBookStruct) do
        v.BookSelectSum = 0
    end
end
return M