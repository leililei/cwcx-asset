-- Code Auto Create Begin
local M = Class('BossXiangqing_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BossXiangqing_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BossXiangqing_UI].prefab'
    self.Name = 'Form[BossXiangqing_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'Tanchuang','Tanchuang',2},{'Img_Bianxianzuo1','Tanchuang/Img_Bianxianzuo1',2},{'Img_Bianxianzuo2','Tanchuang/Img_Bianxianzuo2',2},{'Img_Bianxianzuo3','Tanchuang/Img_Bianxianzuo3',2},{'LihuiPanel','Tanchuang/LihuiPanel',2},{'LihuiSpinePanel','Tanchuang/LihuiPanel/LihuiSpinePanel',2},{'Lihui','Tanchuang/LihuiPanel/LihuiSpinePanel/Lihui',2},{'RoleInfoPanel','Tanchuang/RoleInfoPanel',2},{'LowerInfoPanel','Tanchuang/RoleInfoPanel/LowerInfoPanel',2},{'ProTypeImg','Tanchuang/RoleInfoPanel/LowerInfoPanel/ProTypeImg',2},{'StarPrefabJueXing','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPrefabJueXing',2},{'StarPrefab','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPrefab',2},{'StarPanel','Tanchuang/RoleInfoPanel/LowerInfoPanel/StarPanel',2},{'RoleNameBG','Tanchuang/RoleInfoPanel/LowerInfoPanel/RoleNameBG',2},{'CardRoleInfoPanel','Tanchuang/CardRoleInfoPanel',2},{'Jineng','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Jineng',2},{'Img_BaiKuang','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Img_BaiKuang',2},{'SkillContent','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll/SkillContent',2},{'Btn_Guanbi','Tanchuang/Btn_Guanbi',2},
        -- UITemplate 列表
        {'RoleDetail_SkillItem2','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll/RoleDetail_SkillItem2',10},
        -- RawImage 列表
        {'SkillScroll','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll',15},
        -- LoopScrollRect 列表
        {'SkillScroll01','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/SkillScroll',18},
        -- TextMeshProUGUI 列表
        {'RoleNameTxt','Tanchuang/RoleInfoPanel/LowerInfoPanel/RoleNameBG/RoleNameTxt',20},{'Text_Jineng','Tanchuang/CardRoleInfoPanel/Content/JinengPanel/Jineng/Text_Jineng',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    UIEvent.LuaClick(self.Btn_Guanbi().gameObject,function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end)
end

function M:OnBackKey()
    if not MgrUI.IsPopOpenOutCou(self.Uid.Name,{"HuoDongPop_UI","BossXiangqing_UI"}) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.ClosePop(self.Uid)
    end
end

function M:OnShow(pData)
    ---@type RoleData
    self.BossData = pData[1]
  
    ---显示新角色
    self:InitNewRole()
end
function M:InitNewRole()
    self:InitCardRole()
    --职业图标
    MgrRes.LoadSprite(self.ProTypeImg(),"Attribute/ProIcon_"..self.BossData.occupation)

    --名字
    self.RoleNameTxt().text = self.BossData.name
    --创建spine
    self:CreatLiHui(self.Lihui(), self.BossData.id)
end
function M:InitCardRole()
    self.CurBossAttr = self.BossData:GetMonsterMaxAttr()
    
    --职业
    if self.BossData.career == 1 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text207")
    elseif self.BossData.career == 2 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("coreattrdata_attack")
    elseif self.BossData.career == 3 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text208")
    elseif self.BossData.career == 4 then
        self.GongJi().text = MgrLanguageData.GetLanguageByKey("ui_tongyong_text141")
    end
    self.SkillScroll01():SetLuaCellEvent(Handle(self, self.SkillCell))
    self.ChildSkillList = SkillDetailControl.GetSkillListByID(self.BossData.id)
    self.ChildSkillList = SkillDetailControl.SortSkillList(self.ChildSkillList,nil)
    self.SkillScroll01().totalCount = #self.ChildSkillList
    self.SkillScroll01():RefillCells()
    --星星
    for i = 1, self.CurBossAttr.StartLV do
        GameObject.Instantiate(self.StarPrefabJueXing().gameObject,self.StarPanel().transform,false)
    end
    self.StarPrefab().gameObject:SetActive(false)
    self.StarPrefabJueXing().gameObject:SetActive(false)
end
function M:SkillCell(trans, idx)
    ---传入数据
    --trans:GetComponent("UITemplate"):SetData({ self.ChildSkillList[idx], self, self.CurBossAttr, false})
    trans:GetComponent("UITemplate"):SetData({ self.BossData,self.CurBossAttr,self.ChildSkillList[idx],self.BossData.skillLevel,"ParentSkill",idx })
    Tools.ReContentSizeGroup(self.SkillContent().gameObject)
end
---创建立绘
function M:CreatLiHui(_Root, _RoleId)
    MgrRes.LoadHDIcon_OriginalSize(_Root, _RoleId)
    local _PosInfoTab = CharactercoordinatesLocalData.tab[_RoleId].coordinate13
    local _tempPosTab1 = JNStrTool.strSplit(";", _PosInfoTab)
    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
    _Root.transform.localPosition = Vector3(tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),0)
    _Root.transform.localScale = Vector3(tonumber(_tempPosTab1[2]),tonumber(_tempPosTab1[2]),1)
end
function M:ShowSkillXiangqing()

end
return M