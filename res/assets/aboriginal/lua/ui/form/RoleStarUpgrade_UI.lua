-- Code Auto Create Begin
local M = Class('RoleStarUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleStarUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleStarUpgrade_UI].prefab'
    self.Name = 'Form[RoleStarUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RightPanel','RoleStarUpgradePanel/RightPanel',2},{'Btn_Upgrade','RoleStarUpgradePanel/RightPanel/Btn_Upgrade',2},{'Btn_JueXingPreview','RoleStarUpgradePanel/RightPanel/Btn_JueXingPreview',2},{'CostItemPrefab','RoleStarUpgradePanel/RightPanel/CostItemPrefab',2},{'RewardRankImg','RoleStarUpgradePanel/RightPanel/CostItemPrefab/RewardRankImg',2},{'CostItemIcon','RoleStarUpgradePanel/RightPanel/CostItemPrefab/CostItemIcon',2},{'CostItemPanel','RoleStarUpgradePanel/RightPanel/CostItemPanel',2},{'shuxingdi','RoleStarUpgradePanel/RightPanel/shuxingdi',2},{'StarPanelBg','RoleStarUpgradePanel/RightPanel/StarPanelBg',2},{'》','RoleStarUpgradePanel/RightPanel/》',2},{'》(1)','RoleStarUpgradePanel/RightPanel/》 (1)',2},{'》(2)','RoleStarUpgradePanel/RightPanel/》 (2)',2},{'》(3)','RoleStarUpgradePanel/RightPanel/》 (3)',2},{'fenggexian','RoleStarUpgradePanel/RightPanel/fenggexian',2},{'RoleInfoPanel','RoleStarUpgradePanel/RightPanel/RoleInfoPanel',2},{'StarJueXingPrefab','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/StarJueXingPrefab',2},{'TargetStarPanel','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/TargetStarPanel',2},{'CurStarPanel','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/CurStarPanel',2},{'StarPrefab','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/StarPrefab',2},{'UpperBtnPanel','RoleStarUpgradePanel/UpperBtnPanel',2},{'ItemPanelPrefab','RoleStarUpgradePanel/UpperBtnPanel/ItemPanelPrefab',2},{'shuliangdi','RoleStarUpgradePanel/UpperBtnPanel/ItemPanelPrefab/shuliangdi',2},{'ItemIcon','RoleStarUpgradePanel/UpperBtnPanel/ItemPanelPrefab/ItemIcon',2},{'+','RoleStarUpgradePanel/UpperBtnPanel/ItemPanelPrefab/+',2},{'ItemRoot','RoleStarUpgradePanel/UpperBtnPanel/ItemRoot',2},{'RoleStarUpSuccessPanel','RoleStarUpSuccessPanel',2},{'SuccBtn_Back','RoleStarUpSuccessPanel/SuccBtn_Back',2},{'BG','RoleStarUpSuccessPanel/BG',2},{'Zhuangshixian(shang)','RoleStarUpSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','RoleStarUpSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'Img_Dian','RoleStarUpSuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','RoleStarUpSuccessPanel/FightResult/Img_Heidi',2},{'Img_Yinying','RoleStarUpSuccessPanel/FightResult/Img_Yinying',2},{'shengxingdi','RoleStarUpSuccessPanel/shengxingdi',2},{'AddStarJuexingPrefab','RoleStarUpSuccessPanel/AddStarJuexingPrefab',2},{'AddStarPrefab','RoleStarUpSuccessPanel/AddStarPrefab',2},{'SuccStarPrefab','RoleStarUpSuccessPanel/SuccStarPrefab',2},{'SuccStarJueXingPrefab','RoleStarUpSuccessPanel/SuccStarJueXingPrefab',2},{'RoleSuccessInfoPanel','RoleStarUpSuccessPanel/RoleSuccessInfoPanel',2},{'SuccCurStarPanel','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccCurStarPanel',2},{'item1','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item1',2},{'item2','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item2',2},{'item3','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/item3',2},{'>','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/>',2},{'>(1)','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/> (1)',2},{'>(2)','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/> (2)',2},
        -- Text 列表
        {'TitleText','RoleStarUpgradePanel/RightPanel/TitleText',3},{'TitleNeedText','RoleStarUpgradePanel/RightPanel/TitleNeedText',3},{'Btn_UpgradeTxt','RoleStarUpgradePanel/RightPanel/Btn_Upgrade/Btn_UpgradeTxt',3},{'Btn_JueXingPreviewTxt','RoleStarUpgradePanel/RightPanel/Btn_JueXingPreview/Btn_JueXingPreviewTxt',3},{'ItemCountText','RoleStarUpgradePanel/RightPanel/CostItemPrefab/ItemCountText',3},{'LvNameText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/LvNameText',3},{'AtkZyNameText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/AtkZyNameText',3},{'HpNameText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/HpNameText',3},{'CurLvText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/CurLvText',3},{'TargetLvText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/TargetLvText',3},{'CurHpText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/CurHpText',3},{'CurAtkZyText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/CurAtkZyText',3},{'TargetHpText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/TargetHpText',3},{'TargetAtkZyText','RoleStarUpgradePanel/RightPanel/RoleInfoPanel/TargetAtkZyText',3},{'ItemCountText01','RoleStarUpgradePanel/UpperBtnPanel/ItemPanelPrefab/ItemCountText',3},{'Text_FightResult','RoleStarUpSuccessPanel/FightResult/Text_FightResult',3},{'LvNameText01','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/LvNameText',3},{'HpNameText01','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/HpNameText',3},{'SuccAtkZyNameText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccAtkZyNameText',3},{'SuccCurLvText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccCurLvText',3},{'SuccCurHpText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccCurHpText',3},{'SuccCurAtkZyText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccCurAtkZyText',3},{'SuccTargetLvText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccTargetLvText',3},{'SuccTargetHpText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccTargetHpText',3},{'SuccTargetAtkZyText','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/SuccTargetAtkZyText',3},{'TouchExit','RoleStarUpSuccessPanel/RoleSuccessInfoPanel/Touch Exit',3},
    }
