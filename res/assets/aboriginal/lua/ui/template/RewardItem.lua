-- Code Auto Create Begin
local M = Class('RewardItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RewardItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RewardItem','/',2},{'GearPanel','wupin/GearPanel',2},{'tubiaodi2','wupin/GearPanel/tubiaodi2',2},{'RankKuangImg','wupin/GearPanel/RankKuangImg',2},{'RewardIcon','wupin/GearPanel/RewardIcon',2},{'RankPlusPanel','wupin/GearPanel/RankPlusPanel',2},{'CoreRank_4','wupin/GearPanel/RankPlusPanel/CoreRank_4',2},{'CoreRank_6','wupin/GearPanel/RankPlusPanel/CoreRank_6',2},{'xingdi2','wupin/GearPanel/xingdi2',2},{'ItemPanel','wupin/ItemPanel',2},{'RewardRankImg','wupin/ItemPanel/RewardRankImg',2},{'RewardIconImg','wupin/ItemPanel/RewardIconImg',2},{'RewardVFX','wupin/ItemPanel/RewardVFX',2},{'Img_ItemCountPivot','wupin/ItemPanel/Img_ItemCountPivot',2},{'Img_ItemCountBg','wupin/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg',2},{'xingdi','wupin/ItemPanel/xingdi',2},{'StarPanel','wupin/StarPanel',2},{'ItemStarPrefab','wupin/StarPanel/ItemStarPrefab',2},{'EmptyStarRoot','wupin/StarPanel/EmptyStarRoot',2},{'EmptyStar','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar01','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar02','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar03','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar04','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'EmptyStar05','wupin/StarPanel/EmptyStarRoot/EmptyStar',2},{'ItemStarRoot','wupin/StarPanel/ItemStarRoot',2},
        -- Text 列表
        {'ItemCountText','wupin/ItemPanel/Img_ItemCountPivot/Img_ItemCountBg/ItemCountText',3},
        -- UITemplate 列表
        {'RewardItem01','/',10},
        -- RawImage 列表
        {'VFXPanel','wupin/VFXPanel',15},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.starList = {}
    ---隐藏预制
    self.ItemStarPrefab().gameObject:SetActive(false)
    ---提前创建星
    for i = 1, 6 do
        self.starList[i] = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
    end
    ---获取特效
    self._Rank_2_Vfx=self.VFXPanel().gameObject.transform:Find("lanse_vfx").gameObject
    self._Rank_3_Vfx=self.VFXPanel().gameObject.transform:Find("zise_vfx").gameObject
    self._Rank_4_Vfx=self.VFXPanel().gameObject.transform:Find("jinse_vfx").gameObject
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnItemClick))
end
function M:OnUpdateUI(pData)
    -----@type ItemLocalData 获取数据
    self.itemData = pData[1]
    self.count = pData[2]
    self.type = pData[3]
    -- 见 ItemDetailPop_UI
    -- 为了维持原逻辑，IsUse default true
    ---@type {IsUse:boolean, Callback:fun(), CloseCallback:fun()}
    self.detailArgs = pData[4]
    ---设置星级
    local itemStar = CheckNumber(self.itemData.itemstar)
    local isStart = itemStar > 0
    self.StarPanel().gameObject:SetActive(isStart)
    self.ItemStarRoot().gameObject:SetActive(isStart)
    if isStart then
        ---显示星
        for i = 1,#self.starList do
            self.starList[i]:SetActive(i <= itemStar)
        end
    end
    self.GearPanel().gameObject:SetActive(self.type == 3)
    self.ItemPanel().gameObject:SetActive(self.type ~= 3)
    ---设置品质
    if self.type == 3 then
        ---设置图标
        MgrRes.LoadSprite(self.RewardIcon(),"Item/"..self.itemData.icon)
        ---设置边框
        --MgrRes.LoadSprite(self.RankKuangImg(), string.format("Quality/RankKuang_%s",self.itemData.quality))
        MgrRes.LoadSprite(self.RankKuangImg(),self:GetQualityName(self.itemData.quality))
        ---钻石边框闪烁
        if self.itemData.id == 100000 then
            self.RewardRankImg().transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
        else
            self.RewardRankImg().transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(false)
        end

        ---设置特殊符
        self.RankPlusPanel().gameObject:SetActive(self.itemData.quality == 5)
        self.CoreRank_4().gameObject:SetActive(false)
        if self.itemData.quality == 5 then
            self.CoreRank_6().gameObject:SetActive(true)
            MgrRes.LoadSprite(self.CoreRank_6(),"Quality/RankKuangPlus_"..self.itemData.quality)
        else
            self.CoreRank_6().gameObject:SetActive(false)
        end
        for i, Obj in ipairs(self.starList) do
            if self.itemData.quality == 5 then
                MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/Img_XingSuper")
            else
                MgrRes.LoadSprite(Obj:GetComponent("Image"),"Item/Img_Xing_23")
            end
        end
        ---根据品质显示特效
        self._Rank_2_Vfx:SetActive(self.itemData.quality == 1 or self.itemData.quality == 2)
        self._Rank_3_Vfx:SetActive(self.itemData.quality == 3 or self.itemData.quality == 4)
        self._Rank_4_Vfx:SetActive(self.itemData.quality == 5 or self.itemData.quality == 6)
    else
        ---设置图标
        if self.type == 5 then   ---共鸣装备的资源路径不同
            MgrRes.LoadSprite(self.RewardIconImg(),self.itemData.icon)
        else
            --带动画勋章
            if self.itemData.anime and self.itemData.anime ~= "0" then
                Tools.ClearAllChild(self.RewardVFX().gameObject)
                self.RewardIconImg().gameObject:SetActive(false)
                self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"

                MgrRes.GetPrefab(self.vfx_path..self.itemData.anime..".prefab",function(Obj)
                    if Obj == nil then return end
                    Obj.transform:SetParent(self.RewardVFX().gameObject.transform)
                    Obj.transform.localPosition = Vector3.zero
                    Obj.transform.localScale = Vector3(21,21,1)
                end)
            else
                Tools.ClearAllChild(self.RewardVFX().gameObject)
                self.RewardIconImg().gameObject:SetActive(true)
                 MgrRes.LoadSprite(self.RewardIconImg(),"Item/"..self.itemData.icon)
            end
        end
        ---设置边框
        MgrRes.LoadSprite(self.RewardRankImg(), string.format("Item/Rank/ItemRank_%s",self.itemData.quality))
        --MgrRes.LoadSprite(self.RewardRankImg(),self:GetQualityName(self.itemData.iconFrameGear))
        ---边框闪烁
        if self.itemData.quality == 1 or self.itemData.quality == 2 then
            self.RewardRankImg().transform:GetChild(0).transform:GetChild(0).gameObject:SetActive(true)
        elseif self.itemData.quality == 3 then
            self.RewardRankImg().transform:GetChild(0).transform:GetChild(1).gameObject:SetActive(true)
        elseif self.itemData.quality == 4 then
            self.RewardRankImg().transform:GetChild(0).transform:GetChild(2).gameObject:SetActive(true)
        end

        ---根据品质显示特效
        self._Rank_2_Vfx:SetActive(self.itemData.quality == 2)
        self._Rank_3_Vfx:SetActive(self.itemData.quality == 3)
        self._Rank_4_Vfx:SetActive(self.itemData.quality == 4)
        ---设置数量
        self.ItemCountText().text = JNStrTool.numberAbbr(self.count) --(self.count >= 10000 and math.floor(tonumber(self.count)/1000).."K" or self.count)
    end
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

function M:OnItemClick()
    local item = ItemControl.GetItemByIdAndType(self.itemData.id,self.type)
    if item ~= nil then
        --MgrUI.Pop(UID.ItemDetailPop_UI,{ item, true, function() end},true)
        local args = CheckTable(self.detailArgs)
        -- IsUse default true
        MgrUI.Pop(UID.ItemDetailPop_UI,{ item, args.IsUse == nil or args.IsUse, args.Callback, args.CloseCallback},true)
    end
end
return M