-- Code Auto Create Begin
local M = Class('BattleRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BattleRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super1','Panel/StarContent/Awaken/Super1',2},{'Super2','Panel/StarContent/Awaken/Super2',2},{'Super3','Panel/StarContent/Awaken/Super3',2},{'Super4','Panel/StarContent/Awaken/Super4',2},{'Super5','Panel/StarContent/Awaken/Super5',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Mask','Mask',2},{'Img_Mask','Mask/Img_Mask',2},{'Img_Unfight','Mask/Img_Unfight',2},{'ItemMask','ItemMask',2},{'Img_UpBackGround','Img_UpBackGround',2},{'Img_UpItem','Img_UpBackGround/Img_UpItem',2},
        -- UITemplate 列表
        {'BattleRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_SameRoleTips','Mask/Img_Mask/Text_SameRoleTips',20},{'Text_UnfightTips','Mask/Img_Unfight/Text_UnfightTips',20},{'Text_UpItem','Img_UpBackGround/Text_UpItem',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    self.Img_Unfight().gameObject:SetActive(false)
    self.Img_UpBackGround().gameObject:SetActive(false)
    -- self.starNor = {
    --     [1] = self.Star_1().transform:Find("Normal").gameObject,
    --     [2] = self.Star_2().transform:Find("Normal").gameObject,
    --     [3] = self.Star_3().transform:Find("Normal").gameObject,
    --     [4] = self.Star_4().transform:Find("Normal").gameObject,
    --     [5] = self.Star_5().transform:Find("Normal").gameObject,
    --     [6] = self.Star_6().transform:Find("Normal").gameObject,
    -- }
    self.starNor = {
        [1] = self.Star_1().gameObject,
        [2] = self.Star_2().gameObject,
        [3] = self.Star_3().gameObject,
        [4] = self.Star_4().gameObject,
        [5] = self.Star_5().gameObject,
        [6] = self.Star_6().gameObject,
    }
    self.starHl = {
        [1] = self.Star_1().transform:Find("HighLight").gameObject,
        [2] = self.Star_2().transform:Find("HighLight").gameObject,
        [3] = self.Star_3().transform:Find("HighLight").gameObject,
        [4] = self.Star_4().transform:Find("HighLight").gameObject,
        [5] = self.Star_5().transform:Find("HighLight").gameObject,
        [6] = self.Star_6().transform:Find("HighLight").gameObject,
    }
    self.SuperStars = {
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
        ---显示角色信息
        if self.pData.userID ~= nil then    --好友角色
            local roleData = self.pData:GetFriendHeroAttr()
            local AbtArr1 =  ReadData.GetGearAttr(self.pData.armor1 , self.pData.armor1Pro)
            local AbtArr2 =  ReadData.GetGearAttr(self.pData.armor2 , self.pData.armor2Pro)
            if AbtArr1 then
                ReadData.InitRoleGear(roleData, AbtArr1 ,true)
            end
            if AbtArr2 then
                ReadData.InitRoleGear(roleData, AbtArr2 ,true)
            end
            ---获取共鸣装备
            local role = HeroControl.GetRoleDataByID(tonumber(self.pData.id))
            if #self.pData.equipArr ~= 0 then
                ---获取角色共鸣装备1
                local equip1 = role:GetHeroEquip(1)
                ---装备等级替换为对方等级
                local newEquip1 = EquipControl.ReturnSingleEquip(equip1.equipID,self.pData.equipLvArr[1])
                if newEquip1 ~= nil then
                    ReadData.InitRoleGear(roleData,newEquip1.attrs,true)
                end
                ---获取角色共鸣装备2
                local equip2 = role:GetHeroEquip(2)
                local newEquip2 = EquipControl.ReturnSingleEquip(equip2.equipID,self.pData.equipLvArr[2])
                if newEquip2 ~= nil then
                    ReadData.InitRoleGear(roleData,newEquip2.attrs,true)
                end
                ---获取角色共鸣装备3
                local equip3 = role:GetHeroEquip(3)
                local newEquip3 = EquipControl.ReturnSingleEquip(equip3.equipID,self.pData.equipLvArr[3])
                if newEquip3 ~= nil then
                    ReadData.InitRoleGear(roleData,newEquip3.attrs,true)
                end
            end
            if self.parent ~= nil then
                --设置技能等级
                --if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 and self.pData.heroFlag ~= false and self.pData.heroCurSkill < self.pData:GetHeroShowSkillLv() then
                if self.pData.heroFlag ~= nil  then
                    roleData.heroFlag =  self.pData.heroFlag
                    roleData.heroCurSkill = self.pData.heroCurSkill
                end
                self.parent:ShowRoleInfo(roleData,true)
            end
        else
            if self.parent ~= nil and self.parent.class.__cname ~= "RoleStatusPrefab" then
                local battleRole = self.pData:GetHeroAttrWithCoreAndEquip()
                ---替换技能补丁
                local specialEquip = EquipControl.GetSingleSpecialEquip(self.pData.id)
                if specialEquip then
                    local skillIndex = specialEquip:GetAdvanceSkillNum()
                    local advanceSkillStr = specialEquip:GetSpecialSkill()
                    for _,str in pairs(advanceSkillStr) do
                        ReadData.ReplaceSkill(str,battleRole,skillIndex)
                    end
                end
                self.parent:ShowRoleInfo(battleRole,true)
            end
        end
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
    if pData[3] ~= nil then
        self.role = pData[3]
    end
    ---在切换到调整顺序时,添加滑条遮罩
    if self.parent ~= nil and self.parent.SelectRoleStop then
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
    ---是否有重复角色
    self.isRepeat = false
    for k,v in pairs(BattleManager.LeftTeam) do
        if self.pData.id == tonumber(v.ID) then
            self.isRepeat = true
            break
        else
            self.isRepeat = false
        end
    end
    if self.parent ~= nil and self.parent.class.__cname == "RoleStatusPrefab" or (self.parent.Uid.Name == "BattlePause_UI" or self.parent.Uid.Name == "PVPPause_UI" ) then    ---暂停界面详情不判断重复
        self.isRepeat = false
    end
    ---当场上已有此角色并且此角色未被拖拽时显示mask
    self.Mask().gameObject:SetActive(false)
    self.Img_Mask().gameObject:SetActive(false)
    self.Img_Unfight().gameObject:SetActive(false)
    if self.isRepeat then
        self.Mask().gameObject:SetActive(true)
        self.Img_Mask().gameObject:SetActive(true)
        self.Img_Unfight().gameObject:SetActive(false)
    end
    ---月塔战斗界面下方滑块(无法战斗显示)
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
        local heroHP = YueTaViewModel.GetServerData().towerHero
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            heroHP =  YueTaViewModel.GetServerData().innerTowerHero
        end
        if heroHP ~= nil then
            for i,v in pairs(heroHP) do
                if v.heroID == self.pData.id and v.hP == 0 then
                    self.Mask().gameObject:SetActive(true)
                    self.Img_Mask().gameObject:SetActive(false)
                    self.Img_Unfight().gameObject:SetActive(true)
                end
            end
        else
            self.Mask().gameObject:SetActive(false)
            self.Img_Mask().gameObject:SetActive(false)
            self.Img_Unfight().gameObject:SetActive(false)
        end
    end
    ---获取头像
    if self.role ~= nil then
        MgrRes.LoadQIcon(self.Icon_Head(),(self.role.SkinID == self.pData.id or self.role.SkinID == nil) and self.pData.id or self.role.SkinID)
    else
        MgrRes.LoadQIcon(self.Icon_Head(),(self.pData.skin == self.pData.id or self.pData.skin == nil) and self.pData.id or self.pData.skin)
    end
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    if self.role ~= nil then
        self.Text_Level().text = self.role.LV
    else
        self.Text_Level().text = self.pData.level
    end
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    if self.role ~= nil then
        for starLv = 1, #self.starHl do
            local isStar = self.role.StartLV < starLv
            --self.starNor[starLv]:SetActive(isStar)
            if self.role and self.role.IsAwaken == true then
                self.starHl[starLv]:SetActive(false)
                self.SuperStars[starLv]:SetActive(not isStar)
                self.starNor[starLv]:SetActive(false)
            elseif self.pData.awaken == true then
                self.starHl[starLv]:SetActive(false)
                self.SuperStars[starLv]:SetActive(not isStar)
                self.starNor[starLv]:SetActive(false)
            else
                self.starNor[starLv]:SetActive(not isStar)
                self.starHl[starLv]:SetActive(not isStar)
                self.SuperStars[starLv]:SetActive(false)
            end
        end
    else
        for starLv = 1, #self.starHl do
            local isStar = self.pData.star < starLv
            --self.starNor[starLv]:SetActive(isStar)
            if self.role and self.role.IsAwaken == true then
                self.starHl[starLv]:SetActive(false)
                self.SuperStars[starLv]:SetActive(not isStar)
                self.starNor[starLv]:SetActive(false)
            elseif self.pData.awaken == true then
                self.starHl[starLv]:SetActive(false)
                self.SuperStars[starLv]:SetActive(not isStar)
                self.starNor[starLv]:SetActive(false)
            else
                self.starNor[starLv]:SetActive(not isStar)
                self.starHl[starLv]:SetActive(not isStar)
                self.SuperStars[starLv]:SetActive(false)
            end
        end
    end

    --没有觉醒隐藏所有普通星级
    -- if self.role and  self.role.IsAwaken == true then
    --     for starLv = 1, #self.starHl do
    --         --self.starNor[starLv]:SetActive(isStar)
    --         self.starHl[starLv]:SetActive(false)
    --         self.SuperStars[starLv]:SetActive(false)
    --     end
    -- elseif self.pData.awaken  == true then
    --     for starLv = 1, #self.starHl do
    --         --self.starNor[starLv]:SetActive(isStar)
    --         self.starHl[starLv]:SetActive(false)
    --         self.SuperStars[starLv]:SetActive(false)
    --     end
    -- end
    ---更新觉醒
    if self.role ~= nil then
        self.awaken:SetActive(self.role.IsAwaken)
    else
        self.awaken:SetActive(self.pData.awaken)
    end

    ---获取技能等级
    --if self.pData.ShowSkillLV ~= nil then
    --    self.Text_Rank().text =  self.pData.ShowSkillLV
    --else
    --    self.Text_Rank().text = self.pData:GetHeroShowSkillLv()
    --end
    --设置过技能等级且设置的技能等级小于10级
    if self.pData.heroFlag ~= nil and self.pData.heroFlag ~= 0 and self.pData.heroFlag ~= false and self.pData.heroCurSkill < self.pData:GetHeroShowSkillLv() then
        self.Text_Rank().text =  self.pData.heroCurSkill
    else
        if self.role ~= nil then
            self.Text_Rank().text =  self.role.ShowSkillLV
        else
            if self.pData.ShowSkillLV ~= nil then
                self.Text_Rank().text = self.pData.ShowSkillLV
            else
                self.Text_Rank().text = self.pData:GetHeroShowSkillLv()
            end
        end
    end

    --if self.pData:CheckHeroEquipIsMax() then
    --    self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
    --else
    --    self.Text_Rank().color = Color(1,1,1,1)
    --end
    if self.role ~= nil then
        if self.role.ShowSkillLV > self.role.SkillLV then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    else
        if self.pData:CheckHeroEquipIsMax() then
            self.Text_Rank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_Rank().color = Color(1,1,1,1)
        end
    end

    ---记录位置信息
    self.curPoint = Vector3.zero
    ---记录点击距离物体中心差
    self.touchOffset = Vector3.zero
    ---注册拖拽事件
    if self.parent ~= nil and self.parent.class.__cname ~= "RoleStatusPrefab" then
        self.dragEvent._scrollRect = self.parent.selectRoleLoop
        self.dragEvent._canvasRect = self.parent.ObjRoot:GetComponent("RectTransform")
        self.dragEvent:Register(Handle(self,self.OnBeginDrag),Handle(self,self.OnDrag),Handle(self,self.OnEndDrag))
    end
    ---获取左侧队伍数量OnEndDrag
    self.TeamCount = 0
    self.SupportCount = 0
    for i, v in pairs(BattleManager.AllRole) do
        if v.IsLeft == true then
            self.TeamCount = self.TeamCount + 1
        end
        if v.userID and v.userID ~= 0 then
            self.SupportCount = self.SupportCount + 1
        end
    end
    --剧情活动加成
    if self.pData.BonusPer and self.pData.BonusPer > 0 then
        self.Img_UpBackGround().gameObject:SetActive(true)
        self.Text_UpItem().text = "+"..self.pData.BonusPer.."%"
    else
        self.Img_UpBackGround().gameObject:SetActive(false)
    end
end

function M:OnBeginDrag(pointV3)
    if self.parent.CloseSkillXiangqing ~= nil then
        self.parent:CloseSkillXiangqing()
    end
    ---设置UIItem为透明
    self.canvasGroup.alpha = 0.5
    ---设置选中的ui显示
    if self.parent.UIDragItem ~= nil then
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
        ---添加音效
        MgrSound.AddCue("Audio/role/".. self.dragRole.SkinID ..".acb")
        ---更新摄像机位置
        --self.parent:MoveCamera(1,0)
        ---镜头插值
        self.lastCameraY = 1
    end
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
    if self.parent.Uid == UID.WorldBossBattle_UI then
        CJNBattleMgr.Instance:SetRightFloorHid()
    else
        CJNBattleMgr.Instance:SetAllFloorHid()
    end

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

    ---月塔0血不能放上去
    if StormViewModel.CurPointType == StormViewModel.PointType.monthTower then
        local herosHP = YueTaViewModel.GetServerData().towerHero
        if YueTaControl.GetMode() == YueTaControl.ModeType.HARD then
            herosHP = YueTaViewModel.GetServerData().innerTowerHero
        end
        if herosHP then
            for i = 1, #herosHP do
                if herosHP[i].hP == 0 and tonumber(self.dragRole.ID) == herosHP[i].heroID then
                    reuIntArr[0] = -1
                    break
                end
            end
        end
    end

    if reuIntArr[0] == -1 then
        UnityEngine.Debug.LogError("拖动到地板外 " .. BattleManager.GameIdCout.. "消失")
        BattleManager.GameIdCout = BattleManager.GameIdCout - 1
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)
        self.parent.UIDragItem.transform.position = Vector3(0,10000,0)
        --tIsRefresh = false
        self.dragRole.myAni = nil
        self.dragRole = nil
        return
    end
    ---无地板
    if reuIntArr[0] > 0 and self.TeamCount <= (StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.playerNumber or 9) 
            and (self.dragRole.userID == 0 or self.dragRole.userID == nil or self.SupportCount <= 1)
    then
        if BattleManager.GameIdCout > Global.GetListLenght(BattleManager.AllRole) then
            BattleManager.GameIdCout = BattleManager.GameIdCout - 1
        end
        ---替换地板角色写入
        ---获取地板角色
        local floorRole = BattleManager.AllRole[reuIntArr[0]]
        ---当支援角色达到上限，且继续使用支援角色替换自己队员的时候，阻止该行为
        if (self.dragRole.userID ~= nil and self.dragRole.userID > 0) and self.SupportCount >= 1 and (floorRole.userID == nil or floorRole.userID == 0)
        then
            ---删除dragRole
            GameObject.Destroy(self.dragRole.myAni.gameObject)
            ---提示已满员
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips1"),1},true)
            self.dragRole = nil
            return
        end
        ---获取当前地板角色顺序
        print("拖动角色和" .. floorRole.GameID .."交换")
        self.dragRole.AtkOrder = floorRole.AtkOrder
        self.dragRole.GameID = floorRole.GameID
        self.dragRole.myAni.GameID = floorRole.GameID
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
        ---更新提示
        self.parent:UpdateTips(1)
        ---更新所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---更新所有队列图标
        self.parent:ReloadOrder(false)
        ---飞行进场
        self.dragRole.myAni:UIFlayIn()
        ---从UI关卡英雄池中添加地板英雄数据并移除拖拽英雄数据
        if floorRole.userID == 0 or floorRole.userID == nil then
            StormViewModel.AddHeroData(tonumber(floorRole.ID))
        else
            StormViewModel.AddFriendHeroData(tonumber(floorRole.ID .. floorRole.userID))
            ---删除待添加的陌生人
            FriendViewModel.RemoveStrangersData(floorRole)
        end
        if self.dragRole.userID == 0 or self.dragRole.userID == nil then
            StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
        else
            StormViewModel.RemoveFriendHeroData(tonumber(self.dragRole.ID),tonumber(self.dragRole.userID))
            ---添加待添加的陌生人
            FriendViewModel.AddStrangersData(self.dragRole)
        end
    elseif reuIntArr[0] == 0 and self.TeamCount < (StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.playerNumber or 9)
            and (self.dragRole.userID == 0 or self.dragRole.userID == nil or self.SupportCount < 1)
    then
        ---空地板写入
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(self.dragRole)
        ---设置role位置
        self.dragRole.PosX=reuIntArr[1]
        self.dragRole.PosY=reuIntArr[2]
        ---更新地板数据
        BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
        ---更新人物数据
        if StormViewModel.FriendSupport then
            self.dragRole.GameID = #BattleManager.LeftTeam==0 and BattleManager.GetDelGameID() or BattleManager.LeftTeam[#BattleManager.LeftTeam].GameID + 1
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
        else
            self.dragRole.GameID = #BattleManager.LeftTeam==0 and BattleManager.GetDelGameID() or BattleManager.LeftTeam[#BattleManager.LeftTeam].GameID + 1
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
        end
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
        if StormViewModel.FriendSupport then
            StormViewModel.RemoveFriendHeroData(tonumber(self.dragRole.ID),tonumber(self.dragRole.userID))
            FriendViewModel.AddStrangersData(self.dragRole)
        else
            ---从UI关卡英雄池中移除拖拽英雄数据
            StormViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
            FriendViewModel.RemoveStrangersData(self.dragRole)
        end
    else
        if reuIntArr[0] == 0 then
            if self.TeamCount >= (StormViewModel.CurPointData ~= nil and StormViewModel.CurPointData.playerNumber or 9) and (self.dragRole.userID == nil or self.dragRole.userID == 0 or self.SupportCount < 1)
            then
                ---移除地板效果
                self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                ---提示已满员
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips2"),1},true)
            else
                ---移除地板效果
                self.dragRole.myAni:XYSetPos2(reuIntArr[1], reuIntArr[2], 0, 0)
                BattleManager.ChessboardLeft[reuIntArr[2]][reuIntArr[1]] = 0
                ---提示已满员
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battleroleitem_tips1"),1},true)
            end
        end
        ---删除dragRole
        GameObject.Destroy(self.dragRole.myAni.gameObject)
        tIsRefresh = false
        ---计数-1
        BattleManager.GameIdCout = BattleManager.GameIdCout-1
    end
    ---还原UIItem透明度
    self.canvasGroup.alpha = 1
    ---还原ui
    self.parent.UIDragItem.transform.localPosition = Vector3(0,10000,0)
    if tIsRefresh then
        ---刷新滑块UI
        self.parent:ReloadSelectRole()
        if self.dragRole ~= nil then
            self.dragRole.myAni:SetAlpha(1)
        end
    end
    ---还原所有角色透明度
    --for i, role in pairs(BattleManager.AllRole) do
    --  role.myAni:SetAlpha(1)
    --end
    ---将单次检测插值设为开启
    self.isOnceDrag = true
    self.dragRole = nil
end


return M