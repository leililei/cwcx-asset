-- Code Auto Create Begin
local M = Class('AnaWorldBossItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/AnaWorldBossItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AnaWorldBossItem','/',2},{'Img_Touying','Img_Touying',2},{'Img_Monidi','Img_Monidi',2},{'Img_Nandu','Img_Nandu',2},{'NanduIcon','Img_Nandu/NanduIcon',2},{'Img_Bg','Img_Bg',2},{'Btn_ShowBoss','Btn_ShowBoss',2},{'Img_Tiao','Btn_ShowBoss/Img_Tiao',2},{'Img_Chakandi2','Text_Name/Btn_Chakan2/Img_Chakandi2',2},{'Img_Chakanicon2','Text_Name/Btn_Chakan2/Img_Chakanicon2',2},{'Img_Select','Img_Select',2},
        -- Button 列表
        {'Btn_ShowBoss01','Btn_ShowBoss',4},{'Btn_Chakan2','Text_Name/Btn_Chakan2',4},
        -- UITemplate 列表
        {'AnaWorldBossItem01','/',10},
        -- RawImage 列表
        {'Btn_Chakan201','Text_Name/Btn_Chakan2',15},
        -- TextMeshProUGUI 列表
        {'Text_Nandu','Img_Nandu/Text_Nandu',20},{'Text_TuijianLV','Img_Nandu/Text_TuijianLV',20},{'Text_Name','Text_Name',20},
    }
end
-- Code Auto Create End
---初始化
function M:OnInit()
    self.SelectFrame = nil
    ---注册点击
    UIEvent.LuaClick(self.ObjRoot.gameObject,function()
        if BattleManager.GameMode == BattleManager.GameModeType.AniWorldBoss then
            StormViewModel.CurStormAnaBossId_Monster = self.pData.id
            BattleManager.CurBossLevel = self.CurBossLevel
        else
            StormViewModel.CurStormBossId_Monster = self.pData.id
            BattleManager.CurBossLevel = self.CurBossLevel
        end
        Event.Go("WBScroll")
    end)
    --[[UIEvent.LuaClick(self.Btn_ShowBoss().gameObject,function()
        self.parent:ClosePop()
        MgrUI.Pop(UID.BossInfoPop_UI,{self.pData},true)
    end)
    ---注册查看
    --[[UIEvent.LuaClick(self.Btn_Chakan2().gameObject,function()
        self.parent:ClosePop()
        MgrUI.Pop(UID.BossInfoPop_UI,{self.pData},true)
    end)]]
end
---更新
function M:OnUpdateUI(pData)
    ---@type StormBossData
    self.pData = pData[1]
    self.parent = pData[2]
    self.index = pData[3]
    self.CurBossLevel = pData[3]   ---难度和引索刚好对应
    ---更新选中框
    if self.pData.id == StormViewModel.CurStormAnaBossId_Monster or self.pData.id == StormViewModel.CurStormBossId_Monster then
        self.Img_Select().gameObject:SetActive(true)
    else
        self.Img_Select().gameObject:SetActive(false)
    end
    ---更新boss缩略图
    MgrRes.LoadSprite(self.Img_Bg(),"Preview/"..self.pData.thumbnail_drawing)
    ---更新boss名称
    self.Text_Name().text = self.pData.BossData.name
    ---难度
    --if self.pData.type == 1 then
        self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey(self.pData.diffTXT)
        MgrRes.LoadSprite(self.NanduIcon(),self.pData.diffIcon)
        MgrRes.LoadSprite(self.Img_Nandu(),self.pData.bg)
    --elseif self.pData.type == 2 then
    --    self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text39")
    --    MgrRes.LoadSprite(self.NanduIcon(),"Preview/Img_KunNan_icon")
    --    MgrRes.LoadSprite(self.Img_Nandu(),"Preview/Img_KunNan")
    --elseif self.pData.type == 3 then
    --    self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text40")
    --    MgrRes.LoadSprite(self.NanduIcon(),"Preview/Img_EMeng_icon")
    --    MgrRes.LoadSprite(self.Img_Nandu(),"Preview/Img_EMeng")
    --elseif self.pData.type == 4 then
    --    self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text40")
    --    MgrRes.LoadSprite(self.NanduIcon(),"Preview/Img_EMeng_icon")
    --    MgrRes.LoadSprite(self.Img_Nandu(),"Preview/Img_EMeng")
    --elseif self.pData.type == 5 then
    --    self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text40")
    --    MgrRes.LoadSprite(self.NanduIcon(),"Preview/Img_EMeng_icon")
    --    MgrRes.LoadSprite(self.Img_Nandu(),"Preview/Img_EMeng")
    --elseif self.pData.type == 6 then
    --    self.Text_Nandu().text = MgrLanguageData.GetLanguageByKey("ui_guanka_text40")
    --    MgrRes.LoadSprite(self.NanduIcon(),"Preview/Img_EMeng_icon")
    --    MgrRes.LoadSprite(self.Img_Nandu(),"Preview/Img_EMeng")
    --end
    ---等级
    self.Text_TuijianLV().text = MgrLanguageData.GetLanguageByKey("ui_taofazhan_text10") .. self.pData.recomlevel
end

return M