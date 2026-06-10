-- Code Auto Create Begin
local M = Class('L_RoleCardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/L_RoleCardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'L_RoleCardItem','/',2},{'Item','btn_uiTx/Item',2},{'fenggexian','btn_uiTx/fenggexian',2},{'fenggexianxxx','btn_uiTx/fenggexianxxx',2},{'lihuizhezhaodi2','btn_uiTx/lihuizhezhaodi2',2},{'RoleIcon2','btn_uiTx/lihuizhezhaodi2/RoleIcon2',2},{'jianbiandi2','btn_uiTx/lihuizhezhaodi2/jianbiandi2',2},{'RankBG2','btn_uiTx/lihuizhezhaodi2/RankBG2',2},{'lvtouying','btn_uiTx/lihuizhezhaodi2/lvtouying',2},{'jingyandi','btn_uiTx/lihuizhezhaodi2/jingyandi',2},{'jingyan(an)','btn_uiTx/lihuizhezhaodi2/jingyan(an)',2},{'ExpSlider','btn_uiTx/lihuizhezhaodi2/ExpSlider',2},{'rankdi','btn_uiTx/lihuizhezhaodi2/rankdi',2},{'RANK','btn_uiTx/lihuizhezhaodi2/rankdi/RANK',2},{'xian','btn_uiTx/lihuizhezhaodi2/xian',2},{'LV','btn_uiTx/lihuizhezhaodi2/LV',2},{'StarPregab_UnJueXing','btn_uiTx/lihuizhezhaodi2/StarPregab_UnJueXing',2},{'StarPregab_JueXing','btn_uiTx/lihuizhezhaodi2/StarPregab_JueXing',2},{'StarPanel','btn_uiTx/lihuizhezhaodi2/StarPanel',2},{'ZhiyeIconImg','btn_uiTx/lihuizhezhaodi2/ZhiyeIconImg',2},{'WeaponPanel1','btn_uiTx/GearDetailPanel/WeaponPanel1',2},{'Void','btn_uiTx/GearDetailPanel/WeaponPanel1/Void',2},{'MaskImg','btn_uiTx/GearDetailPanel/WeaponPanel1/MaskImg',2},{'icon','btn_uiTx/GearDetailPanel/WeaponPanel1/MaskImg/icon',2},{'gongmingkuang','btn_uiTx/GearDetailPanel/WeaponPanel1/gongmingkuang',2},{'gongmingkuang01','btn_uiTx/GearDetailPanel/WeaponPanel1/gongmingkuang/gongmingkuang',2},{'dengjidi','btn_uiTx/GearDetailPanel/WeaponPanel1/dengjidi',2},{'Img_Sou','btn_uiTx/GearDetailPanel/WeaponPanel1/Img_Sou',2},{'Img','btn_uiTx/GearDetailPanel/WeaponPanel1/Img_Sou/Img',2},{'WeaponPanel2','btn_uiTx/GearDetailPanel/WeaponPanel2',2},{'Void01','btn_uiTx/GearDetailPanel/WeaponPanel2/Void',2},{'MaskImg01','btn_uiTx/GearDetailPanel/WeaponPanel2/MaskImg',2},{'icon01','btn_uiTx/GearDetailPanel/WeaponPanel2/MaskImg/icon',2},{'gongmingkuang02','btn_uiTx/GearDetailPanel/WeaponPanel2/gongmingkuang',2},{'gongmingkuang03','btn_uiTx/GearDetailPanel/WeaponPanel2/gongmingkuang/gongmingkuang',2},{'dengjidi01','btn_uiTx/GearDetailPanel/WeaponPanel2/dengjidi',2},{'Img_Sou01','btn_uiTx/GearDetailPanel/WeaponPanel2/Img_Sou',2},{'Img01','btn_uiTx/GearDetailPanel/WeaponPanel2/Img_Sou/Img',2},{'WeaponPanel3','btn_uiTx/GearDetailPanel/WeaponPanel3',2},{'Void02','btn_uiTx/GearDetailPanel/WeaponPanel3/Void',2},{'MaskImg02','btn_uiTx/GearDetailPanel/WeaponPanel3/MaskImg',2},{'icon02','btn_uiTx/GearDetailPanel/WeaponPanel3/MaskImg/icon',2},{'gongmingkuang04','btn_uiTx/GearDetailPanel/WeaponPanel3/gongmingkuang',2},{'gongmingkuang05','btn_uiTx/GearDetailPanel/WeaponPanel3/gongmingkuang/gongmingkuang',2},{'dengjidi02','btn_uiTx/GearDetailPanel/WeaponPanel3/dengjidi',2},{'Img_Sou02','btn_uiTx/GearDetailPanel/WeaponPanel3/Img_Sou',2},{'Img02','btn_uiTx/GearDetailPanel/WeaponPanel3/Img_Sou/Img',2},{'RoleGearPanel1','btn_uiTx/GearDetailPanel/RoleGearPanel1',2},{'Img_Index1','btn_uiTx/GearDetailPanel/RoleGearPanel1/Img_Index1',2},{'jijiaxian','btn_uiTx/GearDetailPanel/RoleGearPanel1/jijiaxian',2},{'jijiamingdi','btn_uiTx/GearDetailPanel/RoleGearPanel1/jijiamingdi',2},{'GearWeared','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared',2},{'rankdi01','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/rankdi',2},{'GearAttrPrefab','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAttrPrefab',2},{'Img_Shuxingicondi','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAttrPrefab/Img_Shuxingicondi',2},{'GearInfoIcon','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAttrPrefab/GearInfoIcon',2},{'GearAddonInfoPrefab','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAddonInfoPrefab',2},{'Btn_Chakan','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAddonInfoPrefab/Btn_Chakan',2},{'Img_Jinengicondi','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAddonInfoPrefab/Img_Jinengicondi',2},{'Img_SkillIcon','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAddonInfoPrefab/Img_SkillIcon',2},{'GearInfoPanel','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearInfoPanel',2},{'jijiazhezhaodi','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/jijiazhezhaodi',2},{'GearIconImg','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/jijiazhezhaodi/GearIconImg',2},{'jijiaandi','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/jijiaandi',2},{'GearRankKuang','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearRankKuang',2},{'GearStar','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearStar',2},{'GearStar(tupo)','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearStar(tupo)',2},{'GearStarPanel','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearStarPanel',2},{'EmptyGearImg','btn_uiTx/GearDetailPanel/RoleGearPanel1/EmptyGearImg',2},{'jijiamingdi01','btn_uiTx/GearDetailPanel/RoleGearPanel1/EmptyGearImg/jijiamingdi',2},{'RoleGearPanel2','btn_uiTx/GearDetailPanel/RoleGearPanel2',2},{'Img_Index2','btn_uiTx/GearDetailPanel/RoleGearPanel2/Img_Index2',2},{'jijiaxian01','btn_uiTx/GearDetailPanel/RoleGearPanel2/jijiaxian',2},{'jijiamingdi02','btn_uiTx/GearDetailPanel/RoleGearPanel2/jijiamingdi',2},{'GearWeared01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared',2},{'rankdi02','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/rankdi',2},{'GearAttrPrefab01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAttrPrefab',2},{'Img_Shuxingicondi01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAttrPrefab/Img_Shuxingicondi',2},{'GearInfoIcon01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAttrPrefab/GearInfoIcon',2},{'GearAddonInfoPrefab01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAddonInfoPrefab',2},{'Btn_Chakan01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAddonInfoPrefab/Btn_Chakan',2},{'Img_Jinengicondi01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAddonInfoPrefab/Img_Jinengicondi',2},{'Img_SkillIcon01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAddonInfoPrefab/Img_SkillIcon',2},{'GearInfoPanel01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearInfoPanel',2},{'jijiazhezhaodi01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/jijiazhezhaodi',2},{'GearIconImg01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/jijiazhezhaodi/GearIconImg',2},{'jijiaandi01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/jijiaandi',2},{'GearRankKuang01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearRankKuang',2},{'GearStar01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearStar',2},{'GearStar(tupo)01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearStar(tupo)',2},{'GearStarPanel01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearStarPanel',2},{'EmptyGearImg01','btn_uiTx/GearDetailPanel/RoleGearPanel2/EmptyGearImg',2},{'jijiamingdi03','btn_uiTx/GearDetailPanel/RoleGearPanel2/EmptyGearImg/jijiamingdi',2},
        -- UITemplate 列表
        {'L_RoleCardItem01','/',10},
        -- RawImage 列表
        {'btn_uiTx','btn_uiTx',15},
        -- TextMeshProUGUI 列表
        {'SkillText','btn_uiTx/lihuizhezhaodi2/rankdi/RANK/SkillText',20},{'LVText','btn_uiTx/lihuizhezhaodi2/LV/LVText',20},{'RoleNameText','btn_uiTx/lihuizhezhaodi2/RoleNameText',20},{'LvText','btn_uiTx/GearDetailPanel/WeaponPanel1/dengjidi/LvText',20},{'xuhao','btn_uiTx/GearDetailPanel/WeaponPanel1/xuhao',20},{'LvText01','btn_uiTx/GearDetailPanel/WeaponPanel2/dengjidi/LvText',20},{'xuhao01','btn_uiTx/GearDetailPanel/WeaponPanel2/xuhao',20},{'LvText02','btn_uiTx/GearDetailPanel/WeaponPanel3/dengjidi/LvText',20},{'xuhao02','btn_uiTx/GearDetailPanel/WeaponPanel3/xuhao',20},{'GearNameText','btn_uiTx/GearDetailPanel/RoleGearPanel1/jijiamingdi/GearNameText',20},{'GearUpText','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/rankdi/GearUpText',20},{'GearInfoNameTxt','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAttrPrefab/GearInfoNameTxt',20},{'GearInfoText','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAttrPrefab/GearInfoText',20},{'Text_SkillName','btn_uiTx/GearDetailPanel/RoleGearPanel1/GearWeared/GearAddonInfoPrefab/Text_SkillName',20},{'EmptyImg','btn_uiTx/GearDetailPanel/RoleGearPanel1/EmptyGearImg/EmptyImg',20},{'GearNameText01','btn_uiTx/GearDetailPanel/RoleGearPanel1/EmptyGearImg/jijiamingdi/GearNameText',20},{'xuhao03','btn_uiTx/GearDetailPanel/RoleGearPanel1/xuhao',20},{'GearNameText02','btn_uiTx/GearDetailPanel/RoleGearPanel2/jijiamingdi/GearNameText',20},{'GearUpText01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/rankdi/GearUpText',20},{'GearInfoNameTxt01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAttrPrefab/GearInfoNameTxt',20},{'GearInfoText01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAttrPrefab/GearInfoText',20},{'Text_SkillName01','btn_uiTx/GearDetailPanel/RoleGearPanel2/GearWeared/GearAddonInfoPrefab/Text_SkillName',20},{'EmptyImg01','btn_uiTx/GearDetailPanel/RoleGearPanel2/EmptyGearImg/EmptyImg',20},{'GearNameText03','btn_uiTx/GearDetailPanel/RoleGearPanel2/EmptyGearImg/jijiamingdi/GearNameText',20},{'xuhao04','btn_uiTx/GearDetailPanel/RoleGearPanel2/xuhao',20},
    }
