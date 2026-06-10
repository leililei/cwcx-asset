-- Code Auto Create Begin
local M = Class('EventLevelsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/EventLevelsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'PlotPanel','UI_Panel/PlotPanel',2},{'dikuang','UI_Panel/PlotPanel/StoryUnlock/dikuang',2},{'Img_StoryUnlock','UI_Panel/PlotPanel/StoryUnlock/Img_StoryUnlock',2},{'Img_StoryLock','UI_Panel/PlotPanel/StoryLock/Img_StoryLock',2},{'Icon_Lock_Plot','UI_Panel/PlotPanel/StoryLock/Img_StoryLock/Icon_Lock_Plot',2},{'Img_lockline_Plot','UI_Panel/PlotPanel/Img_lockline_Plot',2},{'Img_Unlockline_Plot','UI_Panel/PlotPanel/Img_Unlockline_Plot',2},{'NormalPanel','UI_Panel/NormalPanel',2},{'Img_Battle','UI_Panel/NormalPanel/BattleLock/BattleButton1/Img_Battle',2},{'Img_Battlelock','UI_Panel/NormalPanel/BattleLock/BattleButton1/Img_Battlelock',2},{'Img_BattleUnlock','UI_Panel/NormalPanel/BattleLock/BattleButton1/Img_BattleUnlock',2},{'Icon_Battle','UI_Panel/NormalPanel/BattleLock/BattleButton1/Icon_Battle',2},{'Icon_Lock_Battle','UI_Panel/NormalPanel/BattleLock/BattleButton1/Icon_Lock_Battle',2},{'Icon_Boss','UI_Panel/NormalPanel/BattleLock/BattleButton1/Icon_Boss',2},{'Img_Star','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar1/Img_Star',2},{'Img_StarOn','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar1/Img_Star/Img_StarOn',2},{'Img_StarOff','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar1/Img_Star/Img_StarOff',2},{'Img_Star01','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar2/Img_Star',2},{'Img_StarOn01','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar2/Img_Star/Img_StarOn',2},{'Img_StarOff01','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar2/Img_Star/Img_StarOff',2},{'Img_Star02','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar3/Img_Star',2},{'Img_StarOn02','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar3/Img_Star/Img_StarOn',2},{'Img_StarOff02','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar3/Img_Star/Img_StarOff',2},{'Img_lockline_Plot01','UI_Panel/NormalPanel/Panel_Title/Img_lockline_Plot',2},{'Img_Unlockline_Plot01','UI_Panel/NormalPanel/Panel_Title/Img_Unlockline_Plot',2},{'BossPanel','UI_Panel/BossPanel',2},{'Img_HardBoss','UI_Panel/BossPanel/BossGroup/BossButton/Img_HardBoss',2},{'Img_EXBoss','UI_Panel/BossPanel/BossGroup/BossButton/Img_EXBoss',2},{'Img_Star03','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar1/Img_Star',2},{'Img_StarOn03','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar1/Img_Star/Img_StarOn',2},{'Img_StarOff03','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar1/Img_Star/Img_StarOff',2},{'Img_Star04','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar2/Img_Star',2},{'Img_StarOn04','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar2/Img_Star/Img_StarOn',2},{'Img_StarOff04','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar2/Img_Star/Img_StarOff',2},{'Img_Star05','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar3/Img_Star',2},{'Img_StarOn05','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar3/Img_Star/Img_StarOn',2},{'Img_StarOff05','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar3/Img_Star/Img_StarOff',2},{'Img_lockline_Plot02','UI_Panel/BossPanel/BossGroup/Panel_Title/Img_lockline_Plot',2},{'Img_Unlockline_Plot02','UI_Panel/BossPanel/BossGroup/Panel_Title/Img_Unlockline_Plot',2},{'Icon_Lock_Boss','UI_Panel/BossPanel/BossGroup/Icon_Lock_Boss',2},{'ShortLine','UI_Panel/ShortLine',2},{'Img_Linefrom1','UI_Panel/ShortLine/Img_Linefrom1',2},{'Img_Linefrom2','UI_Panel/ShortLine/Img_Linefrom2',2},{'Img_Select','UI_Panel/Img_Select',2},
        -- Text 列表
        {'PlotChapterText','UI_Panel/PlotPanel/PlotChapterText',3},{'PlotNameText','UI_Panel/PlotPanel/PlotChapterText/PlotNameText',3},{'NormalNameText','UI_Panel/NormalPanel/Panel_Title/NormalNameText',3},{'NormalChapterText','UI_Panel/NormalPanel/Panel_Title/NormalNameText/NormalChapterText',3},{'BossNameText','UI_Panel/BossPanel/BossGroup/Panel_Title/BossNameText',3},{'BossChapterText','UI_Panel/BossPanel/BossGroup/Panel_Title/BossNameText/BossChapterText',3},
        -- UITemplate 列表
        {'EventLevelsItem','/',10},
        -- RawImage 列表
        {'StoryUnlock','UI_Panel/PlotPanel/StoryUnlock',15},{'StoryLock','UI_Panel/PlotPanel/StoryLock',15},{'BattleButton1','UI_Panel/NormalPanel/BattleLock/BattleButton1',15},{'NormalBattleStar1','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar1',15},{'NormalBattleStar2','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar2',15},{'NormalBattleStar3','UI_Panel/NormalPanel/BattleLock/BattleStarGroup/NormalBattleStar3',15},{'BossBattleStar1','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar1',15},{'BossBattleStar2','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar2',15},{'BossBattleStar3','UI_Panel/BossPanel/BossGroup/BattleStarGroup/BossBattleStar3',15},
    }
