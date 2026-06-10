-- Code Auto Create Begin
local M = Class('MainPlot_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.MainPlot_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[MainPlot_UI].prefab'
    self.Name = 'Form[MainPlot_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Switchdi','Img_Switchdi',2},{'Img_Zhezhao','Img_Zhezhao',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_I','UpperLeftPanel/Btn_I',2},{'Btn_ReturnBg','UpperLeftPanel/Btn_ReturnBg',2},{'Btn_Return','UpperLeftPanel/Btn_ReturnBg/Btn_Return',2},{'Btn_Home','UpperLeftPanel/Btn_ReturnBg/Btn_Home',2},{'SwitchPanel','SwitchPanel',2},{'Img_Qieyexian','SwitchPanel/Img_Qieyexian',2},{'SwitchMain','SwitchPanel/SwitchMain',2},{'Btn_SwitchHighLight','SwitchPanel/SwitchMain/Btn_SwitchHighLight',2},{'Img_Qieyedian_H','SwitchPanel/SwitchMain/Btn_SwitchHighLight/Img_Qieyedian_H',2},{'AllRedDotIcon','SwitchPanel/SwitchMain/AllRedDotIcon',2},{'MainPlotSiwtchItem','SwitchPanel/SwitchScroll/MainPlotSiwtchItem',2},{'Img_Qieyedi','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi',2},{'Img_Qieyedi_H','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi_H',2},{'Img_Qieyekuang','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Img_Qieyedi_H/Img_Qieyekuang',2},{'Btn_Suo','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Btn_Suo',2},{'Img_Suo','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Btn_Suo/Img_Suo',2},{'PlotPanel','PlotPanel',2},{'GuankaInfo','PlotPanel/GuankaInfo',2},{'Guankatu','PlotPanel/GuankaInfo/Guankatu',2},{'Img_Guankatu','PlotPanel/GuankaInfo/Guankatu/Img_Guankatu',2},{'PointIdxName','PlotPanel/GuankaInfo/PointIdxName',2},{'Img_Tanchuangdi','PlotPanel/Img_Tanchuangdi',2},{'Img_Xian','PlotPanel/Img_Xian',2},{'ScrollbarVertical','PlotPanel/MainPlotScroll/ScrollbarVertical',2},{'Handle','PlotPanel/MainPlotScroll/ScrollbarVertical/SlidingArea/Handle',2},{'Content','PlotPanel/MainPlotScroll/Content',2},{'PointAtalsItem','PlotPanel/MainPlotScroll/PointAtalsItem',2},{'IllustrationPanel','IllustrationPanel',2},{'CollectedIllustration','IllustrationPanel/CollectedIllustration',2},{'huangTiao','IllustrationPanel/CollectedIllustration/huangTiao',2},{'Img_Tanchuangdi01','IllustrationPanel/RightPanel/Img_Tanchuangdi',2},{'Img_Xian01','IllustrationPanel/RightPanel/Img_Xian',2},{'ScrollbarVertical01','IllustrationPanel/RightPanel/IllustrationScroll/ScrollbarVertical',2},{'Handle01','IllustrationPanel/RightPanel/IllustrationScroll/ScrollbarVertical/SlidingArea/Handle',2},{'IllustrationPrefab','IllustrationPanel/RightPanel/IllustrationScroll/IllustrationPrefab',2},{'Content01','IllustrationPanel/RightPanel/IllustrationScroll/Content',2},{'RolePanel','RolePanel',2},{'Content02','RolePanel/RolePlotScroll/Content',2},{'RolePlotPrefab','RolePanel/RolePlotScroll/RolePlotPrefab',2},{'Btn_Qiehuan','Btn_Qiehuan',2},{'QiehuanPlot','Btn_Qiehuan/Content/QiehuanPlot',2},{'Btn_Plot','Btn_Qiehuan/Content/QiehuanPlot/Btn_Plot',2},{'PlotIcon','Btn_Qiehuan/Content/QiehuanPlot/Btn_Plot/PlotIcon',2},{'Btn_PlotHighLight','Btn_Qiehuan/Content/QiehuanPlot/Btn_PlotHighLight',2},{'PlotIcon_H','Btn_Qiehuan/Content/QiehuanPlot/Btn_PlotHighLight/PlotIcon_H',2},{'QiehuanAnimation','Btn_Qiehuan/Content/QiehuanAnimation',2},{'Btn_Qiehuan01','Btn_Qiehuan/Content/QiehuanAnimation/Btn_Qiehuan',2},{'AnimationIcon','Btn_Qiehuan/Content/QiehuanAnimation/Btn_Qiehuan/AnimationIcon',2},{'Btn_QiehuanHighLight','Btn_Qiehuan/Content/QiehuanAnimation/Btn_QiehuanHighLight',2},{'AnimationIcon_H','Btn_Qiehuan/Content/QiehuanAnimation/Btn_QiehuanHighLight/AnimationIcon_H',2},{'QiehuanIllustration','Btn_Qiehuan/Content/QiehuanIllustration',2},{'Btn_Illustration','Btn_Qiehuan/Content/QiehuanIllustration/Btn_Illustration',2},{'IllustrationIcon','Btn_Qiehuan/Content/QiehuanIllustration/Btn_Illustration/IllustrationIcon',2},{'Btn_IllustrationHighLight','Btn_Qiehuan/Content/QiehuanIllustration/Btn_IllustrationHighLight',2},{'IllustrationIcon_H','Btn_Qiehuan/Content/QiehuanIllustration/Btn_IllustrationHighLight/IllustrationIcon_H',2},{'AnimPanel','AnimPanel',2},{'BG_AnimRoot','AnimPanel/BG_AnimRoot',2},{'BG_Anim','AnimPanel/BG_Anim',2},{'PauseButton','AnimPanel/PauseButton',2},{'AnimMask','AnimPanel/AnimMask',2},{'Btn_NextVideo','AnimPanel/Btn_NextVideo',2},{'Img_Anniudi4','AnimPanel/Btn_NextVideo/Img_Anniudi4',2},{'Xian(xia)','AnimPanel/Btn_NextVideo/Xian(xia)',2},{'Btn_LastVideo','AnimPanel/Btn_LastVideo',2},{'Img_Anniudi3','AnimPanel/Btn_LastVideo/Img_Anniudi3',2},{'Xian(shang)','AnimPanel/Btn_LastVideo/Xian(shang)',2},{'Btn_Continue','AnimPanel/Btn_Continue',2},{'RePlayicon','AnimPanel/RePlayicon',2},{'Btn_AnimReturn','AnimPanel/Btn_AnimReturn',2},{'Btn_AnimHome','AnimPanel/Btn_AnimHome',2},{'CGPanel','CGPanel',2},{'ScrollView_IllustrationRoot','CGPanel/ScrollView_IllustrationRoot',2},{'Viewport','CGPanel/ScrollView_IllustrationRoot/Viewport',2},{'BG_IllustrationRoot','CGPanel/ScrollView_IllustrationRoot/Viewport/BG_IllustrationRoot',2},{'ScrollView','CGPanel/Scroll View',2},{'Viewport01','CGPanel/Scroll View/Viewport',2},{'BG_Illustration','CGPanel/Scroll View/Viewport/Content/BG_Illustration',2},{'ShowCGUI','CGPanel/ShowCGUI',2},{'BtnPanel','CGPanel/BtnPanel',2},{'CGFenchadi','CGPanel/BtnPanel/CGFenchadi',2},{'Btn_CGHome','CGPanel/BtnPanel/Btn_CGHome',2},{'Btn_CGReturn','CGPanel/BtnPanel/Btn_CGReturn',2},{'Btn_HideCGUI','CGPanel/BtnPanel/Btn_HideCGUI',2},{'Img_Anniudi','CGPanel/BtnPanel/Btn_HideCGUI/Img_Anniudi',2},{'Hideicon','CGPanel/BtnPanel/Btn_HideCGUI/Hideicon',2},{'CGFencha','CGPanel/BtnPanel/CGFencha',2},{'Fenchakuang','CGPanel/BtnPanel/CGFencha/Fenchakuang',2},{'CG_Arrow_Right','CGPanel/BtnPanel/CGFencha/CG_Arrow_Right',2},{'CG_Arrow_Left','CGPanel/BtnPanel/CGFencha/CG_Arrow_Left',2},{'Btn_LastIllustration','CGPanel/BtnPanel/Btn_LastIllustration',2},{'Img_Anniudi1','CGPanel/BtnPanel/Btn_LastIllustration/Img_Anniudi1',2},{'Xian_Last','CGPanel/BtnPanel/Btn_LastIllustration/Xian_Last',2},{'Btn_NextIllustration','CGPanel/BtnPanel/Btn_NextIllustration',2},{'Img_Anniudi2','CGPanel/BtnPanel/Btn_NextIllustration/Img_Anniudi2',2},{'Xian_Next','CGPanel/BtnPanel/Btn_NextIllustration/Xian_Next',2},{'Btn_FangDaSuoXiao','CGPanel/BtnPanel/Btn_FangDaSuoXiao',2},{'Img_HuaDongTiao','CGPanel/BtnPanel/Btn_FangDaSuoXiao/Img_HuaDongTiao',2},{'Img_GunLun','CGPanel/BtnPanel/Btn_FangDaSuoXiao/Img_GunLun',2},{'Btn_HuanYuan','CGPanel/BtnPanel/Btn_FangDaSuoXiao/Btn_HuanYuan',2},
        -- Text 列表
        {'collectedIllustration_EN','IllustrationPanel/CollectedIllustration/collectedIllustration_EN',3},{'collectedIllustrationCount','IllustrationPanel/CollectedIllustration/collectedIllustrationCount',3},
        -- UITemplate 列表
        {'PointAtalsItem01','PlotPanel/MainPlotScroll/PointAtalsItem',10},{'IllustrationPrefab01','IllustrationPanel/RightPanel/IllustrationScroll/IllustrationPrefab',10},{'RolePlotPrefab01','RolePanel/RolePlotScroll/RolePlotPrefab',10},
        -- Toggle 列表
        {'SwitchMain01','SwitchPanel/SwitchMain',13},
        -- RawImage 列表
        {'SwitchScroll','SwitchPanel/SwitchScroll',15},{'MainPlotScroll','PlotPanel/MainPlotScroll',15},{'IllustrationScroll','IllustrationPanel/RightPanel/IllustrationScroll',15},{'RolePlotScroll','RolePanel/RolePlotScroll',15},
        -- LoopScrollRect 列表
        {'SwitchScroll01','SwitchPanel/SwitchScroll',18},{'MainPlotScroll01','PlotPanel/MainPlotScroll',18},{'IllustrationScroll01','IllustrationPanel/RightPanel/IllustrationScroll',18},{'RolePlotScroll01','RolePanel/RolePlotScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_MainPlot_CN','UpperLeftPanel/Text_MainPlot/Text_MainPlot_CN',20},{'Text_MainPlot_EN','UpperLeftPanel/Text_MainPlot/Text_MainPlot_EN',20},{'ChapterTitle','SwitchPanel/SwitchMain/Btn_SwitchHighLight/ChapterTitle',20},{'Text_Qieyeming','SwitchPanel/SwitchScroll/MainPlotSiwtchItem/Text_Qieyeming',20},{'Text_ResPointIdxName','PlotPanel/GuankaInfo/PointIdxName/Text_ResPointIdxName',20},{'Text_ResPointName','PlotPanel/GuankaInfo/Text_ResPointName',20},{'Text_Jianjie','PlotPanel/GuankaInfo/Text_Jianjie',20},{'collectedIllustration_CN','IllustrationPanel/CollectedIllustration/collectedIllustration_CN',20},{'CNText','Btn_Qiehuan/Content/QiehuanPlot/Btn_Plot/CNText',20},{'CNText01','Btn_Qiehuan/Content/QiehuanPlot/Btn_PlotHighLight/CNText',20},{'CNText02','Btn_Qiehuan/Content/QiehuanAnimation/Btn_Qiehuan/CNText',20},{'CNText03','Btn_Qiehuan/Content/QiehuanAnimation/Btn_QiehuanHighLight/CNText',20},{'CNText04','Btn_Qiehuan/Content/QiehuanIllustration/Btn_Illustration/CNText',20},{'CNText05','Btn_Qiehuan/Content/QiehuanIllustration/Btn_IllustrationHighLight/CNText',20},{'Text_xiayiduan','AnimPanel/Btn_NextVideo/Text_xiayiduan',20},{'Text_Shangyiiduan','AnimPanel/Btn_LastVideo/Text_Shangyiiduan',20},{'Text_FenchaNumber','CGPanel/BtnPanel/CGFencha/Text_FenchaNumber',20},{'Text_Fencha','CGPanel/BtnPanel/CGFencha/Text_Fencha',20},{'Text_LastIllustration','CGPanel/BtnPanel/Btn_LastIllustration/Text_LastIllustration',20},{'Text_NextIllustration','CGPanel/BtnPanel/Btn_NextIllustration/Text_NextIllustration',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---按钮事件注册
    self:InitBtn()
    ---注册滑块
    self.SwitchScroll01():SetLuaCellEvent(Handle(self, self.SwitchCell))
    self.MainPlotScroll01():SetLuaCellEvent(Handle(self, self.PlotCell))
    self.IllustrationScroll01():SetLuaCellEvent(Handle(self, self.IllustrationCell))
    self.RolePlotScroll01():SetLuaCellEvent(Handle(self, self.RoleCell))
    ---页签数据
    if ArtAtlasControl.CurType == nil or ArtAtlasControl.CurChapter == nil then
        ArtAtlasControl.CurType = ArtAtlasControl.GetGuideChapter(1)[1].typeid
        ArtAtlasControl.CurChapter = ArtAtlasControl.GetGuideChapter(1)[1].chapterid
    end
    if ArtAtlasControl.CurType == 2 then
        self.SwitchData = ArtAtlasControl.GetGuideChapter(ArtAtlasControl.CurType,true,ArtAtlasControl.CurChapter)
    else
        self.SwitchData = ArtAtlasControl.GetGuideChapter(ArtAtlasControl.CurType,true,ArtAtlasControl.CurChapter)
    end
    ---当前选中的章节
    self.CurChapter = nil
    ---当前选中的关卡
    self.CurPoint = nil
    ---当前选择的类型 1剧情 2插画
    self.CurType = nil
    ---隐藏UI
    self.CGPanel().gameObject:SetActive(false)
    self.AnimPanel().gameObject:SetActive(false)
end

function M:OnShow()
    self.ChapterTitle().text = ArtAtlasControl.GetSingleArtGuideData(ArtAtlasControl.CurType).name
    self.SwitchScroll01().totalCount = #self.SwitchData
    --if #self.SwitchData + 1 >= 10 then
    --    self.SwitchScroll01():RefillCells(#self.SwitchData + 1)
    --else
    --    self.SwitchScroll01():RefillCells(0)
    --end
    if ArtAtlasControl.CurType == 3 then
        self.SwitchScroll01():RefillCells(0)
    else
        if ArtAtlasControl.CurChapter <= self.SwitchScroll01().totalCount then
            self.SwitchScroll01():RefillCells(ArtAtlasControl.CurChapter)
        else
            self.SwitchScroll01():RefillCells(#self.SwitchData)
        end
    end
end

---按钮初始化
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击返回
    UIEvent.LuaClick(self.Btn_Return().gameObject,function()
        ArtAtlasControl.SetRoleSkinId()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end)
    ---点击返回主界面
    UIEvent.LuaClick(self.Btn_Home().gameObject,function()
        ArtAtlasControl.SetRoleSkinId()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击帮助
    UIEvent.LuaClick(self.Btn_I().gameObject,function()

    end)
    ---点击剧情
    UIEvent.LuaClick(self.QiehuanPlot().gameObject,function()
        self:ChangePanel(1)
    end)
    ---点击插画
    UIEvent.LuaClick(self.QiehuanIllustration().gameObject,function()
        self:ChangePanel(2)
    end)
    ---点击下一组CG
    UIEvent.LuaClick(self.Btn_NextIllustration().gameObject,function()
        self.CurCgGroupId = self.CurCgGroupId + 1 > #self.CgList and #self.CgList or self.CurCgGroupId + 1
        self:InitCG(self.CgList[self.CurCgGroupId])
    end)
    ---点击上一组CG
    UIEvent.LuaClick(self.Btn_LastIllustration().gameObject,function()
        self.CurCgGroupId = self.CurCgGroupId - 1 < 1 and 1 or self.CurCgGroupId - 1
        self:InitCG(self.CgList[self.CurCgGroupId])
    end)
    ---Cg点击返回
    UIEvent.LuaClick(self.Btn_CGReturn().gameObject,function()
        self.CGPanel().gameObject:SetActive(false)
    end)
    ---Cg点击返回主界面
    UIEvent.LuaClick(self.Btn_CGHome().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---点击下一组CG
    UIEvent.LuaClick(self.Btn_NextVideo().gameObject,function()
        self.CurCgGroupId = self.CurCgGroupId + 1 > #self.CgList and #self.CgList or self.CurCgGroupId + 1
        self:InitCG(self.CgList[self.CurCgGroupId])
    end)
    ---点击上一组CG
    UIEvent.LuaClick(self.Btn_LastVideo().gameObject,function()
        self.CurCgGroupId = self.CurCgGroupId - 1 < 1 and 1 or self.CurCgGroupId - 1
        self:InitCG(self.CgList[self.CurCgGroupId])
    end)
    ---动画点击返回
    UIEvent.LuaClick(self.Btn_AnimReturn().gameObject,function()
        self.AnimPanel().gameObject:SetActive(false)
    end)
    ---Cg点击返回主界面
    UIEvent.LuaClick(self.Btn_AnimHome().gameObject,function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
end

---滑块回调
function M:SwitchCell(trans,idx)
    self:RefreshSwitch(trans.gameObject,self.SwitchData[idx])
end
function M:PlotCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.MainList[idx],self,idx})
end
function M:IllustrationCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CgList[idx],self,idx})
end
function M:RoleCell(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.RolePlotList[idx],self})
end

---刷新Cg滑块
function M:ReloadCGScroll(type,chapter,offset)
    if type == 3 then
        self.CgList = ArtAtlasControl.GetRoleCgData(ArtAtlasControl.GetRoleSkinId())
    else
        self.CgList = ArtAtlasControl.GetCgData(type,chapter)
    end
    
    self.IllustrationScroll01().totalCount = #self.CgList
    if offset then
        self.IllustrationScroll01():RefillCells(offset)
    else
        self.IllustrationScroll01():RefreshCells()
    end
end

---刷新剧情滑块
function M:ReloadMainScroll(type,chapter,offset)
    self.CurPoint = nil
    if type == 3 then
        self.MainList = ArtAtlasControl.GetRolePlotGuide(chapter,ArtAtlasControl.GetRoleSkinId())
    else
        self.MainList = ArtAtlasControl.GetPlotGuide(type,chapter)
    end
    self.MainPlotScroll01().totalCount = #self.MainList
    if ArtAtlasControl.CurPlot ~= nil then
        local index = ArtAtlasControl.CurPlot.chaptersort - 1 < 0 and 0 or ArtAtlasControl.CurPlot.chaptersort - 1
        self.MainPlotScroll01():RefillCells(index)
    else
        if offset then
            self.MainPlotScroll01():RefillCells(offset)
        else
            self.MainPlotScroll01():RefreshCells()
        end
    end
end

---刷新角色剧情滑块
function M:ReloadRolePlot(list,offset)
    self.RolePlotList = list
    self.RolePlotScroll01().totalCount = #self.RolePlotList
    if offset then
        self.RolePlotScroll01():RefillCells(offset)
    else
        self.RolePlotScroll01():RefreshCells()
    end
end

---@param data GuidechapterLocalData 刷新左侧页签
function M:RefreshSwitch(obj,data)
    if data == nil or next(data) == nil then
        for i = 0,obj.transform.childCount - 1 do
            obj.transform:GetChild(i).gameObject:SetActive(false)
        end
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi_H").gameObject
    local TextName = CJNUIMgr.GetSunUseName(obj, "Text_Qieyeming"):GetComponent("TextMeshProUGUI")
    local lock = CJNUIMgr.GetSunUseName(obj, "Btn_Suo").gameObject
    --normal:SetActive(true)
    --highLight:SetActive(false)
    ---当前类型是个人剧情
    if ArtAtlasControl.CurType == 3 then
        ---@type RolePlotData_New
        local roleData = data[1]
        local tSkinData = HeroControl.GetSkinDataBySkinId(roleData.plot_skinId)
        TextName.text = tSkinData.skinName
        --不用锁
        lock.gameObject:SetActive(false)
        --点击事件
        UIEvent.LuaClick(obj,function()
            self:OnClickRole(obj,data)
        end)
        --选中当前选择的章节
        local isUnlock = false
        for i, v in pairs(data) do
            if v:CheckUnLock() then
                isUnlock = true
                break
            end
        end
        if ArtAtlasControl.GetRoleSkinId() == roleData.plot_skinId or (self.CurChapter == nil and isUnlock and ArtAtlasControl.GetRoleSkinId() == nil) then
            self:OnClickRole(obj,data)
        else
            normal:SetActive(true)
            highLight:SetActive(false)
        end
    else
        ---是否解锁
        lock:SetActive(StormControl.CheckPointPass(data.checkpointid) == false)
        ---当前类型为主线活动剧情
        TextName.text = data.chaptername
        TextName.gameObject:SetActive(StormControl.CheckPointPass(data.checkpointid))
        ---点击事件
        UIEvent.LuaClick(obj,function()
            self:OnClickSwitch(obj,data)
        end)
        ---选中当前选择的章节
        if ArtAtlasControl.CurChapter == data.chapterid then
            self:OnClickSwitch(obj,data)
        else
            normal:SetActive(true)
            highLight:SetActive(false)
        end
    end
end

---@param data GuidechapterLocalData 点击章节按钮
function M:OnClickSwitch(obj,data)
    if self.CurChapter == obj then
        return
    end
    if ArtAtlasControl.CurPlot and ArtAtlasControl.CurPlot.chapterid ~= data.chapterid then
        ArtAtlasControl.CurPlot = nil
    end
    if StormControl.CheckPointPass(data.checkpointid) == false then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("plotreplay_ui_tips1")},true)
        return
    end
    ---修改按钮状态
    self:ChangeSwitch(self.CurChapter,false)
    self:ChangeSwitch(obj,true)
    ---当前选中的章节按钮变化
    self.CurChapter = obj
    ---当前选中的章节和类型变化
    --ArtAtlasControl.CurType = data.typeid
    self.typeid = data.typeid
    ArtAtlasControl.CurChapter = data.chapterid
    if self.CurType then
        --剧情
        if self.CurType == 1 then
            self:ChangePanel(1)
        else
            --插画
            self:ChangePanel(2)
        end
    else
        self:ChangePanel(1)
    end
    ---背景变化
    local path = MgrRes.GetLocalizedName(data.chapterbg)
    MgrRes.LoadSprite(self.Img_BG(),path)
