-- Code Auto Create Begin
local M = Class('PrizeDrawDetailPanel', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PrizeDrawDetailPanel.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_SSRbg','Img_SSRbg',2},{'StarPanel','Img_SSRbg/StarPanel',2},{'StarPregab_Xing1','Img_SSRbg/StarPanel/StarPregab_Xing1',2},{'StarPregab_Xing2','Img_SSRbg/StarPanel/StarPregab_Xing2',2},{'StarPregab_Xing3','Img_SSRbg/StarPanel/StarPregab_Xing3',2},{'StarPregab_Xing4','Img_SSRbg/StarPanel/StarPregab_Xing4',2},{'StarPregab_Xing5','Img_SSRbg/StarPanel/StarPregab_Xing5',2},{'CardPoolTipItem','CardPoolTipItem',2},{'Content','Content',2},{'Image_shuoming','Image_shuoming',2},{'Img_DesBg','Img_DesBg',2},
        -- UITemplate 列表
        {'PrizeDrawDetailPanel','/',10},{'CardPoolTipItem01','CardPoolTipItem',10},
        -- TextMeshProUGUI 列表
        {'Text_Title','Text_Title',20},{'Text_Jiang','Img_SSRbg/Text_Jiang',20},{'Text_Bability','Img_SSRbg/Text_Bability',20},{'Text_Shuoming','Image_shuoming/Text_Shuoming',20},{'Text_Des','Img_DesBg/Text_Des',20},
    }
end
-- Code Auto Create End
function M:OnInit()

end

function M:OnUpdateUI(args)
    self.drop = args[1]
    self.idx = args[2]
    self.parent = args[3]
    --隐藏预制
    self.CardPoolTipItem().gameObject:SetActive(false)
    local ratioTxt = string.format("%.2f",tonumber(self.drop[4]) / 100).."%";
    if self.drop[5] >= 9 then
        self.Text_Bability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text136") .. ratioTxt;
        self.Img_SSRbg().color = Color(0.831,0.376,0.247,1);
    elseif 8 == self.drop[5] then
        self.Text_Bability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text137") .. ratioTxt;
        self.Img_SSRbg().color = Color(0.407,0.247,0.831,1);
    elseif 7 == self.drop[5] then
        self.Text_Bability().text = MgrLanguageData.GetLanguageByKey("ui_qita_text138") .. ratioTxt;
        self.Img_SSRbg().color = Color(0.247,0.454,0.831,1);
    end
    self:RefreshItem()
    self:ResetDesc()
end

