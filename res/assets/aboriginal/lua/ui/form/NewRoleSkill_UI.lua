-- Code Auto Create Begin
local M = Class('NewRoleSkill_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NewRoleSkill_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NewRoleSkill_UI].prefab'
    self.Name = 'Form[NewRoleSkill_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_xian','Img_xian',2},{'UpperBtnPanel','UpperBtnPanel',2},{'Img_Fenggexian','UpperBtnPanel/Img_Fenggexian',2},{'ReturnBg','UpperBtnPanel/ReturnBg',2},{'Btn_GoMenu','UpperBtnPanel/ReturnBg/Btn_GoMenu',2},{'Btn_Back','UpperBtnPanel/ReturnBg/Btn_Back',2},{'RoleSkillUpPanel','RoleSkillUpPanel',2},{'RoleRankBG','RoleSkillUpPanel/RoleRankPanel/RoleRankBG',2},{'Img_Jinengfanwei','RoleSkillUpPanel/RoleRankPanel/Img_Jinengfanwei',2},{'Img_Fanwei','RoleSkillUpPanel/RoleRankPanel/Img_Jinengfanwei/Img_Fanwei',2},{'Img_Mubiaofanwei','RoleSkillUpPanel/RoleRankPanel/Img_Mubiaofanwei',2},{'Img_Mubiao','RoleSkillUpPanel/RoleRankPanel/Img_Mubiaofanwei/Img_Mubiao',2},{'CostItem','RoleSkillUpPanel/CostItem',2},{'RewardRankImg','RoleSkillUpPanel/CostItem/RewardRankImg',2},{'RewardIconImg','RoleSkillUpPanel/CostItem/RewardIconImg',2},{'StarPanel','RoleSkillUpPanel/CostItem/StarPanel',2},{'ItemStarPrefab','RoleSkillUpPanel/CostItem/StarPanel/ItemStarPrefab',2},{'HighLight','RoleSkillUpPanel/CostItem/StarPanel/ItemStarPrefab/HighLight',2},{'ItemStarRoot','RoleSkillUpPanel/CostItem/StarPanel/ItemStarRoot',2},{'Img_ItemCountBg','RoleSkillUpPanel/CostItem/Img_ItemCountBg',2},{'CostItemPanel','RoleSkillUpPanel/CostItemPanel',2},{'Img_Shiyongshuliangdi','RoleSkillUpPanel/UpDownPanel/Img_Shiyongshuliangdi',2},{'Btn_SkillLvDownLight','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvDownLight',2},{'-(hei)2','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvDownLight/-(hei)2',2},{'Btn_SkillLvDown','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvDown',2},{'-(hui)2','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvDown/-(hui)2',2},{'Btn_SkillLvUpLight','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvUpLight',2},{'+(hei)2','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvUpLight/+(hei)2',2},{'Btn_SkillLvUp','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvUp',2},{'+(hui)2','RoleSkillUpPanel/UpDownPanel/Btn_SkillLvUp/+(hui)2',2},{'SkillXiangqing','RoleSkillUpPanel/SkillXiangqing',2},{'SkillPrefab_xz','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz',2},{'SkillPrefab_xz01','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz',2},{'Img_Jinengdi_light','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Jinengdi_light',2},{'TagPanel','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/TagPanel',2},{'Img_Tag','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Tag',2},{'EX','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/EX',2},{'Img_Jinengdian_hui','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Jinengdian_hui',2},{'Img_Jinengdian1','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Jinengdian1',2},{'Img_Jinengdian2','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Jinengdian2',2},{'JinengdianPanel','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/JinengdianPanel',2},{'Img_SkillSuo','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_SkillSuo',2},{'Content','RoleSkillUpPanel/SkillXiangqing/SkillZhankaiScroll/Content',2},{'Btn_Quxiao','Btn_Quxiao',2},{'Btn_Queding','Btn_Queding',2},{'SuccessPanel','SuccessPanel',2},{'Btn_SuccessBack','SuccessPanel/Btn_SuccessBack',2},{'BG','SuccessPanel/BG',2},{'Zhuangshixian(shang)','SuccessPanel/BG/Zhuangshixian(shang)',2},{'zhuangshixian(yangcheng)','SuccessPanel/BG/zhuangshixian(yangcheng)',2},{'chenggongdi','SuccessPanel/chenggongdi',2},{'Img_Dian','SuccessPanel/FightResult/Img_Dian',2},{'Img_Heidi','SuccessPanel/FightResult/Img_Heidi',2},{'RoleSkillUpSuccessPanel','SuccessPanel/RoleSkillUpSuccessPanel',2},{'>','SuccessPanel/RoleSkillUpSuccessPanel/>',2},
        -- RawImage 列表
        {'SkillScroll','RoleSkillUpPanel/RoleSkillPanel/SkillScroll',15},{'SkillZhankaiScroll','RoleSkillUpPanel/SkillXiangqing/SkillZhankaiScroll',15},
        -- LoopScrollRect 列表
        {'SkillScroll01','RoleSkillUpPanel/RoleSkillPanel/SkillScroll',18},{'SkillZhankaiScroll01','RoleSkillUpPanel/SkillXiangqing/SkillZhankaiScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_TitleCn','UpperBtnPanel/Text_TitleCn',20},{'Text_TitleEn','UpperBtnPanel/Text_TitleEn',20},{'Text_SkillLv','RoleSkillUpPanel/RoleRankPanel/RoleRankBG/Text_SkillLv',20},{'Text_Rank','RoleSkillUpPanel/RoleRankPanel/Text_Rank',20},{'Text_SkillName','RoleSkillUpPanel/RoleRankPanel/Text_SkillName',20},{'Text_Jinengfanwei','RoleSkillUpPanel/RoleRankPanel/Img_Jinengfanwei/Text_Jinengfanwei',20},{'Text_Mubiaofanwei','RoleSkillUpPanel/RoleRankPanel/Img_Mubiaofanwei/Text_Mubiaofanwei',20},{'Text_Mubiaoshuoming','RoleSkillUpPanel/RoleRankPanel/Img_Mubiaofanwei/Text_Mubiaoshuoming',20},{'ItemCountText','RoleSkillUpPanel/CostItem/Img_ItemCountBg/ItemCountText',20},{'ItemCountText01','RoleSkillUpPanel/CostItem/ItemCountText',20},{'Text_Max','RoleSkillUpPanel/Text_Max',20},{'Text_SkillUseCount','RoleSkillUpPanel/UpDownPanel/Text_SkillUseCount',20},{'Text_Tag','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_Tag/Text_Tag',20},{'Text_Tag01','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/EX/Text_Tag',20},{'Text_Jinengming','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Text_Jinengming',20},{'Text_Jinengshuoming','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Text_Jinengshuoming',20},{'Text_Jiesuotiaojian','RoleSkillUpPanel/SkillXiangqing/SkillPrefab_xz/Img_SkillSuo/Text_Jiesuotiaojian',20},{'Text_Quxiao','Btn_Quxiao/Text_Quxiao',20},{'Text_Queding','Btn_Queding/Text_Queding',20},{'Text_FightResult','SuccessPanel/FightResult/Text_FightResult',20},{'TouchExit','SuccessPanel/Touch Exit',20},{'RankText','SuccessPanel/RoleSkillUpSuccessPanel/RankText',20},{'CurRankText','SuccessPanel/RoleSkillUpSuccessPanel/CurRankText',20},{'TarRankText','SuccessPanel/RoleSkillUpSuccessPanel/TarRankText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---当前选择角色
    ---@type RoleData
    self.CurHero = nil
    ---当前英雄属性(可变)
    self.CurHeroAttr = nil
    ---当前英雄属性(不变)
    self.UnChangedHeroAttr = nil
    ---去除装备的属性
    self.NoEquipHeroAttr = nil

    self.ChildSkillList = nil
    ---道具消耗
    ---{itemId,costNum,haveNum,itemObj}
    self.CostList = {}
    self.exclusiveCost = {}
    ---循环检测计数器
    self.Int_LoopTimer = 0
    ---技能详情
    self.SkillDetail = {}
    ---当前等级
    self.CurSkillLv = 1

    self.SkillXiangqing().gameObject:SetActive(false)
    self.SuccessPanel().gameObject:SetActive(false)
    self.CostItem().gameObject:SetActive(false)
    self.Text_Max().gameObject:SetActive(false)
    self.Img_Tag().gameObject:SetActive(false)
    self.Img_Jinengdian2().gameObject:SetActive(false)
    self.Img_Jinengdian1().gameObject:SetActive(false)
    self.Img_Jinengdian_hui().gameObject:SetActive(false)
    ---注册左侧子页签滑块
    self.SkillScroll01():SetLuaCellEvent(Handle(self, self.SkillCell))
    self.SkillZhankaiScroll01():SetLuaCellEvent(Handle(self, self.SkillDetails))
    
    self:InitButton()
    self:AddNoviceEvent()
end
function M:OnShow(pData)
    self.pData = pData[1]
    self.Parent = pData[2]
    ---获取人物界面当前角色的数据
    self.CurHero = self.Parent.CurHero
    ---去除装备的属性
    self.NoEquipHeroAttr = self.CurHero:GetHeroAttrNoAdditional()
    self.UnChangedHeroAttr = self.CurHero:GetHeroAttrNoAdditional()
    self.LocalNextLv = self.NoEquipHeroAttr.SkillLV + 1
    self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, self.LocalNextLv, self.CurHero.awaken)

    ---获取消耗
    self:GetCost(self.NoEquipHeroAttr.SkillLV, self.LocalNextLv)
    if #self.CostList > 0 then
        for i = 1, #self.CostList do
            local tItem = ItemControl.GetItemByID(self.CostList[i].itemId)
            self.CostList[i].haveNum = tItem.count
        end
    else
        self.Text_Max().gameObject:SetActive(true)
    end
    ---初始化技能列表
    self:InitSkillPanel()
    ---初始化技能等级、名称、布阵
    self:InitRankPanel()
    ---初始化消耗道具
    self:InitCostPanel()
    ---更新消耗道具
    self:UpdataCostPanel()
    ---更新攻击距离和范围
    self:UpdataRange()
