-- Code Auto Create Begin
local M = Class('Illustration02_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Illustration02_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Illustration02_UI].prefab'
    self.Name = 'Form[Illustration02_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG(mh)','Img_BG(mh)',2},{'logo','BG/logo',2},{'jiao(you)','BG/jiao(you)',2},{'jiao(zuo)','BG/jiao(zuo)',2},{'bian(you)','BG/bian(you)',2},{'bian(zuo)','BG/bian(zuo)',2},{'Img_Fenggexian','Title/Img_Fenggexian',2},{'Btn_Return','Btn_Return',2},{'AcTuJian','Btn_Achievement/AcTuJian',2},{'AcprogressSlider','Btn_Achievement/AcprogressSlider',2},{'AcDexRedDotIcon','Btn_Achievement/AcDexRedDotIcon',2},{'GalleryTuJian','Btn_Gallery/GalleryTuJian',2},{'GalleryprogressSlider','Btn_Gallery/GalleryprogressSlider',2},{'GalleryDexRedDotIcon','Btn_Gallery/GalleryDexRedDotIcon',2},{'JueSeTuJian','Btn_JueSe/JueSeTuJian',2},{'RoleprogressSlider','Btn_JueSe/RoleprogressSlider',2},{'TeamDexRedDotIcon','Btn_JueSe/TeamDexRedDotIcon',2},{'OriginalTujian','Btn_YuanZui/OriginalTujian',2},{'YuanZuiprogressSlider','Btn_YuanZui/YuanZuiprogressSlider',2},{'MedalTuJian','Btn_Medal/MedalTuJian',2},{'MedalprogressSlider','Btn_Medal/MedalprogressSlider',2},{'JuQingHuiFang','Btn_Plot/JuQingHuiFang',2},{'PlotprogressSlider','Btn_Plot/PlotprogressSlider',2},{'HelpTuJian','Btn_Help/HelpTuJian',2},{'Helpkuang','Btn_Help/Helpkuang',2},
        -- Text 列表
        {'Text_Tujianxitong','Title/Text_Tujianxitong',3},{'Text_IllustratedSystem','Title/Text_IllustratedSystem',3},{'Text_Acprogress','Btn_Achievement/Text_Acprogress',3},{'Text_Biaoti','Btn_Achievement/Text_Biaoti',3},{'Text_Yingwen','Btn_Achievement/Text_Yingwen',3},{'Text_Galleryprogress','Btn_Gallery/Text_Galleryprogress',3},{'Text_Biaoti01','Btn_Gallery/Text_Biaoti',3},{'Text_Yingwen01','Btn_Gallery/Text_Yingwen',3},{'Text_Roleprogress','Btn_JueSe/Text_Roleprogress',3},{'Text_Biaoti02','Btn_JueSe/Text_Biaoti',3},{'Text_Yingwen02','Btn_JueSe/Text_Yingwen',3},{'Text_YuanZuiprogress','Btn_YuanZui/Text_YuanZuiprogress',3},{'Text_Biaoti03','Btn_YuanZui/Text_Biaoti',3},{'Text_Yingwen03','Btn_YuanZui/Text_Yingwen',3},{'Text_Medalprogress','Btn_Medal/Text_Medalprogress',3},{'Text_Biaoti04','Btn_Medal/Text_Biaoti',3},{'Text_Yingwen04','Btn_Medal/Text_Yingwen',3},{'Text_Yingwen05','Btn_Plot/Text_Yingwen',3},{'Text_Plotprogress','Btn_Plot/Text_Plotprogress',3},{'Text_Biaoti05','Btn_Plot/Text_Biaoti',3},{'Text','Btn_Help/Text',3},
    }
end
-- Code Auto Create End
require("LocalData/MonsterdexLocalData")
function M:OnInit()
    ---初始化队伍阵营
    self:InitRoleCamp()
    ---初始化原罪
    self:InitOriginal()
    ---初始化勋章
    self:InitMetal()
    ---初始化剧情回放
    self:InitPlot()
    ---初始化成就
    self:InitAchievement()
    ---初始化美术馆
    self:InitGallery()
    ---初始化按钮
    self:InitButton()
    self:PlayRoleVoice(37)
end

---根据id播放语音
function M:PlayRoleVoice(type)
    local _CurRoleID = PlayerControl.GetPlayerData().curRoleID
    local _ActorLinesType
    if RoleattributeLocalData.tab[_CurRoleID] then
        --_ActorLinesType=tonumber(RoleattributeLocalData.tab[_CurRoleID][3]) ---当前台词组别
        local curRoleSkin = HeroControl.GetRoleDataByID(PlayerControl.GetPlayerData().curRoleID).skin
        _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)
    end
    local _FinalActorLineID=0
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _ActorLinesType and value[4] == type then
            _FinalActorLineID=value[1]
        end
    end
    local _AudioName
    if ActorLinesLocalData.tab[_FinalActorLineID] then
        _AudioName=ActorLinesLocalData.tab[_FinalActorLineID][13]
        MgrSound.PlayRole(_AudioName,nil,nil,false,0,0)
    end

end

function M:OnShowFinish()
    NoviceViewModel.CheckFirstGuide(42)
