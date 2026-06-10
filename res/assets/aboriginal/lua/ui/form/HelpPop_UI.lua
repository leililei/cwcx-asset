-- Code Auto Create Begin
local M = Class('HelpPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.HelpPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[HelpPop_UI].prefab'
    self.Name = 'Form[HelpPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG(mh)','Img_BG(mh)',2},{'Img_Bangzhudi','RightPanel/Img_Bangzhudi',2},{'Btn_Next','RightPanel/Btn_Next',2},{'Btn_Next01','RightPanel/Btn_Next/Btn_Next',2},{'Xian(xiayixiang)','RightPanel/Btn_Next/Xian(xiayixiang)',2},{'Btn_Last','RightPanel/Btn_Last',2},{'Btn_Last01','RightPanel/Btn_Last/Btn_Last',2},{'Xian(shangyixiang)','RightPanel/Btn_Last/Xian(shangyixiang)',2},{'Img_Xian2','RightPanel/Img_Xian2',2},{'Img_Xian1','RightPanel/Img_Xian1',2},{'Panel','RightPanel/Panel',2},{'Tu','RightPanel/Panel/Tu',2},{'Img_Dian','RightPanel/Panel/Tu/Img_Dian',2},{'Img_Dangqiandian','RightPanel/Panel/Tu/Img_Dangqiandian',2},{'Shiyitu','RightPanel/Panel/Tu/Shiyitu',2},{'ScrollView','RightPanel/Panel/Tu/Scroll View',2},{'Viewport','RightPanel/Panel/Tu/Scroll View/Viewport',2},{'Help_Instruction_Content','RightPanel/Panel/Tu/Scroll View/Viewport/Help_Instruction_Content',2},{'Help_Instruction_Image','RightPanel/Panel/Tu/Scroll View/Viewport/Help_Instruction_Image',2},{'Img_Biaotidi','RightPanel/Panel/Zi/Img_Biaotidi',2},{'Text_Instruction','RightPanel/Panel/Zi/Text_Instruction',2},{'Viewport01','RightPanel/Panel/Zi/Text_Instruction/Viewport',2},{'SwitchRoot','SwitchRoot',2},{'Fengge','SwitchRoot/Fengge',2},{'SwitchPanel','SwitchRoot/SwitchPanel',2},{'SwitchPrefab','SwitchRoot/SwitchPanel/SwitchPrefab',2},{'normal','SwitchRoot/SwitchPanel/SwitchPrefab/normal',2},{'weixuanzhongdi','SwitchRoot/SwitchPanel/SwitchPrefab/normal/weixuanzhongdi',2},{'chosen','SwitchRoot/SwitchPanel/SwitchPrefab/chosen',2},{'xuanzhongdi','SwitchRoot/SwitchPanel/SwitchPrefab/chosen/xuanzhongdi',2},{'SwitchPanelSecond','SwitchRoot/SwitchPanelSecond',2},{'Viewport02','SwitchRoot/SwitchPanelSecond/Viewport',2},{'ContentOfSwitch','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch',2},{'bg','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch/SwitchItem/normal/bg',2},{'bg01','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch/SwitchItem/chosen/bg',2},{'Img_Fengexian','Img_Fengexian',2},{'Btn_InfoReturn','Btn_Return/Btn_InfoReturn',2},{'Btn_InfoHome','Btn_Return/Btn_InfoHome',2},
        -- Toggle 列表
        {'SwitchPrefab01','SwitchRoot/SwitchPanel/SwitchPrefab',13},{'SwitchItem','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch/SwitchItem',13},
        -- TextMeshProUGUI 列表
        {'Text_Next','RightPanel/Btn_Next/Text_Next',20},{'Text_Last','RightPanel/Btn_Last/Text_Last',20},{'Text_Title','RightPanel/Panel/Zi/Img_Biaotidi/Text_Title',20},{'Text_HelpUI_Instruction','RightPanel/Panel/Zi/Text_Instruction/Viewport/Content/Text_HelpUI_Instruction',20},{'EnText','SwitchRoot/SwitchPanel/SwitchPrefab/normal/EnText',20},{'CNText','SwitchRoot/SwitchPanel/SwitchPrefab/normal/CNText',20},{'EnText01','SwitchRoot/SwitchPanel/SwitchPrefab/chosen/EnText',20},{'CNText01','SwitchRoot/SwitchPanel/SwitchPrefab/chosen/CNText',20},{'CN','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch/SwitchItem/normal/CN',20},{'CN01','SwitchRoot/SwitchPanelSecond/Viewport/ContentOfSwitch/SwitchItem/chosen/CN',20},{'Text_HelpIntenface_CN','Text_Help/Text_HelpIntenface_CN',20},{'Text_HelpInterface_EN','Text_Help/Text_HelpInterface_EN',20},
    }
