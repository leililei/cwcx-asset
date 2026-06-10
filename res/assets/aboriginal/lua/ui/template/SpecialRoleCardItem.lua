-- Code Auto Create Begin
local M = Class('SpecialRoleCardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SpecialRoleCardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RankBlurImg_SSR','btn_uiTx/RankBlurImg_SSR',2},{'RankBlurImg_SR','btn_uiTx/RankBlurImg_SR',2},{'RankBlurImg_R','btn_uiTx/RankBlurImg_R',2},{'lihuizhezhaodi','btn_uiTx/lihuizhezhaodi',2},{'RoleIconImg','btn_uiTx/IconPanel/RoleIconImg',2},{'jianbianandi','btn_uiTx/jianbianandi',2},{'xian','btn_uiTx/xian',2},{'rankdi','btn_uiTx/rankdi',2},{'lvtouying','btn_uiTx/lvtouying',2},{'jingyandi','btn_uiTx/jingyandi',2},{'jingyan(an)','btn_uiTx/jingyan(an)',2},{'ExpSlider','btn_uiTx/ExpSlider',2},{'Img_SpecialItem','btn_uiTx/Img_SpecialItem',2},{'Img_Lock','btn_uiTx/Img_Lock',2},{'ZhiyeIconImg','btn_uiTx/ZhiyeIconImg',2},{'StarPregab_JueXing','btn_uiTx/StarPregab_JueXing',2},{'StarPregab_UnJueXing','btn_uiTx/StarPregab_UnJueXing',2},{'StarPanel','btn_uiTx/StarPanel',2},{'RankKuangImg','btn_uiTx/RankKuangImg',2},{'xuanzhongxiaoguo','btn_uiTx/xuanzhongxiaoguo',2},{'NewTag','btn_uiTx/NewTag',2},{'NewTagdi','btn_uiTx/NewTag/NewTagdi',2},{'CardClickArea','btn_uiTx/CardClickArea',2},{'RedDotIcon','btn_uiTx/RedDotIcon',2},{'Xihuan_H','btn_uiTx/Xihuan_H',2},{'Xihuan_H01','btn_uiTx/Xihuan_H/Xihuan_H',2},
        -- UITemplate 列表
        {'SpecialRoleCardItem','/',10},
        -- RawImage 列表
        {'SpecialRoleCardItem01','/',15},{'btn_uiTx','btn_uiTx',15},
        -- TextMeshProUGUI 列表
        {'LV','btn_uiTx/LV',20},{'LVText','btn_uiTx/LV/LVText',20},{'Text_Lock','btn_uiTx/Text_Lock',20},{'RoleNameText','btn_uiTx/RoleNameText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---获取阴影
    self.xuanzhongxiaoguo().gameObject:SetActive(false)
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
    local idx = pData[2]
    local heroSkin = HeroControl.GetSkinDataBySkinId(heroData.skin)
    self.CurrentID = heroData.id
    --超限装备数据
    local tSpecialGear = EquipControl.GetSingleSpecialEquip(heroData.id)
    if tSpecialGear then
        if not tSpecialGear:CheckLockState() then
            --未解锁
            self.Text_Lock().gameObject:SetActive(true)
            self.LV().gameObject:SetActive(false)
            self.ExpSlider().gameObject:SetActive(false)
            self.Img_Lock().gameObject:SetActive(false)
            --颜色调整
            self.Img_SpecialItem().color = Color(0.5,0.5,0.5,1)
            self.Text_Lock().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text120")
        elseif not heroData.sEquipOff then
            --关闭
            self.Text_Lock().gameObject:SetActive(true)
            self.LV().gameObject:SetActive(false)
            self.ExpSlider().gameObject:SetActive(false)
            self.Img_Lock().gameObject:SetActive(true)
            --颜色调整
            self.Img_SpecialItem().color = Color(0.5,0.5,0.5,1)
            self.Text_Lock().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text277")
        else
            self.Text_Lock().gameObject:SetActive(false)
            self.LV().gameObject:SetActive(true)
            self.ExpSlider().gameObject:SetActive(true)
            self.Img_Lock().gameObject:SetActive(false)
            --颜色调整
            self.Img_SpecialItem().color = Color(1, 1, 1, 1)
            --超限装备等级
            self.LVText().text = tSpecialGear.evolutionLevel
        end
        --超限装备
        MgrRes.LoadSprite(self.Img_SpecialItem(), "Item/" .. tSpecialGear.specialIcon)
    end
    ---设置名称
    self.RoleNameText().text = heroData.name
    ---设置新获取图标
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format("New_%s_%s", PlayerControl.GetPlayerData().UID, heroData.id))
    if  isNew == nil or isNew == "" then
        self.NewTag().gameObject:SetActive(true)
    else
        self.NewTag().gameObject:SetActive(false)
    end
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= heroData.star and not heroData.awaken) ---未觉醒星
    self.onAwakenStarArr[i]:SetActive(i <= heroData.star and heroData.awaken)     ---觉醒星
    end
    ---设置头像
    MgrRes.LoadRectIcon(self.RoleIconImg(),heroSkin.id)
    --self.RoleIconImg():SetNativeSize()
    ---设置职业
    MgrRes.LoadSprite(self.ZhiyeIconImg(),heroData.iconCareer)
    ---设置边框
    MgrRes.LoadSprite(self.RankKuangImg(),self.iconFramePath[heroData.rank])
    ---设置阴影
    for i = 1, #self.QualityShadowArr do
        self.QualityShadowArr[i]:SetActive(i == heroData.rank)
    end
    ---设置流纹
    self.liuWen:SetActive(heroData.rank == 4)
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnClick))
    ---检查红点
    self:CheckRot(heroData)

    ---刷新偏爱
    self:UpdataXiHuanState()