end
function M:InitButton()
    
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("NewRole_BackClick")
        Event.Clear("NoviceSkillShowSelf")
        Event.Clear("NoviceSkillHideSelf")
        MgrUI.ClosePop(self.Uid)
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---取消
    UIEvent.LuaClick(self.Btn_Quxiao().gameObject, function()
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end)
    ---确定
    UIEvent.LuaClick(self.Btn_Queding().gameObject, function()
        self:OnClickUpgrade()
    end)
    ---点击成功界面响应
    UIEvent.LuaClick(self.Btn_SuccessBack().gameObject, function()
        self.UnChangedHeroAttr = RoleCardViewModel.CurrentHero:GetHeroAttrNoAdditional()
        if self.UnChangedHeroAttr.SkillLV >= self.UnChangedHeroAttr.SkillMaxLV then
            Event.Go("NewRole_BackClick")
            MgrUI.ClosePop(self.Uid)
            return
        end
        self.SuccessPanel().gameObject:SetActive(false)
    end)
    ---技能详情黑底遮罩
    UIEvent.LuaClick(self.SkillXiangqing().gameObject, Handle(self, function()
        self.SkillXiangqing().gameObject:SetActive(false)
    end))

    ---添加
    UIEvent.LuaPressClick(self.Btn_SkillLvUpLight().gameObject, Handle(self, function()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickSkill(true)
        self.Int_HasClick = 1
        self.Bool_IsAdd = true
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
    ---减少
    UIEvent.LuaPressClick(self.Btn_SkillLvDownLight().gameObject, Handle(self, function()
        if self.Int_HasClick == 1 then
            return
        end
        self:OnClickSkill(false)
        self.Int_HasClick = 1
        self.Bool_IsAdd = false
        self.IsEndLoopToInput = false
        self:LoopInput()
    end))
end


function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        Event.Go("NewRole_BackClick")
        MgrUI.ClosePop(self.Uid)
    end
end

---初始化技能等级、名称、布阵
function M:InitRankPanel()
    self.Text_SkillName().text = self.ChildSkillList[1].TotleName
    self.CurSkillLv = self.UnChangedHeroAttr.SkillLV + 1
    ---显示下一级的技能
    self.Text_SkillLv().text = self.CurSkillLv
    self.Text_SkillUseCount().text = self.CurSkillLv
end
---初始化技能列表
function M:InitSkillPanel()
    if self.ChildSkillList ~= nil then
        self.SkillScroll01():RefreshCells()
    else
        self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.CurHero.id)
        self.SkillScroll01().totalCount = #self.ChildSkillList
        self.SkillScroll01():RefillCells()
    end
end
function M:SkillCell(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.ChildSkillList[idx], self, self.CurHeroAttr, self.CurHero:CheckHeroEquipIsMax() })
end

