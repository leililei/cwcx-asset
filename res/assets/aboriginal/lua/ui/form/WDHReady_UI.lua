-- Code Auto Create Begin
local M = Class('WDHReady_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WDHReady_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WDHReady_UI].prefab'
    self.Name = 'Form[WDHReady_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SetPanel','Ani/SetPanel',2},{'Panel_Select','Ani/SetPanel/Panel_Ready/Panel_Select',2},{'Img_Huangtiao','Ani/SetPanel/Panel_Ready/Panel_Select/Img_Huangtiao',2},{'LineupBtns','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns',2},{'Img_Rormationdi','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Img_Rormationdi',2},{'Rormationicon','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Rormationicon',2},{'Img_Rormationdi01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Img_Rormationdi',2},{'Rormationicon01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Rormationicon',2},{'Img_Removedi','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Img_Removedi',2},{'Removeicon','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Removeicon',2},{'SwitchPanel','Ani/SetPanel/Panel_Ready/SwitchPanel',2},{'Img_di','Ani/SetPanel/Panel_Ready/SwitchPanel/Img_di',2},{'Jingong','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong',2},{'Icon','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong/Icon',2},{'Fangshou','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou',2},{'Icon01','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou/Icon',2},{'Frame','Ani/SetPanel/Panel_Ready/SwitchPanel/Frame',2},{'Img_Tanchuangdi(xia)','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tanchuangdi(xia)',2},{'LoopScrollRole','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',2},{'Img_OpenFilterdi','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Img_OpenFilterdi',2},{'Pailieicon','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Pailieicon',2},{'ScrollMask','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask',2},{'Image','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask/Image',2},{'Img_TishiBian','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tips/Img_TishiBian',2},{'Btn_Recovery','Ani/SetPanel/Panel_Ready/Btn_Recovery',2},{'Img_Huifuzhenxingdi','Ani/SetPanel/Panel_Ready/Btn_Recovery/Img_Huifuzhenxingdi',2},{'Img_Kuang(hui)','Ani/SetPanel/Panel_Ready/Btn_Recovery/Img_Kuang(hui)',2},{'Btn_Save','Ani/SetPanel/Panel_Ready/Btn_Save',2},{'Img_Chucunzhenxingdi','Ani/SetPanel/Panel_Ready/Btn_Save/Img_Chucunzhenxingdi',2},{'guang','Ani/SetPanel/Panel_Ready/Btn_Save/guang',2},{'Img_Kuang(liang)','Ani/SetPanel/Panel_Ready/Btn_Save/Img_Kuang(liang)',2},{'Btn_Chucun','Ani/SetPanel/Panel_Ready/Btn_Chucun',2},{'Img_Chucunzhenxingdi01','Ani/SetPanel/Panel_Ready/Btn_Chucun/Img_Chucunzhenxingdi',2},{'guang01','Ani/SetPanel/Panel_Ready/Btn_Chucun/guang',2},{'Img_Kuang(liang)01','Ani/SetPanel/Panel_Ready/Btn_Chucun/Img_Kuang(liang)',2},{'Btn_Fanhui','Ani/SetPanel/Panel_Ready/Btn_Fanhui',2},{'Img_Huifuzhenxingdi01','Ani/SetPanel/Panel_Ready/Btn_Fanhui/Img_Huifuzhenxingdi',2},{'Img_Kuang(hui)01','Ani/SetPanel/Panel_Ready/Btn_Fanhui/Img_Kuang(hui)',2},{'Btn_HideRoleInfo','Ani/SetPanel/Panel_RoleInfo/Btn_HideRoleInfo',2},{'Img_Tanchuangdi(shang)','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)',2},{'Img_xian1','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian1',2},{'Img_xian2','Ani/SetPanel/Panel_RoleInfo/Img_Tanchuangdi(shang)/Img_xian2',2},{'Img_Lihuidi','Ani/SetPanel/Panel_RoleInfo/RoleHead/Img_Lihuidi',2},{'Icon_RIHead','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RIHead',2},{'Icon_RIFrame','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RIFrame',2},{'Icon_RICareer','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_RICareer',2},{'RIStar_1','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1',2},{'Normal','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1/Normal',2},{'HighLight','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_1/HighLight',2},{'RIStar_2','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2',2},{'Normal01','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2/Normal',2},{'HighLight01','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_2/HighLight',2},{'RIStar_3','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3',2},{'Normal02','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3/Normal',2},{'HighLight02','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_3/HighLight',2},{'RIStar_4','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4',2},{'Normal03','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4/Normal',2},{'HighLight03','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_4/HighLight',2},{'RIStar_5','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5',2},{'Normal04','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5/Normal',2},{'HighLight04','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_5/HighLight',2},{'RIStar_6','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6',2},{'Normal05','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6/Normal',2},{'HighLight05','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIStar_6/HighLight',2},{'RIAwaken','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken',2},{'Super','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super',2},{'Super1','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super1',2},{'Super2','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super2',2},{'Super3','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super3',2},{'Super4','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super4',2},{'Super5','Ani/SetPanel/Panel_RoleInfo/RoleHead/StarContent/RIAwaken/Super5',2},{'Icon_Rankdi','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_Rankdi',2},{'Fanwei','Ani/SetPanel/Panel_RoleInfo/Fanwei',2},{'Mubiao','Ani/SetPanel/Panel_RoleInfo/Mubiao',2},{'Hp','Ani/SetPanel/Panel_RoleInfo/Hp',2},{'HPtiaodi','Ani/SetPanel/Panel_RoleInfo/Hp/HPtiaodi',2},{'HPtiao','Ani/SetPanel/Panel_RoleInfo/Hp/HPtiao',2},{'Img_xian101','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Img_xian1',2},{'Img_xian201','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Img_xian2',2},{'Atk','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk',2},{'AtkIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/AtkIcon',2},{'Def','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def',2},{'DefIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/DefIcon',2},{'Baoji','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji',2},{'BaojiIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/BaojiIcon',2},{'Baoshang','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang',2},{'BaoshangIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/BaoshangIcon',2},{'Mingjie','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie',2},{'MingjieIcon','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/MingjieIcon',2},{'Img_Chakandi','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/Img_Chakandi',2},{'ChakanIcon','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/ChakanIcon',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'Btn_Shunxu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu',4},{'Btn_Rormation','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',4},{'Btn_Remove','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',4},{'Btn_OpenFilter','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',4},{'Btn_Chakan','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan',4},
        -- UITemplate 列表
        {'PVPRoleItem','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole/PVPRoleItem',10},
        -- RawImage 列表
        {'Panel_Ready','Ani/SetPanel/Panel_Ready',15},{'Btn_Shunxu01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu',15},{'Btn_Rormation01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation',15},{'Btn_Remove01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove',15},{'Panel_Replace','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace',15},{'Btn_OpenFilter01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter',15},{'Panel_RoleInfo','Ani/SetPanel/Panel_RoleInfo',15},{'Btn_Chakan01','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan',15},
        -- LoopScrollRect 列表
        {'LoopScrollRole01','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/LoopScrollRole',18},
        -- TextMeshProUGUI 列表
        {'Text_Zhenxing','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Text_Zhenxing',20},{'Text_Cunqu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Shunxu/Text_Cunqu',20},{'Text_Cunqu01','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Rormation/Text_Cunqu',20},{'Text_Jiechu','Ani/SetPanel/Panel_Ready/Panel_Select/LineupBtns/Btn_Remove/Text_Jiechu',20},{'Text_Jingong','Ani/SetPanel/Panel_Ready/SwitchPanel/Jingong/Text_Jingong',20},{'Text_Fangshou','Ani/SetPanel/Panel_Ready/SwitchPanel/Fangshou/Text_Fangshou',20},{'Text_Pailie','Ani/SetPanel/Panel_Ready/Panel_Room/Panel_Replace/Btn_OpenFilter/Text_Pailie',20},{'Text','Ani/SetPanel/Panel_Ready/Panel_Room/ScrollMask/Image/Text',20},{'Text_Tips','Ani/SetPanel/Panel_Ready/Panel_Room/Img_Tips/Text_Tips',20},{'Text_Huifuzhenxing','Ani/SetPanel/Panel_Ready/Btn_Recovery/Text_Huifuzhenxing',20},{'Text_Chucunzhenxing','Ani/SetPanel/Panel_Ready/Btn_Save/Text_Chucunzhenxing',20},{'Text_Chucun','Ani/SetPanel/Panel_Ready/Btn_Chucun/Text_Chucun',20},{'Text_Fanhui','Ani/SetPanel/Panel_Ready/Btn_Fanhui/Text_Fanhui',20},{'Text_RILevel','Ani/SetPanel/Panel_RoleInfo/RoleHead/Text_RILevel',20},{'Text_RILv','Ani/SetPanel/Panel_RoleInfo/RoleHead/Text_RILv',20},{'Text_RIRank','Ani/SetPanel/Panel_RoleInfo/RoleHead/Icon_Rankdi/Text_RIRank',20},{'Text_RIName','Ani/SetPanel/Panel_RoleInfo/Text_RIName',20},{'Text_Mubiaozi','Ani/SetPanel/Panel_RoleInfo/Mubiao/Text_Mubiaozi',20},{'Text_HP1','Ani/SetPanel/Panel_RoleInfo/Hp/Text_HP1',20},{'Text_HP2','Ani/SetPanel/Panel_RoleInfo/Hp/Text_HP2',20},{'Text_Atk1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk1',20},{'Text_Atk2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Atk/Text_Atk2',20},{'Text_Def1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def1',20},{'Text_Def2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Def/Text_Def2',20},{'Text_Baoji1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji1',20},{'Text_Baoji2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoji/Text_Baoji2',20},{'Text_Baoshang1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang1',20},{'Text_Baoshang2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Baoshang/Text_Baoshang2',20},{'Text_Mingjie1','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie1',20},{'Text_Mingjie2','Ani/SetPanel/Panel_RoleInfo/RoleInfoTxtPanel/Mingjie/Text_Mingjie2',20},{'Text_Chakan','Ani/SetPanel/Panel_RoleInfo/Btn_Chakan/Text_Chakan',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    PVPViewModel.FriendPVPInit()
    self.Panel_RoleInfo = self.Panel_RoleInfo().gameObject
    self.Panel_RoleInfo:SetActive(false)
    self.ScrollMask().gameObject:SetActive(false)
    self.Rank = nil
    local tWDHData = BuDoukaiControl.GetData()
    PVPViewModel.RoleLimit = tWDHData.playnumber
    ---是否对阵型进行了修改
    self.isChange = false
    -----角色信息星底框
    self.rIStarNor = {
        [1] = self.RIStar_1().transform:Find("Normal").gameObject,
        [2] = self.RIStar_2().transform:Find("Normal").gameObject,
        [3] = self.RIStar_3().transform:Find("Normal").gameObject,
        [4] = self.RIStar_4().transform:Find("Normal").gameObject,
        [5] = self.RIStar_5().transform:Find("Normal").gameObject,
        [6] = self.RIStar_6().transform:Find("Normal").gameObject,
    }
    ---角色信息星高亮
    self.rIStarHl = {
        [1] = self.RIStar_1().transform:Find("HighLight").gameObject,
        [2] = self.RIStar_2().transform:Find("HighLight").gameObject,
        [3] = self.RIStar_3().transform:Find("HighLight").gameObject,
        [4] = self.RIStar_4().transform:Find("HighLight").gameObject,
        [5] = self.RIStar_5().transform:Find("HighLight").gameObject,
        [6] = self.RIStar_6().transform:Find("HighLight").gameObject,
    }
    ---觉醒星
    self.superStars = {
        [1] = self.Super().gameObject,
        [2] = self.Super1().gameObject,
        [3] = self.Super2().gameObject,
        [4] = self.Super3().gameObject,
        [5] = self.Super4().gameObject,
        [6] = self.Super5().gameObject,
    }
    self.rIAwaken = self.RIAwaken().gameObject
    ---当前排序类型(1等级，2星级，3取得时间, 4稀有度，5好感度)
    self.CurCardSort = 1
    ---当前筛选类型true为开启项(0全部，1护卫，2强击，3轰炸，4支援 与配置表一致)
    self.CurCardFilter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false
    }
    
    Event.Add("Ready_RayOff",function()
        CJNBattleMgr.Instance:RaygetIdOff(false)
    end)
    ---当前升降序(true升序，false降序)
    self.CurCardRise = true
    ---1、设置角色，2、问号排序模式，3、交换排序模式
    self.CurMode = 1
    ---布阵存储ID 10005：第一阵容 10006：第二阵容
    self.SaveTeamID = 10005
    self.AllTeam = {10005,10006}
    
    CJNUIMgr.InitBattleMapNodePosList2(BattleManager.FloorPos.left,BattleManager.FloorPos.right)
    BattleManager.StartBattle(nil,1,BattleManager.MonsterStandType.PVP)  --参数没用
    ---1.5f后更新地板
    MgrTimer.AddDelay("ShowFloor",1.5,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
    ---获取战斗摄像机
    self.battleCamera = CMgrCamera.Instance.FightCamera
    ---获取ui摄像机
    self.uiCamera = GameObject.Find("UI_Camera"):GetComponent("Camera")
    ---初始化拖拽UI物体
    self.UIDragItem = self.PVPRoleItem()
    ---显示透明地板
    CJNBattleMgr.Instance:SetFloorShowImg(true)
    ---注册滑块
    self:RegisterLoopScroll()
    ---默认分别排序模式
    self.sortingType = 1
    ---初始化拖拽
    self:InitDrag()
    ---按钮
    self:InitButton()
end
function M:OnUpdateUI()
    self:CloseSkillXiangqing()
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113019][2],0.2)
end
function M:OnShowFinish()
    MgrCamera.VirCamerasInit_New()
    CJNBattleMgr:ActiveBuildings()
    --重置改变的阵型角色ID
    BuDoukaiControl.SetChangeTeamID()
    ---队伍上场
    self:LoadTeamRole(self.SaveTeamID)
