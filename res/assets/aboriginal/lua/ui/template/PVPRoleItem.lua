-- Code Auto Create Begin
local M = Class('PVPRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super1','Panel/StarContent/Awaken/Super1',2},{'Super2','Panel/StarContent/Awaken/Super2',2},{'Super3','Panel/StarContent/Awaken/Super3',2},{'Super4','Panel/StarContent/Awaken/Super4',2},{'Super5','Panel/StarContent/Awaken/Super5',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Mask','Mask',2},{'Img_MaskBg','Mask/Img_MaskBg',2},{'Img_MaskFg','Mask/Img_MaskFg',2},{'ItemMask','ItemMask',2},
        -- UITemplate 列表
        {'PVPRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_SameRoleTips','Mask/Img_MaskFg/Text_SameRoleTips',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()

    self.stars = {
        [1] = self.Star_1().transform.gameObject,
        [2] = self.Star_2().transform.gameObject,
        [3] = self.Star_3().transform.gameObject,
        [4] = self.Star_4().transform.gameObject,
        [5] = self.Star_5().transform.gameObject,
        [6] = self.Star_6().transform.gameObject,
    }

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
    self.superStars = {
        [1] = self.Super().gameObject,
        [2] = self.Super1().gameObject,
        [3] = self.Super2().gameObject,
        [4] = self.Super3().gameObject,
        [5] = self.Super4().gameObject,
        [6] = self.Super5().gameObject,
    }
    self.awaken = self.Awaken().gameObject
    self.canvasGroup = self.ObjRoot:GetComponent("CanvasGroup")
    UIEvent.LuaClick(self.ObjRoot,function()
        local battleRole = self.pData:GetHeroAttrWithCoreAndEquip()
        battleRole:SyncTryHero(self.pData);
        ---替换技能补丁
        local specialEquip = EquipControl.GetSingleSpecialEquip(self.pData.id)
        if specialEquip then
            local skillIndex = specialEquip:GetAdvanceSkillNum()
            local advanceSkillStr = specialEquip:GetSpecialSkill()
            for _,str in pairs(advanceSkillStr) do
                ReadData.ReplaceSkill(str,battleRole,skillIndex)
            end
        end
        ---显示角色信息
        self.parent:ShowRoleInfo(battleRole,true)
        self.parent.SwitchPanel().gameObject:SetActive(false)
    end)
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type RoleData 角色刷新
    self.pData = pData[1]
    if self.pData == nil then
        return
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
    --if self.parent.dragRole ~= nil and self.ObjRoot.name ~= "BattleRoleItem" and tonumber(self.parent.dragRole.ID) == self.pData.id then
    --    self.canvasGroup.alpha = 0.5
    --else
        self.canvasGroup.alpha = 1
    --end
    ---获取头像
    MgrRes.LoadQIcon(self.Icon_Head(),self.pData.skin)
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    self.Text_Level().text = self.pData.level
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新觉醒
    self.awaken:SetActive(self.pData.awaken)
    ---更新星级

    for starLv = 1, #self.starHl do
        local isStar = self.pData.star < starLv
        if self.pData.awaken then
            self.superStars[starLv]:SetActive(not isStar)
            self.stars[starLv]:SetActive(false)
        else
            self.superStars[starLv]:SetActive(false)
            --self.starNor[starLv]:SetActive(isStar)
            self.stars[starLv]:SetActive(not isStar)
            self.starHl[starLv]:SetActive(not isStar)
        end
    end

    if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 then
        self.Text_Rank().text = self.pData.heroCurSkill
        if self.pData:CheckHeroEquipIsMax() then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    else
        ---获取技能等级
        if nil == self.pData.tryHeroUID and self.pData:CheckHeroEquipIsMax() then
            self.Text_Rank().text = self.pData:GetHeroSkillLevel()
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().text = self.pData.skillLevel
            self.Text_Rank().color = Color(1,1,1,1)
        end
    end

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

    local isRepeat = false;
    for k,v in pairs(BattleManager.LeftTeam) do
        if self.pData.id == tonumber(v.ID) then
            isRepeat = true;
            break;
        end
    end
    -- 大师赛布阵用，因为要检查场下的另一个阵容
    if nil ~= self.parent.IsRoleInTeam then
        isRepeat = isRepeat or self.parent:IsRoleInTeam(self.pData.id);
    end 
    if nil ~= self.Mask() then
        if isRepeat then
            self.Mask().gameObject:SetActive(true);
        else
            self.Mask().gameObject:SetActive(false);
        end
    end
end

function M:OnBeginDrag(pointV3)
    ---设置UIItem为透明
    self.canvasGroup.alpha = 0.5
    ---设置选中的ui显示
    self.parent.UIDragItem:SetData({self.pData,self.parent})
    ---记录位置信息
    self.curPoint = pointV3 + self.Panel.transform.localPosition
    ---获取点击距离物体中心差
    local touchOffset = self.Panel.transform.localPosition - Tools.GetUIPosByScreen(self.parent.selectRoleLoop.gameObject,self.curPoint,self.parent.uiCamera)
    ---更新精准位置
    self.curPoint = self.curPoint + touchOffset
    ---设置透明地板
    --CJNBattleMgr.Instance:SetFloorShowImg(true)
    ---获取spine
    self.dragRole = self.parent:GetOrCreatSpineRole(self.pData,false,0)
    self.dragRole.myAni.transform.position = Vector3(0,1000,0)
    ---更新摄像机位置
   -- self.parent:MoveCamera(1,0)
    ---镜头插值
    self.lastCameraY = 1

    --self.parent:ShowRoleInfo(self.pData:GetHeroAttr(),true)
end

function M:OnDrag(pointV3)
    if self.dragRole == nil then
        return
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
        --for i, role in pairs(BattleManager.AllRole) do
        --    if role.GameID ~= self.dragRole.GameID then
        --        local alpha = role.PosY < pos[2] and 0 or 1
        --        role.myAni:SetAlpha(alpha)
        --    end
        --end
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
    if self.dragRole == nil or self.dragRole.myAni == nil then
        return
    end
    local tIsRefresh = true
    ---是否透明地板
    --CJNBattleMgr.Instance:SetFloorShowImg(false)
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
        return
    end
    ---无地板
    if reuIntArr[0] > 0 then
        if BattleManager.GameIdCout > #BattleManager.AllRole then
            BattleManager.GameIdCout = BattleManager.GameIdCout - 1
        end
        ---替换地板角色写入
        ---获取地板角色
        local floorRole = BattleManager.AllRole[reuIntArr[0]]
        UnityEngine.Debug.LogError("拖动角色和" .. floorRole.GameID .."交换")
        ---获取当前地板角色顺序
        self.dragRole.AtkOrder = floorRole.AtkOrder
        self.dragRole.GameID = floorRole.GameID
        ---删除地板角色
        GameObject.Destroy(floorRole.myAni.gameObject)
        ---将地板角色移除左侧队列
        --BattleManager.LeftTemaReomve(floorRole)
        BattleManager.LeftTemaReomve_Temp(floorRole)
        ---设置role位置
        self.dragRole.PosX=reuIntArr[1]
        self.dragRole.PosY=reuIntArr[2]
        ---更新地板数据
        BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
        ---更新人物数据
        self.dragRole.myAni.GameID = self.dragRole.GameID
        self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(self.dragRole)
        ---更新提示
        self.parent:UpdateTips(1)
        ---更新所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---更新所有队列图标
        self.parent:ReloadOrder(false)
        ---飞行进场
        self.dragRole.myAni:UIFlayIn()
        ---从UI关卡英雄池中添加地板英雄数据并移除拖拽英雄数据
        PVPViewModel.AddHeroEx(floorRole);
        PVPViewModel.RemoveHeroEx(self.dragRole);        
        self.parent.isChange = true
        --设置改变的阵型角色ID
        BuDoukaiControl.SetChangeTeamID(tonumber(self.dragRole.ID))
        --移除需要改变的阵型角色ID
        BuDoukaiControl.RemoveChangeTeamID(tonumber(floorRole.ID))
    elseif reuIntArr[0] == 0 and self.TeamCount < PVPViewModel.RoleLimit then
        ---空地板写入
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(self.dragRole)
        ---设置role位置
        self.dragRole.PosX=reuIntArr[1]
        self.dragRole.PosY=reuIntArr[2]
        ---更新地板数据
        BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
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
        PVPViewModel.RemoveHeroEx(self.dragRole);
        self.parent.isChange = true
        ---设置改变的阵型角色ID
        BuDoukaiControl.SetChangeTeamID(tonumber(self.dragRole.ID))
    else
        if reuIntArr[0] == 0 and self.TeamCount >= PVPViewModel.RoleLimit then
            ---移除地板效果
            self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
            BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
            ---提示已满员
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips2"),1},true)
        end
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)
        self.parent.isChange = true
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
    ---还原摄像机位置
    self.parent:MoveCamera(5,1)
    self.dragRole = nil
end
return M