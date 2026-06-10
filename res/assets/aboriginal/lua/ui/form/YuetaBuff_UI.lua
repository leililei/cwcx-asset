-- Code Auto Create Begin
local M = Class('YuetaBuff_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.YuetaBuff_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[YuetaBuff_UI].prefab'
    self.Name = 'Form[YuetaBuff_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BG','BG',2},{'Img_di','RightPanel/Img_di',2},{'NamePanel','RightPanel/NamePanel',2},{'Img_Biaotixian1','RightPanel/NamePanel/Text_TexingName/Img_Biaotixian1',2},{'Img_Pointdi','RightPanel/PointPanel/Img_Pointdi',2},{'Img_PointTiao','RightPanel/PointPanel/Img_PointTiao',2},{'Img_Biaotixian101','RightPanel/PointPanel/Text_Texingdengji/Img_Biaotixian1',2},{'Btn_InPoint','RightPanel/Btn_InPoint',2},{'Img_Xian1','PTIconPanel/Img_Xian1',2},{'Img_Xian2','PTIconPanel/Img_Xian2',2},{'PTIconScroll','PTIconPanel/PTIconScroll',2},{'PTIconPrefab','PTIconPanel/PTIconScroll/PTIconPrefab',2},{'Img_PTIconRank','PTIconPanel/PTIconScroll/PTIconPrefab/Img_PTIconRank',2},{'Img_BuffTarget','PTIconPanel/PTIconScroll/PTIconPrefab/Img_BuffTarget',2},{'Img_PTIcondi','PTIconPanel/PTIconScroll/PTIconPrefab/Img_PTIcondi',2},{'PTIcon','PTIconPanel/PTIconScroll/PTIconPrefab/Img_PTIcondi/PTIcon',2},{'Img_PTIconMask_xz','PTIconPanel/PTIconScroll/PTIconPrefab/Img_PTIconMask_xz',2},{'Img_PTIconkuang_xz','PTIconPanel/PTIconScroll/PTIconPrefab/Img_PTIconkuang_xz',2},{'PTIconContent','PTIconPanel/PTIconScroll/PTIconContent',2},{'SwitchPanel','SwitchPanel',2},{'Img_PTYeqian_h','SwitchPanel/Content/Img_PTYeqian_h',2},{'ALL','SwitchPanel/Content/ALL',2},{'PT1','SwitchPanel/Content/PT1',2},{'Img_PTYeqian_1','SwitchPanel/Content/PT1/Img_PTYeqian_1',2},{'PT2','SwitchPanel/Content/PT2',2},{'Img_PTYeqian_2','SwitchPanel/Content/PT2/Img_PTYeqian_2',2},{'PT3','SwitchPanel/Content/PT3',2},{'Img_PTYeqian_3','SwitchPanel/Content/PT3/Img_PTYeqian_3',2},{'PT4','SwitchPanel/Content/PT4',2},{'Img_PTYeqian_4','SwitchPanel/Content/PT4/Img_PTYeqian_4',2},{'PT5','SwitchPanel/Content/PT5',2},{'Img_PTYeqian_5','SwitchPanel/Content/PT5/Img_PTYeqian_5',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},
        -- LoopScrollRect 列表
        {'PTIconScroll01','PTIconPanel/PTIconScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TexingName','RightPanel/NamePanel/Text_TexingName',20},{'Text_particulars','RightPanel/NamePanel/Text_particulars',20},{'Text_En','RightPanel/PointPanel/Text_En',20},{'Text_PT','RightPanel/PointPanel/Text_PT',20},{'Text_Texingdengji','RightPanel/PointPanel/Text_Texingdengji',20},{'Text_Texingshu','RightPanel/Text_Texingshu',20},{'Text_Jinru','RightPanel/Btn_InPoint/Text_Jinru',20},{'Text_BtnName','SwitchPanel/Content/ALL/Text_BtnName',20},{'Text_BtnName01','SwitchPanel/Content/PT1/Text_BtnName',20},{'Text_BtnName02','SwitchPanel/Content/PT2/Text_BtnName',20},{'Text_BtnName03','SwitchPanel/Content/PT3/Text_BtnName',20},{'Text_BtnName04','SwitchPanel/Content/PT4/Text_BtnName',20},{'Text_BtnName05','SwitchPanel/Content/PT5/Text_BtnName',20},{'Text_TitleCn','UpperLeftPanel/Text_TitleCn',20},{'Text_TitleEn','UpperLeftPanel/Text_TitleEn',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.SwitchBtns = {
        self.ALL(),self.PT1(),self.PT2(),self.PT3(),self.PT4(),self.PT5()
    }
    self.CurBtn = nil
    self.BuffList = {}
    self.CurBuff = nil
    ---已选BUFF列表
    self.SelectBuffLists = YueTaViewModel.GetServerData().innerTowerBuffSave and YueTaViewModel.GetServerData().innerTowerBuffSave or {}
    ---BUFF积分
    self.BuffPoint = 0
    ---选中框
    self.SelectFrame = nil
    ---当前页签BUFF列表
    self.CurBuffList = nil
    ---是否为展示模式
    self.IsBuffShow = false
    ---初始化滑块
    self.PTIconScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    self.NamePanel().gameObject:SetActive(false)
    
    self:InitButton()
    ---如果没有选BUFF，则开启选择。已选，则开启展示
    self.BuffList = self:TotlePoint()
    if YueTaViewModel.GetServerData().innerTowerBuff == nil then
        self.Btn_InPoint().gameObject:SetActive(true)
    else
        self.IsBuffShow = true
        self.Btn_InPoint().gameObject:SetActive(false)
    end
    self:UpdatePT(self.BuffList)
end

function M:InitButton()
    ---退出点击
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,self.OnBackClick))
    UIEvent.LuaClick(self.Btn_I().gameObject,Handle(self,function()
        ActiveTutorialControl.OpenGuide(YueTaControl.GetYueTaInfo().group)
    end))
    ---回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject,Handle(self,self.OnBackHomeClick))
    ---进入战斗
    UIEvent.LuaClick(self.Btn_InPoint().gameObject,function()
        if #self.SelectBuffLists == 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_33"),1},true)
            return
        end
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_yueseshenyuan_32"),Handle(self,self.CheckBuff),nil,2},true)
    end)
    ---筛选
    for i, v in ipairs(self.SwitchBtns) do
        UIEvent.LuaClick(v.gameObject,function()
            if self.CurBtn == v then
                return
            end
            self.CurBtn.transform:Find("Text_BtnName"):GetComponent("TextMeshProUGUI").color = Color.white
            self.CurBtn = v
            v.transform:Find("Text_BtnName"):GetComponent("TextMeshProUGUI").color = Color.black
            self.Img_PTYeqian_h().transform.localPosition = v.transform.localPosition

            local tList = {}
            if i == 1 then
                tList = self.BuffList
            else
                for n, buffData in ipairs(self.BuffList) do
                    if i-1 == buffData.score then
                        table.insert(tList,buffData)
                    end
                end
            end
            self:UpdatePT(tList)
        end)
        if v == self.ALL() then
            self.CurBtn = self.ALL()
        end
    end
