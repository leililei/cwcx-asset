-- Code Auto Create Begin
local M = Class('RoleArchive_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.RoleArchive_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[RoleArchive_UI].prefab'
    self.Name = 'Form[RoleArchive_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_DragFrame','Img_DragFrame',2},{'SpinePanel','SpinePanel',2},{'Img_BGParent','SpinePanel/Img_BGParent',2},{'Img_BG','SpinePanel/Img_BGParent/Img_BG',2},{'Img_Shuping','SpinePanel/Img_BGParent/Img_Shuping',2},{'Img_ShupingZhuangshi','SpinePanel/Img_BGParent/Img_Shuping/Img_ShupingZhuangshi',2},{'LihuiPanelParent','SpinePanel/LihuiPanelParent',2},{'LihuiPanel','SpinePanel/LihuiPanelParent/LihuiPanel',2},{'LihuiSpinePanel','SpinePanel/LihuiPanelParent/LihuiPanel/LihuiSpinePanel',2},{'RoleSpineClickArea','SpinePanel/LihuiPanelParent/LihuiPanel/LihuiSpinePanel/RoleSpineClickArea',2},{'FrontSpriteParent','SpinePanel/FrontSpriteParent',2},{'FrontSprite','SpinePanel/FrontSpriteParent/FrontSprite',2},{'UI_Canvas','UI_Canvas',2},{'Img_Switchdi','UI_Canvas/Img_Switchdi',2},{'Img_Zhezhao','UI_Canvas/Img_Zhezhao',2},{'UpperLeftPanel','UI_Canvas/UpperLeftPanel',2},{'Img_Fenggexian','UI_Canvas/UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UI_Canvas/UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UI_Canvas/UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UI_Canvas/UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UI_Canvas/UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','UI_Canvas/SwitchPanel',2},{'Img_Qieyexian','UI_Canvas/SwitchPanel/Img_Qieyexian',2},{'SwitchPrefab','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab',2},{'TogPanel','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel',2},{'Btn_Switch','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_Switch',2},{'Img_Qieyedian','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_Switch/Img_Qieyedian',2},{'Btn_SwitchHighLight','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'Img_Qieyedi','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/SwitchPanelSecond/Img_Qieyedi',2},{'Img_Qieyedi_H','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/SwitchPanelSecond/Img_Qieyedi_H',2},{'Img_Qieyekuang','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/SwitchPanelSecond/Img_Qieyedi_H/Img_Qieyekuang',2},{'Expand','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/Expand',2},{'RoleInfoPanel','UI_Canvas/RoleInfoPanel',2},{'Haogandu','UI_Canvas/RoleInfoPanel/Haogandu',2},{'RoleFavorability','UI_Canvas/RoleInfoPanel/RoleFavorability',2},{'CenterFavorSlider','UI_Canvas/RoleInfoPanel/RoleFavorability/CenterFavorSlider',2},{'RoleOccupationImg','UI_Canvas/RoleInfoPanel/RoleOccupationImg',2},{'Chenghao','UI_Canvas/RoleInfoPanel/Chenghao',2},{'RoleNameBG','UI_Canvas/RoleInfoPanel/RoleNameBG',2},{'CvPanel','UI_Canvas/RoleInfoPanel/CvPanel/CvPanel',2},{'CVIcon','UI_Canvas/RoleInfoPanel/CvPanel/CVIcon',2},{'Btn_ExPlay','UI_Canvas/RoleInfoPanel/Btn_ExPlay',2},{'RightPanel','UI_Canvas/RightPanel',2},{'Btn_Chakan','UI_Canvas/RightPanel/Btn_Chakan',2},{'Chakan','UI_Canvas/RightPanel/Btn_Chakan/Chakan',2},{'Icon','UI_Canvas/RightPanel/Btn_Chakan/Chakan/Icon',2},{'Btn_Shuxing','UI_Canvas/RightPanel/Btn_Shuxing',2},{'Icon01','UI_Canvas/RightPanel/Btn_Shuxing/Icon',2},{'Img_Xian','UI_Canvas/RightPanel/Img_Xian',2},{'Img_Tanchuangdi','UI_Canvas/RightPanel/Img_Tanchuangdi',2},{'ScrollbarVertical','UI_Canvas/RightPanel/PesonalScroll/ScrollbarVertical',2},{'Handle','UI_Canvas/RightPanel/PesonalScroll/ScrollbarVertical/SlidingArea/Handle',2},{'PersonalItem','UI_Canvas/RightPanel/PesonalScroll/PersonalItem',2},{'PesonalContent','UI_Canvas/RightPanel/PesonalScroll/PesonalContent',2},{'ScrollbarVertical01','UI_Canvas/RightPanel/VoiceScroll/ScrollbarVertical',2},{'Handle01','UI_Canvas/RightPanel/VoiceScroll/ScrollbarVertical/SlidingArea/Handle',2},{'VoiceContent','UI_Canvas/RightPanel/VoiceScroll/VoiceContent',2},{'VoiceItem','UI_Canvas/RightPanel/VoiceScroll/VoiceItem',2},{'Btn_Qiehuan','UI_Canvas/RightPanel/Btn_Qiehuan',2},{'Btn_Qiehuan01','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_Qiehuan',2},{'ArchiveIcon','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_Qiehuan/ArchiveIcon',2},{'Btn_QiehuanHighLight','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_QiehuanHighLight',2},{'ArchiveIcon_H','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_QiehuanHighLight/ArchiveIcon_H',2},{'Btn_Qiehuan02','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_Qiehuan',2},{'VoiceIcon','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_Qiehuan/VoiceIcon',2},{'Btn_QiehuanHighLight01','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_QiehuanHighLight',2},{'VoiceIcon_H','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_QiehuanHighLight/VoiceIcon_H',2},{'Btn_ChakanHighLight','UI_Canvas/Btn_ChakanHighLight',2},{'ChakanHighLight','UI_Canvas/Btn_ChakanHighLight/ChakanHighLight',2},{'Icon02','UI_Canvas/Btn_ChakanHighLight/ChakanHighLight/Icon',2},{'ScalePanel','UI_Canvas/ScalePanel',2},{'Btn_Shuping','UI_Canvas/ScalePanel/Btn_Shuping',2},{'Image','UI_Canvas/ScalePanel/Slider_Scale/Image',2},{'Fill','UI_Canvas/ScalePanel/Slider_Scale/Fill Area/Fill',2},{'Background','UI_Canvas/ScalePanel/Slider_Scale/Background',2},{'Handle02','UI_Canvas/ScalePanel/Slider_Scale/Handle Slide Area/Handle',2},{'Btn_Reset','UI_Canvas/ScalePanel/Btn_Reset',2},{'Img_Scale1','UI_Canvas/ScalePanel/Img_Scale1',2},{'Img_Scale2','UI_Canvas/ScalePanel/Img_Scale2',2},{'Img_Scale3','UI_Canvas/ScalePanel/Img_Scale3',2},{'Btn_Hide','UI_Canvas/Btn_Hide',2},{'Img_Hide','UI_Canvas/Btn_Hide/Img_Hide',2},{'Img_DragBG','Img_DragBG',2},{'Btn_Mask','Btn_Mask',2},
        -- Slider 列表
        {'Slider_Scale','UI_Canvas/ScalePanel/Slider_Scale',5},
        -- UITemplate 列表
        {'PersonalItem01','UI_Canvas/RightPanel/PesonalScroll/PersonalItem',10},{'VoiceItem01','UI_Canvas/RightPanel/VoiceScroll/VoiceItem',10},
        -- Toggle 列表
        {'SwitchPrefab01','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab',13},{'SwitchPanelSecond','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/SwitchPanelSecond',13},{'QiehuanArchive','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive',13},{'QiehuanVoice','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice',13},
        -- RawImage 列表
        {'SwitchScroll','UI_Canvas/SwitchPanel/SwitchScroll',15},{'PesonalScroll','UI_Canvas/RightPanel/PesonalScroll',15},{'VoiceScroll','UI_Canvas/RightPanel/VoiceScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','UI_Canvas/SwitchPanel/SwitchScroll',18},{'PesonalScroll01','UI_Canvas/RightPanel/PesonalScroll',18},{'VoiceScroll01','UI_Canvas/RightPanel/VoiceScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_RoleArchive_CN','UI_Canvas/UpperLeftPanel/Text_RoleArchive/Text_RoleArchive_CN',20},{'Text_RoleArchive_EN','UI_Canvas/UpperLeftPanel/Text_RoleArchive/Text_RoleArchive_EN',20},{'CNText','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_Switch/CNText',20},{'CNText01','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/Btn_SwitchHighLight/CNText',20},{'Text_Qieyeming','UI_Canvas/SwitchPanel/SwitchScroll/SwitchPrefab/TogPanel/SwitchPanelSecond/Text_Qieyeming',20},{'Text_Haogandu','UI_Canvas/RoleInfoPanel/Haogandu/Text_Haogandu',20},{'CurRoleFavorabilityText','UI_Canvas/RoleInfoPanel/RoleFavorability/CurRoleFavorabilityText',20},{'Text_Chenghao','UI_Canvas/RoleInfoPanel/Chenghao/Text_Chenghao',20},{'RoleNameTxt','UI_Canvas/RoleInfoPanel/RoleNameBG/RoleNameTxt',20},{'CVNameTitle','UI_Canvas/RoleInfoPanel/CvPanel/CvPanel/CVNameTitle',20},{'CVNameText','UI_Canvas/RoleInfoPanel/CvPanel/CvPanel/CVNameText',20},{'CNText02','UI_Canvas/RightPanel/Btn_Chakan/Chakan/CNText',20},{'CNText03','UI_Canvas/RightPanel/Btn_Shuxing/CNText',20},{'CNText04','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_Qiehuan/CNText',20},{'CNText05','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanArchive/Btn_QiehuanHighLight/CNText',20},{'CNText06','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_Qiehuan/CNText',20},{'CNText07','UI_Canvas/RightPanel/Btn_Qiehuan/Content/QiehuanVoice/Btn_QiehuanHighLight/CNText',20},{'CNText08','UI_Canvas/Btn_ChakanHighLight/ChakanHighLight/CNText',20},{'Text_tishi','UI_Canvas/ScalePanel/Text_tishi',20},{'Text_Shuping','UI_Canvas/ScalePanel/Btn_Shuping/Text_Shuping',20},{'Text_Zhanshi','UI_Canvas/ScalePanel/Btn_Shuping/Text_Zhanshi',20},{'Text_tuichusuofang','UI_Canvas/ScalePanel/Btn_Reset/Text_tuichusuofang',20},{'Text_Scale1','UI_Canvas/ScalePanel/Img_Scale1/Text_Scale1',20},{'Text_Scale2','UI_Canvas/ScalePanel/Img_Scale2/Text_Scale2',20},{'Text_Scale3','UI_Canvas/ScalePanel/Img_Scale3/Text_Scale3',20},
    }
