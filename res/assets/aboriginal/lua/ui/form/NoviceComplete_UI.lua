-- Code Auto Create Begin
local M = Class('NoviceComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoviceComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoviceComplete_UI].prefab'
    self.Name = 'Form[NoviceComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 0
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'jingyantiao','jingyantiao',2},{'Img_Silder','jingyantiao/Img_Silder',2},{'Img_Sanjiao','Text_OffsetExp/Img_Sanjiao',2},{'Img_LVdi','Img_LVdi',2},{'Img_Huoshengfangshi','Img_Huoshengfangshi',2},{'Img_Dian','Img_Huoshengfangshi/Img_Dian',2},{'Img_Heidi','Img_Huoshengfangshi/Img_Heidi',2},{'Img_StarTask1','Img_StarTask1',2},{'Img_Tiaojian(hui)','Img_StarTask1/Img_Tiaojian(hui)',2},{'StarTaskHL1','Img_StarTask1/StarTaskHL1',2},{'Img_StarTask2','Img_StarTask2',2},{'Img_Tiaojian(hui)01','Img_StarTask2/Img_Tiaojian(hui)',2},{'StarTaskHL2','Img_StarTask2/StarTaskHL2',2},{'Img_StarTask3','Img_StarTask3',2},{'Img_Tiaojian(hui)02','Img_StarTask3/Img_Tiaojian(hui)',2},{'StarTaskHL3','Img_StarTask3/StarTaskHL3',2},{'Img_RoleTitle','Img_RoleTitle',2},{'Img_RewardTitle','Img_RewardTitle',2},{'RankKuangImg','RankKuangImg',2},{'Zhuangshixian(jiesuan)2','Zhuangshixian(jiesuan)2',2},{'Zhuangshixian(xia)2','Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)2','Zhuangshixian(shang)2',2},{'Img_Dian01','FightResult/Img_Dian',2},{'Img_Heidi01','FightResult/Img_Heidi',2},{'Img_Yinying','FightResult/Img_Yinying',2},{'Img_Fanhuizhuyedi','Btns/Btn_BackHome/Img_Fanhuizhuyedi',2},{'Img_Text_Xiagequyudi','Btns/Btn_NextBattle/Img_Text_Xiagequyudi',2},
        -- Button 列表
        {'Btn_BackHome','Btns/Btn_BackHome',4},{'Btn_NextBattle','Btns/Btn_NextBattle',4},
        -- UITemplate 列表
        {'AccountRoleItem','AccountRoleItem',10},
        -- RawImage 列表
        {'RoleContent','RoleContent',15},{'Btn_BackHome01','Btns/Btn_BackHome',15},{'Btn_NextBattle01','Btns/Btn_NextBattle',15},
        -- TextMeshProUGUI 列表
        {'Text_OffsetExp','Text_OffsetExp',20},{'Text_EXP','Text_EXP',20},{'Text_Level','Img_LVdi/Text_Level',20},{'Text_Name','Text_Name',20},{'Text_Huoshengfangshi','Img_Huoshengfangshi/Text_Huoshengfangshi',20},{'Text_Jibai','Img_Huoshengfangshi/Text_Jibai',20},{'Text_StarTask1','Img_StarTask1/Text_StarTask1',20},{'Text_StarTask2','Img_StarTask2/Text_StarTask2',20},{'Text_StarTask3','Img_StarTask3/Text_StarTask3',20},{'Text_Juesechengzhang','Img_RoleTitle/Text_Juesechengzhang',20},{'Text_Zhandoujiangli','Img_RewardTitle/Text_Zhandoujiangli',20},{'Text_FightResult','FightResult/Text_FightResult',20},{'Text_Fanhuizhuye','Btns/Btn_BackHome/Text_Fanhuizhuye',20},{'Text_Xiagequyu','Btns/Btn_NextBattle/Text_Xiagequyu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    StormViewModel.HideRoleUI()
    self.Btn_BackHome().gameObject:SetActive(false)
end

function M:OnShow(pData)
    ---更新挑战显示
    if NoviceViewModel.CheckCurID(50712) then
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_fail")
        MgrSound.PlayBGM("Battle-lose",0.2,nil,true)
    else
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_victory")
        MgrSound.PlayBGM("Battle-win",0.2,nil,true)
    end

    local id = pData[1]
    local HeroList = {}
    local pointData =  StormControl.GetStormPointByID(id)
    if pointData ~= nil then
        HeroList = pointData.roles
        self.offsetExp = 0
        ---生成英雄
        for i, v in pairs(HeroList) do
            ---创建角色头像
            local uiTp = GameObject.Instantiate(self.AccountRoleItem(),self.RoleContent().transform,false)
            uiTp:SetData({v,0,0,0})
        end
    end
    NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
    ---完成战斗
    NoviceViewModel.NoviceBattleEnd = false

    ---点击下一步
    UIEvent.LuaClick(self.Btn_NextBattle().gameObject,function()
        if NoviceViewModel.CheckCurID(50712) then
            NoviceViewModel.DoNext()
        else
            ---返回选关
            StormViewModel.CurPointType = StormViewModel.PointType.main
            MgrUI.ClosePop(self.Uid)
            MgrBattle.CloseFight()
        end
    end)

    UIEvent.LuaClick(self.Btn_BackHome().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        MgrBattle.CloseFight()
        StormViewModel.CurPointType = StormViewModel.PointType.main
    end)
end
return M