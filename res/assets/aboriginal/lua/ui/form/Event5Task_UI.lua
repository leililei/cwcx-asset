-- Code Auto Create Begin
local M = Class('Event5Task_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event5Task_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event5Task_UI].prefab'
    self.Name = 'Form[Event5Task_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'UI_Canvas','UI_Canvas',2},{'ReturnBg','UI_Canvas/ReturnBg',2},{'Btn_GoMenu','UI_Canvas/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UI_Canvas/ReturnBg/Btn_Back',2},{'Img_Fenggexian','UI_Canvas/ReturnBg/Img_Fenggexian',2},{'Img_Taskdi','UI_Canvas/RightPanel/Img_Taskdi',2},{'Type','UI_Canvas/RightPanel/Type',2},{'Daily','UI_Canvas/RightPanel/Type/Daily',2},{'Normal','UI_Canvas/RightPanel/Type/Daily/Normal',2},{'NormalIcon','UI_Canvas/RightPanel/Type/Daily/Normal/NormalIcon',2},{'HighLight','UI_Canvas/RightPanel/Type/Daily/HighLight',2},{'NormalIcon01','UI_Canvas/RightPanel/Type/Daily/HighLight/NormalIcon',2},{'DailyRedDotIcon','UI_Canvas/RightPanel/Type/Daily/DailyRedDotIcon',2},{'Ac','UI_Canvas/RightPanel/Type/Ac',2},{'Normal01','UI_Canvas/RightPanel/Type/Ac/Normal',2},{'NormalIcon02','UI_Canvas/RightPanel/Type/Ac/Normal/NormalIcon',2},{'HighLight01','UI_Canvas/RightPanel/Type/Ac/HighLight',2},{'NormalIcon03','UI_Canvas/RightPanel/Type/Ac/HighLight/NormalIcon',2},{'AcRedDotIcon','UI_Canvas/RightPanel/Type/Ac/AcRedDotIcon',2},{'TaskContent','UI_Canvas/RightPanel/VFXMask/TaskScroll/TaskContent',2},{'Btn_Lingqu','UI_Canvas/RightPanel/Btn_Lingqu',2},{'Img_SoundTextBG','UI_Canvas/Img_SoundTextBG',2},{'Role','Role',2},{'SpineRole','Role/SpineRole',2},{'RoleClickArea','Role/SpineRole/RoleClickArea',2},
        -- UITemplate 列表
        {'Event4TaskItem','UI_Canvas/RightPanel/VFXMask/TaskScroll/Event4TaskItem',10},
        -- Toggle 列表
        {'Daily01','UI_Canvas/RightPanel/Type/Daily',13},{'Ac01','UI_Canvas/RightPanel/Type/Ac',13},
        -- RawImage 列表
        {'TaskScroll','UI_Canvas/RightPanel/VFXMask/TaskScroll',15},
        -- LoopScrollRect 列表
        {'TaskScroll01','UI_Canvas/RightPanel/VFXMask/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UI_Canvas/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UI_Canvas/ReturnBg/Text_Title/Text_Title_EN',20},{'Text_Daily','UI_Canvas/RightPanel/Type/Daily/Normal/Text_Daily',20},{'Text_Daily01','UI_Canvas/RightPanel/Type/Daily/HighLight/Text_Daily',20},{'Text_Daily02','UI_Canvas/RightPanel/Type/Ac/Normal/Text_Daily',20},{'Text_Daily03','UI_Canvas/RightPanel/Type/Ac/HighLight/Text_Daily',20},{'Text_Lingqu','UI_Canvas/RightPanel/Btn_Lingqu/Text_Lingqu',20},{'RoleVoiceWordText','UI_Canvas/Img_SoundTextBG/RoleVoiceWordText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    EventTaskView.Init(self, self.TaskScroll01(), self.DailyRedDotIcon(), self.AcRedDotIcon(), self.SpineRole(), self.Btn_Lingqu(), self.RoleVoiceWordText(), self.Img_SoundTextBG(), self.Img_Taskdi())

    self:InitBtn()
    EventTaskView:RefreshRedPoint()
end

function M:OnUpdateUI()
    --设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 2

    EventTaskView.OnUpdateUI()
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击背后空白区域
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)

    ---点击关闭按钮
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---一键领取
    UIEvent.LuaClick(self.Btn_Lingqu().gameObject,function()
        EventTaskView:AllReceive()
    end)
    --点击角色播放语音
    UIEvent.LuaClick(self.RoleClickArea().gameObject,Handle(self,function()
        EventTaskView:GetCurWords(97)
    end))
    --界面切换
    EventTaskView:SwitchBtn(self.Daily01(),self.Daily(),self.Ac01(),self.Ac())
end

function M:OnClose()
    MgrTimer.Cancel("Event4TaskRoleVoice")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M
