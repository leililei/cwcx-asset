-- Code Auto Create Begin
local M = Class('Huiguiqiandao_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Huiguiqiandao_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Huiguiqiandao_UI].prefab'
    self.Name = 'Form[Huiguiqiandao_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Background','Ani/Background',2},{'Img_Role','Ani/Img_Role',2},{'bg_zhuangshixian','Ani/bg_zhuangshixian',2},{'Scroll','Ani/Scroll',2},{'Huiguiitem','Ani/Scroll/Huiguiitem',2},{'img_daojudi_H','Ani/Scroll/Huiguiitem/img_daojudi_H',2},{'icon','Ani/Scroll/Huiguiitem/img_daojudi_H/icon',2},{'img_time','Ani/Scroll/Huiguiitem/img_daojudi_H/img_time',2},{'mask','Ani/Scroll/Huiguiitem/img_daojudi_H/mask',2},{'Img_wancheng','Ani/Scroll/Huiguiitem/img_daojudi_H/mask/Img_wancheng',2},{'img_suo','Ani/Scroll/Huiguiitem/img_daojudi_H/mask/img_suo',2},{'bg_name','Ani/Scroll/Huiguiitem/img_daojudi_H/bg_name',2},{'img_daojudi','Ani/Scroll/Huiguiitem/img_daojudi',2},{'icon01','Ani/Scroll/Huiguiitem/img_daojudi/icon',2},{'img_time01','Ani/Scroll/Huiguiitem/img_daojudi/img_time',2},{'mask01','Ani/Scroll/Huiguiitem/img_daojudi/mask',2},{'Img_wancheng01','Ani/Scroll/Huiguiitem/img_daojudi/mask/Img_wancheng',2},{'img_suo01','Ani/Scroll/Huiguiitem/img_daojudi/mask/img_suo',2},{'bg_name01','Ani/Scroll/Huiguiitem/img_daojudi/bg_name',2},{'Huiguiitem_1','Ani/Huiguiitem_1',2},{'img_daojudi_H01','Ani/Huiguiitem_1/img_daojudi_H',2},{'light','Ani/Huiguiitem_1/img_daojudi_H/light',2},{'icon02','Ani/Huiguiitem_1/img_daojudi_H/icon',2},{'img_time02','Ani/Huiguiitem_1/img_daojudi_H/img_time',2},{'mask02','Ani/Huiguiitem_1/img_daojudi_H/mask',2},{'Img_wancheng02','Ani/Huiguiitem_1/img_daojudi_H/mask/Img_wancheng',2},{'img_suo02','Ani/Huiguiitem_1/img_daojudi_H/mask/img_suo',2},{'bg_name02','Ani/Huiguiitem_1/img_daojudi_H/bg_name',2},{'img_daojudi01','Ani/Huiguiitem_1/img_daojudi',2},{'light01','Ani/Huiguiitem_1/img_daojudi/light',2},{'icon03','Ani/Huiguiitem_1/img_daojudi/icon',2},{'img_time03','Ani/Huiguiitem_1/img_daojudi/img_time',2},{'mask03','Ani/Huiguiitem_1/img_daojudi/mask',2},{'Img_wancheng03','Ani/Huiguiitem_1/img_daojudi/mask/Img_wancheng',2},{'img_suo03','Ani/Huiguiitem_1/img_daojudi/mask/img_suo',2},{'bg_name03','Ani/Huiguiitem_1/img_daojudi/bg_name',2},{'Huiguiitem_2','Ani/Huiguiitem_2',2},{'img_daojudi_H02','Ani/Huiguiitem_2/img_daojudi_H',2},{'light02','Ani/Huiguiitem_2/img_daojudi_H/light',2},{'icon04','Ani/Huiguiitem_2/img_daojudi_H/icon',2},{'img_time04','Ani/Huiguiitem_2/img_daojudi_H/img_time',2},{'mask04','Ani/Huiguiitem_2/img_daojudi_H/mask',2},{'Img_wancheng04','Ani/Huiguiitem_2/img_daojudi_H/mask/Img_wancheng',2},{'img_suo04','Ani/Huiguiitem_2/img_daojudi_H/mask/img_suo',2},{'bg_name04','Ani/Huiguiitem_2/img_daojudi_H/bg_name',2},{'img_daojudi02','Ani/Huiguiitem_2/img_daojudi',2},{'light03','Ani/Huiguiitem_2/img_daojudi/light',2},{'icon05','Ani/Huiguiitem_2/img_daojudi/icon',2},{'img_time05','Ani/Huiguiitem_2/img_daojudi/img_time',2},{'mask05','Ani/Huiguiitem_2/img_daojudi/mask',2},{'Img_wancheng05','Ani/Huiguiitem_2/img_daojudi/mask/Img_wancheng',2},{'img_suo05','Ani/Huiguiitem_2/img_daojudi/mask/img_suo',2},{'bg_name05','Ani/Huiguiitem_2/img_daojudi/bg_name',2},{'Huiguiitem_3','Ani/Huiguiitem_3',2},{'img_daojudi_H03','Ani/Huiguiitem_3/img_daojudi_H',2},{'light04','Ani/Huiguiitem_3/img_daojudi_H/light',2},{'icon06','Ani/Huiguiitem_3/img_daojudi_H/icon',2},{'img_time06','Ani/Huiguiitem_3/img_daojudi_H/img_time',2},{'mask06','Ani/Huiguiitem_3/img_daojudi_H/mask',2},{'Img_wancheng06','Ani/Huiguiitem_3/img_daojudi_H/mask/Img_wancheng',2},{'img_suo06','Ani/Huiguiitem_3/img_daojudi_H/mask/img_suo',2},{'bg_name06','Ani/Huiguiitem_3/img_daojudi_H/bg_name',2},{'img_daojudi03','Ani/Huiguiitem_3/img_daojudi',2},{'light05','Ani/Huiguiitem_3/img_daojudi/light',2},{'icon07','Ani/Huiguiitem_3/img_daojudi/icon',2},{'img_time07','Ani/Huiguiitem_3/img_daojudi/img_time',2},{'mask07','Ani/Huiguiitem_3/img_daojudi/mask',2},{'Img_wancheng07','Ani/Huiguiitem_3/img_daojudi/mask/Img_wancheng',2},{'img_suo07','Ani/Huiguiitem_3/img_daojudi/mask/img_suo',2},{'bg_name07','Ani/Huiguiitem_3/img_daojudi/bg_name',2},{'img_qipao','Ani/img_qipao',2},{'title_di','Ani/title_di',2},{'title','Ani/title_di/title',2},{'ReturnBg','Ani/ReturnBg',2},{'Btn_GoMenu','Ani/ReturnBg/Btn_GoMenu',2},{'Btn_Back','Ani/ReturnBg/Btn_Back',2},{'Img_Fenggexian','Ani/ReturnBg/Img_Fenggexian',2},{'Btn_Help','Ani/ReturnBg/Btn_Help',2},{'arrow_right','arrow_right',2},{'arrow_queer','arrow_queer',2},
        -- TextMeshProUGUI 列表
        {'txt_time','Ani/Scroll/Huiguiitem/img_daojudi_H/img_time/txt_time',20},{'txt_iconname','Ani/Scroll/Huiguiitem/img_daojudi_H/bg_name/txt_iconname',20},{'txt_time01','Ani/Scroll/Huiguiitem/img_daojudi/img_time/txt_time',20},{'txt_iconname01','Ani/Scroll/Huiguiitem/img_daojudi/bg_name/txt_iconname',20},{'txt_time02','Ani/Huiguiitem_1/img_daojudi_H/img_time/txt_time',20},{'txt_iconname02','Ani/Huiguiitem_1/img_daojudi_H/bg_name/txt_iconname',20},{'txt_time03','Ani/Huiguiitem_1/img_daojudi/img_time/txt_time',20},{'txt_iconname03','Ani/Huiguiitem_1/img_daojudi/bg_name/txt_iconname',20},{'txt_time04','Ani/Huiguiitem_2/img_daojudi_H/img_time/txt_time',20},{'txt_iconname04','Ani/Huiguiitem_2/img_daojudi_H/bg_name/txt_iconname',20},{'txt_time05','Ani/Huiguiitem_2/img_daojudi/img_time/txt_time',20},{'txt_iconname05','Ani/Huiguiitem_2/img_daojudi/bg_name/txt_iconname',20},{'txt_time06','Ani/Huiguiitem_3/img_daojudi_H/img_time/txt_time',20},{'txt_iconname06','Ani/Huiguiitem_3/img_daojudi_H/bg_name/txt_iconname',20},{'txt_time07','Ani/Huiguiitem_3/img_daojudi/img_time/txt_time',20},{'txt_iconname07','Ani/Huiguiitem_3/img_daojudi/bg_name/txt_iconname',20},{'Text_qipaozi','Ani/img_qipao/Text_qipaozi',20},{'Text_Title_CN','Ani/ReturnBg/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/ReturnBg/Text_Title/Text_Title_EN',20},
    }