end

---@param data RolePlotData_New[]
function M:OnClickRole(obj,data)
    if self.CurChapter == obj then
        return
    end
    local roleData = data[1]
    self.typeid = 3
    ArtAtlasControl.SetRoleSkinId(roleData.plot_skinId)
  
    --修改按钮状态
    self:ChangeSwitch(self.CurChapter,false)
    self:ChangeSwitch(obj,true)
    --当前选中的章节按钮变化
    self.CurChapter = obj
    --页签内容
    if self.CurType then
        --剧情
        if self.CurType == 1 then
            self:ChangePanel(1)
        else
            --插画
            self:ChangePanel(2)
        end
    else
        self:ChangePanel(1)
    end
    --CG按钮显隐
    local tCgList = ArtAtlasControl.GetRoleCg(roleData.plot_skinId)
    self.QiehuanIllustration().gameObject:SetActive(tCgList~=nil)
    --背景变化
    local tChapterRole = ArtAtlasControl.GetRolePlot(roleData.roleId)
    local path = MgrRes.GetLocalizedName(tChapterRole.chapterBg)
    MgrRes.LoadSprite(self.Img_BG(),path)
end

function M:ChangeSwitch(obj,state)
    if obj == nil then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi").gameObject
    local highLight = CJNUIMgr.GetSunUseName(obj, "Img_Qieyedi_H").gameObject
    normal:SetActive(not state)
    highLight:SetActive(state)