end
-- Code Auto Create End
---长角色卡片自定义类型
---@class RoleCardCore ui卡片核心
---@field public CoreAttrArr RoleCardCoreAttr[]
local RoleCardCore = {
    CoreObj = nil,
    NotCoreObj = nil,
    CoreName = nil,
    CoreLevel = nil,
    CoreStarPrefab = nil,
    CoreStarRoot = nil,
    CoreIcon = nil,
    CoreFrameIcon = nil,
    CoreRankIcon = nil,
    CoreStarArr = {},
    CoreAttrPrefab = nil,
    CoreAddAttrPrefab = nil,
    CoreAttrRoot = nil,
    CoreAttrArr = {},
    CoreSkill = {}
}
---@class RoleCardCoreAttr ui卡片核心属性
local RoleCardCoreAttr = {
    obj = nil,
    icon = nil,
    info = nil,
    infoType = nil
}

---长角色卡片初始化
function M:OnInit()
    self:InitRole()     ---角色头像初始化
    self:InitCore()     ---角色核心初始化
    self:InitEquip()    ---角色共鸣装备初始化
end
---长角色卡片预制设置
function M:OnUpdateUI(pData)
    self:UpdateRole(pData)  ---角色头像更新
    self:UpdateCore(pData)  ---角色核心更新
    self:UpdataEquip(pData)    ---角色共鸣装备更新
    ---设置点击事件
    UIEvent.LuaClick(self.Item().gameObject,Handle(self,self.OnClick))
    UIEvent.LuaClick(self.Img_Index1().gameObject,Handle(self, function()
        if SysLockControl.CheckSysLock(1606) then
            RoleCardViewModel.GetRoleByID(self.CurrentID)
            RoleCardViewModel.CurCoreIndex = 1
            MgrUI.GoHide(UID.RoleGearCore_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("l_rolecarditem_tips1"),1},true)
        end
    end))
    UIEvent.LuaClick(self.Img_Index2().gameObject,Handle(self, function()
        if SysLockControl.CheckSysLock(1606) then
            RoleCardViewModel.GetRoleByID(self.CurrentID)
            RoleCardViewModel.CurCoreIndex = 2
            MgrUI.GoHide(UID.RoleGearCore_UI)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("l_rolecarditem_tips1"),1},true)
        end
    end))