end
-- Code Auto Create End
require("LocalData/HelpmainLocalData")
function M:OnShow(pData)
    self.Help_Instruction_Image().gameObject:SetActive(false)
    self.currentSecLvButton = nil   --二级按钮
    self.No = nil --一级按钮
    self.allSecondLevel = {}
    ---初始化面板 返回对应二级按钮组
    self.secLvGroup = self:InitHelpPanel()
    ---初始化按钮
    self:InitButton()
    self.currentFirstLvButton = pData[1]
    self.No = pData[2]
    --激活对应的大面板
    self:OpenCorrespondingPanel(self.currentFirstLvButton,self.No)
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/llx_dianji.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"ShopHome_UI"}) then --没有pop打开
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.HelpPop_UI)
    end
end

function M:OpenCorrespondingPanel(first,num)
    if first == 1 or first == "1" then
        self.toggles[1].isOn = false
        self.toggles[1].isOn = true
    elseif first == 2 or first == "2" then
        self.toggles[2].isOn = false
        self.toggles[2].isOn = true
    elseif first == 3 or first == "3" then
        self.toggles[3].isOn = false
        self.toggles[3].isOn = true
    elseif first == 4 or first == "4" then
        self.toggles[4].isOn = false
        self.toggles[4].isOn = true
    elseif first == 5 or first == "5" then
        self.toggles[5].isOn = false
        self.toggles[5].isOn = true
    end
    self:EngageTheCorrectPanel(first)
    self.secLvGroup[first].transform:Find("Viewport"):Find("ContentOfSwitch"):Find(tostring(num)):GetComponent("Toggle").isOn = true
    self.currentSecLvButton = self.secLvGroup[first].transform:Find("Viewport"):Find("ContentOfSwitch"):Find(tostring(num))

    local no = num % 1000
    --如果按钮位置已经在最底部以下
    if (no - 1) * (98+30) > 689 then
        --需要的Y坐标
        local coro_Y = -768 + (no - 1) * (98 + 30)
        --位置改变
        self.currentSecLvButton.transform.parent:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end
end

function M:InitHelpPanel()
    --禁用启用
    self.SwitchItem().gameObject:SetActive(false)
    self.SwitchPanelSecond().gameObject:SetActive(false)
    --创建所有二级按钮面板,并全部返回
    local secLvGroup = self:CreateAllSecondLevelToggle()
    return secLvGroup
end
--获取toggle下两种toggle状态
function M:GetTwoButton(toggle, normalName, chosenName)
    return toggle.transform:Find(normalName).gameObject,toggle.transform:Find(chosenName).gameObject
end
--toggle事件
function M.ToggleClick(isOn,normal,chosen,Func)
    normal:SetActive(not isOn)
    chosen:SetActive(isOn)
    Func()
