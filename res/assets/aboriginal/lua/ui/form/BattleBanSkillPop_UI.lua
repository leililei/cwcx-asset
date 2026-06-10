-- Code Auto Create Begin
local M = Class('BattleBanSkillPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BattleBanSkillPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BattleBanSkillPop_UI].prefab'
    self.Name = 'Form[BattleBanSkillPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BlurMask','BlurMask',2},{'Img_Tanchuangdi1','Img_Tanchuangdi1',2},{'Img_Xian1','Img_Xian1',2},{'Img_Xian2','Img_Xian2',2},{'Img_Jinengdi','Img_Jinengdi',2},{'SkillPanel','SkillPanel',2},{'Viewport','SkillPanel/Viewport',2},{'SkillContent','SkillPanel/Viewport/SkillContent',2},{'BanSkillPrefab','SkillPanel/Viewport/BanSkillPrefab',2},{'Img_Zijinengdi','SkillPanel/Viewport/BanSkillPrefab/Img_Zijinengdi',2},{'EquipRole','SkillPanel/Viewport/BanSkillPrefab/EquipRole',2},{'RoleIconFrame','SkillPanel/Viewport/BanSkillPrefab/EquipRole/RoleIconFrame',2},{'RoleIcon','SkillPanel/Viewport/BanSkillPrefab/EquipRole/RoleIcon',2},{'Img_Tag1','SkillPanel/Viewport/BanSkillPrefab/GameObject/Img_Tag1',2},{'Img_Tag2','SkillPanel/Viewport/BanSkillPrefab/GameObject/Img_Tag2',2},{'Img_Biaotixian','Img_Biaotixian',2},
        -- Text 列表
        {'Text_Jinengjinzhiliebiao','Text_Jinengjinzhiliebiao',3},{'Text_Shuoming','Text_Shuoming',3},{'Text_Title','Text_Title',3},
        -- TextMeshProUGUI 列表
        {'Text_SkillName','SkillPanel/Viewport/BanSkillPrefab/Text_SkillName',20},{'Text_Fujiashuoming','SkillPanel/Viewport/BanSkillPrefab/Img_Zijinengdi/Text_Fujiashuoming',20},{'Text_Tag1','SkillPanel/Viewport/BanSkillPrefab/GameObject/Img_Tag1/Text_Tag1',20},{'Text_Tag2','SkillPanel/Viewport/BanSkillPrefab/GameObject/Img_Tag2/Text_Tag2',20},
    }
end
-- Code Auto Create End
require("LocalData/SkilltypeoneLocalData")
require("LocalData/SkilltypetwoLocalData")

---初始化
function M:OnInit()
    UIEvent.LuaClick(self.BlurMask().gameObject,Handle(self,self.ClosePop))
    --self.BanSkillIconPrefab().gameObject:SetActive(false)
    self.BanSkillPrefab().gameObject:SetActive(false)
    --Event.Go("WorldBossHpClose",false)
end
---更新显示
function M:OnShow(args)
    local SkillStr =JNStrTool.strSplit(";",args[1])
    if self.SkillContent().transform.childCount>0 then
        Tools.ClearAllChild(self.SkillContent().gameObject)
    end
    for i, v in pairs(SkillStr) do
        if i == 1 and v == "0" then
            break
        end
        local skillData = JNSkill:new(tonumber(v),tonumber(SteamLocalData.tab[105008][2]),true,false)
        local obj = GameObject.Instantiate(self.BanSkillPrefab().gameObject,self.SkillContent().gameObject.transform,false)
        obj.gameObject:SetActive(true)
        --tag
        obj.transform:Find("Text_SkillName").gameObject:GetComponent("TextMeshProUGUI").text = skillData.Name
        obj.transform:Find("Img_Zijinengdi/Text_Fujiashuoming").gameObject:GetComponent("TextMeshProUGUI").text = skillData.Explain

        local skilldata = SkillLocalData.tab[tonumber(v)]
        if skilldata[40] ~= 0 then
            MgrRes.LoadCircleIcon(obj.transform:Find("EquipRole/RoleIcon").gameObject:GetComponent("Image"),skilldata[40])
        else
            obj.transform:Find("EquipRole").gameObject:SetActive(false)
        end
        local skillTypeOneData  = SkilltypeoneLocalData.tab[skilldata[10]]
        local skillTypeTwoData  = SkilltypetwoLocalData.tab[skilldata[11]]
        ---两个标签
        if skillTypeOneData then
            obj.transform:Find("GameObject/Img_Tag1/Text_Tag1").gameObject:GetComponent("TextMeshProUGUI").text = skillTypeOneData[2]
        else
            obj.transform:Find("GameObject/Img_Tag1").gameObject:SetActive(false)
        end
        if skillTypeTwoData then
            obj.transform:Find("GameObject/Img_Tag2/Text_Tag2").gameObject:GetComponent("TextMeshProUGUI").text = skillTypeTwoData[2]
        else
            obj.transform:Find("GameObject/Img_Tag2").gameObject:SetActive(false)
        end
    end
end
function M:ClosePop()
    MgrUI.ClosePop(self.Uid)
end
return M