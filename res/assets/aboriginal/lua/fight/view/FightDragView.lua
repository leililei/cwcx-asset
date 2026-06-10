---@class FightDragView:FightViewBase 战斗特效
local M = Class("FightDragView",FightViewBase)
---初始化回调接口
function M:OnInit()
    MgrTimer.AddRepeat("BattleUIUpdate",0, function()
        ---暂停时不允许点击
        if FightGlobal.IsPause == true then
            return
        end
        ---当前点击模式
        if FightGlobal.DragModel == FightEnum.DragType.NONE then
            return
        end
        ---状态1检测按下
        if self.parentUI.OnState == 1  then
            if UIEvent.GetButton_Down() then
                local y = UIEvent.GetInput_Y()
                if y < (Tools.GetScreenHeight()/4) then
                    ---若是在UI栏拖拽则不执行
                    return
                end
                ---按下通知
                self:OnBeginDrag(self.parentUI)
                ---切换到拖拽状态
                self.parentUI.OnState = 2
            end
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self:OnEndDrag(self.parentUI)
                self.parentUI.OnState = 3
            end
        elseif self.parentUI.OnState == 2 then
            ---拖拽通知
            self:OnDrag(self.parentUI)
            ---检测抬起
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self.parentUI.OnState = 3
            end
        elseif self.parentUI.OnState == 3 then
            ---抬起通知
            --self:OnEndDrag(self.parentUI)
            ---切换到检测按下状态
            self.parentUI.OnState = 1
        end
        ---若开启了战斗且打开了角色面板开始实时更新
        if BattleManager.IsFightStart and self.parentUI.CurRoleInfo ~= nil then
            --self.parentUI:UpdateRoleInfo()
        end
    end,-1,nil)
end
---重载回调接口
function M:OnReload()
end
---暂停回调
function M:OnPause()
end
---恢复暂停回调
function M:OnResume()

end
---退出回调接口
function M:OnClose()

end
---设置父UI
function M:SetParentUI(parent)
    self.parentUI = parent
end
---三个拖拽函数
function M:OnBeginDrag(parent)
    ---发射射线抓取地板角色GameId， 0为空
    --parent.ShowRoleId = CJNBattleMgr.Instance:RayGetId()
    local posString = string.split(CMgrBattle.RayGetId(),"_")
    if posString[1] == "0" or FightGlobal.ChessboardLeft[tonumber(posString[1])][tonumber(posString[2])] == 0 then
        return
    end
    parent.ShowRoleId = FightGlobal.ChessboardLeft[tonumber(posString[1])][tonumber(posString[2])].info.uid
    ---按下位置存在角色则显示角色信息
    if parent.ShowRoleId ~= nil and parent.ShowRoleId ~= 0 then
        ---设置选中的角色属性信息至战斗上方UI
        self:UpdateBattleTopUI(tonumber(parent.ShowRoleId))
    end
    if FightGlobal.DragModel == FightEnum.DragType.SET_CHARACTER then
        ---设置角色模式
        ---显示透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(true)
        --MgrBattle.ShowAllFloor()
        ---抓取地板role
        --parent.dragRole = BattleManager.AllRole[parent.ShowRoleId]
        ---@type FightRoleView
        parent.dragRole = MgrBattle.GetRoleByUid(parent.ShowRoleId)
        if parent.dragRole ~= nil and parent.dragRole.info.isLeft then
            ---清空地板数据
            FightGlobal.ChessboardLeft[parent.dragRole.info.ChessboardY][parent.dragRole.info.ChessboardX] = 0
            ---清空人物所在格子信息
            parent.dragRole.info.ChessboardY = 0
            parent.dragRole.info.ChessboardX = 0
            --parent.dragRole.myAni:XYSetPos2(parent.info.ChessboardY, parent.info.ChessboardX, 0, 0)
            ---修改透明度
            parent.dragRole:SetAlpha(0.5)
            ---设置uiItem 头像框
            parent.UIDragItem:SetData({HeroControl.GetRoleDataByID(tonumber(parent.dragRole.info.id)),parent})
            ---添加到滑块数据
            StormViewModel.AddHeroData(tonumber(parent.dragRole.info.id))
            ---刷新滑块UI
            parent:ReloadSelectRole(tonumber(parent.dragRole.info.id))
        end
    elseif FightGlobal.DragModel == FightEnum.DragType.CLICK_SET_ORDER then
        ---设置问号排序模式
        ---检查是否已设置过
        if parent.FinishOrder[parent.ShowRoleId] == true then
            return
        end
        ---未设置，抓取地板role
        --parent.dragRole = BattleManager.AllRole[parent.ShowRoleId]
        ---@type FightRoleView
        parent.dragRole = MgrBattle.GetRoleByUid(parent.ShowRoleId)
        if parent.dragRole ~= nil and parent.dragRole.info.isLeft then
            ---设置顺序为当前索引顺序
            --parent.dragRole.myAni:SetOrder(parent.CurAtkOrderIndex, parent.dragRole.IsLeft, true)
            parent.dragRole.info.atkOrder = parent.CurAtkOrderIndex
        end
    elseif FightGlobal.DragModel == FightEnum.DragType.SWITCH then
        ---设置交换排序模式
        ---抓取选中的角色顺序图标
        --parent.dragRole = BattleManager.AllRole[parent.ShowRoleId]
        ---@type FightRoleView
        parent.dragRole = MgrBattle.GetRoleByUid(parent.ShowRoleId)
        if parent.dragRole ~= nil and parent.dragRole.info.isLeft then
            parent.dragRoleAtkOder = parent.dragRole.orderGo
            local dragCanvas = parent.dragRoleAtkOder:GetComponent("Canvas")
            dragCanvas.sortingOrder = dragCanvas.sortingOrder + 1
        end
    end
