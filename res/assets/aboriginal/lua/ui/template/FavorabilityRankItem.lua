-- Code Auto Create Begin
local M = Class('FavorabilityRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/FavorabilityRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'Img_Rankdi_hui','Rank/Img_Rankdi_hui',2},{'Img_Rankdi_liang','Rank/Img_Rankdi_liang',2},
        -- UITemplate 列表
        {'FavorabilityRankItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Shuxing','Text_Shuxing',20},{'FavorabilityRankText','Rank/FavorabilityRankText',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    ---@type RoleFavorData
    self.favorData = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    ---等级
    self.FavorabilityRankText().text = self.index+1

    --好感度置灰
    if self.index+1 > self.parent.tCurFavorLv then
        self.Img_Rankdi_liang().gameObject:SetActive(false)
         --Color(0,65,255,1)
        self.Img_bg().color = Color(0.6705883,0.6705883,0.6705883,1)
    else
        self.Img_Rankdi_liang().gameObject:SetActive(true)
        self.Img_bg().color = Color(1,1,1,1)
    end
    ---个人资料
    --[[
    --if self.parent.hero.favor >= self.favorData.favorAbility then
    --    self.Img_Suo().gameObject:SetActive(false)
    --else
    --    self.Img_Suo().gameObject:SetActive(true)
    --end

    --self.Text_Ziliao().text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_personaldata") .. math.modf(self.favorData.favorAbility / 25) + 1
    ---头像
    --MgrRes.LoadCircleIcon(self.HeadIcon(),self.favorData.HeroId)
    ---属性
    --self.attrs = {
    --    self.Text_Shuxing1(),
    --    self.Text_Shuxing2(),
    --    self.Text_Shuxing3()
    --}
    --for i,v in pairs(self.attrs) do
    --    v.gameObject:SetActive(false)
    --end
    --local idx = 1
    --if self.favorData.hp ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text =MgrLanguageData.GetLanguageByKey("favorabilityrankitem_health") .. self.favorData.hp
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.atk ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_attack") .. self.favorData.atk
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.support ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_support") .. self.favorData.support / 100 .. "%"
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.defense ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_armor") .. self.favorData.defense / 100 .. "%"
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.crit ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_critical") .. self.favorData.crit / 100 .. "%"
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.dodge ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_sidestep") .. self.favorData.dodge / 100 .. "%"
    --        idx = idx + 1
    --    end
    --end
    --if self.favorData.criticaldamage ~= 0 then
    --    if self.attrs[idx] then
    --        self.attrs[idx].gameObject:SetActive(true)
    --        self.attrs[idx].text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_criticaldamage").. self.favorData.criticaldamage / 100 .. "%"
    --    end
    --end
]]
    self.Text_Shuxing().text = ""
    if self.favorData.hp ~= 0 then
        self.Text_Shuxing().text = MgrLanguageData.GetLanguageByKey("favorabilityrankitem_health") .. self.favorData.hp
    end
    if self.favorData.atk ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_attack") .. self.favorData.atk
    end
    if self.favorData.support ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_support") .. self.favorData.support / 100 .. "%"
    end
    if self.favorData.defense ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_armor") .. self.favorData.defense / 100 .. "%"
    end
    if self.favorData.crit ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_critical") .. self.favorData.crit / 100 .. "%"
    end
    if self.favorData.dodge ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_sidestep") .. self.favorData.dodge / 100 .. "%"
    end
    if self.favorData.criticaldamage ~= 0 then
        self.Text_Shuxing().text = self.Text_Shuxing().text .. " " .. MgrLanguageData.GetLanguageByKey("favorabilityrankitem_criticaldamage").. self.favorData.criticaldamage / 100 .. "%"
    end
end



return M