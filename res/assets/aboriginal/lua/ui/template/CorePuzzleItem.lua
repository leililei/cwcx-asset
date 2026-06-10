-- Code Auto Create Begin
local M = Class('CorePuzzleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CorePuzzleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'CorePuzzleItem','/',2},{'Img_Hexindi(xuanzhong)','Img_Hexindi(xuanzhong)',2},{'Img_Yuanjiaojuxindi','Img_Yuanjiaojuxindi',2},{'RewardRankImg','Item/wupin/RewardRankImg',2},{'RewardIconImg','Item/wupin/RewardIconImg',2},{'StarPanel','Item/wupin/StarPanel',2},{'ItemStarRoot','Item/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','Item/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','Item/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'TimeCountDownPanel','Item/wupin/TimeCountDownPanel',2},{'shijian2','Item/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon','RedDotIcon',2},
        -- UITemplate 列表
        {'CorePuzzleItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Name','Text_Name',20},{'ItemCountText','Img_Yuanjiaojuxindi/ItemCountText',20},{'CountDownText','Item/wupin/TimeCountDownPanel/CountDownText',20},
    }
end
-- Code Auto Create End
---核心碎片初始化
function M:OnInit()
    ---初始化最大星级
    self.starHLObj = {}
    for i = 1, 6 do
        local obj = GameObject.Instantiate(self.ItemStarPrefab().gameObject,self.ItemStarRoot().gameObject.transform,false)
        self.starHLObj[i] = obj.transform:Find("HighLight").gameObject
    end
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot,Handle(self,self.OnItemClick))
end

--刷新红点显示
function M:UpdateItemRedDot()
    local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",self.pData.id))
    if isNew == nil or isNew == ""  then
        self.RedDotIcon().gameObject:SetActive(true)
    else
        self.RedDotIcon().gameObject:SetActive(false)
    end
end

function M:OnUpdateUI(pData)
    ---@type CoreChipData
    self.pData = pData[1]
    self.parent = pData[2]
    ---为0不显示星级
    self.StarPanel().gameObject:SetActive(self.pData.star > 0)
    ---大于0更新星级显示
    if self.pData.star > 0 then
        for i = 1,#self.starHLObj do
            self.starHLObj[i]:SetActive(i <= self.pData.star)
        end
    end
    --旧的红点规则 LTODO
    -- local item = ItemControl.GetItemByIdAndType(self.pData.id,2)
    -- if self.pData.consumeCount <= item.count then
    --     self.RedDotIcon().gameObject:SetActive(true)
    -- else
    --     self.RedDotIcon().gameObject:SetActive(false)
    -- end
    self:UpdateItemRedDot()
    ---设置名称
    self.Text_Name().text = self.pData.name
    ---设置品质
    MgrRes.LoadSprite(self.RewardRankImg(),self.pData.iconFrame)
    ---设置图标
    MgrRes.LoadSprite(self.RewardIconImg(),self.pData.icon)
    ---设置数量
    local count = JNStrTool.numberAbbr(self.pData.count) --self.pData.count >= 10000 and math.floor(tonumber(self.pData.count)/1000).."K" or self.pData.count
    if self.pData.count < self.pData.consumeCount then
        self.ItemCountText().text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),count,self.pData.consumeCount)
    else
        count = string.format("<color=#FFCB62>%s</color>",count)
        self.ItemCountText().text = string.format("%s/%s",count,self.pData.consumeCount)
    end

    if self.parent.CurCorePuzzleIdx == tonumber(self.ObjRoot.name) then
        self.parent.GearPuzzleSelect:SetParent(self.ObjRoot.transform,false)
        self.parent.GearPuzzleSelect.localPosition = Vector3.zero
    end
end
function M:OnItemClick()
    ---刷新已选信息设置已选特效
    self.parent.CurCorePuzzleIdx = tonumber(self.ObjRoot.name)
    self.parent:CheckPuzzleInfo()
    self.parent.GearPuzzleSelect:SetParent(self.ObjRoot.transform,false)
    self.parent.GearPuzzleSelect.localPosition = Vector3.zero
    for i = 1, 4 do
        self.parent.selectVfxArr[i]:SetActive(i == self.pData.quality)
    end
    if NoviceViewModel.CurTaskId == 20706 then
        NoviceViewModel.DoNext()
    end

    --取消红点
    UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",self.pData.id),self.pData.id)
    self:UpdateItemRedDot()

    local state = false
    for i, v in pairs(ItemControl.GetCoreChips()) do --TODO
        local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "CorePuzzle%s",v.id))
        if isNew == nil or isNew == "" and v.count ~= 0 then
            state = true
            break
        end
    end
    RedDotControl.GetDotData("CorePz"):SetState(state)

    if RedDotControl.GetDotData("CorePz").State then
        self.parent.PZNRedDotIcon().gameObject:SetActive(true)
        self.parent.PZHRedDotIcon().gameObject:SetActive(true)
    else
        self.parent.PZNRedDotIcon().gameObject:SetActive(false)
        self.parent.PZHRedDotIcon().gameObject:SetActive(false)
    end
end
return M