end
---初始化按钮
function M:InitButton()
    UIEvent.LuaClick(self.Btn_Rormation().gameObject,function()
        local m = self.CurMode
        self.CurMode = 0
        self.SwitchPanel().gameObject:SetActive(true)
        self:ShowRoleInfo()
        ---@type FighterBase[] 创建当前使用的阵型数据
        local fighters = {}
        for i, role in pairs(BattleManager.AllRole) do
            if role.IsLeft == true then
                ---@type FighterBase
                local fighter = {}
                ---设置位置
                fighter.index = (6-role.PosX)*3 + role.PosY
                ---设置id
                fighter.roleID = tonumber(role.ID)
                ---加入数据池
                fighters[role.AtkOrder] = fighter
            end
        end
        MgrUI.Pop(UID.TeamGroupPop_UI,{fighters,function()
            ---返回回调
            self.CurMode = m
        end,function(idx)
            ---改变阵型回调
            self:LoadTeamRole(idx,false)
            self.isChange = true
            Event.Go("TeamChangeTip")
        end,true},true)
    end)
    ---移除左侧场上所有角色
    UIEvent.LuaClick(self.Btn_Remove().gameObject,Handle(self,function ()
        self.SwitchPanel().gameObject:SetActive(true)
        self:ReMoveAllLeft(true)
        self.isChange = true
        ---关闭人物信息
        self:ShowRoleInfo()
    end))
    self.LineUpOrOrder = 1
    ---排序模式
    UIEvent.LuaClick(self.Btn_Shunxu().gameObject,function()
        if self.LineUpOrOrder == 1 then
            self.LineUpOrOrder = 2
            self:ReloadOrder(true)
            ---设置当前模式为拖拽排序
            self.CurMode = 3
            ---更新替换队员面板
            self:ReloadSelectRole()
            self.ScrollMask().gameObject:SetActive(true)
        elseif self.LineUpOrOrder == 2 then
            self.LineUpOrOrder = 1
            self:ReloadOrder(false)
            ---设置当前模式为选择角色
            self.CurMode = 1
            ---更新替换队员面板
            self:ReloadSelectRole()
            self.ScrollMask().gameObject:SetActive(false)
        end
    end)
    ---返回界面
    UIEvent.LuaClick(self.Btn_Recovery().gameObject,Handle(self, function()
        if self.isChange then
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips3"),function()
                --保存战斗阵型
                self:SaveFightTeam(self.SaveTeamID)
            end,nil,2,function()
                self:LoadTeamRole(self.SaveTeamID)
                self.isChange = false
            end},true)
        else
            MgrTimer.Cancel("BattleUIUpdate")
            MgrBattle.CloseFight()
        end
    end))
    ---打开排序窗口
    UIEvent.LuaClick(self.Btn_OpenFilter().gameObject,Handle(self,function ()
        MgrUI.Pop(UID.SortFilterPop_UI,{function(filter,sort,rise)
            ---如果5个filter都为false，则默认第一个为true
            local allFalse = true
            for _, v in pairs(filter) do
                if v == true then
                    allFalse = false
                end
            end
            if allFalse then
                filter[0] = true
            end
            self.CurCardFilter = filter
            self.CurCardSort = sort
            self.CurCardRise = rise
            ---刷新UI
            self:ReloadSelectRole(0)
        end,2},true)
    end))
    ---保存战斗阵型
    UIEvent.LuaClick(self.Btn_Save().gameObject,function()
        self:SaveFightTeam(self.SaveTeamID)
    end)
    -----恢复战斗阵型
    --UIEvent.LuaClick(self.Btn_Recovery().gameObject,function()
    --    self:LoadTeamRole(10004)
    --end)
    ---注册隐藏角色信息面板
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:CloseSkillXiangqing()
        self:ShowRoleInfo()
    end)
    ---查看角色信息
    UIEvent.LuaClick(self.Btn_Chakan01().gameObject,function()
        local role = HeroControl.GetRoleDataByID(tonumber(self.CurRoleInfo.ID))
        MgrUI.Pop(UID.RoleInfoPausePop_UI,{false,role,self.CurRoleInfo,0})
        CJNBattleMgr.Instance:RaygetIdOff(true)
    end)
    ---进攻
    UIEvent.LuaClick(self.Jingong().gameObject,function()
        if self.Frame().transform.localPosition == self.Jingong().transform.localPosition then
            return
        end
        self.SaveTeamID = 10005
        if self.isChange then
            --关闭射线检测
            CJNBattleMgr.Instance:RaygetIdOff(true)
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips12"),function()
                --存储防守阵型
                if not self:SaveFightTeam(10006) then
                    CJNBattleMgr.Instance:RaygetIdOff(false)
                    return
                end
                --加载攻击阵型
                self:LoadTeamRole(self.SaveTeamID)
                --切换选择按钮
                self.Frame().transform.localPosition = self.Jingong().transform.localPosition
                CJNBattleMgr.Instance:RaygetIdOff(false)
            end,nil,2,function()
                --重置英雄池数据
                self:ResetTeam(10006)
                --加载阵型
                self:LoadTeamRole(self.SaveTeamID)
                self.Frame().transform.localPosition = self.Jingong().transform.localPosition
                self.isChange = false
                CJNBattleMgr.Instance:RaygetIdOff(false)
            end},true)
        else
            self:LoadTeamRole(self.SaveTeamID,false)
            self.Frame().transform.localPosition = self.Jingong().transform.localPosition
        end
    end)
    ---防守
    UIEvent.LuaClick(self.Fangshou().gameObject,function()
        if self.Frame().transform.localPosition == self.Fangshou().transform.localPosition then
            return
        end
        self.SaveTeamID = 10006
        if self.isChange then
            CJNBattleMgr.Instance:RaygetIdOff(true)
            MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips6"),function()
                --存储防守阵型
                if not self:SaveFightTeam(10005) then
                    CJNBattleMgr.Instance:RaygetIdOff(false)
                    return
                end
                --加载攻击阵型
                self:LoadTeamRole(self.SaveTeamID)
                --切换选择按钮
                self.Frame().transform.localPosition = self.Fangshou().transform.localPosition
                CJNBattleMgr.Instance:RaygetIdOff(false)
            end,nil,2,function()
                --重置英雄池数据
                self:ResetTeam(10005)
                --加载阵型
                self:LoadTeamRole(self.SaveTeamID)
                self.Frame().transform.localPosition = self.Fangshou().transform.localPosition
                self.isChange = false
                CJNBattleMgr.Instance:RaygetIdOff(false)
            end},true)
        else
            self:LoadTeamRole(self.SaveTeamID,false)
            self.Frame().transform.localPosition = self.Fangshou().transform.localPosition
        end
    end)
    ---注册隐藏角色信息面板
    UIEvent.LuaClick(self.Btn_HideRoleInfo().gameObject,function()
        self:CloseSkillXiangqing()
        self.SwitchPanel().gameObject:SetActive(true)
        self:ShowRoleInfo()
    end)
