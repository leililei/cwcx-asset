-- Code Auto Create Begin
local M = Class('DrawResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.DrawResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[DrawResult_UI].prefab'
    self.Name = 'Form[DrawResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 6
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundPanel','BackGroundPanel',2},{'BgPanel_SSR','BackGroundPanel/BgPanel_SSR',2},{'di','BackGroundPanel/BgPanel_SSR/di',2},{'BgPanel_SR','BackGroundPanel/BgPanel_SR',2},{'di01','BackGroundPanel/BgPanel_SR/di',2},{'BgPanel_R','BackGroundPanel/BgPanel_R',2},{'di02','BackGroundPanel/BgPanel_R/di',2},{'wangge','BackGroundPanel/wangge',2},{'wenzi','BackGroundPanel/wenzi',2},{'wenzi(1)','BackGroundPanel/wenzi (1)',2},{'wenzi(2)','BackGroundPanel/wenzi (2)',2},{'dian','BackGroundPanel/dian',2},{'bianxian','BackGroundPanel/bianxian',2},{'nengliangtiao','BackGroundPanel/nengliangtiao',2},{'GroupPanel','GroupPanel',2},{'geizi','GroupPanel/geizi',2},{'logo','GroupPanel/logo',2},{'sijiao','GroupPanel/sijiao',2},{'RoleGroupIconImg','GroupPanel/RoleGroupIconImg',2},{'Ui_chouka_R','Ui_chouka_R',2},{'Ui_chouka_SR','Ui_chouka_SR',2},{'Ui_chouka_SSR','Ui_chouka_SSR',2},{'LihuiPanel','LihuiPanel',2},{'LihuiRoot','LihuiPanel/LihuiRoot',2},{'UI_Canvas','UI_Canvas',2},{'VoicePanel','UI_Canvas/VoicePanel',2},{'yuyinzhezhao','UI_Canvas/VoicePanel/yuyinzhezhao',2},{'fenggexian','UI_Canvas/VoicePanel/fenggexian',2},{'RoleInfoPanel','UI_Canvas/RoleInfoPanel',2},{'idxian','UI_Canvas/RoleInfoPanel/idxian',2},{'yingwendi','UI_Canvas/RoleInfoPanel/yingwendi',2},{'jiaobiao','UI_Canvas/RoleInfoPanel/jiaobiao',2},{'Img_IDXian','UI_Canvas/RoleInfoPanel/Img_IDXian',2},{'tiao','UI_Canvas/RoleInfoPanel/tiao',2},{'ProIconImg','UI_Canvas/RoleInfoPanel/ProIconImg',2},{'Chenghao','UI_Canvas/RoleInfoPanel/Chenghao',2},{'NewTagPanel','UI_Canvas/NewTagPanel',2},{'newdi','UI_Canvas/NewTagPanel/newdi',2},{'new','UI_Canvas/NewTagPanel/new',2},{'StarPanel','UI_Canvas/StarPanel',2},{'guang1','UI_Canvas/StarPanel/guang1',2},{'guang2','UI_Canvas/StarPanel/guang2',2},{'StarPrefab','UI_Canvas/StarPanel/StarPrefab',2},{'RoleStarRoot','UI_Canvas/StarPanel/RoleStarRoot',2},{'Btn_ClickClose','UI_Canvas/Btn_ClickClose',2},{'Btn_TenthResultNext','UI_Canvas/Btn_TenthResultNext',2},{'Btn_SkipAni','UI_Canvas/Btn_SkipAni',2},{'SkipPanel','UI_Canvas/SkipPanel',2},{'Btn_SkipText','UI_Canvas/SkipPanel/Btn_SkipText',2},{'Btn_Skip','UI_Canvas/SkipPanel/Btn_SkipText/Btn_Skip',2},{'RepeatStuff','UI_Canvas/RepeatStuff/RepeatStuff',2},{'RepeatStuffBg','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBg',2},{'RepeatStuffBracket','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBracket',2},{'Icon_kuang','UI_Canvas/RepeatStuff/RepeatStuff/Icon_kuang',2},{'Icon_SkillBook','UI_Canvas/RepeatStuff/RepeatStuff/Icon_SkillBook',2},{'CountBG','UI_Canvas/RepeatStuff/RepeatStuff/CountBG',2},{'Logo_UIDPanel','UI_Canvas/Logo_UIDPanel',2},{'logo01','UI_Canvas/Logo_UIDPanel/logo',2},{'Btn_Fenxiang','UI_Canvas/FenxiangPanel/Btn_Fenxiang',2},{'BlurMask','UI_Canvas/FenxiangPanel/BlurMask',2},{'JietuPanel','UI_Canvas/FenxiangPanel/JietuPanel',2},{'Jietu','UI_Canvas/FenxiangPanel/JietuPanel/Jietu',2},{'logo02','UI_Canvas/FenxiangPanel/JietuPanel/logo',2},{'Content','UI_Canvas/FenxiangPanel/Content',2},{'Btn_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB',2},{'FBicon','UI_Canvas/FenxiangPanel/Content/Btn_FB/FBicon',2},{'Btn_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE',2},{'LINEicon','UI_Canvas/FenxiangPanel/Content/Btn_LINE/LINEicon',2},{'Btn_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB',2},{'XBicon','UI_Canvas/FenxiangPanel/Content/Btn_XB/XBicon',2},{'QRCode','UI_Canvas/FenxiangPanel/QRCode',2},{'CardDrawBadgeVideoRT','UI_Canvas/CardDrawBadgeVideoRT',2},
        -- TextMeshProUGUI 列表
        {'RoleVoiceWordText','UI_Canvas/VoicePanel/RoleVoiceWordText',20},{'ProTextEN','UI_Canvas/RoleInfoPanel/yingwendi/ProTextEN',20},{'ProTextCN','UI_Canvas/RoleInfoPanel/jiaobiao/ProTextCN',20},{'RoleNameText','UI_Canvas/RoleInfoPanel/RoleNameText',20},{'Text_Chenghao','UI_Canvas/RoleInfoPanel/Chenghao/Text_Chenghao',20},{'Text','UI_Canvas/SkipPanel/Btn_SkipText/Text',20},{'RepeatStuffBgText','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBg/RepeatStuffBgText',20},{'RepeatStuffBracketText','UI_Canvas/RepeatStuff/RepeatStuff/RepeatStuffBracket/RepeatStuffBracketText',20},{'Text_Count','UI_Canvas/RepeatStuff/RepeatStuff/CountBG/Text_Count',20},{'Text_UID','UI_Canvas/Logo_UIDPanel/Text_UID',20},{'Text_Fenxiang','UI_Canvas/FenxiangPanel/Btn_Fenxiang/Text_Fenxiang',20},{'Text_UID01','UI_Canvas/FenxiangPanel/JietuPanel/Text_UID',20},{'Text_FB','UI_Canvas/FenxiangPanel/Content/Btn_FB/Text_FB',20},{'Text_LINE','UI_Canvas/FenxiangPanel/Content/Btn_LINE/Text_LINE',20},{'Text_XB','UI_Canvas/FenxiangPanel/Content/Btn_XB/Text_XB',20},
    }