end
---初始化角色
function M:InitRole()
    ---隐藏锁(未使用)
    --self.LockRoleIcon().gameObject:SetActive(false)
    ---角色星数组
    self.unAwakenStarArr = {}
    ---角色觉醒星数组
    self.onAwakenStarArr = {}
    for i = 1, 6 do
        ---预创建星
        self.unAwakenStarArr[i] = GameObject.Instantiate(self.StarPregab_UnJueXing().gameObject,self.StarPanel().gameObject.transform,false)
        ---预创建觉醒星
        self.onAwakenStarArr[i] = GameObject.Instantiate(self.StarPregab_JueXing().gameObject,self.StarPanel().gameObject.transform,false)
    end
    ---隐藏星预制&觉醒星预制
    self.StarPregab_UnJueXing().gameObject:SetActive(false)
    self.StarPregab_JueXing().gameObject:SetActive(false)
    ---边框图标路径
    self.iconFramePath = {
        [1] = "Quality/RankFL_1",
        [2] = "Quality/RankFL_2",
        [3] = "Quality/RankFL_3",
        [4] = "Quality/RankFL_4",
    }
end
---更新角色信息
function M:UpdateRole(pData)
    ---@type RoleData
    local heroData = pData[1]
    self.CurrentID = heroData.id
    local idx = pData[2]
    ---设置技能等级
    self.SkillText().text = heroData:GetHeroShowSkillLv()
    
    ---设置英雄等级
    self.LVText().text = heroData.level
    ---设置名称
    self.RoleNameText().text = heroData.name
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= heroData.star and not heroData.awaken) ---未觉醒星
    self.onAwakenStarArr[i]:SetActive(i <= heroData.star and heroData.awaken)     ---觉醒星
    end
    ---设置头像
    MgrRes.LoadNormalIcon(self.RoleIcon2(),heroData.id)
    --self.RoleIcon2():SetNativeSize()
    ---设置职业
    MgrRes.LoadSprite(self.ZhiyeIconImg(),heroData.iconCareer)
    ---设置头像边框
    MgrRes.LoadSprite(self.RankBG2(),self.iconFramePath[heroData.rank])

