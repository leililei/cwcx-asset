-- Code Auto Create Begin
local M = Class('GoToWBPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.GoToWBPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[GoToWBPop_UI].prefab'
    self.Name = 'Form[GoToWBPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Panel','Panel',2},{'Img_Biaotixian','Panel/Img_Biaotixian',2},{'BossMap','Panel/BossMap',2},{'Cishutiao','Panel/Cishutiao',2},{'Img_Tiao1','Panel/Cishutiao/Img_Tiao1',2},{'Img_Tiao_H1','Panel/Cishutiao/Img_Tiao1/Img_Tiao_H1',2},{'Img_Tiao2','Panel/Cishutiao/Img_Tiao2',2},{'Img_Tiao_H2','Panel/Cishutiao/Img_Tiao2/Img_Tiao_H2',2},{'Img_Tiao3','Panel/Cishutiao/Img_Tiao3',2},{'Img_Tiao_H3','Panel/Cishutiao/Img_Tiao3/Img_Tiao_H3',2},{'Img_Quxiaodi','Panel/Btn_Quxiao/Img_Quxiaodi',2},{'Btn_Qianwang','Panel/Btn_Qianwang',2},{'Img_Qianwang','Panel/Btn_Qianwang/Img_Qianwang',2},
        -- Button 列表
        {'Btn_Quxiao','Panel/Btn_Quxiao',4},
        -- RawImage 列表
        {'Btn_Quxiao01','Panel/Btn_Quxiao',15},
        -- TextMeshProUGUI 列表
        {'Text_Name','Panel/Text_Name',20},{'Text_Xiaohaotili','Panel/Text_Xiaohaotili',20},{'Text_Quxiao','Panel/Btn_Quxiao/Text_Quxiao',20},{'Text_Qianwang','Panel/Btn_Qianwang/Text_Qianwang',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Qianwang().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        HomeViewModel.OpenCrusade(self.activityType)
        Event.Remove("LHTFPOP",EventRaidControl.LHTFPop)
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
    end)
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject,function()
        MgrUI.ClosePop(self.Uid)
        Event.Remove("LHTFPOP",EventRaidControl.LHTFPop)
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
    end)
end

function M:OnShow(param)
    self.BossID = param[1]
    self.vigor = param[2][1]
    self.activityType = param[2][2]
    local data = EventRaidControl.GetLIANHETAOFAData()
    ---图片
    MgrRes.LoadSprite(self.BossMap(),"Preview/" .. data.BossData[1].thumbnail_map)
    ---体力文字
    local vi = TaskControl.CheckTodayVigorExpend()
    local limit = tonumber(SteamLocalData.tab[109000][2]) * 100
    self.Text_Xiaohaotili().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text126"),tostring(vi > limit and limit or vi),tostring(limit))
    ---体力条
    self.vigorBar = {
        self.Img_Tiao_H1().gameObject,
        self.Img_Tiao_H2().gameObject,
        self.Img_Tiao_H3().gameObject
    }
    for i = 1, tonumber(SteamLocalData.tab[109000][2]) do
        if math.modf(vi / 100) > i - 1 then
            self.vigorBar[i]:SetActive(true)
        else
            self.vigorBar[i]:SetActive(false)
        end
    end

end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"PlayerLevelUp_UI"}) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.BuyPop_UI)
    end
end

return M