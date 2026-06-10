-- Code Auto Create Begin
local M = Class('UnionJoin_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.UnionJoin_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[UnionJoin_UI].prefab'
    self.Name = 'Form[UnionJoin_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'UpperLeftBtnPanel','UpperLeftBtnPanel',2},{'Btn_Back','UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftBtnPanel/Btn_Help',2},{'UnionInfo','UnionInfo',2},{'LeftInfo','UnionInfo/LeftInfo',2},{'Aegies_icon','UnionInfo/LeftInfo/Aegies_icon',2},{'GonghuiIcon','UnionInfo/LeftInfo/GonghuiIcon',2},{'Paiming','UnionInfo/LeftInfo/Paiming',2},{'Icon','UnionInfo/LeftInfo/Paiming/Icon',2},{'Btn_Chakan','UnionInfo/LeftInfo/Paiming/Btn_Chakan',2},{'President','UnionInfo/LeftInfo/President',2},{'IntakePolicy','UnionInfo/LeftInfo/IntakePolicy',2},{'JoinLevel','UnionInfo/LeftInfo/JoinLevel',2},{'Shuoming','UnionInfo/LeftInfo/Shuoming',2},{'Btn_Join','UnionInfo/LeftInfo/Btn_Join',2},{'Btn_Applied','UnionInfo/LeftInfo/Btn_Applied',2},{'Di','Right/Di',2},{'baidi','Right/Di/baidi',2},{'xian2','Right/Di/xian2',2},{'xian1','Right/Di/xian1',2},{'BlackBar','Right/BlackBar',2},{'UnionItem','Right/UnionTeam/UnionItem',2},{'FenJieXian','Right/UnionTeam/UnionItem/FenJieXian',2},{'Checkdi','Right/UnionTeam/UnionItem/Checkdi',2},{'SearchFrame','Right/SearchFrame',2},{'InPutSearch','Right/SearchFrame/InPutSearch',2},{'Btn_Search','Right/SearchFrame/Btn_Search',2},{'Btn_Search01','Right/SearchFrame/Btn_Search/Btn_Search',2},{'Btn_ShuaXin','Right/Btn_ShuaXin',2},{'shuaxinIcon','Right/Btn_ShuaXin/shuaxinIcon',2},{'Btn_CreatePop','Right/Btn_CreatePop',2},{'NoGuild','Right/NoGuild',2},{'ZanWuGongHui','Right/NoGuild/ZanWuGongHui',2},{'CreateUnion','CreateUnion',2},{'CreateUnionBg','CreateUnion/CreateUnionBg',2},{'Di01','CreateUnion/Di',2},{'Whiteline','CreateUnion/Di/Whiteline',2},{'CreateLv_Gou','CreateUnion/Di/CreateLv_Gou',2},{'Cost_Gou','CreateUnion/Di/Cost_Gou',2},{'InputUnionName','CreateUnion/Di/InputUnionName',2},{'Btn_CreateUnion','CreateUnion/Di/Btn_CreateUnion',2},{'CostPanel','CreateUnion/Di/CostPanel',2},{'Cost','CreateUnion/Di/Cost',2},{'CostIcon','CreateUnion/Di/Cost/CostIcon',2},{'BlackBar01','CreateUnion/BlackBar',2},
        -- LoopScrollRect 列表
        {'UnionTeam','Right/UnionTeam',18},
        -- TextMeshProUGUI 列表
        {'Text_Friend_CN','UpperLeftBtnPanel/Text_Friend/Text_Friend_CN',20},{'Text_Friend_EN','UpperLeftBtnPanel/Text_Friend/Text_Friend_EN',20},{'Text_LV','UnionInfo/LeftInfo/Text_LV',20},{'Text_level','UnionInfo/LeftInfo/Text_level',20},{'Text_name','UnionInfo/LeftInfo/Text_name',20},{'Text_ID','UnionInfo/LeftInfo/Text_ID',20},{'Text_Rank_Month1','UnionInfo/LeftInfo/Paiming/Text_Rank_Month1',20},{'Text_Rank_Month2','UnionInfo/LeftInfo/Paiming/Text_Rank_Month2',20},{'Text_Rank_LastMonth1','UnionInfo/LeftInfo/Paiming/Text_Rank_LastMonth1',20},{'Text_Rank_LastMonth2','UnionInfo/LeftInfo/Paiming/Text_Rank_LastMonth2',20},{'Text_President1','UnionInfo/LeftInfo/President/Text_President1',20},{'Text_President2','UnionInfo/LeftInfo/President/Text_President2',20},{'Text_IntakePolicy1','UnionInfo/LeftInfo/IntakePolicy/Text_IntakePolicy1',20},{'Text_IntakePolicy2','UnionInfo/LeftInfo/IntakePolicy/Text_IntakePolicy2',20},{'Text_JoinLevel1','UnionInfo/LeftInfo/JoinLevel/Text_JoinLevel1',20},{'Text_JoinLevel2','UnionInfo/LeftInfo/JoinLevel/Text_JoinLevel2',20},{'Text_Shuoming','UnionInfo/LeftInfo/Shuoming/Text_Shuoming',20},{'Text_Join','UnionInfo/LeftInfo/Btn_Join/Text_Join',20},{'Text_Applied','UnionInfo/LeftInfo/Btn_Applied/Text_Applied',20},{'Text_NoData','UnionInfo/Text_NoData',20},{'Text_MingZi','Right/BlackBar/Text_MingZi',20},{'Text_ZhaoHuanYaoQiu','Right/BlackBar/Text_ZhaoHuanYaoQiu',20},{'Text_RenShu','Right/BlackBar/Text_RenShu',20},{'Text_GongHuiPaiMing','Right/BlackBar/Text_GongHuiPaiMing',20},{'Text_ItemLevel','Right/UnionTeam/UnionItem/Text_ItemLevel',20},{'Text_ItemName','Right/UnionTeam/UnionItem/Text_ItemName',20},{'Text_JoinMode','Right/UnionTeam/UnionItem/Text_JoinMode',20},{'Text_Members','Right/UnionTeam/UnionItem/Text_Members',20},{'Text_ItemRank','Right/UnionTeam/UnionItem/Text_ItemRank',20},{'Placeholder','Right/SearchFrame/InPutSearch/Text Area/Placeholder',20},{'Text','Right/SearchFrame/InPutSearch/Text Area/Text',20},{'Text_ShuaXin','Right/Btn_ShuaXin/Text_ShuaXin',20},{'Text_ChuangJianGongHui','Right/Btn_CreatePop/Text_ChuangJianGongHui',20},{'Text_CreateLv','CreateUnion/Di/Text_CreateLv',20},{'Text_Cost','CreateUnion/Di/Text_Cost',20},{'Placeholder01','CreateUnion/Di/InputUnionName/Text Area/Placeholder',20},{'Text01','CreateUnion/Di/InputUnionName/Text Area/Text',20},{'Text_ChuangJianGongHui01','CreateUnion/Di/Btn_CreateUnion/Text_ChuangJianGongHui',20},{'Text_CostNum','CreateUnion/Di/Cost/Text_CostNum',20},{'Text_Title','CreateUnion/BlackBar/Text_Title',20},
        -- TMP_InputField 列表
        {'InPutSearch01','Right/SearchFrame/InPutSearch',21},{'InputUnionName01','CreateUnion/Di/InputUnionName',21},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.CreateUnion().gameObject:SetActive(false)
    self.NoGuild().gameObject:SetActive(false)
    self.Text_NoData().gameObject:SetActive(false)
    self.Paiming().gameObject:SetActive(false)
    self.IsCreateLv = false
    self.IsCreateCost = false
    
    self.GuildList = nil
    self.CellItem = nil
    self.SelectGuildID = nil       ---当前选中的公会的ID
    self.AppliedList = GuildControl.GetAppliedID()  ---已申请的公会ID列表
    self.CalmTime = GuildControl.GetCalmTime()      ---申请公会冷静期时间戳
    
    self:InitButton()
    self:InitCreateCuild()
    ---注册滑块
    self.UnionTeam():SetLuaCellEvent(Handle(self, self.CellData))
end

function M:OnShow()
    self.GuildList = GuildControl.GetGuildList()
    if self.GuildList then
        self.UnionTeam().totalCount = #self.GuildList
        self.UnionTeam():RefillCells()

        if not self.LeftInfo().gameObject.activeSelf then
            self.LeftInfo().gameObject:SetActive(true)
            self.NoGuild().gameObject:SetActive(false)
            self.Text_NoData().gameObject:SetActive(false)
        end
    elseif self.LeftInfo().gameObject.activeSelf then
        self.LeftInfo().gameObject:SetActive(false)
        self.NoGuild().gameObject:SetActive(true)
        self.Text_NoData().gameObject:SetActive(true)
    end
end

function M:CellData(trans, idx)
    self:CellUI(trans.gameObject, self.GuildList[idx], idx)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    ---打开创建公会弹窗
    UIEvent.LuaClick(self.Btn_CreatePop().gameObject, Handle(self, function()
        self.CreateUnion().gameObject:SetActive(true)
    end))
    UIEvent.LuaClick(self.CreateUnionBg().gameObject, Handle(self, function()
        self.CreateUnion().gameObject:SetActive(false)
    end))
    ---申请公会
    UIEvent.LuaClick(self.Btn_Join().gameObject, Handle(self, function()
        local tCurTime = Global.GetCurTime()
        if self.CalmTime > tCurTime then
            local time = math.ceil((self.CalmTime - tCurTime)/60)
            local tStr = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text52"), time)
            MgrUI.Pop(UID.PopTip_UI,{ tStr,2 },true)
            return
        end
        if PlayerControl.GetPlayerData().level < tonumber(self.Text_JoinLevel2().text) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("assetsscrollitem_tips1")..self.Text_JoinLevel2().text.."</color>",2},true)
            return
        end
        GuildControl.GuildApply(self.SelectGuildID,function()
            self:Btn_Applied().gameObject:SetActive(true)
            self:Btn_Join().gameObject:SetActive(false)
        end)
    end))
    ---搜索公会
    UIEvent.LuaClick(self.Btn_Search().gameObject, Handle(self, function()
        local tSearchData = self.InPutSearch01().text
       
        if tonumber(tSearchData) ~= nil then
           GuildControl.SeachGuild(tonumber(tSearchData), function(_guildData)
               if _guildData then
                   self.GuildList = _guildData
                   self.UnionTeam().totalCount = #self.GuildList
                   self.UnionTeam():RefillCells()
               end
           end)
        end
    end))
    ---刷新公会列表
    UIEvent.LuaClick(self.Btn_ShuaXin().gameObject, Handle(self, function()
        GuildControl.GetGuildData(function(_guildData)
            if _guildData then
                self.GuildList = _guildData
                self.UnionTeam().totalCount = #self.GuildList
                self.UnionTeam():RefillCells()
            end
        end)
    end))
    ---创建公会
    UIEvent.LuaClick(self.Btn_CreateUnion().gameObject, Handle(self, function()
        ---获取输入框文字
        local tName = self.InputUnionName01().text
        if tName == "" then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text1"),1},true)
            return
        elseif Tools.ContainSpecialChar(tName) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
            return
        end
        if not self.IsCreateLv then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text59"),1},true)
            return
        end
        if not self.IsCreateCost then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"),1},true)
            return
        end
        
        local lenInByte = #tName
        local count = 0

        for i=1,lenInByte do
            local curByte = string.byte(tName, i)
            local byteCount = 0;
            if curByte>0 and curByte<=127 then
                byteCount = 1
            elseif curByte>=192 and curByte<223 then
                byteCount = 2
            elseif curByte>=224 and curByte<239 then
                byteCount = 3
            elseif curByte>=240 and curByte<=247 then
                byteCount = 4
            end

            if byteCount == 3 then
                count = count + 2
            elseif byteCount == 1 then
                count = count + 1
            end
        end
        local a = string.len(tName)
        if count < tonumber(SteamLocalData.tab[115001][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text3"),1},true)
            return
        end
        if count > tonumber(SteamLocalData.tab[115002][2]) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text2"),1},true)
            return
        end

        GuildControl.CreateGuild(tName)
    end))
end

function M:CellUI(_obj, _data, _idx)
    local _level = CJNUIMgr.GetSunUseName(_obj, "Text_ItemLevel"):GetComponent("TextMeshProUGUI")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_ItemName"):GetComponent("TextMeshProUGUI")
    local _mode= CJNUIMgr.GetSunUseName(_obj, "Text_JoinMode"):GetComponent("TextMeshProUGUI")
    local _members = CJNUIMgr.GetSunUseName(_obj, "Text_Members"):GetComponent("TextMeshProUGUI")
    local _rank = CJNUIMgr.GetSunUseName(_obj, "Text_ItemRank"):GetComponent("TextMeshProUGUI")
    local _select = CJNUIMgr.GetSunUseName(_obj, "Checkdi")
    
    local tLvData = GuildControl.GetLvData(_data.level)

    _level.text = MgrLanguageData.GetLanguageByKey("ui_guild_text8").." ".._data.level
    _name.text = _data.name
    _mode.text = GuildControl.GetModeByID(_data.recruitType)
    if tLvData then
        _members.text = #_data.user.."/"..tLvData.membernum
    else
        _members.text = #_data.user.."/-"
    end
    _rank.text = _data.Score

    local tData = _data
    if _idx == 1 then
        self.CellItem = _select
        self.CellItem.gameObject:SetActive(true)
        
        self:RefreshSelect(tData)
    else
        _select.gameObject:SetActive(false)
    end
    UIEvent.LuaClick(_obj, Handle(self, function()
        if _select == self.CellItem then
            return
        end
        self.CellItem.gameObject:SetActive(false)
        self.CellItem = _select
        self.CellItem.gameObject:SetActive(true)
        
        self:RefreshSelect(tData)
    end))
end
---初始化创建公会弹窗
function M:InitCreateCuild()
    ---文字
    self.Text_CreateLv().text = "·"..string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text5"),SteamLocalData.tab[115011][2])
    self.Text_Cost().text = "·"..MgrLanguageData.GetLanguageByKey("ui_guild_text6")
    ---消耗
    local isReach = true
    local tCostList = string.split(SteamLocalData.tab[115005][2],',')
    for i = 1, #tCostList do
        local tItem = string.split(tCostList[i],'_')
        local itemD = ItemControl.GetItemByType(tonumber(tItem[1]), tonumber(tItem[2]))
        local tCost = GameObject.Instantiate(self.Cost().gameObject,self.CostPanel().transform,false)
        if itemD then
            self:SetCostUI(tCost.gameObject, itemD, tItem[3])

            local tBagData = ItemControl.GetItemByIdAndType(tonumber(tItem[2]), tonumber(tItem[1]))
            if tBagData and tBagData.count < tonumber(tItem[3]) then
                isReach = false
            end
        end
    end
    self.Cost().gameObject:SetActive(false)
    ---判断是否满足条件
    if PlayerControl.GetPlayerData().level >= tonumber(SteamLocalData.tab[115011][2]) then
        MgrRes.LoadSprite(self.CreateLv_Gou(),"Guild/Gouicon",nil,true)
        self.IsCreateLv = true
    else
        MgrRes.LoadSprite(self.CreateLv_Gou(),"Guild/cha_icon",nil,true)
    end
    if isReach then
        MgrRes.LoadSprite(self.Cost_Gou(),"Guild/Gouicon",nil,true)
    else
        MgrRes.LoadSprite(self.Cost_Gou(),"Guild/cha_icon",nil,true)
    end
    self.IsCreateCost = isReach
end
---设置消耗
function M:SetCostUI(_cost,_itemD,_itemNum)
    local _CostIcon = CJNUIMgr.GetSunUseName(_cost, "CostIcon"):GetComponent("Image")
    local _CostNum = CJNUIMgr.GetSunUseName(_cost, "Text_CostNum"):GetComponent("TextMeshProUGUI")
    
    MgrRes.LoadSprite(_CostIcon,"Item/".._itemD.icon)
    _CostNum.text = tostring(_itemNum)
end
---刷新选中公会
function M:RefreshSelect(_guildData)
    self.SelectGuildID = _guildData.id
    
    self.Text_name().text = _guildData.name
    self.Text_ID().text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text58"), _guildData.id)
    self.Text_level().text = _guildData.level

    for i, v in pairs(_guildData.user) do
        if v.job == GuildControl.Job.leader then
            self.Text_President2().text = v.name
            break
        end 
    end

    self.Text_IntakePolicy2().text = GuildControl.GetModeByID(_guildData.recruitType)
    self.Text_JoinLevel2().text = _guildData.recruitLevelLimit
    self.Text_Shuoming().text = _guildData.notice

    if self.AppliedList[self.SelectGuildID] then
        self.Btn_Join().gameObject:SetActive(false)
        self.Btn_Applied().gameObject:SetActive(true)
    else
        self.Btn_Join().gameObject:SetActive(true)
        self.Btn_Applied().gameObject:SetActive(false)
    end
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M