end
-- Code Auto Create End
require("LocalData/CharactercoordinatesLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/ActorLinesLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.Btn_Fenxiang().gameObject:SetActive(false)
    ---当前异步创建星星是否结束
    self.Bool_IsAsyncCreatStarOver=true
    ---当前显示角色的星级
    self.Int_CurRoleStarLv = 0
    self.Int_CurTenthResultIndex = 1 --当前十连抽循环初始化下标
    self.CurDelayCreatStar = 0 --异步生成星星延迟间隔
    self.CurAsyncCreatStarConut = 0 --已经生成的星星数量
    self.CurAsyncCreatStarMaxCount = 0 --异步生成星星的数量上限
    self.CurTargetAsyncStarPrefab = nil --异步生成星星Prefab预制体
    self.CurTargetAsyncCreatStarRoot = nil --异步生成星星目标Root节点
    self.QRCode().gameObject:SetActive(false)
    self.StarPrefab().gameObject:SetActive(false)
    self.Btn_SkipAni().gameObject:SetActive(false)
    self.Btn_ClickClose().gameObject:SetActive(false)
    self.BgPanel_SSR().gameObject:SetActive(false)
    self.BgPanel_SR().gameObject:SetActive(false)
    self.BgPanel_R().gameObject:SetActive(false)
    self.Ui_chouka_SSR().gameObject:SetActive(false)
    self.Ui_chouka_SR().gameObject:SetActive(false)
    self.Ui_chouka_R().gameObject:SetActive(false)
    self.Btn_TenthResultNext().gameObject:SetActive(false)
    self.RepeatStuff().gameObject:SetActive(false)
    self.BlurMask().gameObject:SetActive(false)
    self.JietuPanel().gameObject:SetActive(false)
    self.Content().gameObject:SetActive(false)
    self.Logo_UIDPanel().gameObject:SetActive(false)
    self.Text_UID().text = "UID : ".. PlayerControl.GetPlayerData().UID
    SysNoticeControl.Hide()
    self:InitButton()
end

function M:OnUpdateUI()
    ---设置CanvasOrder为 UIBase self.CavOrder
    self.UI_Canvas().transform:GetComponent("Canvas").sortingOrder = self.CavOrder + 5
    if NormalCardDrawViewModel.CountType == 0 then
        self.SkipPanel().gameObject:SetActive(false)
        self:InitSingleDraw()
    elseif NormalCardDrawViewModel.CountType == 1 then
        self.SkipPanel().gameObject:SetActive(true)
        self:InitTenthDraw()
    end
end

function M:SwitchBG(type)
    self.Ui_chouka_SSR().gameObject:SetActive(false)
    self.Ui_chouka_SR().gameObject:SetActive(false)
    self.Ui_chouka_R().gameObject:SetActive(false)
    MgrSound.PlayEffect("yx_ui_juesechouka_01",nil,nil,false)
    if type == "ssr" then
        self.BgPanel_SSR().gameObject:SetActive(true)
        self.BgPanel_SR().gameObject:SetActive(false)
        self.BgPanel_R().gameObject:SetActive(false)
        self.Ui_chouka_SSR().gameObject:SetActive(true)
        self.Ui_chouka_SR().gameObject:SetActive(false)
        self.Ui_chouka_R().gameObject:SetActive(false)
    elseif type == "sr" then
        self.BgPanel_SSR().gameObject:SetActive(false)
        self.BgPanel_SR().gameObject:SetActive(true)
        self.BgPanel_R().gameObject:SetActive(false)
        self.Ui_chouka_SSR().gameObject:SetActive(false)
        self.Ui_chouka_SR().gameObject:SetActive(true)
        self.Ui_chouka_R().gameObject:SetActive(false)
    elseif type == "r" then
        self.BgPanel_SSR().gameObject:SetActive(false)
        self.BgPanel_SR().gameObject:SetActive(false)
        self.BgPanel_R().gameObject:SetActive(true)
        self.Ui_chouka_SSR().gameObject:SetActive(false)
        self.Ui_chouka_SR().gameObject:SetActive(false)
        self.Ui_chouka_R().gameObject:SetActive(true)
    end
end

function M:OnBackKey()
    local isFenxiangPanel = self.Btn_Fenxiang().gameObject.activeSelf
    local isBtn_TenthResultNext = self.Btn_TenthResultNext().gameObject.activeSelf
    local isBtn_ClickClose =  self.Btn_ClickClose().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if not isFenxiangPanel then
            self:CloseShare(false)
            self.QRCode().gameObject:SetActive(false)
            self.RepeatStuff().gameObject:SetActive(true)
            self.Btn_Fenxiang().gameObject:SetActive(true)
            self.Logo_UIDPanel().gameObject:SetActive(false)
            CMgrUI.Instance:OpenClickRoot()
            return
        end
    end

    if isBtn_ClickClose and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrTimer.Cancel("repeatCharacter")
        MgrTimer.Cancel("repeatCharacterclose")
        ---单抽直接返回抽卡界面
        NormalCardDrawViewModel.BackToCardDrawUI()
    end
    --下一个抽奖结果界面
    -- statements
    if isBtn_TenthResultNext and MgrUI.IsShow(self.Uid) then
        local roles = RoleCardViewModel.CacheRoleDataArr---已经拥有的角色列表
        self.Btn_TenthResultNext().gameObject:SetActive(false)
        MgrTimer.AddDelayNoName(0.2,function() self.Btn_TenthResultNext().gameObject:SetActive(true) end,nil)
        --判断下一角色是否为SSR
        if self.Int_CurTenthResultIndex > CardDrawControl.HeroCount then
            Event.Remove("BackKey", Handle(self, self.OnBackKey))
            self:ClickTenthRoleResultShow()
            return
        end
        local info = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][6]
        --这里判断是否为商品 是商品就直接显示界面不播徽章动画
        local isNew =  NormalCardDrawViewModel.GetIsNewSSR(NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1])
        local isGoods = NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][2]
        if info >= 4 and not isNew and isGoods == 0 then
            local badgeName = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][86]
            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
            MgrTimer.AddDelayNoName(1.6,function() self:ClickTenthRoleResultShow() end,nil)
        else
            self:ClickTenthRoleResultShow()
        end
        return
    end

