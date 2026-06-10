-- Code Auto Create Begin
local M = Class('DrawResultPop_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawResultPop_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawResultPop_UI].prefab'
    self.Name = 'Form[DrawResultPop_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 6
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundPanel','BackGroundPanel',2},{'BgPanel_SSR','BackGroundPanel/BgPanel_SSR',2},{'di','BackGroundPanel/BgPanel_SSR/di',2},{'BgPanel_SR','BackGroundPanel/BgPanel_SR',2},{'di01','BackGroundPanel/BgPanel_SR/di',2},{'BgPanel_R','BackGroundPanel/BgPanel_R',2},{'di02','BackGroundPanel/BgPanel_R/di',2},{'wangge','BackGroundPanel/wangge',2},{'wenzi','BackGroundPanel/wenzi',2},{'wenzi(1)','BackGroundPanel/wenzi (1)',2},{'wenzi(2)','BackGroundPanel/wenzi (2)',2},{'dian','BackGroundPanel/dian',2},{'bianxian','BackGroundPanel/bianxian',2},{'nengliangtiao','BackGroundPanel/nengliangtiao',2},{'GroupPanel','GroupPanel',2},{'geizi','GroupPanel/geizi',2},{'logo','GroupPanel/logo',2},{'sijiao','GroupPanel/sijiao',2},{'RoleGroupIconImg','GroupPanel/RoleGroupIconImg',2},{'BgSprite','BgSprite',2},{'LihuiPanel','LihuiPanel',2},{'LihuiRoot','LihuiPanel/LihuiRoot',2},{'FrontSprite','FrontSprite',2},{'UI_Canvas','UI_Canvas',2},{'VoicePanel','UI_Canvas/VoicePanel',2},{'yuyinzhezhao','UI_Canvas/VoicePanel/yuyinzhezhao',2},{'fenggexian','UI_Canvas/VoicePanel/fenggexian',2},{'RoleInfoPanel','UI_Canvas/RoleInfoPanel',2},{'idxian','UI_Canvas/RoleInfoPanel/idxian',2},{'yingwendi','UI_Canvas/RoleInfoPanel/yingwendi',2},{'jiaobiao','UI_Canvas/RoleInfoPanel/jiaobiao',2},{'Img_IDXian','UI_Canvas/RoleInfoPanel/Img_IDXian',2},{'tiao','UI_Canvas/RoleInfoPanel/tiao',2},{'ProIconImg','UI_Canvas/RoleInfoPanel/ProIconImg',2},{'Chenghao','UI_Canvas/RoleInfoPanel/Chenghao',2},{'NewTagPanel','UI_Canvas/NewTagPanel',2},{'newdi','UI_Canvas/NewTagPanel/newdi',2},{'new','UI_Canvas/NewTagPanel/new',2},{'StarPanel','UI_Canvas/StarPanel',2},{'guang2','UI_Canvas/StarPanel/guang2',2},{'StarPrefab','UI_Canvas/StarPanel/StarPrefab',2},{'RoleStarRoot','UI_Canvas/StarPanel/RoleStarRoot',2},{'SSROpenVfx','UI_Canvas/SSROpenVfx',2},{'SROpenVfx','UI_Canvas/SROpenVfx',2},{'ROpenVfx','UI_Canvas/ROpenVfx',2},{'Btn_ClickClose','UI_Canvas/Btn_ClickClose',2},{'Btn_TenthResultNext','UI_Canvas/Btn_TenthResultNext',2},{'Btn_SkipAni','UI_Canvas/Btn_SkipAni',2},{'SkipPanel','UI_Canvas/SkipPanel',2},{'Btn_SkipText','UI_Canvas/SkipPanel/Btn_SkipText',2},{'Btn_Skip','UI_Canvas/SkipPanel/Btn_SkipText/Btn_Skip',2},{'RepeatStuff','UI_Canvas/RepeatStuff/RepeatStuff',2},{'RepeatStuffBg','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBg',2},{'RepeatStuffBracket','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBracket',2},{'Icon_kuang','UI_Canvas/RepeatStuff/RepeatStuff/Icon_kuang',2},{'Icon_SkillBook','UI_Canvas/RepeatStuff/RepeatStuff/Icon_SkillBook',2},{'CountBG','UI_Canvas/RepeatStuff/RepeatStuff/CountBG',2},{'FenxiangPanel','UI_Canvas/FenxiangPanel',2},{'Btn_Fenxiang','UI_Canvas/FenxiangPanel/Btn_Fenxiang',2},{'BlurMask','UI_Canvas/FenxiangPanel/BlurMask',2},{'JietuPanel','UI_Canvas/FenxiangPanel/JietuPanel',2},{'Jietu','UI_Canvas/FenxiangPanel/JietuPanel/Jietu',2},{'logo01','UI_Canvas/FenxiangPanel/JietuPanel/logo',2},{'Btn_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB',2},{'FBicon','UI_Canvas/FenxiangPanel/Content/Btn_FB/FBicon',2},{'Btn_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE',2},{'LINEicon','UI_Canvas/FenxiangPanel/Content/Btn_LINE/LINEicon',2},{'Btn_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB',2},{'XBicon','UI_Canvas/FenxiangPanel/Content/Btn_XB/XBicon',2},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','UI_Canvas/VoicePanel/RoleVoiceWordText',20},{'ProTextEN','UI_Canvas/RoleInfoPanel/yingwendi/ProTextEN',20},{'ProTextCN','UI_Canvas/RoleInfoPanel/jiaobiao/ProTextCN',20},{'RoleNameText','UI_Canvas/RoleInfoPanel/RoleNameText',20},{'Text_Chenghao','UI_Canvas/RoleInfoPanel/Chenghao/Text_Chenghao',20},{'Text','UI_Canvas/SkipPanel/Btn_SkipText/Text',20},{'RepeatStuffBgText','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBg/RepeatStuffBgText',20},{'RepeatStuffBracketText','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBracket/RepeatStuffBracketText',20},{'Text_Count','UI_Canvas/RepeatStuff/RepeatStuff/CountBG/Text_Count',20},{'Text_Fenxiang','UI_Canvas/FenxiangPanel/Btn_Fenxiang/Text_Fenxiang',20},{'Text_UID','UI_Canvas/FenxiangPanel/JietuPanel/Text_UID',20},{'Text_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB/Text_FB',20},{'Text_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE/Text_LINE',20},{'Text_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB/Text_XB',20},
    }