end
function M:InitButton()
    --获取toggle
    self.toggles = {}
    for k,v in ipairs(HelpmainLocalData.tab) do
        local obj = GameObject.Instantiate(self.SwitchPrefab().gameObject,self.SwitchPanel().transform,false)
        local cnName = obj.transform:Find("normal").transform:Find("CNText").transform:GetComponent("TextMeshProUGUI")
        local cnName2 = obj.transform:Find("chosen").transform:Find("CNText").transform:GetComponent("TextMeshProUGUI")
        local enName = obj.transform:Find("normal").transform:Find("EnText").transform:GetComponent("TextMeshProUGUI")
        local enName2 = obj.transform:Find("chosen").transform:Find("EnText").transform:GetComponent("TextMeshProUGUI")
        cnName.text = v[2]
        cnName2.text = v[2]
        enName.text = v[3]
        enName2.text = v[3]
        self.toggles[v[1]] = obj.transform:GetComponent("Toggle")
    end
    self.SwitchPrefab().gameObject:SetActive(false)

    --刷新方法
    local Refresh =
    {
        [1] = Handle(self,self.OnClickBattle),
        [2] = Handle(self,self.OnClickSkill),
        [3] = Handle(self,self.OnClickDevelop),
        [4] = Handle(self,self.OnClickInterface),
        [5] = Handle(self,self.OnClickOther)
    }
    --为所有toggle添加事件
    for i,toggle in pairs(self.toggles) do
        local normal,chosen = self:GetTwoButton(toggle,"normal","chosen")
        chosen:SetActive(false)
        Tools.ToggleValueChange(toggle,function(...)
            self.ToggleClick(...,normal,chosen,function()
                self:OnClick(i)
            end)
        end,nil)
    end
    --上一页按钮
    UIEvent.LuaClick(self.Btn_Last().gameObject,Handle(self,self.LastPage))
    --下一页按钮
    UIEvent.LuaClick(self.Btn_Next().gameObject,Handle(self,self.NextPage))
    --返回按钮
    UIEvent.LuaClick(self.Btn_InfoReturn().gameObject, Handle(self,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.HelpPop_UI)
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_InfoHome().gameObject, Handle(self,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(UID.HelpPop_UI)
        MgrUI.GoBackTo(UID.Home_UI)
    end))
end
--创建所有二级按钮面板
function M:CreateAllSecondLevelToggle()
    local secondLevelPanelGroup = {}
    for i = 1, #HelpmainLocalData.tab, 1 do
        --加载数据
        local data = self:LoadNeededData(i)
        --创建二级列表
        local secondLevelPanel = self:UpdateSecondLevel(data)
        secondLevelPanel.transform.name = "SecondLevel"..i
        table.insert(secondLevelPanelGroup,secondLevelPanel)
        --隐藏二级面板
        secondLevelPanel:SetActive(false)
    end
    return secondLevelPanelGroup
end
--切换到战斗说明
function M:OnClickBattle()
    --界面加载为战斗说明相关
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(1)       --激活对应的二级面板
    --self.secLvGroup[1].transform:Find("Viewport"):Find("ContentOfSwitch"):Find("1001"):GetComponent("Toggle").isOn = true
    self.secLvGroup[1].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end
--切换到技能说明
function M:OnClickSkill()
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(2)
    --self.secLvGroup[2].transform:Find("Viewport"):Find("ContentOfSwitch"):Find("2001"):GetComponent("Toggle").isOn = true
    self.secLvGroup[2].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end
--切换到养成说明
function M:OnClickDevelop()
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(3)
    --self.secLvGroup[3].transform:Find("Viewport"):Find("ContentOfSwitch"):Find("3001"):GetComponent("Toggle").isOn = true
    self.secLvGroup[3].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end
--切换到界面说明
function M:OnClickInterface()
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(4)
    --self.secLvGroup[4].transform:Find("Viewport"):Find("ContentOfSwitch"):Find("4001"):GetComponent("Toggle").isOn = true
    self.secLvGroup[4].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end
--切换到其他说明
function M:OnClickOther()
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(5)
    --self.secLvGroup[5].transform:Find("Viewport"):Find("ContentOfSwitch"):Find("5001"):GetComponent("Toggle").isOn = true
    self.secLvGroup[5].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end

