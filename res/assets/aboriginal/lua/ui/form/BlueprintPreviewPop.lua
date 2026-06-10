-- Code Auto Create Begin
local M = Class('BlueprintPreviewPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BlueprintPreviewPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BlueprintPreviewPop].prefab'
    self.Name = 'Form[BlueprintPreviewPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'RoleInfoPreview','RoleInfoPreview',2},{'ClickBackArea','RoleInfoPreview/ClickBackArea',2},{'ClickBackAreaMask','RoleInfoPreview/ClickBackAreaMask',2},{'Img_Tanchuangdi','RoleInfoPreview/Img_Tanchuangdi',2},{'Img_Xian1','RoleInfoPreview/Img_Xian1',2},{'Img_Xian2','RoleInfoPreview/Img_Xian2',2},{'BlueprintPanel','RoleInfoPreview/BlueprintPanel',2},{'ScrollTotalProp','RoleInfoPreview/BlueprintPanel/ScrollTotalProp',2},{'biaotixian','RoleInfoPreview/biaotixian',2},{'ImgBlueprintTitle','RoleInfoPreview/ImgBlueprintTitle',2},
        -- UITemplate 列表
        {'BlueprintTotalPropItem','RoleInfoPreview/BlueprintPanel/ScrollTotalProp/BlueprintTotalPropItem',10},
        -- LoopScrollRect 列表
        {'ScrollTotalProp01','RoleInfoPreview/BlueprintPanel/ScrollTotalProp',18},
        -- TextMeshProUGUI 列表
        {'TextTitle','RoleInfoPreview/ImgBlueprintTitle/TextTitle',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击周边
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
    self.ScrollTotalProp01():SetLuaCellEvent(Handle(self, self.OnTotalPropItemRender));
end

function M:OnTotalPropItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.m_totalProps[idx], idx});
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(args)
    self.m_totalProps = args[1];
    self.ScrollTotalProp01().totalCount = #self.m_totalProps;
    self.ScrollTotalProp01():RefillCells();
end



function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("SliderListen")
end
return M
