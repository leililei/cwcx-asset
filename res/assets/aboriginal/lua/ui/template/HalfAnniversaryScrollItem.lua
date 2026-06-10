-- Code Auto Create Begin
local M = Class('HalfAnniversaryScrollItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/HalfAnniversaryScrollItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UI_Panel','UI_Panel',2},{'Scroll1','UI_Panel/Scroll1',2},{'Img_Line','UI_Panel/Scroll1/Img_Line',2},{'Img_Bg','UI_Panel/Scroll1/Img_Bg',2},{'Img_Mask','UI_Panel/Scroll1/Img_Mask',2},{'Img_Suo','UI_Panel/Scroll1/Img_Mask/Img_Suo',2},{'Img_JuqingIcon','UI_Panel/Scroll1/Img_JuqingIcon',2},{'Img_Juqingkuang','UI_Panel/Scroll1/Img_Juqingkuang',2},{'guankadi','UI_Panel/Scroll1/guankadi',2},{'Img_Zhangjiemingdi','UI_Panel/Scroll1/Name/Img_Zhangjiemingdi',2},{'Img_Gou','UI_Panel/Scroll1/Name/NameText/Img_Gou',2},{'NumberText','UI_Panel/Scroll1/Name/NameText/NumberText',2},{'Img_New','UI_Panel/Scroll1/Img_New',2},{'Scroll2','UI_Panel/Scroll2',2},{'Img_Line01','UI_Panel/Scroll2/Img_Line',2},{'Img_Bg01','UI_Panel/Scroll2/Img_Bg',2},{'Img_Mask01','UI_Panel/Scroll2/Img_Mask',2},{'Img_Suo01','UI_Panel/Scroll2/Img_Mask/Img_Suo',2},{'Jindu','UI_Panel/Scroll2/Jindu',2},{'Tansuozhong','UI_Panel/Scroll2/Jindu/Tansuozhong',2},{'Mubiaowancheng','UI_Panel/Scroll2/Jindu/Mubiaowancheng',2},{'fenggexian','UI_Panel/Scroll2/Jindu/Mubiaowancheng/Text_Tansuozhong/fenggexian',2},{'Quanbuwancheng','UI_Panel/Scroll2/Jindu/Quanbuwancheng',2},{'Img_TansuoIcon','UI_Panel/Scroll2/Img_TansuoIcon',2},{'Img_Tansuokuang','UI_Panel/Scroll2/Img_Tansuokuang',2},{'Img_Zhangjiemingdi01','UI_Panel/Scroll2/Name/Img_Zhangjiemingdi',2},{'Img_Gou01','UI_Panel/Scroll2/Name/NameText/Img_Gou',2},{'NumberText01','UI_Panel/Scroll2/Name/NameText/NumberText',2},{'Img_New01','UI_Panel/Scroll2/Img_New',2},
        -- UITemplate 列表
        {'HalfAnniversaryScrollItem','/',10},
        -- TextMeshProUGUI 列表
        {'TimeText','UI_Panel/Scroll1/guankadi/TimeText',20},{'NameText','UI_Panel/Scroll1/Name/NameText',20},{'Text_Tansuozhong','UI_Panel/Scroll2/Jindu/Tansuozhong/Text_Tansuozhong',20},{'Text_Tansuozhong01','UI_Panel/Scroll2/Jindu/Mubiaowancheng/Text_Tansuozhong',20},{'Text_Mubiaowancheng','UI_Panel/Scroll2/Jindu/Mubiaowancheng/Text_Tansuozhong/Text_Mubiaowancheng',20},{'Text_Tansuozhong02','UI_Panel/Scroll2/Jindu/Quanbuwancheng/Text_Tansuozhong',20},{'NameText01','UI_Panel/Scroll2/Name/NameText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    
end

function M:OnUpdateUI(pData)
    self.Data = pData[1]
    if self.Data == nil then
        self.UI_Panel().gameObject:SetActive(false)
        return
    else
        self.UI_Panel().gameObject:SetActive(true)
    end
    self.isNew = pData[2]
    self.isUnlock = pData[3]

    self.Scroll1().gameObject:SetActive(false)
    self.Scroll2().gameObject:SetActive(false)
    if self.Data.chaptertype == ActiveChapterControl.ChapterType.Plot then
        self:UpdateChapter(self.Scroll1().gameObject)
    else
        self:UpdateMap(self.Scroll2().gameObject)
    end
end
---章节
function M:UpdateChapter(_obj)
    _obj:SetActive(true)
    
    local _ChapterImg = CJNUIMgr.GetSunUseName(_obj, "Img_Bg"):GetComponent("Image")
    local _Lock = CJNUIMgr.GetSunUseName(_obj, "Img_Mask")
    local _Name = CJNUIMgr.GetSunUseName(_obj, "NameText"):GetComponent("TextMeshProUGUI")
    local _Pass = CJNUIMgr.GetSunUseName(_obj, "Img_Gou")
    local _NewChapter = CJNUIMgr.GetSunUseName(_obj, "Img_New")
    ---章节名
    _Name.text = self.Data.chaptername
    ---存在新解锁关卡的章节
    _NewChapter.gameObject:SetActive(self.isNew)
    ---章节解锁
    _Lock.gameObject:SetActive(not self.isUnlock)
    ---章节通关
    _Pass.gameObject:SetActive(not self.isNew and self.isUnlock)
    ---章节图
    MgrRes.LoadSprite(_ChapterImg,self.Data.pickicon)
    ---章节信息
    self.TimeText().text = self.Data.chapterdesc
    
    MgrRes.LoadSprite(self.NumberText(),"Activity/HalfAnniversary/Img_0"..self.Data.chapternum)
    
    ---进入选关界面
    UIEvent.LuaClick(_ChapterImg.gameObject, Handle(self, function()
        HalfAnniControl.OpenLevel(self.Data.chapterid)
    end))
end
---走格子地图
function M:UpdateMap(_obj)
    _obj:SetActive(true)

    local _ChapterImg = CJNUIMgr.GetSunUseName(_obj, "Img_Bg"):GetComponent("Image")
    local _Lock = CJNUIMgr.GetSunUseName(_obj, "Img_Mask")
    local _Name = CJNUIMgr.GetSunUseName(_obj, "NameText"):GetComponent("TextMeshProUGUI")
    local _Plot_Jindu = CJNUIMgr.GetSunUseName(_obj, "Jindu")
    local _Plot_Finding = CJNUIMgr.GetSunUseName(_obj, "Tansuozhong")
    local _Plot_TargetAch = CJNUIMgr.GetSunUseName(_obj, "Mubiaowancheng")
    local _Plot_AllAchievement  = CJNUIMgr.GetSunUseName(_obj, "Quanbuwancheng")
    local _NewChapter = CJNUIMgr.GetSunUseName(_obj, "Img_New")
    local _Pass = CJNUIMgr.GetSunUseName(_obj, "Img_Gou")

    ---章节名
    _Name.text = self.Data.chaptername
    ---章节解锁
    _Lock.gameObject:SetActive(not self.isUnlock)
    ---章节图
    MgrRes.LoadSprite(_ChapterImg,self.Data.pickicon)
    ---存在新解锁关卡的章节
    _NewChapter.gameObject:SetActive(self.isNew)
    ---章节通关
    _Pass.gameObject:SetActive(not self.isNew and self.isUnlock)

    MgrRes.LoadSprite(self.NumberText01(),"Activity/HalfAnniversary/Img_0"..self.Data.chapternum)
    --没有走格子关卡了
    ---若探索关卡解锁,显示探索进度
    --if self.isUnlock then
    --    local tPassType = ActiveChapterControl.CheckScrollState(self.Data.chapterid)
    --    _Plot_Jindu.gameObject:SetActive(true)
    --    if tPassType == 0 then
    --        _Plot_Finding.gameObject:SetActive(true)
    --        _Plot_TargetAch.gameObject:SetActive(false)
    --        _Plot_AllAchievement.gameObject:SetActive(false)
    --    elseif tPassType == 1 then
    --        _Plot_TargetAch.gameObject:SetActive(true)
    --        _Plot_Finding.gameObject:SetActive(false)
    --        _Plot_AllAchievement.gameObject:SetActive(false)
    --    elseif tPassType == 2 then
    --        _Plot_AllAchievement.gameObject:SetActive(true)
    --        _Plot_Finding.gameObject:SetActive(false)
    --        _Plot_TargetAch.gameObject:SetActive(false)
    --    end
    --else
        _Plot_Jindu.gameObject:SetActive(false)
        _Plot_Finding.gameObject:SetActive(false)
        _Plot_TargetAch.gameObject:SetActive(false)
        _Plot_AllAchievement.gameObject:SetActive(false)
    --end

    ---进入选关界面
    UIEvent.LuaClick(_ChapterImg.gameObject, Handle(self, function()
        HalfAnniControl.OpenLevel(self.Data.chapterid)
    end))
end

return M