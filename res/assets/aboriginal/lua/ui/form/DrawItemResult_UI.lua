-- Code Auto Create Begin
local M = Class('DrawItemResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawItemResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawItemResult_UI].prefab'
    self.Name = 'Form[DrawItemResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 6
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundPanel','BackGroundPanel',2},{'BgPanel_SSR','BackGroundPanel/BgPanel_SSR',2},{'di','BackGroundPanel/BgPanel_SSR/di',2},{'wangge','BackGroundPanel/wangge',2},{'wenzi','BackGroundPanel/wenzi',2},{'wenzi(1)','BackGroundPanel/wenzi (1)',2},{'wenzi(2)','BackGroundPanel/wenzi (2)',2},{'dian','BackGroundPanel/dian',2},{'bianxian','BackGroundPanel/bianxian',2},{'nengliangtiao','BackGroundPanel/nengliangtiao',2},{'Ui_chouka_SSR','Ui_chouka_SSR',2},{'ItemPanel','ItemPanel',2},{'Img_Item','ItemPanel/Img_Item',2},{'UI_Canvas','UI_Canvas',2},{'VoicePanel','UI_Canvas/VoicePanel',2},{'yuyinzhezhao','UI_Canvas/VoicePanel/yuyinzhezhao',2},{'ItemInfoPanel','UI_Canvas/ItemInfoPanel',2},{'yingwendi','UI_Canvas/ItemInfoPanel/yingwendi',2},{'Img_IDXian','UI_Canvas/ItemInfoPanel/Img_IDXian',2},{'Btn_ClickClose','UI_Canvas/Btn_ClickClose',2},{'Btn_ResultNext','UI_Canvas/Btn_ResultNext',2},{'Btn_SkipAni','UI_Canvas/Btn_SkipAni',2},{'SkipPanel','UI_Canvas/SkipPanel',2},{'Btn_SkipText','UI_Canvas/SkipPanel/Btn_SkipText',2},{'Btn_Skip','UI_Canvas/SkipPanel/Btn_SkipText/Btn_Skip',2},{'CardDrawBadgeVideoRT','UI_Canvas/CardDrawBadgeVideoRT',2},
        -- TextMeshProUGUI 列表
        {'VoiceWordText','UI_Canvas/VoicePanel/VoiceWordText',20},{'ProTextCN','UI_Canvas/ItemInfoPanel/yingwendi/ProTextCN',20},{'RoleNameText','UI_Canvas/ItemInfoPanel/RoleNameText',20},{'Text','UI_Canvas/SkipPanel/Btn_SkipText/Text',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---@type ItemData
    self.Item = ItemControl.GetItemByID(tonumber(string.split(SteamLocalData.tab[126103][2],"_")[1]))
    --物品图片
    MgrRes.LoadSprite(self.Img_Item(),self.Item.icon)
    --物品名
    self.RoleNameText().text = self.Item.name
    --物品描述
    self.VoiceWordText().text = self.Item.txt
    self:InitBtn()
end

function M:InitBtn()
    local badgeName = ""
    --点击关闭
    UIEvent.LuaClick(self.Btn_ClickClose().gameObject,function()
        local IsSSR = false
        for k,v in pairs(NormalCardDrawViewModel.HeroList) do
            if RoleattributeLocalData.tab[v[1]][6] >= 4 then
                badgeName = RoleattributeLocalData.tab[v[1]][86]
                IsSSR = true
                break
            end
        end
        --还有角色
        if #NormalCardDrawViewModel.HeroList ~= 0 then
            if IsSSR then
                --有SSR
                MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
                MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                    NormalCardDrawViewModel.OpenCardDrawResultUI()
                end),self.ObjRoot)
            else
                NormalCardDrawViewModel.OpenCardDrawResultUI()
            end
        else
            NormalCardDrawViewModel.OpenLightDarkResultUI()
        end
    end)
end

return M