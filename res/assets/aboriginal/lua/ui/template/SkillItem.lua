-- Code Auto Create Begin
local M = Class('SkillItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkillItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_Jinengdi','Img_Jinengdi',2},{'TagPanel','TagPanel',2},{'EX','TagPanel/EX',2},{'Img_Suo','Img_Suo',2},
        -- UITemplate 列表
        {'SkillItem','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Tag','TagPanel/EX/Text_Tag',20},{'Text_Jinengming','Text_Jinengming',20},{'Text_Jinengshuoming','Text_Jinengshuoming',20},
    }
end
-- Code Auto Create End
require("LocalData/SkilltxtLocalData")
function M:OnInit()
    self.Img_Suo().gameObject:SetActive(false)
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot.gameObject,Handle(self,self.OnClickSelf))
end
function M:OnUpdateUI(pData)
    ---@type SkillDetailData
    self.pData = pData[1]
    self.parent = pData[2]
    self.CurHeroAttr = pData[3]
    ---技能栏5为EX
    if self.pData.SkillNum ~= 5 then
        ---非EX技能有进阶星
        self.EX().gameObject:SetActive(false)
    end
    ---获取当前等级段的技能
    local tIsOpen = true
    local tMarkLv = self.pData.UnlockLv[1]
    for i, v in ipairs(self.pData.UnlockLv) do
        if self.CurHeroAttr.ShowSkillLV >= v then
            tMarkLv = v
        else
            if i == 1 then
                tIsOpen = false
            end
            break
        end
    end
    local tSkillList = self.pData.SkillList[tMarkLv]
    local tIsAwaken = true
    if SkillLocalData.tab[tSkillList[1]][8] == 1 then
        tIsAwaken = self.CurHeroAttr.IsAwaken
    end
    ---判断三星技能是否解锁
    local threeStarUnLock = true
    if self.CurHeroAttr.StartLV < 3 and self.pData.SkillNum == 3 then
        threeStarUnLock = false
    end
    ---技能名
    self.Text_Jinengming().text = self.pData.GroupName[tMarkLv]
    self.CanClick = true
    if tIsOpen then
        ---技能说明
        if tIsAwaken then
            if not threeStarUnLock then     ---未满足三星解锁
                self.Text_Jinengshuoming().text = ""
                self.Img_Suo().gameObject:SetActive(true)
            else
                self.Text_Jinengshuoming().text = self.pData.Tips[tMarkLv]
                self.Img_Suo().gameObject:SetActive(false)
            end
        else
            self.Text_Jinengshuoming().text = ""
            self.Img_Suo().gameObject:SetActive(true)
            self.CanClick = false
        end
    else
        self.Text_Jinengming().text = ""
        self.Text_Jinengshuoming().text = ""
        self.Img_Suo().gameObject:SetActive(true)
        self.CanClick = false
    end
end
function M:OnClickSelf()
    if self.pData ~= nil and self.CanClick and self.parent.Uid ~= UID.BattlePause_UI  then
        self.parent:ShowSkillXiangqing(self.pData,self.ObjRoot)
        CJNBattleMgr.Instance:RaygetIdOff(true)
    end
end
--创建Panel中的元素 _Root为父节点
function M:CreatObjInPanel(_Root, _Prefab)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x, tempObj.transform.localPosition.y, 0)
    return tempObj
end
return M