end
-- Code Auto Create End
require("LocalData/CharactercoordinatesLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/ActorLinesLocalData")

local TimerName_RepeatStuff = "RepeatStuffTimer"
local TimerName_CreateStar = "CreateStarTimer"

function M:OnInit()
    self.FenxiangPanel().gameObject:SetActive(false)
    ---当前异步创建星星是否结束
    self.Bool_IsAsyncCreatStarOver=true
    ---当前显示角色的星级
    self.Int_CurRoleStarLv = 0
    self.Int_CurTenthResultIndex = 1 --当前十连抽循环初始化下标
    self.CurAsyncCreatStarConut = 0 --已经生成的星星数量
    self.CurAsyncCreatStarMaxCount = 0 --异步生成星星的数量上限
    self.CurTargetAsyncStarPrefab = nil --异步生成星星Prefab预制体
    self.CurTargetAsyncCreatStarRoot = nil --异步生成星星目标Root节点
    ---立绘
    self.SpineObj = nil
    self.SpinePath = nil
    self.FrontPath = nil
    self.FrontSpine = nil
    self.BGPath = nil
    self.BGSpine = nil
    
    self.StarPrefab().gameObject:SetActive(false)
    self.Btn_SkipAni().gameObject:SetActive(false)
    self.Btn_ClickClose().gameObject:SetActive(false)

    self.BgPanel_SSR().gameObject:SetActive(false)
    self.BgPanel_SR().gameObject:SetActive(false)
    self.BgPanel_R().gameObject:SetActive(false)

    self.SSROpenVfx().gameObject:SetActive(false)
    self.SROpenVfx().gameObject:SetActive(false)
    self.ROpenVfx().gameObject:SetActive(false)

    self.Btn_TenthResultNext().gameObject:SetActive(false)

    UIEvent.LuaClick(self.Btn_SkipAni().gameObject,Handle(self,function ()
        self.Bool_IsAsyncCreatStarOver = true
        Tools.ClearAllChild(self.RoleStarRoot().gameObject)
        for i = 1, self.Int_CurRoleStarLv, 1 do
            local UnJuxingStar = GameObject.Instantiate(self.StarPrefab().gameObject,self.RoleStarRoot().gameObject.transform)
            UnJuxingStar.gameObject:SetActive(true)
            UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
        end
        self.Btn_ClickClose().gameObject:SetActive(true)
        self.Btn_SkipAni().gameObject:SetActive(false)
    end))

    UIEvent.LuaClick(self.Btn_TenthResultNext().gameObject,Handle(self,function()
        self:ClickTenthRoleResultShow()
    end))

    UIEvent.LuaClick(self.SkipPanel().gameObject,Handle(self,function ()
        MgrUI.ClosePop(self.Uid)
    end))
