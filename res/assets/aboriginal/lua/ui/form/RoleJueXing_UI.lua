-- Code Auto Create Begin
local M = Class('RoleJueXing_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleJueXing_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleJueXing_UI].prefab'
    self.Name = 'Form[RoleJueXing_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleJueXingPanel','RoleJueXingPanel',2},{'Btn_Upgrade','RoleJueXingPanel/RightPanel/Btn_Upgrade',2},{'Btn_JueXingPreview','RoleJueXingPanel/RightPanel/Btn_JueXingPreview',2},{'shuxingdi','RoleJueXingPanel/RightPanel/shuxingdi',2},{'》','RoleJueXingPanel/RightPanel/》',2},{'StarPanelBg','RoleJueXingPanel/RightPanel/StarPanelBg',2},{'》2','RoleJueXingPanel/RightPanel/》2',2},{'fenggexian','RoleJueXingPanel/RightPanel/fenggexian',2},{'RoleJueXingInfoPanel','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel',2},{'HpIcon','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/HpIcon',2},{'AtkIcon','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/AtkIcon',2},{'ZhiyuanIcon','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/ZhiyuanIcon',2},{'CostItemPrefab','RoleJueXingPanel/RightPanel/CostItemPrefab',2},{'RewardRankImg','RoleJueXingPanel/RightPanel/CostItemPrefab/RewardRankImg',2},{'CostItemIcon','RoleJueXingPanel/RightPanel/CostItemPrefab/CostItemIcon',2},{'CostItemPanel','RoleJueXingPanel/RightPanel/CostItemPanel',2},{'CurStarPanel','RoleJueXingPanel/RightPanel/CurStarPanel',2},{'StarPrefab','RoleJueXingPanel/RightPanel/StarPrefab',2},{'StarJueXingPrefab','RoleJueXingPanel/RightPanel/StarJueXingPrefab',2},{'PreviewStarPanel','RoleJueXingPanel/RightPanel/PreviewStarPanel',2},{'UpperBtnPanel','RoleJueXingPanel/UpperBtnPanel',2},{'ItemPanelPrefab','RoleJueXingPanel/UpperBtnPanel/ItemPanelPrefab',2},{'shuliangdi','RoleJueXingPanel/UpperBtnPanel/ItemPanelPrefab/shuliangdi',2},{'ItemIcon','RoleJueXingPanel/UpperBtnPanel/ItemPanelPrefab/ItemIcon',2},{'+','RoleJueXingPanel/UpperBtnPanel/ItemPanelPrefab/+',2},{'ItemRoot','RoleJueXingPanel/UpperBtnPanel/ItemRoot',2},{'RoleJuxXingSuccessPanel','RoleJuxXingSuccessPanel',2},{'SuccBtn_Back','RoleJuxXingSuccessPanel/SuccBtn_Back',2},{'item1','RoleJuxXingSuccessPanel/item1',2},{'Img_Shuxingicondi2','RoleJuxXingSuccessPanel/item1/Img_Shuxingicondi2',2},{'icon1','RoleJuxXingSuccessPanel/item1/Img_Shuxingicondi2/icon1',2},{'item2','RoleJuxXingSuccessPanel/item2',2},{'Img_Shuxingicondi201','RoleJuxXingSuccessPanel/item2/Img_Shuxingicondi2',2},{'icon2','RoleJuxXingSuccessPanel/item2/Img_Shuxingicondi2/icon2',2},{'BG','RoleJuxXingSuccessPanel/BG',2},{'Zhuangshixian(shang)','RoleJuxXingSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','RoleJuxXingSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'juexingdi','RoleJuxXingSuccessPanel/juexingdi',2},{'SuccStarPrefab','RoleJuxXingSuccessPanel/SuccStarPrefab',2},{'SuccessStarPanel','RoleJuxXingSuccessPanel/SuccessStarPanel',2},{'>','RoleJuxXingSuccessPanel/>',2},{'>01','RoleJuxXingSuccessPanel/>',2},{'Img_Dian','RoleJuxXingSuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','RoleJuxXingSuccessPanel/FightResult/Img_Heidi',2},{'Img_Yinying','RoleJuxXingSuccessPanel/FightResult/Img_Yinying',2},
        -- Text 列表
        {'UpgradeText','RoleJueXingPanel/RightPanel/Btn_Upgrade/UpgradeText',3},{'Btn_JueXingPreviewTxt','RoleJueXingPanel/RightPanel/Btn_JueXingPreview/Btn_JueXingPreviewTxt',3},{'HpText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/HpIcon/HpText',3},{'AtkText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/AtkIcon/AtkText',3},{'ZhiYuanText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/ZhiyuanIcon/ZhiYuanText',3},{'OriginHpText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/OriginHpText',3},{'PreviewHpText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/PreviewHpText',3},{'OriginAtkSupportText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/OriginAtkSupportText',3},{'PreviewAtkSupportText','RoleJueXingPanel/RightPanel/RoleJueXingInfoPanel/PreviewAtkSupportText',3},{'ItemCountText','RoleJueXingPanel/RightPanel/CostItemPrefab/ItemCountText',3},{'ItemCountText01','RoleJueXingPanel/UpperBtnPanel/ItemPanelPrefab/ItemCountText',3},{'TitleText','RoleJueXingPanel/TitleText',3},{'TitleNeedText','RoleJueXingPanel/TitleNeedText',3},{'TouchExit','RoleJuxXingSuccessPanel/Touch Exit',3},{'SuccAtkZyNameText','RoleJuxXingSuccessPanel/SuccAtkZyNameText',3},{'SuccHpNameText','RoleJuxXingSuccessPanel/SuccHpNameText',3},{'SuccCurHpText','RoleJuxXingSuccessPanel/SuccCurHpText',3},{'SuccCurAtkZyText','RoleJuxXingSuccessPanel/SuccCurAtkZyText',3},{'SuccTargetHpText','RoleJuxXingSuccessPanel/SuccTargetHpText',3},{'SuccTargetAtkZyText','RoleJuxXingSuccessPanel/SuccTargetAtkZyText',3},{'Text_FightResult','RoleJuxXingSuccessPanel/FightResult/Text_FightResult',3},
    }