function M:RefreshItem()
    Tools.ClearAllChild(self.Content().gameObject)
    local arr = CardDrawControl.GetItemTempByDropList(self.drop[3])
    --掉落物品字符串
    local tab = string.split(arr,",")
    for k,v in pairs(tab) do
        local roleStr = string.split(v,"_")
        local obj = GameObject.Instantiate(self.CardPoolTipItem().gameObject,self.Content().gameObject.transform,false)
        obj:SetActive(true)
        local voidGear = CJNUIMgr.GetSunUseName(obj,"VoidGear")
        local role = CJNUIMgr.GetSunUseName(obj,"Role")
        local item =  CJNUIMgr.GetSunUseName(obj,"Item")
        local prob = CJNUIMgr.GetSunUseName(obj,"Text_Probability").transform:GetComponent("TextMeshProUGUI")
        --角色
        if tonumber(roleStr[1]) == 30 then
            voidGear:SetActive(false)
            item:SetActive(false)
            role:SetActive(true)
            local roleData = HeroControl.GetRoleDataByID(tonumber(roleStr[2]))
            local icon = CJNUIMgr.GetSunUseName(role,"Icon_Head").transform:GetComponent("Image")
            local frame = CJNUIMgr.GetSunUseName(role,"Icon_Frame").transform:GetComponent("Image")
            local career = CJNUIMgr.GetSunUseName(role,"Icon_Career").transform:GetComponent("Image")
            local name = CJNUIMgr.GetSunUseName(role,"RoleNamelText").transform:GetComponent("TextMeshProUGUI")

            MgrRes.LoadQIcon(icon,roleData.id)
            MgrRes.LoadSprite(frame,roleData.iconBattleFrame)
            MgrRes.LoadSprite(career,roleData.iconCareer)
            name.text = roleData.name
            prob.text = self:GetProb(CardDrawControl.GetSingleItemProbability(tab,tonumber(roleStr[2]),tonumber(roleStr[3])),tonumber(self.drop[4]) / 100).."%"
            --标题(因为卡池只有角色因此不做其他判断)
            if k == 1 then
                --第一个显示文字描述
                if self.idx == 1 then
                    self.Text_Jiang().gameObject:SetActive(true)
                    self.StarPanel().gameObject:SetActive(false)
                    self.Text_Jiang().text = MgrLanguageData.GetLanguageByKey("ui_qita_text173")
                else
                    self.Text_Jiang().gameObject:SetActive(false)
                    self.StarPanel().gameObject:SetActive(true)
                    local role = RoleattributeLocalData.tab[tonumber(roleStr[2])]
                    self:SetStar(role[21])
                end
            end
        elseif tonumber(roleStr[1]) == 5 then
            --共鸣装备
            voidGear:SetActive(true)
            item:SetActive(false)
            role:SetActive(false)
            local equipData = EquipControl.GetSingleEquips(tonumber(roleStr[2]))
            local icon = CJNUIMgr.GetSunUseName(voidGear,"VoidGearIconImg").transform:GetComponent("Image")
            local frame = CJNUIMgr.GetSunUseName(voidGear,"VoidRankKuangImg").transform:GetComponent("Image")
            local name = CJNUIMgr.GetSunUseName(voidGear,"VoidGearNamelText").transform:GetComponent("TextMeshProUGUI")
            MgrRes.LoadSprite(icon,equipData.icon)
            MgrRes.LoadSprite(frame,equipData.iconFrame)
            name.text = equipData.name
            prob.text = self:GetProb(CardDrawControl.GetSingleItemProbability(tab,tonumber(roleStr[2]),tonumber(roleStr[3])),tonumber(self.drop[4]) / 100).."%"
        else
            --道具
            voidGear:SetActive(false)
            item:SetActive(true)
            role:SetActive(false)
            ---@type ItemData
            local itemData = ItemControl.GetItemByIdAndType(tonumber(roleStr[2]),tonumber(roleStr[1]))
            local icon = CJNUIMgr.GetSunUseName(item,"RewardIconImg").transform:GetComponent("Image")
            local frame = CJNUIMgr.GetSunUseName(item,"RewardRankImg").transform:GetComponent("Image")
            local star = CJNUIMgr.GetSunUseName(item,"StarPanel")
            local count = CJNUIMgr.GetSunUseName(item,"ItemCountText").transform:GetComponent("TextMeshProUGUI")
            local name = CJNUIMgr.GetSunUseName(item,"RewardNamelText").transform:GetComponent("TextMeshProUGUI")
            MgrRes.LoadSprite(icon,itemData.icon)
            MgrRes.LoadSprite(frame,itemData.iconFrame)
            star.gameObject:SetActive(false)
            count.text = tonumber(roleStr[3])
            name.text = itemData.name
            prob.text = self:GetProb(CardDrawControl.GetSingleItemProbability(tab,tonumber(roleStr[2]),tonumber(roleStr[3])),tonumber(self.drop[4]) / 100).."%"
        end
    end
end

function M:ResetDesc()
    if self.idx == #self.parent.roleList then
        self.Image_shuoming().gameObject:SetActive(true)
        self.Img_DesBg().gameObject:SetActive(true)
    else
        self.Image_shuoming().gameObject:SetActive(false)
        self.Img_DesBg().gameObject:SetActive(false)
    end
    self.Text_Des().text = self.parent.cardInfo.desc
    Tools.ReSize(self.ObjRoot)
end

function M:GetProb(prob1,prob2)
    local num = (prob1/100) * (prob2 / 100)
    return string.format("%.2f",num*100)
end

--设置星级
function M:SetStar(num)
    self.StarPregab_Xing1().gameObject:SetActive(num >= 1)
    self.StarPregab_Xing2().gameObject:SetActive(num >= 2)
    self.StarPregab_Xing3().gameObject:SetActive(num >= 3)
    self.StarPregab_Xing4().gameObject:SetActive(num >= 4)
    self.StarPregab_Xing5().gameObject:SetActive(num >= 5)
end

return M