function M:ShowSkillXiangqing(_skillDetail,_ObjPrefab,_XiangqingData)
    self.Img_SkillSuo().gameObject:SetActive(false)
    local tCurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, self.CurHero.skillLevel, self.CurHero.awaken)
    local tIsOpen = true
    local tMarkLv = _skillDetail.UnlockLv[1]
    for i, v in ipairs(_skillDetail.UnlockLv) do
        if self.CurHeroAttr.SkillLV >= v then
            tMarkLv = v
        else
            if i == 1 then
                tIsOpen = false
            end
            break
        end
    end
    local tSkillList = _skillDetail.SkillList[tMarkLv]
    if SkillLocalData.tab[tSkillList[1]][8] == 1 then
        if not self.CurHeroAttr.IsAwaken then
            self.Img_SkillSuo().gameObject:SetActive(true)
            self.Text_Jiesuotiaojian().text = MgrLanguageData.GetLanguageByKey("ui_yangcheng_text142")
        end
    elseif not tIsOpen then
        self.Img_SkillSuo().gameObject:SetActive(true)
        self.Text_Jiesuotiaojian().text = string.format(MgrLanguageData.GetLanguageByKey("newroleskill_ui_text1"),tMarkLv)
        tCurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, tMarkLv, self.CurHero.awaken)
    end
    
    self.SkillDetail = {}
    ---界面默认显示4个窗口，不足需要补齐
    local tSkillExample = {}
    if _skillDetail.SkillNum == 1 then
        tSkillExample = self.CurHeroAttr.Skill_1_example
    elseif _skillDetail.SkillNum == 2 then
        tSkillExample = self.CurHeroAttr.Skill_2_example
    elseif _skillDetail.SkillNum == 3 then
        tSkillExample = self.CurHeroAttr.Skill_3_example
    elseif _skillDetail.SkillNum == 4 then
        tSkillExample = self.CurHeroAttr.Skill_4_example
    elseif _skillDetail.SkillNum == 5 then
        tSkillExample = self.CurHeroAttr.Skill_5_example
    end
    self.SkillDetail = tSkillExample
      
    self.SkillZhankaiScroll01():RefillCells()
    self.SkillXiangqing().gameObject:SetActive(true)
    ---点亮选中技能栏
    self.SkillPrefab_xz().transform.position = _ObjPrefab.transform.position
    self.EX().gameObject:SetActive(_skillDetail.SkillNum == 5)
    self.JinengdianPanel().gameObject:SetActive(_skillDetail.SkillNum ~= 5)
    self.Text_Jinengming().text = _skillDetail.GroupName[tMarkLv]
    self.Text_Jinengshuoming().text = _skillDetail.Tips[tMarkLv]
    ---标签 
    local tagObj = self:InitPanel(#_XiangqingData.tagList, self.TagPanel().gameObject, self.Img_Tag())
    for i = 1, #_XiangqingData.tagList do
        tagObj[i].gameObject:SetActive(true)
        local tagStr = tagObj[i].transform:Find("Text_Tag").gameObject
        tagStr:GetComponent("TextMeshProUGUI").text = _XiangqingData.tagList[i]
    end
    ---技能栏5为EX
    if _skillDetail.SkillNum ~= 5 then
        ---非EX技能有进阶星
        Tools.ClearAllChild(self.JinengdianPanel().gameObject)
        self.EX().gameObject:SetActive(false)
        for i, v in ipairs(_skillDetail.SkillLvStage) do
            if _XiangqingData.curSkillLv >= v then
                if _XiangqingData.isEquipReach then
                    self:CreatInPanel(self.JinengdianPanel(),self.Img_Jinengdian2())
                else
                    self:CreatInPanel(self.JinengdianPanel(),self.Img_Jinengdian1())
                end
            else
                self:CreatInPanel(self.JinengdianPanel(),self.Img_Jinengdian_hui())
            end
        end
    end
end
function M:SkillDetails(trans, idx)
    ---传入数据
    trans:GetComponent("UITemplate"):SetData({ self.SkillDetail[idx] })
end
---初始化消耗道具
function M:InitCostPanel()
    Tools.ClearAllChild(self.CostItemPanel().gameObject)
    for i, v in ipairs(self.CostList) do
        local obj = GameObject.Instantiate(self.CostItem().gameObject, self.CostItemPanel().transform)
        v.itemObj = obj
        obj:SetActive(true)
        local costItemData = ItemControl.GetItemByID(v.itemId)
        ---更新道具数据
        self:UpdataItem(obj, costItemData)

        UIEvent.LuaClick(obj, Handle(self, function()
            MgrUI.Pop(UID.ItemDetailPop_UI, { costItemData, false, function()
            end }, true)
        end))
    end
end
---更新消耗道具
function M:UpdataCostPanel()
    for i, v in ipairs(self.CostList) do
        local costItemData = ItemControl.GetItemByID(v.itemId)
        local CostCount = v.itemObj.transform:Find("ItemCountText"):GetComponent("TextMeshProUGUI")
        if costItemData.count < v.costNum then
            CostCount.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),JNStrTool.numberAbbr(costItemData.count),v.costNum)
        else
            CostCount.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),JNStrTool.numberAbbr(costItemData.count),v.costNum)
        end
    end
    if self.LocalNextLv >= self.CurHeroAttr.SkillMaxLV then
        self:SwitchBtnState(2)
    else
        self:SwitchBtnState(1)
    end
    if self.LocalNextLv <= self.NoEquipHeroAttr.SkillLV + 1 then
        self:SwitchBtnState(4)
    else
        self:SwitchBtnState(3)
    end
