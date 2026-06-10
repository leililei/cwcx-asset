-- Code Auto Create Begin
local M = Class('WudaohuiRecordItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WudaohuiRecordItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Jiludi','Img_Jiludi',2},{'Img_Victory','Img_Victory',2},{'Img_Fail','Img_Fail',2},{'Btn_ChakanRecord','Btn_ChakanRecord',2},{'Img_Chakandi','Btn_ChakanRecord/Img_Chakandi',2},{'Img_Jiantou','Btn_ChakanRecord/Img_Jiantou',2},
        -- UITemplate 列表
        {'WudaohuiRecordItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Time','Text_Time',20},{'Text_VS','Text_VS',20},{'Text_VSPlayer','Text_VSPlayer',20},{'Text_Shengfu','Text_Shengfu',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitButton()
end

function M:InitButton()
    UIEvent.LuaClick(self.Btn_ChakanRecord().gameObject,function()
        BuDoukaiControl.SetBuDoukaiResult(self.WinData)
        BuDoukaiControl.OpenComplete()
    end)
end

function M:OnUpdateUI(pData)
    ---玩家个人战报
    self.WinData = pData[1]
    ---对手昵称
    self.Text_VSPlayer().text = self.WinData.otherName
    ---时间
    self.Text_Time().text = Global.GetTimeByDifference(Global.GetCurTime()-self.WinData.fightTime)
    ---胜负状态 2胜利 1失败 0平局
    if self.WinData.result == 0 then
        --平局
        self.Text_Shengfu().text = MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text8")
        
        self.Img_Fail().gameObject:SetActive(false)
        self.Img_Victory().gameObject:SetActive(false)
    elseif self.WinData.result == 1 then
        --失败
        self.Text_Shengfu().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_fail")

        self.Img_Fail().gameObject:SetActive(true)
        self.Img_Victory().gameObject:SetActive(false)
    else
        --胜利
        self.Text_Shengfu().text = MgrLanguageData.GetLanguageByKey("pvprecorditem_victory")

        self.Img_Fail().gameObject:SetActive(false)
        self.Img_Victory().gameObject:SetActive(true)
    end
end

return M