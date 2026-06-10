-- Code Auto Create Begin
local M = Class('WorldBossRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WorldBossRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Wanjiapaimingdi','Img_Wanjiapaimingdi',2},{'Img_touxiangdi','touxiang/Img_touxiangdi',2},{'Img_Head','touxiang/Img_touxiangdi/Img_Head',2},{'Img_Touxiangkuang','touxiang/Img_Touxiangkuang',2},{'Btn_RoleInfo','Btn_RoleInfo',2},{'Img_Ziliaodi','Btn_RoleInfo/Img_Ziliaodi',2},{'Img_Rank3','Img_Rank3',2},{'Img_Rank2','Img_Rank2',2},{'Img_Rank1','Img_Rank1',2},{'Img_PlayerSelect','Img_PlayerSelect',2},
        -- UITemplate 列表
        {'WorldBossRankItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Score','Text_Score',20},{'Text_Wanjiaming','Text_Wanjiaming',20},{'Text_Ziliao','Btn_RoleInfo/Text_Ziliao',20},{'Text_RankRole','Text_RankRole',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
---排名初始化
function M:OnInit()

end
---排名更新
function M:OnUpdateUI(pData)
    ---@type BossRankInfo 获取排名
    self.rankInfo = pData[1]
    if self.rankInfo ~= nil then
        self.Img_PlayerSelect().gameObject:SetActive(self.rankInfo.id == PlayerControl.GetPlayerData().UID and "WorldBossRankOne" ~= self.ObjRoot.name)
        ---更新排名
        local rank = self.rankInfo.rank + 1
        self.Text_RankRole().text = rank
        self.Img_Rank1().gameObject:SetActive(rank == 1)
        self.Img_Rank2().gameObject:SetActive(rank == 2)
        self.Img_Rank3().gameObject:SetActive(rank == 3)
        if rank > 3 then
            self.Img_Rank1().gameObject:SetActive(false)
            self.Img_Rank2().gameObject:SetActive(false)
            self.Img_Rank3().gameObject:SetActive(false)
        end
        ---更新头像
        local headConf = PlayheadLocalData.tab[self.rankInfo.head]
        if headConf ~= nil then
            --MgrRes.LoadNormalIcon(self.Img_Head(),self.rankInfo.id)
            local _str = string.split(headConf.type,"_")
            if _str[1] == "0" then
                MgrRes.LoadNormalIcon(self.Img_Head(),tonumber(string.split(headConf.type,"_")[2]))
            elseif _str[1] == "1" then
                MgrRes.LoadNormalIcon(self.Img_Head(),tonumber(string.split(headConf.type,"_")[3]))
            end
        else
            MgrRes.LoadNormalIcon(self.Img_Head(),tonumber(string.split(PlayheadLocalData.tab[tonumber(SteamLocalData.tab[104015][2])].type,"_")[2]))
            Log.Error("头像id不存在,id:"..self.rankInfo.head and self.rankInfo.head or "nil")
        end
        ---更新头像框
        if self.rankInfo.headFrame == 0 then
            MgrRes.LoadSprite(self.Img_Touxiangkuang():GetComponent("Image"),"Playheadicon/Img_Touxiangkuang0")
        else
            local hearFrameConf = PlayheadframeLocalData.tab[self.rankInfo.headFrame][3]
            MgrRes.LoadSprite(self.Img_Touxiangkuang():GetComponent("Image"),"Playheadicon/" .. hearFrameConf)
        end
        --local iconName = headConf == nil and "" or
        --self.Img_Touxiangkuang()
        ---更新名称
        self.Text_Wanjiaming().text = self.rankInfo.nike
        ---更新分数
        self.Text_Score().text = self.rankInfo.score
    else
        self.Img_PlayerSelect().gameObject:SetActive(false)
        --local rank = tonumber(self.ObjRoot.name) + 1
        --local rank = self.rankInfo.rank
        --self.Text_RankRole().text = rank
        --self.Img_Rank2().gameObject:SetActive(rank == 2)
        --self.Img_Rank3().gameObject:SetActive(rank == 3)
        --MgrRes.LoadNormalIcon(self.Img_Head(),self.rankInfo.id)
        --MgrRes.LoadNormalIcon(self.Img_Head(),tonumber(string.split(headConf.type,"_")[2]))
        self.Text_Wanjiaming().text = MgrLanguageData.GetLanguageByKey("stormbossdata_tips1")
        self.Text_Score().text = ""
    end
    ---资料
    UIEvent.LuaClick(self.Btn_RoleInfo().gameObject,function() self:ShowPlayerDetail() end)
end

---资料显示
function M:ShowPlayerDetail()
    --MgrUI.GoHide(UID.PlayerAvatar_UI)
    FriendViewModel.CurFriendID = self.rankInfo.id
    FriendViewModel.FriendInfoREQ(FriendViewModel.CurFriendID)
end

return M