end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data * 1000) / 1)
    tempData = tempInt1 / 10
    return tempData
end
---更新道具数据
function M:UpdataItem(obj, pData)
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
---高位数缩进
function M:GetRounding(value)
    return Global.GetConciseCount(value)
end


---获取消耗
function M:GetCost(nowLv, nextLv)
    if nextLv <= nowLv then
        return
    end
    for i, v in pairs(RoleattriskillupLocalData.tab) do
        if v[2] == self.UnChangedHeroAttr.Rank and v[3] == nextLv - 1 then  --判断同级别，同等级的消耗

            ---材料ID从角色表中读
            local str = string.split(self.CurHero.CostIcon,"_")
            local matId = tonumber(str[2])

            local xinwu = JNStrTool.strSplit("_", v[4]) ---材料
            local money = JNStrTool.strSplit("_", v[5]) ---金币

            local isHave = false
            for n, data in ipairs(self.CostList) do
                if data ~= nil then
                    if data.itemId == matId then
                        data.costNum = data.costNum + tonumber(xinwu[3])
                        isHave = true
                    elseif data.itemId == tonumber(money[2]) then
                        data.costNum = data.costNum + tonumber(money[3])
                        isHave = true
                    end
                end
            end
            if not isHave then
                local tCostItem = {
                    itemId = matId,
                    costNum = tonumber(xinwu[3]),
                    haveNum = 0,
                    itemObj = nil
                }
                table.insert(self.CostList, tCostItem)
                tCostItem = {
                    itemId = tonumber(money[2]),
                    costNum = tonumber(money[3]),
                    haveNum = 0,
                    itemObj = nil
                }
                table.insert(self.CostList, tCostItem)
            end
            break
        end
    end
    ---递归获取消耗
    self:GetCost(nowLv, nextLv - 1)
