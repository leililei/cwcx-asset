-- Code Auto Create Begin
local M = Class('StormPointItem02', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/StormPointItem02.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'Img_Icon','UI_Panel/Img_Icon',2},{'Img_HardIcon','UI_Panel/Img_HardIcon',2},{'PlotPanel','UI_Panel/PlotPanel',2},{'Img_PlotMask','UI_Panel/PlotPanel/Img_PlotMask',2},{'Img_Suo','UI_Panel/PlotPanel/Img_PlotMask/Img_Suo',2},{'Img_Juqingicon','UI_Panel/PlotPanel/Img_Juqingicon',2},{'Img_JuqingiconLock','UI_Panel/PlotPanel/Img_JuqingiconLock',2},{'Img_Juqingkuang','UI_Panel/PlotPanel/Img_Juqingkuang',2},{'Img_PlotSelect','UI_Panel/PlotPanel/Img_PlotSelect',2},{'NormalPanel','UI_Panel/NormalPanel',2},{'Img_NormalSelect','UI_Panel/NormalPanel/Img_NormalSelect',2},{'NormalMask','UI_Panel/NormalPanel/NormalMask',2},{'Img_Suo01','UI_Panel/NormalPanel/NormalMask/Img_Suo',2},{'HardPanel','UI_Panel/HardPanel',2},{'Img_HardSelect','UI_Panel/HardPanel/Img_HardSelect',2},{'HardMask','UI_Panel/HardPanel/HardMask',2},{'Image','UI_Panel/HardPanel/HardMask/Image',2},{'Img_Suo02','UI_Panel/HardPanel/HardMask/Img_Suo',2},{'Img_New','UI_Panel/Img_New',2},{'guankadi','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/guankadi',2},{'Img_Gou','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/Img_Gou',2},{'ShortLine','UI_Panel/ShortLine',2},{'Img_PassLine','UI_Panel/ShortLine/Img_PassLine',2},{'Img_PassIcon','UI_Panel/ShortLine/Img_PassLine/Img_PassIcon',2},{'Img_Left','UI_Panel/ShortLine/Img_PassLine/Img_Left',2},{'Img_Right','UI_Panel/ShortLine/Img_PassLine/Img_Right',2},{'Img_NoPassLine','UI_Panel/ShortLine/Img_NoPassLine',2},{'Img_NoPassIcon','UI_Panel/ShortLine/Img_NoPassLine/Img_NoPassIcon',2},{'Img_Left01','UI_Panel/ShortLine/Img_NoPassLine/Img_Left',2},{'Img_Right01','UI_Panel/ShortLine/Img_NoPassLine/Img_Right',2},{'MeddleLine01','UI_Panel/MeddleLine01',2},{'Img_PassLine01','UI_Panel/MeddleLine01/Img_PassLine01',2},{'Img_PassIcon01','UI_Panel/MeddleLine01/Img_PassLine01/Img_PassIcon',2},{'Img_Left02','UI_Panel/MeddleLine01/Img_PassLine01/Img_Left',2},{'Img_Right02','UI_Panel/MeddleLine01/Img_PassLine01/Img_Right',2},{'Img_NoPassLine01','UI_Panel/MeddleLine01/Img_NoPassLine01',2},{'Img_NoPassIcon01','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_NoPassIcon',2},{'Img_Left03','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_Left',2},{'Img_Right03','UI_Panel/MeddleLine01/Img_NoPassLine01/Img_Right',2},{'MeddleLine02','UI_Panel/MeddleLine02',2},{'Img_PassLine02','UI_Panel/MeddleLine02/Img_PassLine02',2},{'Img_PassIcon02','UI_Panel/MeddleLine02/Img_PassLine02/Img_PassIcon',2},{'Img_Left04','UI_Panel/MeddleLine02/Img_PassLine02/Img_Left',2},{'Img_Right04','UI_Panel/MeddleLine02/Img_PassLine02/Img_Right',2},{'Img_NoPassLine02','UI_Panel/MeddleLine02/Img_NoPassLine02',2},{'Img_NoPassIcon02','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_NoPassIcon',2},{'Img_Left05','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_Left',2},{'Img_Right05','UI_Panel/MeddleLine02/Img_NoPassLine02/Img_Right',2},{'LongLine','UI_Panel/LongLine',2},{'Img_PassLine03','UI_Panel/LongLine/Img_PassLine03',2},{'Img_PassIcon03','UI_Panel/LongLine/Img_PassLine03/Img_PassIcon',2},{'Img_left','UI_Panel/LongLine/Img_PassLine03/Img_left',2},{'Img_Right06','UI_Panel/LongLine/Img_PassLine03/Img_Right',2},{'Img_NoPassLine03','UI_Panel/LongLine/Img_NoPassLine03',2},{'Img_NoPassIcon03','UI_Panel/LongLine/Img_NoPassLine03/Img_NoPassIcon',2},{'Img_left01','UI_Panel/LongLine/Img_NoPassLine03/Img_left',2},{'Img_Right07','UI_Panel/LongLine/Img_NoPassLine03/Img_Right',2},{'Panel_Start','UI_Panel/Panel_Start',2},{'Img_TaskStar_1','UI_Panel/Panel_Start/Img_TaskStar_1',2},{'Highlight','UI_Panel/Panel_Start/Img_TaskStar_1/Highlight',2},{'Img_TaskStar_2','UI_Panel/Panel_Start/Img_TaskStar_2',2},{'Highlight01','UI_Panel/Panel_Start/Img_TaskStar_2/Highlight',2},{'Img_TaskStar_3','UI_Panel/Panel_Start/Img_TaskStar_3',2},{'Highlight02','UI_Panel/Panel_Start/Img_TaskStar_3/Highlight',2},
        -- UITemplate 列表
        {'StormPointItem02','/',10},
        -- TextMeshProUGUI 列表
        {'Text','UI_Panel/PlotPanel/Img_PlotMask/Img_Suo/Text',20},{'Text01','UI_Panel/NormalPanel/NormalMask/Img_Suo/Text',20},{'Text02','UI_Panel/HardPanel/HardMask/Img_Suo/Text',20},{'MiddleEffect_ChapterNameText','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText',20},{'MiddleEffect_ChapterIdText','UI_Panel/Panel_Title/MiddleEffect_ChapterNameText/guankadi/MiddleEffect_ChapterIdText',20},
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
    local isGuide = self.pData.type == 999 or self.pData.type == 998
    self.PlotPanel().gameObject:SetActive(isPlot)
    self.NormalPanel().gameObject:SetActive(StormViewModel.CurLevelType == 0 and not isPlot)
    self.HardPanel().gameObject:SetActive(StormViewModel.CurLevelType == 1)
    ---是否选中
    self.Img_PlotSelect().gameObject:SetActive(isSelect)
    self.Img_NormalSelect().gameObject:SetActive(isSelect)
    self.Img_HardSelect().gameObject:SetActive(isSelect)
    ---是否解锁
    self.pointLock = StormControl.CheckPointLock(self.pData.id)
    self.Img_PlotMask().gameObject:SetActive(not self.pointLock)
    if StormViewModel.CurLevelType == 0 then
        if not isPlot then
            self.Img_Icon().gameObject:SetActive(self.pointLock)
        else
            self.Img_Icon().gameObject:SetActive(true)
        end
        self.Img_HardIcon().gameObject:SetActive(false)
    else
        self.Img_Icon().gameObject:SetActive(false)
        self.Img_HardIcon().gameObject:SetActive(self.pointLock)
    end
    ---未解锁提醒
    if StormViewModel.CurLevelType == 0 then        --普通
        if not self.pointLock then
            UIEvent.LuaClick(self.NormalMask().gameObject,function()
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"),2},true)
            end)
        end
    elseif StormViewModel.CurLevelType == 1 then    --困难
        if not self.pointLock then
            UIEvent.LuaClick(self.Image().gameObject,function()
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"),2},true)
            end)
        end
    end

    self.NormalMask().gameObject:SetActive(not self.pointLock)
    self.HardMask().gameObject:SetActive(not self.pointLock)
    self.Img_JuqingiconLock().gameObject:SetActive(not self.pointLock)
    self.Img_Juqingicon().gameObject:SetActive(self.pointLock)
    ---如果是剧情关不显示星级
    self.Panel_Start().gameObject:SetActive((not isPlot) and self.pointLock and (not isGuide))
    ---下一个是否解锁
    local frontStr = string.split(self.pData.o_fronts,"_")
    self.nextLock = StormControl.CheckPointLock(tonumber(frontStr[1]))
    ---根据下一关是否解锁显示不同长度的线
    if self.pData:CheckNovice() then
        self.Img_Gou().gameObject:SetActive(StormControl.CheckPointPass(self.pData.id,4))
    else
        self.Img_Gou().gameObject:SetActive(StormControl.CheckPointPass(self.pData.id))
    end
    self.Img_PassLine().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine01().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine01().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine02().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine02().gameObject:SetActive(not self.nextLock)
    self.Img_PassLine03().gameObject:SetActive(self.nextLock)
    self.Img_NoPassLine03().gameObject:SetActive(not self.nextLock)

    ---线的UI展示
    local nextData = CheckpointLocalData.tab[tonumber(frontStr[1])]
    if nextData then
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
    end

    if nextData then
        ---如果是当前卷最后一关
        if self.pData.scrollID ~= CheckpointLocalData.tab[tonumber(frontStr[1])].scroll then
            self.ShortLine().gameObject:SetActive(false)
            self.MeddleLine01().gameObject:SetActive(false)
            self.MeddleLine02().gameObject:SetActive(false)
            self.LongLine().gameObject:SetActive(false)
        end
    else
        ---如果是最后一关
        self.ShortLine().gameObject:SetActive(false)
        self.MeddleLine01().gameObject:SetActive(false)
        self.MeddleLine02().gameObject:SetActive(false)
        self.LongLine().gameObject:SetActive(false)
    end


    ---检查当前关卡是否是当前最新解锁的关卡
    local curPointData = StormControl.GetHighestPoint()
    if curPointData.id == self.pData.id then
        ---如果最新解锁的关卡已通关
        local isPass = false
        if self.pData:CheckNovice() then  --是新手关
            isPass = StormControl.CheckPointPass(curPointData.id,4)
        else
            isPass = StormControl.CheckPointPass(curPointData.id)
        end
        if isPass then
            self.Img_New().gameObject:SetActive(false)
        else
            self.Img_New().gameObject:SetActive(true)
        end
    else
        self.Img_New().gameObject:SetActive(false)
    end
    ---关卡信息
    self.MiddleEffect_ChapterNameText().text = self.pData.name
    self.MiddleEffect_ChapterIdText().text = self.pData.idxName
    ---关卡图片
    local path = MgrRes.GetLocalizedName(self.pData.picture)
    if isPlot then
        MgrRes.LoadSprite(self.Img_Icon(),"ArtGallery/PlotCg/"..path)
    else
        ---是否是困难关卡
        if StormViewModel.CurLevelType == 0 then
            MgrRes.LoadSprite(self.Img_Icon(),"Item/"..self.pData.picture)
        else
            MgrRes.LoadSprite(self.Img_HardIcon(),"Item/"..self.pData.picture)
        end
    end

    ---刷新星星
    self:RefreshStar()
    ---点击关卡
    UIEvent.LuaClick(self.Img_Icon().gameObject,Handle(self,self.OnClick))
    UIEvent.LuaClick(self.Img_HardIcon().gameObject,Handle(self,self.OnClick))
end

---点击事件
function M:OnClick()
    if self.pointLock then
        StormViewModel.CurPointData = self.pData
        self.parent:UpdatePointInfo()
        self.parent:MoveItem()
        self.parent:HideNormalSelect()
        ---是否选中
        self.Img_PlotSelect().gameObject:SetActive(true)
        self.Img_NormalSelect().gameObject:SetActive(true)
        self.Img_HardSelect().gameObject:SetActive(true)
    else
        return
    end
end

---刷新星
function M:RefreshStar()
    ---如果是战斗关卡有星星
    if self.pData:CheckIsBattle() then
        local s1,s2,s3 = self.pData:CheckStar()
        self.Panel_Start().gameObject.transform:GetChild(0).gameObject.transform:Find("Highlight").gameObject:SetActive(s1)
        self.Panel_Start().gameObject.transform:GetChild(1).gameObject.transform:Find("Highlight").gameObject:SetActive(s2)
        self.Panel_Start().gameObject.transform:GetChild(2).gameObject.transform:Find("Highlight").gameObject:SetActive(s3)
    end
end

return M