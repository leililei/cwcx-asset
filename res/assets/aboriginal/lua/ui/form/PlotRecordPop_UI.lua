-- Code Auto Create Begin
local M = Class('PlotRecordPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlotRecordPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlotRecordPop_UI].prefab'
    self.Name = 'Form[PlotRecordPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Zhuangshixian(xia)1','zhuangshixian/Zhuangshixian(xia)1',2},{'Zhuangshixian(shang)1','zhuangshixian/Zhuangshixian(shang)1',2},{'Zhuangshixian(you)','zhuangshixian/Zhuangshixian(you)',2},{'Zhuangshixian(zuo)','zhuangshixian/Zhuangshixian(zuo)',2},{'Panel','Panel',2},{'Img_Toumingdi','Panel/Img_Toumingdi',2},{'Img_Xian2','Panel/Img_Xian2',2},{'Img_Xian1','Panel/Img_Xian1',2},{'Btn_Back','Panel/Btn_Back',2},{'Img_Fanhuidi','Panel/Btn_Back/Img_Fanhuidi',2},{'RecordScroll','Panel/RecordScroll',2},{'Content','Panel/RecordScroll/Content',2},{'Scrollbar','Panel/RecordScroll/Scrollbar',2},{'Handle','Panel/RecordScroll/Scrollbar/Sliding/Handle',2},
        -- UITemplate 列表
        {'PlotRecordItem','Panel/RecordScroll/PlotRecordItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Fanhui','Panel/Btn_Back/Text_Fanhui',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
    self.content = self.Content().transform
    self.plotItem = self.PlotRecordItem()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(args)
    ---剧情plot
    self.pData = args[1]
    self.parent = args[2]
    Global.Sort(self.pData, { "layer" },false)

    for i, v in ipairs(self.pData) do
        local temp = GameObject.Instantiate(self.plotItem,self.content,false)
        temp:SetData({v,self})
    end
    ---强制刷新布局
    Tools.ReSize(self.content.gameObject)
    self.RecordScroll().transform:GetComponent("ScrollRect").verticalNormalizedPosition = 0
end
--- 关闭界面触发
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrSound.Stop(5,"PlotRecord",true)
end
return M