end

---循环检测按下事件并执行
function M:LoopInput()
    if self.IsEndLoopToInput == true then
        return
    else
        MgrTimer.AddDelayNoName(0.05, Handle(self, self.LoopInput), nil)
        self.Int_HasClick = 1
        self.Int_LoopTimer = self.Int_LoopTimer + 1
        local bool_IsUp = UIEvent.GetButton_Downing()
        if self.Int_LoopTimer > 5 then
            self:LoopFuncSwitch()
        end
        if bool_IsUp == false then
            self.Int_LoopTimer = 0
            self.Int_HasClick = 0
            self.IsEndLoopToInput = true
            print("跳出循环...........................")
        end
    end
end
---循环检测长按按钮方法
function M:LoopFuncSwitch()
    self.Int_LoopTimer = 0
    if self.Bool_IsAdd == true then
        -- 增加
        self:OnClickSkill(true)
    elseif self.Bool_IsAdd == false then
        -- 减少
        self:OnClickSkill(false)
    end
end
---点击更新技能
function M:OnClickSkill(_isUp)
    if _isUp then
        self.LocalNextLv = self.LocalNextLv + 1
        ---点击技能升级
        if self.LocalNextLv > self.CurHeroAttr.SkillMaxLV then
            self.LocalNextLv = self.CurHeroAttr.SkillMaxLV
            return
        end
        self.CurSkillLv = self.CurSkillLv + 1
    else
        self.LocalNextLv = self.LocalNextLv - 1
        ---点击技能降级
        if self.LocalNextLv <= self.NoEquipHeroAttr.SkillLV then
            self.LocalNextLv = self.NoEquipHeroAttr.SkillLV + 1
            return
        end
        self.CurSkillLv = self.CurSkillLv - 1
    end
    print("self.LocalNextLv: "..self.LocalNextLv)
    self.Text_SkillLv().text = self.CurSkillLv
    self.Text_SkillUseCount().text = self.CurSkillLv
    self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, self.LocalNextLv, self.CurHero.awaken)
    self.SkillScroll01():RefreshCells()
    ---清空消耗数据
    self:ClearCostNum()
    ---获取消耗
    self:GetCost(self.NoEquipHeroAttr.SkillLV, self.LocalNextLv)
    ---更新消耗道具
    self:UpdataCostPanel()
    ---更新攻击距离和范围
    self:UpdataRange()

    MgrSound.PlayEffect("yx_ui_shuzigundong_01", 1, nil, false)
