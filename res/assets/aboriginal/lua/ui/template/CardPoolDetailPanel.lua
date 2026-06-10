-- Code Auto Create Begin
local M = Class('CardPoolDetailPanel', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/CardPoolDetailPanel.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_SSRbg','Img_SSRbg',2},{'StarPanel','Img_SSRbg/StarPanel',2},{'StarPregab_Xing1','Img_SSRbg/StarPanel/StarPregab_Xing1',2},{'StarPregab_Xing2','Img_SSRbg/StarPanel/StarPregab_Xing2',2},{'StarPregab_Xing3','Img_SSRbg/StarPanel/StarPregab_Xing3',2},{'StarPregab_Xing4','Img_SSRbg/StarPanel/StarPregab_Xing4',2},{'StarPregab_Xing5','Img_SSRbg/StarPanel/StarPregab_Xing5',2},{'CardPoolTipItem','CardPoolTipItem',2},{'Content','Content',2},{'Image_shuoming','Image_shuoming',2},{'Img_DesBg','Img_DesBg',2},
        -- UITemplate 列表
        {'CardPoolDetailPanel','/',10},{'CardPoolTipItem01','CardPoolTipItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Title','Text_Title',20},{'Text_SSRbability','Img_SSRbg/Text_SSRbability',20},{'Text_Shuoming','Image_shuoming/Text_Shuoming',20},{'Text_Des','Img_DesBg/Text_Des',20},
    }
end
-- Code Auto Create End
function M:OnUpdateUI(pData)
    self.pData = pData[1]
    self.parent = pData[2]
    print("cardpool===="..self.parent.cardInfo.cardType)
    if self.parent.cardInfo.cardType == 5 then
        if self.pData == 0 then
            self.Text_Title().gameObject:SetActive(false)
            self.Img_SSRbg().gameObject:SetActive(false)
            self.Image_shuoming().gameObject:SetActive(true)
            self.Img_DesBg().gameObject:SetActive(true)
            self:SeDesc()
            
            return
        end
        local Rank = self.pData
        self.pData = self.parent.cardInfo
        self.Img_SSRbg().gameObject:SetActive(true)
        self.Content().gameObject:SetActive(true)
        self.Image_shuoming().gameObject:SetActive(false)
        self.Img_DesBg().gameObject:SetActive(false)
      
        local heroList = self:GetFreeRoleInfo(self.pData.heroList,Rank)
        self:SetImgColor(Rank)
        self:SetStar(Rank - 1)
        self:UpdateItemList(heroList)
        self:SetProbability(Rank)
    else
        if self.pData.isExplain then--说明面板
            self.Text_Title().gameObject:SetActive(false)
            self.Img_SSRbg().gameObject:SetActive(false)
            self.Content().gameObject:SetActive(false)
            self.Image_shuoming().gameObject:SetActive(true)
            self.Img_DesBg().gameObject:SetActive(true)
            self:SeDesc()
        else
            self.Text_Title().gameObject:SetActive(self.pData.star == 4)
            self.Img_SSRbg().gameObject:SetActive(true)
            self.Content().gameObject:SetActive(true)
            self.Image_shuoming().gameObject:SetActive(false)
            self.Img_DesBg().gameObject:SetActive(false)

            self:SetImgColor(self.pData.star)
            self:SetStar(self.pData.star - 1)
            self:SetProbability(self.pData.star)
            self:UpdateItemList(self.pData.list)
        end
    end
end

--卡池说明内容
function M:SeDesc()
    local t = ""
    if self.parent.cardInfo.cardType == 1 or self.parent.cardInfo.cardType == 3 or self.parent.cardInfo.cardType == 5 then
        t = self.parent.config_Role[self.parent.cardInfo.id][20]
    else
        t = self.parent.config_Equip[self.parent.cardInfo.id][13]
    end
    self.Text_Des().text = t
    Tools.ReContentSizeGroup(self.ObjRoot)
end

