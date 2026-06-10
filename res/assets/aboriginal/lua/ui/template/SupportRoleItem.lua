-- Code Auto Create Begin
local M = Class('SupportRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SupportRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RankBlurImg_SSR','btn_uiTx/RankBlurImg_SSR',2},{'RankBlurImg_SR','btn_uiTx/RankBlurImg_SR',2},{'RankBlurImg_R','btn_uiTx/RankBlurImg_R',2},{'lihuizhezhaodi','btn_uiTx/lihuizhezhaodi',2},{'RoleIconImg','btn_uiTx/IconPanel/RoleIconImg',2},{'jianbianandi','btn_uiTx/jianbianandi',2},{'xian','btn_uiTx/xian',2},{'rankdi','btn_uiTx/rankdi',2},{'RANK','btn_uiTx/RANK',2},{'lvtouying','btn_uiTx/lvtouying',2},{'jingyandi','btn_uiTx/jingyandi',2},{'jingyan(an)','btn_uiTx/jingyan(an)',2},{'ExpSlider','btn_uiTx/ExpSlider',2},{'LV','btn_uiTx/LV',2},{'ZhiyeIconImg','btn_uiTx/ZhiyeIconImg',2},{'StarPregab_UnJueXing','btn_uiTx/StarPregab_UnJueXing',2},{'StarPregab_JueXing','btn_uiTx/StarPregab_JueXing',2},{'StarPanel','btn_uiTx/StarPanel',2},{'RankKuangImg','btn_uiTx/RankKuangImg',2},{'xuanzhongxiaoguo','btn_uiTx/xuanzhongxiaoguo',2},{'NewTag','btn_uiTx/NewTag',2},{'NewTagdi','btn_uiTx/NewTag/NewTagdi',2},{'CardClickArea','btn_uiTx/CardClickArea',2},{'RedDotIcon','btn_uiTx/RedDotIcon',2},{'BlackMask','btn_uiTx/BlackMask',2},{'IndexBG','btn_uiTx/IndexBG',2},
        -- UITemplate 列表
        {'SupportRoleItem','/',10},
        -- RawImage 列表
        {'SupportRoleItem01','/',15},{'btn_uiTx','btn_uiTx',15},
        -- TextMeshProUGUI 列表
        {'SkillText','btn_uiTx/RANK/SkillText',20},{'LVText','btn_uiTx/LV/LVText',20},{'RoleNameText','btn_uiTx/RoleNameText',20},{'Text_Index','btn_uiTx/IndexBG/Text_Index',20},
    }
end
-- Code Auto Create End
---角色卡片初始化
function M:OnInit()
    ---获取阴影
    self.xuanzhongxiaoguo().gameObject:SetActive(false)
    self.RedDotIcon().gameObject:SetActive(false)
    self.NewTag().gameObject:SetActive(false)
    self.QualityShadowArr = {
        self.RankBlurImg_R().gameObject,    ---白（暂无）
        self.RankBlurImg_R().gameObject,    ---蓝
        self.RankBlurImg_SR().gameObject,   ---紫
        self.RankBlurImg_SSR().gameObject   ---金
    }
    ---获取流纹
    self.liuWen = self:Find("btn_uiTx/RankKuangImg/LiuWen").gameObject
    ---星数组
    self.unAwakenStarArr = {}
    ---觉醒星数组
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
        [1] = "Quality/RankF_1",
        [2] = "Quality/RankF_2",
        [3] = "Quality/RankF_3",
        [4] = "Quality/RankF_4",
    }
end
---角色卡片预制设置
function M:OnUpdateUI(pData)
    ---@type RoleData
    local heroData = pData[1]
    self.Parent  = pData[2]
    self.CurrentID = heroData.id
    ---设置技能等级
    local attr = nil
    local lvCount = 0
    --for i, v in pairs(heroData:GetVoidEquip()) do
    --for i, v in pairs(heroData:GetHeroVoidEquip()) do
    --    lvCount = lvCount + v.level
    --end

    if heroData.heroFlag ~= nil and heroData.heroFlag ~= 0 and heroData.heroFlag ~= false then
        self.SkillText().text=heroData.heroCurSkill
        if heroData:CheckHeroEquipIsMax() then
            self.SkillText().text= "<color=#FFC539>"..heroData.heroCurSkill.."</color>"
        else
            self.SkillText().text= heroData.heroCurSkill
        end
    else
        if heroData:CheckHeroEquipIsMax() then
            --if lvCount >=30 then
            attr = ReadData.GetRoleAttr(heroData.id,heroData.level,heroData.star,heroData.skillLevel+1,heroData.awaken,heroData.exp)
            self.SkillText().text="<color=#FFC539>"..attr.SkillLV.."</color>"
        else
            self.SkillText().text=heroData.skillLevel
        end
    end

    ---设置英雄等级
    self.LVText().text = heroData.level
    ---设置名称
    self.RoleNameText().text = heroData.name
    -----设置新获取图标
    --local isNew = UnityEngine.PlayerPrefs.GetString(string.format("New%s",heroData.id))
    --if  isNew == nil or isNew == "" then
    --    self.NewTag().gameObject:SetActive(true)
    --else
    --    self.NewTag().gameObject:SetActive(false)
    --end
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= heroData.star and not heroData.awaken) ---未觉醒星
    self.onAwakenStarArr[i]:SetActive(i <= heroData.star and heroData.awaken)     ---觉醒星
    end
    ---设置头像
    MgrRes.LoadRectIcon(self.RoleIconImg(),heroData.skin)
    --self.RoleIconImg():SetNativeSize()
    ---设置职业
    MgrRes.LoadSprite(self.ZhiyeIconImg(),heroData.iconCareer)
    ---设置边框
    MgrRes.LoadSprite(self.RankKuangImg(),self.iconFramePath[heroData.rank])
    ---设置阴影
    --for i = 1, #self.QualityShadowArr do
    --    self.QualityShadowArr[i]:SetActive(i == heroData.rank)
    --end
    for i = 1, #self.QualityShadowArr do
        self.QualityShadowArr[i]:SetActive(false)
    end
    ---设置流纹
    self.liuWen:SetActive(heroData.rank == 4)
    if(self.Parent.CurRoleID == self.CurrentID) then
        self.xuanzhongxiaoguo().gameObject:SetActive(true)
        self.BlackMask().gameObject:SetActive(true)
    else
        self.xuanzhongxiaoguo().gameObject:SetActive(false)
        self.BlackMask().gameObject:SetActive(false)
    end
    self.IndexBG().gameObject:SetActive(false)
    if(self.Parent.CurRole1ID == self.CurrentID) then
        self.IndexBG().gameObject:SetActive(true)
        self.Text_Index().text = "1"
        self.RoleNameText().text = "<color=#39FFDC>".. heroData.name.."</color>"
    elseif self.Parent.CurRole2ID == self.CurrentID then
        self.IndexBG().gameObject:SetActive(true)
        self.Text_Index().text = "2"
        self.RoleNameText().text = "<color=#39FFDC>".. heroData.name.."</color>"
    elseif self.Parent.CurRole3ID == self.CurrentID then
        self.IndexBG().gameObject:SetActive(true)
        self.Text_Index().text = "3"
        self.RoleNameText().text = "<color=#39FFDC>".. heroData.name.."</color>"
    end
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnClick))

end
---点击事件
function M:OnClick(pData)
    self.Parent.CurRoleID = self.CurrentID
    self.Parent:RoleItemOnClick(self.CurrentID)
end


return M