end

function M:OnShow(args)
    ---@type HeroInfo2[]
    self.pData = args[1]
    self.CreateTime = MgrNet.GetServerTime()
    self.Int_CurTenthResultIndex = 1
    self.Btn_TenthResultNext().gameObject:SetActive(true)
end
function M:OnShowFinish()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    self:ClickTenthRoleResultShow()
end

---连抽循环初始化方法
function M:ClickTenthRoleResultShow()
    if self.Int_CurTenthResultIndex > #self.pData then
        -- 已经初始化完成十张
        if MgrNet.GetServerTime() - self.CreateTime > 3 then
            MgrUI.ClosePop(self.Uid)
        end
        return
    end
    local tHeroInfo = self.pData[self.Int_CurTenthResultIndex]
    if HeroControl.GetRoleDataByID(tHeroInfo.heroID) then
        self:InitResultPanel(tHeroInfo)
    else
        self:InitResultSkin(tHeroInfo)
    end
    self.Int_CurTenthResultIndex = self.Int_CurTenthResultIndex + 1
end

---@param _hero HeroInfo2 初始化界面信息
function M:InitResultPanel(_hero)
    self.GroupPanel().gameObject:SetActive(true);
    local _roleId = _hero.heroID
    Tools.ClearAllChild(self.LihuiRoot().gameObject)
    local heroData = HeroControl.GetRoleDataByID(_roleId)
    if heroData.lockState == true then
        -- 已拥有
        self.NewTagPanel().gameObject:SetActive(false)
    else
        self.NewTagPanel().gameObject:SetActive(true)
    end
    local role = RoleattributeLocalData.tab[_roleId]
    local char = CharactercoordinatesLocalData.tab[role[1]]
    local _tempPosTab1 =JNStrTool.strSplit(";", char.coordinate2)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    local str = string.split(role[53],"_")
    self.RepeatStuffCount = tonumber(str[3])
    local goods = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
    if heroData.lockState then
        -- 弹出重复的角色的技能书
        MgrTimer.AddDelay(TimerName_RepeatStuff, 1, function() 
            self:ShowRepeatStuff(goods)
        end)
    end
    --MgrRes.LoadWatchAuto(self.LihuiRoot().gameObject,role[1],tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]))
    MgrRes.LoadWatch3DSpineInUI(self.LihuiRoot().gameObject, role[1], tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 1,"Default")
        end
        self.SpinePath = MgrRes.GetWatch3DSpinePath(role[1])
        self.SpineObj = obj
    end)
    ---名字
    self.RoleNameText().text= role[2]
    ---称号
    local skillData = HeroControl.GetSkinDataBySkinId(_roleId)
    self.Text_Chenghao().text = skillData.skinName

    MgrRes.LoadSprite(self.ProIconImg(),"Attribute/ProIcon_"..role[5])
    MgrRes.LoadSprite(self.RoleGroupIconImg(),"Attribute/"..role[58])
    
    if role[21]>4 then
        self:SwitchBG("ssr")
    elseif role[21]>3 then
        self:SwitchBG("sr")
    else
        self:SwitchBG("r")
    end
    if role[5] == 1 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour")
        self.ProTextEN().text="GUARD"
    elseif role[5] == 2 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger")
        self.ProTextEN().text="PUNCH"
    elseif role[5] == 3 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower")
        self.ProTextEN().text="STRAFE"
    elseif role[5] == 4 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter")
        self.ProTextEN().text="SUPPORT"
    elseif role[5] == 11 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_surpries")
        self.ProTextEN().text="SUPER"
    end
    self.Int_CurRoleStarLv = role[21]
    self.Btn_SkipAni().gameObject:SetActive(true)
    Tools.ClearAllChild(self.RoleStarRoot().gameObject)
    self.CurAsyncCreatStarConut = 0
    self.CurAsyncCreatStarMaxCount = tonumber(role[21])
    self.CurTargetAsyncStarPrefab = self.StarPrefab().gameObject
    self.CurTargetAsyncCreatStarRoot = self.RoleStarRoot().gameObject
    self.Bool_IsAsyncCreatStarOver=false
    ---循环异步延迟生成星星
    self:AsyncCreatStar()
    --播放语音及文字
    self:PlayVoice(_roleId)
