-- Code Auto Create Begin
local M = Class('CakeBakery_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CakeBakery_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CakeBakery_UI].prefab'
    self.Name = 'Form[CakeBakery_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'mask','mask',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'DeskBg','DeskBg',2},{'Img_jiaobanqi','Img_jiaobanqi',2},{'MakingsPanel','MakingsPanel',2},{'Makings1','MakingsPanel/Makings1',2},{'Img_icon','MakingsPanel/Makings1/Img_icon',2},{'Img_cailiao','MakingsPanel/Makings1/Img_cailiao',2},{'Makings2','MakingsPanel/Makings2',2},{'Img_icon01','MakingsPanel/Makings2/Img_icon',2},{'Img_cailiao01','MakingsPanel/Makings2/Img_cailiao',2},{'Makings3','MakingsPanel/Makings3',2},{'Img_icon02','MakingsPanel/Makings3/Img_icon',2},{'Img_cailiao02','MakingsPanel/Makings3/Img_cailiao',2},{'Btn_shicaibuzu','MakingsPanel/Btn_shicaibuzu',2},{'Btn_tourushicai','MakingsPanel/Btn_tourushicai',2},{'Btn_Ingredients','MakingsPanel/Btn_Ingredients ',2},{'MakePanel','MakePanel',2},{'bar_cake2','MakePanel/bar_cake2',2},{'bar_cake1','MakePanel/bar_cake2/bar_cake1',2},{'tips_jindu','MakePanel/bar_cake2/tips_jindu',2},{'Qipao','MakePanel/Qipao',2},{'Img_qipaotouxiang','MakePanel/Qipao/Img_qipaotouxiang',2},{'Img_jiya','MakePanel/Qipao/Img_qipaotouxiang/Img_jiya',2},{'Btn_TouchBake','MakePanel/Btn_TouchBake',2},{'BakeryPop','BakeryPop',2},{'Image','BakeryPop/Image',2},{'Plane_Zhizuowancheng','BakeryPop/Plane_Zhizuowancheng',2},{'Img_CakeIcon','BakeryPop/Img_CakeIcon',2},{'Btn_Wancheng','BakeryPop/Btn_Wancheng',2},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'Text_shuliang','MakingsPanel/Makings1/Text_shuliang',20},{'Text_shuliang01','MakingsPanel/Makings2/Text_shuliang',20},{'Text_shuliang02','MakingsPanel/Makings3/Text_shuliang',20},{'Text_qipao','MakePanel/Qipao/Text_qipao',20},{'Text_wancheng','BakeryPop/Btn_Wancheng/Text_wancheng',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.BakeryData = CakeControl.GetBakeryData()
    self.Foods = {
        self.Makings1(),
        self.Makings2(),
        self.Makings3(),
    }
    self.CanBakery = true
    self.bar_cake1().fillAmount = 0
    self.touchTimes = tonumber(SteamLocalData.tab[111014][2])
    ---spine
    self.BakeryEff = nil
    MgrRes.LoadWatchAuto(self.Img_jiaobanqi().gameObject, 90004, -37, -223, 1, nil, function(obj)
        self.BakeryEff = obj
    end)
    
    self:RefreshUI()
    self:InitButton() 
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrUI.GoBack()
    end))
    ---返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrUI.GoBackTo(UID.Home_UI)
    end)
    ---烘焙
    UIEvent.LuaClick(self.Btn_tourushicai().gameObject, function()
        if self.CanBakery then
            self.MakingsPanel().gameObject:SetActive(false)
            self.MakePanel().gameObject:SetActive(true)
        end
    end)
    ---烘焙
    UIEvent.LuaClick(self.Btn_TouchBake().gameObject, function()
        if self.bar_cake1().fillAmount == 0 then
            CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,"play",true)
        end
        local times = 1/self.touchTimes
        self.bar_cake1().fillAmount = self.bar_cake1().fillAmount + times

        if self.bar_cake1().fillAmount == 1 then
            CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,"idle",true)
            CakeControl.CakeBuild(self.BakeryData.id, function(reward)
                ---打开展示
                local ItemData = ItemData.New()
                ItemData:PushData({ reward[1] },ItemControl.PushEnum.none)
                MgrRes.LoadSprite(self.Img_CakeIcon(), ItemData.icon)

                self.BakeryPop().gameObject:SetActive(true)
                self.bar_cake1().fillAmount = 0
            end)
            return
        end
    end)
    ---关闭展示
    UIEvent.LuaClick(self.Btn_Wancheng().gameObject, function()
        self.BakeryPop().gameObject:SetActive(false)
        self.MakePanel().gameObject:SetActive(false)
        self.MakingsPanel().gameObject:SetActive(true)

        self:RefreshUI()
    end)
end

function M:RefreshUI()
    for i = 1, #self.Foods do
        self:FoodUI(self.Foods[i].gameObject, self.BakeryData.use[i])
    end
    self.Btn_shicaibuzu().gameObject:SetActive(not self.CanBakery)
    self.Btn_tourushicai().gameObject:SetActive(self.CanBakery)
end

function M:FoodUI(_obj, data)
    if data == nil then
        _obj:SetActive(false)
        return
    end
    local tItemStr = string.split(data,'_')
    local itemData = ItemControl.GetItemByIdAndType(tonumber(tItemStr[2]), tonumber(tItemStr[1]))
    local tFood_Icon = CJNUIMgr.GetSunUseName(_obj, "Img_icon"):GetComponent("Image")
    local tFood_Num = CJNUIMgr.GetSunUseName(_obj, "Text_shuliang"):GetComponent("TextMeshProUGUI")
    
    MgrRes.LoadSprite(tFood_Icon,itemData.icon)
    tFood_Num.text = JNStrTool.numberAbbr(itemData.count).."/"..tItemStr[3]
    if itemData.count < tonumber(tItemStr[3]) then
        self.CanBakery = false
    end
end

function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        MgrUI.GoBack()
    end
end

function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
end
return M