end
-- Code Auto Create End
-- local cjson = require "cjson"
require("LocalData/ReturnsigninLocalData")
function M:OnInit()
    self.FlagIndex = 1 --当前显示索引
    self.AwardList  = {} --奖励列表
    self.Touch = false

    self.objList = {
        [1] = self.Huiguiitem_1(),
        [2] = self.Huiguiitem_2(),
        [3] = self.Huiguiitem_3()
    }
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        MgrTimer.Cancel("SignBackUpdate")
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end))
    --返回主页
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, function()
        MgrTimer.Cancel("SignBackUpdate")
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end)

    --左箭头
    UIEvent.LuaClick(self.arrow_queer().gameObject, function()
        if self.FlagIndex >= 2  then
            self.FlagIndex = self.FlagIndex - 1
            self:RefreshAward()
            self:RefreshPageBtn()
        end
    end)
    --右箭头
    UIEvent.LuaClick(self.arrow_right().gameObject, function()
        if self.FlagIndex <= #self.AwardList - 3  then
            self.FlagIndex = self.FlagIndex + 1
            self:RefreshAward()
            self:RefreshPageBtn()
        end
    end)


    self:InitAward()
    self:RefreshIndex()
    self:RefreshAward()
    self:RefreshPageBtn()
    self:TouchUpdate()

    MgrTimer.AddDelayNoName(0.5,function() self.Touch = true end,nil)
