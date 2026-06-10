-- Code Auto Create Begin
local M = Class('HalfAnniversaryScroll_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HalfAnniversaryScroll_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HalfAnniversaryScroll_UI].prefab'
    self.Name = 'Form[HalfAnniversaryScroll_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'Img_Curtain_L','Background/Img_Curtain_L',2},{'Img_Curtain_R','Background/Img_Curtain_R',2},{'Img_Wu','Background/Img_Wu',2},{'Main','Main',2},{'Panel_MainPoint','Main/Panel_MainPoint',2},{'ChapterScroll','Main/ChapterScroll',2},{'UpperRightPanel','UpperRightPanel',2},{'Btn_AddPower','UpperRightPanel/Btn_AddPower',2},{'Img_PowerBG','UpperRightPanel/Btn_AddPower/Img_PowerBG',2},{'Btn_Add','UpperRightPanel/Btn_AddPower/Btn_Add',2},{'Img_Tiliicon','UpperRightPanel/Btn_AddPower/Img_Tiliicon',2},{'UpperLightPanel','UpperLightPanel',2},{'Btn_GoMenu','UpperLightPanel/Btn_GoMenu',2},{'Btn_Back','UpperLightPanel/Btn_Back',2},{'Img_Fenggexian','UpperLightPanel/Img_Fenggexian',2},{'Btn_Help','UpperLightPanel/Btn_Help',2},
        -- UITemplate 列表
        {'HalfAnniversaryScrollItem','Main/ChapterScroll/HalfAnniversaryScrollItem',10},
        -- RawImage 列表
        {'Content','Main/ChapterScroll/Content',15},
        -- LoopScrollRect 列表
        {'ChapterScroll01','Main/ChapterScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_ResTili','UpperRightPanel/Btn_AddPower/Text_ResTili',20},{'Text_Title_CN','UpperLightPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','UpperLightPanel/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.ChapterList = {}
    self.NewChapterList = {}        ---新章节
    self.UnlockChapterList = {}     ---解锁章节
    self.HalfAnniData = HalfAnniControl.GetData()
    ---注册滑块
    self.ChapterScroll01():SetLuaCellEvent(Handle(self, self.CellItem))

    self:RefreshCoinCount()
    self:InitButton()
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)

    ---跳转体力信息面板
    UIEvent.LuaClick(self.Btn_AddPower().gameObject, Handle(self, function()
        MgrUI.Pop(UID.VigorInfoPanel, {function()
            self:RefreshCoinCount()
        end}, true)
    end))
end

function M:CellItem(trans, idx)
    local isNew = nil
    local isUnlock = nil
    if self.ChapterList[idx] then
        isNew = self.NewChapterList[self.ChapterList[idx].chapterid] ~= nil
        isUnlock = self.UnlockChapterList[self.ChapterList[idx].chapterid] ~= nil
    end
    
    trans:GetComponent("UITemplate"):SetData({ self.ChapterList[idx],isNew,isUnlock })
end

---更新章节信息
function M:UpdataChapter()
    self.ChapterList = HalfAnniControl.GetChapterLevels()
    ---获取新解锁关卡的章节ID和已解锁章节的数据
    self.UnlockChapterList,self.NewChapterList = HalfAnniControl.GetNewChapter()

    self.ChapterScroll01().totalCount = #self.ChapterList+1
    self.ChapterScroll01():RefillCells()
end

function M:OnShowFinish()
    local TouchLevel = HalfAnniControl.GetToutchLevel()
    if TouchLevel == nil then
        return
    end
    local idx = 0
    for i, v in ipairs(self.ChapterList) do
        if v.chapterid == TouchLevel.chapter then
            idx = i-1
            break
        end
    end

    self.ChapterScroll01():ScrollToCell(idx,3000)
end

function M:OnUpdateUI()
    self:UpdataChapter()
    ---背景音乐
    if self.HalfAnniData and self.HalfAnniData.music ~= "" then
        MgrSound.PlayBGM(self.HalfAnniData.music,0.2,nil,true)
    end
end
---刷新体力
function M:RefreshCoinCount()
    local TiliMax = PlayerplLocalData.tab[PlayerControl.GetPlayerData().level][4]
    local curTili = PlayerControl.GetPlayerData():GetVigor()
    self.Text_ResTili().text = curTili.."/"..TiliMax
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M