end
---初始化核心
function M:InitCore()

    ---@type RoleCardCore[] 核心
    self.CoreObjArr = {}
    for i = 1, 2 do
        local obj = self["RoleGearPanel"..i]().gameObject
        self.CoreObjArr[i] = {
            CoreObj = obj.transform:Find("GearWeared").gameObject,
            NotCoreObj = obj.transform:Find("EmptyGearImg").gameObject,
            CoreName = obj.transform:Find("jijiamingdi/GearNameText"):GetComponent("TextMeshProUGUI"),
            CoreLevel = obj.transform:Find("GearWeared/rankdi/GearUpText"):GetComponent("TextMeshProUGUI"),
            CoreStarPrefab = obj.transform:Find("GearWeared/GearStar").gameObject,
            CoreStarRoot = obj.transform:Find("GearWeared/GearStarPanel").gameObject,
            CoreIcon = obj.transform:Find("GearWeared/jijiazhezhaodi/GearIconImg"):GetComponent("Image"),
            CoreFrameIcon = obj.transform:Find("GearWeared/GearRankKuang"):GetComponent("Image"),
            --CoreRankIcon = obj.transform:Find("GearWeared/GearRankImg"):GetComponent("Image"),
            CoreStarArr = {},
            CoreAttrPrefab = obj.transform:Find("GearWeared/GearAttrPrefab").gameObject,
            CoreAddAttrPrefab = obj.transform:Find("GearWeared/GearAddonInfoPrefab").gameObject,
            CoreAttrRoot = obj.transform:Find("GearWeared/GearInfoPanel").gameObject,
            CoreAttrArr = {},
            CoreSkill = {}
        }
        ---初始化核心星级
        for starLv = 1, 6 do
            self.CoreObjArr[i].CoreStarArr[starLv] = GameObject.Instantiate(self.CoreObjArr[i].CoreStarPrefab,self.CoreObjArr[i].CoreStarRoot.transform,false)
        end
        ---隐藏星预制
        self.CoreObjArr[i].CoreStarPrefab:SetActive(false)
        ---初始化基础词条
        for attrIdx = 1, 2 do
            local attrObj = GameObject.Instantiate(self.CoreObjArr[i].CoreAttrPrefab,self.CoreObjArr[i].CoreAttrRoot.transform,false)
            self.CoreObjArr[i].CoreAttrArr[attrIdx] = {
                obj = attrObj,
                icon = attrObj.transform:Find("GearInfoIcon"):GetComponent("Image"),
                info = attrObj.transform:Find("GearInfoText"):GetComponent("TextMeshProUGUI"),
                infoType = attrObj.transform:Find("GearInfoNameTxt"):GetComponent("TextMeshProUGUI"),
            }
        end
        ---隐藏基础词条预制
        self.CoreObjArr[i].CoreAttrPrefab:SetActive(false)

        ---初始化技能词条
        local skillObj = GameObject.Instantiate(self.CoreObjArr[i].CoreAddAttrPrefab,self.CoreObjArr[i].CoreAttrRoot.transform,false)
        self.CoreObjArr[i].CoreSkill = {
            obj = skillObj,
            info = skillObj.transform:Find("Text_SkillName"):GetComponent("TextMeshProUGUI"),
            btn = skillObj.transform:Find("Btn_Chakan").gameObject,
        }
        self.CoreObjArr[i].CoreSkill.obj:SetActive(true)
        ---隐藏追加词条预制
        self.CoreObjArr[i].CoreAddAttrPrefab:SetActive(false)
    end
    ---装备边框图标路径
    self.equipIconFramePath = {
        [1] = "Quality/RoleSelect_1",
        [2] = "Quality/RoleSelect_2",
        [3] = "Quality/RoleSelect_3",
        [4] = "Quality/RoleSelect_4",
    }
