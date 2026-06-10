-- Code Auto Create Begin
local M = Class('Activity_Cake', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Cake.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Cake','/',2},{'Img_LiHui','Img_LiHui',2},{'RightBtn','RightBtn',2},{'Btn_SignIn','RightBtn/Btn_SignIn',2},{'Sign_RedDot','RightBtn/Btn_SignIn/Sign_RedDot',2},{'Btn_Ingredients','RightBtn/Btn_Ingredients ',2},{'Task_RedDot','RightBtn/Btn_Ingredients /Task_RedDot',2},{'Btn_Bakery','RightBtn/Btn_Bakery',2},{'Btn_GiftGiving','Btn_GiftGiving',2},{'Title','Title',2},
        -- UITemplate 列表
        {'Activity_Cake01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitButton()
end
function M:OnUpdateUI(pData)
    self.ActiveID = pData[1] 

    self.Sign_RedDot().gameObject:SetActive(RedDotControl.GetDotData("CakeSign").State)
    self.Task_RedDot().gameObject:SetActive(RedDotControl.GetDotData("CakeTask").State)
end

function M:InitButton()
    ---材料收集
    UIEvent.LuaClick(self.Btn_Ingredients().gameObject,function()
        CakeControl.OpenTask()
    end)
    ---签到
    UIEvent.LuaClick(self.Btn_SignIn().gameObject,function()
        CakeControl.OpenSign()
    end)
    ---烘焙坊
    UIEvent.LuaClick(self.Btn_Bakery().gameObject,function()
        CakeControl.OpenBakery()
    end)
    ---礼物赠送
    UIEvent.LuaClick(self.Btn_GiftGiving().gameObject,function()
        CakeControl.OpenGift()
    end)
end

return M