end
function M:OnDrag(parent)
    ---战斗中不执行
    if BattleManager.IsFightStart then
        return
    end
    if FightGlobal.DragModel == FightEnum.DragType.SET_CHARACTER then
        ---设置角色模式
        ---@type FightRoleView
        if parent.dragRole ~= nil then
            ---判断是否是第一次拖拽
            if parent.isOnceDrag then
                ---若是第一次则显示攻击范围及羁绊
                parent.isOnceDrag = false
                return
            end
            local posArr={}
            if  parent.dragRole.info.isLeft   then
                ---若存在抓取到的角色更新抓取角色的位置
                --posArr = CJNBattleMgr.Instance:RayAndSetGo(parent.dragRole.roleGo)
                posArr = CMgrBattle.Instance:RayAndSetGo(parent.dragRole.roleGo)
                ---更新uiItem位置
                parent.UIDragItem.transform.localPosition = Tools.GetUIPos(parent.dragRole.roleGo,parent.battleCamera,parent.uiCamera,parent.selectRoleRect)
            else
                posArr[1] =parent.dragRole.info.ChessboardY
                posArr[2] =parent.dragRole.info.ChessboardX
                ---更新uiItem位置
            end
            if parent.LastDragPos_X == posArr[2] and parent.LastDragPos_Y == posArr[1] then
                ---若与上一帧位置相同则不显示
                return
            end
            if posArr[1] == 0 or posArr[2] == 0 then
                ---若坐标为零不显示
                return
            end
            ---记录坐标
            parent.LastDragPos_X = posArr[2]
            parent.LastDragPos_Y = posArr[1]
            ---重置地板
            --CJNBattleMgr.Instance:SetAllFloorHid()    --关闭所有地板
            --MgrBattle.ShowAllFloor()
            ---显示攻击范围及羁绊并发射射线
            MgrBattle.LineAndAttackRange(parent.dragRole, posArr[2], posArr[1])
        end
    elseif FightGlobal.DragModel == FightEnum.DragType.CLICK_SET_ORDER then
        return
    elseif FightGlobal.DragModel == FightEnum.DragType.SWITCH then
        ---设置交换排序模式
        ---若存在抓取到的角色更新抓取角色的顺序图标位置
        if parent.dragRoleAtkOder ~= nil then
            CMgrBattle.Instance:RayAndSetGo(parent.dragRoleAtkOder)
        end
    end