end

---初始化按钮
function M:InitButton()
    UIEvent.LuaClick(self.Btn_SkipAni().gameObject,Handle(self,function ()
        -- statements
        self.Bool_IsAsyncCreatStarOver=true
        self:InitStarPanelImmediately(self.Int_CurRoleStarLv,self.RoleStarRoot().gameObject,self.StarPrefab().gameObject)
        self.Btn_ClickClose().gameObject:SetActive(true)
        self.Btn_SkipAni().gameObject:SetActive(false)
    end))
    UIEvent.LuaClick(self.Btn_TenthResultNext().gameObject,Handle(self,function ()
        -- statements
        self.RepeatStuff().gameObject:SetActive(false)
        self:DrawResultInfoControl(false)
        for i = 1,self.LihuiRoot().transform.childCount do
            GameObject.Destroy(self.LihuiRoot().transform:GetChild(i - 1).gameObject)
        end
        local roles = RoleCardViewModel.CacheRoleDataArr---已经拥有的角色列表
        self.Btn_TenthResultNext().gameObject:SetActive(false)
        MgrTimer.AddDelayNoName(0.2,function() self.Btn_TenthResultNext().gameObject:SetActive(true) end,nil)
        --判断下一角色是否为SSR
        if self.Int_CurTenthResultIndex > CardDrawControl.HeroCount then
            self:ClickTenthRoleResultShow()
            return
        end
        local info = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][6]

        --这里判断是否为商品 是商品就直接显示界面不播徽章动画

        local isNew =  NormalCardDrawViewModel.GetIsNewSSR(NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1])
        local isGoods = NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][2]
        if info >= 4 and not isNew and isGoods == 0 then
            local badgeName = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][86]
            
            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
            MgrTimer.AddDelayNoName(1.7,function() self:ClickTenthRoleResultShow() end,nil)
            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
        else
            --self:ClickTenthRoleResultShow()

            local badgeName = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][86]
            if badgeName and badgeName ~= "0"then
                
                MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                MgrTimer.AddDelayNoName(1.7,function() self:ClickTenthRoleResultShow() end,nil)
                MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
            else
                self:ClickTenthRoleResultShow()
            end
        end
    end))
    UIEvent.LuaClick(self.SkipPanel().gameObject,Handle(self,function ()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        -- statements 
        MgrTimer.Reset()
       -- LuaAudioPlayer.ResetSingleVoiceAudio()
       self:SkipPanelClick()

       self.Btn_TenthResultNext().gameObject:SetActive(false)
       MgrTimer.AddDelayNoName(0.2,function() self.Btn_TenthResultNext().gameObject:SetActive(true) end,nil)
       --判断下一角色是否为SSR
       if self.Int_CurTenthResultIndex > CardDrawControl.HeroCount then
           self:ClickTenthRoleResultShow()
           return
       end
       local info = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][6]
       if info >= 4 then
            local badgeName = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]][86]
            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
            MgrTimer.AddDelayNoName(1.6,function() self:ClickTenthRoleResultShow() end,nil)
       else
           self:ClickTenthRoleResultShow()
       end



    --    MgrUI.Pop(UID.UsmBadgePlay,{"EnterBattleChoose"})
    --    MgrTimer.AddDelayNoName(0.2,function()
    --         --NormalCardDrawViewModel.OpenCardDrawTenthResultUI()
    --         MgrTimer.AddDelayNoName(1.5,function() self:ClickTenthRoleResultShow() end,nil)
    --     end,nil)
    end))
    ---分享按钮
    UIEvent.LuaClick(self.Btn_Fenxiang().gameObject,Handle(self,function()
        CMgrUI.Instance:CloseClickRoot()
        self.QRCode().gameObject:SetActive(true)
        self.RepeatStuff().gameObject:SetActive(false)
        self.Btn_Fenxiang().gameObject:SetActive(false)
        self.Logo_UIDPanel().gameObject:SetActive(true)
        self.SkipPanel().gameObject:SetActive(false)
        self:CaptureScreenshot(self.Jietu(),Handle(self,function()
            self:CloseShare(true)
        end))
    end))
    ---保存到相簿
    UIEvent.LuaClick(self.Btn_XB().gameObject,function()
        self:SaveToLocal()
    end)
    ---分享关闭按钮
    UIEvent.LuaClick(self.BlurMask().gameObject,function()
        self:CloseShare(false)
        self.QRCode().gameObject:SetActive(false)
        self.RepeatStuff().gameObject:SetActive(true)
        self.Btn_Fenxiang().gameObject:SetActive(true)
        self.Logo_UIDPanel().gameObject:SetActive(false)
        CMgrUI.Instance:OpenClickRoot()
    end)
    ---FaceeBook分享图片
    UIEvent.LuaClick(self.Btn_FB().gameObject,function()
        self:FBSharePicture()
    end)
    ---Line分享图片
    UIEvent.LuaClick(self.Btn_LINE().gameObject,function()
        self:LineSharePicture()
    end)
