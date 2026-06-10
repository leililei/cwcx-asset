-- Code Auto Create Begin
local M = Class('NoviceRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/NoviceRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super01','Panel/StarContent/Awaken/Super',2},{'Super02','Panel/StarContent/Awaken/Super',2},{'Super03','Panel/StarContent/Awaken/Super',2},{'Super04','Panel/StarContent/Awaken/Super',2},{'Super05','Panel/StarContent/Awaken/Super',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'ItemMask','ItemMask',2},
        -- Text 列表
        {'Text_Level','Panel/Text_Level',3},{'Text_Lv','Panel/Text_Lv',3},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',3},
        -- UITemplate 列表
        {'NoviceRoleItem','/',10},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    if self.NoviceRoleItem().transform:Find("Ui_yingdao_002").gameObject then
        self.noviceFx = self.NoviceRoleItem().transform:Find("Ui_yingdao_002").gameObject
        self.noviceFx:SetActive(true)
    end
    self.starNor = {
        [1] = self.Star_1().transform:Find("Normal").gameObject,
        [2] = self.Star_2().transform:Find("Normal").gameObject,
        [3] = self.Star_3().transform:Find("Normal").gameObject,
        [4] = self.Star_4().transform:Find("Normal").gameObject,
        [5] = self.Star_5().transform:Find("Normal").gameObject,
        [6] = self.Star_6().transform:Find("Normal").gameObject,
    }
    self.starHl = {
        [1] = self.Star_1().transform:Find("HighLight").gameObject,
        [2] = self.Star_2().transform:Find("HighLight").gameObject,
        [3] = self.Star_3().transform:Find("HighLight").gameObject,
        [4] = self.Star_4().transform:Find("HighLight").gameObject,
        [5] = self.Star_5().transform:Find("HighLight").gameObject,
        [6] = self.Star_6().transform:Find("HighLight").gameObject,
    }
    self.awaken = self.Awaken().gameObject
    self.canvasGroup = self.ObjRoot:GetComponent("CanvasGroup")
    UIEvent.LuaClick(self.ObjRoot,function()
        -----显示角色信息
        --self.parent:ShowRoleInfo(self.pData:GetHeroAttr())
    end)
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type RoleData 角色刷新
    self.pData = pData[1]
    if self.pData == nil then
        return
    end

    if NoviceViewModel.CurTaskId < 50105 then
        self.noviceFx:SetActive(false)
    else
        self.noviceFx:SetActive(true)
    end

    self.parent = pData[2]
    ---在切换到调整顺序时,添加滑条遮罩
    if self.parent.SelectRoleStop then
        self.ItemMask().gameObject:SetActive(true)
        return
    else
        self.ItemMask().gameObject:SetActive(false)
    end
    self.Panel = self.Panel()
    self.dragEvent = self.Panel:GetComponent("LoopDragItem")
    ---检测是否被拖拽
    if self.parent.dragRole ~= nil and self.ObjRoot.name ~= "NoviceRoleItem" and tonumber(self.parent.dragRole.ID) == self.pData.id then
        self.noviceFx:SetActive(false)
        --self.canvasGroup.alpha = 0.5
    else
        self.canvasGroup.alpha = 1
    end
    ---获取头像
    MgrRes.LoadQIcon(self.Icon_Head(),self.pData.id)
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    self.Text_Level().text = self.pData.level
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新星级
    for starLv = 1, #self.starHl do
        local isStar = self.pData.star < starLv
        --self.starNor[starLv]:SetActive(isStar)
        self.starHl[starLv]:SetActive(not isStar)
    end
    ---更新觉醒
    self.awaken:SetActive(self.pData.awaken)
    ---获取技能等级
    self.Text_Rank().text = "+"..self.pData:GetHeroSkillLevel()
    ---记录位置信息
    self.curPoint = Vector3.zero
    ---记录点击距离物体中心差
    self.touchOffset = Vector3.zero
    ---注册拖拽事件
    self.dragEvent._scrollRect = self.parent.selectRoleLoop
    self.dragEvent._canvasRect = self.parent.ObjRoot:GetComponent("RectTransform")
    self.dragEvent:Register(Handle(self,self.OnBeginDrag),Handle(self,self.OnDrag),Handle(self,self.OnEndDrag))
    ---获取左侧队伍数量
    self.TeamCount = 0
    for i, v in pairs(BattleManager.AllRole) do
        if v.IsLeft == true then
            self.TeamCount = self.TeamCount + 1
        end
    end
end