end
function M:InitDrag()
    --self:ReloadSelectRole(0)
    self.Panel_RoleInfo:SetActive(false)
    ---设置屏幕点击状态1：按下 2：拖拽 3：抬起
    self.OnState = 1
    ---开启屏幕按键检测循环
    MgrTimer.AddRepeat("BattleUIUpdate",0, function()
        ---状态1检测按下
        if self.OnState == 1 and UIEvent.GetButton_Down() then
            local y = UIEvent.GetInput_Y()
            if y < (Tools.GetScreenHeight()/4) then
                ---若是在UI栏拖拽则不执行
                return
            end
            local PopUI = MgrUI.GetPopUI(UID.RolePreview_UI)
            ---如果当前弹窗了技能预览界面则不执行
            if PopUI ~= nil then
                return
            end
            ---按下通知
            self:OnBeginDrag()
            ---切换到拖拽状态
            self.OnState = 2
        elseif self.OnState == 2 then
            ---拖拽通知
            self:OnDrag()
            ---检测抬起
            if UIEvent.GetButton_Up() then
                ---切换到抬起状态
                self.OnState = 3
            end
        elseif self.OnState == 3 then
            ---抬起通知
            self:OnEndDrag()
            ---切换到检测按下状态
            self.OnState = 1
        end
    end,-1,nil)
    ---0.5f后更新地板
    MgrTimer.AddDelayNoName(0.1,function() CJNBattleMgr.Instance:SetAllFloorHid() end,nil)