end
---刷新BUFF显示信息
function M:RefreshBuff()
    ---已选特性 数量/总数
    self.Text_Texingshu().text = "/"..#self.BuffList
    ---特性等级
    self.Text_PT().text = self.BuffPoint
    self.Text_Texingshu().text = #self.SelectBuffLists.."/"..#self.BuffList

    local Stage,TextColor,PointLimit = YueTaControl.CheckStage(self.BuffPoint)
    MgrRes.LoadSprite(self.Img_PointTiao(), "Yueta/Img_bar_"..Stage)
    self.Text_En().color = TextColor[1]
    self.Text_PT().color = TextColor[2]
    self.Img_PointTiao().fillAmount = self.BuffPoint/PointLimit
    ---当前选中BUFF说明
    if self.CurBuff then
        ---BUFF名
        self.Text_TexingName().text = self.CurBuff.BUFFName
        ---BUFF说明
        self.Text_particulars().text = self.CurBuff.BUFFTips
        self.NamePanel().gameObject:SetActive(true)
    else
        self.NamePanel().gameObject:SetActive(false)
    end
end

function M:CellItem(trans, idx)
    self:BuffUI(trans.gameObject,self.CurBuffList[idx])
end

function M:BuffUI(_obj,_data)
    if self.IsBuffShow and not Global.Contains(self.SelectBuffLists,_data.id) then
        _obj:SetActive(false)
        return
    else
        _obj:SetActive(true)
    end
    ---BUFF品质
    local _PTIconRank = CJNUIMgr.GetSunUseName(_obj, "Img_PTIconRank"):GetComponent("Image")
    ---BUFF对象
    local _BuffTarget = CJNUIMgr.GetSunUseName(_obj, "Img_BuffTarget"):GetComponent("Image")
    ---BUFF图标
    local _PTIcon = CJNUIMgr.GetSunUseName(_obj, "PTIcon"):GetComponent("Image")
    ---BUFF选中状态
    local _PTIconMask = CJNUIMgr.GetSunUseName(_obj, "Img_PTIconMask_xz")
    ---BUFF选中框
    local _PTIconkuang = CJNUIMgr.GetSunUseName(_obj, "Img_PTIconkuang_xz")
    
    _PTIconkuang.gameObject:SetActive(false)
    MgrRes.LoadSprite(_PTIconRank, "Yueta/Img_PTIconRank_".._data.score)
    MgrRes.LoadSprite(_BuffTarget, "Yueta/"..YueTaControl.TargetRes[_data.buffTarget])
    if _data.BUFFImg ~= "0" then
        MgrRes.LoadSprite(_PTIcon, _data.BUFFImg)
    end
    ---BUFF选中状态
    if #self.SelectBuffLists > 0 and Global.Contains(self.SelectBuffLists,_data.id)  then
        _PTIconMask.gameObject:SetActive(not self.IsBuffShow)
    else
        _PTIconMask.gameObject:SetActive(false)
    end
    if #self.SelectBuffLists > 0 and Global.Contains(self.SelectBuffLists,_data.id) then
    end
    UIEvent.LuaClick(_obj,function()
        if self.CurBuff == _data then
            --self.CurBuff = nil
        else
            self.CurBuff = _data
            if self.SelectFrame then
                self.SelectFrame.gameObject:SetActive(false)
            end
            self.SelectFrame = _PTIconkuang
            self.SelectFrame.gameObject:SetActive(true)
        end

        if not self.IsBuffShow then
            if #self.SelectBuffLists > 0 and Global.Contains(self.SelectBuffLists,_data.id) then
                self.BuffPoint = self.BuffPoint - _data.score
                _PTIconMask.gameObject:SetActive(false)

                for i, v in pairs(self.SelectBuffLists) do
                    if _data.id == v then
                        table.remove(self.SelectBuffLists,i)
                        break
                    end
                end
            else
                self.BuffPoint = self.BuffPoint + _data.score
                _PTIconMask.gameObject:SetActive(true)
                table.insert(self.SelectBuffLists, _data.id)
            end
        end
       
        ---刷新BUFF显示信息
        self:RefreshBuff()
    end)
