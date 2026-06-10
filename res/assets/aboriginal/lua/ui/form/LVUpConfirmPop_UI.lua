-- Code Auto Create Begin
local M = Class('LVUpConfirmPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.LVUpConfirmPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[LVUpConfirmPop_UI].prefab'
    self.Name = 'Form[LVUpConfirmPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurBg','BlurBg',2},{'Img_bg','PopPanel/Img_bg',2},{'Img_Xian2','PopPanel/Img_Xian2',2},{'Img_Xian1','PopPanel/Img_Xian1',2},{'Btn_Confirm','PopPanel/Btn_Confirm',2},{'Img_Quedingdi','PopPanel/Btn_Confirm/Img_Quedingdi',2},{'Btu_Cancel','PopPanel/Btu_Cancel',2},{'Img_Quxiaodi','PopPanel/Btu_Cancel/Img_Quxiaodi',2},{'Img_Fenggexian','PopPanel/Img_Fenggexian',2},{'Img_Biaotixian','PopPanel/Img_Biaotixian',2},
        -- TextMeshProUGUI 列表
        {'Text_Queding','PopPanel/Btn_Confirm/Text_Queding',20},{'Text_Quxiao','PopPanel/Btu_Cancel/Text_Quxiao',20},{'Text_Txt','PopPanel/Text_Txt',20},{'Text_Title','PopPanel/Text_Title',20},
    }
end
-- Code Auto Create End
function M:OnShow(pData)
    self.exp = pData[1]
    self.confirmFunc = pData[2]
    self.Text_Txt().text = string.format(MgrLanguageData.GetLanguageByKey("ui_levelup_tips1"),self.exp)
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,Handle(self,function ()
        self.confirmFunc()
        MgrUI.ClosePop(self.Uid)
    end))
    UIEvent.LuaClick(self.BlurBg().gameObject,Handle(self,function ()
        if self.CancelFunc ~= nil then
            self.CancelFunc()
        end
        MgrUI.ClosePop(self.Uid)
    end))
    UIEvent.LuaClick(self.Btu_Cancel().gameObject,Handle(self,function ()
        if self.CancelFunc ~= nil then
            self.CancelFunc()
        end
        MgrUI.ClosePop(self.Uid)
    end))

end

return M