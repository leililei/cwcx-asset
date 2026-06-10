-- Code Auto Create Begin
local M = Class('PlotStormScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PlotStormScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Icon','Panel/Img_Icon',2},{'Img_Mask','Panel/Img_Mask',2},{'Img_Mask2','Panel/Img_Mask2',2},{'Img_Juanhaodi','Panel/Img_Juanhaodi',2},{'Img_Volumedi','Panel/Img_Volumedi',2},{'Panel_UnLock','Panel/Panel_UnLock',2},{'Img_Jindudi','Panel/Panel_UnLock/Img_Jindudi',2},{'Jindutiao(hei)','Panel/Panel_UnLock/Jindutiao(hei)',2},{'Img_Rate','Panel/Panel_UnLock/Img_Rate',2},{'Panel_Lock','Panel/Panel_Lock',2},{'Img_Juanbiaodi','Panel/Panel_Lock/Img_Juanbiaodi',2},{'Img_Zhezhao(bai)','Panel/Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Xian1','Panel/Panel_Lock/Img_Xian1',2},{'Img_Xian2','Panel/Panel_Lock/Img_Xian2',2},{'Img_Suo','Panel/Panel_Lock/Img_Suo',2},{'Img_Jiaobiao','Panel/Panel_Lock/Img_Jiaobiao',2},{'ScrollRedDotIcon','Panel/ScrollRedDotIcon',2},
        -- UITemplate 列表
        {'PlotStormScrollItem','/',10},
        -- RawImage 列表
        {'Panel','Panel',15},
        -- TextMeshProUGUI 列表
        {'Text_Number','Panel/Text_Number',20},{'Text_Volume','Panel/Img_Volumedi/Text_Volume',20},{'Text_CurPoint','Panel/Panel_UnLock/Text_CurPoint',20},{'Text_RateName','Panel/Panel_UnLock/Img_Jindudi/Text_RateName',20},{'Text_Rate','Panel/Panel_UnLock/Text_Rate',20},{'Text_Info','Panel/Panel_UnLock/Text_Info',20},{'Text','Panel/Panel_Lock/Text',20},{'Text_Lock','Panel/Panel_Lock/Text_Lock',20},
    }
end
-- Code Auto Create End
---剧情卷初始化
function M:OnInit()

end

function M:OnUpdateUI(pData)
    ---@type StormScrollData 剧情卷刷新
    self.pData = pData[1]
    self.parent = pData[2]
    self.Panel().gameObject:SetActive(self.pData.id ~= nil)
    ---空数据不显示并返回
    if self.pData.id == nil then
        return
    end
    ---检查是否解锁
    self.isLock = StormControl.CheckScrollLock(self.pData.id)
    ---设置锁
    self.Panel_UnLock().gameObject:SetActive(self.isLock)
    self.Panel_Lock().gameObject:SetActive(not self.isLock)
    ---设置卷名
    --self.Text_Name().text = self.pData.name
    ---设置插画
    local path = MgrRes.GetLocalizedName(self.pData.icon)
    MgrRes.LoadSprite(self.Img_Icon(),path)
    ---设置卷序
    self.Text_Number().text = self.pData.index
    ---章节红点
    self.ScrollRedDotIcon().gameObject:SetActive(StormControl.GetStormScrollById(self.pData.id):IsGetBoxStar())
    ---设置解锁参数
    if self.isLock then
        local curPointData = StormControl.GetCurPointByScroll(self.pData.id)
        local maxStar,curStar = self.pData:GetMaxBoxStar()
        local rate = curStar / maxStar
        self.Text_CurPoint().text = curPointData.idxName
        self.Text_Rate().text = math.floor(rate * 100).."%"
        self.Img_Rate().fillAmount = rate
        self.Text_Info().text = self.pData.description
    end
    ---设置点击事件
    UIEvent.LuaClick(self.Img_Icon().gameObject,Handle(self,self.OnClick))
end
---点击事件
function M:OnClick()
    local index = tonumber(self.ObjRoot.name) - 1
    if self.parent.curMainIndex + 1 == index then
        if self.isLock then
            local scrollData = self.pData
            StormViewModel.RequestLevelDropInfo(scrollData.points, function()
                StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
                StormViewModel.OpenStormPointUI(scrollData, StormViewModel.PointType.main)
                NoviceViewModel.CheckCurID(51204,function()
                    NoviceViewModel.DoNext()
                end)
            end)
        else
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
        end
    else
        --- 如果不是当前聚焦的卷，则先聚焦至卷Item，并不直接进入
        self.parent.LoopScrollGroup[1]:ScrollToCell(index - 1,3500)
    end
end
return M