--设置顶部条颜色 4：橙色 3：紫色 2：蓝色
function M:SetImgColor(type)
    if type == 4 then
        self.Img_SSRbg().color = Color(0.831,0.376,0.247,1)
    elseif type == 3 then
        self.Img_SSRbg().color = Color(0.407,0.247,0.831,1)
    elseif type == 2 then
        self.Img_SSRbg().color = Color(0.247,0.454,0.831,1)
    end
end

--设置顶部条颜色 4：橙色 3：紫色 2：蓝色
function M:SetItemFrameColor(item,star)
    local img = item.gameObject:GetComponent("Image")
    if star == 4 then
        img.color = Color(0.831,0.376,0.247,1)
    elseif star == 3 then
        img.color = Color(0.407,0.247,0.831,1)
    elseif star == 2 then
        img.color  = Color(0.247,0.454,0.831,1)
    end
end

--设置星级
function M:SetStar(num)
    self.StarPregab_Xing1().gameObject:SetActive(num >= 1)
    self.StarPregab_Xing2().gameObject:SetActive(num >= 2)
    self.StarPregab_Xing3().gameObject:SetActive(num >= 3)
    self.StarPregab_Xing4().gameObject:SetActive(num >= 4)
    self.StarPregab_Xing5().gameObject:SetActive(num >= 5)
end

--设置概率 (4:SSR 3:SR 2:R)
function M:SetProbability(type)
    if type == 4 then
        self.Text_SSRbability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text136") .. self:SplitRoleAndEquip(type)
    elseif type == 3 then
        self.Text_SSRbability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text137") .. self:SplitRoleAndEquip(type)
    elseif type == 2 then
        self.Text_SSRbability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text138") .. self:SplitRoleAndEquip(type)
    end
end

--解析装备和角色字符串
function M:SplitRoleAndEquip(type)
    return (self:GetPoolWeight(type) * 100) .."%"
end

--获得当前卡池权重数
function M:GetPoolWeight(type)
    local array = self:GetPoolWeightData()
    local weight = 0
    local cardWeight = 0
    for i, v in ipairs(array) do
        local temp = string.split(v,'_')
        if type == tonumber(temp[1]) then
            cardWeight = tonumber(temp[3])
        end
        weight = weight + tonumber(temp[3])
    end
    return cardWeight / weight
end

--获得卡池权重数据
function M:GetPoolWeightData()
    local str
    if self.parent.cardInfo.cardType == 1 or self.parent.cardInfo.cardType == 3 or self.parent.cardInfo.cardType == 5 then
        str = self.parent.config_Role[self.parent.cardInfo.id][3]
    else
        str = self.parent.config_Equip[self.parent.cardInfo.id][3]
    end
     return string.split(str,',')
end