end
---注册滑块
function M:RegisterLoopScroll()
    self.LoopScrollRole01():SetLuaCellEvent(Handle(self,self.CellSelectRole))
    self.selectRoleLoop = self.LoopScrollRole01()
    self.selectRoleRect = self.selectRoleLoop.transform:GetComponent("RectTransform")
end
---替换队员滑块通知
function M:CellSelectRole(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.roleData[idx],self})
end
---设置替换队员面板滑动数据
function M:ReloadSelectRole(isMoveId)
    ---获取拥有的角色
    self.roleData = PVPViewModel.GetSortAndFilterHeroArr(self.CurCardFilter,self.CurCardSort,self.CurCardRise)
    --偏爱角色提前
    local isLove
    local newTab = {}
    local newTab2 = {}
    for i, v in pairs(self.roleData) do
        isLove = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "H%s",v.id))
        if isLove ~= nil and  isLove ~= "" then
            table.insert(newTab,v)
        else
            table.insert(newTab2,v)
        end
    end
    for i = 1, #newTab2 do
        table.insert(newTab,#newTab + 1,newTab2[i])
    end
    self.roleData = newTab

    ---设置数量
    self.LoopScrollRole01().totalCount = #self.roleData
    if isMoveId == nil then
        ---直接刷新面板
        self.LoopScrollRole01():RefillCells()
    else
        ---根据id刷新到指定位置
        local index = 0
        for i, role in pairs(self.roleData) do
            if role.id == isMoveId then
                index = i
                break
            end
        end
        index = index - 4
        index = index < 0 and 0 or index
        self.LoopScrollRole01():RefillCells(index)
    end
end

function M:OnBeginDrag()
    ---发射射线抓取地板角色GameId， 0为空
    self.ShowRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
    print( self.ShowRoleId)
    ---设置选中的角色
    CJNUIMgr.SetUiTop(tonumber(self.ShowRoleId))
    ---按下位置存在角色则显示角色信息,否则隐藏角色信息
    if self.ShowRoleId ~= nil and self.ShowRoleId ~= 0 then
        ---显示
        for i, role in pairs(BattleManager.AllRole) do
            if role.GameID == self.ShowRoleId then
                self.CurRoleInfo = role
                self:ShowRoleInfo(role,true)
                self.SwitchPanel().gameObject:SetActive(false)
                break
            end
        end
    end

    if self.CurMode == 1 then
        ---抓取地板role
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---清空地板数据
            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = 0
            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, 0, 0)
            ---修改透明度
            self.dragRole.myAni:SetAlpha(0.5)
            ---设置uiItem
            self.UIDragItem:SetData({HeroControl.GetRoleDataByID(tonumber(self.dragRole.ID)),self})
            -----添加到滑块数据
            PVPViewModel.AddHeroData(tonumber(self.dragRole.ID))
        end
    elseif self.CurMode == 2 then
        ---设置问号排序模式
        ---检查是否已设置过
        if self.FinishOrder[self.ShowRoleId] == true then
            return
        end
        ---未设置，抓取地板role
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---设置顺序为当前索引顺序
            self.dragRole.myAni:SetOrder(self.CurAtkOrderIndex, self.dragRole.IsLeft, true)
        end
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---抓取选中的角色顺序图标
        self.dragRole = BattleManager.AllRole[self.ShowRoleId]
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.dragRoleAtkOder = self.dragRole.myAni.transform:Find("AtkOrder(Clone)").gameObject
            local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
            dragCanvas.sortingOrder = dragCanvas.sortingOrder + 1
        end
    end
    ---滑动屏幕模式打开
    if self.dragRole == nil and not BattleManager.IsFightStart and not self.Panel_RoleInfo.activeInHierarchy then
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(true)
    end
