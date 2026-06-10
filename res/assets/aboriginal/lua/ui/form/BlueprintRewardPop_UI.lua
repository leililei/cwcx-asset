-- Code Auto Create Begin
local M = Class('BlueprintRewardPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BlueprintRewardPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BlueprintRewardPop_UI].prefab'
    self.Name = 'Form[BlueprintRewardPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BtnMask','BtnMask',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'ImgFg','ImgFg',2},{'Img_Xian1(1)','Img_Xian1 (1)',2},{'RewardsScroll','RewardsScroll',2},
        -- UITemplate 列表
        {'PointRewardsItem','RewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'RewardsContent','RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll01','RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_PointName','Text_PointName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BtnMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
    
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(pData)
    ---@type StormPointData
    local pointData = pData[1]
    pointData:PushRandReward(BlueprintViewModel.GetRaidReward(pointData.id))
    self.RewardsList = pointData:GetRewards()
    self.RewardsScroll01().totalCount = #self.RewardsList
    self.RewardsScroll01():RefillCells()
end

function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end
return M