end

---@param data PlotguideLocalData
function M:ReloadPointIcon(data)
    ---关卡图片
    local path = MgrRes.GetLocalizedName(data.picture)
    MgrRes.LoadSprite(self.Img_Guankatu(),path)
    ---剧情名
    self.Text_ResPointName().text = data.name
    ---idxName
    self.Text_ResPointIdxName().text = data.number
    ---简介
    self.Text_Jianjie().text = data.introduction
end

---根据类型变化UI
function M:ChangePanel(type)
    --if self.CurType == type then
    --    return
    --end
    ---个人剧情不显示切换按钮
    if ArtAtlasControl.CurType == 3 then
        --self.Btn_Qiehuan().gameObject:SetActive(false)
        --self.collectedIllustrationCount().gameObject:SetActive(false)
        --self.PlotPanel().gameObject:SetActive(false)
        --self.IllustrationPanel().gameObject:SetActive(false)
        --self.RolePanel().gameObject:SetActive(true)
        --return
        self.Text_MainPlot_CN().text = MgrLanguageData.GetLanguageByKey("ui_change_assistant_text4")
    elseif ArtAtlasControl.CurType == 1 then  --主线图鉴
        self.Text_MainPlot_CN().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text116")
        self.Text_MainPlot_EN().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text238")
    elseif ArtAtlasControl.CurType == 2 then  --活动图鉴
        self.Text_MainPlot_CN().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text117")
        self.Text_MainPlot_EN().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text239")
    end
    self.Btn_Qiehuan().gameObject:SetActive(true)
    if type == 1 then
        self.Btn_Plot().gameObject:SetActive(false)
        self.Btn_PlotHighLight().gameObject:SetActive(true)
        self.Btn_Illustration().gameObject:SetActive(true)
        self.Btn_IllustrationHighLight().gameObject:SetActive(false)
        self.PlotPanel().gameObject:SetActive(true)
        self.IllustrationPanel().gameObject:SetActive(false)
        self.RolePanel().gameObject:SetActive(false)
        ---刷新剧情滑块
        self:ReloadMainScroll(self.typeid,ArtAtlasControl.CurChapter,0)
    elseif type == 2 then
        self.Btn_Plot().gameObject:SetActive(true)
        self.Btn_PlotHighLight().gameObject:SetActive(false)
        self.Btn_Illustration().gameObject:SetActive(false)
        self.Btn_IllustrationHighLight().gameObject:SetActive(true)
        self.PlotPanel().gameObject:SetActive(false)
        self.IllustrationPanel().gameObject:SetActive(true)
        self.RolePanel().gameObject:SetActive(false)
        ---刷新Cg滑块
        self:ReloadCGScroll(self.typeid,ArtAtlasControl.CurChapter,0)
    end
    self.CurType = type
    ---收集文本
    if self.CgList == nil then
        self.collectedIllustrationCount().gameObject:SetActive(false)
    else
        local count,totalCount = 0,0
        if self.typeid == 3 then
            count,totalCount = ArtAtlasControl.GetRoleUnlockCgCount(ArtAtlasControl.GetRoleSkinId())
        else
            count,totalCount = ArtAtlasControl.GetUnlockCgCount(ArtAtlasControl.CurType)
        end
        self.collectedIllustrationCount().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text128"),count,totalCount)
        self.collectedIllustrationCount().gameObject:SetActive(true)
    end
