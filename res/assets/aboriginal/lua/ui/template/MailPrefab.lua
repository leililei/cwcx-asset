-- Code Auto Create Begin
local M = Class('MailPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/MailPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MailPrefab','/',2},{'NewMail','MailRoot/NewMail',2},{'MailReaded','MailRoot/MailReaded',2},{'ItemPanel','MailRoot/ItemPanel',2},{'ItemKuangImg','MailRoot/ItemPanel/ItemKuangImg',2},{'Img_Xingdi','MailRoot/ItemPanel/Img_Xingdi',2},{'ItemIcon','MailRoot/ItemPanel/ItemIcon',2},{'VFXItemIcon','MailRoot/ItemPanel/VFXItemIcon',2},{'ItemCountBg','MailRoot/ItemPanel/ItemCountBg',2},{'ItemTimeBg','MailRoot/ItemPanel/ItemTimeBg',2},{'shijianicon','MailRoot/ItemPanel/ItemTimeBg/shijianicon',2},{'StarPrefab','MailRoot/ItemPanel/StarPrefab',2},{'EmptyStarPanel','MailRoot/ItemPanel/EmptyStarPanel',2},{'Img_Xing(hui)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui)',2},{'Img_Xing(hui)(1)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui) (1)',2},{'Img_Xing(hui)(2)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui) (2)',2},{'Img_Xing(hui)(3)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui) (3)',2},{'Img_Xing(hui)(4)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui) (4)',2},{'Img_Xing(hui)(5)','MailRoot/ItemPanel/EmptyStarPanel/Img_Xing(hui) (5)',2},{'StarPanel','MailRoot/ItemPanel/StarPanel',2},{'RewardRecievedImg','MailRoot/ItemPanel/RewardRecievedImg',2},{'HeadPanel','MailRoot/HeadPanel',2},{'Img_HeadMask','MailRoot/HeadPanel/Img_HeadMask',2},{'HeadIcon','MailRoot/HeadPanel/Img_HeadMask/HeadIcon',2},{'Img_HeadFrame','MailRoot/HeadPanel/Img_HeadFrame',2},{'RedDotIcon','MailRoot/RedDotIcon',2},{'SelectKuangImg','SelectKuangImg',2},{'MailClickArea','MailClickArea',2},
        -- UITemplate 列表
        {'MailPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'ItemCountTxt','MailRoot/ItemPanel/ItemCountBg/ItemCountTxt',20},{'Text_Time','MailRoot/ItemPanel/ItemTimeBg/Text_Time',20},{'RecievedTxt','MailRoot/ItemPanel/RewardRecievedImg/RecievedTxt',20},{'MailTitleTxt','MailTitleTxt',20},{'RestDateTxt','RestDateTxt',20},{'SendDateTxt','SendDateTxt',20},
    }
end
-- Code Auto Create End
require("LocalData/MailLocalData")
function M:OnInit()
    self.StarPrefab().gameObject:SetActive(false)
    self.RewardRecievedImg().gameObject:SetActive(false)
    self.HeadCanvasGroup = self.HeadPanel().transform:GetComponent("CanvasGroup")
    self.HeadCanvasGroup.alpha = 1
