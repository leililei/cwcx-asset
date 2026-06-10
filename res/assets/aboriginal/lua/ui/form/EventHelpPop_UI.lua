-- Code Auto Create Begin
local M = Class('EventHelpPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.EventHelpPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[EventHelpPop_UI].prefab'
    self.Name = 'Form[EventHelpPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Help','Help',2},{'Img_Mask','Help/Img_Mask',2},{'Img_Help','Help/Img_Help',2},{'Btn_Left','Help/Img_Help/Btn_Left',2},{'Btn_Right','Help/Img_Help/Btn_Right',2},{'Page','Help/Page',2},{'Image','Help/Page/Image',2},{'PageGroup','Help/PageGroup',2},{'HelpBtn_Back','Help/HelpBtn_Back',2},
        -- TextMeshProUGUI 列表
        {'Text_Title','Help/Text_Title',20},{'Text_Desc','Help/Text_Desc',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self:InitBtn()
end

function M:OnShow(args)
    ---@type ActiveTutorialData[]
    self.data = args[1]
    ---callback
    self.func = args[2]
    ---当前索引默认为1
    self.curIndex = 1
    ---初始化页数点
    self:InitItem()
    ---刷新界面
    self:RefreshUI(1)
    ---修改本地数据
    if self.data[1]:GetLocalState() == false then
        self.data[1]:SetLocalState()
    end
end

---初始化按钮事件
function M:InitBtn()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---点击关闭UI
    UIEvent.LuaClick(self.HelpBtn_Back().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)

    ---点击下一页
    UIEvent.LuaClick(self.Btn_Right().gameObject,function()
        self.curIndex = self.curIndex + 1
        self:RefreshUI(self.curIndex)
    end)

    ---点击上一页
    UIEvent.LuaClick(self.Btn_Left().gameObject,function()
        self.curIndex = self.curIndex - 1
        self:RefreshUI(self.curIndex)
    end)
end

---传入索引刷新当前界面
function M:RefreshUI(index)
    ---异常
    if index <= 0 or index > ActiveTutorialControl.GetGroupMaxNum(self.data[1].group) then
        return
    end

    local _data = self.data[index]
    ---加载帮助图片
    MgrRes.LoadSprite(self.Img_Help(),_data.picture)
    ---加载标题
    self.Text_Title().text = _data.title
    ---加载文本
    self.Text_Desc().text = _data.text
    ---刷新按钮显示
    if self.curIndex == 1 then
        self.Btn_Left().gameObject:SetActive(false)
        self.Btn_Right().gameObject:SetActive(true)
    elseif self.curIndex == ActiveTutorialControl.GetGroupMaxNum(self.data[1].group) then
        self.Btn_Left().gameObject:SetActive(true)
        self.Btn_Right().gameObject:SetActive(false)
    else
        self.Btn_Left().gameObject:SetActive(true)
        self.Btn_Right().gameObject:SetActive(true)
    end
    ---刷新点
    for k,v in pairs(self.pageList) do
        v.enabled = false
    end
    self.pageList[index].enabled = true
end

---初始化点
function M:InitItem()
    self.pageList = {}
    for k,v in pairs(self.data) do
        local obj = GameObject.Instantiate(self.Page().gameObject,self.PageGroup().gameObject.transform,false)
        table.insert(self.pageList,obj.transform:Find("Image").transform:GetComponent("Image"))
        self.pageList[k].enabled = false
    end
    ---默认打开第一个
    self.pageList[1].enabled = true
    self.Page().gameObject:SetActive(false)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnClose()
    Event.Go("ClickOnOff",true)
    if self.func then
        self.func()
    end
end

return M