end

---@param list Cgdex1LocalData[] 传入同一组数据初始化Cg面板
function M:InitCG(list)
    ---当前Cg组内索引
    self.CurCgIndex = 1
    ---当前CG组Id
    self.CurCgGroupId = list[1].groupid
    ---点击下一张插画
    UIEvent.LuaClick(self.CG_Arrow_Right().gameObject,function()
        self.CurCgIndex = self.CurCgIndex + 1 > #list and #list or self.CurCgIndex + 1
        self:ReloadCGPanel(self.CurCgIndex,list)
    end)
    ---点击上一张插画
    UIEvent.LuaClick(self.CG_Arrow_Left().gameObject,function()
        self.CurCgIndex = self.CurCgIndex - 1 < 1 and 1 or self.CurCgIndex - 1
        self:ReloadCGPanel(self.CurCgIndex,list)
    end)
    ---点击隐藏Cg按钮
    UIEvent.LuaClick(self.Btn_HideCGUI().gameObject,function()
        self.BtnPanel().gameObject:SetActive(false)
        self.ShowCGUI().gameObject:SetActive(true)
    end)
    ---点击显示Cg按钮
    UIEvent.LuaClick(self.ShowCGUI().gameObject,function()
        self.BtnPanel().gameObject:SetActive(true)
        self.ShowCGUI().gameObject:SetActive(false)
    end)
    ---点击暂停
    UIEvent.LuaClick(self.PauseButton().gameObject,function()
        self.CurAnim.transform:GetComponent("CriManaMovieControllerForUI"):Pause(true)
        self.PauseButton().gameObject:SetActive(false)
        self.Btn_Continue().gameObject:SetActive(true)
        self.AnimMask().gameObject:SetActive(true)
        self.Btn_NextVideo().gameObject:SetActive(false)
        self.Btn_LastVideo().gameObject:SetActive(false)
        --判断剧情是否解锁
        if self.CurCgGroupId + 1 <= #self.CgList then
            if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId + 1][1].checkpointid) == true then
                self.Btn_NextVideo().gameObject:SetActive(true)
            end
        end
        if self.CurCgGroupId - 1 >= 1 then
            if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId - 1][1].checkpointid) == true then
                self.Btn_LastVideo().gameObject:SetActive(true)
            end
        end
    end)
    ---点击继续
    UIEvent.LuaClick(self.Btn_Continue().gameObject,function()
        self.CurAnim.transform:GetComponent("CriManaMovieControllerForUI"):Pause(false)
        self.Btn_NextVideo().gameObject:SetActive(false)
        self.Btn_LastVideo().gameObject:SetActive(false)
        self.PauseButton().gameObject:SetActive(true)
        self.Btn_Continue().gameObject:SetActive(false)
        self.AnimMask().gameObject:SetActive(false)
    end)
    ---点击重新播放
    UIEvent.LuaClick(self.RePlayicon().gameObject,function()
        ---刷新CG
        self:ReloadCGPanel(self.CurCgIndex,list)
    end)
    ---刷新CG
    self:ReloadCGPanel(self.CurCgIndex,list)
