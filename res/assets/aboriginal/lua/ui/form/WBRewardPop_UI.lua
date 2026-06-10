-- Code Auto Create Begin
local M = Class('WBRewardPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.WBRewardPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[WBRewardPop_UI].prefab'
    self.Name = 'Form[WBRewardPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Xian2','Img_Xian2',2},{'Img_Xian1','Img_Xian1',2},{'Img_Tanchuangdi2','Img_Tanchuangdi2',2},{'Img_Toumingdi2','Img_Tanchuangdi2/Img_Toumingdi2',2},{'Img_Lingxing1','Img_Tanchuangdi2/leixing/Img_Lingxing1',2},{'Img_Lingxing2','Img_Tanchuangdi2/leixing/Img_Lingxing2',2},{'RewardContent','Img_Tanchuangdi2/RewardScroll/RewardContent',2},{'Img_Xian3','Img_Tanchuangdi2/Img_Xian3',2},{'Btn_Return','Img_Tanchuangdi2/Btn_Return',2},
        -- Text 列表
        {'Text_Paiming','Img_Tanchuangdi2/leixing/Text_Paiming',3},{'Text_Leijijifen','Img_Tanchuangdi2/leixing/Text_Leijijifen',3},{'Text_Biaoti2','Img_Tanchuangdi2/Text_Biaoti2',3},{'Text_Fanhui','Img_Tanchuangdi2/Btn_Return/Text_Fanhui',3},
        -- UITemplate 列表
        {'WBRewardItem2','Img_Tanchuangdi2/RewardScroll/WBRewardItem2',10},
        -- RawImage 列表
        {'RewardScroll','Img_Tanchuangdi2/RewardScroll',15},
        -- LoopScrollRect 列表
        {'RewardScroll01','Img_Tanchuangdi2/RewardScroll',18},
    }
end
-- Code Auto Create End
require("LocalData/JcrankrewardLocalData")
function M:OnInit()
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))

    --self.SpecialObj =
    --{
    --    [1] = self.Item1(),
    --    [2] = self.Item2(),
    --    [3] = self.Item3()
    --}
    ---退出
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    --UIEvent.LuaClick(self.Btn_Return().gameObject,Handle(self, function ()
    --    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    --    MgrUI.ClosePop(self.Uid)
    --end))

    self.RewardScroll01():SetLuaCellEvent(Handle(self,self.CellItem))
    ---记录切换
    --local togObj =
    --{
    --    [1] = self.Btn_Weekly(),
    --    [2] = self.Btn_Fight()
    --}
    --for i, v in pairs(togObj) do
    --    local Btn_Selected = v.transform:Find("Btn_Select").gameObject
    --    Tools.ToggleValueChange(v,function(isOn)
    --        Btn_Selected:SetActive(isOn)
    --        if isOn then
    --            if i == 1 then
    --                self.RewardScroll().gameObject:SetActive(true)
    --                self.SpecialReward().gameObject:SetActive(false)
    --            elseif i == 2 then
    --                self.RewardScroll().gameObject:SetActive(false)
    --                self.SpecialReward().gameObject:SetActive(true)
    --            end
    --        end
    --    end,nil)
    --end
    --self.Btn_Weekly().isOn = false
    --self.Btn_Weekly().isOn = true
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

---更新显示
function M:OnShow(args)
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    self.BossData = args[1]
    ---特殊奖励
    self.SpecialRewardList =
    {
        [1] = self.BossData.cRewards,
        [2] = self.BossData.kRewards,
        [3] = self.BossData.lRewards
    }
    self.CurLoopList = JcrankrewardLocalData.tab
    self:ResetItem()
    --for i, v in ipairs(self.SpecialObj) do
    --    self:UpdateSpecial(v,self.SpecialRewardList[i])
    --end
end

function M:UpdateSpecial(obj,goodStr)
    local data = string.split(goodStr,",")
    --------第一个奖励
    ---创建奖励
    local RewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local RewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
    local ItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText/ItemRemainText1"):GetComponent("TextMeshProUGUI")
    local ItemStarPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local ItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local StarPanel = obj.transform:Find("StarPanel").gameObject
    local goods = JNStrTool.strSplit("_",data[1])
    local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
    ---设置图标
    MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
    ---设置数量
    ItemCountText.text = JNStrTool.numberAbbr(tonumber(goods[3])) --tonumber(goods[3]) >= 10000 and math.floor(tonumber(goods[3])/1000).."K" or goods[3]

    if itemData.itemstar > 0 then
        StarPanel:SetActive(true)
        ---设置星级
        self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
    else
        StarPanel:SetActive(false)
    end
    ItemStarPrefab:SetActive(false)
    ---物品详细弹窗
    UIEvent.LuaClick(RewardIconImg.gameObject, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(tonumber(goods[2]),tonumber(goods[1]))
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
    -----第二个奖励
    ---创建奖励
    local RewardRankImg = obj.transform:Find("RewardRankImg2"):GetComponent("Image")
    local RewardIconImg = obj.transform:Find("RewardIconImg2"):GetComponent("Image")
    local ItemCountText = obj.transform:Find("Img_ItemCountBg2/ItemCountText/ItemRemainText1"):GetComponent("TextMeshProUGUI")
    local ItemStarPrefab = obj.transform:Find("StarPanel2/ItemStarPrefab").gameObject
    local ItemStarRoot = obj.transform:Find("StarPanel2/ItemStarRoot").gameObject
    local StarPanel = obj.transform:Find("StarPanel2").gameObject
    local goods = JNStrTool.strSplit("_",data[2])
    local itemData = ItemControl.GetItemByType(tonumber(goods[1]),tonumber(goods[2]))
    ---设置品质
    MgrRes.LoadSprite(RewardRankImg,"Item/Rank/ItemRank_"..itemData.quality)
    ---设置图标
    MgrRes.LoadSprite(RewardIconImg,"Item/"..itemData.icon)
    ---设置数量
    ItemCountText.text = JNStrTool.numberAbbr(tonumber(goods[3])) --tonumber(goods[3]) >= 10000 and math.floor(tonumber(goods[3])/1000).."K" or goods[3]

    if itemData.itemstar > 0 then
        StarPanel:SetActive(true)
        ---设置星级
        self:InitStarPanel(itemData.itemstar,ItemStarRoot,ItemStarPrefab)
    else
        StarPanel:SetActive(false)
    end
    ItemStarPrefab:SetActive(false)
    ---物品详细弹窗
    UIEvent.LuaClick(RewardIconImg.gameObject, Handle(self, function()
        local item = ItemControl.GetItemByIdAndType(tonumber(goods[2]),tonumber(goods[1]))
        MgrUI.Pop(UID.ItemDetailPop_UI,{item,false,function() end},true)
    end))
end

---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self.BossData,self})
end
---设置滑动数据
function M:ResetItem(offset)
    ---设置总数
    self.RewardScroll01().totalCount = #self.CurLoopList
    if offset then
        self.RewardScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.RewardScroll01():RefreshCells()               ---只刷新数据
    end
end

function M:ClosePop()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrUI.ClosePop(self.Uid)
end

---创建一个物体
function M:CreatGo(_Prefab,_Root)
    -- statements
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=self:CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    if _StarLV ==nil or _StarLV <= 0 then
        return
    end
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        -- statements
        self:CreatStar(_Root,_Prefab)
    end
end
return M