end
-- Code Auto Create End
require("LocalData/RoleprofileLocalData")
require("LocalData/RoleuiskinLocalData")

function M:OnInit()
    self.ScalePanel().gameObject:SetActive(false)
    self.Img_DragBG().gameObject:SetActive(false)
    self.Btn_Hide().gameObject:SetActive(false)
    self.Btn_Mask().gameObject:SetActive(false)
    self.Btn_ExPlay().gameObject:SetActive(false)
    
    self.ClickArea = {}
    self.CurClothes = PosterGirlViewModel.ClothesType.wear
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.CellData))
    self.PesonalScroll01():SetLuaCellEvent(Handle(self,self.PesonalItem))
    self.VoiceScroll01():SetLuaCellEvent(Handle(self,self.VoiceCell))
    ---获取页签数据
    self.SwitchData = TeamAtlasControl.GetCurRegionData()
    self.VoiceState = 0 --- 0无状态，1播放，2暂停，3停止
    ---拖拽
    self.ItemDrag = self:Img_DragBG().gameObject:GetComponent("ItemDrag")
    ---当前播放物体
    self.CurPlayAudioItem =
    {
        id = nil,
        ChangeFunc = nil,
        StopFunc = nil,
        path = nil
    }
    self.canScroll = false  --是否可滑动
    self.SpineState = 0  --当前spine默认正常

    self.SpineObj = nil
    self.FrontSpine = nil
    self.BGSpine = nil
    self.FrontPath = nil
    self.BGPath = nil
    ---是否竖屏
    self.IsPortrait = true
    --文字 竖屏
    self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text178")
    ---改变滑条
    self.SliderChange = false
    self.MaxScale = 1
    self.MinScale = 1
    --拖拽边框最大最小值
    self.MinDragFrame = nil
    self.MaxDragFrame = nil
    --拖拽边框缩放比
    self.Scale_Avg = Vector2(1,1)
    --是否能够旋转
    self.IsCanRotate = false
    ---刷新滑块
    self.SwitchScroll01().totalCount = #self.SwitchData
    self.SwitchScroll01():RefillCells(TeamAtlasControl.GetSingleTeamData(TeamAtlasControl.GetCurRoleId()).AreaSort - 1)
    ---初始化按钮
    self:InitBtn()
end

function M:OnUpdateUI()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    ---刷新信息
    self:ReRoleInfo(TeamAtlasControl.GetCurRoleId());
    TeamAtlasControl.ClearCurRoleId()
    --清除台词组件
    SkinControl.SetRoleVoiceWordText()
end

function M:OnShow()

end