end

--刷新切页按钮
function M:RefreshPageBtn()
    if self.FlagIndex <= 1 then
        self.arrow_queer().gameObject:SetActive(false)
        self.arrow_right().gameObject:SetActive(true)
    elseif self.FlagIndex >= #self.AwardList - 2 then
        self.arrow_queer().gameObject:SetActive(true)
        self.arrow_right().gameObject:SetActive(false)
    else
        self.arrow_queer().gameObject:SetActive(true)
        self.arrow_right().gameObject:SetActive(true)
    end
end

--刷新索引
function M:RefreshIndex()
    --初始化索引
    local value = PlayerControl.GetPlayerData().regression
    local state = 1 --1:可领取 2：已领取 3：不可领取

    local info = RapidJson.decode(value.RewardIDS)
    local awardDays = {}
    for i, v in pairs(info) do
        table.insert(awardDays,i)
    end

    if #awardDays + 1 <= #self.AwardList - 2 then
        self.FlagIndex = #awardDays + 1
    else
        self.FlagIndex = #self.AwardList - 2
    end
end


--初始化奖励
function M:InitAward()
    for k, j in ipairs(ReturnsigninLocalData.tab) do
        local t = {}
        t.award =  j.reward
        t.day = k
        table.insert(self.AwardList,t)
    end
end