end
function M:OnEndDrag(parent)
    if BattleManager.IsFightStart then
        return
    end
    --CMgrCamera.Instance:CloseStrokeCamera()
    parent.LastDragPos_X = -10
    parent.LastDragPos_Y = -10
    if FightGlobal.DragModel == FightEnum.DragType.SET_CHARACTER then
        ---隐藏透明地板
        --CJNBattleMgr.Instance:SetFloorShowImg(false)
        -- MgrTimer.AddDelayNoName(0.5,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
        ---设置角色模式
        if parent.dragRole ~= nil and parent.dragRole.info.isLeft then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(parent.dragRole.roleGo,0,0,parent.dragRole.GameID,parent.dragRole.Occupation)
            if reuIntArr[0] == -1 then
                ---移除总队列
                for i, v in pairs(BattleManager.AllRole) do
                    if v.GameID == parent.dragRole.GameID then
                        BattleManager.AllRole[i] = nil
                        break
                    end
                end
                ---移除左侧队列
                for i, v in pairs(BattleManager.LeftTeam) do
                    if v.GameID == parent.dragRole.GameID then
                        BattleManager.LeftTeam[i] = nil
                        break
                    end
                end
                ---更新左侧队列顺序
                BattleManager.SetOrderAfter(parent.dragRole)
                ---删除拖拽角色
                GameObject.Destroy(parent.dragRole.myAni.gameObject)
                ---更新顺序
                parent:ReloadOrder(false)
            elseif reuIntArr[0] == 0 then
                ---重新设置xy并更新位置
                parent.dragRole.PosX = reuIntArr[1]
                parent.dragRole.PosY = reuIntArr[2]
                ---更新地板数据
                BattleManager.ChessboardLeft[parent.dragRole.PosY][parent.dragRole.PosX] = parent.dragRole
                ---更新人物数据
                parent.dragRole.myAni:XYSetPos2(parent.dragRole.PosX, parent.dragRole.PosY, parent.dragRole.GameID, parent.dragRole.Occupation)
                ---移除uiItem队列
                StormViewModel.RemoveHeroData(tonumber(parent.dragRole.ID))
            else
                ---交换角色位置
                ---获取目标位置角色
                local targetRole = BattleManager.AllRole[reuIntArr[0]]
                ---先清空目标地板数据
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = 0
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, 0, 0)
                ---交换位置坐标
                local tempPosX = targetRole.PosX
                local tempPosY = targetRole.PosY
                targetRole.PosX = parent.dragRole.PosX
                targetRole.PosY = parent.dragRole.PosY
                parent.dragRole.PosX = tempPosX
                parent.dragRole.PosY = tempPosY
                ---更新拖拽角色地板信息
                BattleManager.ChessboardLeft[parent.dragRole.PosY][parent.dragRole.PosX] = parent.dragRole
                self.dragRole.myAni:XYSetPos2(parent.dragRole.PosX, parent.dragRole.PosY, parent.dragRole.GameID, parent.dragRole.Occupation)
                ---更新目标地板信息
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = targetRole
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                ---移除uiItem队列
                StormViewModel.RemoveHeroData(tonumber(parent.dragRole.ID))
            end
            ---更新提示
            parent:UpdateTips(1)
            ---下一帧更新所有地板
            MgrTimer.AddDelayNoName(0.01,function()
                CJNBattleMgr.Instance:SetAllFloorHid()
            end,nil)
            ---将单次检测插值设为开启
            parent.isOnceDrag = true
            ---还原摄像机位置
            --parent:MoveCamera(5,1)
            ---清空dragRole
            parent.dragRole = nil
            ---还原uiItem位置
            parent.UIDragItem.transform.localPosition = Vector3(0,10000,0)
            ---刷新滑块UI
            parent:ReloadSelectRole()
        end
        ---结束显示攻击范围及羁绊
        --CJNBattleMgr.Instance:EndLine()
        ---还原角色透明度
        for i, role in pairs(BattleManager.AllRole) do
            role.myAni:SetAlpha(1)
        end
    elseif FightGlobal.DragModel == FightEnum.DragType.CLICK_SET_ORDER then
        ---设置排序模式
        if parent.dragRole ~= nil and parent.dragRole.IsLeft then
            ---获取位置是否存在角色
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            ---对比位置是否移动
            local isMove = parent.dragRole.GameID == floorRoleId
            ---移动了则显示回问号，否则显示当前顺序
            local order = isMove and parent.CurAtkOrderIndex or -1
            parent.dragRole.myAni:SetOrder(order, parent.dragRole.IsLeft, true)
            if isMove then
                ---未移动则更新到角色数据里
                ---与当前索引位角色交换位置
                for i, role in pairs(BattleManager.AllRole) do
                    if role.IsLeft == true then
                        if role.AtkOrder == parent.CurAtkOrderIndex then
                            ---交换索引
                            role.AtkOrder = parent.dragRole.AtkOrder
                            parent.dragRole.AtkOrder = parent.CurAtkOrderIndex
                            ---保存完成索引设置的id
                            parent.FinishOrder[parent.dragRole.GameID] = true
                            ---当前所有自增
                            parent.CurAtkOrderIndex = parent.CurAtkOrderIndex + 1
                            break
                        end
                    end
                end
            end
        end
    elseif FightGlobal.DragModel == FightEnum.DragType.SWITCH then
        ---设置交换排序模式
        ---是否抓取了角色
        if parent.dragRole ~= nil and parent.dragRole.IsLeft then
            ---获取结束位置是否存在角色
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            if floorRoleId > 0 then
                ---对比位置是否相同
                if parent.dragRole.GameID == floorRoleId then
                else
                    ---不同执行交换
                    ---获取目标位置角色
                    local targetRole = nil
                    for i, role in pairs(BattleManager.AllRole) do
                        if role.IsLeft and role.GameID == floorRoleId then
                            targetRole = role
                        end
                    end
                    if targetRole ~= nil then
                        ---交换攻击顺序
                        local atkOrder = targetRole.AtkOrder
                        targetRole.AtkOrder = parent.dragRole.AtkOrder
                        parent.dragRole.AtkOrder = atkOrder
                        ---刷新攻击顺序
                        parent.dragRole.myAni:SetOrder(parent.dragRole.AtkOrder, parent.dragRole.IsLeft, true)
                        targetRole.myAni:SetOrder(targetRole.AtkOrder, targetRole.IsLeft, true)
                        ---AllRole中的两者GameID和位置也要互换
                        local dragRoleGameID = parent.dragRole.myAni.GameID
                        parent.dragRole.myAni.GameID = targetRole.myAni.GameID
                        targetRole.myAni.GameID = dragRoleGameID

                        parent.dragRole.GameID = targetRole.GameID
                        targetRole.GameID = dragRoleGameID

                        BattleManager.AllRole[parent.dragRole.GameID] = parent.dragRole
                        BattleManager.AllRole[targetRole.GameID] = targetRole

                        -----设置地板GameID
                        targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                        parent.dragRole.myAni:XYSetPos2(parent.dragRole.PosX, parent.dragRole.PosY, parent.dragRole.GameID, parent.dragRole.Occupation)
                    end
                end
            end
            ---刷新队列顺序
            parent:ReloadOrder(true)
            if parent.dragRoleAtkOder ~= nil then
                local dragCanvas = parent.dragRoleAtkOder:GetComponent("Canvas")
                dragCanvas.sortingOrder = dragCanvas.sortingOrder - 1
            end
        end
    end
    ---清空抓取池
    parent.dragRole = nil
    parent.ShowRoleId = nil
    parent.dragRoleAtkOder = nil