function M:OnBeginDrag(pointV3)
    ---设置UIItem为透明
    self.canvasGroup.alpha = 0.5
    ---设置选中的ui显示
    self.parent.UIDragItem:SetData({self.pData,self.parent})
    self.parent.UIDragItem.transform:Find("Ui_yingdao_002").gameObject:SetActive(false)
    self.noviceFx:SetActive(false)
    ---记录位置信息
    self.curPoint = pointV3 + self.Panel.transform.localPosition
    ---获取点击距离物体中心差
    local touchOffset = self.Panel.transform.localPosition - Tools.GetUIPosByScreen(self.parent.selectRoleLoop.gameObject,self.curPoint,self.parent.uiCamera)
    ---更新精准位置
    self.curPoint = self.curPoint + touchOffset
    ---设置透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(true)
    ---获取spine
    self.dragRole = self.parent:GetOrCreatSpineRole(self.pData,false,0)
    self.dragRole.myAni.transform.position = Vector3(0,1000,0)
    ---更新摄像机位置
    --self.parent:MoveCamera(1,0)
    ---镜头插值
    self.lastCameraY = 1
end

function M:OnDrag(pointV3)
    if self.dragRole == nil then
        return
    end
    ---拖拽高亮角色执行下一步引导
    if NoviceViewModel.CurTaskId == 50105 then
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        MessageEvent.Go(EID.NoviceCheck)
    end
    ---更新uiItem位置
    self.parent.UIDragItem.transform.localPosition = pointV3 - self.curPoint
    ---设置spine位置
    local pos = CJNBattleMgr.Instance:RayAndSetGo(self.dragRole.myAni.gameObject)
    if self.lastCameraY ~= pos[2] then
        self.lastCameraY = pos[2]
        ---更新摄像机位置
        --self.parent:MoveCamera(self.lastCameraY,0)
        ---更新角色透明度
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID ~= self.dragRole.GameID then
                local alpha = role.PosY < pos[2] and 0 or 1
                --role.myAni:SetAlpha(alpha)
            end
        end
    end
    ---判断是否是第一次拖拽
    if self.isOnceDrag then
        ---若是第一次则显示攻击范围及羁绊
        self.isOnceDrag = false
    elseif self.LastDragPos_X == pos[1] and self.LastDragPos_Y == pos[2] then
        ---若与上一帧位置相同则不显示
        return
    end
    ---记录坐标
    self.LastDragPos_X = pos[1]
    self.LastDragPos_Y = pos[2]
    ---重置地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    if pos[1] == 0 or pos[2] == 0 then
        ---若坐标为零不显示
        return
    end
    ---显示攻击范围及羁绊
    BattleManager.FAndShowRound(self.dragRole, pos[1], pos[2])
end