--生成子物体对象列表
function M:UpdateItemList(list)
    self.CardPoolTipItem().gameObject:SetActive(false)
    Tools.ClearAllChild(self.Content().gameObject)
    for i, v in ipairs(list) do
        local item = GameObject.Instantiate(self.CardPoolTipItem().gameObject, self.Content().gameObject.transform, false)

        item.transform:Find("Role").gameObject:SetActive(self.parent.cardInfo.cardType == 1 or self.parent.cardInfo.cardType == 3 or self.parent.cardInfo.cardType == 5)
        item.transform:Find("VoidGear").gameObject:SetActive(self.parent.cardInfo.cardType == 2)

        if self.parent.cardInfo.cardType == 1 or self.parent.cardInfo.cardType == 3 then
            local roleID = tonumber(string.split(v,'_')[2])
            local heroData = HeroControl.GetRoleDataByID(roleID)
            item.transform:Find("Probability/Text_Probability").transform:GetComponent("TextMeshProUGUI").text = (math.floor(self:GetRoleProbability(roleID) *  self:GetPoolWeight(self.pData.star) * 10000) * 0.01) .. "%"
    
            MgrRes.LoadQIcon(item.transform:Find("Role/Panel/Icon_Head"):GetComponent("Image"),heroData.id)
            MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Frame"):GetComponent("Image"),heroData.iconBattleFrame)
            MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Career"):GetComponent("Image"),heroData.iconCareer)
    
            item.transform:Find("Role/Panel/Text_Level").transform:GetComponent("TextMeshProUGUI").text = heroData.level
            item.transform:Find("Role/RoleNamelText").transform:GetComponent("TextMeshProUGUI").text = heroData.name
            self:SetItemFrameColor(item,self.pData.star)
        elseif self.parent.cardInfo.cardType == 5 then
            --local roleID = tonumber(string.split(v,'_')[2])
            local heroData = v.roleData
            --item.transform:Find("Probability/Text_Probability").transform:GetComponent("TextMeshProUGUI").text = (math.floor(self:GetRoleProbability(roleID) *  self:GetPoolWeight() * 10000) * 0.01) .. "%"
            item.transform:Find("Probability/Text_Probability").transform:GetComponent("TextMeshProUGUI").text = string.format("%.2f",v.props/100) .. "%"

            MgrRes.LoadQIcon(item.transform:Find("Role/Panel/Icon_Head"):GetComponent("Image"),heroData.id)
            MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Frame"):GetComponent("Image"),heroData.iconBattleFrame)
            MgrRes.LoadSprite(item.transform:Find("Role/Panel/Icon_Career"):GetComponent("Image"),heroData.iconCareer)

            item.transform:Find("Role/Panel/Text_Level").transform:GetComponent("TextMeshProUGUI").text = heroData.level
            item.transform:Find("Role/RoleNamelText").transform:GetComponent("TextMeshProUGUI").text = heroData.name
            self:SetItemFrameColor(item,heroData.rank)
        else
            local equipID = tonumber(string.split(v,'_')[2])
            local _RoleEquip = RoleequipmentLocalData.tab[equipID]
            MgrRes.LoadSprite(item.transform:Find("VoidGear/jijiadi/VoidGearIconImg"):GetComponent("Image"),"Equip/".._RoleEquip[4])
            MgrRes.LoadSprite(item.transform:Find("VoidGear/VoidRankKuangImg"):GetComponent("Image"),"Quality/GearRankKuang_".._RoleEquip[6])
            item.transform:Find("VoidGear/VoidGearNamelText").transform:GetComponent("TextMeshProUGUI").text = _RoleEquip[2]
            item.transform:Find("Probability/Text_Probability").transform:GetComponent("TextMeshProUGUI").text = (math.floor(self:GetRoleProbability(equipID) *  self:GetPoolWeight(self.pData.star) * 10000) * 0.01) .. "%"
            self:SetItemFrameColor(item,self.pData.star)
        end
        Tools.ReContentSizeGroup(self.Content().gameObject)
        item.gameObject:SetActive(true)
    end
    Tools.ReContentSizeGroup(self.parent.Content().gameObject)
end

--获得当前角色概率
function M:GetRoleProbability(roleID)
    --local data = DropLocalData.tab[self:GetDropID()]
    local t = NormalCardDrawViewModel.CardDropList[self:GetDropID()]
    local str = string.split(t,',')
    local weight = 0
    local curWeight = 0
    for i, v in ipairs(str) do
        local temp = string.split(v,'_')
        if roleID == tonumber(temp[2]) then
            curWeight = tonumber(temp[4])
        end
        weight = weight + tonumber(temp[4])
    end
    return curWeight / weight
end

--获得当前卡池掉落id
function M:GetDropID()
    local array = self:GetPoolWeightData()
    for i, v in ipairs(array) do
        local temp = string.split(v,'_')
        local index = tonumber(temp[1])
        if self.pData.star == index then
            return tonumber(temp[2])
        end
    end
    return nil
end

---获取自选卡池阶段角色
function M:GetFreeRoleInfo(_list, _rank)
    local list = {}
    for i, v in ipairs(_list) do
        local roleD = HeroControl.GetRoleDataByID(v.roleID)
        if roleD and roleD.rank == _rank then
            local data = {
                roleData = roleD,
                props = v.props
            }
            table.insert(list, data)
        end
    end

    return list
end

return M