end
---点击事件
function M:OnClick(pData)
    RoleCardViewModel.GetRoleByID(self.CurrentID)
    ---弹出详情面板逻辑
    RoleCardViewModel.OpenCultivateRoleUI()
    if self.CurrentID == tonumber(SteamLocalData.tab[120003][2]) and NoviceViewModel.CurTaskId == 20006 then
        NoviceViewModel.DoNext()
    elseif self.CurrentID == tonumber(SteamLocalData.tab[120003][2]) and NoviceViewModel.CurTaskId == 20203 then
        NoviceViewModel.DoNext()
    end
end


function M:UpdataXiHuanState()
    local isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",self.CurrentID))
    if isLove==nil or isLove == "" then
        self.Xihuan_H().gameObject:SetActive(false)
    else
        self.Xihuan_H().gameObject:SetActive(true)
    end
end

---检查驾驶员红点
function M:CheckRot(hero)
    if SysLockControl.CheckSysLock(1002) then
        if hero:GetHeroAttr().SkillLV < hero:GetHeroAttr().SkillMaxLV then
            local mCostNeed = 0     --主材料消耗数量
            local coinNeed = 0      --货币消耗数量
            local coinItem = 0      --消耗货币材料
            local str = string.split(hero.CostIcon,"_")
            local mainCost = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))    --主要消耗材料
            ---材料赋值
            local tSkillUpData = SkillUpControl.GetSkillUpData(hero:GetHeroAttr().Rank, hero.skillLevel,hero.New_Career)
            if tSkillUpData ~= nil then
                mCostNeed = tonumber(tSkillUpData.cost[3])
                coinItem = ItemControl.GetItemByIdAndType(tonumber(tSkillUpData.ortherCost[2]),tonumber(tSkillUpData.ortherCost[1]))
                coinNeed = tonumber(tSkillUpData.ortherCost[3])
                if mainCost.count >= mCostNeed and coinItem.count >= coinNeed then
                    self.RedDotIcon().gameObject:SetActive(true)
                    return
                end
            end
        end
    end
    ---检查是否能够升星或者觉醒
    local attr = hero:GetHeroAttr()
    if SysLockControl.CheckSysLock(1003) then
        if attr.LV >= attr.LvMax then
            if RoleCardViewModel.CheckStarUp(hero) then
                -- self.RedDotIcon().gameObject:SetActive(true)
                -- return
                --玩家当前等级是否支持此次突破
                local tab = {}
                local t = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][7]
                local a = string.split(t,',')
                for i, v in ipairs(a) do
                    local d = string.split(v,'_')
                    tab[tonumber(d[1])] = tonumber(d[2])
                end
                local t_start = tab[attr.Rank]
                if attr.StartLV < t_start then
                    self.RedDotIcon().gameObject:SetActive(true)
                    return
                end
            end
        end
    end
    if SysLockControl.CheckSysLock(1004) then
        if attr.StartLV >= attr.awakenStar  then
            if RoleCardViewModel.CheckAwake(hero) then
                self.RedDotIcon().gameObject:SetActive(true)
                return
            end
        end
    end
    ---检查驾驶员特殊共鸣装备
    ---检查特殊共鸣装备是否能合成(等级达到最大/为拥有/系统打开)
    if EquipControl.GetSingleSpecialEquip(hero.id) and hero:HeroAllEquipLevelMax() and not EquipControl.GetSingleSpecialEquip(hero.id).lockState and EquipControl.SpecialEquipOnOrOff() then
        local SpecialGear = EquipControl.GetSingleSpecialEquip(hero.id)
        if SpecialGear then
            ---@type ItemData[]
            local materials = SpecialGear:GetMixMaterial()
            local enough = true
            for i,m in pairs(materials) do
                local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                if bagItem.count < m.count then
                    enough = false
                    break
                end
            end
            if enough then
                self.RedDotIcon().gameObject:SetActive(true)
                return
            end
        end
    end


    if EquipControl.GetSingleSpecialEquip(hero.id) and EquipControl.GetSingleSpecialEquip(hero.id).lockState and EquipControl.SpecialEquipOnOrOff() then
        local SpecialGear = EquipControl.GetSingleSpecialEquip(hero.id)
        if SpecialGear then
            ---检查特殊共鸣装备是否能升级
            ---@type ItemData[]
            local materials = SpecialGear:GetLevelUpMaterial()
            local enough = true
            for i,m in pairs(materials) do
                local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                if bagItem.count < m.count then
                    enough = false
                    break
                end
            end
            if enough then
                if SpecialGear.evolutionLevel < SpecialGear:GetMaxLevel() then
                    self.RedDotIcon().gameObject:SetActive(true)
                    return
                end
            end
            ---检查特殊共鸣装备是否能突破
            local materials_Advance = SpecialGear:GetAdvanceMaterial()
            local enough_Advance = true
            for i,m in pairs(materials_Advance) do
                local bagItem = ItemControl.GetItemByIdAndType(m.id,m.goodsType)
                if bagItem.count < m.count then
                    enough_Advance = false
                    break
                end
            end
            if enough_Advance then
                if SpecialGear.evolutionLevel == SpecialGear:GetMaxLevel() and SpecialGear.evolutionLevel ~= SpecialGear:MaxLevel() then
                    self.RedDotIcon().gameObject:SetActive(true)
                    return
                end
            end
        end
    end
    self.RedDotIcon().gameObject:SetActive(false)
end
return M