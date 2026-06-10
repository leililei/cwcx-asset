-- Code Auto Create Begin
local M = Class('CardDrawResultBG_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.CardDrawResultBG_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[CardDrawResultBG_UI].prefab'
    self.Name = 'Form[CardDrawResultBG_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 4
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BackGroundPanel','BackGroundPanel',2},{'BgPanel_SSR','BackGroundPanel/BgPanel_SSR',2},{'di','BackGroundPanel/BgPanel_SSR/di',2},{'BgPanel_SR','BackGroundPanel/BgPanel_SR',2},{'di01','BackGroundPanel/BgPanel_SR/di',2},{'BgPanel_R','BackGroundPanel/BgPanel_R',2},{'di02','BackGroundPanel/BgPanel_R/di',2},
    }
end
-- Code Auto Create End
function M:OnInit()
    Event.Clear("CardDrawBGSSRShow")
    Event.Clear("CardDrawBGSRShow")
    Event.Clear("CardDrawBGRShow")
    ----------------------------初始化信息----------------------------------
    M.BgPanel_SSR=self.BgPanel_SSR().gameObject
    M.BgPanel_SR=self.BgPanel_SR().gameObject
    M.BgPanel_R=self.BgPanel_R().gameObject
    M.FormRoot=self.ObjRoot
    --隐藏全部品阶背景层
    M.BgPanel_SSR:SetActive(false)
    M.BgPanel_SR:SetActive(false)
    M.BgPanel_R:SetActive(false)

    Event.Add("CardDrawBGSSRShow",function ()
        --SSR抽卡背景
        M.FormRoot:SetActive(false)
        M.FormRoot:SetActive(true)
        M.BgPanel_SSR:SetActive(true)
        M.BgPanel_SR:SetActive(false)
        M.BgPanel_R:SetActive(false)
        print("回调更新SSR背景")
    end)
    Event.Add("CardDrawBGSRShow",function ()
        --SSR抽卡背景
        M.FormRoot:SetActive(false)
        M.FormRoot:SetActive(true)
        M.BgPanel_SSR:SetActive(false)
        M.BgPanel_SR:SetActive(true)
        M.BgPanel_R:SetActive(false)
        print("回调更新SR背景")
    end)
    Event.Add("CardDrawBGRShow",function ()
        --SSR抽卡背景
        M.FormRoot:SetActive(false)
        M.FormRoot:SetActive(true)
        M.BgPanel_SSR:SetActive(false)
        M.BgPanel_SR:SetActive(false)
        M.BgPanel_R:SetActive(true)
        print("回调更新R背景")
    end)
    if JNCardDrawData.CurResultType == 1 then
        -- 单抽模式
        M.InitFirstRoleBG(10000) --- 测试用数据
        --M.InitFirstRoleBG(JNCardDrawData.CurResultRole[1])
    else
        -- 十连模式
        M.InitFirstRoleBG(10000) --- 测试用数据
        --M.InitFirstRoleBG(JNCardDrawData.CurTenthContinuousResultTab[1][1])
    end
    NormalCardDrawViewModel.OpenCardDrawResultUI()
end

--首次打开初始化第一个角色(单抽则默认初始化一个)
function M.InitFirstRoleBG(_RoleId)
    local role = RoleattributeLocalData.tab[_RoleId]
    if role[6] == 4 then
        -- statements
        M.BgPanel_SSR:SetActive(true)
        M.BgPanel_SR:SetActive(false)
        M.BgPanel_R:SetActive(false)
    elseif role[6] == 3 then
        M.BgPanel_SSR:SetActive(false)
        M.BgPanel_SR:SetActive(true)
        M.BgPanel_R:SetActive(false)
    else
        M.BgPanel_SSR:SetActive(false)
        M.BgPanel_SR:SetActive(false)
        M.BgPanel_R:SetActive(true)
    end
end
return M