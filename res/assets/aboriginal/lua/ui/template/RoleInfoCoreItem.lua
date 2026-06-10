-- Code Auto Create Begin
local M = Class('RoleInfoCoreItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/Prefab/Template/RoleInfoCoreItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Hexindi','Img_Hexindi',2},{'Img_CoreHead','Img_CoreHead',2},{'Img_CoreFrame','Img_CoreFrame',2},{'Img_Xingdi','CoreStar/Img_Xingdi',2},{'CoreStar_1','CoreStar/StarContent/CoreStar_1',2},{'Normal','CoreStar/StarContent/CoreStar_1/Normal',2},{'HighLight','CoreStar/StarContent/CoreStar_1/HighLight',2},{'CoreStar_2','CoreStar/StarContent/CoreStar_2',2},{'Normal01','CoreStar/StarContent/CoreStar_2/Normal',2},{'HighLight01','CoreStar/StarContent/CoreStar_2/HighLight',2},{'CoreStar_3','CoreStar/StarContent/CoreStar_3',2},{'Normal02','CoreStar/StarContent/CoreStar_3/Normal',2},{'HighLight02','CoreStar/StarContent/CoreStar_3/HighLight',2},{'CoreStar_4','CoreStar/StarContent/CoreStar_4',2},{'Normal03','CoreStar/StarContent/CoreStar_4/Normal',2},{'HighLight03','CoreStar/StarContent/CoreStar_4/HighLight',2},{'CoreStar_5','CoreStar/StarContent/CoreStar_5',2},{'Normal04','CoreStar/StarContent/CoreStar_5/Normal',2},{'HighLight04','CoreStar/StarContent/CoreStar_5/HighLight',2},{'CoreStar_6','CoreStar/StarContent/CoreStar_6',2},{'Normal05','CoreStar/StarContent/CoreStar_6/Normal',2},{'HighLight05','CoreStar/StarContent/CoreStar_6/HighLight',2},{'Img_+di','+/Img_+di',2},{'CoreRank_4','+/CoreRank_4',2},{'CoreRank_6','+/CoreRank_6',2},{'Img_Qianghuadengjidi','qianghuadengji/Img_Qianghuadengjidi',2},
        -- Text 列表
        {'Text_CoreLevel','qianghuadengji/Text_CoreLevel',3},
        -- UITemplate 列表
        {'RoleInfoCoreItem','/',10},
        -- RawImage 列表
        {'RoleInfoCoreItem01','/',15},
    }
end
-- Code Auto Create End
---角色详情核心初始化
function M:OnInit()
    -----星底框
    --self.starNor = {
    --    [1] = self.CoreStar_1().transform:Find("Normal").gameObject,
    --    [2] = self.CoreStar_2().transform:Find("Normal").gameObject,
    --    [3] = self.CoreStar_3().transform:Find("Normal").gameObject,
    --    [4] = self.CoreStar_4().transform:Find("Normal").gameObject,
    --    [5] = self.CoreStar_5().transform:Find("Normal").gameObject,
    --    [6] = self.CoreStar_6().transform:Find("Normal").gameObject,
    --}
    ---星高亮
    self.starHl = {
        [1] = self.CoreStar_1().transform:Find("HighLight").gameObject,
        [2] = self.CoreStar_2().transform:Find("HighLight").gameObject,
        [3] = self.CoreStar_3().transform:Find("HighLight").gameObject,
        [4] = self.CoreStar_4().transform:Find("HighLight").gameObject,
        [5] = self.CoreStar_5().transform:Find("HighLight").gameObject,
        [6] = self.CoreStar_6().transform:Find("HighLight").gameObject,
    }
    ---品质高亮
    self.rankHl = {
        [1] = nil,
        [2] = nil,
        [3] = nil,
        [4] = self.CoreRank_4().gameObject,
        [5] = nil,
        [6] = self.CoreRank_6().gameObject,
    }
end
---@param pData CoreData 角色详情核心更新
function M:OnUpdateUI(pData)
    ---更新图标
    MgrRes.LoadSprite(self.Img_CoreHead(),pData.icon)
    ---更新边框
    local quality = 0
    if pData.quality == 1 or pData.quality == 2 then
        quality = 1
    elseif pData.quality == 3 then
        quality = 2
    elseif pData.quality == 4 then
        quality = 3
    elseif pData.quality == 5 or pData.quality == 6 then
        quality = 4
    end
    MgrRes.LoadSprite(self.Img_CoreFrame(),"Quality/RoleRank_"..quality)
    ---更新星级
    for starLv = 1, #self.starHl do
        local isStar = pData.star < starLv
        --self.starNor[starLv]:SetActive(isStar)
        self.starHl[starLv]:SetActive(not isStar)
    end
    ---更新角标
    for i, obj in pairs(self.rankHl) do
        if obj then
            obj:SetActive(i == pData.quality)
        end
    end

    self.Text_CoreLevel().text ="+"..pData.level
end
return M