-- Code Auto Create Begin
local M = Class('SweepPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SweepPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SweepPrefab','/',2},
        -- UITemplate 列表
        {'SweepPrefab01','/',10},{'SweepRewardItem','SweepRewardItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Index1','Text_Index1',20},{'Text_Index2','Text_Index2',20},{'Text_Index3','Text_Index3',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.SweepRewardItem().gameObject:SetActive(false)
    self.firstShow = false
end

function M:OnUpdateUI(args)
    self.result = args[1]
    self.index = args[2]
    self.parent = args[3]
    self.Sweeping = args[4]
    ---前方文字
    if self.Sweeping == "SweepComplete" then
        self.Text_Index1().gameObject:SetActive(false)
        self.Text_Index2().gameObject:SetActive(false)
        self.Text_Index3().gameObject:SetActive(true)
    elseif self.Sweeping == "Sweeping" then
        self.Text_Index1().gameObject:SetActive(true)
        self.Text_Index2().gameObject:SetActive(true)
        self.Text_Index3().gameObject:SetActive(false)
        self.Text_Index1().text = self.index
        if self.result[2] then  ---胜利
            self.Text_Index2().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text7").."<color=#00FFF0>"..MgrLanguageData.GetLanguageByKey("ui_tongyong_text126").."</color>"
        else  ---失败
            self.Text_Index2().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text7").."<color=#FFFF00>"..MgrLanguageData.GetLanguageByKey("pvprecorditem_fail").."</color>"
        end
    end

    ---奖励展示
    Tools.ClearChildAt(self.ObjRoot,5)
    for i,v in pairs(self.result[1]) do
        if v.goodsNum ~= 0 then
            local obj = GameObject.Instantiate(self.SweepRewardItem().gameObject,self.ObjRoot.transform,false)
            local itemData = ItemControl.GetItemByIdAndType(v.goodsID,v.goodsType)
            itemData.tempCount = tonumber(v.goodsNum)
            obj.transform:GetComponent("UITemplate"):SetData({itemData})
            obj:SetActive(true)
        end
    end

end

return M