end
-- Code Auto Create End
require("LocalData/RoleattriawakeningLocalData")
function M:OnInit()
    self.RoleID =RoleCardViewModel.CurrentHero.id
    self.CurBattleRole = RoleCardViewModel.CurrentHero:GetHeroAttr()
    self.OriginRole = ReadData.GetRoleAttr(self.RoleID,RoleCardViewModel.CurrentHero.level,RoleCardViewModel.CurrentHero.star,0,true)
    self:InitJueXingPreview()
    self:InitNeedPanel()
    self:InitUpPanel()

end

function M:OnShowFinish()
    NoviceViewModel.CheckFirstGuide(53)
end

function M:InitUpPanel()
    self.ItemPanelPrefab().gameObject:SetActive(false)
    ---@type ItemData
    local item = ItemControl.GetItemByID(100001)
    Tools.ClearAllChild(self.ItemRoot().gameObject)
    local obj =  GameObject.Instantiate(self.ItemPanelPrefab().gameObject,self.ItemRoot().transform)
    obj:SetActive(true)
    local CostIcon = obj.transform:Find("ItemIcon"):GetComponent("Image")
    local CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
    CostCount.text = item.count
    self.PlayerMoney = item.count
    MgrRes.LoadSprite(CostIcon,"Item/"..item.id)
end

function M:InitJueXingPreview()

    self.CostItemPrefab().gameObject:SetActive(false)
    self.RoleJuxXingSuccessPanel().gameObject:SetActive(false)
    self.StarJueXingPrefab().gameObject:SetActive(false)
    self.StarPrefab().gameObject:SetActive(false)

    self:InitStar(self.CurStarPanel().gameObject,self.StarPrefab().gameObject,self.CurBattleRole.StartLV)
    self:InitStar(self.PreviewStarPanel().gameObject,self.StarJueXingPrefab().gameObject,self.CurBattleRole.StartLV)
    if self.CurBattleRole.Occupation == 4 then
        self.ZhiyuanIcon().gameObject:SetActive(true)
        self.AtkIcon().gameObject:SetActive(false)
        self.OriginAtkSupportText().text =""..self.GetInfoCorrect(self.CurBattleRole.RealSuppart).."%"
        self.PreviewAtkSupportText().text =""..self.GetInfoCorrect(self.OriginRole.RealSuppart).."%".."<color=#3AFFC5>(+"..self.GetInfoCorrect(self.OriginRole.RealSuppart-self.CurBattleRole.RealSuppart).."%)</color>"
    else
        self.ZhiyuanIcon().gameObject:SetActive(false)
        self.AtkIcon().gameObject:SetActive(true)
        self.OriginAtkSupportText().text ="".. math.floor(self.CurBattleRole.RealAtk)
        self.PreviewAtkSupportText().text ="".. math.floor(self.OriginRole.RealAtk).."<color=#3AFFC5>(+"..math.floor(self.OriginRole.RealAtk-self.CurBattleRole.RealAtk)..")</color>"
    end

    self.OriginHpText().text ="".. math.floor(self.CurBattleRole.HP)
    self.PreviewHpText().text ="".. math.floor(self.OriginRole.HP).."<color=#3AFFC5>(+"..math.floor(self.OriginRole.HP-self.CurBattleRole.HP)..")</color>"

    if RoleCardViewModel.CurrentHero.awaken then
        self.Btn_JueXingPreview().gameObject:SetActive(false)
    else
        self.Btn_JueXingPreview().gameObject:SetActive(true)
    end
    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,self.OnClickJueXing))
    ---觉醒预览
    UIEvent.LuaClick(self.Btn_JueXingPreview().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RoleJueXingPreview_UI)
    end))
