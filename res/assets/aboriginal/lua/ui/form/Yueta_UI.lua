-- Code Auto Create Begin
local M = Class('Yueta_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Yueta_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Yueta_UI].prefab'
    self.Name = 'Form[Yueta_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_di','Img_BG/Img_di',2},{'Img_di_difficult','Img_BG/Img_di_difficult',2},{'Img_Yueta','Panel_Yueta/Img_Yueta',2},{'Img_Towershen','Panel_Yueta/Img_Yueta/Img_Towershen',2},{'Img_Towerjian','Panel_Yueta/Img_Yueta/Img_Towerjian',2},{'Img_Towershen_difficult','Panel_Yueta/Img_Yueta/Img_Towershen_difficult',2},{'Img_Towerjian_difficult','Panel_Yueta/Img_Yueta/Img_Towerjian_difficult',2},{'wu','Panel_Yueta/wu',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'tanchuangdi','RightPanel/tanchuangdi',2},{'EasyPanel','RightPanel/EasyPanel',2},{'Img_Biaotixian1','RightPanel/EasyPanel/Text_TaskName/Img_Biaotixian1',2},{'Img_Biaotixian2','RightPanel/EasyPanel/DropRewards/Text_Diaoluosucai/Img_Biaotixian2',2},{'HardPanel','RightPanel/HardPanel',2},{'tanchuangdi2','RightPanel/HardPanel/tanchuangdi2',2},{'Img_Biaotixian101','RightPanel/HardPanel/Text_Texingdengji/Img_Biaotixian1',2},{'Bar','RightPanel/HardPanel/Bar',2},{'Img_Bar','RightPanel/HardPanel/Bar/Img_Bar',2},{'btn_yueta','RightPanel/HardPanel/btn_yueta',2},{'Btu_Zuozhanzhunbeidi','RightPanel/Btn_UnInPoint/Btu_Zuozhanzhunbeidi',2},{'Btn_InPoint','RightPanel/Btn_InPoint',2},{'Btu_Zuozhanzhunbeidi01','RightPanel/Btn_InPoint/Btu_Zuozhanzhunbeidi',2},{'Img_Jueseyulandi','RightPanel/Btn_Jueseyulan/Img_Jueseyulandi',2},
        -- Button 列表
        {'Btn_UnInPoint','RightPanel/Btn_UnInPoint',4},{'Btn_InPoint01','RightPanel/Btn_InPoint',4},{'Btn_Jueseyulan','RightPanel/Btn_Jueseyulan',4},
        -- UITemplate 列表
        {'YuetaItem','Panel_Yueta/YuetaScroll/YuetaItem',10},{'BuffPrefab','RightPanel/EasyPanel/BuffScroll/BuffPrefab',10},{'PointRewardsItem','RightPanel/EasyPanel/DropRewards/Mask/RewardsScroll/PointRewardsItem',10},
        -- RawImage 列表
        {'YuetaScroll','Panel_Yueta/YuetaScroll',15},{'YuetaItem01','Panel_Yueta/YuetaScroll/YuetaItem',15},{'Content','Panel_Yueta/YuetaScroll/Content',15},{'BuffScroll','RightPanel/EasyPanel/BuffScroll',15},{'RewardsScroll','RightPanel/EasyPanel/DropRewards/Mask/RewardsScroll',15},{'RewardsContent','RightPanel/EasyPanel/DropRewards/Mask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'YuetaScroll01','Panel_Yueta/YuetaScroll',18},{'BuffScroll01','RightPanel/EasyPanel/BuffScroll',18},{'RewardsScroll01','RightPanel/EasyPanel/DropRewards/Mask/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperLeftPanel/Text_TitleCn',20},{'Text_TitleEn','UpperLeftPanel/Text_TitleEn',20},{'Text_PointName','RightPanel/EasyPanel/Text_PointName',20},{'Text_TaskName','RightPanel/EasyPanel/Text_TaskName',20},{'Text_Diaoluosucai','RightPanel/EasyPanel/DropRewards/Text_Diaoluosucai',20},{'Text_Texingdengji','RightPanel/HardPanel/Text_Texingdengji',20},{'Text_PT','RightPanel/HardPanel/Bar/Text_PT',20},{'Text_PT1','RightPanel/HardPanel/Bar/Text_PT1',20},{'Text_PT2','RightPanel/HardPanel/Bar/Text_PT2',20},{'Text_characterisation','RightPanel/HardPanel/btn_yueta/Text _characterisation',20},{'Text_InPoint','RightPanel/Btn_UnInPoint/Text_InPoint',20},{'Text_InPoint01','RightPanel/Btn_InPoint/Text_InPoint',20},{'Text_Saodang','RightPanel/Btn_Jueseyulan/Text_Saodang',20},
    }
