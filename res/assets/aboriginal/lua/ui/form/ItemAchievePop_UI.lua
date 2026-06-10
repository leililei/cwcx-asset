-- Code Auto Create Begin
local M = Class('ItemAchievePop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.ItemAchievePop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[ItemAchievePop_UI].prefab'
    self.Name = 'Form[ItemAchievePop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 3
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Btn_Back','Btn_Back',2},{'dian(1)','FRoot/RecievePanel/dian (1)',2},{'Img_Sanjiaoxian1','FRoot/RecievePanel/dian (1)/Img_Sanjiaoxian1',2},{'Img_Sanjiaoxian2','FRoot/RecievePanel/dian (1)/Img_Sanjiaoxian2',2},{'Img_Wangdianzuo','FRoot/RecievePanel/dian (1)/Img_Wangdianzuo',2},{'Img_Wangdianyou','FRoot/RecievePanel/dian (1)/Img_Wangdianyou',2},{'RoleCardMask','FRoot/RecievePanel/RoleCardMask',2},{'RewardItem','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',2},
        -- UITemplate 列表
        {'RewardItem01','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardItem',10},
        -- RawImage 列表
        {'RewardsScroll','FRoot/RecievePanel/RoleCardMask/RewardsScroll',15},{'RewardsContent','FRoot/RecievePanel/RoleCardMask/RewardsScroll/RewardsContent',15},
        -- LoopScrollRect 列表
        {'RewardsScroll01','FRoot/RecievePanel/RoleCardMask/RewardsScroll',18},
        -- TextMeshProUGUI 列表
        {'ItemAchieveTxtCN','FRoot/RecievePanel/ItemAchieveTxtCN',20},{'ItemAchieveTxtEN','FRoot/RecievePanel/ItemAchieveTxtEN',20},{'Txt_Back','FRoot/RecievePanel/Txt_Back',20},
    }
end
-- Code Auto Create End
---奖励弹窗
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))

    Event.Add("ShowGetItemsPanelEff", function ()
        --self.RewardsContent().gameObject:SetActive(true)
        if self.RewardsContent() then
            self.RewardsContent().transform.localScale = Vector3(1,1,1)
        end
    end)
    Event.Add("HideGetItemsPanelEff", function ()
        --self.RewardsContent().gameObject:SetActive(false)
        if self.RewardsContent() then
            self.RewardsContent().transform.localScale = Vector3(0,0,0)
        end
    end)
    ---注册事件
    UIEvent.LuaClick(self.Btn_Back().gameObject,Handle(self,function ()
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        --Event.Clear("HideGetItemsPanelEff")
        --Event.Clear("ShowGetItemsPanelEff")
        --if self.backCell ~= nil then
        --    self.backCell()
        --end
        MgrUI.ClosePop(self.Uid)
    end))
    self.CurLoopList = {}
    ---注册滑块
    self.RewardsScroll01():SetLuaCellEvent(function(trans, idx)
        trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx].d,self.CurLoopList[idx].n,self.CurLoopList[idx].t, {IsUse = false}})
    end)
end

function M:OnBackKey()
    local tab = {"HuoDongPop_UI","temAchievePop_UI","StarRewardPop_UI"}
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,tab) and MgrUI.IsShow(self.Uid) then --没有pop打开
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        --if self.backCell ~= nil then
        --    self.backCell()
        --end
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_huodejiangli_01",nil,nil,false)
    self.items = args[1] or {}
    self.backCell = args[2]
    if #self.items ~= 0 then
        if self.items[1].armorID ~= nil then
            for idx, armor in pairs(self.items) do
                local data = CoreLocalData.tab[armor.armorID]
                self.CurLoopList[#self.CurLoopList + 1] = {
                    d = data,
                    t = 3,
                    n = 1,
                }
            end
            ---为核心
            self.ItemAchieveTxtCN().text = MgrLanguageData.GetLanguageByKey("itemachievepop_ui_getcore")
            self.ItemAchieveTxtEN().text = "Get Mech"
        elseif self.items[1].goodsID ~= nil then
            ---为资源道具
            self.m_skins = {};
            for idx, goods in pairs(self.items) do
                if goods.goodsNum ~= 0 then
                    local data = ItemControl.GetItemByType(goods.goodsType,goods.goodsID)
                    if not data then
                        Global.LogError(string.format("道具(type:%s,id:%s)不存在", goods.goodsType, goods.goodsID))
                        -- 创建对象防止报空
                        data = {
                            id = goods.goodsID,
                            quality = 0,
                        }
                    end
                    self.CurLoopList[#self.CurLoopList + 1] = {
                        d = data,
                        t = goods.goodsType,
                        n = goods.goodsNum,
                    }
                    if 4 == goods.goodsType then
                        if nil ~= HideLocalData.tab[goods.goodsID] and 1 == HideLocalData.tab[goods.goodsID].skintype then
                            table.insert(self.m_skins, { heroID = goods.goodsID, });
                        end
                    end
                end
            end
            table.sort(self.CurLoopList, function(a,b)
                return a.d.quality > b.d.quality
            end)
            self.ItemAchieveTxtCN().text = MgrLanguageData.GetLanguageByKey("itemachievepop_ui_getresource")
            self.ItemAchieveTxtEN().text = "Get Resources"
        end
    end
    self:ResetItem()
    ---数量低于8关闭滑动并居中
    if #self.CurLoopList < 8 then
        self.RewardsScroll01().horizontal = false
        self.RewardsScroll01().vertical = false
        local v3 = Vector3(910 - ((274 * #self.CurLoopList - 60) / 2),0,0)
        self.RoleCardMask().transform.localPosition = self.RewardsScroll01().transform.localPosition + v3
    end
end
function M:OnShowFinish()
    if nil ~= self.m_skins and #self.m_skins > 0 then
        MgrTimer.AddDelayNoName(0.5,function()
            MgrUI.Pop(UID.DrawResultPop_UI, { self.m_skins }, true);
        end,nil);
    end
end
---设置滑动数据
function M:ResetItem()
    ---获取当前loop数据
    self.RewardsScroll01().totalCount = #self.CurLoopList
    self.RewardsScroll01():RefillCells(0)
end

function M:OnClose()
    Event.Go("ItemAchievePopClose")
    Event.CheckClear("ItemAchievePopClose")

    Event.Clear("HideGetItemsPanelEff")
    Event.Clear("ShowGetItemsPanelEff")

    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    if self.backCell ~= nil then
        self.backCell()
    end
end

return M