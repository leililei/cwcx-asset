-- Code Auto Create Begin
local M = Class('GongGaoPop', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.GongGaoPop
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[GongGaoPop].prefab'
    self.Name = 'Form[GongGaoPop]'
    self.Layer = UILayerLv.Pop
    self.Depth = 10
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'GonggaoPanel','GonggaoPanel',2},{'Aegislogo','GonggaoPanel/DingBu/Aegislogo',2},{'QieyePanel','GonggaoPanel/DingBu/QieyePanel',2},{'Btn_XZ','GonggaoPanel/DingBu/Btn_XZ',2},{'TaskContent','GonggaoPanel/NoticePageScroll/TaskContent',2},{'GongGaoPageBtn','GonggaoPanel/NoticePageScroll/GongGaoPageBtn',2},{'Img_NeiRongKuang','GonggaoPanel/Img_NeiRongKuang',2},{'Content','GonggaoPanel/Img_NeiRongKuang/NoticeScroll/Content',2},{'GonggaoMould','GonggaoPanel/Img_NeiRongKuang/NoticeScroll/GonggaoMould',2},
        -- UITemplate 列表
        {'GongGaoPageBtn01','GonggaoPanel/NoticePageScroll/GongGaoPageBtn',10},{'GonggaoMould01','GonggaoPanel/Img_NeiRongKuang/NoticeScroll/GonggaoMould',10},
        -- Toggle 列表
        {'Btn_XZ01','GonggaoPanel/DingBu/Btn_XZ',13},{'GongGaoPageBtn02','GonggaoPanel/NoticePageScroll/GongGaoPageBtn',13},
        -- LoopScrollRect 列表
        {'NoticePageScroll','GonggaoPanel/NoticePageScroll',18},{'NoticeScroll','GonggaoPanel/Img_NeiRongKuang/NoticeScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_XZzi','GonggaoPanel/DingBu/Btn_XZ/Text_XZzi',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.NoticeList = {}
    self.PageID = 0
    self.ToggleList = {}

    self:AddEvent()
    self:InitScroll()
    self:InitButton()
end

function M:OnBackKey()
    MgrUI.ClosePop(self.Uid)
end

function M:OnShow(args)
    local idx = 1
    self.NoticeList = NoticeControl.GetActiveNotice()
    if #self.NoticeList == 0 then
        self.NoticeList = NoticeControl.GetGameNotice()
        idx = 2
    end
    self.ToggleList[idx].isOn = true
    --self.NoticePageScroll().totalCount = #self.NoticeList
    --self.NoticePageScroll():RefillCells()

    --if args ~= nil then
    --    ---游戏公告
    --    self.ToggleList[2].isOn = true
    --end
end
---添加监听
function M:AddEvent()
    Event.Add("Notice_Page", Handle(self, self.ChangePage))
end

function M:InitScroll()
    ---页签滑条
    self.NoticePageScroll():SetLuaCellEvent(Handle(self, self.NoticePage))
    ---内容滑条
    self.NoticeScroll():SetLuaCellEvent(Handle(self, self.Notice))
end

function M:NoticePage(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.NoticeList[idx], idx })
end

function M:Notice(trans, idx)
    trans:GetComponent("UITemplate"):SetData({ self.NoticeList[self.PageID].notice[idx] })
end

function M:InitButton()
    UIEvent.LuaClick(self.BlurMask().gameObject, function()
        MgrUI.ClosePop(self.Uid)
    end)
    ---公告类型按钮
    local tBtnType = string.split(MgrLanguageData.GetLanguageByKey("ui_gonggao_mingzi"), ",")
    for i, v in ipairs(tBtnType) do
        local tempObj = GameObject.Instantiate(self.Btn_XZ(), self.QieyePanel().transform)
        local text = tempObj.transform:Find("Text_XZzi").gameObject:GetComponent("TextMeshProUGUI")
        text.text = v

        local toggle = tempObj.gameObject:GetComponent("Toggle")
        Tools.ToggleValueChange(toggle, function(isOn)
            if isOn then
                if i == 1 then
                    self.NoticeList = NoticeControl.GetActiveNotice()
                else
                    self.NoticeList = NoticeControl.GetGameNotice()
                end
                self.NoticePageScroll().totalCount = #self.NoticeList
                if #self.NoticeList == 0 then
                    self.Content().gameObject:SetActive(false)
                else
                    self.Content().gameObject:SetActive(true)
                end
                self.NoticePageScroll():RefillCells()
                ---按钮状态切换
                tempObj.gameObject:GetComponent("Image").color = Color.white
                text.color = Color.black
            else
                tempObj.gameObject:GetComponent("Image").color = Color(0.1960784, 0.1960784, 0.1960784)
                text.color = Color.white
            end
        end)
        self.ToggleList[i] = toggle
    end
    self.ToggleList[1].isOn = false
    self.ToggleList[1].isOn = true
    self.Btn_XZ().gameObject:SetActive(false)
end

function M:ChangePage(_page)
    self.PageID = _page

    self.NoticeScroll().totalCount = #self.NoticeList[_page].notice
    self.NoticeScroll():RefillCells()

    Tools.ReContentSizeGroup(self.Content().gameObject)
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    Event.CheckClear("Notice_Page")
end

return M