end
function M:OnDrag()
    ---战斗中不执行
    if BattleManager.IsFightStart then
        return
    end
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            ---若存在抓取到的角色更新抓取角色的位置
            local posArr = CJNBattleMgr.Instance:RayAndSetGo(self.dragRole.myAni.gameObject)
            ---更新uiItem位置
            self.UIDragItem.transform.localPosition = Tools.GetUIPos(self.dragRole.myAni.gameObject,self.battleCamera,self.uiCamera,self.selectRoleRect)
            ---判断是否是第一次拖拽
            if self.isOnceDrag then
                ---若是第一次则显示攻击范围及羁绊
                self.isOnceDrag = false
            elseif self.LastDragPos_X == posArr[1] and self.LastDragPos_Y == posArr[2] then
                ---若与上一帧位置相同则不显示
                return
            end
            ---记录坐标
            self.LastDragPos_X = posArr[1]
            self.LastDragPos_Y = posArr[2]
            if posArr[1] == 0 or posArr[2] == 0 then
                ---若坐标为零不显示
                return
            end
            ---重置地板
            CJNBattleMgr.Instance:SetAllFloorHid()
            ---显示攻击范围及羁绊
            BattleManager.FAndShowRound(self.dragRole, posArr[1], posArr[2])
        end
    elseif self.CurMode == 2 then
        ---设置排序模式
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---若存在抓取到的角色更新抓取角色的顺序图标位置
        if self.dragRoleAtkOder ~= nil then
            CJNBattleMgr.Instance:RayAndSetGo(self.dragRoleAtkOder)
        end
    end
end
function M:OnEndDrag()
    CMgrCamera.Instance:CloseStrokeCamera()
    if self.CurMode == 1 then
        ---设置角色模式
        if self.dragRole ~= nil and not Global.IsNil(self.dragRole.myAni) and self.dragRole.IsLeft then
            ---获取射线返回的地板信息:[0]id -1不能写入、为0则是空地板、其他数则为id，[1]地板x，[2]地板y
            local reuIntArr = CJNBattleMgr.Instance:RayGoInFloor(self.dragRole.myAni.gameObject,0,0,self.dragRole.GameID,self.dragRole.Occupation)
            if reuIntArr[0] == -1
            then
                ---移除总队列
                --for i, v in pairs(BattleManager.AllRole) do
                --    if v.GameID == self.dragRole.GameID then
                --        table.remove(BattleManager.AllRole,i)
                --        break
                --    end
                --end
                if BattleManager.AllRole[self.dragRole.GameID] then
                    BattleManager.AllRole[self.dragRole.GameID] = nil
                end
                ---移除左侧队列
                for i, v in pairs(BattleManager.LeftTeam) do
                    if v.GameID == self.dragRole.GameID then
                        table.remove(BattleManager.LeftTeam,i)
                        break
                    end
                end
                ---更新左侧队列顺序
                BattleManager.SetOrderAfter(self.dragRole)
                ---删除拖拽角色
                GameObject.Destroy(self.dragRole.myAni.gameObject)
                ---更新顺序
                self:ReloadOrder(false)
                ---刷新滑块UI
                self:ReloadSelectRole()
                self.isChange = true
            elseif reuIntArr[0] == 0
            then
                ---重新设置xy并更新位置
                self.dragRole.PosX = reuIntArr[1]
                self.dragRole.PosY = reuIntArr[2]
                ---更新地板数据
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                ---移除uiItem队列
                PVPViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
                self.isChange = true
            else
                if BattleManager.GameIdCout > #BattleManager.AllRole then
                    BattleManager.GameIdCout = BattleManager.GameIdCout - 1
                end
                ---交换角色位置
                ---获取目标位置角色
                local targetRole = BattleManager.AllRole[reuIntArr[0]]
                ---先清空目标地板数据
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = 0
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, 0, 0)
                ---交换位置坐标
                local tempPosX = targetRole.PosX
                local tempPosY = targetRole.PosY
                targetRole.PosX = self.dragRole.PosX
                targetRole.PosY = self.dragRole.PosY
                self.dragRole.PosX = tempPosX
                self.dragRole.PosY = tempPosY
                ---更新拖拽角色地板信息
                BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                ---更新目标地板信息
                BattleManager.ChessboardLeft[targetRole.PosY][targetRole.PosX] = targetRole
                targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                ---移除uiItem队列
                PVPViewModel.RemoveHeroData(tonumber(self.dragRole.ID))
                self.isChange = true
            end
            ---结束显示攻击范围及羁绊
            CJNBattleMgr.Instance:EndLine()
            ---还原角色透明度
            for i, role in pairs(BattleManager.AllRole) do
                role.myAni:SetAlpha(1)
            end
            ---更新提示
            self:UpdateTips(1)
            ---下一帧更新所有地板
            MgrTimer.AddDelayNoName(0.01,function()
                CJNBattleMgr.Instance:SetAllFloorHid()
            end,nil)
            ---将单次检测插值设为开启
            self.isOnceDrag = true
            ---清空dragRole
            self.dragRole = nil
            ---还原uiItem位置
            self.UIDragItem.transform.localPosition = Vector3(0,10000,0)
            -----刷新滑块UI
        end
    elseif self.CurMode == 2 then
        ---设置排序模式
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.isChange = true
            ---获取位置是否存在角色
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            ---对比位置是否移动
            local isMove = self.dragRole.GameID == floorRoleId
            ---移动了则显示回问号，否则显示当前顺序
            local order = isMove and self.CurAtkOrderIndex or -1
            self.dragRole.myAni:SetOrder(order, self.dragRole.IsLeft, true)
            if isMove then
                ---未移动则更新到角色数据里
                ---与当前索引位角色交换位置
                for i, role in pairs(BattleManager.AllRole) do
                    if role.IsLeft == true then
                        if role.AtkOrder == self.CurAtkOrderIndex then
                            ---交换出手顺序
                            role.AtkOrder = self.dragRole.AtkOrder
                            self.dragRole.AtkOrder = self.CurAtkOrderIndex
                            ---AllRole中的两者GameID和位置也要互换
                            local dragRoleGameID = self.dragRole.myAni.GameID
                            self.dragRole.myAni.GameID = role.myAni.GameID
                            role.myAni.GameID = dragRoleGameID

                            self.dragRole.GameID = role.GameID
                            role.GameID = dragRoleGameID
                            ---更新地板数据
                            BattleManager.ChessboardLeft[self.dragRole.PosY][self.dragRole.PosX] = self.dragRole
                            BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
                            ---更新上阵人物排序
                            BattleManager.AllRole[self.dragRole.GameID] = self.dragRole
                            BattleManager.AllRole[role.GameID] = role
                            BattleManager.LeftTeam[self.dragRole.AtkOrder] = self.dragRole
                            BattleManager.LeftTeam[role.AtkOrder] = role
                            ---更新人物数据
                            self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                            role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
                            ---保存完成索引设置的id
                            self.FinishOrder[self.dragRole.GameID] = true
                            ---当前所有自增
                            self.CurAtkOrderIndex = self.CurAtkOrderIndex + 1
                            break
                        end
                    end
                end
            end
        end
    elseif self.CurMode == 3 then
        ---设置交换排序模式
        ---是否抓取了角色
        if self.dragRole ~= nil and self.dragRole.IsLeft then
            self.isChange = true
            ---获取位置是否存在角色
            local floorRoleId = CJNBattleMgr.Instance:RayGetId(0,0)
            if floorRoleId > 0 then
                ---对比位置是否相同
                if self.dragRole.GameID == floorRoleId then
                else
                    ---不同执行交换
                    ---获取目标位置角色
                    local targetRole = nil
                    for i, role in pairs(BattleManager.AllRole) do
                        if role.GameID == floorRoleId then
                            targetRole = role
                        end
                    end
                    ---交换攻击顺序
                    local atkOrder = targetRole.AtkOrder
                    targetRole.AtkOrder = self.dragRole.AtkOrder
                    self.dragRole.AtkOrder = atkOrder
                    ---刷新攻击顺序
                    self.dragRole.myAni:SetOrder(self.dragRole.AtkOrder, self.dragRole.IsLeft, true)
                    targetRole.myAni:SetOrder(targetRole.AtkOrder, targetRole.IsLeft, true)
                    ---AllRole中的两者GameID和位置也要互换
                    local dragRoleGameID = self.dragRole.myAni.GameID
                    self.dragRole.myAni.GameID = targetRole.myAni.GameID
                    targetRole.myAni.GameID = dragRoleGameID

                    self.dragRole.GameID = targetRole.GameID
                    targetRole.GameID = dragRoleGameID

                    BattleManager.AllRole[self.dragRole.GameID] = self.dragRole
                    BattleManager.AllRole[targetRole.GameID] = targetRole

                    -----设置地板GameID
                    targetRole.myAni:XYSetPos2(targetRole.PosX, targetRole.PosY, targetRole.GameID, targetRole.Occupation)
                    self.dragRole.myAni:XYSetPos2(self.dragRole.PosX, self.dragRole.PosY, self.dragRole.GameID, self.dragRole.Occupation)
                end
            end
            if self.sortingType == 1 then
                ---刷新队列顺序
                self:ReloadOrder(true)
            elseif self.sortingType == 2 then
                BattleManager.Rank()
                ---给每个角色根据左右位置加动画
                for i, role in pairs(BattleManager.AllRole) do
                    role.myAni:SetOrder(role.AllAtkOrder,role.IsLeft, true)
                end
            end
            if self.dragRoleAtkOder ~= nil then
                local dragCanvas = self.dragRoleAtkOder:GetComponent("Canvas")
                dragCanvas.sortingOrder = dragCanvas.sortingOrder - 1
            end
        end
    end
    ---清空抓取池
    self.dragRole = nil
    self.ShowRoleId = nil
    self.dragRoleAtkOder = nil
    ---滑动屏幕模式关闭
    CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
