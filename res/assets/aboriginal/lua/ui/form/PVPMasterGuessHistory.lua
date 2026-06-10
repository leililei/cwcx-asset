-- Code Auto Create Begin
local M = Class('PVPMasterGuessHistory', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPMasterGuessHistory
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPMasterGuessHistory].prefab'
    self.Name = 'Form[PVPMasterGuessHistory]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','Ani/BlurBg',2},{'Img_Xian1','Ani/Img_Xian1',2},{'Img_Xian2','Ani/Img_Xian2',2},{'Img_Tanchuangdi','Ani/Img_Tanchuangdi',2},{'Img_Toumingdi','Ani/Img_Tanchuangdi/Img_Toumingdi',2},{'Img_Biaotixian','Ani/Img_Tanchuangdi/Img_Biaotixian',2},{'Ticket','Ani/Img_Tanchuangdi/Ticket',2},{'ImgTicketBg','Ani/Img_Tanchuangdi/Ticket/ImgTicketBg',2},{'ImgTicket','Ani/Img_Tanchuangdi/Ticket/ImgTicket',2},{'VFXMask','Ani/Img_Tanchuangdi/VFXMask',2},
        -- UITemplate 列表
        {'PVPMasterGuessItem','Ani/Img_Tanchuangdi/VFXMask/RewardScroll/PVPMasterGuessItem',10},
        -- RawImage 列表
        {'RewardScroll','Ani/Img_Tanchuangdi/VFXMask/RewardScroll',15},
        -- LoopScrollRect 列表
        {'RewardScroll01','Ani/Img_Tanchuangdi/VFXMask/RewardScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Biaoti','Ani/Img_Tanchuangdi/Text_Biaoti',20},{'TextTicket','Ani/Img_Tanchuangdi/Ticket/TextTicket',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---退出
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self, function ()
        MgrUI.ClosePop(self.Uid);
    end))
    Event.Add("BackKey", Handle(self, self.OnBackKey));
    self.RewardScroll01():SetLuaCellEvent(Handle(self, self.CellItem));
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

function M:OnShow(data)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false);
    self.TextTicket().text = PVPViewModel.MasterTicketLeft;
    if nil == PVPViewModel.MasterGuessHistory then
        return;
    end
    self.CurLoopList = PVPViewModel.MasterGuessHistory;
    --设置总数
    self.RewardScroll01().totalCount = #self.CurLoopList
    if offset then
        self.RewardScroll01():RefillCells(0)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.RewardScroll01():RefreshCells()               ---只刷新数据
    end
end
---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],idx,self})
end
function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        MgrUI.ClosePop(self.Uid)
    end
end
return M