end

---单抽初始化
function M:InitSingleDraw()
    -- statements
    self:InitResultPanel(NormalCardDrawViewModel.HeroList[1])
    ---获取角色品质
    local role = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[1][1]]
    local str = string.split(role[53],"_")
    local goods = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
    self.RepeatStuffCount = tonumber(str[3])
    MgrTimer.AddDelayNoName(2.2,Handle(self,self.LateAccessBtnBack),nil)
    MgrTimer.AddDelayNoName(1,Handle(self,function()
        self:ShowRepeatStuff(goods)
    end),nil)      ---弹出重复的角色的技能书
end
function M:ShowRepeatStuff(goodData)
    if NormalCardDrawViewModel.HeroList[1][2] == 1 then
        self.RepeatStuff().gameObject:SetActive(true)
        ---根据角色的星数开启不同的材料
        MgrRes.LoadSprite(self.Icon_SkillBook(),goodData.icon)
        MgrRes.LoadSprite(self.Icon_kuang(),goodData.iconFrame)
        self.RepeatStuffBracketText().text = goodData.name
        self.Text_Count().text = self.RepeatStuffCount
        Global.DoMoveX(self.RepeatStuff().gameObject,-600,0.3)
    else
        self.RepeatStuff().gameObject:SetActive(false)
    end