end
---保存战斗阵型
function M:SaveFightTeam(teamIndex)
    ---@type FighterBase[] 创建服务器需要的阵型数据
    if next(BattleManager.AllRole) == nil then
        BattleManager.AllRole = self.beRemovedTeam
        self:LoadTeamRole(teamIndex)
        self.isChange = false
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("pvpready_ui_tips4"),2},true)
        return false
    end
    local fighters = {}
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---@type FighterBase
            local fighter = {}
            ---设置位置
            fighter.index = (6-role.PosX)*3 + 1*role.PosY
            ---设置id
            fighter.roleID = tonumber(role.ID)
            ---加入数据池
            fighters[role.AtkOrder] = fighter
        end
    end
    local allSupport = true
    for i,v in pairs(BattleManager.AllRole) do
        if v.Occupation ~= 4 then
            allSupport = false
            break
        end
    end
    if allSupport then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("battle_ui_tips3"),1},true)
        return false
    end
    ---保存战斗阵型
    TeamControl.ChangeTeamInfo(teamIndex,fighters)
    TeamControl.SendSaveTeamData({teamIndex},true,Handle(self,function()
        self:ReloadOrder(self.LineUpOrOrder == 2)
        self.isChange = false
        Event.Go("TeamChangeTip")
    end))
    CJNBattleMgr.Instance:RaygetIdOff(false)
    
    return true