end
---切换按钮高光低光
function M:SwitchBtnState(_BtnType)
    if _BtnType == 1 then
        -- 显示高光等级提升按钮
        Tools.ObjSetLastSibling(self.Btn_SkillLvUpLight().gameObject)
    elseif _BtnType == 2 then
        -- 显示低光光等级提升按钮
        self.Int_LoopTimer = 0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_SkillLvUp().gameObject)
    elseif _BtnType == 3 then
        -- 显示高光等级减少按钮
        Tools.ObjSetLastSibling(self.Btn_SkillLvDownLight().gameObject)
    elseif _BtnType == 4 then
        -- 显示低光等级减少按钮
        self.Int_LoopTimer = 0
        self.Int_HasClick = 0
        self.IsEndLoopToInput = true
        Tools.ObjSetLastSibling(self.Btn_SkillLvDown().gameObject)
    end
end

function M:OnClickUpgrade()
    local str = string.split(self.CurHero.CostIcon,"_")
    local mCostNeed = nil     --主材料消耗数量
    local coinNeed = nil      --货币消耗数量
    local coinItem = nil      --消耗货币材料
    local uCostItem = nil     --通用材料
    ---@type ItemData 主要消耗材料
    local mainCost = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))    --主要消耗材料
    if self.NoEquipHeroAttr.SkillLV >= self.UnChangedHeroAttr.SkillMaxLV then
        MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips2"), 1 }, true)
        return
    end
    ---材料赋值
    for k,v in pairs(RoleattriskillupLocalData.tab) do
        if v[2] == self.UnChangedHeroAttr.Rank and v[3] == self.LocalNextLv - 1 then  --判断同级别，同等级的消耗
            uCostItem = ItemControl.GetItemByIdAndType(tonumber(string.split(v[4],"_")[2]),tonumber(string.split(v[4],"_")[1]))
            mCostNeed = tonumber(string.split(v[4],"_")[3])
            coinItem = ItemControl.GetItemByIdAndType(tonumber(string.split(v[5],"_")[2]),tonumber(string.split(v[5],"_")[1]))
            coinNeed = tonumber(string.split(v[5],"_")[3])
        end
    end
    ---如果主材料和货币足够
    if mainCost.count >= mCostNeed and coinItem.count >= coinNeed then
        local ExpREQ = {
            heroID = self.CurHero.id,
            heroSkill = self.NoEquipHeroAttr.SkillLV,
            heroTargetSkill = self.CurHeroAttr.SkillLV
        }
        ---序列化
        local bytes = assert(pb.encode('PBClient.ClientHeroSkillUPREQ', ExpREQ))
        ItemControl.AckError = true
        HeroControl.AckError = true
        TaskControl.AckError = true
        ---发送数据
        MgrNet.SendReq(MID.CLIENT_HERO_SKILL_UP_REQ, bytes, 0, nil, Handle(self, self.ReceiveChipSynthesisACK), Handle(self, self.ReceiveCoreChipNTF))
    else
        ---如果通用材料 + 主材料满足主材料需求
        if uCostItem.count + mainCost.count >= mCostNeed then
            ---货币是否足够
            if coinItem.count >= coinNeed then
                ---跳一个合成的弹窗
                MgrUI.Pop(UID.ConfirmPop_UI,
                        {MgrLanguageData.GetLanguageByKey("ui_yangcheng_text143"),
                         function(params)
                             if params[2] >= params[4] then
                                 MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips2"), 1 }, true)
                                 return
                             end
                             local ExpREQ = {
                                 heroID = params[1],
                                 heroSkill = params[2],
                                 heroTargetSkill = params[3]
                             }
                             ---序列化
                             local bytes = assert(pb.encode('PBClient.ClientHeroSkillUPREQ', ExpREQ))
                             ItemControl.AckError = true
                             HeroControl.AckError = true
                             TaskControl.AckError = true
                             ---发送数据
                             MgrNet.SendReq(MID.CLIENT_HERO_SKILL_UP_REQ, bytes, 0, nil, Handle(self, self.ReceiveChipSynthesisACK), Handle(self, self.ReceiveCoreChipNTF))
                         end
                        ,{self.CurHero.id,self.NoEquipHeroAttr.SkillLV,self.CurHeroAttr.SkillLV,self.UnChangedHeroAttr.SkillMaxLV},2},true)
            else
                ---货币不足
                MgrUI.Pop(UID.PopTip_UI, { coinItem.name .. MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"), 1 }, true)
                return
            end
        else
            ---材料不足
            MgrUI.Pop(UID.PopTip_UI, { mainCost.name .. MgrLanguageData.GetLanguageByKey("roleskillupgrade_ui_tips1"), 1 }, true)
            return
        end
    end
end
---技能升级回调
function M:ReceiveChipSynthesisACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroSkillUPACK', buffer))
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("voidgeardetail_ui_tips2")..tab.errNo,1},true)
    end
