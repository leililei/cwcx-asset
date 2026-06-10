-- Code Auto Create Begin
local M = Class('CoreChipSynPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CoreChipSynPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CoreChipSynPop_UI].prefab'
    self.Name = 'Form[CoreChipSynPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 3
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Btn_Back',2},{'tanchuangdi','tanchuangdi',2},{'Img_Sanjiaoxian1','tanchuangdi/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','tanchuangdi/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','tanchuangdi/Img_Wangdianzuo',2},{'Img_Wangdianyou','tanchuangdi/Img_Wangdianyou',2},{'RoleGearResultPanel','RoleGearResultPanel',2},{'ImgMask','RoleGearResultPanel/ImgMask',2},{'shujudi','RoleGearResultPanel/ImgMask/RightInfoRoot/shujudi',2},{'GearInfoPrefab','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab',2},{'shuxingtiao','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab/shuxingtiao',2},{'GearInfoIcon','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab/GearInfoIcon',2},{'GearInfoSlider','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab/GearInfoSlider',2},{'GearSkillPrefab','RoleGearResultPanel/ImgMask/RightInfoRoot/GearSkillPrefab',2},{'shuxingtiao01','RoleGearResultPanel/ImgMask/RightInfoRoot/GearSkillPrefab/shuxingtiao',2},{'Image','RoleGearResultPanel/ImgMask/RightInfoRoot/GearSkillPrefab/Text_SkillName/Image',2},{'GearInfoIcon01','RoleGearResultPanel/ImgMask/RightInfoRoot/GearSkillPrefab/GearInfoIcon',2},{'GearInfoPanel','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPanel',2},{'jijiamingdi2','RoleGearResultPanel/ImgMask/RightInfoRoot/jijiamingdi2',2},{'landi2','RoleGearResultPanel/ImgMask/RightInfoRoot/landi2',2},{'Xian','RoleGearResultPanel/ImgMask/RightInfoRoot/Xian',2},{'RankKuangImg','RoleGearResultPanel/GearIconPanel/RankKuangImg',2},{'tubiaodi2','RoleGearResultPanel/GearIconPanel/tubiaodi2',2},{'GearIconImg','RoleGearResultPanel/GearIconPanel/tubiaodi2/GearIconImg',2},{'xingdi2','RoleGearResultPanel/GearIconPanel/xingdi2',2},{'RankPlusPanel','RoleGearResultPanel/GearIconPanel/RankPlusPanel',2},{'RankPlusIconImg','RoleGearResultPanel/GearIconPanel/RankPlusPanel/RankPlusIconImg',2},{'StarRoot','RoleGearResultPanel/GearIconPanel/StarRoot',2},{'StarPrefab','RoleGearResultPanel/GearIconPanel/StarRoot/StarPrefab',2},{'StarHighLight','RoleGearResultPanel/GearIconPanel/StarRoot/StarPrefab/StarHighLight',2},{'StarPanel','RoleGearResultPanel/GearIconPanel/StarPanel',2},
        -- TextMeshProUGUI 列表
        {'GearInfoText','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab/GearInfoText',20},{'GearInfoNameTxt','RoleGearResultPanel/ImgMask/RightInfoRoot/GearInfoPrefab/GearInfoNameTxt',20},{'Text_SkillName','RoleGearResultPanel/ImgMask/RightInfoRoot/GearSkillPrefab/Text_SkillName',20},{'GearNameText','RoleGearResultPanel/ImgMask/RightInfoRoot/jijiamingdi2/GearNameText',20},{'GearRankText','RoleGearResultPanel/ImgMask/RightInfoRoot/landi2/GearRankText',20},{'Txt_Back(1)','RoleGearResultPanel/Txt_Back (1)',20},{'TitleTextCN','TitleTextCN',20},{'TitleTextEN','TitleTextEN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---星级初始化
    self.StarHighObjs = {}
    for i = 1,BagViewModel.GetCoreStarMax() do
        local obj = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarRoot().gameObject.transform,false)
        self.StarHighObjs[i] = obj.transform:Find("StarHighLight").gameObject
        self.StarHighObjs[i]:SetActive(false)
    end
    ---创建最大基础属性词条
    local maxAttr = BagViewModel.GetCoreAttrMax()
    self.attrList = {}
    for i = 1, maxAttr do
        self.attrList[i] = GameObject.Instantiate(self.GearInfoPrefab().gameObject,self.GearInfoPanel().gameObject.transform,false).transform
    end
    ---隐藏基础词条预制
    self.GearInfoPrefab().gameObject:SetActive(false)
    ---隐藏追加技能词条
    self.GearSkillPrefab().gameObject:SetActive(false)
    ---设置技能词条节点
    self.GearSkillPrefab().transform:SetParent(self.GearInfoPanel().gameObject.transform,false)
    ---隐藏星预制
    self.StarPrefab().gameObject:SetActive(false)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:ClosePop()
    end
end

function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_huodejiangli_01",1,nil,false)
    ---@type CoreData
    self.pData = args[1]
    ---图标
    MgrRes.LoadSprite(self.GearIconImg(),self.pData.icon)
    ---名称
    self.GearNameText().text = self.pData.name
    ---强化等级
    self.GearRankText().text = "+"..self.pData.level
    ---星等级
    for i = 1, #self.StarHighObjs do
        self.StarHighObjs[i]:SetActive(self.pData.star>=i)
        if self.pData.quality >= 5 then
            MgrRes.LoadSprite(self.StarHighObjs[i]:GetComponent("Image"),"Item/Img_XingSuper")
        else
            MgrRes.LoadSprite(self.StarHighObjs[i]:GetComponent("Image"),"Item/Img_Xing_23")
        end
    end
    ---品质框
    --MgrRes.LoadSprite(self.RankKuangImg(),self.pData.iconFrame)
    MgrRes.LoadSprite(self.RankKuangImg(),self:GetQualityName(self.pData.iconFrameGear))
    ---特殊品质（带+状态,等配置表完善后修改）
    --self.RankPlusPanel().gameObject:SetActive(self.pData.quality == 5)
    if self.pData.quality == 5 then
        MgrRes.LoadSprite(self.RankPlusIconImg(),"Quality/RankKuangPlus_"..self.pData.quality)
    end
    ---设置基础属性词条
    for i = 1, #self.attrList do
        if i <= #self.pData.attrs then
            ---显示可用词条
            self.attrList[i].gameObject:SetActive(true)
            ---属性图标
            MgrRes.LoadSprite(self.attrList[i]:Find("GearInfoIcon"):GetComponent("Image"),self.pData.attrs[i].attrIcon)
            ---属性值
            local attrStr = ""
            if self.pData.attrs[i].type == 1 then
                attrStr = string.format("%.2f", self.pData.attrs[i].attribute).."%"
            else
                attrStr = string.format("%.0f", self.pData.attrs[i].attribute)
            end
            self.attrList[i]:Find("GearInfoText"):GetComponent("TextMeshProUGUI").text = attrStr
            ---属性占比
            self.attrList[i]:Find("GearInfoSlider"):GetComponent("Image").fillAmount = self.pData.properties
            ---属性名称
            self.attrList[i]:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI").text = self.pData.attrs[i].attrName
        else
            ---隐藏不可用词条
            self.attrList[i].gameObject:SetActive(false)
        end
    end
    ---设置技能
    if self.pData.level >= 15 and self.pData.skill ~= nil and self.pData.skill ~= 0 then
        self.GearSkillPrefab().gameObject:SetActive(true)
        local sData = SkillLocalData.tab[self.pData.skill]
        ---更新技能属性
        self.Text_SkillName().text = sData[12]
    else
        self.GearSkillPrefab().gameObject:SetActive(false)
    end
    ---点击事件
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.ClosePop))
end

--根据品质获品质对应图片名称(新加了带jia的品质，不确定原来的图片是否被其他地方使用，所以不能改名)
function M:GetQualityName(qualityID)
    local name = ""
    if qualityID == 1 then
        name = "Item/Rank/ItemRank_1"
    elseif qualityID == 2  then
        name = "Item/Rank/ItemRank_2"
    elseif  qualityID == 3 then
        name = "Item/Rank/ItemRank_3"
    elseif  qualityID == 4 then
        name = "Item/Rank/ItemRank_4"
    elseif  qualityID == 5 then
        name = "Item/Rank/ItemRank_5"
    elseif  qualityID == 6 then
        name = "Item/Rank/ItemRank_6"
    end
    return name
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
    MgrTimer.Cancel("vfxDis")
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("vfxDis")
end

return M