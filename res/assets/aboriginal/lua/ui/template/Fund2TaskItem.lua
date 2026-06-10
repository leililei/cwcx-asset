-- Code Auto Create Begin
local M = Class('Fund2TaskItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Fund2TaskItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_TaskClick','Img_TaskClick',2},{'Img_CanReceivebg','Img_CanReceivebg',2},{'AwardItem','AwardItem',2},{'RewardRankImg','AwardItem/wupin/RewardRankImg',2},{'RewardIconImg','AwardItem/wupin/RewardIconImg',2},{'StarPanel','AwardItem/wupin/StarPanel',2},{'ItemStarRoot','AwardItem/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','AwardItem/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','AwardItem/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','AwardItem/wupin/Img_ItemCountBg',2},{'RewardItemContent','RewardItemContent',2},{'Completed','Completed',2},
        -- UITemplate 列表
        {'Fund2TaskItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_TaskTitle','Text_TaskTitle',20},{'Text_TaskConditions','Text_TaskConditions',20},{'ItemCountText','AwardItem/wupin/Img_ItemCountBg/ItemCountText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitBtn()
end

function M:OnUpdateUI(pData)
    self.pData = pData[1]
    self.parent = pData[2]
    self.awardStr = string.split(self.pData.award,",")
    self:ReloadAward()
end

function M:InitBtn()
    --点击领取奖励
    UIEvent.LuaClick(self.Img_TaskClick().gameObject,function()
        if self.parent.pData == nil then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("choosesupportrole_ui_tips3"),1},true)
            return
        end
        if (self.parent.pData.recharge + 100) / 10000 < self.pData.money / 10000 then
            return
        end
        ActivityControl.RewardSendReq(self.parent.id,self.pData.id,0,function()
            self.parent:ReloadMission(0)
            Event.Go("ActivityDot")
        end)
    end)
end

---刷新奖励
function M:ReloadAward()
    self.Text_TaskTitle().text = MgrLanguageData.GetLanguageByKey("ui_qita_text144")
    self.Text_TaskConditions().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text145"),self.pData.money / 10000)

    Tools.ClearAllChild(self.RewardItemContent().gameObject)
    self.AwardItem().gameObject:SetActive(false)  --隐藏模板
    for i = 1,#self.awardStr do
        local obj = GameObject.Instantiate(self.AwardItem().gameObject,self.RewardItemContent().gameObject.transform,false)
        obj:SetActive(true)
        ---@type ItemData
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(self.awardStr[i],"_")[2]),tonumber(string.split(self.awardStr[i],"_")[1]))
        local icon = CJNUIMgr.GetSunUseName(obj, "RewardIconImg").transform:GetComponent("Image")
        local frame = CJNUIMgr.GetSunUseName(obj,"RewardRankImg").transform:GetComponent("Image")
        local countTxt = CJNUIMgr.GetSunUseName(obj,"ItemCountText").transform:GetComponent("TextMeshProUGUI")
        local starRoot = CJNUIMgr.GetSunUseName(obj,"ItemStarRoot")
        local starPrefab = CJNUIMgr.GetSunUseName(obj,"ItemStarPrefab")
        --是否显示星级
        if item.goodsType == 2 then
            starRoot.transform.parent.gameObject:SetActive(false)  --显示星级
            --清除子物体
            Tools.ClearAllChild(starRoot)
            starPrefab:SetActive(false)  --隐藏模板
            for j = 1,6 do
                local star = GameObject.Instantiate(starPrefab,starRoot.transform,false)   --生成星星
                star:SetActive(true)
                if j <= item.star then
                    --索引小于当前物品星级则显示
                    star.transform:Find("HighLight").gameObject:SetActive(true)
                else
                    --索引大于于当前物品星级则隐藏
                    star.transform:Find("HighLight").gameObject:SetActive(false)
                end
            end
        else
            starRoot.transform.parent.gameObject:SetActive(false)  --隐藏星级
        end
        --奖励物品图片
        MgrRes.LoadSprite(icon,item.icon)
        --奖励物品框
        MgrRes.LoadSprite(frame,item.iconFrame)
        --数量文本
        countTxt.text = tonumber(string.split(self.awardStr[i],"_")[3])
        --点击弹出物品详情
        UIEvent.LuaClick(obj,function()
            MgrUI.Pop(UID.ItemDetailPop_UI,{item,false},true)
        end)
    end

    --是否可领取
    if self.pData.isComplete == 1 then
        --已完成
        self.Img_CanReceivebg().gameObject:SetActive(false)
        self.Completed().gameObject:SetActive(true)
    else
        --未完成
        if (self.parent.pData.recharge + 100) / 10000 >= self.pData.money / 10000  then
            --可领取
            self.Img_CanReceivebg().gameObject:SetActive(true)
            self.Completed().gameObject:SetActive(false)
        else
            self.Img_CanReceivebg().gameObject:SetActive(false)
            self.Completed().gameObject:SetActive(false)
        end
    end
end

return M