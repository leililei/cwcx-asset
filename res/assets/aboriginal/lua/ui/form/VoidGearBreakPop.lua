-- Code Auto Create Begin
local M = Class('VoidGearBreakPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.VoidGearBreakPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[VoidGearBreakPop].prefab'
    self.Name = 'Form[VoidGearBreakPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_bg','PopPanel/Img_bg',2},{'Img_Xian2','PopPanel/Img_bg/Img_Xian2',2},{'Img_Xian1','PopPanel/Img_bg/Img_Xian1',2},{'Img_Biaotixian','PopPanel/Img_bg/Text_Title/Img_Biaotixian',2},{'CostItemsContent','PopPanel/Img_bg/CostItemsContent',2},{'JX_CostItem','PopPanel/Img_bg/CostItemsContent/JX_CostItem',2},{'RewardRankImg','PopPanel/Img_bg/CostItemsContent/JX_CostItem/RewardRankImg',2},{'RewardIconImg','PopPanel/Img_bg/CostItemsContent/JX_CostItem/RewardIconImg',2},{'StarPanel','PopPanel/Img_bg/CostItemsContent/JX_CostItem/StarPanel',2},{'ItemStarPrefab','PopPanel/Img_bg/CostItemsContent/JX_CostItem/StarPanel/ItemStarPrefab',2},{'HighLight','PopPanel/Img_bg/CostItemsContent/JX_CostItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','PopPanel/Img_bg/CostItemsContent/JX_CostItem/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg','PopPanel/Img_bg/CostItemsContent/JX_CostItem/Img_ItemCountBg',2},{'Img_countdi','PopPanel/Img_bg/CostItemsContent/JX_CostItem/Img_countdi',2},{'Btn_Quxiao','PopPanel/Img_bg/Btn_Quxiao',2},{'Btn_Upgrade','PopPanel/Img_bg/Btn_Upgrade',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','PopPanel/Img_bg/Text_Title',20},{'Text_Txt','PopPanel/Img_bg/Text_Txt',20},{'ItemCountText','PopPanel/Img_bg/CostItemsContent/JX_CostItem/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','PopPanel/Img_bg/CostItemsContent/JX_CostItem/Img_countdi/ItemCountText',20},{'ItemCountText2','PopPanel/Img_bg/CostItemsContent/JX_CostItem/Img_countdi/ItemCountText2',20},{'Text_Quxiao','PopPanel/Img_bg/Btn_Quxiao/Text_Quxiao',20},{'Btn_Txt','PopPanel/Img_bg/Btn_Upgrade/Btn_Txt',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.BlurBg().gameObject,function() MgrUI.ClosePop(self.Uid) end)
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function() MgrUI.ClosePop(self.Uid) end)
    UIEvent.LuaClick(self.Btn_Upgrade().gameObject,function()
        if self.insufficient then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_zhuanshugongming_text4"),1},true)
        else
            ---向服务器发送升阶请求
            EquipControl.SpecialEquipCreat(self.hero.id)
            MgrUI.ClosePop(self.Uid)
        end
    end)
end

function M:OnShow(args)
    ---@type RoleData
    self.hero = args[1]
    self.insufficient = false
    ---对应角色的进阶装备属性
    ---@type SpecialEquipData
    self.specialEquipData = EquipControl.GetSingleSpecialEquip(self.hero.id)
    local numberOfStone = 0
    ---道具消耗
    local materials = self.specialEquipData:GetMixMaterial()
    self.Root = self.CostItemsContent().gameObject
    self.costItem = self.JX_CostItem().gameObject
    for i,v in ipairs(materials) do
        local item = GameObject.Instantiate(self.costItem,self.Root.transform,false)
        item.transform:Find("Img_ItemCountBg").gameObject:SetActive(false)
        local rankImage = item.transform:Find("RewardRankImg"):GetComponent("Image")
        local itemImage = item.transform:Find("RewardIconImg"):GetComponent("Image")
        local star = item.transform:Find("StarPanel/ItemStarPrefab").gameObject
        star.gameObject:SetActive(false)
        local starRoot = item.transform:Find("StarPanel/ItemStarRoot").transform
        local countText = item.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
        countText.gameObject:SetActive(false)
        local ItemCountText = item.transform:Find("Img_countdi/ItemCountText"):GetComponent("TextMeshProUGUI")

        MgrRes.LoadSprite(rankImage,self:GetQualityName(v.quality))
        MgrRes.LoadSprite(itemImage,v.icon)
        for i = 1, v.star do
            local s = GameObject.Instantiate(star,starRoot,false)
            s:SetActive(true)
        end
        if ItemControl.GetItemByIdAndType(v.id, v.goodsType).count >= v.count then
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
        else
            ItemCountText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),self:NumberChange(ItemControl.GetItemByIdAndType(v.id, v.goodsType).count),v.count)
            self.insufficient = true
        end
        if i == 1 then
            numberOfStone = v.count
        end
        UIEvent.LuaClick(itemImage.gameObject,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{v,true,nil,nil,true},true)
        end)
    end
    ---多语言
    self.Text_Title().text = MgrLanguageData.GetLanguageByKey("ui_zhuanshugongming_text1")
    self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("ui_zhuanshugongming_text2"),numberOfStone)
    self.JX_CostItem().gameObject:SetActive(false)
end

function M:NumberChange(number)
    return JNStrTool.numberAbbr(number)
end

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
return M