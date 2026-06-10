---外传活动主界面
EventXingbianView = {}
local V_CostItem = nil
local V_FortifyPanel = nil
local V_Text_Yishengji = nil
local V_Shengji1 = nil
local V_Text_SkillTitle = nil
local V_Text_Jiacheng = nil
local V_Text_Shuoming = nil
local V_CostItemPanel = nil
local V_Img_SoundTextBG = nil
local V_LeftPanel = nil
local V_RoleVoiceWordText = nil

local CurActID = nil
local Event4Data = nil
local UpSkillLv = nil
local SkillData = nil
local SkillBtn = {}
local CostList = {}
local isCanUp = true
local CurSkillData = nil
local groupId = nil

function EventXingbianView.Init(CostItem, FortifyPanel, Text_Yishengji, Shengji1, Text_SkillTitle, Text_Jiacheng, Text_Shuoming, CostItemPanel, Img_SoundTextBG, LeftPanel, RoleVoiceWordText)
    V_CostItem = CostItem
    V_FortifyPanel = FortifyPanel
    V_Text_Yishengji = Text_Yishengji
    V_Shengji1 = Shengji1
    V_Text_SkillTitle = Text_SkillTitle
    V_Text_Jiacheng = Text_Jiacheng
    V_Text_Shuoming = Text_Shuoming
    V_CostItemPanel = CostItemPanel
    V_Img_SoundTextBG = Img_SoundTextBG
    V_LeftPanel = LeftPanel
    V_RoleVoiceWordText = RoleVoiceWordText

    CurActID = Event4Control.GetCurActID()
    Event4Data = Event4Control.GetEvent4Data()[CurActID]
    UpSkillLv = Event4Control.GetActSkillLv()+1
    SkillData = Event4Control.GetSkillData()
    isCanUp = true

    --创建spine
    EventXingbianView:CreatSpine()
end

function EventXingbianView:SetSkillBtn(_btnObj,_skilllv)
    local name = CJNUIMgr.GetSunUseName(_btnObj, "Text_ShengjiName"):GetComponent("TextMeshProUGUI")
    local canUpgrade = CJNUIMgr.GetSunUseName(_btnObj, "Keshengji")

    local tSkillData = SkillData[_skilllv]

    if _skilllv < UpSkillLv then
        V_FortifyPanel.gameObject:SetActive(false)
        V_Text_Yishengji.gameObject:SetActive(true)

        canUpgrade.gameObject:SetActive(false)
        if _skilllv == #SkillData then
            ---更新技能详情
            EventXingbianView:UpSkillDetail(tSkillData)
        end
    elseif _skilllv == UpSkillLv then
        V_FortifyPanel.gameObject:SetActive(true)
        V_Text_Yishengji.gameObject:SetActive(false)

        CurSkillData = tSkillData
        ---更新技能详情
        EventXingbianView:UpSkillDetail(tSkillData)

        canUpgrade.gameObject:SetActive(isCanUp)
    else
        canUpgrade.gameObject:SetActive(false)
        name.text = "???"
        return
    end

    name.text = tSkillData.name

    UIEvent.LuaClick(_btnObj,function()
        if CurSkillData == tSkillData then
            return
        end
        CurSkillData = tSkillData
        ---更新技能详情
        EventXingbianView:UpSkillDetail(CurSkillData)
    end,nil,V_Shengji1)
end

---更新技能详情
function EventXingbianView:UpSkillDetail(_skillData)
    ---技能名
    V_Text_SkillTitle.text = _skillData.name
    ---技能标签
    V_Text_Jiacheng.text = _skillData.skillTab
    ---技能描述
    V_Text_Shuoming.text = _skillData.skillTip

    ---获取消耗
    EventXingbianView:GetCost(_skillData.consume)
    ---更新消耗道具
    EventXingbianView:UpdataCostPanel()

    if _skillData.level < UpSkillLv then
        V_FortifyPanel.gameObject:SetActive(false)
        V_Text_Yishengji.gameObject:SetActive(true)
    elseif _skillData.level == UpSkillLv then
        V_FortifyPanel.gameObject:SetActive(true)
        V_Text_Yishengji.gameObject:SetActive(false)
    end
end

---更新消耗道具
function EventXingbianView:UpdataCostPanel()
    isCanUp = true
    Tools.ClearAllChild(V_CostItemPanel.gameObject)
    for i, v in ipairs(CostList) do
        local obj = GameObject.Instantiate(V_CostItem.gameObject, V_CostItemPanel.transform)
        v.itemObj = obj
        obj:SetActive(true)
        local costItemData = ItemControl.GetItemByIdAndType(v.itemId, v.itemType)
        ---更新道具数据
        EventXingbianView:UpdataItem(obj, costItemData)

        UIEvent.LuaClick(obj, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, { costItemData, false, function()
            end }, true)
        end))
        ---道具消耗
        local CostCount = v.itemObj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        CostCount.text = Global.GetCompareText(costItemData.count,v.costNum)
        if v.haveNum < v.costNum then
            isCanUp = false
        end
    end
