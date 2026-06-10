-- Code Auto Create Begin
local M = Class('Pubs_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Pubs_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Pubs_UI].prefab'
    self.Name = 'Form[Pubs_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Background',2},{'ConsoleBg','ConsoleBg',2},{'Btn_shicaibuzu','Btn_shicaibuzu',2},{'Btn_tourushicai','Btn_tourushicai',2},{'Btn_Coin','Btn_Coin',2},{'Btn_Add','Btn_Coin/Btn_Add',2},{'Img_Zuanshicon','Btn_Coin/Img_Zuanshicon',2},{'Huobi','Huobi',2},{'ReturnBg','ReturnBg',2},{'Btn_GoMenu','ReturnBg/Btn_GoMenu',2},{'Btn_Back','ReturnBg/Btn_Back',2},{'Img_Fenggexian','ReturnBg/Img_Fenggexian',2},{'PubsPop','PubsPop',2},{'Mask','PubsPop/Mask',2},{'ItemCell','PubsPop/Plane_jianglipop/ItemCell',2},{'AwardBg','PubsPop/Plane_jianglipop/ItemCell/AwardBg',2},{'Img_Icon','PubsPop/Plane_jianglipop/ItemCell/Img_Icon',2},{'Img_ItemCountBg','PubsPop/Plane_jianglipop/ItemCell/Img_Icon/Img_ItemCountBg',2},{'AwardPop','PubsPop/Plane_jianglipop/AwardPop',2},{'jiangli_title','PubsPop/Plane_jianglipop/jiangli_title',2},{'Btn_Wancheng','PubsPop/Plane_jianglipop/Btn_Wancheng',2},
        -- Text 列表
        {'Text_ItemCount','PubsPop/Plane_jianglipop/ItemCell/Img_Icon/Img_ItemCountBg/Text_ItemCount',3},
        -- TextMeshProUGUI 列表
        {'Text_ZSCount','Btn_Coin/Text_ZSCount',20},{'Text_Title_CN','ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','ReturnBg/Text_Title/Text_Title_EN',20},{'Text_wancheng','PubsPop/Plane_jianglipop/Btn_Wancheng/Text_wancheng',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.BakeryData = CakeControl.GetBakeryData()
    self.GiftData,self.GiftDataByOrder = CakeControl.GetGiftData()
    ---礼物赠送道具
    self.GiftStr = self.GiftDataByOrder[1].gift
    self.Foods = {
        self.Btn_Coin()
    }
    self.CanBakery = true
    self.touchTimes = tonumber(SteamLocalData.tab[111014][2])
    ---抽奖失败特效
    self.FailEff = {
        "no_01",
        "no_02",
        "no_03",
        "no_04",
        "no_05",
    }
    ---spine
    self.BakeryEff = nil
    MgrRes.LoadWatchAuto(self.ConsoleBg().gameObject, 90028, -30, -536, 1, "dj", function(obj)
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
        if self.CanBakery == nil then
            return
        end
        self.Btn_tourushicai().gameObject:SetActive(false)
        ---开始音效
        MgrSound.PlayEffect("yx_ui_laohuji_kaishiyouxi",1,0,false,0,0,"pubs_sound")
        
        CakeControl.CakeBuild(self.BakeryData.id, function(reward)            
            local isBingo = false
            for i, v in ipairs(self.GiftStr) do
                local tItem = string.split(v,"_")
                if reward[1].goodsType == tonumber(tItem[1]) and reward[1].goodsID == tonumber(tItem[2]) then
                    isBingo = true
                    break
                end
            end
            if isBingo then
                ---中奖音效
                MgrSound.PlayEffect("yx_ui_laohuji_zhongjiang",1,0,false,0,0,"pubs_sound")
                CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,"yes_777",true,function(eventName)
                    if eventName == "end" then
                        
                        self.Img_ItemCountBg().gameObject:SetActive(false)
                        CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,"dj",true)
                        ---展示老虎机奖励先
                        self:ShowAward(reward)
                    end
                end)
            else
                ---未中奖音效
                MgrSound.PlayEffect("yx_ui_laohuji_weizhongjiang",1,0,false,0,0,"pubs_sound")
                ---随机一个特效
                local tEffect = self.FailEff[math.random(1,#self.FailEff)]
                CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,tEffect,true,function(eventName)
                    if eventName == "end" then
                        self.Img_ItemCountBg().gameObject:SetActive(true)
                        CMgrSpine.Instance:SetSpineAnimation(self.BakeryEff,"dj",true)
                        ---展示老虎机奖励先
                        self:ShowAward(reward)
                    end
                end)
            end

        end)
    end)

    ---关闭展示
    UIEvent.LuaClick(self.Btn_Wancheng().gameObject, function()
        self.PubsPop().gameObject:SetActive(false)
    end)
end
---展示老虎机奖励先
function M:ShowAward(reward)
    ---获奖音效
    MgrSound.PlayEffect("yx_ui_laohuji_huodejiangli",1,0,false,0,0,"pubs_sound")
    ---打开展示
    local tItemData = ItemData.New()
    tItemData:PushData(reward[1],ItemControl.PushEnum.none)
    
    MgrRes.LoadSprite(self.Img_Icon(), tItemData.icon)
    self.Img_ItemCountBg().gameObject:SetActive(not isBingo)
    self.Text_ItemCount().text = reward[1].goodsNum
    self.PubsPop().gameObject:SetActive(true)
    
    self:RefreshUI()
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
    local tFood_Icon = CJNUIMgr.GetSunUseName(_obj, "Img_Zuanshicon"):GetComponent("Image")
    local tFood_Num = CJNUIMgr.GetSunUseName(_obj, "Text_ZSCount"):GetComponent("TextMeshProUGUI")

    MgrRes.LoadSprite(tFood_Icon,itemData.icon)
    tFood_Num.text = JNStrTool.numberAbbr(itemData.count)
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