-- Code Auto Create Begin
local M = Class('RoleUpgrade_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleUpgrade_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleUpgrade_UI].prefab'
    self.Name = 'Form[RoleUpgrade_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'bejing','BackGround/bejing',2},{'Equipbg','BackGround/Equipbg',2},{'AtkRangeRTPanel','AtkRangeRTPanel',2},{'AtkRangeRTPrafab','AtkRangeRTPrafab',2},{'LihuiPanel','LihuiPanel',2},{'SpinePanel','LihuiPanel/SpinePanel',2},{'LihuiSpinePanel','LihuiPanel/SpinePanel/LihuiSpinePanel',2},{'Bg_ZheZhao','Bg_ZheZhao',2},{'SwitchGirlBtnPanel','SwitchGirlBtnPanel',2},{'yuandi','SwitchGirlBtnPanel/yuandi',2},{'CircleNoneImg','SwitchGirlBtnPanel/CircleNoneImg',2},{'CircleRightImg','SwitchGirlBtnPanel/CircleRightImg',2},{'CircleBothImg','SwitchGirlBtnPanel/CircleBothImg',2},{'CircleLeftImg','SwitchGirlBtnPanel/CircleLeftImg',2},{'RoleInfoPanel','RoleInfoPanel',2},{'LowerInfoPanel','RoleInfoPanel/LowerInfoPanel',2},{'ProTypeImg','RoleInfoPanel/LowerInfoPanel/ProTypeImg',2},{'StarPrefab','RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPrefabJueXing','RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPanel','RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'RoleNameBG','RoleInfoPanel/LowerInfoPanel/RoleNameBG',2},{'pilot','RoleInfoPanel/LowerInfoPanel/RoleNameBG/pilot',2},{'Btn_Story','RoleInfoPanel/LowerInfoPanel/Btn_Story',2},{'jiao','RoleInfoPanel/jiao',2},{'GroupIconImg','RoleInfoPanel/jiao/GroupIconImg',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'toumingdi','UpperBtnPanel/toumingdi',2},{'Btn_GoMenu','UpperBtnPanel/Btn_GoMenu',2},{'zhongjian','UpperBtnPanel/zhongjian',2},{'Btn_Back','UpperBtnPanel/Btn_Back',2},
        -- Text 列表
        {'RoleNameTxt','RoleInfoPanel/LowerInfoPanel/RoleNameBG/RoleNameTxt',3},{'EmptyImg','RoleInfoPanel/LowerInfoPanel/Btn_Story/EmptyImg',3},{'BgTitle','UpperBtnPanel/BgTitle',3},{'EnBgTitle','UpperBtnPanel/EnBgTitle',3},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Bool_IsCurFormClose = false --当前窗口是否已经关闭
    self.PosX = 0
    self.Bg_ZheZhao().gameObject:SetActive(false)
    self.Equipbg().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, self.OnHomeClick)
    UIEvent.LuaClick(self.Btn_Story().gameObject,Handle(self, function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        -- 点击跳转角色档案界面
        self:HidePanel()
        MgrUI.GoClose(UID.RoleDocument_UI)
    end))

    ---星数组
    self.unAwakenStarArr = {}
    ---觉醒星数组
    self.onAwakenStarArr = {}
    for i = 1, 6 do
        ---预创建星
        self.unAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefab().gameObject,self.StarPanel().gameObject.transform,false)
        ---预创建觉醒星
        self.onAwakenStarArr[i] = GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().gameObject.transform,false)
    end
    MgrUI.Go(UID.RoleDetail_UI)

    self:CreatSpine(self.LihuiSpinePanel().gameObject,RoleCardViewModel.CurrentHero.id)
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)

    Event.Clear("SpineRootMove")
    Event.Clear("HidePanel")
    Event.Clear("OnBackClick")
    Event.Clear("HideSpine")
    Event.Clear("ShowSpine")
    Event.Clear("SetTitle")

    Event.Add("SetTitle",function (_CN,_EN)
        -- statements
        self:SetTitle(_CN,_EN)
    end)

    Event.Add("ShowSpine",function ()
        -- statements
        self:ShowSpine()
    end)

    Event.Add("HideSpine",function ()
        -- statements
        self:HideSpine()
    end)
    Event.Add("SpineRootMove",function (_TargetPosX,_Duration)
        -- statements
        self:SpineMove(_TargetPosX,_Duration)
    end)
    Event.Add("OnBackClick",function ()
        -- statements
        self:OnBackClick()
    end)
    Event.Add("HidePanel",function (isEquip)
        -- statements
        self:HidePanel(isEquip)
    end)

    RoleCardViewModel.PanelID = 1
    self:InitRoleInfo()
