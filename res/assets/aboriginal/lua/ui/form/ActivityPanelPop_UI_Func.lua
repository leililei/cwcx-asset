local M = Class('ActivityPanelPop_UI', UIBase)

function M:OnUpdateUI()
    local activities = ActivityLocalData.tab
    for i = 1, #activities do
        --所有活动名称
        table.insert(self.allActivitiesName,activities[i][3])
        --所有活动相关参数
        table.insert(self.allActivitiesParas,activities[i])
    end
    --创建所有Toggle用来激活不同活动页面
    self.ActivityToggles = self:ActivitiesToggle(self.allActivitiesName, self.ToggleButton().gameObject, self.ToggleParentTransform().transform,
        Handle(self,function(self,index,isOn)
            if isOn then
                --激活选中的活动页面
                self:InitActivityPanel(index)
                --点亮自身按钮
                self.LightSelfToggle(index)
            end
        end)
    )
end
--创建所有活动Toggle按钮
function M:ActivitiesToggle(AllToggles,ToggleButton,ToggleParentTransform,callback)
    --创建所有按钮预制体
    local toggles = {}
    for i,name in pairs(AllToggles) do
        local togTrans = GameObject.Instantiate(ToggleButton,ToggleParentTransform,false).transform
        togTrans:GetComponent("UITemplate"):SetData({name,function(...)
            callback(i,...)
        end})
        toggles[i] = togTrans:GetComponent("Toggle")
    end
    return toggles
end
--初始化活动界面
function M:InitActivityPanel(index)
    local paras = self.allActivitiesParas[index]

    --给图片注册按钮 GoToActivity(paras)

end
--前往该活动界面
function M:GoToActivity(paras)
    --点击图片跳转对应活动    paras[2]活动类型 据此跳转
    if paras[2] == 999 then
        EventRaidViewModel.SetParameters(paras)
        MgrUI.Go(UID.NoviceActivity_UI)
        MgrUI.ClosePop(UID.ActivityPanelPop_UI)
    elseif paras[2] == 1 then
        --把活动数据传入ViewModel
        EventRaidViewModel.SetParameters(paras)
        --打开活动界面
        MgrUI.Go(UID.StoryActivity_UI)
        MgrUI.ClosePop(UID.ActivityPanelPop_UI)
    elseif paras[2] == 2 then
    end
end

--点亮自身Toggle
function M:LightSelfToggle(index)
    for i,v in pairs(self.ActivityToggles) do
        if i == index then
            self.ActivityToggles[i].transform:Find("Light").gameObject:SetActive(true)
        else
            self.ActivityToggles[i].transform:Find("Light").gameObject:SetActive(false)
        end
    end
end

function M:CheckActivityLock(activityID)
    local activityData = ActivityLocalData.tab
    local playerData = PlayerControl.GetPlayerData()
    if playerData.level >= activityData[activityID][6] then
        return true
    else
        return false
    end
end

------------按钮要调用的函数
function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end

return M