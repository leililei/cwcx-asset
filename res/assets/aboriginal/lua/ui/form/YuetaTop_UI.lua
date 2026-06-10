-- Code Auto Create Begin
local M = Class('YuetaTop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.YuetaTop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[YuetaTop_UI].prefab'
    self.Name = 'Form[YuetaTop_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Img_TopOne','TopPanel/Img_TopOne',2},{'SpinePanel','TopPanel/Img_TopOne/SpinePanel',2},{'Img_Zhuzi','TopPanel/Img_TopOne/Img_Zhuzi',2},{'Img_paiming_1','TopPanel/Img_TopOne/Img_Zhuzi/Img_paiming_1',2},{'TopPanel','TopPanel/Img_TopOne/TopPanel',2},{'Img_NameBG','TopPanel/Img_TopOne/TopPanel/Img_NameBG',2},{'Img_TopTwo','TopPanel/Img_TopTwo',2},{'SpinePanel01','TopPanel/Img_TopTwo/SpinePanel',2},{'Img_Zhuzi01','TopPanel/Img_TopTwo/Img_Zhuzi',2},{'Img_paiming_101','TopPanel/Img_TopTwo/Img_Zhuzi/Img_paiming_1',2},{'TopPanel01','TopPanel/Img_TopTwo/TopPanel',2},{'Img_NameBG01','TopPanel/Img_TopTwo/TopPanel/Img_NameBG',2},{'Img_TopThree','TopPanel/Img_TopThree',2},{'SpinePanel02','TopPanel/Img_TopThree/SpinePanel',2},{'Img_Zhuzi02','TopPanel/Img_TopThree/Img_Zhuzi',2},{'Img_paiming_102','TopPanel/Img_TopThree/Img_Zhuzi/Img_paiming_1',2},{'TopPanel02','TopPanel/Img_TopThree/TopPanel',2},{'Img_NameBG02','TopPanel/Img_TopThree/TopPanel/Img_NameBG',2},{'RankPanel','RankPanel',2},{'Tab','RankPanel/Tab',2},{'Btn_CurRank','RankPanel/Tab/Btn_CurRank',2},{'Btn_BeforeRank','RankPanel/Tab/Btn_BeforeRank',2},{'RankScroll','RankPanel/RankScroll',2},{'MissedOut','RankPanel/RankOneself/MissedOut',2},{'RankItem','RankPanel/RankOneself/RankItem',2},{'Img_HeadMask','RankPanel/RankOneself/RankItem/Img_HeadMask',2},{'HeadIcon','RankPanel/RankOneself/RankItem/Img_HeadMask/HeadIcon',2},{'Img_HeadFrame','RankPanel/RankOneself/RankItem/Img_HeadFrame',2},{'Img_LVdi','RankPanel/RankOneself/RankItem/Img_LVdi',2},
        -- LoopScrollRect 列表
        {'RankScroll01','RankPanel/RankScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperLeftPanel/Text_TitleCn',20},{'Text_TitleEn','UpperLeftPanel/Text_TitleEn',20},{'Text_dengji','TopPanel/Img_TopOne/TopPanel/Text_dengji',20},{'Text_dengji2','TopPanel/Img_TopOne/TopPanel/Text_dengji/Text_dengji2',20},{'Text_Time','TopPanel/Img_TopOne/TopPanel/Text_Time',20},{'Text_Time2','TopPanel/Img_TopOne/TopPanel/Text_Time/Text_Time2',20},{'Text_Name','TopPanel/Img_TopOne/TopPanel/Img_NameBG/Text_Name',20},{'Text_Lv','TopPanel/Img_TopOne/TopPanel/Img_NameBG/Text_Lv',20},{'Text_dengji01','TopPanel/Img_TopTwo/TopPanel/Text_dengji',20},{'Text_dengji201','TopPanel/Img_TopTwo/TopPanel/Text_dengji/Text_dengji2',20},{'Text_Time01','TopPanel/Img_TopTwo/TopPanel/Text_Time',20},{'Text_Time201','TopPanel/Img_TopTwo/TopPanel/Text_Time/Text_Time2',20},{'Text_Name01','TopPanel/Img_TopTwo/TopPanel/Img_NameBG/Text_Name',20},{'Text_Lv01','TopPanel/Img_TopTwo/TopPanel/Img_NameBG/Text_Lv',20},{'Text_dengji02','TopPanel/Img_TopThree/TopPanel/Text_dengji',20},{'Text_dengji202','TopPanel/Img_TopThree/TopPanel/Text_dengji/Text_dengji2',20},{'Text_Time02','TopPanel/Img_TopThree/TopPanel/Text_Time',20},{'Text_Time202','TopPanel/Img_TopThree/TopPanel/Text_Time/Text_Time2',20},{'Text_Name02','TopPanel/Img_TopThree/TopPanel/Img_NameBG/Text_Name',20},{'Text_Lv02','TopPanel/Img_TopThree/TopPanel/Img_NameBG/Text_Lv',20},{'Text_CurRank','RankPanel/Tab/Btn_CurRank/Text_CurRank',20},{'Text_BeforeRank','RankPanel/Tab/Btn_BeforeRank/Text_BeforeRank',20},{'Text_yeqian1','RankPanel/Text_yeqian1',20},{'Text_yeqian2','RankPanel/Text_yeqian2',20},{'Text_yeqian3','RankPanel/Text_yeqian3',20},{'Text_yeqian4','RankPanel/Text_yeqian4',20},{'Text_LV','RankPanel/RankOneself/RankItem/Img_LVdi/Text_LV',20},{'Text_Top','RankPanel/RankOneself/RankItem/Text_Top',20},{'Text_Name03','RankPanel/RankOneself/RankItem/Text_Top/Text_Name',20},{'Text_TXLv','RankPanel/RankOneself/RankItem/Text_Top/Text_TXLv',20},{'Text_Time03','RankPanel/RankOneself/RankItem/Text_Top/Text_Time',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TopRank = {
        self.Img_TopOne(),self.Img_TopTwo(),self.Img_TopThree()
    }
    ---初始化排名滑块
    self.RankScroll01():SetLuaCellEvent(Handle(self,self.CellRankItem))
    ---排行数据
    self.RandData = YueTaControl.GetRankData()
    if self.RandData.lastInfo == nil then
        self.Btn_BeforeRank().gameObject:SetActive(false)
    end
    self.RankInfo = nil

    ---按钮
    self:InitButton()
    
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:InitButton()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    ---回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    ---当期排行
    UIEvent.LuaClick(self.Btn_CurRank().gameObject,function()
        self.Btn_CurRank().color = Color(1,1,1,1)
        self.Btn_BeforeRank().color = Color(1,1,1,0)
        self.Text_CurRank().color = Color(1,1,1,1)
        self.Text_BeforeRank().color = Color(0.6,0.6,0.6,1)
        ---刷新排行榜
        self:RefreshRank(true)
    end,nil,self.Btn_CurRank())
    ---往期排行
    UIEvent.LuaClick(self.Btn_BeforeRank().gameObject,function()
        self.Btn_CurRank().color = Color(1,1,1,0)
        self.Btn_BeforeRank().color = Color(1,1,1,1)
        self.Text_CurRank().color = Color(0.6,0.6,0.6,1)
        self.Text_BeforeRank().color = Color(1,1,1,1)
        ---刷新排行榜
        self:RefreshRank(false)
    end,nil,self.Btn_BeforeRank())
end

function M:OnUpdateUI()
    ---刷新排行榜
    self:RefreshRank(true)
end

---刷新排行榜
function M:RefreshRank(_IsCurPage)
    local ownRankInfo = self.RandData.ownInfo
    ---是否获取当期排行
    if _IsCurPage then
        self.RankInfo = self.RandData.info
    else
        self.RankInfo = self.RandData.lastInfo
        ownRankInfo = self.RandData.lastOwnInfo
    end
    
    self.RankScroll01().totalCount = self.RankInfo and #self.RankInfo or 0
    self.RankScroll01():RefillCells()
    ---玩家自己的排行信息
    self:RankScrollItem(self.RankItem().gameObject, ownRankInfo, true)
    ---前三玩家信息展示
    for i = 1, #self.TopRank do
        local tData = nil
        if self.RankInfo and i <= #self.RankInfo then
            tData = self.RankInfo[i]
        end
        self:ShowTop(self.TopRank[i], tData)
    end
end

function M:CellRankItem(trans,idx)
    self:RankScrollItem(trans.gameObject, self.RankInfo[idx])
end
---前三玩家信息展示
function M:ShowTop(_obj,_data)
    ---玩家信息节点
    local tTopPanel = CJNUIMgr.GetSunUseName(_obj.gameObject, "TopPanel")
    ---spine节点
    local tSpineNode = CJNUIMgr.GetSunUseName(_obj.gameObject, "SpinePanel")
    Tools.ClearAllChild(tSpineNode.gameObject)
    if _data == nil then
        tTopPanel.gameObject:SetActive(false)
        return
    else
        tTopPanel.gameObject:SetActive(true)
    end
    ---特性等级
    local tTXLv = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_dengji2"):GetComponent("TextMeshProUGUI")
    ---达成时间
    local tComplateTime = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Time2"):GetComponent("TextMeshProUGUI")
    ---玩家名
    local tRoleName = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Name"):GetComponent("TextMeshProUGUI")
    ---玩家等级
    local tRoleLv = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Lv"):GetComponent("TextMeshProUGUI")

    tRoleLv.text = "LV.".._data.level
    tRoleName.text = _data.nike
    tTXLv.text = _data.count
    
    local timeStr = string.split(Global.TimeToDate(_data.score),'-')
    tComplateTime.text = timeStr[2].."/"..timeStr[3].." "..timeStr[4]..":"..timeStr[5]
    ---排行榜人物
    if _data.menuRoleID ~= nil then
        MgrRes.LoadFightSpine(tSpineNode.gameObject,_data.menuRoleID,0,-110,25,"dj",function(obj)
            local str = obj.transform:GetComponent("MeshRenderer").material.name
            local name = string.gsub(str,"_Material %(Instance%)","_a")
            MgrRes.SetRoleMaterial(obj, tostring(_data.menuRoleID), name, "_MainTex")
            obj.transform.gameObject.layer = 5
            local ske = obj.transform:GetComponent("SkeletonAnimation")
            if ske then
                ske:SetOrderLayer(self.CavOrder+1,"Default")
            end
        end)
    end
end

---排行榜
function M:RankScrollItem(_obj, _data, _isOwn)
    ---排行
    local tRank = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Top"):GetComponent("TextMeshProUGUI")
    ---玩家等级
    local tRoleLv = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_LV"):GetComponent("TextMeshProUGUI")
    ---玩家名
    local tName = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Name"):GetComponent("TextMeshProUGUI")
    ---特性等级
    local tTXLv = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_TXLv"):GetComponent("TextMeshProUGUI")
    ---达成时间
    local tTime = CJNUIMgr.GetSunUseName(_obj.gameObject, "Text_Time"):GetComponent("TextMeshProUGUI")
    ---头像框
    local tHeadFrame = CJNUIMgr.GetSunUseName(_obj.gameObject, "Img_HeadFrame"):GetComponent("Image")
    ---头像
    local tHeadIcon = CJNUIMgr.GetSunUseName(_obj.gameObject, "HeadIcon"):GetComponent("Image")

    if _data then
        tRank.text = _data.rank+1
        tRoleLv.text = "LV.".._data.level
        tName.text = _data.nike
        tTXLv.text = _data.count

        local tStr = MgrLanguageData.GetLanguageByKey("pvpready_ui_norecord")
        if _data.score ~= 0 then
            tStr = string.split(Global.TimeToDate(_data.score),'-')
            tTime.text = tStr[2].."/"..tStr[3].." "..tStr[4]..":"..tStr[5]
        else
            tTime.text = tStr
        end
        ---更新头像
        local headConf = PlayheadLocalData.tab[_data.head]
        if headConf ~= nil then
            --MgrRes.LoadNormalIcon(self.Img_Head(),self.rankInfo.id)
            local _str = string.split(headConf.type,"_")
            if _str[1] == "0" then
                MgrRes.LoadNormalIcon(tHeadIcon,tonumber(string.split(headConf.type,"_")[2]))
            elseif _str[1] == "1" then
                MgrRes.LoadNormalIcon(tHeadIcon,tonumber(string.split(headConf.type,"_")[3]))
            end
        else
            Log.Error("头像id不存在,id:".._data.head)
        end
        ---更新头像框
        if _data.headFrame == 0 then
            MgrRes.LoadSprite(tHeadFrame,"Playheadicon/Touxiangkuang")
        else
            local hearFrameConf = PlayheadframeLocalData.tab[_data.headFrame][3]
            MgrRes.LoadSprite(tHeadFrame,"Playheadicon/" .. hearFrameConf)
        end
    elseif _isOwn then
        _obj:SetActive(false)
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
---返回按钮
function M:OnBackClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.GoBack()
end
---返回大厅按钮
function M:OnBackHomeClick()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end

return M