---初始化按钮
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回上一级
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_Home().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击帮助
    UIEvent.LuaClick(self.Btn_I().gameObject,function()

    end)
    ---点击查看角色立绘
    self.Btn_ChakanHighLight().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_Chakan().gameObject,Handle(self,function ()
        self:ShowDetailSpine(1)  --隐藏UI
    end))
    UIEvent.LuaClick(self.Btn_ChakanHighLight().gameObject,Handle(self,function ()
        self:ShowDetailSpine(0)  --还原UI
    end))
    ---切换个人档案tog
    Tools.ToggleValueChange(self.QiehuanArchive(),function(isOn)
        local normal = CJNUIMgr.GetSunUseName(self.QiehuanArchive().gameObject,"Btn_Qiehuan")
        local highLight = CJNUIMgr.GetSunUseName(self.QiehuanArchive().gameObject,"Btn_QiehuanHighLight")
        if isOn then
            normal:SetActive(false)
            highLight:SetActive(true)
            self.PesonalScroll01().gameObject:SetActive(true)
        else
            normal:SetActive(true)
            highLight:SetActive(false)
            self.PesonalScroll01().gameObject:SetActive(false)
        end
    end,nil)
    ---切换角色语音tog
    Tools.ToggleValueChange(self.QiehuanVoice(),function(isOn)
        local normal = CJNUIMgr.GetSunUseName(self.QiehuanVoice().gameObject,"Btn_Qiehuan")
        local highLight = CJNUIMgr.GetSunUseName(self.QiehuanVoice().gameObject,"Btn_QiehuanHighLight")
        if isOn then
            normal:SetActive(false)
            highLight:SetActive(true)
            self.VoiceScroll01().gameObject:SetActive(true)
        else
            normal:SetActive(true)
            highLight:SetActive(false)
            self.VoiceScroll01().gameObject:SetActive(false)
        end
    end,nil)
    ---查看属性
    UIEvent.LuaClick(self.Btn_Shuxing().gameObject,function()
        local arr = {}
        table.insert(arr,self.CurrentHero.id)
        IllustrationViewModel.OpenRoleXiangqing(self.CurrentHero.id,arr)
    end)
    ---点击区域spine互动
    UIEvent.LuaClick(self.RoleSpineClickArea().gameObject, Handle(self, self.GetCurFavorWords))
    ---横竖屏切换
    UIEvent.LuaClick(self.Btn_Shuping().gameObject,function()
        self:PortraitSwitch()
    end)
    ---重置比例
    UIEvent.LuaClick(self.Btn_Reset().gameObject,function()
        self:TouchExit(false)
    end)
    ---缩放滑条
    Tools.OnSliderValueChange(self.Slider_Scale(),function(float)
        if not self.SliderChange then
            return
        end
        if float < self.MinScale then
            float = self.MinScale
        elseif float > self.MaxScale then
            float = self.MaxScale
        end
        local _Scale = Vector3(float,float,float)

        self:SetScale(_Scale)
    end)
    --隐藏
    UIEvent.LuaClick(self.Btn_Hide().gameObject, Handle(self, function()
        self.Btn_Hide().gameObject:SetActive(false)
        self.Btn_ChakanHighLight().gameObject:SetActive(false)
        self.ScalePanel().gameObject:SetActive(false)
        self.Btn_Mask().gameObject:SetActive(true)
    end))
    --显示
    UIEvent.OnPointDown(self.Btn_Mask().gameObject, Handle(self, function()
        self.Btn_Hide().gameObject:SetActive(true)
        if self.IsPortrait then
            self.Btn_ChakanHighLight().gameObject:SetActive(true)
        end
        self.ScalePanel().gameObject:SetActive(true)
        self.Btn_Mask().gameObject:SetActive(false)
    end))
end

---标签页回调事件
function M:CellData(trans, idx)
    self:RefreshSwitch(trans.gameObject, idx)
end
---个人资料回调
function M:PesonalItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurProfileList[idx]})
end
---语音回调
function M:VoiceCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurVoiceList[idx],self})
end

function M:SkillCell(trans,idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.ChildSkillList[idx], self, self.CurHeroAttr, self.CurrentHero:CheckHeroEquipIsMax() })
end

---刷新左侧标签页
function M:RefreshSwitch(obj,idx)
    ---获取物体和组件
    local tog = obj.transform:GetComponent("Toggle")
    local normal = CJNUIMgr.GetSunUseName(obj, "Btn_Switch").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Btn_SwitchHighLight").gameObject
    local normalText = CJNUIMgr.GetSunUseName(normal, "CNText"):GetComponent("TextMeshProUGUI")
    local highText = CJNUIMgr.GetSunUseName(highLight, "CNText"):GetComponent("TextMeshProUGUI")
    local expand = CJNUIMgr.GetSunUseName(obj, "Expand").gameObject
    local name = self.SwitchData[idx].TeamName
    local data = string.split(self.SwitchData[idx].characterID,",")
    local subclass =  CJNUIMgr.GetSunUseName(obj, "SwitchPanelSecond").gameObject  --展开页
    ---文本赋值
    normalText.text = name
    highText.text = name

    ---克隆子类别
    Tools.ClearAllChild(expand)  --清空子物体
    subclass.gameObject:SetActive(false)
    for i = 1,#data do
        local _obj = GameObject.Instantiate(subclass.gameObject,expand.transform,false)
        _obj.gameObject:SetActive(true)
        ---获取子类别组件
        local _tog = _obj.transform:GetComponent("Toggle")
        local _normal = CJNUIMgr.GetSunUseName(_obj, "Img_Qieyedi").gameObject
        local _highLight = CJNUIMgr.GetSunUseName(_obj, "Img_Qieyedi_H").gameObject
        local _name = CJNUIMgr.GetSunUseName(_obj, "Text_Qieyeming"):GetComponent("TextMeshProUGUI")
        local roleData = HeroControl.GetRoleDataByID(tonumber(data[i]))
        ---名字文本赋值
        _name.text = roleData.name
        ---toggle组赋值
        _tog.group = expand.gameObject:GetComponent("ToggleGroup")
        ---注册toggle点击事件
        Tools.ToggleValueChange(_tog,function(isOn)
            if isOn then
                _normal:SetActive(false)
                _highLight:SetActive(true)
                if TeamAtlasControl.GetCurRoleId() == nil then
                    MgrSound.Stop(3)
                    self:ReRoleInfo(tonumber(data[i]))
                end
            else
                _normal:SetActive(true)
                _highLight:SetActive(false)
            end
        end,nil)
        ---默认显示
        _normal:SetActive(true)
        _highLight:SetActive(false)
        if TeamAtlasControl.GetCurRoleId() ~= nil then
            if TeamAtlasControl.GetCurRoleId() == tonumber(data[i]) then
                _tog.isOn = true
            else
                _tog.isOn = false
            end
        end
    end

    ---toggle组赋值
    tog.group = self.SwitchScroll01().content.gameObject:GetComponent("ToggleGroup")
    ---注册tog点击事件
    Tools.ToggleValueChange(tog,function(isOn)
        if isOn then
            normal:SetActive(false)
            highLight:SetActive(true)
            expand:SetActive(true)
            if self.canScroll == false then
                self.canScroll = true
            else
                ---滑动
                self.SwitchScroll01():ScrollToCell(idx - 1 < 0 and 1 or idx - 1,3500)
            end
            ---点击选中第一个子页签
            if TeamAtlasControl.GetCurRoleId() == nil then
                expand.transform:GetChild(0).transform:GetComponent("Toggle").isOn = false
                expand.transform:GetChild(0).transform:GetComponent("Toggle").isOn = true
            end
        else
            normal:SetActive(true)
            highLight:SetActive(false)
            expand:SetActive(false)
        end
        ---刷新自适应组件
        Tools.ReContentSizeGroup(self.SwitchScroll01().content.gameObject)
    end,nil)

    ---如果当前角色id为空
    if TeamAtlasControl.GetCurRoleId() == nil then
        ---索引为1则默认高亮
        normal:SetActive(true)
        highLight:SetActive(false)
        expand:SetActive(false)
        if idx == 1 then
            tog.isOn = true
        else
            tog.isOn = false
        end
    else
        ---选中当前
        normal:SetActive(true)
        highLight:SetActive(false)
        expand:SetActive(false)
        if TeamAtlasControl.GetSingleTeamData(TeamAtlasControl.GetCurRoleId()).AreaSort == idx then
            tog.isOn = true
        else
            tog.isOn = false
        end
    end