end
-- Code Auto Create End
require("LocalData/AbyssrankLocalData")
function M:OnInit()
    ---按钮
    self:InitButton()
    ---初始化层滑块
    self:InitPointScroll()
    self.curIndex = self.TowerPointScroll.curItemIndex
    self.towerContent = self.Content().transform
    ---当前节点
    ---@type StormPointData
    self.CurPointData = nil
    self.CurChooseMonthTower = nil    --当前选中层ID
    ---帮助
    ActiveTutorialControl.ForcePopGuide(YueTaControl.GetYueTaInfo().group)
    ---难度默认普通
    self.hard = 0

    self.YuetaItem().gameObject:SetActive(false)
end
function M:OnUpdateUI()
    ---奖励弹窗
    if YueTaViewModel.Reward ~= nil then
        MgrUI.Pop(UID.ItemAchievePop_UI,{YueTaViewModel.Reward,function() YueTaViewModel.Reward = nil end},true)
    end
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---刷新层数据
    --local firstHard = StormViewModel.GetMonthTowerPointData(YueTaControl.GetYueTaInfo().chapterGroup,1)[3]
    --if firstHard ~= nil and not firstHard.isEmpty and firstHard:CheckLock() then
    --    self.hard = 1
    --    self.Text_Diff().text = MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_10")
    --end
    if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
        self.hard = 1
    end
    
    ---初始化背景图
    self:InitBG()
    ---初始化关卡列表
    self:ReloadPointView()
    ---初始化层奖励滑块
    self:InitRewardsScroll()
    ---初始化Buff模块
    self:InitBuffScroll()
    ---更新当前已选关卡属性
    self:UpdatePointInfo()
    ---特性等级更新
    self:UpdatePoint()
    ---播放bgm
    --MgrSound.PlayBGM(YueTaControl.GetYueTaInfo().music,0.2)
    ---实时刷新
    MgrTimer.AddRepeat("MonthTowerScroll",0.1,function()
        if self.curIndex ~= self.TowerPointScroll.curItemIndex then
            self.curIndex = self.TowerPointScroll.curItemIndex
            self.CurPointData = self.pointList[self.curIndex + 3]
            if self.CurPointData ~= nil then
                ---更新当前已选层属性
                self:UpdatePointInfo()
            end
        end
    end,-1,nil)
end
function M:InitButton()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        ActiveTutorialControl.OpenGuide(YueTaControl.GetYueTaInfo().group)
    end))
    ---回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    ---查看角色血量
    UIEvent.LuaClick(self.Btn_Jueseyulan().gameObject,Handle(self,self.CheckRoleHP))
    ---进入战斗
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,Handle(self,self.StartBattle))
    ---特性BUFF
    UIEvent.LuaClick(self.btn_yueta().gameObject,function()
        YueTaControl.SetCurPoint(self.CurPointData)
        YueTaControl.OpenBuffUI()
    end)
end

function M:InitPointScroll()
    self.TowerPointScroll = self.YuetaScroll01()
    self.TowerPointScroll:SetLuaCellEvent(Handle(self,self.CellItem))
    self.TowerPointScroll:SetChooseEvent(Handle(self, self.Update))
    self.TowerPointScroll:SetUnchooseEvent(Handle(self, self.UnchooseUpdate))
end
---层左侧滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self})
end
function M:Update(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({true})
end
function M:UnchooseUpdate(trans)
    trans:GetComponent("UITemplate"):ScrollUpdate({false})
end
function M:InitRewardsScroll()
    self.RewardsScroll01():SetLuaCellEvent(Handle(self,self.RewardsCellItem))
end
---奖励滑块回调
function M:RewardsCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.RewardsList[idx])
end
function M:InitBuffScroll()
    self.BuffScroll01():SetLuaCellEvent(Handle(self,self.BuffCellItem))