end
-- Code Auto Create End
require("LocalData/RoleattristarupLocalData")
function M:OnInit()
    self.CurHero = RoleCardViewModel.CurrentHero
    self.RoleID =self.CurHero.id
    self.skin = self.CurHero.skin
    self.Awake = self.CurHero.awaken
    self.CurBattleRole = self.CurHero:GetHeroAttr()
    self.OriginRole = ReadData.GetRoleAttr(self.RoleID,self.CurHero.level,self.CurHero.star + 1,0,self.Awake)
    self:InitStarPreview()
    self:InitNeedPanel()
    self:InitUpPanel()
    Event.Clear("NoviceStarUp")
    Event.Add("NoviceStarUp",function ()
        NoviceViewModel.CurTaskId = NoviceViewModel.CurTaskId +1
        self:OnClickUpStar()
    end)
    ---第一次进入页面引导
    NoviceViewModel.CheckFirstGuide(120)
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
----初始化预览
function M:InitStarPreview()
    self.StarJueXingPrefab().gameObject:SetActive(false)
    self.StarPrefab().gameObject:SetActive(false)
    self.CostItemPrefab().gameObject:SetActive(false)
    self.RoleStarUpSuccessPanel().gameObject:SetActive(false)

    if self.CurBattleRole.IsAwaken == true then
        -- statements
        self:InitStar(self.CurStarPanel().gameObject,self.StarJueXingPrefab().gameObject,self.CurBattleRole.StartLV)
        self:InitStar(self.TargetStarPanel().gameObject,self.StarJueXingPrefab().gameObject,self.OriginRole.StartLV)
    else
        self:InitStar(self.CurStarPanel().gameObject,self.StarPrefab().gameObject,self.CurBattleRole.StartLV)
        self:InitStar(self.TargetStarPanel().gameObject,self.StarPrefab().gameObject,self.OriginRole.StartLV)
    end

    if self.OriginRole.StartLV == 3 then
        -- statements
        Tools.UIDoLocalScale(self.StarPanelBg().gameObject,1,0.6, 0, 0,0,0,0)
    elseif self.OriginRole.StartLV == 2 then
        -- statements
        Tools.UIDoLocalScale(self.StarPanelBg().gameObject,1,0.5, 0, 0,0,0,0)
    else
        Tools.UIDoLocalScale(self.StarPanelBg().gameObject,1,1, 0, 0,0,0,0)
    end

    local CurLower = ReadData.GetRoleAttr(self.RoleID,1,self.CurBattleRole.StartLV,0,self.Awake)
    local CurHigher = ReadData.GetRoleAttr(self.RoleID,2,self.CurBattleRole.StartLV,0,self.Awake)

    local TargetLower = ReadData.GetRoleAttr(self.RoleID,1,self.OriginRole.StartLV,0,self.Awake)
    local TargetHigher = ReadData.GetRoleAttr(self.RoleID,2,self.OriginRole.StartLV,0,self.Awake)

    if self.CurBattleRole.Occupation == 4 then
        local curtxt =self.GetCorrectRate(CurHigher.RealSuppart - CurLower.RealSuppart)
        local tartxt =self.GetCorrectRate(TargetHigher.RealSuppart - TargetLower.RealSuppart)
        self.AtkZyNameText().text =MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_supportgrow")
        self.CurAtkZyText().text =""..(curtxt*100).."%"
        self.TargetAtkZyText().text =""..(tartxt*100).."%<color=#3AFFC5>(+"..(self.GetCorrectRate(tartxt-curtxt)*100).."%)</color>"
        self.CurAtkZyText().fontSize=self.TargetAtkZyText().fontSize
    else
        local curtxt =CurHigher.RealAtk - CurLower.RealAtk
        local tartxt =TargetHigher.RealAtk - TargetLower.RealAtk
        self.AtkZyNameText().text =MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_attackgrow")
        self.CurAtkZyText().text =""..curtxt
        self.TargetAtkZyText().text =""..tartxt.."<color=#3AFFC5>(+"..(tartxt-curtxt)..")</color>"
    end
    --更新文本信息
    self.CurLvText().text =self.CurBattleRole.LvMax.."/"..self.CurBattleRole.LvMax
    self.TargetLvText().text ="1/"..self.OriginRole.LvMax

    local curhptxt =CurHigher.HP - CurLower.HP
    local tarhptxt =TargetHigher.HP - TargetLower.HP
    local subHP = ReadData.GetRoleHP(self.RoleID,2,self.OriginRole.StartLV,0,self.Awake) - ReadData.GetRoleHP(self.RoleID,1,self.OriginRole.StartLV,0,self.Awake)

    self.CurHpText().text =""..curhptxt
    self.TargetHpText().text =""..subHP.."<color=#3AFFC5>(+"..(subHP - curhptxt)..")</color>"

    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,self.OnClickUpStar))

    if self.CurHero.awaken then
        self.Btn_JueXingPreview().gameObject:SetActive(false)
    else
        self.Btn_JueXingPreview().gameObject:SetActive(true)
    end
    ---觉醒预览
    UIEvent.LuaClick(self.Btn_JueXingPreview().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.RoleJueXingPreview_UI)
    end))

    UIEvent.LuaClick(self.SuccBtn_Back().gameObject,Handle(self,function ()
        Event.Go("BackClick")
        if NoviceViewModel.CurTaskId == 22008 then
            MgrUI.Pop(UID.NoviceFrame_UI,{22008},true)
        end
    end))
