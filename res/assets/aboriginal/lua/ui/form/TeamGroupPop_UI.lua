-- Code Auto Create Begin
local M = Class('TeamGroupPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.TeamGroupPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[TeamGroupPop_UI].prefab'
    self.Name = 'Form[TeamGroupPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'dian','dian',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Img_Tanchuangdi','Img_Tanchuangdi',2},{'Img_Toumingdi','Img_Tanchuangdi/Img_Toumingdi',2},{'Img_Biaotixian','Img_Tanchuangdi/Img_Biaotixian',2},{'Tog_Read','Img_Tanchuangdi/Tog_Read',2},{'Img_hl','Img_Tanchuangdi/Tog_Read/Img_hl',2},{'Tog_Save','Img_Tanchuangdi/Tog_Save',2},{'Img_hl01','Img_Tanchuangdi/Tog_Save/Img_hl',2},
        -- UITemplate 列表
        {'TeamPopItem','Img_Tanchuangdi/TeamScroll/TeamPopItem',10},
        -- Toggle 列表
        {'Tog_Read01','Img_Tanchuangdi/Tog_Read',13},{'Tog_Save01','Img_Tanchuangdi/Tog_Save',13},
        -- RawImage 列表
        {'TeamScroll','Img_Tanchuangdi/TeamScroll',15},
        -- LoopScrollRect 列表
        {'TeamScroll01','Img_Tanchuangdi/TeamScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Biaoti','Img_Tanchuangdi/Text_Biaoti',20},{'Text_Duqu1','Img_Tanchuangdi/Tog_Read/Text_Duqu1',20},{'Text_Duqu101','Img_Tanchuangdi/Tog_Save/Text_Duqu1',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---取消/关闭
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    --UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self,self.ClosePop))
    ---读取切页
    Tools.ToggleValueChange(self.Tog_Read01(),function(isOn)
        if isOn then
            self.curType = 1
            self:ResetView()
            self.Text_Duqu1().color = Color(1,1,1,1)
            self.Text_Duqu101().color = Color(0,0,0,1)
        end
    end,nil)
    ---存储切页
    Tools.ToggleValueChange(self.Tog_Save01(),function(isOn)
        if isOn then
            self.curType = 2
            self:ResetView()
            self.Text_Duqu1().color = Color(0,0,0,1)
            self.Text_Duqu101().color = Color(1,1,1,1)
        end
    end,nil)
    ---阵型滑块注册
    self.TeamScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
end

---参数1：当前阵型，参数2：返回回调, 参数3：加载阵型（阵型索引）
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    ---@type FighterBase[] 当前的阵型
    self.pData = args[1]
    ---回调1
    self.callback = args[2]
    ---读取阵型回调(阵型索引)
    self.readCell = args[3]
    ---类型1：读取，类型2：存储
    self.curType = self.Tog_Read01().isOn and 1 or 2
    if args[4] then
        self.isPVP = args[4]
    else
        self.isPVP = false
    end
    ---刷新阵型滑块
    self:ResetView()
    Event.Go("WorldBossHpClose",false)
end

---Role loop回调
function M:CellItem(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.TeamList[idx],self,self.isPVP})
end

---Role 刷新
function M:ResetView()
    self.TeamList = TeamControl.GetNormalAllTeamData()
    self.TeamScroll01().totalCount = #self.TeamList
    if self.resetOnce == nil then
        self.TeamScroll01():RefillCells(0)
        self.resetOnce = true
    else
        self.TeamScroll01():RefreshCells()
    end
end

function M:ReadTeam(idx)
    if self.readCell then
        self.readCell(idx)
    end
    self:ClosePop()
end

function M:ClosePop()
    Event.Go("WorldBossHpClose",true)
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
    if self.callback then
        self.callback()
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        self:ClosePop()
    end
end
return M