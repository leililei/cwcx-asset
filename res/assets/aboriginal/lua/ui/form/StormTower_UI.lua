-- Code Auto Create Begin
local M = Class('StormTower_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.StormTower_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[StormTower_UI].prefab'
    self.Name = 'Form[StormTower_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Tower','Panel_Tower/Img_Tower',2},{'Img_Select','Panel_Tower/TowerPointScroll/Img_Select',2},{'Img_Select2','Panel_Tower/TowerPointScroll/Img_Select/Img_Select 2',2},{'Img_Select3','Panel_Tower/TowerPointScroll/Img_Select/Img_Select 3',2},{'wu','Panel_Tower/WU/WU_L/wu',2},{'wu_2','Panel_Tower/WU/WU_L/wu_2',2},{'wu01','Panel_Tower/WU/WU_R/wu',2},{'wu_201','Panel_Tower/WU/WU_R/wu_2',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'tanchuangdi','Panel_Info/tanchuangdi',2},{'Img_Xian2','Panel_Info/Img_Xian2',2},{'Img_Xian1','Panel_Info/Img_Xian1',2},{'Img_Biaotixian1','Panel_Info/Text_TaskName/Img_Biaotixian1',2},{'Img_StarTask','Panel_Info/TaskScroll/Img_StarTask',2},{'Img_TaskStar','Panel_Info/TaskScroll/Img_StarTask/Img_TaskStar',2},{'Highlight','Panel_Info/TaskScroll/Img_StarTask/Img_TaskStar/Highlight',2},{'Btn_InPoint','Panel_Info/Btn_InPoint',2},{'Btu_Zuozhanzhunbeidi','Panel_Info/Btn_InPoint/Btu_Zuozhanzhunbeidi',2},{'Img_Biaotixian2','Panel_Info/DropRewards/Text_Diaoluosucai/Img_Biaotixian2',2},
        -- Button 列表
        {'Btn_InPoint01','Panel_Info/Btn_InPoint',4},
        -- UITemplate 列表
        {'TowerPointItem','Panel_Tower/TowerPointScroll/TowerPointItem',10},{'PointRewardsItem','Panel_Info/DropRewards/Mask/RewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'TowerPointScroll','Panel_Tower/TowerPointScroll',15},{'Content','Panel_Tower/TowerPointScroll/Content',15},{'TowerPointItem01','Panel_Tower/TowerPointScroll/TowerPointItem',15},{'TaskScroll','Panel_Info/TaskScroll',15},{'RewardsScroll','Panel_Info/DropRewards/Mask/RewardsScroll',15},{'RewardsContent','Panel_Info/DropRewards/Mask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'TowerPointScroll01','Panel_Tower/TowerPointScroll',18},{'TaskScroll01','Panel_Info/TaskScroll',18},{'RewardsScroll01','Panel_Info/DropRewards/Mask/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title','UpperLeftPanel/Text_Title',20},{'Text_RedTower','UpperLeftPanel/Text_RedTower',20},{'Text_PointName','Panel_Info/Text_PointName',20},{'Text_TaskName','Panel_Info/Text_TaskName',20},{'Text_TaskDes','Panel_Info/TaskScroll/Img_StarTask/Text_TaskDes',20},{'Text_InPoint','Panel_Info/Btn_InPoint/Text_InPoint',20},{'Text_Diaoluosucai','Panel_Info/DropRewards/Text_Diaoluosucai',20},{'Text_Level','Panel_Info/Text_Level',20},
    }
end
-- Code Auto Create End
---红巨初始化
function M:OnInit()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(96)
    end))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,Handle(self,self.OnPointClick))
    ---初始化层滑块
    self:InitPointScroll()
    ---刷新层数据
    --self:ReloadPointView()
    ---初始化层奖励滑块
    --self:InitRewardsScroll()
    ---更新当前已选关卡属性
    --self:UpdatePointInfo()
    self.curIndex = self.TowerPointScroll.curItemIndex
    self.towerHl = self.Img_Select()
    self.towerContent = self.Content().transform
    self.towerHlDiff = 0
end

function  M:OnShowFinish()
    NoviceViewModel.CheckCurID(21204,function()
        NoviceViewModel.DoNext()
    end)
    -----首次进入引导
    --NoviceViewModel.CheckFirstGuide(50)