end

--十连显示技能书
function M:ShowRepeatStuffTen(goodData)
    --if NormalCardDrawViewModel.HeroList[1][2] == 1 then
        self.RepeatStuff().gameObject:SetActive(true)
        ---根据角色的星数开启不同的材料
        MgrRes.LoadSprite(self.Icon_SkillBook(),goodData.icon)
        MgrRes.LoadSprite(self.Icon_kuang(),goodData.iconFrame)
        self.RepeatStuffBracketText().text = goodData.name
        self.Text_Count().text = self.RepeatStuffCount
        Global.DoMoveX(self.RepeatStuff().gameObject,-600,0.3)
    --end
end

--延迟开启点击返回
function M:LateAccessBtnBack()
    -- statements
    self.Bool_IsAsyncCreatStarOver=true
    self.Btn_ClickClose().gameObject:SetActive(true)
    self.Btn_SkipAni().gameObject:SetActive(false)
    UIEvent.LuaClick(self.Btn_ClickClose().gameObject,Handle(self,function ()
        MgrTimer.Cancel("repeatCharacter")
        MgrTimer.Cancel("repeatCharacterclose")
        if CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit).cardType == 4 then
            NormalCardDrawViewModel.OpenLightDarkResultUI()
        else
            ---单抽直接返回抽卡界面
            NormalCardDrawViewModel.BackToCardDrawUI()
        end

    end))
