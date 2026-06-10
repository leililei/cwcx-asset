-- Code Auto Create Begin
local M = Class('RoleCampItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/RoleCampItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'RoleCampItem','/',2},{'BG','BG',2},{'Img_Logodi','BG/Img_Logodi',2},{'CampIcon','BG/CampIcon',2},{'CampIconName','BG/CampIcon/CampIconName',2},{'guang','BG/guang',2},{'Img_Jiaobiao','BG/Img_Jiaobiao',2},{'Img_Xunzhangmingdi','BG/Img_Xunzhangmingdi',2},{'MedalIcon','BG/MedalIcon',2},{'Achive','BG/Achive',2},{'EffectBG','EffectBG',2},{'Img_Jibanxiaoguodi','EffectBG/Img_Jibanxiaoguodi',2},{'Process3','EffectBG/Process3',2},{'Img_Process3','EffectBG/Process3/Img_Process3',2},{'Reward3Root','EffectBG/Process3/Reward3Root',2},{'Process4','EffectBG/Process4',2},{'Img_Process4','EffectBG/Process4/Img_Process4',2},{'Reward4Root','EffectBG/Process4/Reward4Root',2},{'RewardPrefab','EffectBG/RewardPrefab',2},{'Goodicon','EffectBG/RewardPrefab/Goodicon',2},{'Img_Suo','EffectBG/Img_Suo',2},{'RolePrefab','RolePrefab',2},{'lihuiIcon','RolePrefab/lihuiIcon',2},{'Img_Zhezhaodi','RolePrefab/Img_Zhezhaodi',2},{'EmptyStarPanelRoot','RolePrefab/EmptyStarPanelRoot',2},{'EmptyGearStarPrefab','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab',2},{'EmptyGearStarPrefab(1)','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab (1)',2},{'EmptyGearStarPrefab(2)','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab (2)',2},{'EmptyGearStarPrefab(3)','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab (3)',2},{'EmptyGearStarPrefab(4)','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab (4)',2},{'EmptyGearStarPrefab(5)','RolePrefab/EmptyStarPanelRoot/EmptyGearStarPrefab (5)',2},{'StarPrefab','RolePrefab/StarPrefab',2},{'StarRoot','RolePrefab/StarRoot',2},{'OccupationIcon','RolePrefab/OccupationIcon',2},{'Img_Lihuidi','RolePrefab/Img_Lihuidi',2},{'kuang','RolePrefab/kuang',2},{'RoleRoot','RoleRoot',2},{'Btu_Received','Btu_Received',2},{'Img_Lingqudi2','Btu_Received/Img_Lingqudi2',2},{'Btu_Receive','Btu_Receive',2},{'Img_Lingqudi1','Btu_Receive/Img_Lingqudi1',2},{'RedDotIcon','Btu_Receive/RedDotIcon',2},
        -- Text 列表
        {'Text_MedalName','BG/Img_Xunzhangmingdi/Text_MedalName',3},{'Text_CampName','BG/Text_CampName',3},{'Text_title','BG/Achive/Text_title',3},{'Text_Jibanjiangli','EffectBG/Img_Jibanxiaoguodi/Text_Jibanjiangli',3},{'Text_Count','EffectBG/RewardPrefab/Text_Count',3},{'Text_Weikaifang','EffectBG/Img_Suo/Text_Weikaifang',3},{'Text_RoleNmae','RolePrefab/Text_RoleNmae',3},{'Text_Yilingqu','Btu_Received/Text_Yilingqu',3},{'Text_Lingqu1','Btu_Receive/Text_Lingqu1',3},
        -- Button 列表
        {'CampIconName01','BG/CampIcon/CampIconName',4},
        -- Slider 列表
        {'Process301','EffectBG/Process3',5},{'Process401','EffectBG/Process4',5},
        -- UITemplate 列表
        {'RoleCampItem01','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.RolePrefab().gameObject:SetActive(false)
    self.RewardPrefab().gameObject:SetActive(false)
    self.StarRoot().gameObject:SetActive(false)
end

function M:OnUpdateUI(pData)        ---pData角色信息
    local TeamList = pData[1]
    self.idx = pData[3]
    local metalStr = JNStrTool.strSplit("_",TeamList[8])
    local metalData = IllustrationViewModel.GetMedalById(tonumber(metalStr[2]))
    MgrRes.LoadSprite(self.MedalIcon(),"Item/"..metalData.icon)      ---加载角色图片
    --if ItemControl.GetItemByType(4,tonumber(metalStr[2])) then
    --if ItemControl.GetItemByIdAndType(tonumber(metalStr[2]),4) then
    --    self.Achive().gameObject:SetActive(true)
    --else
    --    self.Achive().gameObject:SetActive(false)
    --end
    self.Text_MedalName().text = metalData.name
    ---阵营名
    self.teamNmae = TeamList[3]
    ---阵营描述
    self.teamDes = TeamList[9]
    local heroidlist =JNStrTool.strSplit(",",TeamList[4])
    ---阵营照片顺序
    local heroPictureList = JNStrTool.strSplit(",",TeamList[10])
    local HeroPictureList = {}
    ---收集进度
    local process = 0
    ---角色列表
    local HeroList = {}
    ---阵营分组
    self.type = TeamList[2]
    --- 未领取奖励id列表
    local rewardList,allList = IllustrationViewModel.GetCampReward(self.type)
    for i, v in pairs(heroidlist) do
        table.insert(HeroList,HeroControl.GetRoleDataByID(tonumber(v)))
        if HeroList[#HeroList].lockState then
            process = process +1
        end
    end
    for i, v in pairs(heroPictureList) do
        table.insert(HeroPictureList,HeroControl.GetRoleDataByID(tonumber(v)))
    end

    if ItemControl.GetItemByIdAndType(tonumber(metalStr[2]),4) and #rewardList == 0 then
        self.Achive().gameObject:SetActive(true)
    else
        self.Achive().gameObject:SetActive(false)
    end

    self.parent = pData[2]
    --self.data = HeroList
    ---此顺序是在RoleCamp_UI显示的
    self.data = HeroPictureList

    
    MgrRes.LoadSprite(self.CampIcon(),"Attribute/"..HeroList[1].CampiconName)
    UIEvent.LuaClick(self.CampIcon().gameObject,Handle(self,self.TeamClick))
    UIEvent.LuaClick(self.CampIconName().gameObject,Handle(self,self.TeamClick))
    UIEvent.LuaClick(self.BG().gameObject,Handle(self,self.TeamClick))
    ---UIEvent.LuaClick(self.kuang().gameObject,Handle(self,self.OnClick))
    --Tools.ClearAllChild(self.RoleRoot().gameObject)
    if self.Text_CampName().text ~= TeamList[3] or self.Text_CampName().text == MgrLanguageData.GetLanguageByKey("rolecampitem_tips") then
        Tools.ClearAllChild(self.RoleRoot().gameObject)
        for i, v in pairs(HeroList) do
            local Obj = GameObject.Instantiate(self.RolePrefab().gameObject,self.RoleRoot().gameObject.transform,false)
            Obj:SetActive(true)
            local NameTxt = Obj.transform:Find("Text_RoleNmae"):GetComponent("TextMeshProUGUI")
            local OccupationIcon = Obj.transform:Find("OccupationIcon"):GetComponent("Image")
            local KuangImg = Obj.transform:Find("kuang"):GetComponent("Image")
            local StarPrefab = Obj.transform:Find("StarPrefab").gameObject
            local StarRoot = Obj.transform:Find("StarRoot").gameObject
            local lihuiIcon = Obj.transform:Find("lihuiIcon"):GetComponent("Image")
            local Img_Lihuidi = Obj.transform:Find("Img_Lihuidi").gameObject
            StarPrefab:SetActive(false)
            --根据初始星数创建星星
            for k = 1, HeroControl.GetOriginalHero(v.id).star do
                local starobj = GameObject.Instantiate(StarPrefab,StarRoot.transform,false)
                starobj:SetActive(true)
            end
            --根据新的星数创建界面星数
            --[[
            for k = 1, v.star do
                local starobj = GameObject.Instantiate(StarPrefab,StarRoot.transform,false)
                starobj:SetActive(true)
            end
            ]]
            Img_Lihuidi:SetActive(not v.lockState)
            --if v.lockState then
            --    Img_Lihuidi:SetActive(false)
            --    process = process +1
            --else
            --    Img_Lihuidi:SetActive(true)
            --end
            MgrRes.LoadSprite(OccupationIcon,v.iconCareer)
            MgrRes.LoadSprite(KuangImg,v.iconFrame)
            --MgrRes.LoadSprite(lihuiIcon,v.icon)
            MgrRes.LoadNormalIcon(lihuiIcon,v.id)
            local id = v.id
            NameTxt.text = v.name
            --UIEvent.LuaClick(lihuiIcon.gameObject,Handle(self, function() 
            --    local hero =  RoleData.New(id)
            --    local attr = hero:GetHeroAttr()
            --    hero.level = attr.LvMax
            --    hero.skillLevel = attr.SkillMaxLV
            --    hero.exp = BattleRole.ReturnExp(attr,attr.LvMax)
            --    MgrUI.Pop(UID.PopRoleInfo_UI,{hero},true)
            --end))
        end
    end
    self.Text_CampName().text = TeamList[3]
    
    if #heroidlist == 3 then
        self.Process3().gameObject:SetActive(true)
        self.Process4().gameObject:SetActive(false)
        self.Img_Suo().gameObject:SetActive(false)
        if process>=2 then
            self.Process301().wholeNumbers = true
            self.Process301().value = process - 1
        elseif process == 1 then
            self.Process301().wholeNumbers = false
            self.Process301().value = 0.5
        else
            self.Process301().wholeNumbers = true
            self.Process301().value = 0
        end
        self:UpdataRewardItem(self.Reward3Root().gameObject,allList)
    elseif #heroidlist == 4 then
        self.Process3().gameObject:SetActive(false)
        self.Process4().gameObject:SetActive(true)
        self.Img_Suo().gameObject:SetActive(false)
        if process>=2 then
            self.Process401().wholeNumbers = true
            self.Process401().value = process - 1
        elseif process == 1 then
            self.Process401().wholeNumbers = false
            self.Process401().value = 0.5
        else
            self.Process401().wholeNumbers = true
            self.Process401().value = 0
        end
        self:UpdataRewardItem(self.Reward4Root().gameObject,allList)
    elseif #heroidlist <3 then
        self.Process3().gameObject:SetActive(false)
        self.Process4().gameObject:SetActive(false)
        self.Img_Suo().gameObject:SetActive(true)
        self.Achive().gameObject:SetActive(false)
        process = nil
    end
    if process and process ~=0 and process ~= 1 then
        if #rewardList>0 then
            self.manualID = {}
            for i, v in pairs(rewardList) do
                if v[6] <= process then
                    table.insert(self.manualID,v[1])
                end
            end
            if #self.manualID > 0 then
                self.Btu_Received().gameObject:SetActive(false)
                self.Btu_Receive().gameObject:SetActive(true)
            else
                self.Btu_Received().gameObject:SetActive(true)
                self.Btu_Receive().gameObject:SetActive(false)
            end
        else
            self.Btu_Received().gameObject:SetActive(true)
            self.Btu_Receive().gameObject:SetActive(false)
        end
    else
        self.Btu_Received().gameObject:SetActive(false)
        self.Btu_Receive().gameObject:SetActive(false)
    end
    
    UIEvent.LuaClick(self.Btu_Receive().gameObject,Handle(self,self.ReceiveClick))
end

function M:TeamClick()
    self.parent:UpdataTeamInfo(self.data,self.teamNmae,self.teamDes)
    self.parent.CurTeamIndex = self.idx
end



function M:ReceiveClick()
    self.parent:AchieveManual(self.manualID)
end

function M:UpdataRewardItem(root,CampList)
    Tools.ClearAllChild(root)
    for i, v in pairs(CampList) do
        local Obj = GameObject.Instantiate(self.RewardPrefab().gameObject,root.transform,false)
        Obj:SetActive(true)
        local Goodicon =  Obj.transform:Find("Goodicon"):GetComponent("Image")
        local Text_Count =  Obj.transform:Find("Text_Count"):GetComponent("TextMeshProUGUI")
        local canvasGroup = Obj.transform:GetComponent("CanvasGroup")
        local strsp = JNStrTool.strSplit("_",v[7])
        local gooddata = ItemControl.GetItemByType(1,tonumber(strsp[2]))
        MgrRes.LoadSprite(Goodicon,"Item/"..gooddata.icon)
        if IllustrationViewModel.CheckReward(v[1]) then
            canvasGroup.alpha = 0.3
        else
            canvasGroup.alpha = 1
        end
        Text_Count.text ="X"..strsp[3]
    end
end
return M