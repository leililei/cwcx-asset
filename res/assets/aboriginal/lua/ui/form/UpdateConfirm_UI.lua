-- Code Auto Create Begin
local M = Class('UpdateConfirm_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.UpdateConfirm_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[UpdateConfirm_UI].prefab'
    self.Name = 'Form[UpdateConfirm_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'SkipMapStyle_2','SkipMapStyle_2',2},{'Img_Sanjiaoxian1','SkipMapStyle_2/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','SkipMapStyle_2/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','SkipMapStyle_2/Img_Wangdianzuo',2},{'Img_Wangdianyou','SkipMapStyle_2/Img_Wangdianyou',2},{'Btn_Cancel','Btn_Cancel',2},{'Btn_Confirm','Btn_Confirm',2},
        -- TextMeshProUGUI 列表
        {'Btn_Txt','Btn_Cancel/Btn_Txt',20},{'Btn_Txt01','Btn_Confirm/Btn_Txt',20},{'SkipText','SkipText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
end
function M:OnShow(pData)
    local text = pData[1]           ---文本
    local confirmFun = pData[2]     ---确认回调
    local confirmArgs = pData[3]    ---确认参数
    local cancelFun = pData[4]      ---取消回调
    ---更换文本
    self.SkipText().text = text
    ---绑定确认事件
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        confirmFun(confirmArgs)
        self:ClosePop()
    end)
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,function()
        if cancelFun then
            cancelFun()
        end
        self:ClosePop()
    end)
end
function M:ClosePop()
    MgrUI.PopHide(self.Uid)
end
return M