end
---十连抽初始化
function M:InitTenthDraw()
    -- statements
    self.Int_CurTenthResultIndex = 1
    MgrTimer.AddDelayNoName(0.1,function()self.Btn_TenthResultNext().gameObject:SetActive(true) end,nil)
    self:ClickTenthRoleResultShow()
end
---十连抽循环初始化方法
function M:ClickTenthRoleResultShow()
    -- statements
    self.RepeatStuff().gameObject:SetActive(false)

    if self.Int_CurTenthResultIndex > CardDrawControl.HeroCount then
        -- 已经初始化完成5张
        self.Btn_TenthResultNext().gameObject:SetActive(false)
        MgrTimer.Reset()
        -- LuaAudioPlayer.ResetSingleVoiceAudio()
        if CardDrawControl.GetDataById(NormalCardDrawViewModel.CurRecruit).cardType == 4 then
            NormalCardDrawViewModel.OpenLightDarkResultUI()
        else
            NormalCardDrawViewModel.OpenCardDrawTenthResultUI()
        end
        return
    end
    self:InitResultPanel(NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex])
    self.Int_CurTenthResultIndex = self.Int_CurTenthResultIndex + 1
end

--新跳过按钮逻辑
function M:SkipPanelClick()
    local m_index = 11
    for index = self.Int_CurTenthResultIndex, #NormalCardDrawViewModel.HeroList do
        local info = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[index][1]][6]
        local isNew =  NormalCardDrawViewModel.GetIsNewSSR(NormalCardDrawViewModel.HeroList[index][1])
        local isGoods = NormalCardDrawViewModel.HeroList[index][2]
        if info >= 4 and not isNew and isGoods == 0 then
            m_index = index
            break
        end
    end
    self.Int_CurTenthResultIndex = m_index
end

--隐藏显示抽卡结果界面信息
function M:DrawResultInfoControl(isShow)
    self.RoleInfoPanel().gameObject:SetActive(isShow)
    self.GroupPanel().gameObject:SetActive(isShow)
    self.StarPanel().gameObject:SetActive(isShow)
    self.VoicePanel().gameObject:SetActive(isShow)
    self.BgPanel_R().gameObject:SetActive(isShow)

    self.BgPanel_SSR().transform:Find("di").gameObject:SetActive(isShow)
    self.BgPanel_SR().transform:Find("di").gameObject:SetActive(isShow)
    self.BgPanel_R().transform:Find("di").gameObject:SetActive(isShow)
end

---初始化界面信息
function M:InitResultPanel(_hero)
    -- statements
    local _RoleId = _hero[1]
    Tools.ClearAllChild(self.LihuiRoot().gameObject)
    if  _hero[2] == 1 then
        -- 已拥有
        self.NewTagPanel().gameObject:SetActive(false)
        --重复技能书弹出
        self.RepeatStuff().gameObject:SetActive(true)
        local role = RoleattributeLocalData.tab[NormalCardDrawViewModel.HeroList[self.Int_CurTenthResultIndex][1]]
        local str = string.split(role[53],"_")
        local goods = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
        self.RepeatStuffCount = tonumber(str[3])

        self.RepeatStuff().gameObject.transform.localPosition = Vector3(
                self.RepeatStuff().gameObject.transform.localPosition.y + 600,
                self.RepeatStuff().gameObject.transform.localPosition.y,
                self.RepeatStuff().gameObject.transform.localPosition.z
        )
        self:ShowRepeatStuffTen(goods)
        MgrTimer.AddDelayNoName(1,Handle(self,function()
            Global.DoMoveX(self.RepeatStuff().gameObject,-600,0.3)
        end),nil)      ---弹出重复的角色的技能书
    else
        self.RepeatStuff().gameObject:SetActive(false)
        self.NewTagPanel().gameObject:SetActive(true)
    end
    self:DrawResultInfoControl(true)
    local role = RoleattributeLocalData.tab[_RoleId]
    self:LoadSpinePivotAtRoot(self.LihuiRoot().gameObject,role)
    self:UpdataRoleInfoPanel(role)