end

---设置个人资料滑动数据
function M:ReloadPesonalData(offset)
    self.PesonalScroll().gameObject:SetActive(true)
    self.CurProfileList = TeamAtlasControl.GetProfileData(self.CurrentHero.id)
    ---设置Loop数量
    self.PesonalScroll01().totalCount = #self.CurProfileList
    if offset then
        self.PesonalScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PesonalScroll01():RefreshCells()              ---只刷新数据
    end
    Tools.ReContentSizeGroup(self.PesonalContent().gameObject)  --Unity强制重新布局
end
---设置语音滑动数据
function M:ReloadVoiceData(offset)
    self.VoiceScroll().gameObject:SetActive(true)
    self.CurVoiceList = TeamAtlasControl.GetVoiceData(self.CurrentHero)
    ---设置Loop数量
    self.VoiceScroll01().totalCount = #self.CurVoiceList
    if offset then
        self.VoiceScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.VoiceScroll01():RefreshCells()              ---只刷新数据
    end
    Tools.ReContentSizeGroup(self.VoiceContent().gameObject)   --Unity强制重新布局
end
---设置技能滑动数据
function M:ReloadSkillData(offset)
    self.SkillScroll().gameObject:SetActive(true)
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.CurrentHero.id)
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,nil)    ---根据角色进阶共鸣装备替换技能简略表
    self.CurHeroAttr = self.CurrentHero:GetHeroAttr()
    self.SkillScroll01().totalCount = #self.ChildSkillList
    if offset then
        self.SkillScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.SkillScroll01():RefreshCells()              ---只刷新数据
    end
end

---创建立绘
function M:CreatSpine(_Root, _RoleId)
    self.CurClothes = PosterGirlViewModel.ClothesType.wear
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    ---分有无背景加载
    local skinData = HeroControl.GetSkinDataByRoleID(_RoleId)
    if skinData.backgroundpic ~= "0" then
        self.Img_BG().color = Color(1,1,1,0)
    else
        self.Img_BG().color = Color(1,1,1,1)
    end
    --判断是否启用多状态切换
    if HeroControl.GetSkinDataBySkinId(skinData.id).newSwitch then
        --初始化皮肤功能需求
        SkinControl.InitSpineState(false,false,SkinControl.UIType.roleArchive,skinData.id)
        ---创建皮肤
        SkinControl.CreateRoleSpine(_Root,PosterGirlViewModel.spineType.role)
    else
        --清理旧spine
        SkinControl.ClearSpine()
        local _PosInfoTab = CharactercoordinatesLocalData.tab[skinData.id].coordinate6
        local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
        local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
        MgrRes.LoadWatch3DSpineInUI(_Root, skinData.id, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
            self.SpineObj = obj
            self.SpinePath = MgrRes.GetWatch3DSpinePath(skinData.id)
            obj.transform.gameObject.layer = 5
            local ske = obj.transform:GetComponent("SkeletonAnimation")
            if ske then
                ske:SetOrderLayer(self.CavOrder+1,"Default")
            end
        end)
    end
    if next(self.ClickArea) ~= nil then
        for i,v in pairs(self.ClickArea) do
            GameObject.Destroy(v)
        end
        self.ClickArea = {}
    end
    if skinData.HaveClickArea then
        self.RoleSpineClickArea().gameObject:SetActive(false)
        for i,v in pairs(skinData.ClickArea) do
            local tempGo = GameObject.Instantiate(self.RoleSpineClickArea().gameObject,self.LihuiSpinePanel().transform,false)
            tempGo:SetActive(true)
            tempGo:GetComponent("RectTransform").anchoredPosition = Vector2(tonumber(v.x),tonumber(v.y))    ---主界面锚点位置为(-218,243)
            tempGo:GetComponent("RectTransform").sizeDelta = Vector2(tonumber(v.width),tonumber(v.height))
            UIEvent.LuaClick(tempGo,function() self:GetCurFavorWords(i) end)
            self.ClickArea[i] = tempGo
        end
    else
        self.RoleSpineClickArea().gameObject:SetActive(true)
    end
    MgrRes.UnLoadUnusedAssets(false)
    --EX动画按钮
    local roleData = HeroControl.GetRoleDataByID(_RoleId)
    self.Btn_ExPlay().gameObject:SetActive(roleData.ExSkillID ~= 0)
    
    UIEvent.LuaClick(self.Btn_ExPlay().gameObject,function()
        --播放usm
        if roleData then
            MgrUI.Pop(UID.PlayEx_UI,{ roleData,Handle(self,self.ExPlayBack) },true)
        end
    end)
end