end

function M:InitNeedPanel()
    self.CanJX = true
    local countIndex = 0
    local StarCostTab1 = {}
    Tools.ClearAllChild(self.CostItemPanel().gameObject)
    for i, v in pairs(RoleattriawakeningLocalData.tab) do
        if self.CurBattleRole.New_Career == v[2] and self.CurBattleRole.Rank == v[3] then
            StarCostTab1 =JNStrTool.strSplit(",",v[4])
        end
    end
    for key, value in pairs(StarCostTab1) do
        -- statements
        local StarCostTab2 = JNStrTool.strSplit("_", value)
        local obj =  GameObject.Instantiate(self.CostItemPrefab().gameObject,self.CostItemPanel().transform)
        obj:SetActive(true)
        local CostIcon = obj.transform:Find("CostItemIcon"):GetComponent("Image")
        local CostCount = obj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
        local item = ItemControl.GetItemByType(1,tonumber(StarCostTab2[2]))
        local BagItem = ItemControl.GetItemByID(tonumber(StarCostTab2[2]))
        if BagItem.count < tonumber(StarCostTab2[3]) then
            CostCount.text ="<color=#FF3552>"..JNStrTool.numberAbbr(BagItem.count).."</color>/"..StarCostTab2[3]
            countIndex = countIndex + 1
        else
            CostCount.text ="<color=#35FFEA>"..JNStrTool.numberAbbr(BagItem.count).."</color>/"..StarCostTab2[3]
        end
        MgrRes.LoadSprite(CostIcon,"Item/"..item.icon)
        MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..item.quality)
        UIEvent.LuaClick(obj,Handle(self,function ()
            MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem,false,function() end},true)
        end))
    end
    if countIndex > 0 then
        self.CanJX = false
    else
        self.CanJX = true
    end
end

function M:GetRounding(value)
    return JNStrTool.numberAbbr(value)
end

function M:ReceiveJueXingACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroAwakenACK',buffer))
    print(tab)
end

function M:ReceiveJueXingNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroAwakenNTF',buffer))
    self:InitJueXingSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
end

function M:OnClickJueXing()
    if not self.CanJX then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("rolejuexing_ui_tips1"),1},true)
        return
    end
    local JueXingREQ =
    {
        heroID = self.RoleID
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroAwakenREQ',JueXingREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_AWAKEN_REQ,bytes,0,nil,Handle(self,self.ReceiveJueXingACK),Handle(self,self.ReceiveJueXingNTF))
end

---初始化升星成功
function M:InitJueXingSuccessPanel()
    -- statements
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    RoleCardViewModel.PlayRoleVoice(8)
    self.RoleJuxXingSuccessPanel().gameObject:SetActive(true)

    self.SuccStarPrefab().gameObject:SetActive(false)

    self:InitStar(self.SuccessStarPanel().gameObject,self.SuccStarPrefab().gameObject,self.CurBattleRole.StartLV)

    if self.CurBattleRole.Occupation == 4 then
        self.SuccAtkZyNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_support")
        MgrRes.LoadSprite(self.icon2(),"Attribute/GearInfoIcon_8")
        self.SuccCurAtkZyText().text =""..self.GetInfoCorrect(self.CurBattleRole.RealSuppart).."%"
        self.SuccTargetAtkZyText().text =""..self.GetInfoCorrect(self.OriginRole.RealSuppart).."%".."<color=#3AFFC5>(+"..self.GetInfoCorrect(self.OriginRole.RealSuppart-self.CurBattleRole.RealSuppart).."%)</color>"
    else
        self.SuccAtkZyNameText().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
        MgrRes.LoadSprite(self.icon2(),"Attribute/GearInfoIcon_0")
        self.SuccCurAtkZyText().text ="".. math.floor(self.CurBattleRole.RealAtk)
        self.SuccTargetAtkZyText().text ="".. math.floor(self.OriginRole.RealAtk).."<color=#3AFFC5>(+"..math.floor(self.OriginRole.RealAtk-self.CurBattleRole.RealAtk)..")</color>"
    end

    self.SuccCurHpText().text ="".. math.floor(self.CurBattleRole.HP)
    self.SuccTargetHpText().text ="".. math.floor(self.OriginRole.HP).."<color=#3AFFC5>(+"..math.floor(self.OriginRole.HP-self.CurBattleRole.HP)..")</color>"


    UIEvent.LuaClick(self.SuccBtn_Back().gameObject,Handle(self,function ()
        Event.Go("BackClick")
    end))
end

--取整人物信息
function M.GetInfoCorrect(_Data)
    -- statements
    local tempInt1 =0
    local tempInt2 =0
    local tempData=0
    tempInt1,tempInt2=math.modf((_Data*1000)/1)
    tempData=tempInt1/10
    return tempData
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


return M