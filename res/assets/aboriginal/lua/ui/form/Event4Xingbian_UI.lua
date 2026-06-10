-- Code Auto Create Begin
local M = Class('Event4Xingbian_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event4Xingbian_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event4Xingbian_UI].prefab'
    self.Name = 'Form[Event4Xingbian_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'LeftPanel','LeftPanel',2},{'Img_Bianshenqi','LeftPanel/Img_Bianshenqi',2},{'Shengji4','LeftPanel/Shengji4',2},{'Shengjikuang','LeftPanel/Shengji4/Shengjikuang',2},{'Keshengji','LeftPanel/Shengji4/Keshengji',2},{'Img_xian','LeftPanel/Shengji4/Img_xian',2},{'Shengji5','LeftPanel/Shengji5',2},{'Shengjikuang01','LeftPanel/Shengji5/Shengjikuang',2},{'Keshengji01','LeftPanel/Shengji5/Keshengji',2},{'Img_xian01','LeftPanel/Shengji5/Img_xian',2},{'Shengji6','LeftPanel/Shengji6',2},{'Shengjikuang02','LeftPanel/Shengji6/Shengjikuang',2},{'Keshengji02','LeftPanel/Shengji6/Keshengji',2},{'Img_xian02','LeftPanel/Shengji6/Img_xian',2},{'Shengji3','LeftPanel/Shengji3',2},{'Shengjikuang03','LeftPanel/Shengji3/Shengjikuang',2},{'Keshengji03','LeftPanel/Shengji3/Keshengji',2},{'Img_xian03','LeftPanel/Shengji3/Img_xian',2},{'Shengji2','LeftPanel/Shengji2',2},{'Shengjikuang04','LeftPanel/Shengji2/Shengjikuang',2},{'Keshengji04','LeftPanel/Shengji2/Keshengji',2},{'Img_xian04','LeftPanel/Shengji2/Img_xian',2},{'Shengji1','LeftPanel/Shengji1',2},{'Shengjikuang05','LeftPanel/Shengji1/Shengjikuang',2},{'Keshengji05','LeftPanel/Shengji1/Keshengji',2},{'Img_xian05','LeftPanel/Shengji1/Img_xian',2},{'Img_SoundTextBG','LeftPanel/Img_SoundTextBG',2},{'RightPanel','RightPanel',2},{'Title','RightPanel/Title',2},{'FortifyPanel','RightPanel/FortifyPanel',2},{'CostItem','RightPanel/FortifyPanel/CostItem',2},{'RewardRankImg','RightPanel/FortifyPanel/CostItem/RewardRankImg',2},{'RewardIconImg','RightPanel/FortifyPanel/CostItem/RewardIconImg',2},{'StarPanel','RightPanel/FortifyPanel/CostItem/StarPanel',2},{'ItemStarPrefab','RightPanel/FortifyPanel/CostItem/StarPanel/ItemStarPrefab',2},{'HighLight','RightPanel/FortifyPanel/CostItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','RightPanel/FortifyPanel/CostItem/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg','RightPanel/FortifyPanel/CostItem/Img_ItemCountBg',2},{'CostItemPanel','RightPanel/FortifyPanel/CostItemPanel',2},{'Btn_Shengji','RightPanel/FortifyPanel/Btn_Shengji',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},
        -- TextMeshProUGUI 列表
        {'Text_ShengjiName','LeftPanel/Shengji4/Text_ShengjiName',20},{'Text_Keshengji','LeftPanel/Shengji4/Keshengji/Text_Keshengji',20},{'Text_ShengjiName01','LeftPanel/Shengji5/Text_ShengjiName',20},{'Text_Keshengji01','LeftPanel/Shengji5/Keshengji/Text_Keshengji',20},{'Text_ShengjiName02','LeftPanel/Shengji6/Text_ShengjiName',20},{'Text_Keshengji02','LeftPanel/Shengji6/Keshengji/Text_Keshengji',20},{'Text_ShengjiName03','LeftPanel/Shengji3/Text_ShengjiName',20},{'Text_Keshengji03','LeftPanel/Shengji3/Keshengji/Text_Keshengji',20},{'Text_ShengjiName04','LeftPanel/Shengji2/Text_ShengjiName',20},{'Text_Keshengji04','LeftPanel/Shengji2/Keshengji/Text_Keshengji',20},{'Text_ShengjiName05','LeftPanel/Shengji1/Text_ShengjiName',20},{'Text_Keshengji05','LeftPanel/Shengji1/Keshengji/Text_Keshengji',20},{'RoleVoiceWordText','LeftPanel/Img_SoundTextBG/RoleVoiceWordText',20},{'Text_SkillTitle','RightPanel/Title/Text_SkillTitle',20},{'Text_Jiacheng','RightPanel/Text_Jiacheng',20},{'Text_Shuoming','RightPanel/Text_Shuoming',20},{'Text_Xiaohaocanliao','RightPanel/FortifyPanel/Text_Xiaohaocanliao',20},{'ItemCountText','RightPanel/FortifyPanel/CostItem/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','RightPanel/FortifyPanel/CostItem/ItemCountText',20},{'ItemCountText2','RightPanel/FortifyPanel/CostItem/ItemCountText2',20},{'Text_Shengji','RightPanel/FortifyPanel/Btn_Shengji/Text_Shengji',20},{'Text_Yishengji','RightPanel/Text_Yishengji',20},{'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CostItem().gameObject:SetActive(false)
    
    self.SkillData = Event4Control.GetSkillData()
    self.SkillBtn = {}
    self.CostList = {}
    self.isCanUp = true
    self.CurSkillData = nil
    
    self.UpSkillLv = Event4Control.GetActSkillLv()+1
    self.CurActID = Event4Control.GetCurActID()
    self.Event4Data = Event4Control.GetEvent4Data()[self.CurActID]
    
    EventXingbianView.Init(self.CostItem(), self.FortifyPanel(), self.Text_Yishengji(), self.Shengji1(), self.Text_SkillTitle(), self.Text_Jiacheng(), self.Text_Shuoming(), self.CostItemPanel(), self.Img_SoundTextBG(),
            self.LeftPanel(), self.RoleVoiceWordText())
    self:InitBtn()

--[[    --创建spine
    self:CreatSpine()]]
end

function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---退回主界面
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.Event4Data.group)
    end)
    ---升级
    UIEvent.LuaClick(self.Btn_Shengji().gameObject,function()
        EventXingbianView:SkillUp()
    end)
    ---各等级按钮
    EventXingbianView:InitBtn()
end

function M:OnClose()
    MgrTimer.Cancel("Event4SkillRoleVoice")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M