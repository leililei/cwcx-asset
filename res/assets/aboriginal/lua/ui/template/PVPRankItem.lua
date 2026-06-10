-- Code Auto Create Begin
local M = Class('PVPRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/PVPRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'Img_Ziliaodi','Btn_Info/Img_Ziliaodi',2},{'Img_HeadMask','Img_HeadMask',2},{'HeadIcon','Img_HeadMask/HeadIcon',2},{'Img_HeadFrame','Img_HeadFrame',2},{'Img_Third','Img_Third',2},{'Img_Second','Img_Second',2},{'Img_First','Img_First',2},{'node_rank','node_rank',2},{'Img_shutiao','node_rank/Img_shutiao',2},{'RankIcon','node_rank/RankIcon',2},{'Img_LVdi','node_rank/Img_LVdi',2},{'node_champion','node_champion',2},{'Img_LVdi01','node_champion/Img_LVdi',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'PVPRankItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Ziliao','Btn_Info/Text_Ziliao',20},{'Text_Score','ScorePanel/Text_Score',20},{'Text_Number','ScorePanel/Text_Number',20},{'Text_Rank','Text_Rank',20},{'Text_RankName','node_rank/Text_RankName',20},{'Text_Name','node_rank/Text_Name',20},{'Text_LV','node_rank/Img_LVdi/Text_LV',20},{'Text_Name01','node_champion/Text_Name',20},{'Text_LV01','node_champion/Img_LVdi/Text_LV',20},{'Text_TitleName','node_champion/Text_TitleName',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
function M:OnUpdateUI(pData)
    self.rankInfo = pData[1]
    if self.rankInfo == nil then
        self.ObjRoot:SetActive(false)
        return
    else
        self.ObjRoot:SetActive(true)
    end
    ---昵称
    self.Text_Name().text = self.rankInfo.nike
    self.Text_Name01().text = self.rankInfo.nike
    ---头像
    local headName = 0
    if self.rankInfo.head == 0 then
        headName = 10000
    else
        ---如果存在头像数据
        if PlayheadLocalData.tab[self.rankInfo.head] then
            local _type = string.split(PlayheadLocalData.tab[self.rankInfo.head].type,"_")
            if _type[1] == "0" then
                headName = tonumber(_type[2])
            elseif _type[1] == "1" then
                headName = tonumber(_type[3])
            end
        else
            headName = tonumber(string.split(PlayheadLocalData.tab[tonumber(SteamLocalData.tab[104015][2])].type,"_")[2])
        end
    end
    MgrRes.LoadNormalIcon(self.HeadIcon(),headName)
    ---头像框
    if self.rankInfo.headFrame == 0 then
        MgrRes.LoadSprite(self.Img_HeadFrame():GetComponent("Image"),"Playheadicon/Touxiangkuang")
    else
        local frameName = PlayheadframeLocalData.tab[self.rankInfo.headFrame][3]
        MgrRes.LoadSprite(self.Img_HeadFrame():GetComponent("Image"),"Playheadicon/" .. frameName)
    end
    --Img_HeadFrame

    ---玩家等级
    self.Text_LV().text = MgrLanguageData.GetLanguageByKey("ui_tips_1") .. "."..self.rankInfo.level
    ---排名
    self.Text_Rank().text = self.rankInfo.rank + 1
    if 1 == pData[2] then
        self.node_rank().gameObject:SetActive(true);
        self.node_champion().gameObject:SetActive(false);
        ---分数
        self.Text_Score().text = self.rankInfo.score
        ---获取段位
        self:CheckRank(pData[3])
    else
        self.node_rank().gameObject:SetActive(false);
        self.node_champion().gameObject:SetActive(true);
        self.Text_Score().text = self.rankInfo.winCount;
        self.Text_TitleName().text = "";
        if nil ~= self.rankInfo.title then
            local titles = string.split(self.rankInfo.title, ",");
            if #titles > 0 then
                local badge = HideLocalData.tab[tonumber(titles[1])];
                if nil ~= badge then
                    self.Text_TitleName().text = badge.name;
                end
            end
        end
    end
    
    ---检查是否是前三名
    if self.rankInfo.rank == 0 then
        self.Img_First().gameObject:SetActive(true)
        self.Img_Second().gameObject:SetActive(false)
        self.Img_Third().gameObject:SetActive(false)
    elseif self.rankInfo.rank == 1 then
        self.Img_First().gameObject:SetActive(false)
        self.Img_Second().gameObject:SetActive(true)
        self.Img_Third().gameObject:SetActive(false)
    elseif self.rankInfo.rank == 2 then
        self.Img_First().gameObject:SetActive(false)
        self.Img_Second().gameObject:SetActive(false)
        self.Img_Third().gameObject:SetActive(true)
    else
        self.Img_First().gameObject:SetActive(false)
        self.Img_Second().gameObject:SetActive(false)
        self.Img_Third().gameObject:SetActive(false)
    end
    if self.rankInfo.id == PlayerControl.GetPlayerData().UID then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end
    ---上赛季N0.1
    if pData[3] then
        self.Text_Number().gameObject:SetActive(true)
        self.Text_Rank().text = 1
        self.Img_First().gameObject:SetActive(true)
        self.Img_Second().gameObject:SetActive(false)
        self.Img_Third().gameObject:SetActive(false)
        self.Img_Select().gameObject:SetActive(false)
    else
        self.Text_Number().gameObject:SetActive(false)
    end


    UIEvent.LuaClick(self.Img_bg().gameObject,function()
        FriendViewModel.CurFriendID = self.rankInfo.id
        FriendViewModel.FriendInfoREQ(FriendViewModel.CurFriendID)
    end)
end

function M:CheckRank(isFirst)
    if isFirst then
        MgrRes.LoadSprite(self.RankIcon(),"Level/"..SeniorPVPLocalData.tab[1][3])
        self.Text_RankName().text = SeniorPVPLocalData.tab[1][2]
    else
        local tab = {}
        if PVPViewModel.type == 0 then
            tab =  LowPVPLocalData.tab
        elseif PVPViewModel.type == 1 then
            tab =  SeniorPVPLocalData.tab
            local rankData = PVPViewModel.GetPvPRank(self.rankInfo.rankLevel)
            self.Text_RankName().text = rankData[2]
            MgrRes.LoadSprite(self.RankIcon(),"Level/"..rankData[3])
        end
    end
end
return M