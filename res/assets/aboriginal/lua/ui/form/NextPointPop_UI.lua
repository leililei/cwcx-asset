-- Code Auto Create Begin
local M = Class('NextPointPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NextPointPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NextPointPop_UI].prefab'
    self.Name = 'Form[NextPointPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'SkipMapStyle_2','SkipMapStyle_2',2},{'dian_1','SkipMapStyle_2/RecievePanel/dian_1',2},{'Img_Sanjiaoxian1','SkipMapStyle_2/RecievePanel/dian_1/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','SkipMapStyle_2/RecievePanel/dian_1/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','SkipMapStyle_2/RecievePanel/dian_1/Img_Wangdianzuo',2},{'Img_Wangdianyou','SkipMapStyle_2/RecievePanel/dian_1/Img_Wangdianyou',2},{'Btn_Cancel','Btn_Cancel',2},{'Btn_Confirm','Btn_Confirm',2},
        -- TextMeshProUGUI 列表
        {'Txt_Back','SkipMapStyle_2/RecievePanel/Txt_Back',20},{'Btn_Txt','Btn_Cancel/Btn_Txt',20},{'Btn_Txt01','Btn_Confirm/Btn_Txt',20},{'SkipText','SkipText',20},
    }
end
-- Code Auto Create End

---确认弹窗
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        if self.dontMaskClose then
            return
        end
        self:ClosePop()
    end)
    UIEvent.LuaClick(self.Btn_Cancel().gameObject,Handle(self,self.ClosePop))
end



function M:OnShow(pData)
    local text = pData[1]           ---文本
    local confirmFun = pData[2]     ---确认回调
    local confirmArgs = pData[3]    ---确认参数
    local style = pData[4]          ---风格
    local cancelFun = pData[5]      ---取消回调
    local cancelTxt = pData[6]      ---取消按钮文本
    local confirmTxt = pData[7]      ---确认按钮文本
    self.dontMaskClose = pData[8]     ---关闭遮罩点击
    self.cancelFun = pData[5]
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
    
    if cancelTxt then
        self.Btn_Txt().text = cancelTxt
    else
        self.Btn_Txt().text = MgrLanguageData.GetLanguageByKey("confirmpop_ui_cancel")
    end
    
    if confirmTxt then
        self.Btn_Txt01().text = confirmTxt
    else
        self.Btn_Txt01().text = MgrLanguageData.GetLanguageByKey("confirmpop_ui_confirm")
    end
end

function M:OnBackKey()

    if self.cancelFun then
        self.cancelFun()
    end
    self:ClosePop()
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

return M