end

function M:SwitchBG(type)
    self.SSROpenVfx().gameObject:SetActive(false)
    self.SROpenVfx().gameObject:SetActive(false)
    self.ROpenVfx().gameObject:SetActive(false)
    if type == "ssr" then
        self.BgPanel_SSR().gameObject:SetActive(true)
        self.BgPanel_SR().gameObject:SetActive(false)
        self.BgPanel_R().gameObject:SetActive(false)
        self.SSROpenVfx().gameObject:SetActive(true)
        self.SROpenVfx().gameObject:SetActive(false)
        self.ROpenVfx().gameObject:SetActive(false)
    elseif type == "sr" then
        self.BgPanel_SSR().gameObject:SetActive(false)
        self.BgPanel_SR().gameObject:SetActive(true)
        self.BgPanel_R().gameObject:SetActive(false)
        self.SSROpenVfx().gameObject:SetActive(false)
        self.SROpenVfx().gameObject:SetActive(true)
        self.ROpenVfx().gameObject:SetActive(false)
    elseif type == "r" then
        self.BgPanel_SSR().gameObject:SetActive(false)
        self.BgPanel_SR().gameObject:SetActive(false)
        self.BgPanel_R().gameObject:SetActive(true)
        self.SSROpenVfx().gameObject:SetActive(false)
        self.SROpenVfx().gameObject:SetActive(false)
        self.ROpenVfx().gameObject:SetActive(true)
    end
end

---循环异步延迟生成星星
function M:AsyncCreatStar()
    -- statements
    if self.CurAsyncCreatStarConut >= self.CurAsyncCreatStarMaxCount  or self.Bool_IsAsyncCreatStarOver == true then
        -- 已经生成达到目标
        self.Btn_SkipAni().gameObject:SetActive(false)
        return
    end
    --local UnJuxingStar=GameObject.Instantiate(self.CurTargetAsyncCreatStarRoot,self.CurTargetAsyncStarPrefab.transform)
    local UnJuxingStar=GameObject.Instantiate(self.CurTargetAsyncStarPrefab,self.CurTargetAsyncCreatStarRoot.transform)
    UnJuxingStar.gameObject:SetActive(true)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)

    self.CurAsyncCreatStarConut = self.CurAsyncCreatStarConut + 1
    MgrTimer.AddRepeat(TimerName_CreateStar, 0.1, Handle(self, self.AsyncCreatStar), self.CurAsyncCreatStarMaxCount)
end

function M:ShowRepeatStuff(goodData)
    self.RepeatStuff().gameObject:SetActive(true)
    ---根据角色的星数开启不同的材料
    MgrRes.LoadSprite(self.Icon_SkillBook(),goodData.icon)
    MgrRes.LoadSprite(self.Icon_kuang(),goodData.iconFrame)
    self.RepeatStuffBracketText().text = goodData.name
    self.Text_Count().text = self.RepeatStuffCount
    Global.DoMoveX(self.RepeatStuff().gameObject,-600,0.3)