end
---加载阵型
function M:LoadTeamRole(teamIndex,saveTeam)
    ---解除左侧队列角色
    self:ReMoveAllLeft()
    ---获取阵型数据
    local team = TeamControl.GetTeamData(teamIndex)
    local newTeam = clone(team)
    local haveSame = false
    local needSaveTeam = false
    ---如果队伍为空
    if #newTeam.info == 0 and teamIndex == 10005 then
        local teamStr = string.split(SteamLocalData.tab[104018][2],",")
        for i,v in pairs(teamStr) do
            newTeam.info[i] = {index = i, roleID = tonumber(teamStr[i])}
        end
        needSaveTeam = true
    end
    for i, v in ipairs(self.AllTeam) do
        if v ~= teamIndex and v ~= self.SaveTeamID then
            ---获取阵型数据
            local otherTeam = TeamControl.GetTeamData(v)
            --重复角色检测
            local checkTeam = function(roleid)
                for i, v in ipairs(newTeam.info) do
                    if v.roleID == roleid then
                        table.remove(newTeam.info, i)
                        haveSame = true
                        break
                    end
                end
            end
            for k, fighter in ipairs(otherTeam.info) do
                --重复角色检测
                checkTeam(fighter.roleID)
                ---从UI关卡英雄池中移除拖拽英雄数据
                PVPViewModel.RemoveHeroData(fighter.roleID)
            end
        end
    end
    if haveSame then
        MgrUI.Pop(UID.PopTip_UI,{ MgrLanguageData.GetLanguageByKey("errorcode_10020"),1 },true)
    end
    ---判断人数是不是已经超出限制
    local count = #newTeam.info
    if count > PVPViewModel.RoleLimit then
        for i = count, 1, -1 do
            if i > PVPViewModel.RoleLimit then
                table.remove(newTeam.info,i)
            else
                break
            end
        end
        ---保存本地队伍数据
        Event.Add("TeamChangeTip",Handle(self,self.TeamChangeTip))
    else
        Event.Remove("TeamChangeTip",Handle(self,self.TeamChangeTip))
    end
    if saveTeam or saveTeam == nil then
        TeamControl.ChangeTeamInfo(teamIndex,newTeam.info)
        TeamControl.SendSaveTeamData({teamIndex},false)
    end
    if needSaveTeam and #newTeam.info > 0 then
        self.isChange = true
    end

    if newTeam == nil then
        return
    end
    if newTeam.info == nil then
        return
    end
    for i, fighter in ipairs(newTeam.info) do
        ---创建立绘
        local role = self:GetOrCreatSpineRole(HeroControl.GetRoleDataByID(fighter.roleID),i ~= 1, 0.55)
        ---给role赋值攻击顺序
        BattleManager.LeftSetOrder(role)
        ---还原role透明度
        role.myAni:SetAlpha(1)
        local tempNum=fighter.index-1
        role.PosX = (5- math.floor(tempNum/3))+1
        role.PosY =(tempNum%3)+1
        ---更新目标地板信息
        BattleManager.ChessboardLeft[role.PosY][role.PosX] = role
        role.myAni:XYSetPos2(role.PosX, role.PosY, role.GameID, role.Occupation)
        ---添加到左侧队列
        BattleManager.LeftTeamAdd(role)
        ---飞行进场
        --role.myAni:UIFlayIn(0.55)
        ---从UI关卡英雄池中移除拖拽英雄数据
        PVPViewModel.RemoveHeroData(tonumber(role.ID))
    end
    ---刷新滑块UI
    self:ReloadSelectRole()
    ---更新所有队列图标
    self:ReloadOrder(self.LineUpOrOrder == 2)
    ---隐藏所有地板
    CJNBattleMgr.Instance:SetAllFloorHid()
    ---更新提示
    self:UpdateTips(1)
end
---移除左侧队列及角色
function M:ReMoveAllLeft(_isChange)
    local count = 0
    local newAllRole = {}
    self.beRemovedTeam = BattleManager.AllRole
    for i, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---将原阵列位置置为空
            BattleManager.ChessboardLeft[role.PosY][role.PosX] = 0
            role.myAni:XYSetPos2(role.PosX, role.PosY, 0, 0)
            ---将地板角色移除左侧队列
            BattleManager.LeftTemaReomve(role)
            ---删除地板角色
            GameObject.Destroy(role.myAni.gameObject)
            ---从UI关卡英雄池中添加地板英雄数据
            if _isChange then
                PVPViewModel.AddHeroData(tonumber(role.ID))
            end
            count = count + 1
        else
            newAllRole[i] = role
        end
    end
    BattleManager.AllRole ={}
    for i = 1, #newAllRole do
        table.insert(BattleManager.AllRole,newAllRole[i])
    end
    if count > 0 then
        ---重置左侧队列顺序
        BattleManager.LeftAtkOrderCout = 1
        ---隐藏所有地板
        CJNBattleMgr.Instance:SetAllFloorHid()
        ---刷新滑块UI
        if _isChange then
            self:ReloadSelectRole()
        end
    end
    self.Text_Tips().text = string.format(MgrLanguageData.GetLanguageByKey("novicebattle_ui_battlecharacter"),0,PVPViewModel.RoleLimit)
end
---重新加载排序图标
function M:ReloadOrder(isBig,onlyRight)
    for k, role in pairs(BattleManager.AllRole) do
        if role.IsLeft == true then
            ---加载左侧队列排序
            if onlyRight == nil or not onlyRight then
                role.myAni:SetOrder(role.AtkOrder, role.IsLeft, isBig)
            end
        else
            ---加载右侧队列排序
            role.myAni:SetOrder(role.AtkOrder, role.IsLeft, isBig)
        end
    end
end
---更新提示信息
function M:UpdateTips(type)
    if type == 1 then
        ---选取提示
        local count = 0
        for i, v in pairs(BattleManager.AllRole) do
            if v.IsLeft == true then
                count = count + 1
            end
        end
        self.Text_Tips().text = string.format(MgrLanguageData.GetLanguageByKey("novicebattle_ui_battlecharacter"),count,PVPViewModel.RoleLimit)
    end
end
---@param roleData RoleData 创建Spine
function M:GetOrCreatSpineRole(roleData, _NotInSound,_delay)
    ---创建spine
    local battleRole = BattleManager.CreartRoleLeft(roleData.id, roleData.skin, roleData.level, roleData.star,roleData:GetHeroSkillLevel(), roleData.awaken,nil,nil,nil,roleData.favor,roleData:CheckHeroEquipIsMax(),roleData.heroFlag,roleData.heroCurSkill)
    ---替换技能补丁
    local specialEquip = EquipControl.GetSingleSpecialEquip(roleData.id)
    if specialEquip then
        local skillIndex = specialEquip:GetAdvanceSkillNum()
        local advanceSkillStr = specialEquip:GetSpecialSkill()
        for _,str in pairs(advanceSkillStr) do
            ReadData.ReplaceSkill(str,battleRole,skillIndex)
        end
    end
    CBattleTools.CCreatUIGo(battleRole.AniName, battleRole.GameID, battleRole.Qzoom,(battleRole.SkinID == nil and battleRole.ID or battleRole.SkinID), function(myAni) battleRole.myAni = myAni end)
    ---创建战斗用角色数据
    if battleRole.Str_Audio ~= nil and battleRole.Str_Audio ~= "0" and not _NotInSound then
        local audioGroup = tonumber(battleRole.Str_Audio)
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == audioGroup and value[3] == 16 then
                battleRole.myAni.Audio_Dc=value[13]
                break
            end
        end
    end
    ---创建角色特效
    BattleRole.CreatEffFollowAni(battleRole,_NotInSound,_delay)
    BattleRole.SetFlyIn(battleRole,_delay)
    return battleRole
