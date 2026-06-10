-- Code Auto Create Begin
local M = Class('WBRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WBRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Paimingdi','Img_Paimingdi',2},{'Img_shutiao','Img_shutiao',2},{'Img_LVdi','Text_Name/Img_LVdi',2},{'Img_touxiangdi','touxiang/Img_touxiangdi',2},{'Img_Head','touxiang/Img_touxiangdi/Img_Head',2},{'Img_Touxiangkuang','touxiang/Img_Touxiangkuang',2},{'Img_Rank3','Img_Rank3',2},{'Img_Rank2','Img_Rank2',2},{'Img_Rank1','Img_Rank1',2},{'Img_PlayerSelect','Img_PlayerSelect',2},{'Btn_RoleInfo','Btn_RoleInfo',2},{'Img_Ziliaodi','Btn_RoleInfo/Img_Ziliaodi',2},
        -- Text 列表
        {'Text_Score','Text_Score',3},{'Text_Name','Text_Name',3},{'Text_LV','Text_Name/Img_LVdi/Text_LV',3},{'Text_Title','Text_Title',3},{'Text_RankRole','Text_RankRole',3},{'Text_Ziliao','Btn_RoleInfo/Text_Ziliao',3},
        -- UITemplate 列表
        {'WBRankItem','/',10},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
function M:OnInit()

end
---排名更新
function M:OnUpdateUI(pData)
    ---@type BossRankInfo 获取排名
    self.rankInfo = pData[1]
    if self.rankInfo ~= nil then
        self.Img_PlayerSelect().gameObject:SetActive(self.rankInfo.id == PlayerControl.GetPlayerData().UID)
        ---更新排名
        local rank = self.rankInfo.rank + 1
        self.Text_RankRole().text = rank
        self.Img_Rank1().gameObject:SetActive(rank == 1)
        self.Img_Rank2().gameObject:SetActive(rank == 2)
        self.Img_Rank3().gameObject:SetActive(rank == 3)
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
            Log.Error("头像id不存在,id:"..self.rankInfo.head)
        end
        ---更新头像框
        if self.rankInfo.headFrame == 0 then
            MgrRes.LoadSprite(self.Img_Touxiangkuang():GetComponent("Image"),"Playheadicon/Touxiangkuang")
        else
            local hearFrameConf = PlayheadframeLocalData.tab[self.rankInfo.headFrame][3]
            MgrRes.LoadSprite(self.Img_Touxiangkuang():GetComponent("Image"),"Playheadicon/" .. hearFrameConf)
        end
        ---更新名称
        self.Text_Name().text = self.rankInfo.nike
        ---更新分数
        self.Text_Score().text = Global.GetPointNumber(self.rankInfo.score,",")
        ---更新等级
        self.Text_LV().text = string.format("%s.%s",MgrLanguageData.GetLanguageByKey("ui_tips_1"),self.rankInfo.level)
        ---更新称号
        if self.rankInfo.title ~= nil and self.rankInfo.title ~= "" and self.rankInfo.title ~= "0" then
            local TitleStr = JNStrTool.strSplit(",",self.rankInfo.title)
            local str = ""
            for i = 1, #TitleStr do
                local medal = ItemControl.GetItemByType(4,tonumber(TitleStr[i]))
                if medal ~= nil then
                    str = str .."  ".. medal.name
                    break
                end
            end
            self.Text_Title().text = str
        else
            self.Text_Title().text = ""
        end
        ---更新次数
        --self.Text_Count().text = self.rankInfo.count
    else
        self.Img_PlayerSelect().gameObject:SetActive(false)
        local rank = tonumber(self.ObjRoot.name)
        self.Text_RankRole().text = rank
        self.Img_Rank1().gameObject:SetActive(rank == 1)
        self.Img_Rank2().gameObject:SetActive(rank == 2)
        self.Img_Rank3().gameObject:SetActive(rank == 3)
        --MgrRes.LoadNormalIcon(self.Img_Head(),self.rankInfo.id)
        self.Text_Name().text = MgrLanguageData.GetLanguageByKey("stormbossdata_tips1")
        self.Text_Score().text = ""
        self.Text_LV().text = string.format("LV.%s",0)
        self.Text_Title().text = ""
        --self.Text_Count().text = 0
    end
    ---查看资料按钮
    UIEvent.LuaClick(self.Btn_RoleInfo().gameObject,function()
        self:ShowPlayerDetail()
    end)
end
---资料显示
function M:ShowPlayerDetail()
    FriendViewModel.CurFriendID = self.rankInfo.id
    FriendViewModel.FriendInfoREQ(FriendViewModel.CurFriendID)
end
return M