end
---更新当前人物信息
function M:UpdataRoleInfoPanel(_Role)
    local thero = HeroControl.GetRoleDataByID(_Role[1])
    local skin = HeroControl.GetSkinDataBySkinId(thero.skin)
    if skin then
        self.Text_Chenghao().text = skin.skinName
    end
    self.RoleNameText().text= _Role[2]
    MgrRes.LoadSprite(self.ProIconImg(),"Attribute/ProIcon_".._Role[3])
    MgrRes.LoadSprite(self.RoleGroupIconImg(),"Attribute/".._Role[58])
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _Role[1] and value[3] == 3 then
            self.RoleVoiceWordText().text = value[7]
            break
        end
    end
    if _Role[21]>2 then
        self:SwitchBG("ssr")
    elseif _Role[21]>1 then
        self:SwitchBG("sr")
    else
        self:SwitchBG("r")
    end

    if _Role[5] == 1 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_armour")
        self.ProTextEN().text="GUARD"
    elseif _Role[5] == 2 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_slugger")
        self.ProTextEN().text="PUNCH"
    elseif _Role[5] == 3 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_firepower")
        self.ProTextEN().text="STRAFE"
    elseif _Role[5] == 4 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_supporter")
        self.ProTextEN().text="SUPPORT"
    elseif _Role[5] == 11 then
        self.ProTextCN().text=MgrLanguageData.GetLanguageByKey("expeditiontaskitem_job_surpries")
        self.ProTextEN().text="SUPER"
    end

    self.Int_CurRoleStarLv = _Role[21]
    self.Btn_SkipAni().gameObject:SetActive(true)

    self:InitStarPanel(_Role[21],self.RoleStarRoot().gameObject,self.StarPrefab().gameObject)
    self:PlayRoleVoice(3,_Role[1])
end
function M:PlayRoleVoice(type,id)
    local _ActorLinesType= id ---当前台词组别
    local _AudioName = "0"
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == _ActorLinesType and value[4] == type then
            _AudioName = value [13]
        end
    end
    if _AudioName == "0" then
        MgrSound.Stop(3,"CardRoleVoice",false)
        return
    else
        MgrSound.PlayRole(_AudioName,nil,nil,false,0,0,"CardRoleVoice")
    end
end
---生成立绘到指定容器锚点
---@param _Role RoleData
function M:LoadSpinePivotAtRoot(_Root,_Role)
    -- statements
    local char = CharactercoordinatesLocalData.tab[_Role[1]]
    local _tempPosTab1 =JNStrTool.strSplit(";", char.coordinate2)
    local _tempPosTab2=JNStrTool.strSplit(",", _tempPosTab1[1])

    --MgrRes.LoadWatchAuto(_Root,_Role[1],tonumber(_tempPosTab2[1]),tonumber(_tempPosTab2[2]),tonumber(_tempPosTab1[2]))
    MgrRes.LoadWatch3DSpineInUI(_Root, _Role[1], tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), nil, function(obj)
        obj.transform.gameObject.layer = 5
        local ske = obj.transform:GetComponent("SkeletonAnimation")
        if ske then
            ske:SetOrderLayer(self.CavOrder + 1,"Default")
        end
    end)
end
---创建一个物体
function M:CreatGo(_Prefab,_Root)
    local tempObj = GameObject.Instantiate(_Prefab,_Root.transform)
    tempObj.gameObject:SetActive(true)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
---创建星星
function M:CreatStar(_Root,_Prefab)
    local UnJuxingStar=GameObject.Instantiate(_Prefab,_Root.transform)
    UnJuxingStar.gameObject:SetActive(true)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