function M:OnEndDrag(pointV3)
    if self.dragRole == nil or self.dragRole.myAni == nil or self.parent == nil or self.parent.UIDragItem == nil then
        return
    end
    local tIsRefresh = true
    ---是否透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(false)
    ---结束显示攻击范围及羁绊
    CJNBattleMgr.Instance:EndLine()
    ---更新地板CFloorID并获取地板信息返回:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
    local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
    if reuIntArr[0] == -1 then
        BattleManager.GameIdCout= BattleManager.GameIdCout-1
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)
        self.parent.UIDragItem.transform.position = Vector3(0,10000,0)
        self.dragRole = nil
        if NoviceViewModel.CurTaskId == 50106  then
            self.noviceFx:SetActive(true)
            Event.Go("refreshItem")
        end
        return
    end
    ---无地板
    if reuIntArr[0] > 0
    then

        --Event.Go("refreshItem")
        self.noviceFx:SetActive(true)
        ---获取地板角色
        local floorRole = BattleManager.AllRole[reuIntArr[0]]
        ---Npc禁止换位
        self.CanChangePos = true
        local index = (floorRole.PosY * 6) - (6-floorRole.PosX)
        for k,v in pairs(StormViewModel.CurPointData.banMove) do
            if tonumber(v) == index then
                self.CanChangePos = false
                break
            end
        end
        if self.CanChangePos == true and NoviceControl.GetNoviceDataByID(NoviceViewModel.CurTaskId).group == 16 then
            if BattleManager.GameIdCout > #BattleManager.AllRole then
                BattleManager.GameIdCout = BattleManager.GameIdCout - 1
            end
            UnityEngine.Debug.LogError("拖动角色和" .. floorRole.GameID .."交换")
            ---获取当前地板角色顺序
            self.dragRole.AtkOrder = floorRole.AtkOrder
            self.dragRole.GameID = floorRole.GameID
            ---删除地板角色
            GameObject.Destroy(floorRole.myAni.gameObject)
            ---将地板角色移除左侧队列
            BattleManager.LeftTemaReomve_Temp(floorRole)
            ---设置role位置
            self.dragRole.PosX=reuIntArr[1]
            self.dragRole.PosY=reuIntArr[2]
            ---更新地板数据
            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
            ---更新人物数据
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
            ---添加到左侧队列
            BattleManager.LeftTeamAdd(self.dragRole)
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---更新所有队列图标
            self.parent:ReloadOrder(false)
            ---飞行进场
            self.dragRole.myAni:UIFlayIn()
            ---从UI关卡英雄池中添加地板英雄数据并移除拖拽英雄数据
            StormViewModel.AddHeroData(tonumber(floorRole.ID))
            StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
        else
            CJNBattleMgr.Instance:RayGoInFloor(floorRole.myAni.gameObject,0,0,floorRole.GameID,floorRole.Occupation)
            ---删除dragRole
            GameObject.Destroy(self.dragRole.myAni.gameObject)
            ---更新所有地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---更新所有队列图标
            self.parent:ReloadOrder(false)
            BattleManager.GameIdCout= BattleManager.GameIdCout-1
        end

        if NoviceViewModel.CurTaskId == 50106  then
            self.noviceFx:SetActive(true)
            Event.Go("refreshItem")
        elseif NoviceViewModel.CurTaskId == 10608 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10607")
        elseif NoviceViewModel.CurTaskId == 10713 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10712")
        elseif NoviceViewModel.CurTaskId == 10715 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10714")
        elseif NoviceViewModel.CurTaskId == 10723 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10722")
        end
    elseif reuIntArr[0] == 0 and self.TeamCount < 9
    then

        ---放到格子上
        if NoviceViewModel.CurTaskId == 50106  then
            self:Novice50106(reuIntArr)
        elseif NoviceViewModel.CurTaskId == 10608 then
            self:Novice10608(reuIntArr)
        elseif NoviceViewModel.CurTaskId == 10713 then
            self:Novice10713(reuIntArr)
        elseif NoviceViewModel.CurTaskId == 10715 then
            self:Novice10715(reuIntArr)
        elseif NoviceViewModel.CurTaskId == 10723 then
            self:Novice10723(reuIntArr)
        else
            ---空地板写入
            ---给role赋值攻击顺序
            BattleManager.LeftSetOrder(self.dragRole)
            ---设置role位置
            self.dragRole.PosX=reuIntArr[1]
            self.dragRole.PosY=reuIntArr[2]
            ---更新人物数据
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
            ---添加到左侧队列
            BattleManager.LeftTeamAdd(self.dragRole)
            ---更新地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---更新所有队列图标
            self.parent:ReloadOrder(false)
            ---更新提示
            self.parent:UpdateTips(1)
            ---飞行进场
            self.dragRole.myAni:UIFlayIn()
            ---从UI关卡英雄池中移除拖拽英雄数据
            StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
        end
    else
        if reuIntArr[0] == 0 and self.TeamCount >= 9 then
            ---移除地板效果
            self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
            BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
            ---提示已满员
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips2"),1},true)
        end
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)

        if NoviceViewModel.CurTaskId == 10116  then
            self.noviceFx:SetActive(true)
            Event.Go("refreshItem")
        elseif NoviceViewModel.CurTaskId == 10608 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10607")
        elseif NoviceViewModel.CurTaskId == 10713 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10712")
        elseif NoviceViewModel.CurTaskId == 10715 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10714")
        elseif NoviceViewModel.CurTaskId == 10723 then
            self.noviceFx:SetActive(true)
            Event.Go("refresh10722")
        end

        tIsRefresh = false
    end
    ---还原UIItem透明度
    self.canvasGroup.alpha = 1
    ---还原ui
    self.parent.UIDragItem.transform.localPosition = Vector3(0,10000,0)
    if tIsRefresh then
        ---刷新滑块UI
        self.parent:ReloadSelectRole()
    end
    ---还原所有角色透明度
    for i, role in pairs(BattleManager.AllRole) do
        role.myAni:SetAlpha(1)
    end
    ---将单次检测插值设为开启
    self.isOnceDrag = true
    self.dragRole = nil
end

function M:Novice50106(reuIntArr)
    if reuIntArr[1] == 3 and reuIntArr[2] == 2 then
        ---空地板写入
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(self.dragRole)
        ---设置role位置
        self.dragRole.PosX=reuIntArr[1]
        self.dragRole.PosY=reuIntArr[2]
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(self.dragRole)
        ---更新地板数据
        BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
        ---更新人物数据
        self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
        ---更新地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---更新所有队列图标
        self.parent:ReloadOrder(false)
        ---更新提示
        self.parent:UpdateTips(1)
        ---飞行进场
        self.dragRole.myAni:UIFlayIn()
        ---从UI关卡英雄池中移除拖拽英雄数据
        StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
        ---角色放入指定位置 引导执行下一步
        NoviceControl.PushSingleData(50106,true)
        NoviceViewModel.Check()
    else
        Event.Go("refreshItem")
        self.noviceFx:SetActive(true)
        ---移除地板效果
        self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
        BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)
        BattleManager.GameIdCout= BattleManager.GameIdCout-1
    end
end

return M