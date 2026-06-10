-- Code Auto Create Begin
local M = Class('PvPRecordItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PvPRecordItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Jiludi','Img_Jiludi',2},{'Img_Shengbaidi','Img_Shengbaidi',2},{'Img_Victory','Img_Victory',2},{'Img_Fail','Img_Fail',2},{'Btn_ChakanRecord','Btn_ChakanRecord',2},{'Img_Chakandi','Btn_ChakanRecord/Img_Chakandi',2},{'Img_Jiantou','Btn_ChakanRecord/Img_Jiantou',2},
        -- UITemplate 列表
        {'PvPRecordItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_VictoryOrFail','Img_Shengbaidi/Text_VictoryOrFail',20},{'Text_Time','Text_Time',20},{'Text_VSPlayer','Text_VSPlayer',20},{'Text_Fenshu','Text_Fenshu',20},{'Text_Chakan','Btn_ChakanRecord/Text_Chakan',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    if pData.win == 0 then
        self.Text_VictoryOrFail().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")
        self.Text_Fenshu().text = "<color=#03FFEA>+"..pData.score.."</color>"
        self.Img_Victory().gameObject:SetActive(true)
        self.Img_Fail().gameObject:SetActive(false)
    else
        self.Text_VictoryOrFail().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")
        self.Text_Fenshu().text = "<color=#FF0000>"..pData.score.."</color>"
        self.Img_Victory().gameObject:SetActive(false)
        self.Img_Fail().gameObject:SetActive(true)
    end
    self.Text_VSPlayer().text = MgrLanguageData.GetLanguageByKey("pvpready_ui_tips9").." "..pData.name
    self:RefeshTime(pData.time)
    UIEvent.LuaClick(self.Btn_ChakanRecord().gameObject,function()
        BattleManager.GameMode = BattleManager.GameModeType.PVP
        PVPViewModel.CuRecordTime = self.dataTime
        PVPViewModel.ViewRecords({ pData.token });    --获取对战数据
    end)
end

---计算记录时间
function M:RefeshTime(recordTime)
    local xx = Global.GetCurTime() - recordTime
    local day = math.floor(xx/86400)
    if day <= 0 then
        day = 0
    end
    local hour = math.floor(xx%86400/3600)
    local min = math.floor(xx%86400%3600/60)
    self.dataTime = MgrLanguageData.GetLanguageByKey("pvprecorditem_justnow")
    if day>=1 then
        self.Text_Time().text = string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_dayago"),day)
        self.dataTime =string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_dayago"),day)
    elseif hour >=1 then
        self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_hourago"),hour)
        self.dataTime =string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_hourago"),hour)
    elseif min >=1 then
        self.Text_Time().text =string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_minago"),min)
        self.dataTime =string.format(MgrLanguageData.GetLanguageByKey("pvprecorditem_minago"),min)
    else
        self.Text_Time().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_justnow")
        self.dataTime = MgrLanguageData.GetLanguageByKey("pvprecorditem_justnow")
    end
end
return M