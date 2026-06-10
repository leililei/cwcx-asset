-- Code Auto Create Begin
local M = Class('OptionalItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/OptionalItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'OptionalItem','/',2},{'RolePrefab','RolePrefab',2},{'Img_Touxiangdi','RolePrefab/Img_Touxiangdi',2},{'RoleIcon','RolePrefab/RoleIcon',2},{'Img_Kuang','RolePrefab/Img_Kuang',2},{'Text_Lv','RolePrefab/Text_Lv',2},{'zhiyeicon','RolePrefab/zhiyeicon',2},{'Img_Rankdi','RolePrefab/Img_Rankdi',2},{'EmptyStar','RolePrefab/EmptySrarPanel/EmptyStar',2},{'EmptyStar(1)','RolePrefab/EmptySrarPanel/EmptyStar (1)',2},{'EmptyStar(2)','RolePrefab/EmptySrarPanel/EmptyStar (2)',2},{'EmptyStar(3)','RolePrefab/EmptySrarPanel/EmptyStar (3)',2},{'EmptyStar(4)','RolePrefab/EmptySrarPanel/EmptyStar (4)',2},{'EmptyStar(5)','RolePrefab/EmptySrarPanel/EmptyStar (5)',2},{'JxStarPanel','RolePrefab/JxStarPanel',2},{'JxStarPrefab','RolePrefab/JxStarPanel/JxStarPrefab',2},{'JxStarPrefab(1)','RolePrefab/JxStarPanel/JxStarPrefab (1)',2},{'JxStarPrefab(2)','RolePrefab/JxStarPanel/JxStarPrefab (2)',2},{'JxStarPrefab(3)','RolePrefab/JxStarPanel/JxStarPrefab (3)',2},{'JxStarPrefab(4)','RolePrefab/JxStarPanel/JxStarPrefab (4)',2},{'JxStarPrefab(5)','RolePrefab/JxStarPanel/JxStarPrefab (5)',2},{'StarPanel','RolePrefab/StarPanel',2},{'StaPrefab','RolePrefab/StarPanel/StaPrefab',2},{'StaPrefab(1)','RolePrefab/StarPanel/StaPrefab (1)',2},{'StaPrefab(2)','RolePrefab/StarPanel/StaPrefab (2)',2},{'StaPrefab(3)','RolePrefab/StarPanel/StaPrefab (3)',2},{'StaPrefab(4)','RolePrefab/StarPanel/StaPrefab (4)',2},{'StaPrefab(5)','RolePrefab/StarPanel/StaPrefab (5)',2},{'Img_Juesemingdi','Img_Juesemingdi',2},{'Btn_Chakan','Img_Juesemingdi/Btn_Chakan',2},{'Btn_Xuanze','Btn_Xuanze',2},{'Img_Zixuanquan','Text_Xiaohao/Img_Zixuanquan',2},{'Img_Yiyongyoudi','Img_Yiyongyoudi',2},{'Img_Suipian','Img_Yiyongyoudi/Img_Suipian',2},
        -- Text 列表
        {'Text_Grade','RolePrefab/Text_Grade',3},{'Text_Rank','RolePrefab/Img_Rankdi/Text_Rank',3},{'Text_Jueseming','Img_Juesemingdi/Text_Jueseming',3},{'Text_Xuanze','Btn_Xuanze/Text_Xuanze',3},{'Text_Xiaohao','Text_Xiaohao',3},{'Text_Shuliang1','Text_Xiaohao/Text_Shuliang1',3},{'Text_Yiyongyou','Img_Yiyongyoudi/Text_Yiyongyou',3},{'Text_Shuliang2','Img_Yiyongyoudi/Text_Shuliang2',3},{'Text_repeat','Text_repeat',3},
        -- UITemplate 列表
        {'OptionalItem01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---点击选择
    UIEvent.LuaClick(self.Btn_Xuanze().gameObject,function()
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_knapsack_exchange"),self.hero.name),function()
            self:Exchange()
        end,nil,2 },true)
    end)
end

