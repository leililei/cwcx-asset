-- Code Auto Create Begin
local M = Class('WudaohuiRankItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/WudaohuiRankItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_bg','Img_bg',2},{'Cishu','Cishu',2},{'Img_LVdi','Img_LVdi',2},{'Img_HeadMask','Img_HeadMask',2},{'HeadIcon','Img_HeadMask/HeadIcon',2},{'Img_HeadFrame','Img_HeadFrame',2},{'Img_Third','Img_Third',2},{'Img_Second','Img_Second',2},{'Img_First','Img_First',2},{'Img_Select','Img_Select',2},
        -- UITemplate 列表
        {'WudaohuiRankItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Cishu','Cishu/Text_Cishu',20},{'Text_LV','Img_LVdi/Text_LV',20},{'Text_Name','Text_Name',20},{'Text_Rank','Text_Rank',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.TopImg = {
        self.Img_First(), self.Img_Second(), self.Img_Third()
    }
    for i, v in ipairs(self.TopImg) do
        v.gameObject:SetActive(false)
    end
end

function M:OnUpdateUI(rankData)
    ---排行
    self.Text_Rank().text = rankData.rank+1
    for i, v in ipairs(self.TopImg) do
        if i == rankData.rank+1 then
            v.gameObject:SetActive(true)
        else
            v.gameObject:SetActive(false)
        end
    end
    ---头像
    PlayerControl.SetHeadIcon(self.HeadIcon(), rankData.head);
    ---头像框
    PlayerControl.SetHeadFrame(self.Img_HeadFrame(), rankData.headFrame);
    ---玩家昵称
    self.Text_Name().text = rankData.nike
    ---玩家等级
    self.Text_LV().text = "LV."..rankData.level
    ---玩家连胜场数
    self.Text_Cishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_pvp_formation_text7"),rankData.winCount)
end
return M