end
function M:BuffCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData(self.BuffList[idx])
end
---刷新关卡列表
function M:ReloadPointView()
    self.CurChooseTower = nil
    ---当前最高关卡
    self.curLevel = YueTaViewModel.GetServerData().curLevel
    if self.hard == 1 then
        self.curLevel = YueTaViewModel.GetServerData().innerCurLevel
    end
    ---刷新滑块
    ---@type StormPointData[]
    self.pointList = StormViewModel.GetMonthTowerPointData(YueTaControl.GetYueTaInfo().chapterGroup,self.hard)    --分普通和困难模式
    ---找到第一关
    self.TowerPointScroll.totalCount = #self.pointList
    local idx = 0
    local blank = StormViewModel.GetMonthTowerCount(YueTaControl.GetYueTaInfo().chapterGroup,self.hard) + 5
    for i = 1,#self.pointList do
        if self.pointList[i].isEmpty == true then
            if idx >= #self.pointList - 3 then
                if self.CurChooseTower == nil then
                    self.CurPointData = self.pointList[idx]
                    self.CurChooseTower = self.pointList[idx]
                end
                break
            end
            idx = idx + 1
            blank = blank - 1
        else
            if self.pointList[i]:CheckLock() or self.pointList[idx].isEmpty then
                if idx == #self.pointList - 3 then
                    self.CurPointData = self.pointList[idx]
                    break
                end
            else
                if self.CurChooseTower == nil then
                    self.CurPointData = self.pointList[idx]
                    self.CurChooseTower = self.pointList[idx]
                else
                    ---如果当前选择的月塔关卡已存在
                    self.CurPointData = self.CurChooseTower
                end
                break
            end
            idx = idx + 1
        end
    end
    if StormViewModel.GetMonthTowerCount() + 5 - blank == idx then
        self.TowerPointScroll:RefillCells(idx + 1)
    elseif idx <= 3 then
        self.TowerPointScroll:RefillCells(0)    --第一关
    else
        ---如果当前选择的关卡是最新关卡
        if self.CurPointData == self.pointList[idx] then
            ---选中最新的那关
            self.TowerPointScroll:RefillCells(idx - 3)
        else
            for k,v in pairs(self.pointList) do
                if v == self.CurChooseTower then
                    ---选中刚才选中的关卡
                    self.TowerPointScroll:RefillCells(k - 3)
                end
            end
        end
    end
