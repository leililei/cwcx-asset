-- Code Auto Create Begin
local M = Class('PointAtalsItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PointAtalsItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'PointAtalsItem','/',2},{'Xuanguan_H','Xuanguan_H',2},{'Btn_Zhandouqian','Xuanguan_H/Btn_Zhandouqian',2},{'Zhandouqian_Hui','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Hui',2},{'WuIcon','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Hui/WuIcon',2},{'Zhandouqian_Suo','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Suo',2},{'Img_Suo','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Suo/Img_Suo',2},{'Zhandouqian','Xuanguan_H/Btn_Zhandouqian/Zhandouqian',2},{'BofangIcon','Xuanguan_H/Btn_Zhandouqian/Zhandouqian/BofangIcon',2},{'Btn_Zhandouhou','Xuanguan_H/Btn_Zhandouhou',2},{'Zhandouhou_Hui','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Hui',2},{'WuIcon01','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Hui/WuIcon',2},{'Zhandouhou_Suo','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Suo',2},{'Img_Suo01','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Suo/Img_Suo',2},{'Zhandouhou','Xuanguan_H/Btn_Zhandouhou/Zhandouhou',2},{'BofangIcon01','Xuanguan_H/Btn_Zhandouhou/Zhandouhou/BofangIcon',2},{'XZJiaobiao','Xuanguan_H/XZJiaobiao',2},{'Xuanguan','Xuanguan',2},
        -- UITemplate 列表
        {'PointAtalsItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Zhandouqian','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Hui/Text_Zhandouqian',20},{'Text_Weijiesuo','Xuanguan_H/Btn_Zhandouqian/Zhandouqian_Suo/Text_Weijiesuo',20},{'Text_Zhandouqian01','Xuanguan_H/Btn_Zhandouqian/Zhandouqian/Text_Zhandouqian',20},{'Text_Zhandouhou','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Hui/Text_Zhandouhou',20},{'Text_Weijiesuo01','Xuanguan_H/Btn_Zhandouhou/Zhandouhou_Suo/Text_Weijiesuo',20},{'Text_Zhandouhou01','Xuanguan_H/Btn_Zhandouhou/Zhandouhou/Text_Zhandouhou',20},{'Text_GuankaName','Xuanguan_H/Text_GuankaName',20},{'Text_GuankaName01','Xuanguan/Text_GuankaName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击战前剧情
    UIEvent.LuaClick(self.Btn_Zhandouqian().gameObject,function()
        if self.data.plot_first == "0" then
            return
        end
        if self.data.typeid == -1 then
            return
        end
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
            PlotViewModel.OpenPlotUI(self.data.plot_first,function()
                --播放完毕回调
            end,false)
            return
        end
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_dex_text10"),1},true)
    end)
    ---点击战后剧情
    UIEvent.LuaClick(self.Btn_Zhandouhou().gameObject,function()
        if self.data.plot_last == "0" then
            return
        end
        if self.data.typeid == -1 then
            return
        end
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
            PlotViewModel.OpenPlotUI(self.data.plot_last,function()
                --播放完毕回调
            end,false)
            return
        end
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrlink_tips3"),1},true)
    end)
    ---点击选择自己
    UIEvent.LuaClick(self.Xuanguan().gameObject,function()
        if self.data.typeid == -1 then
            return
        end
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
            self:Change(self.parent.CurPoint,false)
            self:Change(self.ObjRoot,true)
            return
        end
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_dex_text10"),1},true)
    end)
end

function M:OnUpdateUI(Args)
    ---@type PlotguideLocalData
    self.data = Args[1]
    self.parent = Args[2]
    self.idx = Args[3]
    ---如果是空数据
    if self.data.typeid == -1 then
        self.ObjRoot:GetComponent("CanvasGroup").alpha = 0
    else
        self.ObjRoot:GetComponent("CanvasGroup").alpha = 1
    end
    if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
        self.Text_GuankaName().text = self.data.name
        self.Text_GuankaName01().text = self.data.name
    else
        self.Text_GuankaName().text = "???"
        self.Text_GuankaName01().text = "???"
    end
    ---是否有剧情
    if self.data.plot_first == "0" then
        self.Zhandouqian_Hui().gameObject:SetActive(true)
        self.Zhandouqian_Suo().gameObject:SetActive(false)
        self.Zhandouqian().gameObject:SetActive(false)
    else
        ---是否解锁
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
            self.Zhandouqian_Hui().gameObject:SetActive(false)
            self.Zhandouqian_Suo().gameObject:SetActive(false)
            self.Zhandouqian().gameObject:SetActive(true)
        else
            self.Zhandouqian_Hui().gameObject:SetActive(false)
            self.Zhandouqian_Suo().gameObject:SetActive(true)
            self.Zhandouqian().gameObject:SetActive(false)
        end
    end
    if self.data.plot_last == "0" then
        self.Zhandouhou_Hui().gameObject:SetActive(true)
        self.Zhandouhou_Suo().gameObject:SetActive(false)
        self.Zhandouhou().gameObject:SetActive(false)
    else
        if StormControl.CheckPointPass(self.data.checkpointid) or ArtAtlasControl.CheckUnLockByRoleID(self.data.chapterid, self.data.checkpointid) then
            self.Zhandouhou_Hui().gameObject:SetActive(false)
            self.Zhandouhou_Suo().gameObject:SetActive(false)
            self.Zhandouhou().gameObject:SetActive(true)
        else
            self.Zhandouhou_Hui().gameObject:SetActive(false)
            self.Zhandouhou_Suo().gameObject:SetActive(true)
            self.Zhandouhou().gameObject:SetActive(false)
        end
    end

    self.Xuanguan_H().gameObject:SetActive(false)
    self.Xuanguan().gameObject:SetActive(true)
    if ArtAtlasControl.CurPlot == nil then
        if self.idx == 1 then
            self:Change(self.ObjRoot.gameObject,true)
        end
    else
        if ArtAtlasControl.CurPlot == self.data then
            self:Change(self.ObjRoot.gameObject,true)
        end
    end
end

function M:Change(obj,state)
    if obj == nil  then
        return
    end
    local normal = CJNUIMgr.GetSunUseName(obj, "Xuanguan").gameObject
    local high = CJNUIMgr.GetSunUseName(obj, "Xuanguan_H").gameObject
    high.gameObject:SetActive(state)
    normal.gameObject:SetActive(not state)
    if state == true and self.parent.CurPoint ~= obj then
        self.parent.CurPoint = obj
        ---赋值当前选中剧情
        ArtAtlasControl.CurPlot = self.data
        ---刷新图片
        self.parent:ReloadPointIcon(self.data)
    end
    -----强制布局
    Tools.ReContentSizeGroup(self.ObjRoot.gameObject.transform.parent.gameObject)
end

return M