end
---初始化玩家资源
function M:InitNeedPanel()
    self.CanJX = true
    local countIndex = 0
    if self.CurBattleRole.StartLV >= 6 then
        return
    end
    local StarCostTab1 = {}
    Tools.ClearAllChild(self.CostItemPanel().gameObject)
    for i, v in pairs(RoleattristarupLocalData.tab) do
        if self.CurBattleRole.Rank == v[2] and self.CurBattleRole.StartLV == v[3] then
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
function M:ReceiveUpStarACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroStarACK',buffer))
    print(tab)
end

function M:ReceiveUpStarNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroStarNTF',buffer))
    MgrUI.PopHide(UID.NoviceFrame_UI)
    if NoviceViewModel.CurTaskId == 22008 then
        ---保存进度
        NoviceViewModel.SaveProgress(22010)
    end
    self:InitStarUpSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
end

function M:OnClickUpStar()
    if not self.CanJX then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_tips1"),1},true)
        return
    end
    local UpStarREQ =
    {
        heroID = self.RoleID,
        heroStar = self.CurBattleRole.StartLV
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroStarREQ',UpStarREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_STAR_REQ,bytes,0,nil,Handle(self,self.ReceiveUpStarACK),Handle(self,self.ReceiveUpStarNTF))
end


--初始化升星成功
function M:InitStarUpSuccessPanel()
    MgrSound.PlayEffect("yx_ui_qianghua_01",1,nil,false)
    -- statements
    if NoviceViewModel.CurTaskId ~=22008 then
        RoleCardViewModel.PlayRoleVoice(7)
    end
    self.RoleStarUpSuccessPanel().gameObject:SetActive(true)

    self.AddStarJuexingPrefab().gameObject:SetActive(false)
    self.AddStarPrefab().gameObject:SetActive(false)
    self.SuccStarPrefab().gameObject:SetActive(false)
    self.SuccStarJueXingPrefab().gameObject:SetActive(false)

    if self.CurBattleRole.IsAwaken == true then
        -- statements
        self:InitStar(self.SuccCurStarPanel().gameObject,self.SuccStarJueXingPrefab().gameObject,self.OriginRole.StartLV)
    else
        self:InitStar(self.SuccCurStarPanel().gameObject,self.SuccStarPrefab().gameObject,self.OriginRole.StartLV)
    end

    local CurLower = ReadData.GetRoleAttr(self.RoleID,1,self.CurBattleRole.StartLV,0,self.Awake)
    local CurHigher = ReadData.GetRoleAttr(self.RoleID,2,self.CurBattleRole.StartLV,0,self.Awake)

    local TargetLower = ReadData.GetRoleAttr(self.RoleID,1,self.OriginRole.StartLV,0,self.Awake)
    local TargetHigher = ReadData.GetRoleAttr(self.RoleID,2,self.OriginRole.StartLV,0,self.Awake)

    if self.CurBattleRole.Occupation == 4 then
        local curtxt =self.GetCorrectRate(CurHigher.RealSuppart - CurLower.RealSuppart)
        local tartxt =self.GetCorrectRate(TargetHigher.RealSuppart - TargetLower.RealSuppart)
        self.SuccAtkZyNameText().text =MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_supportgrow")
        self.SuccCurAtkZyText().text =""..(curtxt*100).."%"
        self.SuccTargetAtkZyText().text =""..(tartxt*100).."%<color=#3AFFC5>(+"..(self.GetCorrectRate(tartxt-curtxt)*100).."%)</color>"
    else
        local curtxt =CurHigher.RealAtk - CurLower.RealAtk
        local tartxt =TargetHigher.RealAtk - TargetLower.RealAtk
        self.SuccAtkZyNameText().text =MgrLanguageData.GetLanguageByKey("rolestarupgrade_ui_attackgrow")
        self.SuccCurAtkZyText().text =""..curtxt
        self.SuccTargetAtkZyText().text =""..tartxt.."<color=#3AFFC5>(+"..(tartxt-curtxt)..")</color>"
    end
    --更新文本信息
    self.SuccCurLvText().text =self.CurBattleRole.LvMax.."/"..self.CurBattleRole.LvMax
    self.SuccTargetLvText().text ="1/"..self.OriginRole.LvMax

    local curhptxt =CurHigher.HP - CurLower.HP
    local tarhptxt =TargetHigher.HP - TargetLower.HP

    self.SuccCurHpText().text =""..curhptxt
    self.SuccTargetHpText().text =""..tarhptxt.."<color=#3AFFC5>(+"..(tarhptxt-curhptxt)..")</color>"
end


function M.GetCorrectRate(_Rate)
    -- statements
    local tempRate = _Rate*10000
    local _Rate,data2 = math.modf(tempRate/1)
    _Rate=_Rate/10000
    return _Rate
end

--创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj= GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj:SetActive(true)
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
return M