end
---更新当前已选层信息
function M:UpdatePointInfo()
    if self.CurPointData.isEmpty ~= true then
        local data = self.CurPointData
        self.CurChooseMonthTower = self.CurPointData.id
        ---层名称
        local floor = string.gmatch(self.CurPointData.name,"%d+")
        local number = floor()
        if self.CurPointData.hard == 0 then
            self.Text_PointName().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_4"),number)
        else
            self.Text_PointName().text = string.format(MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_17"),number)
        end
        ---Buff显示
        self:ShowBuff()
        ---刷新奖励滑块
        self:ReloadRewardsPanel(0)
        ---选中的层的idx
        local idx = self.curIndex + 3
        self.TowerPointScroll:ChooseItem(idx)
        if self.CurPointData.isPass then
            self.Btn_InPoint().gameObject:SetActive(false)
            self.Btn_UnInPoint().gameObject:SetActive(true)
        else
            if self.CurPointData:CheckLock() then
                self.Btn_InPoint().gameObject:SetActive(true)
                self.Btn_UnInPoint().gameObject:SetActive(false)
            else
                self.Btn_InPoint().gameObject:SetActive(false)
                self.Btn_UnInPoint().gameObject:SetActive(true)
            end
        end
    end
end
---奖励滑块刷新
function M:ReloadRewardsPanel(offset)
    if self.CurPointData.isEmpty then
        return
    end
    ---设置当前Loop数据
    self.RewardsList = self.CurPointData:GetRewards()
    ---设置Loop数量
    self.RewardsScroll01().totalCount = #self.RewardsList
    table.sort(self.RewardsList,function(a,b)
        if a.idx < b.idx then
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
---特性等级更新
function M:UpdatePoint()
    local tSelectBuffNum = YueTaViewModel.GetServerData().innerTowerBuffSave and #YueTaViewModel.GetServerData().innerTowerBuffSave or 0
    local tPoint = YueTaViewModel.GetInnerBuffPT()
    self.Text_PT1().text = tPoint
    self.Text_PT2().text = tSelectBuffNum.."/"..#YueTaControl.GetBuffList()

    local Stage,TextColor = YueTaControl.CheckStage(tPoint)
    MgrRes.LoadSprite(self.Img_Bar(), "Yueta/Img_bar_"..Stage)
    self.Text_PT().color = TextColor[1]
    self.Text_PT1().color = TextColor[2]
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        self.CurPointData = nil
        MgrUI.GoBack()
    end
end
---返回按钮
function M:OnBackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    self.CurPointData = nil
    MgrUI.GoBack()
end
---返回大厅按钮
function M:OnBackHomeClick()
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end

function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("MonthTowerScroll")
    MgrTimer.Cancel("BGPosition")
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("MonthTowerScroll")
    MgrTimer.Cancel("BGPosition")
end

function M:CheckRoleHP()
    MgrUI.Pop(UID.StatusPop_UI)
end

function M:ChangeBG()
    ---根据self.hard换背景
    self.Img_di().gameObject:SetActive(self.hard == 0)
    self.Img_Towershen().gameObject:SetActive(self.hard == 0)
    self.Img_Towerjian().gameObject:SetActive(self.hard == 0)
    self.EasyPanel().gameObject:SetActive(self.hard == 0)
    self.Img_di_difficult().gameObject:SetActive(self.hard == 1)
    self.Img_Towershen_difficult().gameObject:SetActive(self.hard == 1)
    self.Img_Towerjian_difficult().gameObject:SetActive(self.hard == 1)
    self.HardPanel().gameObject:SetActive(self.hard == 1)
end

function M:InitBG()
    self:ChangeBG()
    ---背景图移动
    self.bgHeight = self.Img_BG().transform:GetComponent("RectTransform").rect.height   --总长
    local count = StormViewModel.GetMonthTowerCount(YueTaControl.GetYueTaInfo().chapterGroup,self.hard)
    self.moveStepHeight = self.bgHeight / count  --每一步长
    MgrTimer.AddRepeat("BGPosition",0,function()
        self.parentHeight = self.ObjRoot.transform:GetComponent("RectTransform").rect.height
        local targetY = (self.TowerPointScroll.itemTypeStart + 1)*self.moveStepHeight - self.bgHeight/2
        if targetY > self.bgHeight / 2 - self.parentHeight / 2 then
            targetY = self.bgHeight / 2 - self.parentHeight / 2
        elseif targetY < self.parentHeight / 2 - self.bgHeight / 2 then
            targetY = self.parentHeight / 2 - self.bgHeight / 2
        end
        self.Img_BG().transform.localPosition = Vector3.Lerp(self.Img_BG().transform.localPosition,Vector3(0,targetY,0),0.1)
        self.Img_Yueta().transform.localPosition = Vector3.Lerp(self.Img_Yueta().transform.localPosition,Vector3(-375.11,targetY,0),0.1)
    end,-1,nil)
end
---Buff显示
function M:ShowBuff()
    if self.CurPointData.isEmpty ~= true then
        self.BuffList = self.CurPointData:GetBuff()
        if #self.BuffList ~= 0 then
            self.BuffScroll01().totalCount = #self.BuffList
            self.BuffScroll01():RefillCells(0)
        end
    end
end

function M:StartBattle()
    if not YueTaViewModel.GetYuetaData():CheckUnlock() then
        ---提示尚未解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_tips1"),1},true)
        return
    elseif self.hard == 1 and YueTaViewModel.GetServerData().innerTowerBuff == nil then
        ---
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_33"),1},true)
        return
    end
    if self.CurPointData:CheckLock() then
        BattleManager.GameMode = BattleManager.GameModeType.MonthTower
        StormViewModel.CurPointType = StormViewModel.PointType.monthTower
        StormViewModel.CurPointData = self.CurPointData
        StormViewModel.CurChooseMonthTower = self.CurChooseMonthTower
        MgrBattle.GoFight(MgrBattle.fightType.normal,nil,self.CurPointData.battleMap)
    else
        ---提示尚未解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"),1},true)
    end
end
---弹出BUFF界面
function M:OpenBuff()
    if YueTaControl.GetMode() ~= YueTaControl.ModeType.HARD or YueTaViewModel.GetServerData().innerTowerBuff then
        return
    end
    YueTaControl.SetCurPoint(self.CurPointData)
    YueTaControl.OpenBuffUI()
end

function M:OnShowFinish()
    ---弹出BUFF界面
    --self:OpenBuff()
end
return M