function M:OnClick(id)
    self:ClearAllSecLvPanel()
    self:EngageTheCorrectPanel(id)
    self.secLvGroup[id].transform:Find("Viewport"):Find("ContentOfSwitch"):GetChild(0):GetComponent("Toggle").isOn = true
end

--清理所有二级面板的选中按钮
function M:ClearAllSecLvPanel()
    for i,v in pairs(self.allSecondLevel) do
        v.transform:GetComponent("Toggle").isOn = false
    end
end
--按一级按钮启动对应二级面板
function M:EngageTheCorrectPanel(id)
    for i = 1, #HelpmainLocalData.tab, 1 do
        if i == id then
            local obj = self.secLvGroup[i]
            obj:SetActive(true)
            obj.transform:Find("Viewport"):Find("ContentOfSwitch"):GetComponent("RectTransform").anchoredPosition = Vector2(0,0)
        else
            self.secLvGroup[i]:SetActive(false)
        end
    end
end
--更新第二级目录      showOrNot:是否显示ContentOfSwitch
function M:UpdateSecondLevel(data)
    --创建一个二级目录面板
    local newSecondLevelPanel = GameObject.Instantiate(self.SwitchPanelSecond().gameObject,self.SwitchRoot().transform,false)
    local content = newSecondLevelPanel.transform:Find("Viewport"):Find("ContentOfSwitch").gameObject
    local switchItem = self.SwitchItem()
    table.sort(data ,function(a,b)  --对按钮顺序进行排序
        return a[1] < b[1]
    end)
    --把第二层级创建出来
    for i = 1, #data, 1 do
        --创建每个按钮
        local switch = GameObject.Instantiate(switchItem,content.transform,false)
        switch.transform:GetComponent("Toggle").group = content.transform:GetComponent("ToggleGroup")
        switch.gameObject:SetActive(true)
        switch.transform.name = data[i][1]
        --按钮放入表内
        self.allSecondLevel[data[i][1]] = switch
        --改变第二层名字
        local normal,chosen = self:GetTwoButton(switch,"normal","chosen")
        normal.transform:Find("CN"):GetComponent("TextMeshProUGUI").text = data[i][3]
        chosen.transform:Find("CN"):GetComponent("TextMeshProUGUI").text = data[i][3]
        --给第二层toggle添加功能
        Tools.ToggleValueChange(switch.transform:GetComponent("Toggle"),function(...)
            self.ToggleClick(...,normal,chosen,Handle(self,function()
                --更换示意图
                --MgrRes.LoadSprite(self.Shiyitu(),"Preview/"..data[i][6])
                self:ChangeThePicture(data[i][6])
                --更换标题
                self.Text_Title().text = data[i][3]
                --更换文字
                self.Text_HelpUI_Instruction().text = data[i][5]
                --记录当前激活的二级按钮
                self.currentSecLvButton = switch
                --判断是否还有上下页
                local last = tonumber(self.currentSecLvButton.transform.name) - 1
                if self.allSecondLevel[last] == nil then
                    self.Btn_Last().gameObject:SetActive(false)
                else
                    self.Btn_Last().gameObject:SetActive(true)
                end
                local next = tonumber(self.currentSecLvButton.transform.name) + 1
                if self.allSecondLevel[next] == nil then
                    self.Btn_Next().gameObject:SetActive(false)
                else
                    self.Btn_Next().gameObject:SetActive(true)
                end
                --刷新自适应组件
                Tools.ReSize(self.Img_Biaotidi().gameObject)
            end))
        end,nil)
        --创建完把每个chosen按钮都隐藏掉
        chosen:SetActive(false)
    end
    return newSecondLevelPanel
