-- Code Auto Create Begin
local M = Class('MailRewardPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MailRewardPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MailRewardPrefab','/',2},{'ItemKuangImg','item/ItemKuangImg',2},{'Img_Xingdi','item/Img_Xingdi',2},{'ItemIcon','item/ItemIcon',2},{'VFXItem','item/VFXItem',2},{'Img_Xing(hui)','item/EmptyStarPanel/Img_Xing(hui)',2},{'Img_Xing(hui)(1)','item/EmptyStarPanel/Img_Xing(hui) (1)',2},{'Img_Xing(hui)(2)','item/EmptyStarPanel/Img_Xing(hui) (2)',2},{'Img_Xing(hui)(3)','item/EmptyStarPanel/Img_Xing(hui) (3)',2},{'Img_Xing(hui)(4)','item/EmptyStarPanel/Img_Xing(hui) (4)',2},{'Img_Xing(hui)(5)','item/EmptyStarPanel/Img_Xing(hui) (5)',2},{'StarPrefab','item/StarPrefab',2},{'ItemCountBg','item/ItemCountBg',2},{'ItemTimeBg','item/ItemTimeBg',2},{'shijianicon','item/ItemTimeBg/shijianicon',2},{'RewardRecievedImg','RewardRecievedImg',2},
        -- UITemplate 列表
        {'MailRewardPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'RewardCountTxt','item/ItemCountBg/RewardCountTxt',20},{'Text_Time','item/ItemTimeBg/Text_Time',20},{'Text_Yilingqu','RewardRecievedImg/Text_Yilingqu',20},
    }
end
-- Code Auto Create End
function M:OnInit()

end

function M:OnUpdateUI(data)
    self.pData = data[1]
    local item = ItemControl.GetItemByType(self.pData.goodsType,self.pData.goodsID)
    if item == nil then
        return
    end
    local obj = self.ObjRoot               --邮件附件预制件
    local ItemIcon = obj.transform:Find("item/ItemIcon"):GetComponent("Image")
    local VFXItem = obj.transform:Find("item/VFXItem"):GetComponent("Image")
    local ItemKuangImg = obj.transform:Find("item/ItemKuangImg"):GetComponent("Image")                  --物品框
    local ItemCountTxt = obj.transform:Find("item/ItemCountBg/RewardCountTxt"):GetComponent("TextMeshProUGUI")
    local StartRoot = obj.transform:Find("item/StarPanel").gameObject
    local StartPrefab = obj.transform:Find("item/StarPrefab").gameObject
    local RewardRecievedImg = obj.transform:Find("RewardRecievedImg").gameObject
    local Text_Time = obj.transform:Find("item/ItemTimeBg/Text_Time"):GetComponent("TextMeshProUGUI")
    local CanvasGroup = obj.transform:Find("item"):GetComponent("CanvasGroup")
    local EmptyStarPanel = obj.transform:Find("item/EmptyStarPanel").gameObject
    local Img_Xingdi = obj.transform:Find("item/Img_Xingdi").gameObject
    StartPrefab:SetActive(false)

    if item.anime and item.anime ~= "0" then
        Tools.ClearAllChild(VFXItem.gameObject)
        ItemIcon.color = Color(ItemIcon.color.r,ItemIcon.color.g,ItemIcon.color.b,0)
        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
        MgrRes.GetPrefab(self.vfx_path..item.anime..".prefab",function(Obj)
            if Obj == nil then return end
            Obj.transform:SetParent(VFXItem.gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(30,30,1)
        end)
    else
        Tools.ClearAllChild(VFXItem.gameObject)
        MgrRes.LoadSprite(ItemIcon,"Item/"..item.icon)
    end

    MgrRes.LoadSprite(ItemKuangImg,"Item/Rank/ItemRank_"..item.quality)
    if item.quality == 1 or item.quality == 2 then
        ItemKuangImg.transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
    elseif item.quality == 3 then
        ItemKuangImg.transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
    elseif item.quality == 4 then
        ItemKuangImg.transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
    end
    ItemCountTxt.text = JNStrTool.numberAbbr(self.pData.goodsNum)

    --if item.itemstar > 0  then
    --    StartRoot:SetActive(true)
    --    EmptyStarPanel:SetActive(true)
    --    Img_Xingdi:SetActive(true)
    --    self:InitStar(StartRoot,StartPrefab,item.itemstar)
    --else
        StartRoot:SetActive(false)
        EmptyStarPanel:SetActive(false)
        Img_Xingdi:SetActive(false)
    --end
    if self.isRecieved then
        RewardRecievedImg:SetActive(true)
        CanvasGroup.alpha = 0.5
    else
        RewardRecievedImg:SetActive(false)
        CanvasGroup.alpha = 1
    end
    ---隐藏UI
    obj.transform:Find("item/ItemTimeBg").gameObject:SetActive(false)
    UIEvent.LuaClick(obj,Handle(self,function ()
        local BagItem = ItemControl.GetItemByIdAndType(item.id,self.pData.goodsType)
        MgrUI.Pop(UID.ItemDetailPop_UI,{BagItem,false,function() end},true)
    end))
end

return M