--刷新奖励
function M:RefreshAward()
    if #self.AwardList < self.FlagIndex + 2 then
        --超出索引
        return
    end
    for i, v in ipairs(self:GetCurrentList(self.FlagIndex)) do
        local img_daojudi = CJNUIMgr.GetSunUseName(self.objList[i].gameObject, "img_daojudi")  --self.objList[i]
        local img_daojudi_H = CJNUIMgr.GetSunUseName(self.objList[i].gameObject, "img_daojudi_H")  --self.objList[i]

        local icon = CJNUIMgr.GetSunUseName(img_daojudi, "icon"):GetComponent("Image")
        local icon_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "icon"):GetComponent("Image")

        local txt_time = CJNUIMgr.GetSunUseName(img_daojudi.gameObject, "txt_time"):GetComponent("TextMeshProUGUI")
        local txt_time_H = CJNUIMgr.GetSunUseName(img_daojudi_H.gameObject, "txt_time"):GetComponent("TextMeshProUGUI")

        local txt_iconname = CJNUIMgr.GetSunUseName(img_daojudi.gameObject, "txt_iconname"):GetComponent("TextMeshProUGUI")
        local txt_iconname_H = CJNUIMgr.GetSunUseName(img_daojudi_H.gameObject, "txt_iconname"):GetComponent("TextMeshProUGUI")
        --遮罩
        local mask = CJNUIMgr.GetSunUseName(img_daojudi, "mask")
        local mask_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "mask")

        --完成
        local Img_wancheng = CJNUIMgr.GetSunUseName(img_daojudi, "Img_wancheng")
        local Img_wancheng_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "Img_wancheng")
        --锁
        local img_suo = CJNUIMgr.GetSunUseName(img_daojudi, "img_suo")
        local img_suo_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "img_suo")

        local light = CJNUIMgr.GetSunUseName(img_daojudi, "light")
        local light_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "light")

        local quality = CJNUIMgr.GetSunUseName(img_daojudi, "quality")
        local quality_H = CJNUIMgr.GetSunUseName(img_daojudi_H, "quality")

        local str = string.split(v.award,'_')
        local ItemData = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
        ---获取图标
        MgrRes.LoadSprite(icon,ItemData.icon)
        MgrRes.LoadSprite(icon_H,ItemData.icon)

        txt_time.text = "0".. v.day
        txt_time_H.text = "0" ..v.day

        txt_iconname.text = ItemData.name .. "x" ..str[3]
        txt_iconname_H.text = ItemData.name .. "x" ..str[3]


        local state = self:GetAwardState(v.day)
        --ItemData.quality  quality
        MgrRes.LoadSprite(quality.transform:GetComponent("Image"),"SignBack/img_daojudi_" .. ItemData.quality)
        MgrRes.LoadSprite(quality_H.transform:GetComponent("Image"),"SignBack/img_daojudi_" .. ItemData.quality)
        --img_kelingqu_2
        if state == 1 then
            mask:SetActive(false)
            mask_H:SetActive(false)

            light:SetActive(true)
            light_H:SetActive(true)

            MgrRes.LoadSprite(light.transform:GetComponent("Image"),"SignBack/img_kelingqu_" .. ItemData.quality)
            MgrRes.LoadSprite(light_H.transform:GetComponent("Image"),"SignBack/img_kelingqu_" .. ItemData.quality)

            UIEvent.ClearFun(self.objList[i].gameObject)
            UIEvent.LuaClick(self.objList[i].gameObject, Handle(self, function()
                self:RecieveSignReward(v.day)
            end))
        elseif state == 2 then
            mask:SetActive(true)
            mask_H:SetActive(true)

            Img_wancheng:SetActive(true)
            Img_wancheng_H:SetActive(true)

            img_suo:SetActive(false)
            img_suo_H:SetActive(false)

            light:SetActive(false)
            light_H:SetActive(false)
        elseif state == 3 then
            mask:SetActive(true)
            mask_H:SetActive(true)

            Img_wancheng:SetActive(false)
            Img_wancheng_H:SetActive(false)

            img_suo:SetActive(true)
            img_suo_H:SetActive(true)

            light:SetActive(false)
            light_H:SetActive(false)
        end
    end
end

--获得奖励状态
function M:GetAwardState(day)
    local value = PlayerControl.GetPlayerData().regression
    local state = 1 --1:可领取 2：已领取 3：不可领取

    local info = RapidJson.decode(value.RewardIDS)
    local awardDays = {}
    for i, v in pairs(info) do
        table.insert(awardDays,i)
    end
    if day > value.RewardCount then --大于上线次数为不可领取
        return 3
    end

    local str = string.split(value.RewardIDS,',') --暂时这样分割字符串
    for i, v in ipairs(awardDays) do
        if tonumber(v) == day then
            return 2
        end
    end
    return 1