end
-- Code Auto Create End
---@param pData StormPointData
function M:OnUpdateUI(pData)
    self.UI_Panel().gameObject:SetActive(pData[1].id ~= nil)
    if pData[1].id == nil then
        return
    end
    ---@type StormPointData 本关卡数据
    self.pointData = pData[1]
    self.parent = pData[2]
    self.index = pData[3]

    ---根据关卡类型显示不同UI,并按类型初始化按钮
    if self.pointData.type == StormViewModel.PointBattleType.NORMAL_BATTLE then    ---普通战斗
    self:NormalBattleInit()
    elseif self.pointData.type == StormViewModel.PointBattleType.STORY then       ---剧情
    self:StoryInit()
    elseif self.pointData.type == StormViewModel.PointBattleType.ACTIVITY_BOSS then       ---活动BOSS
    self:ActivityBossInit()
    end
    ---更新选中UI
    self.Img_Select().gameObject:SetActive(StormViewModel.CurPointData == self.pointData)
end

function M:NormalBattleInit()
    self.PlotPanel().gameObject:SetActive(false)
    self.BossPanel().gameObject:SetActive(false)
    self.NormalPanel().gameObject:SetActive(true)
    self.Img_Linefrom1().gameObject:SetActive(true)
    self.Img_Linefrom2().gameObject:SetActive(true)
    ---检查关卡是否已经解锁
    local unlock = StormControl.CheckPointLock(self.pointData.id)
    if unlock then
        --self.Img_lockline_Normal().gameObject:SetActive(false)
        self.Img_Battlelock().gameObject:SetActive(false)
        self.Icon_Boss().gameObject:SetActive(false)
        self.Icon_Lock_Battle().gameObject:SetActive(false)
        self.Icon_Battle().gameObject:SetActive(true)
        self:NormalBattleInit_Button()
    else
        --self.Img_lockline_Normal().gameObject:SetActive(true)
        self.Img_Battlelock().gameObject:SetActive(true)
        self.Icon_Boss().gameObject:SetActive(false)
        self.Icon_Lock_Battle().gameObject:SetActive(true)
        self.Icon_Battle().gameObject:SetActive(false)
    end
    ---显示星级
    local sArr = {}
    sArr[1],sArr[2],sArr[3] = self.pointData:CheckStar()
    self.hStars = {
        [1] = self.NormalBattleStar1().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
        [2] = self.NormalBattleStar2().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
        [3] = self.NormalBattleStar3().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
    }
    self.nStars = {
        [1] = self.NormalBattleStar1().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
        [2] = self.NormalBattleStar2().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
        [3] = self.NormalBattleStar3().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
    }
    for i = 1, #self.nStars do
        self.nStars[i]:SetActive(not sArr[i])
        self.hStars[i]:SetActive(sArr[i])
    end
    ---关卡名
    self.NormalNameText().text = self.pointData.name
    ---引索名
    self.NormalChapterText().text = self.pointData.idxName
    ---连接线
    if self.index % 2 ~= 0 then    ---单数个
    self.UI_Panel():GetComponent("RectTransform").localPosition = Vector3(0,150,0)
        self.Img_Linefrom2().gameObject:SetActive(false)
        self.Img_Linefrom1():GetComponent("RectTransform").localPosition = Vector3(0,-150,0)
    else
        self.UI_Panel():GetComponent("RectTransform").localPosition = Vector3(0,-150,0)
        self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2():GetComponent("RectTransform").localPosition = Vector3(0,150,0)
    end
    local frontStr = string.split(self.pointData.o_fronts,"_")
    if CheckpointLocalData.tab[tonumber(frontStr[1])] == nil then
        self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2().gameObject:SetActive(false)
    elseif self.pointData.scrollID ~= CheckpointLocalData.tab[tonumber(frontStr[1])].scroll then    ---和解锁关卡的scrollID比较
        self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2().gameObject:SetActive(false)
    end
end
function M:NormalBattleInit_Button()
    UIEvent.LuaClick(self.BattleButton1().gameObject,Handle(self,self.BeClick))
