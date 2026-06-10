-- Code Auto Create Begin
local M = Class('CardDrawTenthResult_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CardDrawTenthResult_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CardDrawTenthResult_UI].prefab'
    self.Name = 'Form[CardDrawTenthResult_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 8
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'di','di',2},{'Btn_ClickBack','Btn_ClickBack',2},{'BackGroundPanel','BackGroundPanel',2},{'dian(1)','BackGroundPanel/dian (1)',2},{'wangge(1)','BackGroundPanel/wangge (1)',2},{'sanjiao','BackGroundPanel/sanjiao',2},{'liuguang','BackGroundPanel/liuguang',2},{'liuguang(1)','BackGroundPanel/liuguang (1)',2},{'RoleCardPrefab','RoleCardPrefab',2},{'guang1','RoleCardPrefab/SRLightPanel/guang1',2},{'zi','RoleCardPrefab/SRLightPanel/zi',2},{'guang2','RoleCardPrefab/SSRLightPanel/guang2',2},{'huang','RoleCardPrefab/SSRLightPanel/huang',2},{'guang2(1)','RoleCardPrefab/SSRLightPanel/guang2 (1)',2},{'RoleRankBgImg','RoleCardPrefab/RoleRankBgImg',2},{'RoleLihuiImg','RoleCardPrefab/RoleLihuiImg',2},{'xiazhezhao','RoleCardPrefab/xiazhezhao',2},{'yiyongyouzhezhao','RoleCardPrefab/RepeatPanel/yiyongyouzhezhao',2},{'daojukuang','RoleCardPrefab/RepeatPanel/daojukuang',2},{'RolePuzzleIcon','RoleCardPrefab/RepeatPanel/RolePuzzleIcon',2},{'1','RoleCardPrefab/RepeatPanel/1',2},{'RoleStarPanel','RoleCardPrefab/RoleStarPanel',2},{'RoleRankKuangImg','RoleCardPrefab/RoleRankKuangImg',2},{'StarPrefab','RoleCardPrefab/StarPrefab',2},{'SSRLight','RoleCardPrefab/SSRLight',2},{'SRLight','RoleCardPrefab/SRLight',2},{'RoleCardPanel','RoleCardPanel',2},
        -- TextMeshProUGUI 列表
        {'RolePuzzleCountText','RoleCardPrefab/RepeatPanel/RolePuzzleCountText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    ---------------------初始化信息----------------------------
    ---------------------初始化信息----------------------------
    --Panel父节点
    M.BackGroundPanel=self.BackGroundPanel().gameObject
    M.RoleCardPanel=self.RoleCardPanel().gameObject
    --Prefab预制体
    M.RoleCardPrefab=self.RoleCardPrefab().gameObject

    M.RoleCardPrefab:SetActive(false)
    M.InitTenthCardPanel()
    UIEvent.LuaClick(self.Btn_ClickBack().gameObject,Handle(M,function ()
        -- statements
        NormalCardDrawViewModel.BackToCardDrawUI()
        --Event.Clear("GoFirstToNormalCardDraw")
        --Event.Add("GoFirstToNormalCardDraw",function ()
        --    -- statements
        --    NormalCardDrawViewModel.BackToCardDrawUI()
        --end)
        --JNPlayerData.HttpPostInitPlayerBag("GoFirstToNormalCardDraw")
    end))
end

function M.InitTenthCardPanel()
    --for key, value in pairs(JNCardDrawData.CurTenthContinuousResultTab) do
    --    local role = RoleattributeLocalData.tab[value[1]]
    --    print("开始创建卡牌"..value[1])
    --    M.CreatRoleCard(M.RoleCardPrefab,value[2],role,role[1])
    --end
    -----------测试代码
    local resultTab = {
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
        {math.random(10000,10008),math.random(0,1)},
    }
    for key, value in pairs(resultTab) do
        local role = RoleattributeLocalData.tab[value[1]]
        print("开始创建卡牌"..value[1])
        M.CreatRoleCard(M.RoleCardPrefab,value[2],role,role[1])
    end
end

--创建一个人物卡牌
function M.CreatRoleCard(_Prefab,_IsOwn,_InfoTab,_RoleId)
    -- statements
    local _RoleCardObj=M.CreatGo(_Prefab,M.RoleCardPanel)
    local _SSRLightPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"SSRLightPanel")
    local _SRLightPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"SRLightPanel")
    local _RoleRankBgImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankBgImg")
    local _RoleRankKuangImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleRankKuangImg")
    local _RoleLihuiImg=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleLihuiImg")
    local _RepeatPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"RepeatPanel")
    local _RolePuzzleIcon=CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleIcon")
    local _RolePuzzleCountText=CJNUIMgr.GetSunUseName(_RoleCardObj,"RolePuzzleCountText")
    local _RoleStarPanel=CJNUIMgr.GetSunUseName(_RoleCardObj,"RoleStarPanel")
    local _StarPrefab=CJNUIMgr.GetSunUseName(_RoleCardObj,"StarPrefab")
    _StarPrefab:SetActive(false)
    if _IsOwn == 1 then
        -- 已经拥有
        _RepeatPanel:SetActive(true)
        local RepeatRewardTab=JNStrTool.strSplit("_", _InfoTab[53])
        local item = GoodsLocalData.tab[tonumber(RepeatRewardTab[1])]
        MgrRes.LoadSprite(_RolePuzzleIcon,"Item/"..item.icon)
        _RolePuzzleCountText:GetComponent("TextMeshProUGUI").text=RepeatRewardTab[2]
    else
        _RepeatPanel:SetActive(false)
    end
    M.InitStar(_RoleStarPanel,_StarPrefab,tonumber(_InfoTab[21]))
    MgrRes.LoadLongIcon(_RoleLihuiImg,_RoleId)
    MgrRes.LoadSprite(_RoleRankBgImg,"Quality/RoleRankBg_".._InfoTab[6])
    MgrRes.LoadSprite(_RoleRankKuangImg,"Quality/RoleRankKuang_".._InfoTab[6])
    if _InfoTab[6] == 4 then
        -- statements
        _SSRLightPanel:SetActive(true)
        _SRLightPanel:SetActive(false)
    elseif _InfoTab[6] == 3 then
        _SSRLightPanel:SetActive(false)
        _SRLightPanel:SetActive(true)
    else
        _SSRLightPanel:SetActive(false)
        _SRLightPanel:SetActive(false)
    end
end

---------------------------------通用方法----------------------------------------
--创建一个物体
function M.CreatGo(_Prefab,_Root)
    -- statements
    local tempObj=CJNUIMgr.CreatGo(_Prefab,_Root)
    tempObj.transform.localPosition = Vector3.zero
    return tempObj
end
--创建星星
function M.CreatStar(_Root,_Prefab)
    -- statements
    local UnJuxingStar=CJNUIMgr.CreatGo(_Prefab,_Root)
    UnJuxingStar.transform.localPosition = Vector3(UnJuxingStar.transform.localPosition.x,UnJuxingStar.transform.localPosition.y,0)
end
--初始化星星
function M.InitStar(_Root,_Prefab,_Count)
    -- statements
    Tools.ClearAllChild(_Root)
    for i = 1, _Count, 1 do
        M.CreatStar(_Root,_Prefab)
    end
end
return M