end
---更新核心
function M:UpdateCore(pData)
    ---@type RoleData
    local heroData = pData[1]
    local idx = pData[2]
    ---设置装备显示
    for i = 1, 2 do
        local obj = self.CoreObjArr[i]
        local armorID = heroData["armor"..i]
        obj.CoreObj:SetActive(armorID ~= 0)
        obj.NotCoreObj:SetActive(armorID == 0)
        if armorID == 0 then
            obj.CoreName.gameObject:SetActive(false)
        else
            obj.CoreName.gameObject:SetActive(true)
            local CoreData = CoreControl.GetSingleCoreData(armorID)
            obj.CoreName.text =  CoreData.name         ---设置核心名称
            obj.CoreLevel.text =  "+" .. CoreData.level       ---设置核心等级
            ---设置核心星级
            for starLv = 1, #obj.CoreStarArr do
                obj.CoreStarArr[starLv]:SetActive(starLv <= CoreData.star)
            end
            ---设置核心图片
            MgrRes.LoadSprite(obj.CoreIcon,CoreData.icon)
            ---设置核心边框
            MgrRes.LoadSprite(obj.CoreFrameIcon,"Quality/RankKuangL_"..CoreData.quality)
            ---设置核心品质
            --MgrRes.LoadSprite(obj.CoreRankIcon,"Quality/RankImg_"..CoreData.quality)
            ---设置基础词条
            for attrIdx = 1, #obj.CoreAttrArr do
                if attrIdx <= #CoreData.attrs then
                    ---显示可用词条
                    obj.CoreAttrArr[attrIdx].obj:SetActive(true)
                    ---设置属性图标
                    MgrRes.LoadSprite(obj.CoreAttrArr[attrIdx].icon,"Attribute/GearInfoIcon_"..CoreData.attrs[attrIdx].attrID)
                    ---设置属性值
                    ---属性值
                    local value = 0
                    if CoreData.attrs[attrIdx].type == 0 then
                        --   value = math.floor(GearData.attrs[i].attribute)
                        value = string.format("%.0f",CoreData.attrs[attrIdx].attribute)
                    else
                        -- value =(math.floor(GearData.attrs[i].attribute*100)*0.01).."%"
                        value = string.format("%.2f",CoreData.attrs[attrIdx].attribute).."%"
                    end
                    obj.CoreAttrArr[attrIdx].info.text = value
                    obj.CoreAttrArr[attrIdx].infoType.text = CoreData.attrs[attrIdx].attrName
                else
                    ---隐藏不可用词条
                    obj.CoreAttrArr[attrIdx].obj:SetActive(false)
                end
            end
            if CoreData.skill ~= 0 then
                local skill = SkillLocalData.tab[CoreData.skill]
                obj.CoreSkill.info.text = skill[12]
                UIEvent.LuaClick(obj.CoreSkill.btn,function()
                    MgrUI.Pop(UID.CoreSkill_UI,skill[1],true)
                end)
            else
                obj.CoreSkill.obj:SetActive(false)
            end

        end
    end
