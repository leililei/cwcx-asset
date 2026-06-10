-- Code Auto Create Begin
local M = Class('ChooseRoleItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ChooseRoleItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Panel','Panel',2},{'Img_Lihuidi','Panel/Img_Lihuidi',2},{'Icon_Head','Panel/Icon_Head',2},{'Icon_Frame','Panel/Icon_Frame',2},{'Icon_Career','Panel/Icon_Career',2},{'Awaken','Panel/Awaken',2},{'Star_1','Panel/Awaken/Star_1',2},{'Star_2','Panel/Awaken/Star_2',2},{'Star_3','Panel/Awaken/Star_3',2},{'Star_4','Panel/Awaken/Star_4',2},{'Star_5','Panel/Awaken/Star_5',2},{'Star_6','Panel/Awaken/Star_6',2},{'unAwaken','Panel/unAwaken',2},{'Star_101','Panel/unAwaken/Star_1',2},{'Normal','Panel/unAwaken/Star_1/Normal',2},{'HighLight','Panel/unAwaken/Star_1/HighLight',2},{'Star_201','Panel/unAwaken/Star_2',2},{'Normal01','Panel/unAwaken/Star_2/Normal',2},{'HighLight01','Panel/unAwaken/Star_2/HighLight',2},{'Star_301','Panel/unAwaken/Star_3',2},{'Normal02','Panel/unAwaken/Star_3/Normal',2},{'HighLight02','Panel/unAwaken/Star_3/HighLight',2},{'Star_401','Panel/unAwaken/Star_4',2},{'Normal03','Panel/unAwaken/Star_4/Normal',2},{'HighLight03','Panel/unAwaken/Star_4/HighLight',2},{'Star_501','Panel/unAwaken/Star_5',2},{'Normal04','Panel/unAwaken/Star_5/Normal',2},{'HighLight04','Panel/unAwaken/Star_5/HighLight',2},{'Star_601','Panel/unAwaken/Star_6',2},{'Normal05','Panel/unAwaken/Star_6/Normal',2},{'HighLight05','Panel/unAwaken/Star_6/HighLight',2},{'Icon_Rankdi','Panel/Icon_Rankdi',2},{'Mask','Mask',2},{'Img_Mask','Mask/Img_Mask',2},{'Img_Unfight','Mask/Img_Unfight',2},{'ItemMask','ItemMask',2},{'Img_board_selected','Img_board_selected',2},
        -- UITemplate 列表
        {'ChooseRoleItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Level','Panel/Text_Level',20},{'Text_Lv','Panel/Text_Lv',20},{'Text_Rank','Panel/Icon_Rankdi/Text_Rank',20},{'Text_SameRoleTips','Mask/Img_Mask/Text_SameRoleTips',20},{'Text_UnfightTips','Mask/Img_Unfight/Text_UnfightTips',20},{'Text','Img_board_selected/Text',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.Panel().gameObject, function()
        self.parent:SetSelectList(self.roleData.id)
    end)
end

function M:OnUpdateUI(pData)
    self.roleData = pData[1]
    self.parent = pData[2]

    MgrRes.LoadQIcon(self.Icon_Head(),self.roleData.skin)
    MgrRes.LoadSprite(self.Icon_Frame(),self.roleData.iconFrame)
    MgrRes.LoadSprite(self.Icon_Career(),self.roleData.iconCareer)
    self.Text_Level().text = self.roleData.level

    --角色是否觉醒
    self.Awaken().gameObject:SetActive(self.roleData.awaken)
    self.unAwaken().gameObject:SetActive(not self.roleData.awaken)
    for i = 1, self.roleData.star do
        if self.roleData.awaken then
            self.Awaken().transform:GetChild(i - 1).gameObject:SetActive(true)
        else
            self.unAwaken().transform:GetChild(i - 1).gameObject:SetActive(true)
        end
    end

    --该角色是否被选中
    self.Img_board_selected().gameObject:SetActive(false)
    local _list = self.parent.selectList
    for i, v in ipairs(_list) do
        if v == self.roleData.id then
            self.Img_board_selected().gameObject:SetActive(true)
            self.Text().text = tostring(i)
            break
        end
    end
end
return M