end

function M:UpdatePT(_buffList)
    --Tools.ClearAllChild(self.PTIconContent().gameObject)
    ---清除当前选中框
    self.SelectFrame = nil
    self.CurBuff = nil
    self.NamePanel().gameObject:SetActive(false)
    
    self.CurBuffList = _buffList
    self.PTIconScroll01().totalCount = #self.CurBuffList
    self.PTIconScroll01():RefillCells()
end

---计算总分,筛选BUFF(将配表中未启用的BUFF排除)
function M:TotlePoint()
    local list = {}
    local tSelList = {}
    local tAllBuff = YueTaControl.GetBuffList()
    for i, v in ipairs(self.SelectBuffLists) do
        if tAllBuff[v] then
            self.BuffPoint = self.BuffPoint + tAllBuff[v].score
            if YueTaViewModel.GetServerData().innerTowerBuff ~= nil then
                table.insert(list, tAllBuff[v])
            end
            table.insert(tSelList, v)
        end
    end
    if #list == 0 then
        list = tAllBuff
    end
    self.SelectBuffLists = tSelList
    
    return list
end

function M:OnUpdateUI()
    ---特性等级更新
    self:UpdatePoint()
end

---特性等级更新
function M:UpdatePoint()
    --self.BuffPoint = YueTaViewModel.GetInnerBuffPT()
    self.Text_PT().text = self.BuffPoint
    self.Text_Texingshu().text = #self.SelectBuffLists.."/"..#self.BuffList

    local Stage,TextColor,PointLimit = YueTaControl.CheckStage(self.BuffPoint)
    MgrRes.LoadSprite(self.Img_PointTiao(), "Yueta/Img_bar_"..Stage)
    self.Text_En().color = TextColor[1]
    self.Text_PT().color = TextColor[2]
    self.Img_PointTiao().fillAmount = self.BuffPoint/PointLimit
end

function M:CheckBuff()
    if not YueTaViewModel.GetYuetaData():CheckUnlock() then
        ---提示尚未解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("eventraid_ui_tips1"),1},true)
        return
    end
    --local IsSame = true
    --local tOldBuff = YueTaViewModel.GetServerData().innerTowerBuffSave and YueTaViewModel.GetServerData().innerTowerBuffSave or {}
    --if #tOldBuff == #self.SelectBuffLists and #self.SelectBuffLists ~= 0 then
    --    table.sort(tOldBuff,function(a,b)
    --        return a < b
    --    end)
    --    table.sort(self.SelectBuffLists,function(a,b)
    --        return a < b
    --    end)
    --    for i = 1, #tOldBuff do
    --        if tOldBuff[i] ~= self.SelectBuffLists[i] then
    --            IsSame = false
    --            break
    --        end
    --    end
    --elseif #tOldBuff ~= #self.SelectBuffLists then
    --    IsSame = false
    --end
    --if IsSame then
    --    self:StartBattle()
    --else
        ---保存BUFF后，进入战斗
        YueTaControl.SaveBuff(self.SelectBuffLists,function()
            --self:StartBattle()
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            MgrUI.GoBack(function()
                YueTaControl.SetMode(YueTaControl.ModeType.HARD)
                YueTaControl.OpenUI()
            end)
        end)
    --end
end
function M:StartBattle()
    local tCurPointData = YueTaControl.GetCurPoint()
    if not tCurPointData.isEmpty and tCurPointData:CheckLock() then
        BattleManager.GameMode = BattleManager.GameModeType.MonthTower
        StormViewModel.CurPointType = StormViewModel.PointType.monthTower
        StormViewModel.CurPointData = tCurPointData
        StormViewModel.CurChooseMonthTower = self.CurChooseMonthTower
        MgrBattle.GoFight(MgrBattle.fightType.normal,nil,tCurPointData.battleMap)
    else
        ---提示尚未解锁
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("checkpointdata_tips3"),1},true)
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() then --没有pop打开
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
    StormViewModel.ClearData()
    MgrUI.GoBackTo(UID.Home_UI)
end
return M