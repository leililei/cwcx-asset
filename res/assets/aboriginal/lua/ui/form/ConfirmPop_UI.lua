-- Code Auto Create Begin
local M = Class('ConfirmPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ConfirmPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ConfirmPop_UI].prefab'
    self.Name = 'Form[ConfirmPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'SkipMapStyle_1','SkipMapStyle_1',2},{'SkipMapStyle_2','SkipMapStyle_2',2},{'dian_1','SkipMapStyle_2/RecievePanel/dian_1',2},{'Img_Sanjiaoxian1','SkipMapStyle_2/RecievePanel/dian_1/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','SkipMapStyle_2/RecievePanel/dian_1/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','SkipMapStyle_2/RecievePanel/dian_1/Img_Wangdianzuo',2},{'Img_Wangdianyou','SkipMapStyle_2/RecievePanel/dian_1/Img_Wangdianyou',2},{'RoleCardMask','SkipMapStyle_2/RecievePanel/RoleCardMask',2},{'RewardItem','SkipMapStyle_2/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',2},{'SkipMapStyle_3','SkipMapStyle_3',2},{'Zhuangshixian','SkipMapStyle_3/zhuangshixian/Zhuangshixian',2},{'Zhuangshixian(xia)2','SkipMapStyle_3/zhuangshixian/Zhuangshixian(xia)2',2},{'Zhuangshixian(shang)2','SkipMapStyle_3/zhuangshixian/Zhuangshixian(shang)2',2},{'Btn_Cancel','Btn_Cancel',2},{'Btn_Confirm','Btn_Confirm',2},
        -- UITemplate 列表
        {'RewardItem01','SkipMapStyle_2/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',10},
        -- RawImage 列表
        {'RewardsScroll','SkipMapStyle_2/RecievePanel/RoleCardMask/RewardsScroll',15},{'RewardsContent','SkipMapStyle_2/RecievePanel/RoleCardMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll01','SkipMapStyle_2/RecievePanel/RoleCardMask/RewardsScroll',18},
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
    self.styleObj = {
        [1] = self.SkipMapStyle_1().gameObject,
        [2] = self.SkipMapStyle_2().gameObject,
        [3] = self.SkipMapStyle_3().gameObject,
        [4] = self.SkipMapStyle_2().gameObject,
    }
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
    if not style or style > #self.styleObj or style < 1 then
        ---未指定风格或越界默认使用风格1
        style = 1
    end
    if style == 2 then
        style = 4
    elseif style == 3 then
        self.SkipText().color = Color(1,1,1,1)
        self.SkipText().fontSize = 40
    elseif style == 4 then
        self.Btn_Cancel().gameObject:SetActive(false)
        self.Btn_Confirm().transform.localPosition = Vector3(0, -98, 0)
    end
    ---更换风格
    for id, Obj in ipairs(self.styleObj) do
        Obj:SetActive(id == style)
    end
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
    Event.Go("WorldBossHpClose",false)
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
    Event.Go("WorldBossHpClose",true)
end
return M