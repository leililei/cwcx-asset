-- Code Auto Create Begin
local M = Class('PointRewardsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PointRewardsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardRankImg','RewardRankImg',2},{'RewardIconImg','RewardIconImg',2},{'StarPanel','StarPanel',2},{'EmptyStarRoot','StarPanel/EmptyStarRoot',2},{'EmptyStar','StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar(1)','StarPanel/EmptyStarRoot/EmptyStar (1)',2},{'EmptyStar(2)','StarPanel/EmptyStarRoot/EmptyStar (2)',2},{'EmptyStar(3)','StarPanel/EmptyStarRoot/EmptyStar (3)',2},{'EmptyStar(4)','StarPanel/EmptyStarRoot/EmptyStar (4)',2},{'EmptyStar(5)','StarPanel/EmptyStarRoot/EmptyStar (5)',2},{'ItemStarRoot','StarPanel/ItemStarRoot',2},{'ItemStarPrefab','StarPanel/ItemStarPrefab',2},{'Img_ItemCountBg','Img_ItemCountBg',2},{'TimeCountDownPanel','TimeCountDownPanel',2},{'Img_Yilinquzhezhao','IsTake/Img_Yilinquzhezhao',2},{'Img_Yilingqudi','IsTake/Img_Yilingqudi',2},{'Img_Jianglishuxian','Panel_Tower/Img_Jianglishuxian',2},
        -- UITemplate 列表
        {'PointRewardsItem','/',10},
        -- RawImage 列表
        {'IsTake','IsTake',15},{'Panel_Tower','Panel_Tower',15},
        -- TextMeshProUGUI 列表
        {'ItemCountText','Img_ItemCountBg/ItemCountText',20},{'CountDownText','TimeCountDownPanel/CountDownText',20},{'Text_Yilingqu','IsTake/Text_Yilingqu',20},{'Text_Jianglishu','Panel_Tower/Text_Jianglishu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ItemStarPrefab().gameObject:SetActive(false)
end
---@class PointItemData
---@field config ItemLocalData
---@field isOnceAdopt boolean
local PointItemData = {
    config = 1,
    isOnceAdopt = 2,
}
---@param pData table StormPointData:GetRewards中定义的data
function M:OnUpdateUI(pData)
    if pData.isOnceAdopt == true then
        self.Img_ItemCountBg().gameObject:SetActive(true)
        self.ItemCountText().text = JNStrTool.numberAbbr(pData.count)
    else
        self.Img_ItemCountBg().gameObject:SetActive(true)
        self.ItemCountText().text = JNStrTool.numberAbbr(pData.count)
    end
    if pData.count == "0" or pData.count == 0 then
        self.Img_ItemCountBg().gameObject:SetActive(false)
    end

    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),"Item/Rank/ItemRank_"..pData.config.quality)
    ---边框特效
    if pData.config.quality == 1 or pData.config.quality == 2 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
    elseif pData.config.quality == 3 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
    elseif pData.config.quality == 4 then
        self.RewardRankImg().transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
    end

    self.RewardRankImg().transform:GetChild(0)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..pData.config.icon)
    self.TimeCountDownPanel().gameObject:SetActive(pData.isOnceAdopt)
    if MgrUI.GetCurUI().Uid == UID.Yueta_UI then
        self.TimeCountDownPanel().gameObject:SetActive(false)
    end
    self.StarPanel().gameObject:SetActive(pData.config.itemstar > 0)
    if StormViewModel.CurPointData and StormViewModel.CurPointData.type == 999 then
        ---教学关不显示获得条件
        self.TimeCountDownPanel().gameObject:SetActive(false)
    end
    if pData.config.itemstar > 0 then
        ---创建星
        Tools.ClearAllChild(self.ItemStarRoot().gameObject)
        for i = 1, pData.config.itemstar do
            GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,true).gameObject:SetActive(true)
        end
    end
    ---是否为挑战
    if pData.isTower then
        self.Panel_Tower().gameObject:SetActive(true)
        self.IsTake().gameObject:SetActive(pData.isTake)
        if self.Text_Jianglishu() then
            self.Text_Jianglishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_battle_redtowerawardtxt1"),pData.towerIdx)
        end
    else
        self.Panel_Tower().gameObject:SetActive(false)
        self.IsTake().gameObject:SetActive(pData.isRec)
    end
    UIEvent.LuaClick(self.ObjRoot, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(pData.id, tonumber(pData.type))
        MgrUI.Pop(UID.ItemDetailPop_UI, { item, false, function()
        end }, true)
    end))
end
return M