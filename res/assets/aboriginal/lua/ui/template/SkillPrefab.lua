-- Code Auto Create Begin
local M = Class('SkillPrefab', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/SkillPrefab.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'SkillPrefab','/',2},{'Img_Jinengdi','Img_Jinengdi',2},{'EX','EX',2},{'Img_Suo','Img_Suo',2},
        -- UITemplate 列表
        {'SkillPrefab01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Tag','EX/Text_Tag',20},{'Text_Jinengming','Text_Jinengming',20},{'Text_Jinengshuoming','Text_Jinengshuoming',20},{'Text_Jiesuotiaojian','Img_Suo/Text_Jiesuotiaojian',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_Jinengdian_hui().gameObject:SetActive(false)
    self.Img_Jinengdian1().gameObject:SetActive(false)
    self.Img_Jinengdian2().gameObject:SetActive(false)
    self.Img_Suo().gameObject:SetActive(false)
    self.Img_Tag().gameObject:SetActive(false)
    ---设置点击事件
    UIEvent.LuaClick(self.ObjRoot.gameObject,Handle(self,self.OnClickSelf))
end
function M:OnUpdateUI(pData)
    self.pData = pData[1]
    self.parent = pData[2]
    self.CurHeroAttr = pData[3]
    ---技能栏5为EX
    if self.pData.SkillNum ~= 5 then
        ---非EX技能有进阶星
        Tools.ClearAllChild(self.JinengdianPanel().gameObject)
        self.EX().gameObject:SetActive(false)
        for i, v in ipairs(self.pData.SkillLvStage) do
            if self.CurHeroAttr.SkillLV >= v then
                self:CreatObjInPanel(self.JinengdianPanel(),self.Img_Jinengdian1())
            else
                self:CreatObjInPanel(self.JinengdianPanel(),self.Img_Jinengdian_hui())
            end
        end
    end
    ---获取当前等级段的技能
    local tIsOpen = true
    local tMarkLv = self.pData.UnlockLv[1]
    for i, v in ipairs(self.pData.UnlockLv) do
        if self.CurHeroAttr.SkillLV >= v then
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
    if #tSkillList == 1 and SkillLocalData.tab[tSkillList[1]][8] == 1 then
        tIsAwaken = self.CurHeroAttr.IsAwaken
    end
    ---技能名
    self.Text_Jinengming().text = self.pData.GroupName[tMarkLv]

    self.CanClick = true

    if tIsOpen then
        ---技能说明
        if tIsAwaken then
            self.Text_Jinengshuoming().text = self.pData.Tips[tMarkLv]

            self.Img_Suo().gameObject:SetActive(false)
            self.JinengdianPanel().gameObject:SetActive(true)
        else
            self.Text_Jinengshuoming().text = ""
            self.Img_Suo().gameObject:SetActive(true)
            self.JinengdianPanel().gameObject:SetActive(false)

            self.CanClick = false
        end
        ---标签
        local tagObj = self:InitPanel(self.TagPanel().gameObject, self.Img_Tag(),#self.pData.TagList[tMarkLv])
        for i = 1, #tagObj do
            local tagStr = tagObj[i].transform:Find("Text_Tag").gameObject
            local tempTxt = SkilltxtLocalData.tab[tonumber(self.pData.TagList[tMarkLv][i])]
            if tempTxt == nil then
                print("标签ID不匹配")
                tagObj[i].gameObject:SetActive(false)
                return
            end
            tagStr:GetComponent("TextMeshProUGUI").text = tempTxt[2]
        end
    else
        self.Text_Jinengshuoming().text = ""
        self.Text_Jiesuotiaojian().text = string.format(MgrLanguageData.GetLanguageByKey("newroleskill_ui_text1"),tMarkLv)
        self.Img_Suo().gameObject:SetActive(true)
        self.JinengdianPanel().gameObject:SetActive(false)

        self.CanClick = false
    end
end
function M:OnClickSelf()
    if self.pData ~= nil and self.CanClick then
        self.parent:ShowSkillXiangqing(self.pData)
    end
end

--创建Panel中的元素 _Root为父节点
function M:CreatObjInPanel(_Root, _Prefab)
    local tempObj = GameObject.Instantiate(_Prefab, _Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3(tempObj.transform.localPosition.x, tempObj.transform.localPosition.y, 0)

    return tempObj
end
--初始化Panel中的元素
function M:InitPanel(_Root, _Prefab, _Count)
    Tools.ClearAllChild(_Root)
    local tempObjList = {}
    for i = 1, _Count, 1 do
        tempObjList[i] = self:CreatObjInPanel(_Root, _Prefab)
    end

    return tempObjList
end
return M