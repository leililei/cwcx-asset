-- Code Auto Create Begin
local M = Class('BlueprintPointItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintPointItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Touying','Img_Touying',2},{'Img_Monidi','Img_Monidi',2},{'Img_Nandu','Img_Nandu',2},{'NanduIcon','Img_Nandu/NanduIcon',2},{'Img_Bg','Img_Bg',2},{'Img_Chakandi2','Text_Name/Btn_Chakan2/Img_Chakandi2',2},{'Img_Chakanicon2','Text_Name/Btn_Chakan2/Img_Chakanicon2',2},{'Btn_ShowBoss','Btn_ShowBoss',2},{'Img_Tiao','Btn_ShowBoss/Img_Tiao',2},{'ImgReward','ImgReward',2},{'Img_Select','Img_Select',2},{'ImgRaidDmg','ImgRaidDmg',2},{'Img_Tiaojiand2i','nPointInfo/Img_Tiaojiand2i',2},{'Panel_nUnLock','nPointInfo/Panel_nUnLock',2},{'Img_nStar_1','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_1',2},{'Highlight','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_1/Highlight',2},{'Img_nStar_2','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_2',2},{'Highlight01','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_2/Highlight',2},{'Img_nStar_3','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_3',2},{'Highlight02','nPointInfo/Panel_nUnLock/Panel_nStars/Img_nStar_3/Highlight',2},{'Panel_nLock','nPointInfo/Panel_nLock',2},
        -- Button 列表
        {'Btn_Chakan2','Text_Name/Btn_Chakan2',4},{'Btn_ShowBoss01','Btn_ShowBoss',4},
        -- UITemplate 列表
        {'BlueprintPointItem','/',10},
        -- Toggle 列表
        {'BlueprintPointItem01','/',13},
        -- RawImage 列表
        {'Btn_Chakan201','Text_Name/Btn_Chakan2',15},{'Panel_nStars','nPointInfo/Panel_nUnLock/Panel_nStars',15},
        -- TextMeshProUGUI 列表
        {'Text_Nandu','Img_Nandu/Text_Nandu',20},{'Text_Name','Text_Name',20},{'TextRaid','ImgRaidDmg/TextRaid',20},{'TextRaidDmg','ImgRaidDmg/TextRaidDmg',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Tools.ToggleValueChange(self.BlueprintPointItem01(), Handle(self, self.OnToggleClicked), nil);
    self.BlueprintPointItem01().group = self.ObjRoot.transform.parent:GetComponent("ToggleGroup");
    UIEvent.LuaClick(self.ImgReward().gameObject, Handle(self, self.OnBtnRewardClicked));
    self.nStars = {
        [1] = self.Img_nStar_1().transform:Find("Highlight").gameObject,
        [2] = self.Img_nStar_2().transform:Find("Highlight").gameObject,
        [3] = self.Img_nStar_3().transform:Find("Highlight").gameObject,
    }
end
---更新
function M:OnUpdateUI(pData)
    ---@type StormBossData
    self.m_data = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    self.CurBossLevel = pData[3]   ---难度和引索刚好对应
    ---更新选中框
    if self.m_data.id == StormViewModel.CurPointData.id then
        self.Img_Select().gameObject:SetActive(true)
        self.BlueprintPointItem01().isOn = true;
    else
        self.Img_Select().gameObject:SetActive(false)
        self.BlueprintPointItem01().isOn = false;
    end
    MgrRes.LoadSprite(self.Img_Bg(),"Preview/"..self.m_data.thumbnail_drawing)
    self.Text_Name().text = self.m_data.name
    ---难度
    self.Text_Nandu().text = self.m_data.leveltext;
    MgrRes.LoadSprite(self.NanduIcon(),self.m_data.levelicon)
    MgrRes.LoadSprite(self.Img_Nandu(),self.m_data.levelbg)

    self.pointLock = StormControl.CheckPointLock(self.m_data.id)
    self.Panel_nUnLock().gameObject:SetActive(self.pointLock)
    self.Panel_nLock().gameObject:SetActive(not self.pointLock)
    if self.pointLock then
        local s1,s2,s3 = self.m_data:CheckStar()
        local csArr = {
            [1] = s1,
            [2] = s2,
            [3] = s3,
        }
        for i = 1, #self.nStars do
            self.nStars[i]:SetActive(csArr[i])
        end
    end
    local raidDmg = BlueprintViewModel.GetRaidDmg(self.m_data.id);
    if nil ~= raidDmg then
        self.TextRaidDmg().text = raidDmg;
    else
        self.TextRaidDmg().text = "";
    end
end

function M:OnToggleClicked(isOn)
    self.Img_Select().gameObject:SetActive(isOn);
    if isOn then
        Event.Go("BlueprintPointChange", self.m_data);
    end
end

function M:OnBtnRewardClicked()
    MgrUI.Pop(UID.BlueprintRewardPop_UI,{ self.m_data },true);
end

return M