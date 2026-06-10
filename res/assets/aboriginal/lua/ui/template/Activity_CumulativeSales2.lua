--- 注意，生成代码会改变父类，请手动修改。
local Activity_CumulativeSales = require("UI/Template/Activity_CumulativeSales")
-- Code Auto Create Begin
local M = Class('Activity_CumulativeSales2', Activity_CumulativeSales)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_CumulativeSales2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Background','Img_Background',2},{'TaskTabRoot','TaskListRoot/TaskTabRoot',2},{'TaskTabItem','TaskListRoot/TaskTabRoot/TaskTabItem',2},{'Img_TabNormal','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabNormal',2},{'Img_TabHighlight','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabHighlight',2},{'RedDot_TaskTab','TaskListRoot/TaskTabRoot/TaskTabItem/RedDot_TaskTab',2},{'TaskContent','TaskListRoot/TaskScroll/TaskContent',2},{'Btn_AllCollect','Btn_AllCollect',2},{'Btn_Store','Btn_Store',2},{'CoinItem','CoinItem',2},{'Img_CoinBg','CoinItem/Img_CoinBg',2},{'Img_Coin','CoinItem/Img_Coin',2},
        -- UITemplate 列表
        {'Activity_CumulativeSales2','/',10},{'TaskCell','TaskListRoot/TaskScroll/TaskCell',10},
        -- LoopScrollRect 列表
        {'TaskScroll','TaskListRoot/TaskScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TabTitle','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabNormal/Text_TabTitle',20},{'Text_TabTitle01','TaskListRoot/TaskTabRoot/TaskTabItem/Img_TabHighlight/Text_TabTitle',20},{'Text_Time','Text_Time',20},{'Text_AllCollect','Btn_AllCollect/Text_AllCollect',20},{'Text_AllCollect01','Btn_Store/Text_AllCollect',20},{'Text_CoinNum','CoinItem/Text_CoinNum',20},
    }
end
-- Code Auto Create End
---@class Activity_CumulativeSales2 : Activity_CumulativeSales
local ItemCls = M

--region Callback
---@protected
function ItemCls:OnBtnStoreClick()
    -- 借用 VM 传递参数
    ---@type CumulativeSalesShop_UI.InputData
    CumulativeSalesViewModel.SetShopFormArgs({
        activityId = self.m_data.cumulativeSalesData.shopType,
        shopType = self.m_data.cumulativeSalesData.shopType,
    })
    MgrUI.GoHide(UID.CumulativeSalesShop2_UI)
end
--endregion Callback

return M
