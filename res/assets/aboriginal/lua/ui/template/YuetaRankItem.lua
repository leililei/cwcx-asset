-- Code Auto Create Begin
local M = Class('YuetaRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/YuetaRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'Img_HeadMask','Img_HeadMask',2},{'HeadIcon','Img_HeadMask/HeadIcon',2},{'Img_HeadFrame','Img_HeadFrame',2},{'Img_Third','Img_Third',2},{'Img_Second','Img_Second',2},{'Img_First','Img_First',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'YuetaRankItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Censhu','Text_Censhu',20},{'Text_Shijian','Text_Shijian',20},{'Text_LV','Text_LV',20},{'Text_Name','Text_Name',20},{'Text_Rank','Text_Rank',20},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
function M:OnUpdateUI(pData)
    self.rankInfo = pData[1]
    --排名
    self.Text_Rank().text = self.rankInfo.rank + 1
    self.Img_First().gameObject:SetActive(self.rankInfo.rank == 0)
    self.Img_Second().gameObject:SetActive(self.rankInfo.rank == 1)
    self.Img_Third().gameObject:SetActive(self.rankInfo.rank == 2)

    self.Img_Select().gameObject:SetActive(self.rankInfo.id == PlayerControl.GetPlayerData().UID and "YuetaRankItem" ~= self.ObjRoot.name)
    --头像框
    if self.rankInfo.headFrame == 0 then
        MgrRes.LoadSprite(self.Img_HeadFrame(),"Playheadicon/Touxiangkuang")
    else
        local frameName = PlayheadframeLocalData.tab[self.rankInfo.headFrame][3]
        MgrRes.LoadSprite(self.Img_HeadFrame(),"Playheadicon/" .. frameName)
    end
    --头像
    local headConf = PlayheadLocalData.tab[self.rankInfo.head]
    local _str = string.split(headConf.type,"_")
    if _str[1] == "0" then
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(string.split(headConf.type,"_")[2]))
    elseif _str[1] == "1" then
        MgrRes.LoadNormalIcon(self.HeadIcon(),tonumber(string.split(headConf.type,"_")[3]))
    end
    --名字
    self.Text_Name().text = self.rankInfo.nike
    --LV
    self.Text_LV().text = MgrLanguageData.GetLanguageByKey("ui_tips_1") .. self.rankInfo.level
    --上榜时间
    local timeStr = Global.TimeToDate(self.rankInfo.score)
    local t = string.split(timeStr,"-")
    self.Text_Shijian().text = string.format("%s/%s/%s",t[1],t[2],t[3])
    --重置次数
    self.Text_Cishu().text = self.rankInfo.count
    --通关最高层数
    self.Text_Censhu().text = self.rankInfo.hardCount
    --查看信息
    UIEvent.LuaClick(self.Img_bg().gameObject,function()
        FriendViewModel.CurFriendID = self.rankInfo.id
        FriendViewModel.FriendInfoREQ(FriendViewModel.CurFriendID)
    end)
end

return M