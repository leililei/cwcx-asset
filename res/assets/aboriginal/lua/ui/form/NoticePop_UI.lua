-- Code Auto Create Begin
local M = Class('NoticePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NoticePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NoticePop_UI].prefab'
    self.Name = 'Form[NoticePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Notice','Img_Notice',2},{'Title','Img_Notice/Title',2},{'tiao','Img_Notice/Title/tiao',2},{'Btn_Close','Img_Notice/Btn_Close',2},{'Image','Img_Notice/Btn_Close/Image',2},{'Btn_Queren','Img_Notice/Btn_Queren',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','Img_Notice/Title/Text_Title',20},{'Text_Shuoming','Img_Notice/Text_Shuoming',20},{'Text','Img_Notice/Btn_Queren/Text',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.Text_Shuoming = self.Text_Shuoming()
end

function M:OnShow(args)
    self.Text_Shuoming.text = args[1] == "" and MgrLanguageData.GetLanguageByKey("servererror_tips20002") or args[1]
    local confirmFun = args[2]     ---确认回调
    UIEvent.LuaClick(self.Btn_Queren().gameObject,function()
        confirmFun()
        -- self:ClosePop()
    end)
end

function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end
return M