function M:GetRoleSpineToBox(_RoleId,_Root,type)
    local _skin = HeroControl.GetSkinDataByRoleID(_RoleId)
    ---清理旧背景spine
    if self.BGSpine then
        GameObject.Destroy(self.BGSpine)
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpine then
        GameObject.Destroy(self.FrontSpine)
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    --判断是否启用多状态切换
    if HeroControl.GetSkinDataBySkinId(_skin.id).newSwitch then
        SkinControl.CreateRoleSpine(_Root,type)
        return
    end
    --清理旧spine
    SkinControl.ClearSpine()
    local posInfo
    if type == PosterGirlViewModel.spineType.bottom then  --背景spine
        if _skin.backgroundpic ~= "0" then
            local Img = _Root.transform:GetComponent("Image")
            Img.enabled = false
            if string.find(_skin.backgroundpic,'Watch_3D_bg') then
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _skin.id,_skin.backgroundpic,x,y,scale,nil,function(_ReturnObj)
                    self.BGSpine = _ReturnObj
                    self.BGPath = MgrRes.GetLocalizedPath(_skin.backgroundpic)
                    _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder,"Default")
                end,true)
            else
                local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate8,";")
                local x = tonumber(string.split(coordinate[1],",")[1])
                local y = tonumber(string.split(coordinate[1],",")[2])
                local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
                MgrRes.LoadCgSpine(_Root, _skin.id,_skin.backgroundpic,x,y,scale,nil,function(_ReturnObj)
                    self.BGSpine = _ReturnObj
                    self.BGPath = MgrRes.GetLocalizedPath(_skin.backgroundpic)
                    _ReturnObj.transform:GetComponent("SkeletonGraphic"):SetOrderLayer(self.CavOrder,"Default")
                end,false)
            end
        else
            local Img = _Root.transform:GetComponent("Image")
            Img.enabled = true
            ---刷新默认背景
            local TeamData = TeamAtlasControl.GetSingleTeamData(self.CurrentHero.id)
            MgrRes.LoadSprite(self.Img_BG(),TeamData.AreaBg)
        end
    elseif type == PosterGirlViewModel.spineType.front then   --前景spine
        if _skin.foregroundpic ~= "0" then
            local img = _Root.transform:GetComponent("Image")
            img.enabled = false
            local coordinate = string.split(CharactercoordinatesLocalData.tab[_skin.id].coordinate9,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadSkinFrontBG(_skin.type,img,_skin.foregroundpic,_Root,x,y,scale,nil,function(_ReturnObj)
                self.FrontSpine = _ReturnObj
                self.FrontPath = MgrRes.GetLocalizedPath(_skin.foregroundpic)
                _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder+2,"Default")
            end)
        else
            --local posInfo = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].fgcoordinate
            --local _info1 = string.split(posInfo,";")
            --local _info2 = string.split(_info1[1],",")
            --local path = MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].foregroundpic
            --local x = tonumber(_info2[1])
            --local y = tonumber(_info2[2])
            --local scale = tonumber(_info1[2])
            --local Img = _Root.transform:GetComponent("Image")
            --Img.enabled = false
            -----清理旧前景spine
            --if self.FrontSpine then
            --    GameObject.Destroy(self.FrontSpine)
            --end
            -----如果是图片
            --if MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].type == 0 then
            --    if path ~= "0" then
            --        Img.enabled = true
            --        MgrRes.LoadSprite(Img,path)
            --    else
            --        Img.enabled = false
            --    end
            --else
            --    Img.enabled = false
            --    if path ~= "0" then
            --        MgrRes.LoadCgSpine(_Root, _RoleId,path,x,y,scale,MainuiskinLocalData.tab[tonumber(SteamLocalData.tab[113040][2])].morning,function(_ReturnObj)
            --            self.FrontSpine = _ReturnObj
            --        end,false)
            --    end
            --end
        end
    end
end

---根据当前好感度等级权重随机出本次的好感度交互台词ID
function M:GetCurFavorWords(idx)
    --判断是否启用多状态切换
    if HeroControl.GetSkinDataBySkinId(self.CurrentHero.skin).newSwitch then
        SkinControl.OnClickRoleBack(idx)
        return
    end
    if CMgrSpine.Instance:CheckCurAniIsIdle(self.SpineObj, self.CurClothes == PosterGirlViewModel.ClothesType.undress) == false then
        return
    end

    local _CurRoleFavor = self.CurrentHero.favor --默认100好感度
    local _ActorLinesType = tonumber(HeroControl.GetSkinDataBySkinId(self.CurrentHero.skin).interaction)   --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    if idx and type(idx) == "number" then
        local _CurTotalSumWeight=0
        local _tempActorLineIdTab={}  --临时表存储对应的文本台词ID和对应权重
        for key, value in pairs(ActorLinesLocalData.tab) do
            if value[2] == _ActorLinesType and value[4] == 5 then
                local str = string.split(value[5],"_")
                if str[1] == "15" and idx == tonumber(str[2]) then  --15为点击区域触发动作和语音
                    ---算权重
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                        table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                    end
                elseif tonumber(str[1]) == 14 and idx == tonumber(str[2]) then
                    ---匹配到对应的角色台词组别
                    if value[2] == _ActorLinesType then
                        local _TempVarTab= str
                        local _ReturnVar = TableToObject.GetTargetWeight2(_TempVarTab,0)
                        if _ReturnVar ~= false then
                            ---当前穿着衣服
                            if  self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                                ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                                if value[3] == 92 or value[3] == 93 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                                if value[3] == 95 or value[3] == 96 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
        ---后面要加特效

    else
        for key, value in pairs(ActorLinesLocalData.tab) do
            ---当前是默认看板娘
            if tonumber(string.split(value[5],"_")[1]) ~= 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType and value[4] == 5 and tonumber(string.split(value[5],"_")[1]) == 1 then
                    ---切割对应的触发条件得到条件表
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,_CurRoleFavor)
                    if _ReturnVar ~= false then
                        ---插入 台词ID 达标的权重值*1000+表中已存的权重值
                        ---按顺序插入累加的权重值，通过分段记录的权重值来判断本次随机出来的值属于哪个区间
                        ---Etc tab[1]切割出的权值为0.8  tab[2]切割出的权值为1.5 tab[3]切割出的权值为2.8
                        ---    对应tab[1]存储的权值字段为800 tab[2]为800+1500 tab[3]为800+1500+2800
                        ---    随机一个整数在(1,max) max本轮为800+1500+2800
                        ---    遍历表中判断迭代更新大于这个随机数的字段的下标
                        ---    假设本轮随机数为1300 则tab[1]符合 tab[2]符合 最中迭代更新随机数下标为tab[2]
                        ---------------------------------------------------------------------
                        if value[3] == 91 or value[3] == 94 then
                            if self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                                if value[3] == 91 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            else
                                if value[3] == 94 then
                                    _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                    table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                                end
                            end
                        else
                            _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                            table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                        end
                    end
                end
            elseif tonumber(string.split(value[5],"_")[1]) == 14 then
                ---匹配到对应的角色台词组别
                if value[2] == _ActorLinesType then
                    local _TempVarTab= string.split(value[5],"_")
                    local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab,0)
                    if _ReturnVar ~= false then
                        ---当前穿着衣服
                        if  self.CurClothes == PosterGirlViewModel.ClothesType.wear then
                            ---穿着衣服时点击角色只会播放脱衣语音或穿衣触摸
                            if value[3] == 92 or value[3] == 93 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        else
                            ---脱着衣服时点击角色只会播放穿衣语音或脱衣触摸
                            if value[3] == 95 or value[3] == 96 then
                                _CurTotalSumWeight=_CurTotalSumWeight+(tonumber(_ReturnVar)*1000)
                                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
                            end
                        end
                    end
                end
            end
        end
        local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight,_tempActorLineIdTab)
        self:PlayTargetRoleAniVoice(_FinalVoiceLineId)
    end