end

---拖拽更新上方UI
function M:UpdateBattleTopUI(RoleId)
    ---获取数据
    ---@type FightRoleView 角色对象
    local role = MgrBattle.GetRoleByUid(RoleId)
    self:UpdateRoleInfo(self.parentUI,role)
    ---显示其他信息
    self:ShowRoleInfo(self.parentUI,role)
end
---属性更新
---@param role RoleFightData
function M:UpdateRoleInfo(parent,role)
    if role == nil then
        return
    end
    ---更新框数据
    if  role.Occupation == 4 then
        ---支援型
        parent.AtkImg().gameObject:SetActive(false)
        parent.SupImg().gameObject:SetActive(true)
        local tempNumber = role.supPart/100
        parent.AtkInfoTxt().text = tempNumber.."%"
        Tools.SetImgFillRate(parent.AtkSlider().gameObject,tempNumber)
        MgrRes.LoadSprite(parent.Img_AtkRang(),"AtkRange/SupportRange/"..role.attackRangeTex)
    else
        ---非支援
        parent.SupImg().gameObject:SetActive(false)
        parent.AtkImg().gameObject:SetActive(true)
        parent.AtkInfoTxt().text = role.info.atk
        Tools.SetImgFillRate(parent.AtkSlider().gameObject,(role.info.realAtk/parent.Uidata_AtkOrSup_Base))
        MgrRes.LoadSprite(parent.Img_AtkRang(),"AtkRange/OtherRange/"..role.info.attackRangeTex)
    end
    if tonumber(role.info.hpMax) >= 1000000 then
        parent.HpInfoTxt().text = (parent.GetMillionNumInfo(tonumber(role.info.hp))).."M"
    else
        parent.HpInfoTxt().text = role.info.hp
    end
    Tools.SetImgFillRate(parent.HPSlider().gameObject,role.info.hp/role.info.hpMax)
    parent.DefInfoTxt().text = (parent.GetInfoCorrect(role.info.def)).."%"
    Tools.SetImgFillRate(parent.DefSlider().gameObject,tonumber(role.info.def))
    parent.CriInfoTxt().text = (parent.GetInfoCorrect(role.info.crit/10000)).."%"
    Tools.SetImgFillRate(parent.CriSlider().gameObject,role.info.crit/10000)
    parent.EvaInfoTxt().text = (parent.GetInfoCorrect(role.info.agile)).."%"
    Tools.SetImgFillRate(parent.AgrSlider().gameObject,role.info.agile)
    parent.ChdInfoTxt().text = (parent.GetInfoCorrect(role.info.critDmg/10000)).."%"
    Tools.SetImgFillRate(parent.CritDmgSlider().gameObject,role.info.critDmg/10000)
