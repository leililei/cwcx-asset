-- Code Auto Create Begin
local M = Class('EventAtlasChapterItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/EventAtlasChapterItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Icon','Panel/Img_Icon',2},{'Img_Juanhaodi','Panel/Img_Juanhaodi',2},{'Img_Volumedi','Panel/Img_Volumedi',2},{'Panel_Lock','Panel/Panel_Lock',2},{'Img_Zhezhao(bai)','Panel/Panel_Lock/Img_Zhezhao(bai)',2},{'Img_Xian1','Panel/Panel_Lock/Img_Xian1',2},{'Img_Xian2','Panel/Panel_Lock/Img_Xian2',2},{'Img_Suo','Panel/Panel_Lock/Img_Suo',2},{'Img_Jiaobiao','Panel/Panel_Lock/Img_Jiaobiao',2},{'ScrollRedDotIcon','Panel/ScrollRedDotIcon',2},
        -- UITemplate 列表
        {'EventAtlasChapterItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Number','Panel/Text_Number',20},{'Text_Volume','Panel/Img_Volumedi/Text_Volume',20},{'LockTips','Panel/Panel_Lock/LockTips',20},{'Text_Lock','Panel/Panel_Lock/Text_Lock',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Img_Icon().gameObject,function()
        if self.Unlock == false then
            return
        end
        ArtAtlasControl.OpenPlotAtlasUI(self.data.typeid,self.data.chapterid)
    end)
end

function M:OnUpdateUI(Args)
    ---@type GuidechapterLocalData
    self.data = Args[1]
    self.parent = Args[2]
    ---封面图
    MgrRes.LoadSprite(self.Img_Icon(),self.data.chaptertitle)
    ---序号
    self.Text_Number().gameObject:SetActive(false)
    ---红点
    self.ScrollRedDotIcon().gameObject:SetActive(false)
    ---@type PlotguideLocalData
    local plotData = ArtAtlasControl.GetPlotGuide(self.data.typeid,self.data.chapterid)[1]
    ---是否解锁
    self.Panel_Lock().gameObject:SetActive(false)
    if plotData.checkpointid == 0 then
        self.Panel_Lock().gameObject:SetActive(false)
    else
        self.Panel_Lock().gameObject:SetActive(not StormControl.CheckPointPass(plotData.checkpointid))
    end
    if StormControl.CheckPointPass(plotData.checkpointid) == false then
        self.LockTips().text = StormControl.GetStormPointByID(plotData.checkpointid).name
    end
    self.Unlock = StormControl.CheckPointPass(plotData.checkpointid)
end

return M