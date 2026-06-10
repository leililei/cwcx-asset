-- Code Auto Create Begin
local M = Class('PopTip_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PopTip_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PopTip_UI].prefab'
    self.Name = 'Form[PopTip_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'WarnMask','WarnMask',2},{'WarnPanel','WarnPanel',2},{'WarningBackGround','WarnPanel/WarningBackGround',2},{'LikeTipsPanel','LikeTipsPanel ',2},{'WarningBackGround(1)','LikeTipsPanel /WarningBackGround (1)',2},{'Image','LikeTipsPanel /LikeTipsText/Image',2},{'FriendshipCoinPanel','FriendshipCoinPanel',2},{'WarningBackGround(2)','FriendshipCoinPanel/WarningBackGround (2)',2},{'Image01','FriendshipCoinPanel/FriendshipCoinText/Image',2},
        -- TextMeshProUGUI 列表
        {'WarnningText','WarnPanel/WarnningText',20},{'LikeTipsText','LikeTipsPanel /LikeTipsText',20},{'FriendshipCoinText','FriendshipCoinPanel/FriendshipCoinText',20},
    }
end
-- Code Auto Create End
require("JNUI/JNGearData")
function M:OnInit()
    -- 父节点Panel获取
    M.WarnPanel=self.WarnPanel().gameObject
    --文本框获取
    M.Txt_WarnningText=self.WarnningText()
    --点赞送体力文本父节点
    M.LikeTipsPanel = self.LikeTipsPanel().gameObject
    --点赞送友情币父节点
    M.FriendshipCoinPanel = self.FriendshipCoinPanel().gameObject
    --点赞送友情币文本框
    M.FriendshipCoinText = self.FriendshipCoinText().gameObject:GetComponent("TextMeshProUGUI")
    --隐藏
    M.LikeTipsPanel.gameObject:SetActive(false)
    M.FriendshipCoinPanel.gameObject:SetActive(false)
    --好友点赞送体力
    self.likeTips = "likeTips"
    --好友点赞送友情币
    self.FriendshipCoinTips = "FriendshipCoinTips"
end

function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_xitongtishi_01",1,nil,false)
    M.Txt_WarnningText.text=args[1]
    local time = args[2] or 1
    local tClickDelay = Global.GetCurTime()+time

    M.WarnPanel:SetActive(true)
    M.FriendshipCoinPanel.gameObject:SetActive(false)
    M.LikeTipsPanel.gameObject:SetActive(false)
    ---根据参数修改UI显示
    if args[1] == self.likeTips then
        M.FriendshipCoinPanel.gameObject:SetActive(false)
        M.WarnPanel:SetActive(false)
        self.LikeTipsText().text = string.format(MgrLanguageData.GetLanguageByKey("poptip_ui_tips1"),"          +"..tostring(args[4]))
    elseif args[4] == self.FriendshipCoinTips then
        M.LikeTipsPanel.gameObject:SetActive(false)
        M.WarnPanel:SetActive(false)
    end
    ---好友点赞送体力
    M.LikeTipsPanel.gameObject:SetActive(args[1] == self.likeTips)
    ---好友点赞送友情币
    if(args[4] == self.FriendshipCoinTips) then
        M.FriendshipCoinPanel.gameObject:SetActive(true)
        M.FriendshipCoinText.text = args[1]
    else    --args[4] == 5

    end
    UIEvent.LuaClick(self.WarnMask().gameObject,Handle(self,function()
        if tClickDelay < Global.GetCurTime() then
            MgrUI.ClosePop(UID.PopTip_UI)
        end
    end))
    MgrTimer.AddDelay("CloseTipsPop",time,function ()
        MgrUI.ClosePop(self.Uid)
    end ,nil)
end
function M:OnHide()
    MgrTimer.Cancel("CloseTipsPop")
end
function M:OnClose()
    MgrTimer.Cancel("CloseTipsPop")
end
return M