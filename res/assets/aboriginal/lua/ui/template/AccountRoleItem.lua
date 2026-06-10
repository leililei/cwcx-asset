-- Code Auto Create Begin
local M = Class('AccountRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/AccountRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_lihuidi','Img_lihuidi',2},{'Img_Head','Img_Head',2},{'Img_Zhezhao','Img_Zhezhao',2},{'Img_RoleSlider','Img_RoleSlider',2},{'Img_FrameLan','Img_FrameLan',2},{'Img_FrameZi','Img_FrameZi',2},{'Img_FrameCheng','Img_FrameCheng',2},{'Img_Up','Text_UpLevel/Img_Up',2},{'UI_TX_022','UI_TX_022',2},
        -- UITemplate 列表
        {'AccountRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Text_Level',20},{'Text_LV(juese)','Text_LV(juese)',20},{'Text_UpLevel','Text_UpLevel',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.UI_TX_022().gameObject:SetActive(false)
end

---pData:1角色数据，2获得的经验
function M:OnUpdateUI(pData)
    ---@type RoleData
    local hData = pData[1]
    local offsetExp = pData[2]
    local curLevel = pData[3]       ---当前等级
    local curGotExp = pData[4]      ---当前获得的经验
    
    local tLevel = curLevel > 0 and curLevel or hData.level
    ---设置头像
    MgrRes.LoadQIcon(self.Img_Head(),hData.skin)
    local maxExp = HeroControl.GetMaxExpByLevel(tLevel,hData.id,tLevel,hData.star,hData:GetHeroSkillLevel(),hData.awaken)
    ---设置经验条滑动
    Tools.SetImgFillRate(self.Img_RoleSlider().gameObject,(hData.exp+offsetExp)/tonumber(maxExp),1)
    ---设置等级
    self.Text_Level().text = tLevel
    ---设置边框
    self.Img_FrameLan().gameObject:SetActive(hData.rank < 3)
    self.Img_FrameZi().gameObject:SetActive(hData.rank == 3)
    self.Img_FrameCheng().gameObject:SetActive(hData.rank == 4)
    ---升级箭头
    self.Img_Up().gameObject:SetActive(false)
    if curLevel > 0 and curLevel > hData.level then
        self.Text_UpLevel().text = MgrLanguageData.GetLanguageByKey("ui_tips_3")
        MgrTimer.AddDelayNoName(0.8,function()
            self.UI_TX_022().gameObject:SetActive(true)
        end,self.ObjRoot)
        self.Img_Up().gameObject:SetActive(true)
    elseif curLevel == 0 then
        self.Text_UpLevel().text = "+0"
    else
        self.Text_UpLevel().text = string.format("+%s",offsetExp)
    end
end
return M