end
function M:OnUpdateUI(pData)
    ---@type MailData
    self.data = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
  
    local mainBirthday = MailLocalData.tab[self.data.id]

    local overdueTime = nil
    if self.data.eTime == 0 then
        overdueTime = MgrLanguageData.GetLanguageByKey("newpostmail_ui_indefinite")
    else
        --overdueTime = PostMailViewModel.TimeDiff(os.time(),self.data.eTime,0)   --算日期
        local time = Global.GetCurTime()
        local overtime = self.data.eTime - Global.GetCurTime()
        overdueTime = math.floor((self.data.eTime - Global.GetCurTime())/86400)
        if overdueTime == 0 then
            local xx = PostMailViewModel.GetLastTime(self.data.eTime)
            self.hour = math.floor(xx%86400/3600)
            self.min = math.ceil(xx%86400%3600/60)
        end
    end
   
    if self.data.eTime and self.data.eTime~=0 then
        self.SendDateTxt().text= os.date(MgrLanguageData.GetLanguageByKey("mailprefab_time"),self.data.gTime)
        if overdueTime == 0 then
            if self.hour == 0 then
                --if self.min == 0 then -- overtime
                local overtime = self.data.eTime - Global.GetCurTime()
                if overtime <= 0 then
                    self.MailPrefab().gameObject:SetActive(false)
                else
                    self.RestDateTxt().text= "<color=#3BFCDF>"..math.floor(self.min).."</color>"..MgrLanguageData.GetLanguageByKey("mailprefab_expire_min")
                end
            else
                self.RestDateTxt().text= "<color=#3BFCDF>"..math.floor(self.hour).."</color>"..MgrLanguageData.GetLanguageByKey("mailprefab_expire_hour")
            end
        else
            if math.floor(overdueTime) < 0 then --过期邮显示已过期
                self.RestDateTxt().text= "<color=#3BFCDF>"..MgrLanguageData.GetLanguageByKey("ui_qita_text118").."</color>"
            else
                self.RestDateTxt().text= "<color=#3BFCDF>"..math.floor(overdueTime).."</color>"..MgrLanguageData.GetLanguageByKey("mailprefab_expire_day")
            end
            --self.RestDateTxt().text= "<color=#3BFCDF>"..MgrLanguageData.GetLanguageByKey("ui_qita_text118").."</color>"
        end
    else
        self.SendDateTxt().text= os.date(MgrLanguageData.GetLanguageByKey("mailprefab_time"),self.data.gTime)
        if type(overdueTime) == "string" then
            self.RestDateTxt().text= overdueTime
        else
            self.RestDateTxt().text= math.floor(overdueTime)
        end
    end
    --生日邮件不显示获得日期
    if mainBirthday then
        self.RestDateTxt().text = MgrLanguageData.GetLanguageByKey("ui_qita_text153")
        self.SendDateTxt().gameObject:SetActive(false)
    end

    if string.match(self.data.title,MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips1")) then
        self.MailTitleTxt().text= MgrLanguageData.GetLanguageByKey("newpostmail_ui_monthcard_tips1").."（"..MgrLanguageData.GetLanguageByKey("eventshopitem_surplus").."："..self.data.emailParam..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky").."）"
    else
        self.MailTitleTxt().text=self.data.title
    end

    --生日邮件读表显示用邮件名称
    if mainBirthday then
        self.MailTitleTxt().text=mainBirthday.title
    end

    ---是否显示头像
    if self.data.headIcon == "0" or self.data.headIcon == "" then
        self.Img_HeadMask().gameObject:SetActive(false)
        self.Img_HeadFrame().gameObject:SetActive(false)
        self.ItemPanel().gameObject:SetActive(true)
        ---是否显示物品
        if self.data.goods then
            if self.data.eTime == 0 then
                self.Text_Time().text = overdueTime
            else
                self.Text_Time().text = overdueTime..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
            end
            self:InitRewardById(self.data.goods[1].goodsType,self.data.goods[1].goodsID,self.data.goods[1].goodsNum,self.ItemIcon(),self.ItemKuangImg(),self.ItemCountTxt(),self.StarPanel().gameObject,self.EmptyStarPanel().gameObject,self.Img_Xingdi().gameObject)
        else
            self.ItemPanel().gameObject:SetActive(false)
            self.Img_HeadMask().gameObject:SetActive(true)
            self.Img_HeadFrame().gameObject:SetActive(true)
            MgrRes.LoadQIconNotAni(self.HeadIcon(),90000,nil,true)
        end
    else
        self.ItemPanel().gameObject:SetActive(false)
        self.Img_HeadMask().gameObject:SetActive(true)
        self.Img_HeadFrame().gameObject:SetActive(true)

        MgrRes.LoadQIconNotAni(self.HeadIcon(),self.data.headIcon,nil,true)
        -- if self.data.headtype == 2 then
        --     MgrRes.LoadQIcon(self.HeadIcon(),self.data.headIcon)
        -- else
        --     MgrRes.LoadSprite(self.HeadIcon(),"HeadIcon/"..self.data.headIcon)
        -- end
    end

    --生日邮件头像读表
    if mainBirthday then
        self.ItemPanel().gameObject:SetActive(false)
        self.Img_HeadMask().gameObject:SetActive(true)
        self.Img_HeadFrame().gameObject:SetActive(true)

        MgrRes.LoadQIconNotAni(self.HeadIcon(),mainBirthday.head,nil,true)
        -- if mainBirthday.headtype == 2 then
        --     MgrRes.LoadQIcon(self.HeadIcon(),mainBirthday.head)
        -- else
        --     MgrRes.LoadSprite(self.HeadIcon(),"HeadIcon/"..mainBirthday.head)
        -- end
        --MgrRes.LoadNormalIcon(self.HeadIcon(),90000)
    end

    --更新是否已读UI信息
    if self.data.status == 0 then
        -- 未读
        self.NewMail().gameObject:SetActive(true)
        self.MailReaded().gameObject:SetActive(false)
        self.RewardRecievedImg().gameObject:SetActive(false)
        self.RedDotIcon().gameObject:SetActive(true)
    elseif self.data.status == 1 then
        -- 已读
        if self.data.goods then
            self.NewMail().gameObject:SetActive(true)
            self.MailReaded().gameObject:SetActive(false)
            self.RewardRecievedImg().gameObject:SetActive(false)
            self.RedDotIcon().gameObject:SetActive(false)
        else
            self.NewMail().gameObject:SetActive(false)
            self.MailReaded().gameObject:SetActive(true)
            self.RewardRecievedImg().gameObject:SetActive(false)
            self.RedDotIcon().gameObject:SetActive(false)
        end
    elseif self.data.status == 2 then
        -- 已领取
        self.RewardRecievedImg().gameObject:SetActive(true)
        self.NewMail().gameObject:SetActive(false)
        self.MailReaded().gameObject:SetActive(true)
        self.RedDotIcon().gameObject:SetActive(false)
        self.HeadCanvasGroup.alpha = 0.5
    end

    --生日邮件红点
    if mainBirthday then
        --local isNew = UnityEngine.PlayerPrefs.GetString(string.format(PlayerControl.GetPlayerData().UID .. "MailBirthday%s",mainBirthday.id))
        -- if isNew == "" and self.index ~= 1 then
        --     self.RedDotIcon().gameObject:SetActive(true)
        -- else
        --     self.RedDotIcon().gameObject:SetActive(false)
        -- end
        if self.index ~= 1 then
            local isRead = PostMailViewModel.GetIsReadMailBirthday(mainBirthday.id)
            self.RedDotIcon().gameObject:SetActive(not isRead)
        else
            self.RedDotIcon().gameObject:SetActive(false)
            PostMailViewModel.SetMailBirthdayRedDotCaChe(mainBirthday.id)
        end
        --生日邮件邮件信息赋值
        self.data.title = mainBirthday.title
        self.data.name = mainBirthday.name
        self.data.content = mainBirthday.txt
    end

    if self.data.isSelect then
        self.SelectKuangImg().gameObject:SetActive(true)
    else
        self.SelectKuangImg().gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.ObjRoot,Handle(self,function ()
        self.parent:OnClickMail(self.data,self.index,overdueTime)
       if mainBirthday then
            --UnityEngine.PlayerPrefs.SetString(string.format(PlayerControl.GetPlayerData().UID .. "MailBirthday%s",mainBirthday.id),mainBirthday.id)
            PostMailViewModel.SetMailBirthdayRedDotCaChe(mainBirthday.id)
            self.RedDotIcon().gameObject:SetActive(false)
       end
    end))
