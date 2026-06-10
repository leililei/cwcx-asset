-- Code Auto Create Begin
local M = Class('TowerRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/TowerRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Star_1','Panel/StarContent/Star_1',2},{'Normal','Panel/StarContent/Star_1/Normal',2},{'HighLight','Panel/StarContent/Star_1/HighLight',2},{'Star_2','Panel/StarContent/Star_2',2},{'Normal01','Panel/StarContent/Star_2/Normal',2},{'HighLight01','Panel/StarContent/Star_2/HighLight',2},{'Star_3','Panel/StarContent/Star_3',2},{'Normal02','Panel/StarContent/Star_3/Normal',2},{'HighLight02','Panel/StarContent/Star_3/HighLight',2},{'Star_4','Panel/StarContent/Star_4',2},{'Normal03','Panel/StarContent/Star_4/Normal',2},{'HighLight03','Panel/StarContent/Star_4/HighLight',2},{'Star_5','Panel/StarContent/Star_5',2},{'Normal04','Panel/StarContent/Star_5/Normal',2},{'HighLight04','Panel/StarContent/Star_5/HighLight',2},{'Star_6','Panel/StarContent/Star_6',2},{'Normal05','Panel/StarContent/Star_6/Normal',2},{'HighLight05','Panel/StarContent/Star_6/HighLight',2},{'Awaken','Panel/StarContent/Awaken',2},{'Super','Panel/StarContent/Awaken/Super',2},{'Super01','Panel/StarContent/Awaken/Super',2},{'Super02','Panel/StarContent/Awaken/Super',2},{'Super03','Panel/StarContent/Awaken/Super',2},{'Super04','Panel/StarContent/Awaken/Super',2},{'Super05','Panel/StarContent/Awaken/Super',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},
        -- UITemplate 列表
        {'TowerRoleItem_8','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},
    }
end
-- Code Auto Create End
---角色头像初始化
function M:OnInit()
    self.starNor = {
        [1] = self.Star_1().transform:Find("Normal").gameObject,
        [2] = self.Star_2().transform:Find("Normal").gameObject,
        [3] = self.Star_3().transform:Find("Normal").gameObject,
        [4] = self.Star_4().transform:Find("Normal").gameObject,
        [5] = self.Star_5().transform:Find("Normal").gameObject,
        [6] = self.Star_6().transform:Find("Normal").gameObject,
    }
    self.starHl = {
        [1] = self.Star_1().transform:Find("HighLight").gameObject,
        [2] = self.Star_2().transform:Find("HighLight").gameObject,
        [3] = self.Star_3().transform:Find("HighLight").gameObject,
        [4] = self.Star_4().transform:Find("HighLight").gameObject,
        [5] = self.Star_5().transform:Find("HighLight").gameObject,
        [6] = self.Star_6().transform:Find("HighLight").gameObject,
    }
    self.awaken = self.Awaken().gameObject
end
---角色头像更新
function M:OnUpdateUI(pData)
    ---@type --MonsterData 角色刷新
    ---@type RoleData 角色刷新
    self.pData = pData
    ---获取头像
    MgrRes.LoadQIcon(self.Icon_Head(),self.pData.id)
    ---获取边框
    MgrRes.LoadSprite(self.Icon_Frame(),self.pData.iconBattleFrame)
    ---获取等级
    self.Text_Level().text = self.pData.level
    ---获取职业图标
    MgrRes.LoadSprite(self.Icon_Career(),self.pData.iconCareer)
    ---更新星级
    for starLv = 1, #self.starHl do
        local isStar = self.pData.star < starLv
        --self.starNor[starLv]:SetActive(isStar)
        self.starHl[starLv]:SetActive(not isStar)
    end
    ---更新觉醒
    local isAwaken = false
    if type(self.pData.awaken) == "number" then
        isAwaken = self.pData.awaken > 0
    else
        isAwaken = self.pData.awaken
    end
    self.awaken:SetActive(isAwaken)
    ---获取技能等级
    self.Text_Rank().text = self.pData.skillLevel
end
return M