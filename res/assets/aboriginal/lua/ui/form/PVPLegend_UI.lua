-- Code Auto Create Begin
local M = Class('PVPLegend_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PVPLegend_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PVPLegend_UI].prefab'
    self.Name = 'Form[PVPLegend_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'NormalPanel','Ani/NormalPanel',2},{'Bg','Ani/NormalPanel/Bg',2},{'Fg','Ani/NormalPanel/Fg',2},{'ScrollSeason','Ani/NormalPanel/ScrollSeason',2},{'PVPSeasonItem','Ani/NormalPanel/ScrollSeason/PVPSeasonItem',2},{'ContentSeason','Ani/NormalPanel/ScrollSeason/ContentSeason',2},{'Img_Title','Ani/NormalPanel/Img_Title',2},{'ImgRole1','Ani/NormalPanel/Role1/ImgRole1',2},{'ImgRole2','Ani/NormalPanel/Role2/ImgRole2',2},{'ImgRole3','Ani/NormalPanel/Role3/ImgRole3',2},{'Names','Ani/NormalPanel/Names',2},{'ImgNameBg','Ani/NormalPanel/Names/ImgNameBg',2},{'ImgNameBg01','Ani/NormalPanel/Names/ImgNameBg',2},{'ImgNameBg02','Ani/NormalPanel/Names/ImgNameBg',2},{'BtnFormation1','Ani/NormalPanel/BtnFormation1',2},{'BtnFormation2','Ani/NormalPanel/BtnFormation2',2},{'BtnFormation3','Ani/NormalPanel/BtnFormation3',2},{'Btn_Playback','Ani/NormalPanel/Btn_Playback',2},{'UpperBtnPanel','Ani/UpperBtnPanel',2},{'Btn_Back','Ani/UpperBtnPanel/Btn_Back',2},{'Img_Fenggexian','Ani/UpperBtnPanel/Img_Fenggexian',2},{'Img_mask_zuo','Img_mask_zuo',2},{'Img_mask_you','Img_mask_you',2},
        -- Button 列表
        {'Btn_Back01','Ani/UpperBtnPanel/Btn_Back',4},
        -- UITemplate 列表
        {'PVPSeasonItem01','Ani/NormalPanel/ScrollSeason/PVPSeasonItem',10},
        -- Toggle 列表
        {'PVPSeasonItem02','Ani/NormalPanel/ScrollSeason/PVPSeasonItem',13},
        -- LoopScrollRect 列表
        {'ScrollSeason01','Ani/NormalPanel/ScrollSeason',18},
        -- TextMeshProUGUI 列表
        {'TextName1','Ani/NormalPanel/Names/ImgNameBg/TextName1',20},{'TextName2','Ani/NormalPanel/Names/ImgNameBg/TextName2',20},{'TextName3','Ani/NormalPanel/Names/ImgNameBg/TextName3',20},{'Text','Ani/NormalPanel/BtnFormation1/Text',20},{'Text01','Ani/NormalPanel/BtnFormation2/Text',20},{'Text02','Ani/NormalPanel/BtnFormation3/Text',20},{'Text03','Ani/NormalPanel/Btn_Playback/Text',20},{'Text_TitleCn','Ani/UpperBtnPanel/Text_TitleCn',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Btn_Back01().gameObject, Handle(self, function()
        MgrUI.GoBack();
    end));
    self.ScrollSeason01():SetLuaCellEvent(Handle(self, self.OnSeasonItemRender));
    Event.Add("PVPLegendSelectSeason", Handle(self, self.OnSelectSeason));
    UIEvent.LuaClick(self.Btn_Playback().gameObject, function()
        PVPViewModel.SendGetChampionMatchReq(self.m_info.version, nil, function()
            MgrUI.GoHide(UID.PVPMaster_UI, nil);
        end);
    end);
    UIEvent.LuaClick(self.BtnFormation1().gameObject, function()
        self:OnBtnFormationClicked(1);
    end);
    UIEvent.LuaClick(self.BtnFormation2().gameObject, function()
        self:OnBtnFormationClicked(2);
    end);
    UIEvent.LuaClick(self.BtnFormation3().gameObject, function()
        self:OnBtnFormationClicked(3);
    end);
end
function M:OnClose()
    Event.Remove("PVPLegendSelectSeason", Handle(self, self.OnSelectSeason));
end
function M:OnSeasonItemRender(trans, idx)
    trans:GetComponent("UITemplate"):SetData({idx, self.ContentSeason().transform:GetComponent("ToggleGroup")});
end
function M:OnShow()
    self.ScrollSeason01().totalCount = PVPViewModel.GetChampionHistoryCount();
    self.ScrollSeason01():RefillCells();
    self:OnSelectSeason(1);
    self.Names().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 1
    if PVPViewModel.GetViewRecordsCount() > 1 then
        -- 看录像回来
        MgrTimer.AddDelay("PVPLegendOpenMaster", 0.5, function()
            PVPViewModel.SendGetChampionMatchReq(PVPViewModel.MasterSeasonReq, nil, function()
                MgrUI.GoHide(UID.PVPMaster_UI, nil);
            end);
        end)
    end
end
function M:OnSelectSeason(index)
    --self.m_curSeason = season;
    self.m_curSeasonIndex = index
    --self.m_info = PVPViewModel.GetChampionHistoryInfo(season);
    self.m_info = PVPViewModel.GetChampionHistoryInfo(index, true);
    self.TextName1().text = self.m_info.member[1].Player.nike;
    Tools.ClearAllChild(self.ImgRole1().gameObject);
    MgrRes.LoadFightSpine(self.ImgRole1().gameObject, self.m_info.member[1].Player.menuRoleID,0,0,35,"dj",function(obj)
        obj.transform.gameObject.layer = 5;
        obj:GetComponent("MeshRenderer").sortingLayerID = 0;
        obj:GetComponent("MeshRenderer").sortingOrder = self.CavOrder + 1;
    end);
    self.TextName2().text = self.m_info.member[2].Player.nike;
    Tools.ClearAllChild(self.ImgRole2().gameObject);
    MgrRes.LoadFightSpine(self.ImgRole2().gameObject, self.m_info.member[2].Player.menuRoleID,0,0,35,"dj",function(obj)
        obj.transform.gameObject.layer = 5;
        obj:GetComponent("MeshRenderer").sortingLayerID = 0;
        obj:GetComponent("MeshRenderer").sortingOrder = self.CavOrder + 1;
    end);
    self.TextName3().text = self.m_info.member[3].Player.nike;
    Tools.ClearAllChild(self.ImgRole3().gameObject);
    MgrRes.LoadFightSpine(self.ImgRole3().gameObject, self.m_info.member[3].Player.menuRoleID,0,0,35,"dj",function(obj)
        obj.transform.gameObject.layer = 5;
        obj:GetComponent("MeshRenderer").sortingLayerID = 0;
        obj:GetComponent("MeshRenderer").sortingOrder = self.CavOrder + 1;
    end);
end
function M:OnBtnFormationClicked(idx)
    local member = self.m_info.member[idx]
    local playerId = member.Player.id
    local season = self.m_info.version
    PVPViewModel.SendGetChampionHistoryTeamReq(playerId, season, function(team) 
        MgrUI.Pop(UID.ViewFormation_UI, { team }, true);
    end)
end
return M