end

---@param list Cgdex1LocalData[] 刷新Cg
function M:ReloadCGPanel(idx,list)
    local data = list[idx]
    if data.cgoranime == 1 then  --插画
        MgrRes.LoadPlotSprite(self.BG_Illustration(), data.picture,function()
            if Tools.GetScreenWight() > 1920 then
                self.BG_Illustration().transform.localScale = self.BG_Illustration().transform.localScale * (Tools.GetScreenWight() / self.BG_Illustration():GetComponent("RectTransform").rect.width)
            end
        end,true)
        ---组内进度
        self.Text_FenchaNumber().text = "<color=#FFB900>" .. data.number .. "</color>/" .. #list
        ---修改UI状态
        self.CGPanel().gameObject:SetActive(true)
        self.AnimPanel().gameObject:SetActive(false)
        self.BtnPanel().gameObject:SetActive(true)
        self.ShowCGUI().gameObject:SetActive(false)
        --长度为1时隐藏下面按钮
        if #list == 1 then
            self.CGFencha().gameObject:SetActive(false)
        else
            self.CGFencha().gameObject:SetActive(true)
        end
        if data.groupid == 1 then
            self.Btn_LastIllustration().gameObject:SetActive(false)
            self.Btn_NextIllustration().gameObject:SetActive(true)
        elseif data.groupid == #self.CgList then
            self.Btn_NextIllustration().gameObject:SetActive(false)
            self.Btn_LastIllustration().gameObject:SetActive(true)
        else
            self.Btn_NextIllustration().gameObject:SetActive(true)
            self.Btn_LastIllustration().gameObject:SetActive(true)
        end
        --判断剧情是否解锁
        if self.CurCgGroupId + 1 <= #self.CgList then
            if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId + 1][1].checkpointid) == false then
                self.Btn_NextIllustration().gameObject:SetActive(false)
            end
        end
        if self.CurCgGroupId - 1 >= 1 then
            if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId - 1][1].checkpointid) == false then
                self.Btn_LastIllustration().gameObject:SetActive(false)
            end
        end
    elseif data.cgoranime == 2 then  --视频
        MgrSound.StopAll()
        ---隐藏UI
        self.Btn_Continue().gameObject:SetActive(false)
        self.RePlayicon().gameObject:SetActive(false)
        self.Btn_NextVideo().gameObject:SetActive(false)
        self.Btn_LastVideo().gameObject:SetActive(false)
        self.PauseButton().gameObject:SetActive(true)
        self.AnimMask().gameObject:SetActive(false)
        self.CGPanel().gameObject:SetActive(false)
        self.AnimPanel().gameObject:SetActive(true)
        --加载movie组件
        Tools.ClearAllChild(self.BG_AnimRoot().gameObject)
        self.CurAnim = GameObject.Instantiate(self.BG_Anim().gameObject,self.BG_AnimRoot().transform,false)
        local criUI = self.CurAnim.transform:GetComponent("CriManaMovieControllerForUI")
        local path = MgrRes.GetLocalizedName(data.picture)
        criUI.player:SetFile(nil,MgrRes.GetABPath(path ..".usm"))
        criUI.player:Start()
        criUI.player.statusChangeCallback = function(state)
            ---播放完毕 重置按钮UI状态
            if tostring(state) == "PlayEnd: 6" then    --播放完
                self.Btn_NextVideo().gameObject:SetActive(false)
                self.Btn_LastVideo().gameObject:SetActive(false)
                --判断剧情是否解锁
                if self.CurCgGroupId + 1 <= #self.CgList then
                    if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId + 1][1].checkpointid) == true then
                        self.Btn_NextVideo().gameObject:SetActive(true)
                    end
                end
                if self.CurCgGroupId - 1 >= 1 then
                    if StormControl.CheckPointPass(self.CgList[self.CurCgGroupId - 1][1].checkpointid) == true then
                        self.Btn_LastVideo().gameObject:SetActive(true)
                    end
                end
                self.AnimMask().gameObject:SetActive(true)
                self.RePlayicon().gameObject:SetActive(true)
                self.PauseButton().gameObject:SetActive(false)
                self.Btn_Continue().gameObject:SetActive(false)
                criUI.player.statusChangeCallback = nil     --置空
            end
        end
    end
end

function M:OnClose()

end
function M:OnBackKey()
    if self.CGPanel().gameObject.activeSelf then
        self.CGPanel().gameObject:SetActive(false)
        return
    end
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M