-- Code Auto Create Begin
local M = Class('GuidePointItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/GuidePointItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Guankadi','Panel/Img_Guankadi',2},{'Img_Objective(hei)','Panel/Img_Objective(hei)',2},{'Img_Zhidaoicon','Panel/Img_Zhidaoicon',2},{'PanelHl','PanelHl',2},{'Lock','Lock',2},{'suo','Lock/suo',2},
        -- UITemplate 列表
        {'GuidePointItem','/',10},{'PointRewardsItem','PointRewardsItem',10},
        -- RawImage 列表
        {'GuidePointItem01','/',15},
        -- TextMeshProUGUI 列表
        {'Text_Cont','Panel/Text_Cont',20},
    }
end
-- Code Auto Create End
---战术指导初始化
function M:OnInit()
    ---更新点击
    UIEvent.LuaClick(self.ObjRoot,function()
        if not self.pData:CheckLock() then
            return
        end
        self.PanelHl().gameObject:SetActive(true)
        self.parent.guideSelect:SetParent(self.PanelHl().transform,false)
        self.parent.guideSelect.localPosition = Vector3.zero
        self.parent.text_SelectCont.text = string.format("%s<color=#E36B21>%s</color>：%s",self.pData.name,self.pData.idxName,self.pData.guideName)
        StormViewModel.CurPointData = self.pData
        self.parent:ReloadInfo()
    end)
    self.cg = self.ObjRoot:GetComponent("CanvasGroup")
end
---战术指导卷刷新
function M:OnUpdateUI(pData)
    ---@type StormPointData
    self.pData = pData[1]
    self.parent = pData[2]
    self.Text_Cont().text = string.format("%s%s：%s",self.pData.name,self.pData.idxName,self.pData.guideName)
    local reward = self.pData:GetRewards()[1]

    if self.pData.star == 1 then
        reward.isRec = true
    --elseif self.pData.star == 0 then
    --    reward.isRec = true
    end

    if reward then
        self.PointRewardsItem().gameObject:SetActive(true)
        self.PointRewardsItem():SetData(reward)
    else
        self.PointRewardsItem().gameObject:SetActive(false)
    end
    self.Lock().gameObject:SetActive(not self.pData:CheckLock())
    --if reward.isTake then
    --    self.cg.alpha = 0.8
    --else
    --    self.cg.alpha = 1
    --end
    if self.pData.id == StormViewModel.CurPointData.id then
        self.PanelHl().gameObject:SetActive(true)
        self.parent.guideSelect:SetParent(self.PanelHl().transform,false)
        self.parent.guideSelect.localPosition = Vector3.zero
        self.parent.text_SelectCont.text = string.format("%s<color=#E36B21>%s</color>：%s",self.pData.name,self.pData.idxName,self.pData.guideName)
    else
        self.PanelHl().gameObject:SetActive(false)
    end
end
return M