end
---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function M:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AniName = ActorLinesLocalData.tab[_ActorLineId][6] --动画文件名
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _AudioType = ActorLinesLocalData.tab[_ActorLineId][3]
    local _BackAniName = "idle"
    if _AudioType == 93 then  --脱衣语音
        self.CurClothes = PosterGirlViewModel.ClothesType.undress
    elseif _AudioType == 96 then  --穿衣语音
        self.CurClothes = PosterGirlViewModel.ClothesType.wear
    end
    if self.CurClothes == PosterGirlViewModel.ClothesType.undress then
        _BackAniName = "idle2"  --脱衣状态
        ---如果随机到主界面随机语音修改随机语音播放的动画
        if ActorLinesLocalData.tab[_ActorLineId][4] == 4 then
            _AniName = "idle2"
        end
    else
        _BackAniName = "idle"   --穿衣状态
    end
    --随机动作，排除待机动作
    if _AniName == "idle" or _AniName == "idle2" then
        _AniName = "0"
    end
    if self.SpineObj ~= nil and _AniName ~= "0" then
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj, _AniName, false,nil,_BackAniName)
    end
    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,self.Name..self.CurrentHero.id)
end

---刷新角色信息
function M:ReRoleInfo(id)
    if self.CurrentHero == HeroControl.GetRoleDataByID(id) then
        return
    end
    self.CurrentHero = HeroControl.GetRoleDataByID(id)
    ---好感刷新
    self.favorLevel, self.ExpRatio, self.LvLimit = Global.CheckFavorLv(self.CurrentHero.favor)
    self.CurRoleFavorabilityText().text= self.favorLevel
    self.CenterFavorSlider().fillAmount = self.favorLevel/self.LvLimit
    ---职业图标
    MgrRes.LoadSprite(self.RoleOccupationImg(),self.CurrentHero.iconCareer)
    ---名字
    self.RoleNameTxt().text = self.CurrentHero.name
    ---称号
    self.Text_Chenghao().text = HeroControl.GetSkinDataBySkinId(self.CurrentHero.skin).skinName
    ---配音
    self.CVNameText().text = HeroControl.GetSkinDataBySkinId(self.CurrentHero.skin).cv
    ---创建spine
    self:CreatSpine(self.LihuiSpinePanel().gameObject,id)
    ---创建前景
    self:GetRoleSpineToBox(id,self.FrontSprite(),PosterGirlViewModel.spineType.front)
    ---创建后景
    self:GetRoleSpineToBox(id,self.Img_BG(),PosterGirlViewModel.spineType.bottom)
    ---刷新滑块
    self:ReloadPesonalData(0)
    self:ReloadVoiceData(0)
    self.PesonalScroll01().gameObject:SetActive(false)
    self.VoiceScroll01().gameObject:SetActive(false)
    ---默认显示
    self.QiehuanArchive().isOn = false
    self.QiehuanArchive().isOn = true
    
    local tSkinData = RoleuiskinLocalData.tab[self.CurrentHero.skin]
    self.IsCanRotate = tSkinData.isdrag==1
    ---检测能否竖屏
    self:CheckShuPing()
    --刷新自适应组件
    Tools.ReSize(self.RoleNameBG().gameObject)
end

---查看角色立绘
function M:ShowDetailSpine(State)
    if self.CurPlayAudioItem.StopFunc then
        self.CurPlayAudioItem.StopFunc()
    end
    MgrTimer.Cancel("DocRoleVoice")
    MgrSound.Stop(3,"DocVoice",false)
    if State == 0 then
        --图鉴
        self:TouchExit(true)
        self.Chakan().gameObject:SetActive(true)
        self.ChakanHighLight().gameObject:SetActive(false)
        self.Img_Switchdi().gameObject:SetActive(true)
        self.Img_Zhezhao().gameObject:SetActive(true)
        self.UpperLeftPanel().gameObject:SetActive(true)
        self.SwitchPanel().gameObject:SetActive(true)
        self.RoleInfoPanel().gameObject:SetActive(true)
        self.RightPanel().gameObject:SetActive(true)
        self.Btn_ChakanHighLight().gameObject:SetActive(false)
        self.ScalePanel().gameObject:SetActive(false)
        self.Btn_Hide().gameObject:SetActive(false)
    elseif State == 1  then
        --查看立绘
        self.Chakan().gameObject:SetActive(false)
        self.ChakanHighLight().gameObject:SetActive(true)
        self.Img_Switchdi().gameObject:SetActive(false)
        self.Img_Zhezhao().gameObject:SetActive(false)
        self.UpperLeftPanel().gameObject:SetActive(false)
        self.SwitchPanel().gameObject:SetActive(false)
        self.RoleInfoPanel().gameObject:SetActive(false)
        self.RightPanel().gameObject:SetActive(false)
        self.Btn_ChakanHighLight().gameObject:SetActive(true)
        self.ScalePanel().gameObject:SetActive(true)
        self.Btn_Hide().gameObject:SetActive(true)
        self:TouchUpdate()
    end
    self.SpineState = State
end

