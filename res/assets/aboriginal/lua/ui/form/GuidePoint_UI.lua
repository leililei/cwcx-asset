-- Code Auto Create Begin
local M = Class('GuidePoint_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.GuidePoint_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[GuidePoint_UI].prefab'
    self.Name = 'Form[GuidePoint_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'quan(1)','Img_BG/Ui_TX_0017/root (1)/quan (1)',2},{'quan(2)','Img_BG/Ui_TX_0017/root (1)/quan (2)',2},{'quan(3)','Img_BG/Ui_TX_0017/root (1)/quan (3)',2},{'quan(4)','Img_BG/Ui_TX_0017/root (1)/quan (4)',2},{'quan(5)','Img_BG/Ui_TX_0017/root (1)/quan (5)',2},{'quan','Img_BG/Ui_TX_0017/root (1)/quan',2},{'quan(6)','Img_BG/Ui_TX_0017/root (1)/quan (6)',2},{'di','Img_BG/Ui_TX_0017/root (1)/di',2},{'Img_Heidi(zuo)','Panel/Img_Heidi(zuo)',2},{'Img_Xian2','Panel/Panel_Left/Img_Xian2',2},{'VFXMask','Panel/Panel_Left/VFXMask',2},{'GuideScroll','Panel/Panel_Left/VFXMask/GuideScroll',2},{'Img_Guankadi(xz)','Panel/Panel_Left/VFXMask/GuideScroll/GuideSelect/Img_Guankadi(xz)',2},{'Img_Objective(bai)','Panel/Panel_Left/VFXMask/GuideScroll/GuideSelect/Img_Objective(bai)',2},{'Img_Zhidaoicon(xz)','Panel/Panel_Left/VFXMask/GuideScroll/GuideSelect/Img_Zhidaoicon(xz)',2},{'Img_Xian1','Panel/Panel_Left/Img_Xian1',2},{'Panel_Right','Panel/Panel_Right',2},{'Img_Xian3','Panel/Panel_Right/Img_Xian3',2},{'Img_Mubiaodi','Panel/Panel_Right/Img_Mubiaodi',2},{'Img_InfoIcon','Panel/Panel_Right/Img_InfoIcon',2},{'Img_Biaotixian','Panel/Panel_Right/Text_Tishi/Img_Biaotixian',2},{'Img_Xian4','Panel/Panel_Right/Img_Xian4',2},{'Btn_OpenFight','Panel/Panel_Right/Btn_OpenFight',2},{'Btn_GoMenu','Panel/UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','Panel/UpperLeftPanel/Btn_Back',2},{'Btn_I','Panel/UpperLeftPanel/Btn_I',2},{'Img_Fengexian','Panel/UpperLeftPanel/Img_Fengexian',2},
        -- UITemplate 列表
        {'GuidePointItem','Panel/Panel_Left/VFXMask/GuideScroll/GuidePointItem',10},
        -- RawImage 列表
        {'GuideContent','Panel/Panel_Left/VFXMask/GuideScroll/GuideContent',15},{'GuideSelect','Panel/Panel_Left/VFXMask/GuideScroll/GuideSelect',15},{'GuidePointItem01','Panel/Panel_Left/VFXMask/GuideScroll/GuidePointItem',15},
        -- LoopScrollRect 列表
        {'GuideScroll01','Panel/Panel_Left/VFXMask/GuideScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_SelectCont','Panel/Panel_Left/VFXMask/GuideScroll/GuideSelect/Text_SelectCont',20},{'Text_InfoName','Panel/Panel_Right/Text_InfoName',20},{'Text_InfoTitle','Panel/Panel_Right/Img_Mubiaodi/Text_InfoTitle',20},{'Text_InfoDes1','Panel/Panel_Right/Text_InfoDes1',20},{'Text_Tishi','Panel/Panel_Right/Text_Tishi',20},{'Text_InfoDes2','Panel/Panel_Right/Text_InfoDes2',20},{'Text_Zuozhanzhunbei','Panel/Panel_Right/Btn_OpenFight/Text_Zuozhanzhunbei',20},{'Text_Title','Panel/UpperLeftPanel/Text_Title',20},{'Text_TitleEn','Panel/UpperLeftPanel/Text_TitleEn',20},
    }
end
-- Code Auto Create End
---战术指导初始化
function M:OnInit()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        HelpViewModel.Go(95)
    end))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    UIEvent.LuaClick(self.Btn_OpenFight().gameObject,Handle(self,self.OnJoinClick))
    ---获取高亮块uiTemplate中使用
    self.guideSelect = self.GuideSelect().transform
    self.text_SelectCont = self.Text_SelectCont()
    ---注册滑块
    self.pointList = StormViewModel.GetStormGuidePointData()
    --如果当前选择的战术指导关卡已存在
    if StormViewModel.CurChooseGuide then
        StormViewModel.CurPointData = StormViewModel.CurChooseGuide
    else
        StormViewModel.CurPointData = self.pointList[1]
        StormViewModel.CurChooseGuide = self.pointList[1]
    end
    self.GuideScroll01():SetLuaCellEvent(Handle(self,self.CellItem))

end

function M:OnShowFinish()
    NoviceViewModel.CheckCurID(21704,function()
        NoviceViewModel.DoNext()
    end)
    ---第一次进入页面引导
    NoviceViewModel.CheckFirstGuide(51)
end

---进入战斗界面按钮(战术指导 作战准备)
function M:OnJoinClick()
    BattleManager.GameMode = BattleManager.GameModeType.Guide  --战术指导
    StormViewModel.OpenStormPlotUI(StormViewModel.PointType.guide)
    StormViewModel.CurChooseGuide = StormControl.CheckPointPass(StormViewModel.CurPointData.id,StormViewModel.CurPointData.pointType) and StormViewModel.CurPointData or nil
end
---战术指导刷新
function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113020][2],0.2)
    self:ReloadView()
    ---指向选择的关卡
    local offset = 1
    if StormViewModel.CurPointData ~= nil then
        for i, v in ipairs(self.pointList) do
            if v.id == StormViewModel.CurPointData.id then
                offset = i
                break
            end
        end
    end
    if offset == #self.pointList then
        self.GuideScroll01():RefillCellsFromEnd()
    else
        self.GuideScroll01():RefillCells(offset - 1)
    end
    self:ReloadInfo()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        StormViewModel.CurPointData = nil
        MgrUI.GoBack()
    end
end

---关卡左侧滑块回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.pointList[idx],self})
end
---滑块刷新
function M:ReloadView()
    ---刷新滑块
    self.pointList = StormViewModel.GetStormGuidePointData()
    self.GuideScroll01().totalCount = #self.pointList
    self.GuideScroll01():RefillCells(0)
end
---右侧面板刷新
function M:ReloadInfo()
    local data = StormViewModel.CurPointData
    if data == nil then
        return
    end
    self.Text_InfoName().text = string.format("%s <color=#FF731E>%s</color>",data.guideIndex,data.idxName)
    self.Text_InfoTitle().text = data.guideName
    local path = MgrRes.GetLocalizedName(data.guideIcon)
    MgrRes.LoadSprite(self.Img_InfoIcon(),path,nil,false)
    self.Text_InfoDes1().text = data.drama
    self.Text_InfoDes2().text = data.tips
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
return M