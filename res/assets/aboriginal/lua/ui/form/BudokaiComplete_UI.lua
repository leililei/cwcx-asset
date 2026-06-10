-- Code Auto Create Begin
local M = Class('BudokaiComplete_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BudokaiComplete_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BudokaiComplete_UI].prefab'
    self.Name = 'Form[BudokaiComplete_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'ReturnBg','ReturnBg',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Zhuangshixian(jiesuan)2','Zhuangshixian(jiesuan)2',2},{'Zhuangshixian(xia)2','Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)2','Zhuangshixian(shang)2',2},{'Btn_Confirm','Btn_Confirm',2},{'Img_Quedingdi','Btn_Confirm/Img_Quedingdi',2},{'Btn_CheckInfo1','Btn_CheckInfo1',2},{'Img_Chakanxiangqingdi','Btn_CheckInfo1/Img_Chakanxiangqingdi',2},{'Img_Xiangqingicon','Btn_CheckInfo1/Img_Xiangqingicon',2},{'Btn_CheckInfo2','Btn_CheckInfo2',2},{'Img_Chakanxiangqingdi01','Btn_CheckInfo2/Img_Chakanxiangqingdi',2},{'Img_Xiangqingicon01','Btn_CheckInfo2/Img_Xiangqingicon',2},{'Img_Huizhandi','Huizhan1/Img_Huizhandi',2},{'Img_Huizhandi01','Huizhan2/Img_Huizhandi',2},{'Img_Huizhandi02','Zongfen/Img_Huizhandi',2},{'Img_Huoshengfangshi','Img_Huoshengfangshi',2},{'Img_Dian','Img_Huoshengfangshi/Img_Dian',2},{'Img_Heidi','Img_Huoshengfangshi/Img_Heidi',2},{'Img_Fangshoudi','Def/Img_Fangshoudi',2},{'Img_Jinggongdi','Atk/Img_Jinggongdi',2},{'Img_Dian01','FightResult/Img_Dian',2},{'Img_Heidi01','FightResult/Img_Heidi',2},{'Img_Yinying','FightResult/Img_Yinying',2},
        -- TextMeshProUGUI 列表
        {'Text_Queding','Btn_Confirm/Text_Queding',20},{'Text_Chakanxiangqing','Btn_CheckInfo1/Text_Chakanxiangqing',20},{'Text_Chakanxiangqing01','Btn_CheckInfo2/Text_Chakanxiangqing',20},{'Text_Huizhan','Huizhan1/Text_Huizhan',20},{'Text_OwnPart1','Huizhan1/Text_OwnPart1',20},{'Text_TargetPart1','Huizhan1/Text_TargetPart1',20},{'Text_Huizhan01','Huizhan2/Text_Huizhan',20},{'Text_OwnPart2','Huizhan2/Text_OwnPart2',20},{'Text_TargetPart2','Huizhan2/Text_TargetPart2',20},{'Text_Huizhan02','Zongfen/Text_Huizhan',20},{'Text_OwnPoint','Zongfen/Text_OwnPoint',20},{'Text_TargetPoint','Zongfen/Text_TargetPoint',20},{'Text_Huoshengfangshi','Img_Huoshengfangshi/Text_Huoshengfangshi',20},{'Text_Jibai','Img_Huoshengfangshi/Text_Jibai',20},{'Text_DefFailOrV','Def/Text_DefFailOrV',20},{'Text_DefName','Def/Text_DefName',20},{'Text_Fangshoufang','Def/Text_Fangshoufang',20},{'Text_VS','Text_VS',20},{'Text_Jinggongfang','Atk/Text_Jinggongfang',20},{'Text_AtkFailOrV','Atk/Text_AtkFailOrV',20},{'Text_AtkName','Atk/Text_AtkName',20},{'Text_FightResult','FightResult/Text_FightResult',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        self:OnBackKey()
    end)
    --第一回战斗详情
    UIEvent.LuaClick(self.Btn_CheckInfo1().gameObject,function()
        BuDoukaiControl.SetCurAtkOrDef(true)
        BuDoukaiControl.PlayBackData(self.zhanBaoData.firstToken)
    end)
    --第二回战斗详情
    UIEvent.LuaClick(self.Btn_CheckInfo2().gameObject,function()
        BuDoukaiControl.SetCurAtkOrDef(false)
        BuDoukaiControl.PlayBackData(self.zhanBaoData.secondToken)
    end)
end

function M:OnShow(pData)
    self.zhanBaoData = pData
    ---战斗结果 2胜利 1失败 0平局
    if self.zhanBaoData.result == 2 then
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_victory")
        self.Text_AtkFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text66")
        self.Text_DefFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text52")
    elseif self.zhanBaoData.result == 1 then
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("novicecomplete_ui_fail")
        self.Text_AtkFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text52")
        self.Text_DefFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_shejiao_text66")
    else
        self.Text_FightResult().text = MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text9")
        self.Text_AtkFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text12")
        self.Text_DefFailOrV().text = MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text12")
    end
    ---己方昵称
    self.Text_AtkName().text = self.zhanBaoData.selfName
    ---对方昵称
    self.Text_DefName().text = self.zhanBaoData.otherName
    --己方战绩
    self.Text_OwnPart1().text = self.zhanBaoData.atkScore[1]
    self.Text_OwnPart2().text = self.zhanBaoData.atkScore[2]
    self.Text_OwnPoint().text = self.zhanBaoData.atkScore[3]
    --对方战绩
    self.Text_TargetPart1().text = self.zhanBaoData.defScore[1]
    self.Text_TargetPart2().text = self.zhanBaoData.defScore[2]
    self.Text_TargetPoint().text = self.zhanBaoData.defScore[3]
end

function M:OnClose()
end

function M:OnBackKey()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(UID.BudokaiComplete_UI)
    if MgrUI.GetCurUI().Uid ~= UID.WudaohuiPVP_UI then
        MgrBattle.CloseFight()
    end
end
return M