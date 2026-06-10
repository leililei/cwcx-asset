-- Code Auto Create Begin
local M = Class('StormPointItem03', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StormPointItem03.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'Img_Icon','UI_Panel/Img_Icon',2},{'PlotPanel','UI_Panel/PlotPanel',2},{'Img_PlotMask','UI_Panel/PlotPanel/Img_PlotMask',2},{'Img_Suo','UI_Panel/PlotPanel/Img_PlotMask/Img_Suo',2},{'Img_Juqingicon','UI_Panel/PlotPanel/Img_Juqingicon',2},{'Img_JuqingiconLock','UI_Panel/PlotPanel/Img_JuqingiconLock',2},{'Img_Juqingkuang','UI_Panel/PlotPanel/Img_Juqingkuang',2},{'Img_PlotSelect','UI_Panel/PlotPanel/Img_PlotSelect',2},{'NormalPanel','UI_Panel/NormalPanel',2},{'Img_NormalSelect','UI_Panel/NormalPanel/Img_NormalSelect',2},{'NormalMask','UI_Panel/NormalPanel/NormalMask',2},{'Img_Suo01','UI_Panel/NormalPanel/NormalMask/Img_Suo',2},{'Img_New','UI_Panel/Img_New',2},{'guankadi','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/guankadi',2},{'Img_Gou','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/Img_Gou',2},{'ShortLine','UI_Panel/ShortLine',2},{'Img_PassLine','UI_Panel/ShortLine/Img_PassLine',2},{'Img_PassIcon','UI_Panel/ShortLine/Img_PassLine/Img_PassIcon',2},{'Img_Left','UI_Panel/ShortLine/Img_PassLine/Img_Left',2},{'Img_Right','UI_Panel/ShortLine/Img_PassLine/Img_Right',2},{'Img_NoPassLine','UI_Panel/ShortLine/Img_NoPassLine',2},{'Img_NoPassIcon','UI_Panel/ShortLine/Img_NoPassLine/Img_NoPassIcon',2},{'Img_Left01','UI_Panel/ShortLine/Img_NoPassLine/Img_Left',2},{'Img_Right01','UI_Panel/ShortLine/Img_NoPassLine/Img_Right',2},{'MeddleLine01','UI_Panel/MeddleLine01',2},{'Img_PassLine01','UI_Panel/MeddleLine01/Img_PassLine01',2},{'Img_PassIcon01','UI_Panel/MeddleLine01/Img_PassLine01/Img_PassIcon',2},{'Img_Left02','UI_Panel/MeddleLine01/Img_PassLine01/Img_Left',2},{'Img_Right02','UI_Panel/MeddleLine01/Img_PassLine01/Img_Right',2},{'Img_NoPassLine01','UI_Panel/MeddleLine01/Img_NoPassLine01',2},{'Img_NoPassIcon01','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_NoPassIcon',2},{'Img_Left03','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_Left',2},{'Img_Right03','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_Right',2},{'MeddleLine02','UI_Panel/MeddleLine02',2},{'Img_PassLine02','UI_Panel/MeddleLine02/Img_PassLine02',2},{'Img_PassIcon02','UI_Panel/MeddleLine02/Img_PassLine02/Img_PassIcon',2},{'Img_Left04','UI_Panel/MeddleLine02/Img_PassLine02/Img_Left',2},{'Img_Right04','UI_Panel/MeddleLine02/Img_PassLine02/Img_Right',2},{'Img_NoPassLine02','UI_Panel/MeddleLine02/Img_NoPassLine02',2},{'Img_NoPassIcon02','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_NoPassIcon',2},{'Img_Left05','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_Left',2},{'Img_Right05','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_Right',2},{'LongLine','UI_Panel/LongLine',2},{'Img_PassLine03','UI_Panel/LongLine/Img_PassLine03',2},{'Img_PassIcon03','UI_Panel/LongLine/Img_PassLine03/Img_PassIcon',2},{'Img_left','UI_Panel/LongLine/Img_PassLine03/Img_left',2},{'Img_Right06','UI_Panel/LongLine/Img_PassLine03/Img_Right',2},{'Img_NoPassLine03','UI_Panel/LongLine/Img_NoPassLine03',2},{'Img_NoPassIcon03','UI_Panel/LongLine/Img_NoPassLine03/Img_NoPassIcon',2},{'Img_left01','UI_Panel/LongLine/Img_NoPassLine03/Img_left',2},{'Img_Right07','UI_Panel/LongLine/Img_NoPassLine03/Img_Right',2},
        -- Text 列表
        {'Text','UI_Panel/PlotPanel/Img_PlotMask/Img_Suo/Text',3},{'Text01','UI_Panel/NormalPanel/NormalMask/Img_Suo/Text',3},{'MiddleEffect_ChapterNameText','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText',3},{'MiddleEffect_ChapterIdText','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/guankadi/MiddleEffect_ChapterIdText',3},
        -- UITemplate 列表
        {'StormPointItem03','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.PlotPanel().gameObject:SetActive(false)
    self.NormalPanel().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)
    ---@type StormPointData 关卡刷新
    self.pData = pData[1]
    self.parent = pData[2]
    if self.pData.id == nil then
        self.UI_Panel().gameObject:SetActive(false)
        return
    end
    self.UI_Panel().gameObject:SetActive(true)
    ---根据类型显示UI
    local isSelect = StormViewModel.CurPointData.id == self.pData.id
    local isPlot = self.pData.type == 2
    self.PlotPanel().gameObject:SetActive(isPlot)
    self.NormalPanel().gameObject:SetActive(not isPlot)
    ---是否选中
    self.Img_PlotSelect().gameObject:SetActive(isSelect)
    self.Img_NormalSelect().gameObject:SetActive(isSelect)
    ---是否解锁
    self.pointLock = StormControl.CheckPointLock(self.pData.id)
    self.Img_PlotMask().gameObject:SetActive(not self.pointLock)
    if not isPlot then
        self.Img_Icon().gameObject:SetActive(self.pointLock)
    else
        self.Img_Icon().gameObject:SetActive(true)
    end
    self.NormalMask().gameObject:SetActive(not self.pointLock)
    self.Img_JuqingiconLock().gameObject:SetActive(not self.pointLock)
    self.Img_Juqingicon().gameObject:SetActive(self.pointLock)
    ---下一个是否解锁
    local frontStr = string.split(self.pData.o_fronts,"_")
    self.nextLock = StormControl.CheckPointLock(tonumber(frontStr[1]))
    ---根据下一关是否解锁显示不同长度的线
    self.Img_Gou().gameObject:SetActive(self.nextLock)
    self.Img_PassLine().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine01().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine01().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine02().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine02().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine03().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine03().gameObject:SetActive(not self.nextLock)

    ---线的UI展示
    local nextIsPlot = CheckpointLocalData.tab[tonumber(frontStr[1])].type == 2 and true or false
    if isPlot and nextIsPlot then
        self.ShortLine().gameObject:SetActive(true)
        self.MeddleLine01().gameObject:SetActive(false)
        self.MeddleLine02().gameObject:SetActive(false)
        self.LongLine().gameObject:SetActive(false)
    elseif not isPlot and not nextIsPlot then
        self.ShortLine().gameObject:SetActive(false)
        self.MeddleLine01().gameObject:SetActive(false)
        self.MeddleLine02().gameObject:SetActive(false)
        self.LongLine().gameObject:SetActive(true)
    elseif isPlot and not nextIsPlot then
        self.ShortLine().gameObject:SetActive(false)
        self.MeddleLine01().gameObject:SetActive(false)
        self.MeddleLine02().gameObject:SetActive(true)
        self.LongLine().gameObject:SetActive(false)
    elseif not isPlot and nextIsPlot then
        self.ShortLine().gameObject:SetActive(false)
        self.MeddleLine01().gameObject:SetActive(true)
        self.MeddleLine02().gameObject:SetActive(false)
        self.LongLine().gameObject:SetActive(false)
    end
    ---如果是当前卷最后一关
    if self.pData.scrollID ~= CheckpointLocalData.tab[tonumber(frontStr[1])].scroll then
        self.ShortLine().gameObject:SetActive(false)
        self.MeddleLine01().gameObject:SetActive(false)
        self.MeddleLine02().gameObject:SetActive(false)
        self.LongLine().gameObject:SetActive(false)
    end

    ---检查当前关卡是否是当前最新解锁的关卡
    local curPointData = StormControl.GetHighestPoint()
    if curPointData.id == self.pData.id then
        self.Img_New().gameObject:SetActive(true)
    else
        self.Img_New().gameObject:SetActive(false)
    end
    ---关卡信息
    self.MiddleEffect_ChapterNameText().text = self.pData.name
    self.MiddleEffect_ChapterIdText().text = self.pData.idxName
    ---关卡图片
    if isPlot then
        MgrRes.LoadSprite(self.Img_Icon(),"ArtGallery/PlotCg/"..self.pData.picture)
    else
        MgrRes.LoadSprite(self.Img_Icon(),"Item/"..self.pData.picture)
    end
    ---点击关卡
    UIEvent.LuaClick(self.Img_Icon().gameObject,function()
        if self.pointLock then
            StormViewModel.CurPointData = self.pData
            self.parent:UpdatePointInfo()
            self.parent:MoveItem()
        else
            return
        end
    end)

end

return M