-- Code Auto Create Begin
local M = Class('AreaList_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.AreaList_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[AreaList_UI].prefab'
    self.Name = 'Form[AreaList_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Bg','Img_Bg',2},{'Img_Fg','Img_Bg/Img_Fg',2},{'AreaContent','Img_Bg/Img_Fg/AreaScroll/AreaContent',2},{'AreaItem','Img_Bg/Img_Fg/AreaScroll/AreaItem',2},{'Btn_Verify','Img_Bg/Btn_Verify',2},
        -- UITemplate 列表
        {'AreaItem01','Img_Bg/Img_Fg/AreaScroll/AreaItem',10},
        -- Toggle 列表
        {'AreaItem02','Img_Bg/Img_Fg/AreaScroll/AreaItem',13},
        -- LoopScrollRect 列表
        {'AreaScroll','Img_Bg/Img_Fg/AreaScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title','Img_Bg/Text_Title',20},{'Text','Img_Bg/Btn_Verify/Text',20},
    }
end
-- Code Auto Create End
local CheckServerTimer = "AreaList_UI.CheckServer";

function M:OnInit()
    Event.Add("AreaSelect", Handle(self, self.OnAreaSelect));
    UIEvent.LuaClick(self.BlurMask().gameObject, Handle(self,self.OnBtnCloseClicked));
    UIEvent.LuaClick(self.Btn_Verify().gameObject, Handle(self,self.OnBtnVerifyClicked));
    self.OldAreaIdx = MgrNet.CS:GetAreaIdx();
    self.CurAreaIdx = self.OldAreaIdx;
    if (-1 == self.CurAreaIdx) then
        self.CurAreaIdx = 0;
        MgrNet.CS:SetAreaIdx(0);
    end
    self.AreaScroll():SetLuaCellEvent(Handle(self, self.OnAreaScrollRender));
    self.AreaScroll().totalCount = MgrNet.CS:GetAreaNameList().Count;
    self.AreaScroll():RefillCells();
end

function M:OnClose()
    Event.Remove("AreaSelect", Handle(self, self.OnAreaSelect));
    MgrTimer.Cancel(CheckServerTimer);
end

function M:OnBtnCloseClicked()
    if (-1 == self.OldAreaIdx) then
        self:OnBtnVerifyClicked();
        return;
    end
    MgrUI.ClosePop(self.Uid);
end

function M:OnBtnVerifyClicked()
    MgrNet.CS:SetAreaIdx(self.CurAreaIdx);
    if (CS.RequestState.Ready == MgrNet.CS:GetServerState()) then
        if (self.OldAreaIdx ~= MgrNet.CS:GetAreaIdx()) then
            Event.Go("ServerReady");
        end
        MgrUI.ClosePop(self.Uid);
    else
        self:ReqServer();
    end
end

function M:OnAreaScrollRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ idx })
end

function M:ReqServer()
    MgrUI.Pop(UID.PartLoading_UI,nil,true);
    MgrNet.CS:ReqServer();
    self:CheckServer();
end

function M:CheckServer()
    local state = MgrNet.CS:GetServerState();
    if CS.RequestState.Ready == state then
        MgrUI.PopHide(UID.PartLoading_UI);
        Event.Go("ServerReady");
        MgrUI.ClosePop(self.Uid);
        return;
    end
    if CS.RequestState.Error == state then
        MgrUI.PopHide(UID.PartLoading_UI);
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("downloadpanel_tips2"), 3},true);
        return;
    end
    ---晚点再检查
    MgrTimer.Cancel(CheckServerTimer);
    MgrTimer.AddDelay(CheckServerTimer,0.2, Handle(self, self.CheckServer));
end

function M:OnAreaSelect(idx)
    self.CurAreaIdx = idx;
end

return M