end
function M:StoryInit()
    self.NormalPanel().gameObject:SetActive(false)
    self.BossPanel().gameObject:SetActive(false)
    self.PlotPanel().gameObject:SetActive(true)
    self.Img_Linefrom1().gameObject:SetActive(true)
    self.Img_Linefrom2().gameObject:SetActive(true)
    ---检查关卡是否已经解锁
    local unlock = StormControl.CheckPointLock(self.pointData.id)
    if unlock then
        self.StoryLock().gameObject:SetActive(false)
        self.Img_Unlockline_Plot().gameObject:SetActive(true)
        self.Img_lockline_Plot().gameObject:SetActive(false)
        UIEvent.LuaClick(self.Img_StoryUnlock().gameObject,Handle(self,self.BeClick))
    else
        self.StoryLock().gameObject:SetActive(false)
        self.Img_Unlockline_Plot().gameObject:SetActive(false)
        self.Img_lockline_Plot().gameObject:SetActive(true)
    end
    ---关卡图片
    MgrRes.LoadSprite(self.Img_StoryUnlock(),"ArtGallery/PlotCg/" .. self.pointData.picture)
   ---关卡名称
    self.PlotNameText().text = self.pointData.name
    ---关卡引索
    self.PlotChapterText().text = self.pointData.idxName
    ---连接线
    if self.index % 2 ~= 0 then    ---单数个
    self.UI_Panel():GetComponent("RectTransform").localPosition = Vector3(0,150,0)
        self.Img_Linefrom2().gameObject:SetActive(false)
        self.Img_Linefrom1():GetComponent("RectTransform").localPosition = Vector3(0,-150,0)
    else
        self.UI_Panel():GetComponent("RectTransform").localPosition = Vector3(0,-150,0)
        self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2():GetComponent("RectTransform").localPosition = Vector3(0,150,0)
    end
    local frontStr = string.split(self.pointData.o_fronts,"_")
    if CheckpointLocalData.tab[tonumber(frontStr[1])] == nil then
        self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2().gameObject:SetActive(false)
    elseif self.pointData.scrollID ~= CheckpointLocalData.tab[tonumber(frontStr[1])].scroll then    ---和解锁关卡的scrollID比较
    self.Img_Linefrom1().gameObject:SetActive(false)
        self.Img_Linefrom2().gameObject:SetActive(false)
    end
end
function M:StoryInit_Button()
    UIEvent.LuaClick(self.Img_StoryUnlock().gameObject,Handle(self,self.BeClick))
end
function M:ActivityBossInit()
    self.PlotPanel().gameObject:SetActive(false)
    self.NormalPanel().gameObject:SetActive(false)
    self.BossPanel().gameObject:SetActive(true)
    self.Img_EXBoss().gameObject:SetActive(false)
    ---检查关卡是否已经解锁
    local unlock = StormControl.CheckPointLock(self.pointData.id)
    if unlock then
        self.Img_Unlockline_Plot().gameObject:SetActive(true)
        self.Img_lockline_Plot().gameObject:SetActive(false)
        self.Icon_Lock_Boss().gameObject:SetActive(false)
        self:ActivityBossInit_Button()
    else
        self.Icon_Lock_Boss().gameObject:SetActive(true)
        self.Img_Unlockline_Plot().gameObject:SetActive(false)
        self.Img_lockline_Plot().gameObject:SetActive(true)
    end
    ---显示星级
    local sArr = {}
    sArr[1],sArr[2],sArr[3] = self.pointData:CheckStar()
    self.hStars = {
        [1] = self.BossBattleStar1().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
        [2] = self.BossBattleStar2().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
        [3] = self.BossBattleStar3().transform:Find("Img_Star").transform:Find("Img_StarOn").gameObject,
    }
    self.nStars = {
        [1] = self.BossBattleStar1().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
        [2] = self.BossBattleStar2().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
        [3] = self.BossBattleStar3().transform:Find("Img_Star").transform:Find("Img_StarOff").gameObject,
    }
    for i = 1, #self.nStars do
        self.nStars[i]:SetActive(not sArr[i])
        self.hStars[i]:SetActive(sArr[i])
    end
    ---关卡名称
    self.BossNameText().text = self.pointData.name
    ---关卡引索
    self.BossChapterText().text = self.pointData.idxName
    ---初始化Boss按钮
    self:ActivityBossInit_Button()
    ---连线关闭
    self.Img_Linefrom1().gameObject:SetActive(false)
    self.Img_Linefrom2().gameObject:SetActive(false)
end
function M:ActivityBossInit_Button()
    UIEvent.LuaClick(self.Img_HardBoss().gameObject,Handle(self,self.BeClick_Boss))
end
---点击之后刷新父物体UI显示
function M:BeClick()
    ---保存当前选中的关卡数据
    StormViewModel.CurPointData = self.pointData
    ---父界面显示
    self.parent:ShowEpisodeDetail(self.pointData)
    StormViewModel.CurPointType = StormViewModel.PointType.activity
end

---Boss点击之后刷新父物体UI显示
function M:BeClick_Boss()
    ---判断Boss是否已经解锁
    local unlock = StormControl.CheckPointLock(self.pointData.id)
    if not unlock then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
        return
    end
    ---父界面显示
    self.parent:ShowEpisodeDetail(self.pointData)
    ---保存当前选中的关卡数据
    StormViewModel.CurPointData = self.pointData
    self.parent:OnPointClick_Boss(self.pointData,self.index)
    StormViewModel.CurPointType = StormViewModel.PointType.activityBoss
end


return M