---触摸移动放大立绘
function M:TouchUpdate()
    Input.multiTouchEnabled = true
    local _OldTouch1,_OldTouch2 --上次触摸点(手指1,2)
    -- local High=1000 --可拖动边界高
    -- local Wide=1000 --可拖动边界宽
    
    local tSkinData = RoleuiskinLocalData.tab[self.CurrentHero.skin]
    --缩放
    local scale = tSkinData.scale
    local str = string.split(scale,',')
    self.MinScale = tonumber(str[1])
    self.MaxScale = tonumber(str[2])
    --设置滑条属性
    self.SliderChange = false
    self.Slider_Scale().minValue = self.MinScale
    self.Slider_Scale().maxValue = self.MaxScale
    self.Slider_Scale().value = self.LihuiPanel().transform.localScale.x
    self.SliderChange = true
    self.Text_Scale1().text = str[1].."x"
    self.Text_Scale3().text = str[2].."x"
    --设置边界
    if tSkinData.dragrange ~= "0" then
        local tRangeList = string.split(tSkinData.dragrange,';')
        for i, v in ipairs(tRangeList) do
            local tRange = string.split(v,',')
            if #tRange > 1 then
                if i == 1 then
                    self.MinDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                else
                    self.MaxDragFrame = Vector2(tonumber(tRange[1]), tonumber(tRange[2]))
                end
            end
        end
        if self.MaxScale ~= self.MinScale then
            --计算均值
            local tScale_DValue = self.MaxScale - self.MinScale
            self.Scale_Avg.x = (self.MaxDragFrame.x - self.MinDragFrame.x)/tScale_DValue
            self.Scale_Avg.y = (self.MaxDragFrame.y - self.MinDragFrame.y)/tScale_DValue
            --设置边界
            local tCurScale_DValue = self.LihuiPanel().transform.localScale.x-self.MinScale
            local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
            local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue
            self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        end
        
    end
    
    self.Child_y = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.y
    self.Child_x = self.ObjRoot.transform:GetComponent("RectTransform").rect.size.x
    print("UI的缩放" .. self.Child_y .. "-" .. self.Child_x)

     self.OldPosition = Vector3(self.LihuiPanelParent().transform.localPosition.x,self.LihuiPanelParent().transform.localPosition.y,self.LihuiPanelParent().transform.localPosition.z) --记录初始立绘位置
     --self.OldPositionScale = Vector3(self.SpineObj.transform.localScale.x,self.SpineObj.transform.localScale.y,self.SpineObj.transform.localScale.z)

    self.Img_BGParentPos = Vector3(self.Img_BGParent().transform.localPosition.x,self.Img_BGParent().transform.localPosition.y,self.Img_BGParent().transform.localPosition.z)
    self.ImgBGOldPosScale = Vector3(self.Img_BG().transform.localScale.x,self.Img_BG().transform.localScale.y,self.Img_BG().transform.localScale.z)
    self.LihuiPanelParentOldPos = Vector3(self.LihuiPanelParent().transform.localPosition.x,self.LihuiPanelParent().transform.localPosition.y,self.LihuiPanelParent().transform.localPosition.z)
    self.LihuiPanelOldScale = self.LihuiPanel().transform.localScale
    self.LihuiPanelOldPos = Vector3(self.LihuiPanel().transform.localPosition.x,self.LihuiPanel().transform.localPosition.y,self.LihuiPanel().transform.localPosition.z)
    self.FrontSpriteParentOldPos = Vector3(self.FrontSpriteParent().transform.localPosition.x,self.FrontSpriteParent().transform.localPosition.y,self.FrontSpriteParent().transform.localPosition.z)
    self.FrontSpriteOldPosScale = Vector3(self.FrontSprite().transform.localScale.x,self.FrontSprite().transform.localScale.y,self.FrontSprite().transform.localScale.z)
    --边框的原始坐标
    self.SpinePanelOldPos = Vector3(self.SpinePanel().transform.localPosition.x,self.SpinePanel().transform.localPosition.y,self.SpinePanel().transform.localPosition.z)
    --边框的宽高
    self.DragFrameOldRect = self.Img_DragFrame().transform.sizeDelta
    
    --设置边界节点数据
    self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
    --设置拖拽节点
    if self.IsCanRotate then
        self.ItemDrag:SetInBoxObj(self.LihuiPanelParent().gameObject)
    else
        self.ItemDrag:SetInBoxObj(self.SpinePanel().gameObject)
    end
    
    MgrTimer.AddRepeat("TouchUpdateRole",0,function ()
        if UIEvent.GetButton_Up() then
            --设置边界节点数据
            self.ItemDrag:SetRange(self.Img_DragFrame().gameObject)
        end
        if Input.touchCount <= 0 then
            return
        end

        --local curScale = self.LihuiPanel().transform.localScale.x --时时缩放
        --local High = math.floor((self.Child_y * curScale - self.Child_y) * 0.5)
        --local Wide = math.floor((self.Child_x * curScale - self.Child_x) * 0.5)

        --if 1 == Input.touchCount then   --单指触摸
        --    --if Input.touches[0].phase == TouchPhase.Moved and self.CurrentHero.id == self.CurrentHero.skin then
        --    if Input.touches[0].phase == TouchPhase.Moved then
        --
        --        local x,y
        --        x=Mathf.Clamp(self.LihuiPanelParent().transform.localPosition.x+Input.touches[0].deltaPosition.x,self.OldPosition.x-Wide,self.OldPosition.x+Wide)
        --        y=Mathf.Clamp(self.LihuiPanelParent().transform.localPosition.y+Input.touches[0].deltaPosition.y,self.OldPosition.y-High,self.OldPosition.y+High)
        --        if self.CurrentHero.id == self.CurrentHero.skin then--没有皮肤
        --            self.LihuiPanelParent().transform.localPosition=Vector3(x,y,self.OldPosition.z)
        --        else--是皮肤
        --            self.LihuiPanelParent().transform.localPosition=Vector3(x,y,self.OldPosition.z)
        --            self.Img_BGParent().transform.localPosition=Vector3(x,y,self.OldPosition.z)
        --            self.FrontSpriteParent().transform.localPosition=Vector3(x,y,self.OldPosition.z)
        --        end
        --    end
        --elseif 2 == Input.touchCount then  --双指触摸,放大缩小
        if 2 == Input.touchCount then  --双指触摸,放大缩小
            local _NewTouch1 = Input.GetTouch(0);
            local _NewTouch2 = Input.GetTouch(1);

            if _NewTouch2.phase == TouchPhase.Began then
                _OldTouch2 = _NewTouch2
                _OldTouch1 = _NewTouch1
                return
            end

            --计算老的两点距离和新的两点间距离，变大要放大模型，变小要缩放模型
            local _OldDistance = Vector2.Distance(_OldTouch1.position, _OldTouch2.position)
            local _NewDistance = Vector2.Distance(_NewTouch1.position, _NewTouch2.position)
            --两个距离之差，为正表示放大手势， 为负表示缩小手势
            local _Offset = _NewDistance - _OldDistance
            --放大因子， 一个像素按 0.001倍来算(1000可调整)
            local _ScaleFactor = _Offset / 1000;
            local _LocalScale = self.LihuiPanel().transform.localScale;
            local _Scale = Vector3(_LocalScale.x + _ScaleFactor,
                    _LocalScale.y + _ScaleFactor,
                    _LocalScale.z + _ScaleFactor)

            --缩放
            self.Slider_Scale().value = _LocalScale.x + _ScaleFactor
            --self:SetScale(_Scale)
            --记住最新的触摸点，下次使用
            _OldTouch1 = _NewTouch1
            _OldTouch2 = _NewTouch2
        end
    end,-1,nil)
end

--触摸退出
function M:TouchExit(_isExit)
    if _isExit then
        MgrTimer.Cancel("TouchUpdateRole")
    end
    self.Slider_Scale().value = self.LihuiPanelOldScale.x
    self.Img_DragBG().gameObject:SetActive(false)
    --self.LihuiSpinePanel().transform.localPosition = self.OldPosition

    self.Img_BGParent().transform.localPosition = self.Img_BGParentPos
    self.Img_BG().transform.localScale = self.ImgBGOldPosScale

    self.LihuiPanelParent().transform.localPosition = self.LihuiPanelParentOldPos
    self.LihuiPanel().transform.localScale = self.LihuiPanelOldScale

    self.FrontSpriteParent().transform.localPosition = self.FrontSpriteParentOldPos
    self.FrontSprite().transform.localScale = self.FrontSpriteOldPosScale
    --有皮肤的拖拽节点
    self.SpinePanel().transform.localPosition = self.SpinePanelOldPos
    --边框
    self.Img_DragFrame().transform.sizeDelta = self.DragFrameOldRect
    --立绘坐标
    self.LihuiPanel().transform.localPosition = self.LihuiPanelOldPos
