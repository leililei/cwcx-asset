-------------------------------------------页签管理---------------------------------------
--ctor(页签根目录， 面板根目录)
--子页签挂Toggle组件
--子页签和子面板分别在其根目录的顺序要一致
UITabCtrller = Class("UITabCtrller")
local this = UITabCtrller
function this:ctor(trans_tab, trans_panel)
    self.rootTab = trans_tab.transform
    self.rootPanel = trans_panel.transform
    self.panelArray = {}
    self.togArray = {}
    self.tabActionDic = {}

    --获取子面板gameObject
    for i=1, self.rootPanel.childCount do
        local go = self.rootPanel:GetChild(i - 1).gameObject
        self.panelArray[i] = go
    end
    --获取子页签toggle
    for i=1, self.rootTab.childCount do
        local tog = self.rootTab:GetChild(i - 1):GetComponent("Toggle")
        self["_OnTog"..i] = function ( isOn )
                                self.panelArray[i]:SetActive(isOn)
                                if isOn and self.tabActionDic[i] then
                                    self.tabActionDic[i](self)
                                end
                                Utils.LogError("click tab:"..i)
                            end
        Tools.ToggleValueChange(tog,self["_OnTog"..i],nil)
        self.togArray[i] = tog
    end
    self:ToTab(1)
end

function this:SetTabAction( index, func )
    self.tabActionDic[index] = func
end

function this:ToTab( index )
    self.togArray[index].isOn = true
end

function this:SetNotice( index, isOn )
    self.togArray[index].transform:Find("img_notice").gameObject:SetActive(isOn)
end