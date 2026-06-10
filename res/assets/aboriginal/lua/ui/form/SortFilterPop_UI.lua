-- Code Auto Create Begin
local M = Class('SortFilterPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.SortFilterPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[SortFilterPop_UI].prefab'
    self.Name = 'Form[SortFilterPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'FormSortFilterPop_UI','/',2},{'Btn_Exit','Btn_Exit',2},{'Style1','Style1',2},{'Style2','Style2',2},{'Img_Fenggexian','Style2/Img_Fenggexian',2},{'Img_Xian2','Style2/Img_Xian2',2},{'Img_Xian1','Style2/Img_Xian1',2},{'Style3','Style3',2},{'Img_Fenggexian01','Style3/Img_Fenggexian',2},{'Img_Xian201','Style3/Img_Xian2',2},{'Img_Xian101','Style3/Img_Xian1',2},{'shaixuandi','shaixuandi',2},{'Img_Xiexiandi1','shaixuandi/FilterLayer/Img_Xiexiandi1',2},{'FilterAllBtnPanel','shaixuandi/FilterLayer/FilterAllBtnPanel',2},{'FilterSelect','shaixuandi/FilterLayer/FilterAllBtnPanel/FilterSelect',2},{'FilterSelectHighLight','shaixuandi/FilterLayer/FilterAllBtnPanel/FilterSelectHighLight',2},{'FilterQiangjiBtnPanel','shaixuandi/FilterLayer/FilterQiangjiBtnPanel',2},{'FilterSelect01','shaixuandi/FilterLayer/FilterQiangjiBtnPanel/FilterSelect',2},{'FilterSelectHighLight01','shaixuandi/FilterLayer/FilterQiangjiBtnPanel/FilterSelectHighLight',2},{'FilterHuWeiBtnPanel','shaixuandi/FilterLayer/FilterHuWeiBtnPanel',2},{'FilterSelect02','shaixuandi/FilterLayer/FilterHuWeiBtnPanel/FilterSelect',2},{'FilterSelectHighLight02','shaixuandi/FilterLayer/FilterHuWeiBtnPanel/FilterSelectHighLight',2},{'FilterHongZhaBtnPanel','shaixuandi/FilterLayer/FilterHongZhaBtnPanel',2},{'FilterSelect03','shaixuandi/FilterLayer/FilterHongZhaBtnPanel/FilterSelect',2},{'FilterSelectHighLight03','shaixuandi/FilterLayer/FilterHongZhaBtnPanel/FilterSelectHighLight',2},{'FilterZhiYuanBtnPanel','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel',2},{'FilterSelect04','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel/FilterSelect',2},{'FilterSelectHighLight04','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel/FilterSelectHighLight',2},{'FilterSupperBtnPanel','shaixuandi/FilterLayer/FilterSupperBtnPanel',2},{'FilterSelect05','shaixuandi/FilterLayer/FilterSupperBtnPanel/FilterSelect',2},{'FilterSelectHighLight05','shaixuandi/FilterLayer/FilterSupperBtnPanel/FilterSelectHighLight',2},{'SortLayer','shaixuandi/SortLayer',2},{'Img_Xiexiandi2','shaixuandi/SortLayer/Img_Xiexiandi2',2},{'di(paixu)','shaixuandi/SortLayer/di(paixu)',2},{'SpecialLevel','shaixuandi/SortLayer/di(paixu)/SpecialLevel',2},{'SortBtn','shaixuandi/SortLayer/di(paixu)/SpecialLevel/SortBtn',2},{'ZhengXuSortUnSelect','shaixuandi/SortLayer/di(paixu)/SpecialLevel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight','shaixuandi/SortLayer/di(paixu)/SpecialLevel/HighLight',2},{'ZhengXuSortSelect','shaixuandi/SortLayer/di(paixu)/SpecialLevel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon(1)','shaixuandi/SortLayer/di(paixu)/SpecialLevel/HighLight/SelectedIcon (1)',2},{'DownHighLight','shaixuandi/SortLayer/di(paixu)/SpecialLevel/DownHighLight',2},{'FanXuSortSelect','shaixuandi/SortLayer/di(paixu)/SpecialLevel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon','shaixuandi/SortLayer/di(paixu)/SpecialLevel/DownHighLight/SelectedIcon',2},{'LevelSortBtnPanel','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel',2},{'SortBtn01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/SortBtn',2},{'ZhengXuSortUnSelect01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/HighLight',2},{'ZhengXuSortSelect01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon(1)01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/HighLight/SelectedIcon (1)',2},{'DownHighLight01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/DownHighLight',2},{'FanXuSortSelect01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/DownHighLight/SelectedIcon',2},{'StarSortBtnPanel','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel',2},{'SortBtn02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/SortBtn',2},{'ZhengXuSortUnSelect02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/HighLight',2},{'ZhengXuSortSelect02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/HighLight/SelectedIcon',2},{'DownHighLight02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/DownHighLight',2},{'FanXuSortSelect02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon(1)02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/DownHighLight/SelectedIcon (1)',2},{'RareSortBtnPanel','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel',2},{'SortBtn03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/SortBtn',2},{'ZhengXuSortUnSelect03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/HighLight',2},{'ZhengXuSortSelect03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/HighLight/SelectedIcon',2},{'DownHighLight03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/DownHighLight',2},{'FanXuSortSelect03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon(1)03','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/DownHighLight/SelectedIcon (1)',2},{'LikeSortBtnPanel','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel',2},{'SortBtn04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/SortBtn',2},{'ZhengXuSortUnSelect04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/HighLight',2},{'ZhengXuSortSelect04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/HighLight/SelectedIcon',2},{'DownHighLight04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/DownHighLight',2},{'FanXuSortSelect04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon(1)04','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/DownHighLight/SelectedIcon (1)',2},{'AchieveSortBtnPanel','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel',2},{'SortBtn05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/SortBtn',2},{'ZhengXuSortUnSelect05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/SortBtn/ZhengXuSortUnSelect',2},{'HighLight05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/HighLight',2},{'ZhengXuSortSelect05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/HighLight/ZhengXuSortSelect',2},{'SelectedIcon05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/HighLight/SelectedIcon',2},{'DownHighLight05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/DownHighLight',2},{'FanXuSortSelect05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/DownHighLight/FanXuSortSelect',2},{'SelectedIcon(1)05','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/DownHighLight/SelectedIcon (1)',2},{'Btn_Confirm2','Btn_Confirm2',2},{'Btn_Exit2','Btn_Exit2',2},
        -- Button 列表
        {'Btn_Exit01','Btn_Exit',4},{'Btn_Confirm201','Btn_Confirm2',4},{'Btn_Exit201','Btn_Exit2',4},
        -- Toggle 列表
        {'FilterAllBtnPanel01','shaixuandi/FilterLayer/FilterAllBtnPanel',13},{'FilterQiangjiBtnPanel01','shaixuandi/FilterLayer/FilterQiangjiBtnPanel',13},{'FilterHuWeiBtnPanel01','shaixuandi/FilterLayer/FilterHuWeiBtnPanel',13},{'FilterHongZhaBtnPanel01','shaixuandi/FilterLayer/FilterHongZhaBtnPanel',13},{'FilterZhiYuanBtnPanel01','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel',13},{'FilterSupperBtnPanel01','shaixuandi/FilterLayer/FilterSupperBtnPanel',13},{'SpecialLevel01','shaixuandi/SortLayer/di(paixu)/SpecialLevel',13},{'LevelSortBtnPanel01','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel',13},{'StarSortBtnPanel01','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel',13},{'RareSortBtnPanel01','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel',13},{'LikeSortBtnPanel01','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel',13},{'AchieveSortBtnPanel01','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel',13},
        -- TextMeshProUGUI 列表
        {'Text_Zhiye','shaixuandi/FilterLayer/Text_Zhiye',20},{'SelectText','shaixuandi/FilterLayer/FilterAllBtnPanel/FilterSelect/SelectText',20},{'SelectText01','shaixuandi/FilterLayer/FilterAllBtnPanel/FilterSelectHighLight/SelectText',20},{'SelectText02','shaixuandi/FilterLayer/FilterQiangjiBtnPanel/FilterSelect/SelectText',20},{'SelectText03','shaixuandi/FilterLayer/FilterQiangjiBtnPanel/FilterSelectHighLight/SelectText',20},{'SelectText04','shaixuandi/FilterLayer/FilterHuWeiBtnPanel/FilterSelect/SelectText',20},{'SelectText05','shaixuandi/FilterLayer/FilterHuWeiBtnPanel/FilterSelectHighLight/SelectText',20},{'SelectText06','shaixuandi/FilterLayer/FilterHongZhaBtnPanel/FilterSelect/SelectText',20},{'SelectText07','shaixuandi/FilterLayer/FilterHongZhaBtnPanel/FilterSelectHighLight/SelectText',20},{'SelectText08','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel/FilterSelect/SelectText',20},{'SelectText09','shaixuandi/FilterLayer/FilterZhiYuanBtnPanel/FilterSelectHighLight/SelectText',20},{'SelectText10','shaixuandi/FilterLayer/FilterSupperBtnPanel/FilterSelect/SelectText',20},{'SelectText11','shaixuandi/FilterLayer/FilterSupperBtnPanel/FilterSelectHighLight/SelectText',20},{'Text_Pailie','shaixuandi/SortLayer/Text_Pailie',20},{'LVSortText','shaixuandi/SortLayer/di(paixu)/SpecialLevel/SortBtn/LVSortText',20},{'LVSortText01','shaixuandi/SortLayer/di(paixu)/SpecialLevel/HighLight/LVSortText',20},{'LVSortText02','shaixuandi/SortLayer/di(paixu)/SpecialLevel/DownHighLight/LVSortText',20},{'LVSortText03','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/SortBtn/LVSortText',20},{'LVSortText04','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/HighLight/LVSortText',20},{'LVSortText05','shaixuandi/SortLayer/di(paixu)/LevelSortBtnPanel/DownHighLight/LVSortText',20},{'StarSortText','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/SortBtn/StarSortText ',20},{'StarSortText01','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/HighLight/StarSortText',20},{'StarSortText02','shaixuandi/SortLayer/di(paixu)/StarSortBtnPanel/DownHighLight/StarSortText',20},{'RareSortText','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/SortBtn/RareSortText',20},{'RareSortText01','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/HighLight/RareSortText',20},{'RareSortText02','shaixuandi/SortLayer/di(paixu)/RareSortBtnPanel/DownHighLight/RareSortText',20},{'LikeSortText','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/SortBtn/LikeSortText',20},{'LikeSortText01','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/HighLight/LikeSortText',20},{'LikeSortText02','shaixuandi/SortLayer/di(paixu)/LikeSortBtnPanel/DownHighLight/LikeSortText',20},{'AchieveSortText','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/SortBtn/AchieveSortText',20},{'AchieveSortText01','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/HighLight/AchieveSortText',20},{'AchieveSortText02','shaixuandi/SortLayer/di(paixu)/AchieveSortBtnPanel/DownHighLight/AchieveSortText',20},{'Text_con','Btn_Confirm2/Text_con',20},{'Text_ex','Btn_Exit2/Text_ex',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---职业排序数组
    self.filter = {
        [0] = true,
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [11] = false,
    }
    ---当前排序类型
    self.sort = 1
    ---排序方向
    self.rise = true
    ---获取排序按钮
    self.SortName = {
        [1] = self.LevelSortBtnPanel().gameObject,
        [2] = self.StarSortBtnPanel().gameObject,
        [3] = self.RareSortBtnPanel().gameObject,
        [4] = self.LikeSortBtnPanel().gameObject,
        [5] = self.AchieveSortBtnPanel().gameObject,
    }
    ---获取职业按钮
    self.FilterTogs = {
        [1] = self.FilterAllBtnPanel().gameObject:GetComponent("Toggle"),
        [2] = self.FilterHuWeiBtnPanel().gameObject:GetComponent("Toggle"),
        [3] = self.FilterQiangjiBtnPanel().gameObject:GetComponent("Toggle"),
        [4] = self.FilterHongZhaBtnPanel().gameObject:GetComponent("Toggle"),
        [5] = self.FilterZhiYuanBtnPanel().gameObject:GetComponent("Toggle"),
        [12] = self.FilterSupperBtnPanel().gameObject:GetComponent("Toggle"),
    }
    self.FilterObjHl = {}
    ---全部默认设置为打开
    self.FilterTogs[1].isOn = true

    ---职业按钮绑定事件
    for index, filterTog in pairs(self.FilterTogs) do
        self.FilterObjHl[index] = filterTog.transform:Find("FilterSelectHighLight").gameObject
        self.FilterObjHl[index]:SetActive(index == 1)
        if index == 1 then
            Tools.ToggleValueChange(filterTog,function(isOn)
                self.FilterObjHl[index]:SetActive(isOn)
                self.filter[index - 1] = isOn
                if isOn then
                    self.FilterTogs[2].isOn = false
                    self.FilterTogs[3].isOn = false
                    self.FilterTogs[4].isOn = false
                    self.FilterTogs[5].isOn = false
                    self.FilterTogs[12].isOn = false
                end
            end,nil)
        else
            Tools.ToggleValueChange(filterTog,function(isOn)
                self.FilterObjHl[index]:SetActive(isOn)
                self.filter[index - 1] = isOn
                if isOn then
                    self.FilterTogs[1].isOn = false
                end
                if self.filter[1] and self.filter[2] and self.filter[3] and self.filter[4] and self.filter[11] then
                    self.FilterTogs[1].isOn = true
                end
            end,nil)
        end
    end
    ---排序按钮绑定事件
    for index, sortObj in ipairs(self.SortName) do
        local riseObjArr = {
            sortObj.transform:Find("HighLight").gameObject,
            sortObj.transform:Find("DownHighLight").gameObject,
        }
        Tools.ToggleValueChange(sortObj:GetComponent("Toggle"),Handle(self,function(self, isOn)
            sortObj.transform:Find("SortBtn").gameObject:SetActive(not isOn)
            if not isOn then
                riseObjArr[1]:SetActive(false)
                riseObjArr[2]:SetActive(false)
            else
                if self.rise then
                    riseObjArr[1]:SetActive(true)
                    riseObjArr[2]:SetActive(false)
                else
                    riseObjArr[1]:SetActive(false)
                    riseObjArr[2]:SetActive(true)
                end
            end
            self.sort = index
        end),nil)

        for j, k in ipairs(riseObjArr) do
            UIEvent.LuaClick(k,function()
                riseObjArr[1]:SetActive(not riseObjArr[1].activeSelf)
                riseObjArr[2]:SetActive(not riseObjArr[2].activeSelf)
                self.rise =  riseObjArr[1].activeSelf
            end)
        end
    end
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        self:ClosePop()
    end
end
---pData: 1当前排序方向
function M:OnShow(pData)
    ---回调
    self.Callback = pData[1]
    ---风格
    self.style = pData[2]
    ---数据
    self.data = pData[3]
    ---筛选类型
    self.sortType = pData[4]
    self.Style1().gameObject:SetActive(self.style == 1)
    self.Style2().gameObject:SetActive(self.style == 2)
    self.Style3().gameObject:SetActive(self.style == 3)
    self.SortLayer().gameObject:SetActive(self.style ~= 3)
   
    ---更新按钮状态
    if self.data then
        ---根据上一次选择的数据更新UI
        self.filter = self.data[1]
        self.sort = self.data[2]
        self.rise = self.data[3]
        for i,v in pairs(self.filter) do
            if v then
                self.nullFilter = false
                self.FilterTogs[i + 1].isOn = true
            end
        end
        if self.nullFilter then
            ---全部默认设置为打开
            self.FilterTogs[1].isOn = true
        end
    end
    for i, v in pairs(self.SortName) do
        local riseObjArr = {
            v.transform:Find("HighLight").gameObject,
            v.transform:Find("DownHighLight").gameObject,
        }
        if i==self.sort then
            if self.sort == 1 then
                if self.sortType == RoleCardViewModel.FilterType.Special then
                    riseObjArr[1].transform:Find("LVSortText"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("bag_ui_core_zhuanshugongming_2")
                    riseObjArr[2].transform:Find("LVSortText"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("bag_ui_core_zhuanshugongming_2")
                elseif self.sortType == RoleCardViewModel.FilterType.Role then
                    riseObjArr[1].transform:Find("LVSortText"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text25")
                    riseObjArr[2].transform:Find("LVSortText"):GetComponent("TextMeshProUGUI").text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text25")
                end
            end
            if self.rise then
                riseObjArr[1]:SetActive(true)
                riseObjArr[2]:SetActive(false)
            else
                riseObjArr[1]:SetActive(false)
                riseObjArr[2]:SetActive(true)
            end
            v:GetComponent("Toggle").isOn = true
            v.transform:Find("SortBtn").gameObject:SetActive(false)
        else
            riseObjArr[1]:SetActive(false)
            riseObjArr[2]:SetActive(false)
        end
    end
    ---确认按钮
    UIEvent.LuaClick(self.Btn_Confirm2().gameObject,function()
        self.Callback(self.filter,self.sort,self.rise)
        self:ClosePop()
    end)
    ---退出按钮
    UIEvent.LuaClick(self.Btn_Exit().gameObject,function()
        self:ClosePop()
    end)
    UIEvent.LuaClick(self.Btn_Exit2().gameObject,function()
        self:ClosePop()
    end)
end
function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

return M