function M:InitStarPanelImmediately(_StarLV,_Root,_Prefab)
    Tools.ClearAllChild(_Root)
    for i = 1, _StarLV, 1 do
        self:CreatStar(_Root,_Prefab)
    end
end
---根据星级对对应根节点初始化星星
function M:InitStarPanel(_StarLV,_Root,_Prefab)
    -- statements
    Tools.ClearAllChild(_Root)
    self.CurAsyncCreatStarConut = 0
    self.CurAsyncCreatStarMaxCount = tonumber(_StarLV)
    self.CurTargetAsyncStarPrefab = _Prefab
    self.CurTargetAsyncCreatStarRoot = _Root
    self.Bool_IsAsyncCreatStarOver=false
    self:AsyncCreatStar()
end
---循环异步延迟生成星星
function M:AsyncCreatStar()
    -- statements
    if self.CurAsyncCreatStarConut >= self.CurAsyncCreatStarMaxCount  or self.Bool_IsAsyncCreatStarOver == true then
        -- 已经生成达到目标
        self.Btn_SkipAni().gameObject:SetActive(false)
        return
    end
    self:CreatStar(self.CurTargetAsyncCreatStarRoot,self.CurTargetAsyncStarPrefab)
    self.CurAsyncCreatStarConut = self.CurAsyncCreatStarConut + 1
    MgrTimer.AddDelayNoName(0.1,Handle(self,self.AsyncCreatStar),nil)
end
---截图功能
function M:CaptureScreenshot(imageComponent,LuaFunc)
    CMgrCamera.Instance:CaptureScreenshot(imageComponent,LuaFunc)
end
---保存到相簿
function M:SaveToLocal()
    CMgrCamera.Instance:SaveScreenshotLocal(
            function(str)
                MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips4").. str, 1 }, true)
            end)
end
---FB分享
function M:FBSharePicture()
    MgrSdk.CS:FlyFunFBSharingBit(MgrLanguageData.GetLanguageByKey("downloadpanel_tips5"),function(str)
        if str == "0" then
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips8"), 1 }, true)
            local tab = {
                id = tonumber(SteamLocalData.tab[113032][2])
            }
            ---序列化
            local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
            TaskControl.AckError = true
            MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
                local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
                if recAck.errNo ~= 0 then
                    MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
                end
            end,function(buffer,tag)
                local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
                ---更新数据统计
                TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
            end)
        else
            MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips9"), 1 }, true)
        end
    end)
end
---Line分享
function M:LineSharePicture()
    --MgrUI.Pop(UID.PopTip_UI, { MgrLanguageData.GetLanguageByKey("downloadpanel_tips10"), 1 }, true)
    MgrSdk.CS:FlyFunLineSharingBit(MgrLanguageData.GetLanguageByKey("downloadpanel_tips5"))
    local tab = {
        id = tonumber(SteamLocalData.tab[113033][2])
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientShareREQ',tab))
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_SHARE_REQ,bytes,0,nil, function(buffer,tag)
        local recAck = assert(pb.decode('PBClient.ClientShareACK',buffer))
        if recAck.errNo ~= 0 then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips3"),2},true)
        end
    end,function(buffer,tag)
        local tab = assert(pb.decode('PBClient.ClientShareNTF', buffer))
        ---更新数据统计
        TaskControl.ChangeStatistics(tab.day, tab.week, tab.month, tab.glory)
    end)
end
function M:CloseShare(CloseOrOpen)
    self.QRCode().gameObject:SetActive(false)
    self.BlurMask().gameObject:SetActive(CloseOrOpen)
    self.JietuPanel().gameObject:SetActive(CloseOrOpen)
    self.Content().gameObject:SetActive(CloseOrOpen)
    self.Logo_UIDPanel().gameObject:SetActive(not CloseOrOpen)
    if NormalCardDrawViewModel.CountType == 1 then
        self.SkipPanel().gameObject:SetActive(not CloseOrOpen)
    end
end
function M:OnClose()
    MgrSound.Stop(3,"CardRoleVoice",false)
    SysNoticeControl.Show()
end
return M