end
function M:ReceiveCoreChipNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientHeroSkillUPNTF', buffer))
    ---物品消耗
    HeroControl.PushSingleHeroData(tab.info)
    ---技能升级成功
    self:SkillUpSuccessPanel()
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    ItemControl.PushGroupItemData(tab.cost, ItemControl.PushEnum.consume)
    ---播放技能升级语音
    RoleCardViewModel.PlayTargetRoleAniVoice(PosterGirlViewModel.GetRoleWords(self.CurHero.id,PosterGirlViewModel.WordsType.SkillUp))
    
    self:RefreshUI()
    ---刷新当前物资
    for i = 1, #self.CostList do
        local tItem = ItemControl.GetItemByID(self.CostList[i].itemId)
        self.CostList[i].haveNum = tItem.count
    end
end

---技能升级成功
function M:SkillUpSuccessPanel()
    MgrSound.PlayEffect("yx_ui_qianghua_01", nil, nil, false)
    -- statements
    self.SuccessPanel().gameObject:SetActive(true)
    self.CurRankText().text = "" .. self.UnChangedHeroAttr.SkillLV
    self.TarRankText().text = RoleData:CheckHeroEquipIsMax() and self.CurHeroAttr.SkillLV + 1 or self.CurHeroAttr.SkillLV
