-- Code Auto Create Begin
local M = Class('Event5Home_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Event5Home_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Event5Home_UI].prefab'
    self.Name = 'Form[Event5Home_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Xingbian','Ani/LeftGroup/Xingbian',2},{'Xinbian_Img','Ani/LeftGroup/Xingbian/Xinbian_Img',2},{'Xinbian_RedDotIcon','Ani/LeftGroup/Xingbian/Xinbian_Img/Xinbian_RedDotIcon',2},{'Xinbian_ImgText','Ani/LeftGroup/Xingbian/Xinbian_ImgText',2},{'Mission','Ani/LeftGroup/Mission',2},{'Mission_Img','Ani/LeftGroup/Mission/Mission_Img',2},{'MissionRedDotIcon','Ani/LeftGroup/Mission/Mission_Img/MissionRedDotIcon',2},{'Mission_Text','Ani/LeftGroup/Mission/Mission_Text',2},{'Shop','Ani/LeftGroup/Shop',2},{'Shop_Img','Ani/LeftGroup/Shop/Shop_Img',2},{'ShopRedDotIcon','Ani/LeftGroup/Shop/Shop_Img/ShopRedDotIcon',2},{'Shop_Text','Ani/LeftGroup/Shop/Shop_Text',2},{'Shuliang','Ani/LeftGroup/Shop/Shuliang',2},{'Shuliang_Img_Icon','Ani/LeftGroup/Shop/Shuliang/Shuliang_Img_Icon',2},{'Replay','Ani/RightGroup/Replay',2},{'Replay_Img','Ani/RightGroup/Replay/Replay_Img',2},{'Replay_Text','Ani/RightGroup/Replay/Replay_Text',2},{'BossRaid','Ani/RightGroup/BossRaid',2},{'BossRaid_Img','Ani/RightGroup/BossRaid/BossRaid_Img',2},{'BossRaid_Text_Boss','Ani/RightGroup/BossRaid/BossRaid_Text_Boss',2},{'BossRaid_BossLock','Ani/RightGroup/BossRaid/BossRaid_BossLock',2},{'Img_Suo','Ani/RightGroup/BossRaid/BossRaid_BossLock/Img_Suo',2},{'Raid','Ani/RightGroup/Raid',2},{'Raid_Img','Ani/RightGroup/Raid/Raid_Img',2},{'Raid_Text','Ani/RightGroup/Raid/Raid_Text',2},{'RaidJindu','Ani/RightGroup/Raid/RaidJindu',2},{'Raid_Jindu_Icon','Ani/RightGroup/Raid/RaidJindu/Raid_Jindu_Icon',2},{'EventName','Ani/TitleGroup/EventName',2},{'EventTime1','Ani/TitleGroup/EventTime1',2},{'EventTime2','Ani/TitleGroup/EventTime2',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},
        -- TextMeshProUGUI 列表
        {'Shuliang_Text','Ani/LeftGroup/Shop/Shuliang/Shuliang_Text',20},{'Text_BossLock','Ani/RightGroup/BossRaid/BossRaid_BossLock/Text_BossLock',20},{'Raid_Text_Guanka','Ani/RightGroup/Raid/RaidJindu/Raid_Text_Guanka',20},{'Text_Huodongjieshushijian1','Ani/TitleGroup/EventTime1/Text_Huodongjieshushijian1',20},{'Text_Date1','Ani/TitleGroup/EventTime1/Text_Date1',20},{'Remainder1','Ani/TitleGroup/EventTime1/Time/Remainder1',20},{'Text_Huodongjieshushijian2','Ani/TitleGroup/EventTime2/Text_Huodongjieshushijian2',20},{'Text_Date2','Ani/TitleGroup/EventTime2/Text_Date2',20},{'Remainder2','Ani/TitleGroup/EventTime2/Time/Remainder2',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CurActID = Event4Control.GetCurActID()
    self.Event4Data = Event4Control.GetEvent4Data()[self.CurActID]
    ---初始化按钮
    self:InitButton()

    EventHomeView.Init(self)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        StormViewModel.CurPointData = nil
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        StormViewModel.CurPointData = nil
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---帮助
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        ActiveTutorialControl.OpenGuide(self.Event4Data.group)
    end)
    ---扭蛋
    UIEvent.LuaClick(self.Shop().gameObject, function()
        Event4Control.OpenShop()
    end)
    ---任务
    UIEvent.LuaClick(self.Mission().gameObject, function()
        Event4Control.OpenTask()
    end)
    ---剧情回放
    UIEvent.LuaClick(self.Replay().gameObject, function()
        MgrLink.TurnToPlot(tonumber(self.Event4Data.gallary[1]),tonumber(self.Event4Data.gallary[2]))
    end)
    ---关卡
    UIEvent.LuaClick(self.Raid().gameObject, function()
        Event4Control.OpenLevel()
    end)
    ---BOSS
    UIEvent.LuaClick(self.BossRaid().gameObject, function()
        Event4Control.OpenBoss()
    end)
    ---拓展件
    UIEvent.LuaClick(self.Xingbian().gameObject, function()
        Event4Control.OpenXingBian()
    end)
end

function M:OnUpdateUI()
    EventHomeView.OnUpdateUI()
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M