end
---显示/隐藏角色详细信息
function M:ShowRoleInfo(role,isRatio)
    self.CurRoleInfo = role
    ---若未抓取角色或在战斗中并关闭了UI则不显示
    if role == nil or BattleManager.IsFightStart then
        self.CurRoleInfo = nil
        self.Panel_RoleInfo:SetActive(false)
        self.Panel_Ready().gameObject:SetActive(true)
        CJNBattleMgr.Instance:RaygetIdOff(false)
    else
        self.Panel_RoleInfo:SetActive(true)
        CJNBattleMgr.Instance:CameraMoveOpenAndClose(false)
        ---获取角色数据
        local roleData = role
        if self.CurRoleInfo.myAni ~= nil and self.CurRoleInfo.myAni.IsWorldBoss then
            roleData = EventRaidControl.GetLIANHETAOFAData().BossData[1].monsterData
        end
        ---更新头像
        MgrRes.LoadQIcon(self.Icon_RIHead(),role.SkinID)
        ---更新边框
        MgrRes.LoadSprite(self.Icon_RIFrame(),roleData.iconBattleFrame)
        ---更新等级
        self.Text_RILevel().text = role.LV
        ---更新职业图标
        MgrRes.LoadSprite(self.Icon_RICareer(),roleData.iconCareer)
        ---更新星级
        for starLv = 1, #self.rIStarHl do
            local isStar = role.StartLV < starLv
            self.rIStarNor[starLv]:SetActive(not isStar)
            self.rIStarHl[starLv]:SetActive(not isStar)
            self.superStars[starLv]:SetActive(not isStar)
        end
        ---更新觉醒
        local isAwaken = false
        if role.IsAwaken then
            isAwaken = true
        else
            isAwaken = false
        end
        self.rIAwaken:SetActive(isAwaken)
        ---更新技能等级
        if role.ShowSkillLV > role.SkillLV and role.ShowSkillLV ~= 0 then
            self.Text_RIRank().text = (role.ShowSkillLV)
            self.Text_RIRank().color = Color(1,0.772549,0.2235294,1)
        else
            self.Text_RIRank().text = (role.SkillLV)
            self.Text_RIRank().color = Color(1,1,1,1)
        end
        ---更新角色名称
        self.Text_RIName().text = roleData.Name
        ---更新攻击距离
        if role.Occupation == 4 then
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/SupportRange/"..role.AttackRangeTexture)
        else
            MgrRes.LoadSprite(self.Fanwei(),"AtkRange/OtherRange/"..role.AttackRangeTexture)
        end
        ---攻击目标
        MgrRes.LoadSprite(self.Mubiao(),"AtkTarget/AtkTarget_" .. ((role.Attacktarget == 7 or role.Attacktarget == 8) and 4 or role.Attacktarget),nil,true)
        ---攻击目标的描述
        self:Text_Mubiaozi().text =  role.AtkTargetTips
        ---更新属性
        if role.Occupation == 4 then
            --- 支援型
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_2")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text15")
            self.Text_Atk2().text = (self.GetInfoCorrect(role.RealSuppart)).."%"
        else
            --- 非支援
            MgrRes.LoadSprite(self.AtkIcon(), "Attribute/GearInfoIcon_0")
            self.Text_Atk1().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text14")
            self.Text_Atk2().text = math.floor(role.RealAtk)
        end
        if tonumber(role.HP) >= 1000000 then
            self.Text_HP2().text = (self.GetMillionNumInfo(role.HP)).."M"
        else
            self.Text_HP2().text = math.floor(role.HP)
        end
        local tValue = isRatio and 1 or 10000
        self.Text_Def2().text = (self.GetInfoCorrect(role.RealDef)).."%"
        self.Text_Baoji2().text = (self.GetInfoCorrect(role.RealCrit/tValue)).."%"
        self.Text_Mingjie2().text = (self.GetInfoCorrect(role.RealAgile)).."%"
        self.Text_Baoshang2().text = (self.GetInfoCorrect(role.RealCritDmg/tValue)).."%"
    end
end
function M:CloseSkillXiangqing()
    self.Panel_Ready().gameObject:SetActive(true)
    CJNBattleMgr.Instance:RaygetIdOff(false)
end
---取整人物信息 百分比小数后一位
function M.GetInfoCorrect(_Data)
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data*1000)/1)
    tempData = tempInt1 / 10
    return tempData
end
---得到百万级数据的除以100W后精度到小数点后两位的值输出
function M.GetMillionNumInfo(_InputInfo)
    local _tempRateNum = _InputInfo/10000
    local _OutInfo = math.floor(_tempRateNum)/100
    return _OutInfo
end
function M:TeamChangeTip()
    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text119"),1},true)
end
---移动摄像机
function M:MoveCamera(type)
    UnityEngine.Debug.LogError(type)
    if type == 0 then
        ---PVP界面
        Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-100,100,-1200),1,0,15,false,0,0)
        self.battleCamera.transform.localRotation = Quaternion.Euler(6, 0, 0)
        self.battleCamera.fieldOfView = 23;
    elseif type == 1 then
        ---阵型设定
        Tools.DoCameraUIMove(self.battleCamera.transform,Vector3(-250,240,-1100),1,0,15,false,0,0)
        self.battleCamera.transform.localRotation = Quaternion.Euler(14, 0, 0)
        self.battleCamera.fieldOfView = 23;
    elseif type == 2 then
    elseif type == 3 then
    elseif type == 4 then
    end
end
---重置英雄池数据
function M:ResetTeam(_teamID)
    local tTeam = BuDoukaiControl.GetChangeTeamID()
    local OldTeam = TeamControl.GetTeamData(_teamID)
    
    local AddList = {}
    for i, roleID in ipairs(tTeam) do
        local isHave = false
        for k, v in ipairs(OldTeam.info) do
            if roleID == v.roleID then
                isHave = true
            end
        end
        if not isHave then
            table.insert(AddList, roleID)
        end
    end
    for i, roleID in ipairs(AddList) do
        ---从UI关卡英雄池中添加地板英雄数据
        PVPViewModel.AddHeroData(roleID)
    end
    --重置改变的阵型角色ID
    BuDoukaiControl.SetChangeTeamID()
end

function M:OnClose()
    MgrTimer.Cancel("ShowFloor")
    MgrTimer.Cancel("BattleUIUpdate")
    Event.CheckClear("Ready_RayOff")
end
return M