end
function M:OnUpdateUI()
    IllustrationViewModel.CheckRot()
    if RedDotControl.GetDotData("TeamDex").State then
        self.TeamDexRedDotIcon().gameObject:SetActive(true)
    else
        self.TeamDexRedDotIcon().gameObject:SetActive(false)
    end
    if RedDotControl.GetDotData("AchieveTask").State then
        if SysLockControl.CheckSysLock(1401) then
            self.AcDexRedDotIcon().gameObject:SetActive(true)
        else
            self.AcDexRedDotIcon().gameObject:SetActive(false)
        end
    else
        self.AcDexRedDotIcon().gameObject:SetActive(false)
    end
end

function M:InitRoleCamp()
    local hashero = #IllustrationViewModel.HasHeroCacheData
    local allhero = #IllustrationViewModel.AllHeroCacheData
    local value = hashero/allhero
    self.Text_Roleprogress().text = math.floor(value * 100).."%"
    self.RoleprogressSlider().fillAmount = value
end

function M:InitSkill()
    local hashero = #IllustrationViewModel.HasHeroCacheData
    local allhero = #IllustrationViewModel.AllHeroCacheData
    local value = hashero/allhero
    --self.Text_Skillprogress().text = math.floor(value * 100).."%"
    self.Text_Skillprogress().text = ""
    self.SkillprogressSlider().fillAmount = value
end

function M:InitAchievement()
    TaskControl.GetAchievementData(0) --获取所有成就任务
    local max = TaskControl.maxAchievement
    local curValue = TaskControl.completeAchievement
    self.AcprogressSlider().fillAmount = curValue/max
    self.Text_Acprogress().text = math.floor(curValue/max*100).."%"
end

function M:InitOriginal()
    local has = 0
    local all  = 0
    for i, v in pairs(MonsterdexLocalData.tab) do
        all = all + 1
        if v[12] ~= 0 and v[12] then
            --if StormControl.CheckPointLock(v[12]) then
            if StormControl.CheckPointPass(v[12]) then --修改为判断当前管卡是否完成
                has = has + 1
            end
        end
    end

    local value = has/all
    self.Text_YuanZuiprogress().text = math.floor(value * 100).."%"
    self.YuanZuiprogressSlider().fillAmount = value
end

function M:InitMetal()
    local has = IllustrationViewModel.GetHasMedalCount()
    local all  = #IllustrationViewModel.AllMedalCacheData
    local value = has/all
    self.Text_Medalprogress().text = math.floor(value * 100).."%"
    self.MedalprogressSlider().fillAmount = value
end

function M:InitPlot()
    local all = {}
    local has = 0
    for i, v in pairs(IllustrationViewModel.StormPointData) do
        if v.plot_l~="0" or v.plot_f~="0" then
            table.insert(all,v)
            if StormControl.CheckPointLock(v.id) then
                has = has +1
            end
        end
    end
    local value = has/(#all)
    self.Text_Plotprogress().text = math.floor(value * 100).."%"
    self.PlotprogressSlider().fillAmount = value
end

function M:InitGallery()
    local all = #IllustrationViewModel.MusicData + #IllustrationViewModel.IllustrationData + #IllustrationViewModel.AnimationData
    local has = 0
    for i, v in pairs(IllustrationViewModel.MusicData) do
        if StormControl.CheckPointLock(v[4]) or v[4] == 0 then
            has = has + 1
        end
    end
    for i, v in pairs(IllustrationViewModel.AnimationData) do
        if StormControl.CheckPointLock(v[5]) or v[5] == 0 then
            has = has + 1
        end
    end
    for i, v in pairs(IllustrationViewModel.IllustrationData) do
        if StormControl.CheckPointLock(v[6]) or v[6] == 0 then
            has = has + 1
        end
    end
    local value = has/all
    self.Text_Galleryprogress().text = math.floor(value * 100).."%"
    self.GalleryprogressSlider().fillAmount = value
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.JueSeTuJian().gameObject, function ()
        MgrUI.GoHide(UID.RoleTeam_UI)
    end)
    UIEvent.LuaClick(self.MedalTuJian().gameObject, function ()
        MgrUI.GoHide(UID.Medal_UI)
    end)
    UIEvent.LuaClick(self.OriginalTujian().gameObject, function ()
        MgrUI.GoHide(UID.Original_UI)
    end)
    UIEvent.LuaClick(self.JuQingHuiFang().gameObject, function ()
        MgrUI.GoHide(UID.Skillook_UI)
    end)
    UIEvent.LuaClick(self.AcTuJian().gameObject, function ()
        if SysLockControl.CheckSysLock(1401) == false then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1401)},true)
            return
        end
        MgrUI.GoHide(UID.Achievement_UI)
    end)
    UIEvent.LuaClick(self.GalleryTuJian().gameObject, function()
        MgrUI.GoHide(UID.ArtAppreciation_UI)
    end)
    UIEvent.LuaClick(self.HelpTuJian().gameObject, function()
        HelpViewModel.Go(77)
    end)
    UIEvent.LuaClick(self.Btn_Return().gameObject, Handle(self,IllustrationViewModel.Close))
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
function M:OnHide()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

function table.nums( t )
    local count = 0
    local function checkTable(value)
        if type( value ) ~= "table" then
            value = {}
        end
        return value
    end
    local t = checkTable( t )
    for k, v in pairs( t ) do
        count = count + 1
    end
    return count
end

return M