end


--当前显示的列表数据
function M:GetCurrentList()
    local list = {}
    for i = self.FlagIndex, self.FlagIndex + 2, 1 do
        table.insert(list,self.AwardList[i])
    end
    return list
end

--领取签到奖励
function M:RecieveSignReward(_id)
    local ClientRegressionSignAwardREQ  =
    {
        id = {_id}
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientRegressionSignAwardREQ',ClientRegressionSignAwardREQ))
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_REGRESSION_SIGN_AWARD_REQ,bytes,0,nil,
    function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientRegressionSignAwardACK',buffer))
        if tab.errNo ~= 0 then
            --MgrUI.Pop(UID.PopTip_UI,{"不是回归用户",1},true)
        end
    end,function(buffer, tag)
        local tab = assert(pb.decode('PBClient.ClientRegressionSignAwardNTF',buffer))
        if tab.Goods then
            ---将奖励推送进背包
            ItemControl.PushGroupItemData(tab.Goods,ItemControl.PushEnum.add)
            ---弹出奖励弹窗
            MgrUI.Pop(UID.ItemAchievePop_UI,{tab.Goods},true)
            ---刷新背包缓存数据
            BagViewModel.ReloadCacheData()
        else
            --MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("passportcontrol_tips3"),2},true)
        end

        if tab.regression then
            PlayerControl.GetPlayerData().regression = tab.regression
            self:RefreshAward()
            ActivityControl.CheckSignBackRedDot()
        end
    end
    )
end
--回归签到触控
function M:TouchUpdate()
    local touchDistance = tonumber(SteamLocalData.tab[113005][2])
    Input.multiTouchEnabled = true
    local isTouch = false
    local startPos = 0
    local endPos = 0
    local Distance = 0
    MgrTimer.AddRepeat("SignBackUpdate",0,function ()
        if self.Touch == false then
            return
        end
        if isTouch == true then
            if Input.touchCount <= 0 then return end

            local t = Input.touches[0]
            if 1 == Input.touchCount then   --单指触摸
                if t.phase == TouchPhase.Began then
                    startPos = t.position
                end

                if t.phase == TouchPhase.Moved then
                    --Distance = Vector2.Distance(Vector2(t.position.x,0), Vector2(startPos.x,0))
                end

                if t.phase == TouchPhase.Ended then
                    endPos = t.position.x
                    Distance = Vector2.Distance(Vector2(t.position.x,0), Vector2(startPos.x,0))
                    if  Distance < touchDistance then
                        return
                     end
                    if Distance > 0 then
                        --向右滑动
                        if self.FlagIndex >= 2  then
                            self.FlagIndex = self.FlagIndex - 1
                            self:RefreshAward()
                            self:RefreshPageBtn()
                        end
                    else
                        --向左滑动
                        if self.FlagIndex <= #self.AwardList - 3  then
                            self.FlagIndex = self.FlagIndex + 1
                            self:RefreshAward()
                            self:RefreshPageBtn()
                        end
                    end
                end
            end
        end

        if isTouch == false then
            --电脑鼠标触控
            if Input.GetMouseButtonDown(0) then
                startPos = 0
                endPos = 0
                startPos = Input.mousePosition.x
            end

            if Input.GetMouseButtonUp(0) then
                endPos = Input.mousePosition.x
                local value = endPos - startPos
                if  math.abs(value) < touchDistance then
                    startPos = 0
                    endPos = 0
                    return
                end
                if value > 0 then
                    --向右滑动
                    if self.FlagIndex >= 2  then
                        self.FlagIndex = self.FlagIndex - 1
                        self:RefreshAward()
                        self:RefreshPageBtn()
                    end
                else
                    if self.FlagIndex <= #self.AwardList - 3  then
                        self.FlagIndex = self.FlagIndex + 1
                        self:RefreshAward()
                        self:RefreshPageBtn()
                    end
                end
                startPos = 0
                endPos = 0
            end
        end
    end)
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end

return M