end
---显示/隐藏角色详细信息
---@param role RoleFightData
function M:ShowRoleInfo(parent,role)
    ---@type RoleData 角色属性
    local roleData = role.info.isMonster and StormViewModel.CurPointData:GetMonsterById(role.info.id,role.info.atkOrder) or HeroControl.GetRoleDataByID(role.info.id)
    ---若未抓取角色或在战斗中并关闭了UI则不显示
    if roleData == nil or (BattleManager.IsFightStart and not parent.Btn_UI().isOn) then
        parent.Panel_RoleInfo:SetActive(false)
    else
        parent.Panel_RoleInfo:SetActive(true)
        ---更新头像
        MgrRes.LoadQIcon(parent.Icon_RIHead(),roleData.id)
        ---更新边框
        MgrRes.LoadSprite(parent.Icon_RIFrame(),roleData.iconBattleFrame)
        ---更新等级
        parent.Text_RILevel().text = roleData.level
        ---更新职业图标
        MgrRes.LoadSprite(parent.Icon_RICareer(),roleData.iconCareer)
        ---更新星级
        for starLv = 1, #parent.rIStarHl do
            local isStar = roleData.star < starLv
            --self.rIStarNor[starLv]:SetActive(isStar)
            parent.rIStarHl[starLv]:SetActive(not isStar)
        end
        ---更新觉醒
        local isAwaken = false
        if type(roleData.awaken) == "number" then
            isAwaken = roleData.awaken > 0
        else
            isAwaken = roleData.awaken
        end
        parent.rIAwaken:SetActive(isAwaken)
        ---更新技能等级
        parent.Text_RIRank().text = "+"..roleData.skillLevel
        ---更新角色名称
        parent.Text_RIName().text = roleData.name
        ---更新核心
        local core1
        local core2
        if roleData.isMonster then
            core1 = roleData:GetMonsterCore(1)
            core2 = roleData:GetMonsterCore(2)
        else
            core1 = roleData:GetHeroCore(1)
            core2 = roleData:GetHeroCore(2)
        end

        parent.RICore1().gameObject:SetActive(core1 ~= nil)
        parent.RICore2().gameObject:SetActive(core2 ~= nil)
        if core1 ~= nil then
            parent.RICore1().transform:GetComponent("UITemplate"):SetData(core1)
        end
        if core2 ~= nil then
            parent.RICore2().transform:GetComponent("UITemplate"):SetData(core2)
        end
        ---更新攻击距离
        if roleData.occupation == 4 then
            MgrRes.LoadSprite(parent.Img_AtkRang(),"AtkRange/SupportRange/"..role.info.attackRangeTex)
        else
            MgrRes.LoadSprite(parent.Img_AtkRang(),"AtkRange/OtherRange/"..role.info.attackRangeTex)
        end
        ---设置距离文本
        if roleData.occupation == 3 then
            parent.Text_Occ().text = "2R"
        else
            parent.Text_Occ().text = "1R"
        end
        ---设置位置文本
        if roleData.attackTarget == 1 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_front")
        elseif roleData.attackTarget == 2 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_passover")
        elseif  roleData.attackTarget == 3 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_end")
        elseif  roleData.attackTarget == 4 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        elseif  roleData.attackTarget == 5 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_random")
        elseif  roleData.Attacktarget == 7 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        elseif  roleData.Attacktarget == 8 then
            parent.Text_AtkTarget().text = MgrLanguageData.GetLanguageByKey("fightdragview_next")
        end
        ---更新属性
        if roleData.occupation == 4 then
            --- 支援型
            parent.AtkImg().gameObject:SetActive(false)
            parent.SupImg().gameObject:SetActive(true)
            parent.AtkInfoTxt().text = (parent.GetInfoCorrect(role.info.realSupPart)).."%"
            Tools.SetImgFillRate(parent.AtkSlider().gameObject, role.info.realSupPart)
        else
            --- 非支援
            parent.SupImg().gameObject:SetActive(false)
            parent.AtkImg().gameObject:SetActive(true)
            parent.AtkInfoTxt().text = math.floor(role.info.realAtk)
            Tools.SetImgFillRate(parent.AtkSlider().gameObject,(tonumber(role.info.realAtk)/tonumber(role.info.atk)))
        end
        if tonumber(role.info.hp) >= 1000000 then
            parent.HpInfoTxt().text = (parent.GetMillionNumInfo(role.info.hp)).."M"
        else
            parent.HpInfoTxt().text = math.floor(role.info.hp)
        end
        Tools.SetImgFillRate(parent.HPSlider().gameObject,tonumber(role.info.hp)/tonumber(role.info.hpMax))
        parent.DefInfoTxt().text = (parent.GetInfoCorrect(role.info.realDef)).."%"
        Tools.SetImgFillRate(parent.DefSlider().gameObject,tonumber(role.info.realDef))
        parent.CriInfoTxt().text = (parent.GetInfoCorrect(role.info.realCrit/10000)).."%"
        Tools.SetImgFillRate(parent.CriSlider().gameObject,role.info.realCrit/10000)
        parent.EvaInfoTxt().text = (parent.GetInfoCorrect(role.info.realAgile)).."%"
        Tools.SetImgFillRate(parent.AgrSlider().gameObject,role.info.realAgile)
        parent.ChdInfoTxt().text = (parent.GetInfoCorrect(role.info.realCritDmg/10000)).."%"
        Tools.SetImgFillRate(parent.CritDmgSlider().gameObject,role.info.realCritDmg/10000)
        ---更新技能
        parent.RoleDesTxt().text = role.info.attackDescription
        parent.SkillIcon_1().gameObject:SetActive(true)
        if role.info.skill_1_example[1] ~= nil then
            MgrRes.LoadSprite(parent.SkillIcon_1(),"Skill/"..role.info.skill_1_example[1].icon)
        else
            MgrRes.LoadSprite(parent.SkillIcon_1(),"Skill/".."icon_skill_empty")
        end
        ---设置点击
        UIEvent.LuaClick(parent.SkillIcon_1().gameObject, function()
            MgrUI.Pop(UID.RolePreview_UI,{nil,3,role.info.skill_1_example},true)
        end)
        ---设置技能2
        parent.SkillIcon_2().gameObject:SetActive(true)
        if role.info.skill_2_example[1]~=nil then
            MgrRes.LoadSprite(parent.SkillIcon_2(),"Skill/"..role.info.skill_2_example[1].icon)
        else
            MgrRes.LoadSprite(parent.SkillIcon_2(),"Skill/".."icon_skill_empty")
        end
        ---设置点击2
        UIEvent.LuaClick(parent.SkillIcon_2().gameObject, function ()
            MgrUI.Pop(UID.RolePreview_UI,{nil,3,role.info.skill_2_example},true)
        end)
        ---设置技能3
        parent.SkillIcon_3().gameObject:SetActive(true)
        if role.info.skill_3_example[1]~=nil then
            MgrRes.LoadSprite(parent.SkillIcon_3(),"Skill/"..role.info.skill_3_example[1].icon)
        else
            MgrRes.LoadSprite(parent.SkillIcon_3(),"Skill/".."icon_skill_empty")
        end
        ---设置点击3
        UIEvent.LuaClick(parent.SkillIcon_3().gameObject, function ()
            MgrUI.Pop(UID.RolePreview_UI,{nil,3,role.info.skill_3_example},true)
        end)
        ---设置技能4
        parent.SkillIcon_4().gameObject:SetActive(true)
        if role.info.skill_4_example[1]~=nil then
            parent.ImageSuo().gameObject:SetActive(role.info.isAwaken == false)
            MgrRes.LoadSprite(parent.SkillIcon_4(),"Skill/"..role.info.skill_4_example[1].icon)
        else
            MgrRes.LoadSprite(parent.SkillIcon_4(),"Skill/".."icon_skill_empty")
        end
        ---设置点击4
        UIEvent.LuaClick(parent.SkillIcon_4().gameObject, function ()
            MgrUI.Pop(UID.RolePreview_UI,{nil,3,role.info.skill_4_example},true)
        end)
        ---更新buff
        ---清空列表
        parent.List_Index_GoIcon = {}
        parent.List_Index_IconTex = {}
        Tools.ClearAllChild(parent.RootAbtBuffObj().gameObject)
        ---创建buff
        for key, value in pairs(parent.List_Name) do
            ---创建ui物体
            local tempObj= GameObject.Instantiate(parent.AbtBuffIcon(),parent.RootAbtBuffObj().transform,false)
            ---替换图片
            MgrRes.LoadSprite(tempObj,"Skill/"..value)
            ---设置时间
            local GoText = tempObj.transform:Find("Text").gameObject
            local temptext = GoText:GetComponent("TextMeshProUGUI")
            local tempImg = tempObj.transform:Find("Img").gameObject
            ---text组件列表
            parent.List_Index_IconTex[parent.List_Index[key]] = temptext
            if parent.List_Turn[key] < 0 then  ---如果时间为负数显示无限图片
            GoText:SetActive(false)
            else
                tempImg:SetActive(false)
                temptext.text = parent.List_Turn[key]
            end
            parent.List_Index_GoIcon[parent.List_Index[key]] = tempObj.gameObject
        end
    end
end

return M