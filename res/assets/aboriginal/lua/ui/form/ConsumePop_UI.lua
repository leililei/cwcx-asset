-- Code Auto Create Begin
local M = Class('ConsumePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ConsumePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ConsumePop_UI].prefab'
    self.Name = 'Form[ConsumePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'dian(1)','FRoot/RecievePanel/dian (1)',2},{'Img_Sanjiaoxian1','FRoot/RecievePanel/dian (1)/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','FRoot/RecievePanel/dian (1)/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','FRoot/RecievePanel/dian (1)/Img_Wangdianzuo',2},{'Img_Wangdianyou','FRoot/RecievePanel/dian (1)/Img_Wangdianyou',2},{'RoleCardMask','FRoot/RecievePanel/RoleCardMask',2},{'RewardItem','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',2},{'Img_Icon','FRoot/Text_Consume/Img_Icon',2},{'Btn_Confirm','FRoot/Btn_Confirm',2},{'Btn_Close','FRoot/Btn_Close',2},
        -- UITemplate 列表
        {'RewardItem01','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',10},
        -- RawImage 列表
        {'RewardsScroll','FRoot/RecievePanel/RoleCardMask/RewardsScroll',15},{'RewardsContent','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll01','FRoot/RecievePanel/RoleCardMask/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'ItemAchieveTxtCN','FRoot/RecievePanel/ItemAchieveTxtCN',20},{'ItemAchieveTxtEN','FRoot/RecievePanel/ItemAchieveTxtEN',20},{'Txt_Back','FRoot/RecievePanel/Txt_Back',20},{'Text_Title','FRoot/Text_Title',20},{'Text_Consume','FRoot/Text_Consume',20},{'Text_C','FRoot/Text_Consume/Img_Icon/Text_C',20},{'Text_Queding','FRoot/Btn_Confirm/Text_Queding',20},{'Text_Quxiao','FRoot/Btn_Close/Text_Quxiao',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    UIEvent.LuaClick(self.Btn_Close().gameObject,Handle(self,self.ClosePop))
    UIEvent.LuaClick(self.Btn_Confirm().gameObject,function()
        self:ClosePop()
        if self.callback then
            self.callback(self.consume)
        end
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        self:ClosePop()
    end
end

---更新显示 参数1：标题 参数2：消耗品 参数3：确认回调
function M:OnShow(args)
    self.title = args[1]
    ---@type goods
    self.consume = {}
    local str = string.split(args[2],"_")
    self.consume.goodsType = tonumber(str[1])
    self.consume.goodsID = tonumber(str[2])
    self.consume.goodsNum = tonumber(str[3])
    self.callback = args[3]

    self.Text_Title().text = self.title
    MgrRes.LoadSprite(self.Img_Icon(),"Item/"..Global.GetLocalDataByGoods(self.consume).icon)
    local itemData = ItemControl.GetItemByID(self.consume.goodsID)
    --local PlayerNum = ItemControl.GetItemByIdAndType(self.consume.goodsID,self.consume.goodsType).goods
    --self.Text_Consume().text = PlayerNum.goodsNum >= self.consume.goodsNum and self.consume.goodsNum or string.format("<color=#DB3D3D>%s</color>",self.consume.goodsNum)
    self.Text_Consume().text = itemData.count >= self.consume.goodsNum and self.consume.goodsNum or string.format("<color=#DB3D3D>%s</color>",self.consume.goodsNum)
end
function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end
return M