function M:OnUpdateUI(args)
    self.PData = args[1]
    self.parent = args[2]
    ---@type ItemData
    self.ItemData = args[3]

    ---刷新角色头像
    local obj = self.RolePrefab().gameObject
    local RoleIcon = obj.transform:Find("RoleIcon"):GetComponent("Image")
    local Text_Grade = obj.transform:Find("Text_Grade"):GetComponent("TextMeshProUGUI")
    local Img_Kuang = obj.transform:Find("Img_Kuang"):GetComponent("Image")
    local zhiyeicon = obj.transform:Find("zhiyeicon"):GetComponent("Image")
    --local Text_Rank = obj.transform:Find("Img_Rankdi/Text_Rank"):GetComponent("TextMeshProUGUI")
    local StarPanel = obj.transform:Find("StarPanel").gameObject
    local JxStarPanel = obj.transform:Find("JxStarPanel").gameObject
    local str = string.split(self.PData,"_")
    ---@type RoleData
    local heroData = RoleData.New(tonumber(str[2]))
    MgrRes.LoadQIcon(RoleIcon,heroData.id)
    MgrRes.LoadSprite(Img_Kuang,heroData.iconBattleFrame)
    MgrRes.LoadSprite(zhiyeicon,heroData.iconCareer)
    --Text_Grade.text = heroData.level
    --Text_Rank.text ="+"..(heroData.skillLevel + 1)
    self.Text_Jueseming().text = heroData.name
    for i = 1, heroData.star do
        if heroData.awaken then
            JxStarPanel.transform:GetChild(i-1).gameObject:SetActive(true)
        else
            StarPanel.transform:GetChild(i-1).gameObject:SetActive(true)
        end
    end
    self.Img_Yiyongyoudi().gameObject:SetActive(self:CheckHave(heroData.id))
    MgrRes.LoadSprite(self.Img_Zixuanquan(),self.ItemData.icon)
    local roleStr = string.split(RoleattributeLocalData.tab[heroData.id][53],"_")
    local repeatGoods = ItemControl.GetItemByIdAndType(tonumber(roleStr[2]),tonumber(roleStr[1]))   --重复角色获取道具数据
    MgrRes.LoadSprite(self.Img_Suipian(),repeatGoods.icon)    --重复角色获取道具图片
    self.Text_Shuliang2().text = tonumber(roleStr[3])    --重复角色获取道具数量
    self.hero = heroData
    self.Img_Touxiangdi().gameObject:SetActive(true)
    self.zhiyeicon().gameObject:SetActive(true)
    self.Text_repeat().gameObject:SetActive(false)
end

---检查是否拥有
function M:CheckHave(id)
    local role = HeroControl.GetRoleDataByID(id)
    return role.lockState
end

---兑换
function M:Exchange()
    local str = string.split(self.PData,"_")
    local target = {
        goodsType = tonumber(str[1]),
        goodsID = tonumber(str[2]),
        goodsNum = tonumber(str[3]),
    }
    local goods = {
        goodsType = self.ItemData.goods.goodsType,
        goodsID = self.ItemData.goods.goodsID,
        goodsNum = 1,
    }
    ItemControl.UseSelectGoods(goods, target, function(err, msgId)
        if not err then
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("mgrnet_tips1"), err), 1 }, true)
            ---网络异常处理（待处理）
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseACK', buffer))
        if tab.errNo ~= 0 then
            Log.Error(string.format("使用物品失败，error = %s", tab.errNo))
            MgrUI.Pop(UID.PopTip_UI, { string.format(MgrLanguageData.GetLanguageByKey("ItemControl_network_anomaly"), tab.errNo), 1 }, true)
            ---网络异常处理（待处理）
        end
    end, function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientUseGoodsChooseNTF', buffer))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
        ---消耗道具
        ItemControl.PushSingleItemData(tab.cost,ItemControl.PushEnum.consume)
        ---更新角色
        local heroList = {}
        if tab.heros ~= nil then
            for _, h in pairs(tab.heros) do
                if h.hero ~= nil then
                    heroList[#heroList + 1] = h.hero
                end
                if h.goods ~= nil then
                    ---更新道具
                    ItemControl.PushGroupItemData(h.goods, ItemControl.PushEnum.add)
                end
            end
        end
        if #heroList > 0 then
            MgrUI.CloseAllPop()
            MgrUI.Pop(UID.DrawResultPop_UI, { heroList }, true)
        end
        for k,v in pairs(heroList) do
            local hd = HeroControl.GetRoleDataByID(v.heroID)
            if hd.lockState == false then
                HeroControl.PushSingleHeroData(v)
            end
        end
        if self.parent.CallBack ~= nil then
            self.parent.CallBack()
        end
    end)
end


return M