end
---更新道具数据
function EventXingbianView:UpdataItem(obj, pData)
    local tStarPanel = obj.transform:Find("StarPanel").gameObject
    local tStartPrefab = obj.transform:Find("StarPanel/ItemStarPrefab").gameObject
    local tItemStarRoot = obj.transform:Find("StarPanel/ItemStarRoot").gameObject
    local tRewardRankImg = obj.transform:Find("RewardRankImg"):GetComponent("Image")
    local tItemCountText = obj.transform:Find("Img_ItemCountBg/ItemCountText"):GetComponent("TextMeshProUGUI")
    local tRewardIconImg = obj.transform:Find("RewardIconImg"):GetComponent("Image")
    ---为0不显示星级
    if pData.star then
        tStarPanel:SetActive(pData.star > 0)
        ---大于0更新星级显示
        if pData.star > 0 then
            for i = 1, pData.star do
                local star = GameObject.Instantiate(tStartPrefab, tItemStarRoot.transform)
                star:SetActive(true)
            end
        end
    else
        tStarPanel:SetActive(false)
    end
    ---设置品质
    MgrRes.LoadSprite(tRewardRankImg, "Item/Rank/ItemRank_" .. pData.quality)
    ---设置图标
    MgrRes.LoadSprite(tRewardIconImg, pData.icon)
    ---设置数量
    if pData.count then
        tItemCountText.text = JNStrTool.numberAbbr(pData.count)
    else
        tItemCountText.text = "0"
    end
end

---获取消耗
function EventXingbianView:GetCost(_costItem)
    CostList = {}
    for i, v in ipairs(_costItem) do
        local tCostItem = {
            itemType = v.goodsType,
            itemId = v.goodsID,
            costNum = v.costNum,
            haveNum = 0,
            itemObj = nil
        }
        table.insert(CostList, tCostItem)
        local tItem = ItemControl.GetItemByIdAndType(CostList[i].itemId, CostList[i].itemType)
        CostList[i].haveNum = tItem.count
    end
end
---創建spine
function EventXingbianView:CreatSpine()
    local spineID = Event4Data.npc[EventRaidControl.NpcType.Expansion]
    if spineID == nil then
        return
    end
    groupId = spineID
    MgrSound.AddCue("Audio/role/"..groupId..".acb")

    EventXingbianView:GetCurWords(97)
end

---获取当前台词
function EventXingbianView:GetCurWords(type)
    local _ActorLinesType = groupId  --当前台词组别
    local _tempActorLineIdTab = {}  --临时表存储对应的文本台词ID和对应权重
    local _CurTotalSumWeight = 0 --当前总权重值
    for key, value in pairs(ActorLinesLocalData.tab) do
        ---匹配到对应的角色台词组别
        if value[2] == _ActorLinesType and value[3] == type then
            if value[5] == "0" then
                _CurTotalSumWeight = _CurTotalSumWeight + 10
                table.insert(_tempActorLineIdTab,{value[1],_CurTotalSumWeight})
            else
                ---切割对应的触发条件得到条件表
                local _TempVarTab = JNStrTool.strSplit("_", value[5])
                local _ReturnVar = TableToObject.GetTargetWeight(_TempVarTab, 0)
                if _ReturnVar ~= false then
                    _CurTotalSumWeight = _CurTotalSumWeight + (tonumber(_ReturnVar) * 1000)
                    table.insert(_tempActorLineIdTab, { value[1], _CurTotalSumWeight })
                end
            end
        end
    end
    local _FinalVoiceLineId = PosterGirlViewModel.GetRandIndexByHashTab(_CurTotalSumWeight, _tempActorLineIdTab)
    EventXingbianView:PlayTargetRoleAniVoice(_FinalVoiceLineId)
end

---根据对应的ID播放对应的角色动画以及语音等 改为等待当前动画播放完毕自动播放
function EventXingbianView:PlayTargetRoleAniVoice(_ActorLineId)
    if _ActorLineId == nil then
        return
    end
    local _AudioName = ActorLinesLocalData.tab[_ActorLineId][13]
    local _ActorLineWord = ActorLinesLocalData.tab[_ActorLineId][7]

    ---设置文本框文本
    V_RoleVoiceWordText.text = _ActorLineWord
    V_Img_SoundTextBG.gameObject:SetActive(true)

    MgrSound.PlayRole(_AudioName, nil, nil, false, 0, 0,nil)
    EventXingbianView:ListenVoice()
end

--- 监听语音是否结束
function EventXingbianView:ListenVoice()
    MgrTimer.AddRepeat("Event4SkillRoleVoice",0.2,function()
        if MgrSound.CheckRoleStatus(nil) then
            V_Img_SoundTextBG.gameObject:SetActive(false)
            MgrTimer.Cancel("Event4SkillRoleVoice")
        end
    end,-1,nil)
end

function EventXingbianView:SkillUp()
    if not isCanUp then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("ark_ui_tips3"), 1 }, true)
        return
    end
    Event4Control.SkillUp(CurSkillData.activityid,CurSkillData.id,function()
        UpSkillLv = Event4Control.GetActSkillLv()+1
        EventXingbianView:SetSkillBtn(SkillBtn[UpSkillLv-1], UpSkillLv-1)
        if UpSkillLv <= #SkillData then
            EventXingbianView:SetSkillBtn(SkillBtn[UpSkillLv], UpSkillLv)
        end
        ---语音
        EventXingbianView:GetCurWords(98)
    end)
end

function EventXingbianView:InitBtn()
    ---各等级按钮
    for i, v in ipairs(SkillData) do
        SkillBtn[i] = CJNUIMgr.GetSunUseName(V_LeftPanel.gameObject, "Shengji"..i).gameObject
        if SkillBtn[i] == nil then
            break
        end
        EventXingbianView:SetSkillBtn(SkillBtn[i], i)
    end
end

return EventXingbianView