end

---初始化共鸣
function M:InitEquip()
    self.WeaponObjArr = {}

    for i = 1, 3 do
        local obj = self["WeaponPanel"..i]().gameObject
        self.WeaponObjArr[i] = {
            IconImage = obj.transform:Find("MaskImg/icon"):GetComponent("Image"),
            Img_SuoObj = obj.transform:Find("Img_Sou").gameObject,
            Void = obj.transform:Find("Void").gameObject,
            LvText = obj.transform:Find("dengjidi/LvText"):GetComponent("TextMeshProUGUI"),
        }
       self.WeaponObjArr[i].Img_SuoObj:SetActive(false)
    end
end

function M:UpdataEquip(pData)

    ---@type RoleData
    local heroData = pData[1]

    --self.equipArr = heroData:GetVoidEquip()
    self.equipArr = heroData:GetHeroVoidEquip()
    for i = 1, 3 do
        local obj = self.WeaponObjArr[i]
        ---@type EquipData
        local equip  = self.equipArr[i]
        UIEvent.LuaClick(obj.Void,Handle(self, function()
            RoleCardViewModel.GetRoleByID(self.CurrentID)
            RoleCardViewModel.CurrentEquip = equip
            MgrUI.GoHide(UID.VoidGearDetail_UI)
        end))
        if  equip.lockState then
            obj.Img_SuoObj:SetActive(false)
            obj.LvText.text ="<color=#FEC138>LV </color>".. equip.level
        else
            obj.Img_SuoObj:SetActive(true)
            obj.LvText.text = MgrLanguageData.GetLanguageByKey("l_rolecarditem_tips2")
        end
        MgrRes.LoadSprite(obj.IconImage,equip.icon)
    end
end


---点击事件
function M:OnClick(pData)
    ---弹出详情面板逻辑
    RoleCardViewModel.GetRoleByID(self.CurrentID)
    RoleCardViewModel.OpenCultivateRoleUI()
end

return M