end

function M:OnUpdateUI()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:InitRoleInfo()
    ---设置名称
    self.RoleNameTxt().text = RoleCardViewModel.CurrentHero.name
    ---设置职业
    MgrRes.LoadSprite(self.ProTypeImg(),RoleCardViewModel.CurrentHero.iconCareer)
    ---设置阵营
    MgrRes.LoadSprite(self.GroupIconImg(),"Attribute/"..RoleCardViewModel.CurrentHero.CampiconName)
    ---设置星
    for i = 1, #self.unAwakenStarArr do
        self.unAwakenStarArr[i]:SetActive(i <= RoleCardViewModel.CurrentHero.star and not RoleCardViewModel.CurrentHero.awaken) ---未觉醒星
    self.onAwakenStarArr[i]:SetActive(i <= RoleCardViewModel.CurrentHero.star and RoleCardViewModel.CurrentHero.awaken)     ---觉醒星
    end
end

---返回上一页
function M:OnBackClick()
    print(RoleCardViewModel.PanelID)
    self.Bg_ZheZhao().gameObject:SetActive(false)
    if RoleCardViewModel.PanelID == 1 then
            MgrUI.GoBackTo(UID.RoleCard_UI)
     --   MgrUI.GoBackTo(UID.RoleCard_UI)
    elseif RoleCardViewModel.PanelID == 2 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:SpineMove(self.PosX,0.3)
        RoleCardViewModel.PanelID = 1
    elseif RoleCardViewModel.PanelID == 3 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:SpineMove(self.PosX,0.3)
        RoleCardViewModel.PanelID = 1
    elseif RoleCardViewModel.PanelID == 4 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:SpineMove(self.PosX,0.3)
        self:InitRoleInfo()
        RoleCardViewModel.PanelID = 1
    elseif RoleCardViewModel.PanelID == 5 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:ShowSpine()
        RoleCardViewModel.PanelID = 1
    elseif RoleCardViewModel.PanelID == 6 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:ShowSpine()
        RoleCardViewModel.PanelID = 1
    elseif RoleCardViewModel.PanelID == 7 then
        MgrUI.GoClose(UID.RoleDetail_UI)
        self:ShowPanel()
        self:ShowSpine()
        RoleCardViewModel.PanelID = 1
    end
    self:SetTitle(MgrLanguageData.GetLanguageByKey("newroledetail_ui_character_detail"),"RESONANCE")
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end

---返回大厅
function M.OnHomeClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBackTo(UID.Home_UI)
end

function M:SpineMove(_TargetPosX,_Duration)
    Tools.TweenDoLocalMoveX(self.LihuiSpinePanel().gameObject,_TargetPosX,_Duration,-1)
end

function M:CreatSpine(_Root,_RoleId)
    local name = RoleattributeLocalData.tab[_RoleId][8]
    local infoStr = CharactercoordinatesLocalData.tab[_RoleId].coordinate2
    local info = JNStrTool.strSplit(";", infoStr)
    local pos = JNStrTool.strSplit(",", info[1])
    self.PosX = tonumber(pos[1])
    MgrRes.LoadWatchAuto(_Root, _RoleId,tonumber(pos[1]),tonumber(pos[2]),tonumber(info[2]))
end

function M:SetTitle(_CN,_EN)
    self.BgTitle().text = _CN
    self.EnBgTitle().text = _EN
end
---隐藏界面部分功能
function M:HidePanel(isEquip)
    self.SwitchGirlBtnPanel().gameObject:SetActive(false)
    self.RoleInfoPanel().gameObject:SetActive(false)
    if isEquip then
        self.Equipbg().gameObject:SetActive(true)
    else
        self.Equipbg().gameObject:SetActive(false)
    end
end
---显示隐藏Spine
function M:HideSpine()
    self.LihuiSpinePanel().gameObject:SetActive(false)
end
function M:ShowSpine()
    self.LihuiSpinePanel().gameObject:SetActive(true)
end
--显示界面部分功能
function M:ShowPanel(isEquip)
    self.SwitchGirlBtnPanel().gameObject:SetActive(true)
    self.RoleInfoPanel().gameObject:SetActive(true)
    if isEquip then
        self.Equipbg().gameObject:SetActive(true)
    else
        self.Equipbg().gameObject:SetActive(false)
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M