end
--更换说明图片
function M:ChangeThePicture(pictureNameString)
    --增加删图的方法
    local count = self.Help_Instruction_Content().transform.childCount
    for j = 1, count, 1 do
        if self.Help_Instruction_Content().transform:GetChild(j - 1).gameObject ~= nil then
            GameObject.Destroy(self.Help_Instruction_Content().transform:GetChild(j - 1).gameObject)
        end
    end
    --加说明图片
    local allPicture = string.split(pictureNameString,",")
    if allPicture[1] == 0 or allPicture[1] == "0" then
        self.Help_Instruction_Content().gameObject:SetActive(false)
        self.Tu().gameObject:SetActive(false)
        return
    else
        self.Tu().gameObject:SetActive(true)
        self.Help_Instruction_Content().gameObject:SetActive(true)
    end
    for i = 1, #allPicture, 1 do
        local image = GameObject.Instantiate(self.Help_Instruction_Image().gameObject,self.Help_Instruction_Content().transform,false)
        image.transform.name = allPicture[i]
        image.gameObject:SetActive(true)
        --加图片
        MgrRes.LoadSprite(image.transform:GetComponent("Image"),"Preview/"..allPicture[i])
    end
end
--加载所有当前页面需要的数据
function M:LoadNeededData(groupID)
    local groupData = {}
    for i, v in pairs(HelpLocalData.tab) do
        if v[2] == groupID then
            table.insert(groupData,v)
        end
    end
    return groupData
end
--上一页
function M:LastPage()
    if self.currentSecLvButton == nil then
        return
    end
    local last = tonumber(self.currentSecLvButton.transform.name) - 1
    if self.allSecondLevel[last - 1] == nil then
        self.Btn_Last().gameObject:SetActive(false)
    end
    self.Btn_Next().gameObject:SetActive(true)
    if self.allSecondLevel[last] == nil then
        return
    end
    --按钮在content中的位置
    local chosenBtnPosition = self.currentSecLvButton.transform.localPosition
    --得到content当前位置
    local contentPosition = self.currentSecLvButton.transform.parent.transform.localPosition
    --如果当前按钮位置已经在最顶部以上
    if chosenBtnPosition.y + contentPosition.y > -177 then
        --需要的Y坐标
        local coro_Y = -177 - chosenBtnPosition.y
        --位置改变
        self.currentSecLvButton.transform.parent:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end

    self.allSecondLevel[last].transform:GetComponent("Toggle").isOn = true
    --self.currentSecLvButton.transform:GetComponent("Toggle").isOn = false
    --self.currentSecLvButton = self.allSecondLevel[last]

end

--下一页
function M:NextPage()
    if self.currentSecLvButton == nil then
        return
    end
    local next = tonumber(self.currentSecLvButton.transform.name) + 1
    if self.allSecondLevel[next + 1] == nil then
        self.Btn_Next().gameObject:SetActive(false)
    end
    self.Btn_Last().gameObject:SetActive(true)
    if self.allSecondLevel[next] == nil then
        return
    end
    --按钮在content中的位置
    local chosenBtnPosition = self.currentSecLvButton.transform.localPosition
    --得到content当前位置
    local contentPosition = self.currentSecLvButton.transform.parent.transform.localPosition
    --如果当前按钮位置已经在最底部以下
    if chosenBtnPosition.y + contentPosition.y < -689 then
        --需要的Y坐标
        local coro_Y = -689 - chosenBtnPosition.y
        --位置改变
        self.currentSecLvButton.transform.parent:GetComponent("RectTransform").anchoredPosition = Vector2(0,coro_Y)
    end

    self.allSecondLevel[next].transform:GetComponent("Toggle").isOn = true
    --self.currentSecLvButton.transform:GetComponent("Toggle").isOn = false
    --self.currentSecLvButton = self.allSecondLevel[next]

end

function M:OnClose()
    Event.Go("LinghangVisible")
    Event.Go("BackRubClickEffect")
    if HelpViewModel.CloseFunc then
        --执行回调
        HelpViewModel.CloseFunc()
        HelpViewModel.CloseFunc = nil
    end
end

return M