end
---红巨刷新
function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---刷新层数据
    self:ReloadPointView()
    ---初始化层奖励滑块
    self:InitRewardsScroll()
    ---更新当前已选关卡属性
    self:UpdatePointInfo()
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113020][2],0.2)
    MgrTimer.AddRepeat("TowerScroll",0.1,function()
        if self.curIndex~=self.TowerPointScroll.curItemIndex then
            self.curIndex = self.TowerPointScroll.curItemIndex
            if #self.pointList < self.curIndex+3 then
                StormViewModel.CurPointData = self.pointList[#self.pointList-3]
            else
                StormViewModel.CurPointData = self.pointList[self.curIndex+3]
            end

            ---更新当前已选层属性
            self:UpdatePointInfo()
        end
        local diff = math.abs(self.towerContent.anchoredPosition.y % 264)
        if self.towerHlDiff ~= diff then
            self.towerHlDiff = diff
            local size = 1 + (1 - math.abs(self.towerHlDiff - 132) / 132) / 5
            self.towerHl.transform.localScale = Vector3(size,size,1)
            if size == 1 then
                MgrSound.PlayEffect("yx_ui_qiehuanzhangjie_01",1,nil,false)
            end
        end
    end,-1,nil)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        StormViewModel.CurPointData = nil
        MgrUI.GoBack()
    end
end

---更新当前已选层信息
function M:UpdatePointInfo()
    local data = StormViewModel.CurPointData
    if data == nil or data.isEmpty or data.towerLevel == nil then
        return
    end
    ---刷新奖励滑块
    self:ReloadRewardsPanel(0)
    ---层名称
    self.Text_PointName().text = data.name
    ---推荐等级
    self.Text_Level().text = MgrLanguageData.GetLanguageByKey("stormtower_ui_adviselevel")..data.towerLevel
    ---更新挑战达成
    self:ReloadTaskView()
end

function M:InitPointScroll()
    self.TowerPointScroll = self.TowerPointScroll01()
    self.TowerPointScroll:SetLuaCellEvent(Handle(self,self.CellItem))


    self.TaskScroll = self.TaskScroll01()
    self.TaskScroll:SetLuaCellEvent(Handle(self,self.CellTask))
end
---层左侧滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self})
end
---右侧达成条件回调
function M:CellTask(trans,idx)
    trans:Find("Img_TaskStar/Highlight").gameObject:SetActive(self.taskList[idx])
    trans:Find("Text_TaskDes"):GetComponent("TextMeshProUGUI").text = StormViewModel.CurPointData.towerReward[idx].taskText
end
---层视图刷新
function M:ReloadPointView()
    ---刷新滑块
    self.pointList = StormViewModel.GetStormTowerPointData()
    local num = StormViewModel.GetStormTowerCount() + 2
    ---找到第一关
    self.TowerPointScroll.totalCount = #self.pointList
    local idx = StormViewModel.GetStormTowerCount() + 5 --总数 + 5
    local blank = 0
    for i = #self.pointList, 1, -1 do
        if self.pointList[i].isEmpty == true then
            if idx <= 2 then
                break
            end
            idx = idx - 1
            blank = blank + 1
        else
            if self.pointList[i]:CheckLock() then
                if idx == 3 then
                    StormViewModel.CurPointData = self.pointList[idx]
                    break
                end
            else
                if StormViewModel.CurChooseTower == nil then
                    idx = idx + 1
                    StormViewModel.CurPointData = self.pointList[idx]
                    StormViewModel.CurChooseTower = self.pointList[idx]
                else
                    ---如果当前选择的红色巨塔关卡已存在
                    StormViewModel.CurPointData = StormViewModel.CurChooseTower
                end
                break
            end
            idx = idx - 1
        end
    end
    if StormViewModel.GetStormTowerCount() + 5 - blank == idx then
        self.TowerPointScroll:RefillCells(idx + 1)
    elseif idx + 1 == 3 then
        self.TowerPointScroll:RefillCells(0)
    else
        ---如果当前选择的关卡是最新关卡
        if StormViewModel.CurPointData == self.pointList[idx] then
            ---选中最新的那关
            self.TowerPointScroll:RefillCells(idx - 3)
        else
            for k,v in pairs(self.pointList) do
                if v == StormViewModel.CurChooseTower then
                    ---选中刚才选中的关卡
                    self.TowerPointScroll:RefillCells(k- 3)
                end
            end
        end
    end
end
---达成条件刷新
function M:ReloadTaskView()
    self.taskList = StormViewModel.CurPointData:CheckTowerTask()
    self.TaskScroll.totalCount = #self.taskList
    self.TaskScroll:RefillCells(0)
end

function M:InitRewardsScroll()
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
end
---奖励滑块回调
function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end
---奖励滑块刷新
function M:ReloadRewardsPanel(offset)
    if StormViewModel.CurPointData == nil or StormViewModel.CurPointData.isEmpty then
        return
    end
    ---设置当前Loop数据
    self.RewardsList = StormViewModel.CurPointData:GetRewards()
    ---设置Loop数量
    self.RewardsScroll01().totalCount = #self.RewardsList
    table.sort(self.RewardsList,function(a,b)
        if a.towerIdx < b.towerIdx then
            return true
        else
            return false
        end
    end)
    if offset then
        self.RewardsScroll01():RefillCells(offset)
    else
        self.RewardsScroll01():RefreshCells()
    end
end
---前往当前关卡
function M:OnPointClick()
    if not StormViewModel.CurPointData:CheckLock() then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
        return
    end
    BattleManager.GameMode = BattleManager.GameModeType.RedTower
    StormViewModel.OpenStormPlotUI(StormViewModel.PointType.tower)
    StormViewModel.CurChooseTower = StormControl.CheckPointPass(StormViewModel.CurPointData.id,StormViewModel.CurPointData.pointType) and StormViewModel.CurPointData or nil
end
---返回按钮
function M:OnBackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    StormViewModel.CurPointData = nil
    MgrUI.GoBack()
end
---返回大厅按钮
function M:OnBackHomeClick()
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end
function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("TowerScroll")
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("TowerScroll")
end

return M