end

---更新攻击距离和范围
function M:UpdataRange()
    if self.CurHeroAttr.Occupation == 4 then
        MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/SupportRange/" .. self.CurHeroAttr.AttackRangeTexture)
    else
        MgrRes.LoadSprite(self.Img_Fanwei(), "AtkRange/OtherRange/" .. self.CurHeroAttr.AttackRangeTexture)
    end
    ---攻击目标
    MgrRes.LoadSprite(self.Img_Mubiao(),"AtkTarget/AtkTarget_" .. ((self.CurHeroAttr.Attacktarget == 7 or self.CurHeroAttr.Attacktarget == 8) and 4 or self.CurHeroAttr.Attacktarget),nil,true)
    ---攻击目标的描述
    self:Text_Mubiaoshuoming().text =  self.CurHeroAttr.AtkTargetTips
end

function M:ClearCostNum()
    for i, v in ipairs(self.CostList) do
        v.costNum = 0
    end
end

function M:AddNoviceEvent()
    Event.Clear("NoviceSkillConfirm")
    Event.Add("NoviceSkillConfirm",function()
        NoviceViewModel.DoNext(function()
            self:OnClickUpgrade()
        end)
    end)

    Event.Clear("NoviceGoMenu")
    Event.Add("NoviceGoMenu",function()
        MgrUI.ClosePop(self.Uid)
        MgrUI.GoBackTo(UID.Home_UI,function()
            NoviceViewModel.DoNext()
        end)
    end)

    Event.Clear("NoviceCloseSuccessPanel")
    Event.Add("NoviceCloseSuccessPanel",function()
        self.SuccessPanel().gameObject:SetActive(false)
    end)

    Event.Clear("NoviceSkillHideSelf")
    Event.Add("NoviceSkillHideSelf",function()
        self.ObjRoot.transform.gameObject:SetActive(false)
    end)

    Event.Clear("NoviceSkillShowSelf")
    Event.Add("NoviceSkillShowSelf",function()
        self.ObjRoot.transform.gameObject:SetActive(true)
    end)

end

---生成子物体
function M:InitPanel(_StarLV, _Root, _Prefab)
    Tools.ClearAllChild(_Root)
    local tempObjList = {}
    for i = 1, _StarLV, 1 do
        tempObjList[i] = self:CreatInPanel(_Root, _Prefab)
    end

    return tempObjList
end
---创建子物体
function M:CreatInPanel(_Root, _Prefab)
    local UnJuxingStar = self:CreatGo(_Prefab, _Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x, UnJuxingStar.transform.localPosition.y, 0)

    return UnJuxingStar
end
---创建一个物体
function M:CreatGo(_Prefab, _Root)
    if _Prefab == nil then
        print(_Prefab)
    end
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end

---升级成功后,刷新界面
function M:RefreshUI()
    self.UnChangedHeroAttr = RoleCardViewModel.CurrentHero:GetHeroAttrNoAdditional()
    self.NoEquipHeroAttr = self.CurHero:GetHeroAttrNoAdditional()
    self.LocalNextLv = self.NoEquipHeroAttr.SkillLV + 1
    self.CurHeroAttr = ReadData.GetRoleAttr(self.CurHero.id, self.CurHero.level, self.CurHero.star, self.LocalNextLv, self.CurHero.awaken)

    self:ClearCostNum()
    ---获取消耗
    self:GetCost(self.NoEquipHeroAttr.SkillLV, self.LocalNextLv)
    ---初始化技能列表
    self:InitSkillPanel()
    ---初始化技能等级、名称、布阵
    self:InitRankPanel()
    ---初始化消耗道具
    self:InitCostPanel()
    ---更新消耗道具
    self:UpdataCostPanel()
    ---更新攻击距离和范围
    self:UpdataRange()
end
return M