end


--更新一个物品信息
function M:InitRewardById(_ItemIdType,_ItemId,_Count,_Icon,_RankIcon,_CountTxt,_StartPanel,EmptyStarPanel,XingDi)
    -- statements
    ---@type ItemData
    local item = ItemControl.GetItemByType(_ItemIdType,_ItemId)
    if item == nil  then
        return
    end

    if item.anime and item.anime ~= "0" then
        Tools.ClearAllChild(self.VFXItemIcon().gameObject)
        _Icon.gameObject:SetActive(false)
        self.vfx_path = "ABOriginal/VFX/Prefab/Badge_Prefab/VFX_Prefeb/"
        MgrRes.GetPrefab(self.vfx_path..item.anime..".prefab",function(Obj)
            if Obj == nil then return end
            Obj.transform:SetParent(self.VFXItemIcon().gameObject.transform)
            Obj.transform.localPosition = Vector3.zero
            Obj.transform.localScale = Vector3(19,19,1)
        end)
    else
        Tools.ClearAllChild(self.VFXItemIcon().gameObject)
        _Icon.gameObject:SetActive(true)
        MgrRes.LoadSprite(_Icon,"Item/"..item.icon)
    end

    MgrRes.LoadSprite(_RankIcon,"Item/Rank/ItemRank_"..item.quality)
    _CountTxt.text= JNStrTool.numberAbbr(_Count) -- "".. (_Count >= 10000 and math.floor(tonumber(_Count)/1000).."K" or _Count)
    if item.itemstar > 0 then
        _StartPanel:SetActive(true)
        EmptyStarPanel:SetActive(true)
        XingDi:SetActive(true)
        self:InitStar(_StartPanel,self.StarPrefab().gameObject,item.itemstar)
    else
        _StartPanel:SetActive(false)
        EmptyStarPanel:SetActive(false)
        XingDi:SetActive(false)
    end
end

--创建星星
function M:CreatStar(_Root,_Prefab)
    local tempObj= GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x,tempObj.transform.localPosition.y,0)
end
--初始化星星
function M:InitStar(_Root,_Prefab,_Count)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end

return M