end
---皮肤展示
function M:InitResultSkin(_hero)
    self.GroupPanel().gameObject:SetActive(false);
    self:ClearSkin();
    local _roleId = _hero.heroID
    local skinData = HeroControl.GetSkinDataBySkinId(_roleId)
    local heroData = HeroControl.GetRoleDataByID(skinData.roleId)
    local char = CharactercoordinatesLocalData.tab[_roleId]
    local _tempPosTab1 =JNStrTool.strSplit(";", char.coordinate2)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])
    --角色Spine
    MgrRes.LoadWatch3DSpineInUI(self.LihuiRoot().gameObject, _roleId, tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 2,"Default")
        end
        self.SpinePath = MgrRes.GetWatch3DSpinePath(_roleId)
        self.SpineObj = obj
    end)
    --前景Spine
    if skinData.foregroundpic ~= "0" then
        local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate9,";")
        local x = tonumber(string.split(coordinate[1],",")[1])
        local y = tonumber(string.split(coordinate[1],",")[2])
        local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
        MgrRes.LoadSkinFrontBG(skinData.type,self.FrontSprite(),skinData.foregroundpic,self.FrontSprite().gameObject,x,y,scale,nil,function(_ReturnObj)
            _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder + 3,"Default")
            self.FrontPath = MgrRes.GetLocalizedPath(skinData.foregroundpic)
            self.FrontSpine = _ReturnObj
        end)
    end
    --背景Spine
    if skinData.backgroundpic ~= "0" then
        if string.find(skinData.backgroundpic,'Watch_3D_bg') then
            local coordinate = string.split(CharactercoordinatesLocalData.tab[skinData.id].coordinate8,";")
            local x = tonumber(string.split(coordinate[1],",")[1])
            local y = tonumber(string.split(coordinate[1],",")[2])
            local scale = coordinate[3] == '0' and tonumber(coordinate[2]) or -tonumber(coordinate[2])
            MgrRes.LoadCgSpine(self.BgSprite().gameObject, skinData.id,skinData.backgroundpic,x,y,scale,skinData.morning,function(_ReturnObj)
                _ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(self.CavOrder + 1,"Default")
                _ReturnObj.layer = 5
                self.BGPath = MgrRes.GetLocalizedPath(skinData.backgroundpic)
                self.BGSpine = _ReturnObj
            end,true)
        end
        self.SSROpenVfx().gameObject:SetActive(true)
    else
        self:SwitchBG("ssr");
    end
    ---名字
    self.RoleNameText().text = skinData.roleName
    ---称号
    self.Text_Chenghao().text = skinData.skinName
    
    self.NewTagPanel().gameObject:SetActive(false)

    --职业
    MgrRes.LoadSprite(self.ProIconImg(),"Attribute/ProIcon_"..heroData.career)
    if heroData.career == 1 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour")
        self.ProTextEN().text="GUARD"
    elseif heroData.career == 2 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger")
        self.ProTextEN().text="PUNCH"
    elseif heroData.career == 3 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower")
        self.ProTextEN().text="STRAFE"
    elseif heroData.career == 4 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter")
        self.ProTextEN().text="SUPPORT"
    elseif heroData.career == 11 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_surpries")
        self.ProTextEN().text="SUPER"
    end
    --播放语音及文字
    self:PlayVoice(_roleId)
end
---播放语音及文字
function M:PlayVoice(_roleId)
    local idx = 0
    local _AudioName = "0"
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _roleId then
            if value[3] == 3 then
                self.RoleVoiceWordText().text = value[7]
                idx = idx + 1
            end
            if value[4] == 3 then
                _AudioName = value [13]
                idx = idx + 1
            end
            if idx >= 2 then
                break
            end
        end
    end
    if _AudioName == "0" then
        MgrSound.Stop(3,"CardRoleVoice",false)
        return
    else
        ---停止语音
        MgrSound.Stop(3)
        MgrSound.PlayRole(_AudioName,nil,nil,false,0,0,"CardRoleVoice")
    end
end

function M:OnClose()
    MgrSound.Stop(3,"CardRoleVoice",false)
    -- AutoDestroyOwner 好像并不保险，依旧可能报空
    MgrTimer.Cancel(TimerName_RepeatStuff)
    MgrTimer.Cancel(TimerName_CreateStar)
    MgrTimer.Cancel("repeatCharacter")
    self:ClearSkin();
    MgrRes.UnLoadUnusedAssets(true)
end

function M:ClearSkin()
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
        if self.SpinePath ~= nil then
            MgrRes.UnLoadAssetBundle(self.SpinePath)
            self.SpinePath = nil
        end
    end
    if self.BGSpine ~= nil then
        GameObject.Destroy(self.BGSpine)
        self.BGSpine = nil
        if self.BGPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.BGPath)
            self.BGPath = nil
        end
    end
    ---清理旧前景spine
    if self.FrontSpine ~= nil then
        GameObject.Destroy(self.FrontSpine)
        self.FrontSpine = nil
        if self.FrontPath ~= nil then
            MgrRes.UnLoadAssetBundle(self.FrontPath)
            self.FrontPath = nil
        end
    end
end

return M