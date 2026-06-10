-- Code Auto Create Begin
local M = Class('RoleSkillUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleSkillUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleSkillUpgrade_UI].prefab'
    self.Name = 'Form[RoleSkillUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleSkillUpgradePanel','RoleSkillUpgradePanel',2},{'SkillPreviewPanel','RoleSkillUpgradePanel/SkillPreviewPanel',2},{'RoleSkillIcon1','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1',2},{'Img_Cishu1','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu1',2},{'Highlight','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu1/Highlight',2},{'Img_Cishu2','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu2',2},{'Highlight01','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu2/Highlight',2},{'Img_Cishu3','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu3',2},{'Highlight02','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu3/Highlight',2},{'Img_Cishu4','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu4',2},{'Highlight03','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Img_Cishu4/Highlight',2},{'UpgradeIcon','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/UpgradeIcon',2},{'Icon1','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/Icon1',2},{'UnlockIcon','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/UnlockIcon',2},{'RoleSkillIcon2','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2',2},{'UpgradeIcon01','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2/UpgradeIcon',2},{'Icon2','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2/Icon2',2},{'UnlockIcon01','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2/UnlockIcon',2},{'RoleSkillIcon3','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3',2},{'UpgradeIcon02','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3/UpgradeIcon',2},{'Icon3','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3/Icon3',2},{'UnlockIcon02','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3/UnlockIcon',2},{'RoleSkillIcon4','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4',2},{'UpgradeIcon03','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/UpgradeIcon',2},{'Icon4','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/Icon4',2},{'ImageJXSuo','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/ImageJXSuo',2},{'Image','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/ImageJXSuo/Image',2},{'UnlockIcon03','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/UnlockIcon',2},{'RoleSkillRangePanel','RoleSkillUpgradePanel/RoleSkillRangePanel',2},{'Img_Fanweidi','RoleSkillUpgradePanel/RoleSkillRangePanel/Img_Fanweidi',2},{'Img_Zuo','RoleSkillUpgradePanel/RoleSkillRangePanel/Img_Zuo',2},{'Img_You','RoleSkillUpgradePanel/RoleSkillRangePanel/Img_You',2},{'RoleAtkRangeImg','RoleSkillUpgradePanel/RoleSkillRangePanel/RoleAtkRangeImg',2},{'Btn_Upgrade','RoleSkillUpgradePanel/Btn_Upgrade',2},{'Btn_PreviewSkill','RoleSkillUpgradePanel/Btn_PreviewSkill',2},{'RankUpCostPanel','RoleSkillUpgradePanel/RankUpCostPanel',2},{'Img_Biaotixian','RoleSkillUpgradePanel/RankUpCostPanel/Img_Biaotixian',2},{'Img_GoldNeedIcon','RoleSkillUpgradePanel/RankUpCostPanel/Img_GoldNeedIcon',2},{'HasFragmentBG','RoleSkillUpgradePanel/RankUpCostPanel/HasFragmentBG',2},{'CostFragmentBG','RoleSkillUpgradePanel/RankUpCostPanel/CostFragmentBG',2},{'Img_Xian2','RoleSkillUpgradePanel/Img_Xian2',2},{'Img_Xian1','RoleSkillUpgradePanel/Img_Xian1',2},{'RankUpPreviewPanel','RoleSkillUpgradePanel/RankUpPreviewPanel',2},{'Img_Biaotixian01','RoleSkillUpgradePanel/RankUpPreviewPanel/Img_Biaotixian',2},{'DirImg','RoleSkillUpgradePanel/RankUpPreviewPanel/DirImg',2},{'Lvdi','RoleSkillUpgradePanel/RankUpPreviewPanel/Lvdi',2},{'Btn_MaxLv','RoleSkillUpgradePanel/RankUpPreviewPanel/Lvdi/Btn_MaxLv',2},{'lvmindi','RoleSkillUpgradePanel/RankUpPreviewPanel/lvmindi',2},{'Btn_MinLv','RoleSkillUpgradePanel/RankUpPreviewPanel/lvmindi/Btn_MinLv',2},{'Btn_LvDownHighLight','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvDownHighLight',2},{'-(hei)2','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvDownHighLight/-(hei)2',2},{'Btn_LvDown','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvDown',2},{'-(hui)2','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvDown/-(hui)2',2},{'Btn_LvUpHighLight','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvUpHighLight',2},{'+(hei)2','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvUpHighLight/+(hei)2',2},{'Btn_LvUp','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvUp',2},{'+(hui)2','RoleSkillUpgradePanel/RankUpPreviewPanel/Btn_LvUp/+(hui)2',2},{'UpperBtnPanel','RoleSkillUpgradePanel/UpperBtnPanel',2},{'ItemPanelPrefab','RoleSkillUpgradePanel/UpperBtnPanel/ItemPanelPrefab',2},{'Img_Itemdi','RoleSkillUpgradePanel/UpperBtnPanel/ItemPanelPrefab/Img_Itemdi',2},{'ItemIcon','RoleSkillUpgradePanel/UpperBtnPanel/ItemPanelPrefab/ItemIcon',2},{'+','RoleSkillUpgradePanel/UpperBtnPanel/ItemPanelPrefab/+',2},{'ItemRoot','RoleSkillUpgradePanel/UpperBtnPanel/ItemRoot',2},{'RoleSkillUpSuccessPanel','RoleSkillUpSuccessPanel',2},{'Btn_SuccessBack','RoleSkillUpSuccessPanel/Btn_SuccessBack',2},{'BG','RoleSkillUpSuccessPanel/BG',2},{'Zhuangshixian(shang)','RoleSkillUpSuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','RoleSkillUpSuccessPanel/BG/zhuangshixian(yangcheng)',2},{'BackGround','RoleSkillUpSuccessPanel/BackGround',2},{'>>','RoleSkillUpSuccessPanel/>>',2},{'Img_Dian','RoleSkillUpSuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','RoleSkillUpSuccessPanel/FightResult/Img_Heidi',2},{'Img_Yinying','RoleSkillUpSuccessPanel/FightResult/Img_Yinying',2},
        -- Text 列表
        {'Text_Qianghua','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/UpgradeIcon/Text_Qianghua',3},{'UpgradeText','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon1/UnlockIcon/UpgradeText',3},{'Text_Qianghua01','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2/UpgradeIcon/Text_Qianghua',3},{'UpgradeText01','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon2/UnlockIcon/UpgradeText',3},{'Text_Qianghua02','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3/UpgradeIcon/Text_Qianghua',3},{'UpgradeText02','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon3/UnlockIcon/UpgradeText',3},{'Text_Qianghua03','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/UpgradeIcon/Text_Qianghua',3},{'UpgradeText03','RoleSkillUpgradePanel/SkillPreviewPanel/RoleSkillIcon4/UnlockIcon/UpgradeText',3},{'Text_Fanweikuoda','RoleSkillUpgradePanel/RoleSkillRangePanel/Text_Fanweikuoda',3},{'ConfirmText','RoleSkillUpgradePanel/Btn_Upgrade/ConfirmText',3},{'SkillPreviewText','RoleSkillUpgradePanel/Btn_PreviewSkill/SkillPreviewText',3},{'Text_Qianghuaxiaohao','RoleSkillUpgradePanel/RankUpCostPanel/Text_Qianghuaxiaohao',3},{'Text_GoldNeedTitle','RoleSkillUpgradePanel/RankUpCostPanel/Text_GoldNeedTitle',3},{'Text_GoldNeedCount','RoleSkillUpgradePanel/RankUpCostPanel/Text_GoldNeedCount',3},{'HasFragment','RoleSkillUpgradePanel/RankUpCostPanel/HasFragmentBG/HasFragment',3},{'HasText','RoleSkillUpgradePanel/RankUpCostPanel/HasFragmentBG/HasText',3},{'CostFragment','RoleSkillUpgradePanel/RankUpCostPanel/CostFragmentBG/CostFragment',3},{'CostText','RoleSkillUpgradePanel/RankUpCostPanel/CostFragmentBG/CostText',3},{'Text_Touchtoexit','RoleSkillUpgradePanel/RankUpPreviewPanel/Text_Touchtoexit',3},{'BtnMaxLV_Txt','RoleSkillUpgradePanel/RankUpPreviewPanel/Lvdi/BtnMaxLV_Txt',3},{'BtnMinLV_Txt','RoleSkillUpgradePanel/RankUpPreviewPanel/lvmindi/BtnMinLV_Txt',3},{'RankOldLvText','RoleSkillUpgradePanel/RankUpPreviewPanel/RankOldLvText',3},{'RankNewLvText','RoleSkillUpgradePanel/RankUpPreviewPanel/RankNewLvText',3},{'ItemCountText','RoleSkillUpgradePanel/UpperBtnPanel/ItemPanelPrefab/ItemCountText',3},{'RankName','RoleSkillUpSuccessPanel/BackGround/RankName',3},{'CurRankText','RoleSkillUpSuccessPanel/BackGround/CurRankText',3},
        -- UITemplate 列表
        {'UpItem','RoleSkillUpgradePanel/RankUpCostPanel/UpItem',10},
        -- TextMeshProUGUI 列表
        {'TarRankText','RoleSkillUpSuccessPanel/BackGround/TarRankText',20},{'Text_Touchtoexit01','RoleSkillUpSuccessPanel/BackGround/Text_Touchtoexit',20},{'Text_FightResult','RoleSkillUpSuccessPanel/FightResult/Text_FightResult',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleattriskillupLocalData")

function M:OnInit()
    self.PlayerMoney = 0
    self.PlayerCost = 0
    ---@type ItemData
    self.costItem= nil
    self.CurBattleRole = RoleCardViewModel.CurrentHero:GetHeroAttrNoAdditional()
    self.RoleID = RoleCardViewModel.CurrentHero.id
    self.LocalPreviewLv = self.CurBattleRole.SkillLV + 1
    self.PreviewRole = ReadData.GetRoleAttr(self.RoleID,RoleCardViewModel.CurrentHero.level,RoleCardViewModel.CurrentHero.star,self.LocalPreviewLv,RoleCardViewModel.CurrentHero.awaken)
    self.cost = 0
    self.moneyCost = 0
    self:GetCost(self.CurBattleRole.SkillLV,self.LocalPreviewLv)
    self.UpgradeIcon().gameObject:SetActive(false)
    self.UnlockIcon().gameObject:SetActive(false)
    self.UpgradeIcon01().gameObject:SetActive(false)
    self.UnlockIcon01().gameObject:SetActive(false)
    self.UpgradeIcon02().gameObject:SetActive(false)
    self.UnlockIcon02().gameObject:SetActive(false)
    self.UpgradeIcon03().gameObject:SetActive(false)
    self.UnlockIcon03().gameObject:SetActive(false)
    self.RoleSkillUpSuccessPanel().gameObject:SetActive(false)

    ---初始化预览面板
    self:InitSkillPreviewPanel()
    ---初始化消耗
    self:InitCostPanel()
    ---绑定按钮事件
    self:InitRoleUpgradeBtnEvent()
    self:InitUpPanel()
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

function M:InitSkillPreviewPanel()

    self.CostFragment().text =  math.floor(self.cost)
    self.Text_GoldNeedCount().text =  math.floor(self.moneyCost)

    if self.PreviewRole.SkillLV < self.PreviewRole.SkillMaxLV then
        self:SwitchBtnState(1)
    else
        self:SwitchBtnState(2)
    end
    if self.PreviewRole.SkillLV > 1 then
        self:SwitchBtnState(3)
    else
        self:SwitchBtnState(4)
    end
    if self.PreviewRole.SkillLV == self.CurBattleRole.SkillLV + 1 then
        self:SwitchBtnState(4)
    end

    if self.PreviewRole.AtkRangeIsNew then
        self.Text_Fanweikuoda().gameObject:SetActive(true)
    else
        self.Text_Fanweikuoda().gameObject:SetActive(false)
    end

    if RoleCardViewModel.CurrentHero.skillDir == 0 then
        self.Img_Zuo().gameObject:SetActive(true)
        self.Img_You().gameObject:SetActive(false)
    else
        self.Img_Zuo().gameObject:SetActive(false)
        self.Img_You().gameObject:SetActive(true)
    end
    if self.PreviewRole.Occupation == 4 then
        MgrRes.LoadSprite(self.RoleAtkRangeImg(),"AtkRange/SupportRange/"..self.PreviewRole.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.RoleAtkRangeImg(),"AtkRange/OtherRange/"..self.PreviewRole.AttackRangeTexture)
    end
    
    self.RankOldLvText().text="<size=90>"..self.CurBattleRole.SkillLV.."</size>/"..self.CurBattleRole.SkillMaxLV
    self.RankNewLvText().text="<color=#1CFFD7><size=90>"..self.PreviewRole.SkillLV.."</size></color>/"..self.PreviewRole.SkillMaxLV
    --技能Icon初始化
    --技能图标1、2、3、4
    if self.PreviewRole.Skill_1_example[1]~=nil then
        self.Icon1().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Icon1().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewRole.Skill_1_example,1)
        end))
        MgrRes.LoadSprite(self.Icon1(),"Skill/"..self.PreviewRole.Skill_1_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if self.PreviewRole.Skill_1_IsSLv== true then
            -- statements
            -- print("一技能可以解锁等级为".._RoleSkillLv)
            self.UnlockIcon().gameObject:SetActive(true)
        else
            self.UnlockIcon().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon().gameObject:SetActive(false)
        for key_example, value_example in pairs(self.PreviewRole.Skill_1_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon().gameObject:SetActive(true)
                break
            end
        end
    else
        self.Icon1().gameObject:SetActive(true)
        self.UpgradeIcon().gameObject:SetActive(false)
        self.UnlockIcon().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Icon1(),"Skill/".."icon_skill_empty")
    end
    if self.PreviewRole.Skill_2_example[1]~=nil then
        self.Icon2().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Icon2().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewRole.Skill_2_example,2)
        end))
        MgrRes.LoadSprite(self.Icon2(),"Skill/"..self.PreviewRole.Skill_2_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if  self.PreviewRole.Skill_2_IsSLv == true then
            -- statements
            --  print("二技能可以解锁等级为".._RoleSkillLv)
            self.UnlockIcon01().gameObject:SetActive(true)
        else
            self.UnlockIcon01().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon01().gameObject:SetActive(false)
        for key_example, value_example in pairs(self.PreviewRole.Skill_2_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon01().gameObject:SetActive(true)
                break
            end
        end
    else
        self.Icon2().gameObject:SetActive(true)
        self.UpgradeIcon01().gameObject:SetActive(false)
        self.UnlockIcon01().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Icon2(),"Skill/".."icon_skill_empty")
    end
    if self.PreviewRole.Skill_3_example[1]~=nil then
        self.Icon3().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Icon3().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewRole.Skill_3_example,3)
        end))
        MgrRes.LoadSprite(self.Icon3(),"Skill/"..self.PreviewRole.Skill_3_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if self.PreviewRole.Skill_3_IsSLv == true then
            -- statements
            -- print("三技能可以解锁等级为".._RoleSkillLv)
            self.UnlockIcon02().gameObject:SetActive(true)
        else
            self.UnlockIcon02().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon02().gameObject:SetActive(false)
        for key_example, value_example in pairs(self.PreviewRole.Skill_3_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon02().gameObject:SetActive(true)
                break
            end
        end
    else
        self.Icon3().gameObject:SetActive(true)
        self.UpgradeIcon02().gameObject:SetActive(false)
        self.UnlockIcon02().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Icon3(),"Skill/".."icon_skill_empty")
    end
    if self.PreviewRole.Skill_4_example[1]~=nil then
        self.Icon4().gameObject:SetActive(true)
        UIEvent.LuaClick(self.Icon4().gameObject,Handle(self, function ()
            self:InitCombineSkillPanel(self.PreviewRole.Skill_4_example,4)
        end))
        MgrRes.LoadSprite(self.Icon4(),"Skill/"..self.PreviewRole.Skill_4_example[1].Icon)
        --此处代码判断是否该等级解锁技能
        if self.PreviewRole.Skill_4_IsSLv == true then
            -- statements
            -- print("四技能可以解锁等级为".._RoleSkillLv)
            self.UnlockIcon03().gameObject:SetActive(true)
        else
            self.UnlockIcon03().gameObject:SetActive(false)
        end
        --此处代码用来判断是否当前等级该技能可以强化
        self.UpgradeIcon03().gameObject:SetActive(false)
        for key_example, value_example in pairs(self.PreviewRole.Skill_4_example) do
            if value_example.IsSLv == true then
                self.UpgradeIcon03().gameObject:SetActive(true)
                break
            end
        end
        if self.PreviewRole.IsAwaken then
            self.ImageJXSuo().gameObject:SetActive(false)
        else
            self.ImageJXSuo().gameObject:SetActive(true)
        end
    else
        self.Icon4().gameObject:SetActive(true)
        self.UpgradeIcon03().gameObject:SetActive(false)
        self.UnlockIcon03().gameObject:SetActive(false)
        MgrRes.LoadSprite(self.Icon4(),"Skill/".."icon_skill_empty")
    end
end
--人物预览升降级按钮事件绑定
function M:InitRoleUpgradeBtnEvent()

    if not (self.CurBattleRole.SkillLV >= self.CurBattleRole.SkillMaxLV) then
        UIEvent.LuaClick(self.Btn_Upgrade().gameObject,Handle(self,self.OnClickUpgrade))

        UIEvent.LuaClick(self.Btn_LvUpHighLight().gameObject,Handle(self, function ()
            self:OnClickLVBtn(true,self.CurBattleRole.SkillMaxLV,self.LocalPreviewLv)
        end))

        UIEvent.LuaClick(self.Btn_LvDownHighLight().gameObject,Handle(self, function ()
            self:OnClickLVBtn(false,self.CurBattleRole.SkillMaxLV,self.LocalPreviewLv)
        end))

        UIEvent.LuaClick(self.Btn_MaxLv().gameObject,Handle(self,self.UpMax))
        UIEvent.LuaClick(self.Btn_MinLv().gameObject,Handle(self,self.UpMin))
    end
end

function M:UpMax()
    self.cost = 0
    self.moneyCost = 0
    local coin = ItemControl.GetAllItems()[100001] and ItemControl.GetAllItems()[100001].count or 0
    if self:GetTargetLvByBookCount(self.costItem.count) > self.CurBattleRole.SkillLV then
        ---如果货币不足
        if self.moneyCost > coin then
            local bookCount = coin / (self.moneyCost / self.cost)
            self.LocalPreviewLv = self:GetTargetLvByBookCount(bookCount)
            self:GetCost(self.CurBattleRole.SkillLV,self.LocalPreviewLv)
        else
            self.LocalPreviewLv  = self.CurBattleRole.SkillMaxLV
            self:GetCost(self.CurBattleRole.SkillLV,self.CurBattleRole.SkillMaxLV)
        end
    else
        self.LocalPreviewLv  = self.CurBattleRole.SkillLV + 1
        self:GetCost(self.CurBattleRole.SkillLV,self.LocalPreviewLv)
    end
    self.PreviewRole.SkillLV = self.LocalPreviewLv
    self.PreviewRole = ReadData.GetRoleAttr(self.RoleID,self.CurBattleRole.LV,self.CurBattleRole.StartLV,self.LocalPreviewLv,RoleCardViewModel.CurrentHero.awaken)
    self:InitSkillPreviewPanel()
end
function M:UpMin()
    local lv = self.CurBattleRole.SkillLV
    if lv == 0 then
        lv = 1
    end
    if lv == RoleCardViewModel.CurrentHero.skillLevel then
        lv = lv + 1
    end
    if lv == self.LocalPreviewLv then
        return
    end
    self.PreviewRole = ReadData.GetRoleAttr(self.RoleID,self.CurBattleRole.LV,self.CurBattleRole.StartLV,lv,RoleCardViewModel.CurrentHero.awaken)
    self.cost = 0
    self.moneyCost = 0
    self:GetCost(self.CurBattleRole.SkillLV,lv)
    self.LocalPreviewLv  = lv
    self:InitSkillPreviewPanel()
end

function M:ReceiveChipSynthesisACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroSkillUPACK',buffer))
    print(tab)
end

function M:ReceiveCoreChipNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroSkillUPNTF',buffer))
    if NoviceViewModel.CurTaskId == 20208 then
        Event.Clear("ClearUpUI")
        Event.Go("ClearUpUI",function()
            self.RoleSkillUpSuccessPanel().gameObject:SetActive(false)
        end)
    end
    self:InitSkillUpSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
    NoviceViewModel.GoCheck(20208)
end

--初始化技能升级成功
function M:InitSkillUpSuccessPanel()
    MgrSound.PlayEffect("yx_ui_qianghua_01",nil,nil,false)
    -- statements
    self.RoleSkillUpSuccessPanel().gameObject:SetActive(true)
    if NoviceViewModel.CurTaskId ~= 20008 then
        RoleCardViewModel.PlayRoleVoice(9)
    end
    self.CurRankText().text=""..self.CurBattleRole.SkillLV
    self.TarRankText().text=""..self.PreviewRole.SkillLV
    UIEvent.LuaClick(self.Btn_SuccessBack().gameObject,Handle(self,function ()
        self.RoleSkillUpSuccessPanel().gameObject:SetActive(false)
        self.CurBattleRole = RoleCardViewModel.CurrentHero:GetHeroAttrNoAdditional()
        if self.CurBattleRole.SkillLV>=self.CurBattleRole.SkillMaxLV then
            Event.Go("BackClick")
            return
        end
        self.RoleID = RoleCardViewModel.CurrentHero.id
        self.LocalPreviewLv = self.CurBattleRole.SkillLV + 1
        self.PreviewRole = ReadData.GetRoleAttr(self.RoleID,RoleCardViewModel.CurrentHero.level,RoleCardViewModel.CurrentHero.star,self.LocalPreviewLv,RoleCardViewModel.CurrentHero.awaken)
        self.cost = 0
        self.moneyCost = 0
        self:GetCost(self.CurBattleRole.SkillLV,self.LocalPreviewLv)
        ---初始化预览面板
        self:InitSkillPreviewPanel()
        ---初始化消耗
        self:InitCostPanel()
        self:InitUpPanel()
        if NoviceViewModel.CurTaskId == 20008 then
            MgrUI.Pop(UID.NoviceFrame_UI,{20008},true)
        end
    end))
end

function M:OnClickUpgrade()
    if self.moneyCost > self.PlayerMoney then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("newgearupgrade_ui_core_tips8"),1},true)
        return
    end
    if self.cost > self.PlayerCost then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),1},true)
        return
    end
    if self.CurBattleRole.SkillLV >= self.CurBattleRole.SkillMaxLV then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips2"),1},true)
        return
    end
    local ExpREQ =
    {
        heroID = self.RoleID,
        heroSkill = self.CurBattleRole.SkillLV,
        heroTargetSkill = self.PreviewRole.SkillLV
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientHeroSkillUPREQ',ExpREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_HERO_SKILL_UP_REQ,bytes,0,nil,Handle(self,self.ReceiveChipSynthesisACK),Handle(self,self.ReceiveCoreChipNTF))

end


--点击升级按钮
function M:OnClickLVBtn(_IsPlus,_tempRoleMaxSkillLV,_tempPreviewSkillLv)
    if _tempPreviewSkillLv > _tempRoleMaxSkillLV then
        -- statements
        _tempPreviewSkillLv=_tempRoleMaxSkillLV
    elseif _tempPreviewSkillLv < 0 then
        -- statements
        _tempPreviewSkillLv = 1
    end

    if _IsPlus == true then
        -- statements
        if _tempPreviewSkillLv < _tempRoleMaxSkillLV then
            -- statements
            _tempPreviewSkillLv = _tempPreviewSkillLv +1
        else
            _tempPreviewSkillLv = _tempPreviewSkillLv
        end
    else
        if _tempPreviewSkillLv > 0 then
            if _tempPreviewSkillLv ~= self.CurBattleRole.SkillLV + 1 then
                _tempPreviewSkillLv = _tempPreviewSkillLv - 1
            end
            if _tempPreviewSkillLv == 0 then
                _tempPreviewSkillLv = 1
            end
        else
            _tempPreviewSkillLv = _tempPreviewSkillLv
        end
    end

    self.PreviewRole = ReadData.GetRoleAttr(self.RoleID,self.CurBattleRole.LV,self.CurBattleRole.StartLV,_tempPreviewSkillLv,RoleCardViewModel.CurrentHero.awaken)
    self.cost = 0
    self.moneyCost = 0
    self:GetCost(self.CurBattleRole.SkillLV,_tempPreviewSkillLv)
    self.LocalPreviewLv  = _tempPreviewSkillLv
    MgrSound.PlayEffect("yx_ui_shuzigundong_01",1,nil,false)
    self:InitSkillPreviewPanel()
end

---获取消耗
function M:GetCost(nowLv,targetLv)
    if targetLv == nowLv then
        return
    end
    local skillUpData = SkillUpControl.GetSkillUpData(self.CurBattleRole.Rank, targetLv-1, self.CurBattleRole.New_Career)
    self.cost = self.cost + tonumber(skillUpData.cost[3])
    self.moneyCost =self.moneyCost + tonumber(skillUpData.ortherCost[3])
    --for i, v in pairs(RoleattriskillupLocalData.tab) do
    --    if v[2] == self.CurBattleRole.Rank and v[3] == targetLv-1 then
    --        print(targetLv ,nowLv)
    --      local arr = JNStrTool.strSplit(",",v[4])
    --        local xinwu = JNStrTool.strSplit("_",arr[1])
    --        local money = {0,0,0}
    --        if arr[2] ~= nil then
    --            money = JNStrTool.strSplit("_",arr[2])
    --        end
    --        self.cost = self.cost + xinwu[3]
    --        self.moneyCost =self.moneyCost + money[3]
    --        break
    --    end
    --end
    ---递归获取消耗
    self:GetCost(nowLv,targetLv - 1)
end

function M:GetTargetLvByBookCount(count)
    local cost = 0
    for i, v in pairs(RoleattriskillupLocalData.tab) do
        if v[2] == self.CurBattleRole.Rank then
            local arr = JNStrTool.strSplit(",",v[4])
            local xinwu = JNStrTool.strSplit("_",arr[1])
            cost = cost + xinwu[3]
            if count < cost then
                return v[3]
            end
        end
    end
    return cost
end

function M:InitCostPanel()

    if self.CurBattleRole.Rank ==1 or self.CurBattleRole.Rank ==2 then
        self.costItem= ItemControl.GetItemByID(110092)
    elseif self.CurBattleRole.Rank ==3 then
        self.costItem= ItemControl.GetItemByID(110091)
    elseif self.CurBattleRole.Rank ==4 then
        self.costItem= ItemControl.GetItemByID(110090)
    end
    self.UpItem():SetData(self.costItem)

    if self.costItem.count then
        self.HasFragment().text = self.costItem.count
        self.PlayerCost = self.costItem.count
        self.HasText().text =MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_have")..self.costItem.name
        self.CostText().text = MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_consume")..self.costItem.name
    else
        self.HasFragment().text = 0
    end
end



--切换按钮高光低光
function M:SwitchBtnState(_BtnType)
    -- statements
    if _BtnType == 1 then
        -- 显示高光等级提升按钮
        self.BtnMaxLV_Txt().text= MgrLanguageData.GetLanguageByKey("ui_levelmax_text")
        Tools.ObjSetLastSibling(self.Btn_LvUpHighLight().gameObject)
    elseif _BtnType == 2 then
        -- 显示低光光等级提升按钮
        self.BtnMaxLV_Txt().text="<color=#A8A8A8>Max</color>"
        Tools.ObjSetLastSibling(self.Btn_LvUp().gameObject)
    elseif _BtnType == 3 then
        -- 显示高光等级减少按钮
        self.BtnMinLV_Txt().text="Min"
        Tools.ObjSetLastSibling(self.Btn_LvDownHighLight().gameObject)
    elseif _BtnType == 4 then
        -- 显示低光等级减少按钮
        self.BtnMinLV_Txt().text="<color=#A8A8A8>Min</color>"
        Tools.ObjSetLastSibling(self.Btn_LvDown().gameObject)
    end
end

---点击弹出详情技能界面
function M:InitCombineSkillPanel(_Skill,_index)
    MgrUI.Pop(UID.RolePreview_UI,{RoleCardViewModel.CurrentHero,2,_Skill,_index,self.PreviewRole.SkillLV},true)
end
return M