end

---点击音频
function M:AudioClick(id,path,func,stopFunc)
    MgrTimer.Cancel("DocRoleVoice")
    if self.CurPlayAudioItem.id then
        if self.CurPlayAudioItem.id ~= id then
            self.CurPlayAudioItem.ChangeFunc()
        end
    end
    self.CurPlayAudioItem.id = id
    self.CurPlayAudioItem.path = path
    self.CurPlayAudioItem.ChangeFunc = func
    self.CurPlayAudioItem.StopFunc = stopFunc
    self.VoiceState = 1
    MgrSound.PlayRole(path,nil,nil,false,0,0,"DocVoice")
    self:ListenVoice()
end

--- 监听语音是否结束
function M:ListenVoice()
    MgrTimer.AddRepeat("DocRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus("DocVoice") then
            self.CurPlayAudioItem.StopFunc()
            MgrTimer.Cancel("DocRoleVoice")
        end
    end,-1,nil)
end
---横竖屏切换
function M:PortraitSwitch()
    --检测能否竖屏
    if not self:CheckShuPing() then
        return
    end
    local scale = self.ScalePanel().transform
    if self.IsPortrait then
        --竖屏
        scale.anchorMin = Vector2(1,0.5)
        scale.anchorMax = Vector2(1,0.5)
        scale.localRotation = Quaternion.Euler(0,0,90)
        scale.anchoredPosition = Vector2(-95,0)
        scale.sizeDelta = Vector2(1080,130)
        self.Btn_Hide().transform.localRotation = Quaternion.Euler(0,0,90)
        self.LihuiPanel().transform.localRotation = Quaternion.Euler(0,0,90)
        --文字 横屏
        self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text177")
        --立绘坐标
        local tSkinData = CharactercoordinatesLocalData.tab[self.CurrentHero.skin].coordinate16
        local tPosInfo = string.split(tSkinData,';')
        if #tPosInfo > 0 then
            local tPos = string.split(tPosInfo[1],',')
            self.LihuiPanel().transform.localPosition = Vector3(tonumber(tPos[1]),tonumber(tPos[2]),0)
        end
    else
        --横屏
        scale.anchorMin = Vector2(0.5,0)
        scale.anchorMax = Vector2(0.5,0)
        scale.localRotation = Quaternion.Euler(0,0,0)
        scale.anchoredPosition = Vector2(-10,95)
        scale.sizeDelta = Vector2(1480,130)
        self.Btn_Hide().transform.localRotation = Quaternion.Euler(0,0,0)
        self.LihuiPanel().transform.localRotation = Quaternion.Euler(0,0,0)
        --文字 竖屏
        self.Text_Shuping().text = MgrLanguageData.GetLanguageByKey("ui_qita_text178")
        --立绘坐标
        self.LihuiPanel().transform.localPosition = Vector3(0,2,0)
    end
    --显隐控制
    self.Img_Shuping().gameObject:SetActive(self.IsPortrait)
    self.Img_BG().gameObject:SetActive(not self.IsPortrait)
    self.Btn_ChakanHighLight().gameObject:SetActive(not self.IsPortrait)
    --初始坐标
    self.LihuiPanelOldPos = Vector3(self.LihuiPanel().transform.localPosition.x,self.LihuiPanel().transform.localPosition.y,self.LihuiPanel().transform.localPosition.z)
    --状态切换
    self.IsPortrait = not self.IsPortrait
    
    self:TouchExit(false)
end
---检测能否竖屏
function M:CheckShuPing()
    self.Btn_Shuping().gameObject:SetActive(self.IsCanRotate)
    
    return self.IsCanRotate
end
---缩放
function M:SetScale(_Scale)
    local CurPos = self.LihuiPanelParent().transform.localPosition
    if self.CurrentHero.id ~= self.CurrentHero.skin then
        CurPos = self.SpinePanel().transform.localPosition
    end
    if _Scale.x >= self.MinScale and _Scale.y >= self.MinScale and _Scale.x <= self.MaxScale and _Scale.y <= self.MaxScale then
        if not self.Img_DragBG().gameObject.activeSelf then
            self.Img_DragBG().gameObject:SetActive(true)
        end
        
        if self.IsCanRotate then
            self.LihuiPanel().transform.localScale = _Scale;
        else
            self.Img_BG().transform.localScale = _Scale;
            self.LihuiPanel().transform.localScale = _Scale;
            self.FrontSprite().transform.localScale = _Scale;
        end
        --设置边界
        local tCurScale_DValue = _Scale.x-self.MinScale
        local tWidth = self.MinDragFrame.x+self.Scale_Avg.x*tCurScale_DValue
        local tHigh = self.MinDragFrame.y+self.Scale_Avg.y*tCurScale_DValue
        
        self.Img_DragFrame().transform.sizeDelta = Vector2(tWidth, tHigh)
        --缩放边框限制
        local tFrameRect = self.Img_DragFrame().transform.rect.size
        local x = Mathf.Clamp(CurPos.x, self.Img_DragFrame().transform.localPosition.x-tFrameRect.x*0.5, self.Img_DragFrame().transform.localPosition.x+tFrameRect.x*0.5)
        local y = Mathf.Clamp(CurPos.y, self.Img_DragFrame().transform.localPosition.y-tFrameRect.y*0.5, self.Img_DragFrame().transform.localPosition.y+tFrameRect.y*0.5)
        
        if self.IsCanRotate then
            self.LihuiPanelParent().transform.localPosition = Vector3(x, y, self.OldPosition.z)
        else
            self.SpinePanel().transform.localPosition = Vector3(x, y, self.OldPosition.z)
        end
    end
end

function M:ExPlayBack()
    MgrSound.PlayBGM(SteamLocalData.tab[113054][2],0.2)
end

function M:OnClose()
    MgrSound.Stop(3, self.Name..self.CurrentHero.id, false)
    if self.CurPlayAudioItem.id then
        self.CurPlayAudioItem.ChangeFunc()
    end
    MgrTimer.Cancel("DocRoleVoice")
    ---清空当前角色数据
    self.CurrentHero = nil
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    ---清理旧后景spine
    if self.BGSpine then
        GameObject.Destroy(self.BGSpine)
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpine then
        GameObject.Destroy(self.FrontSpine)
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
    MgrRes.UnLoadUnusedAssets(true)
end
function M:OnBackKey()
    if not self.IsPortrait then
        self:PortraitSwitch()
        return
    end
    if self.SpineState == 1 then
        self:ShowDetailSpine(0)  --还原UI
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M