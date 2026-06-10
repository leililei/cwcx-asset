-- Code Auto Create Begin
local M = Class('PlayAnime_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayAnime_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayAnime_UI].prefab'
    self.Name = 'Form[PlayAnime_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BgSprite','BgSprite',2},{'RoleSpritePanel','RoleSpritePanel',2},{'RoleSprite','RoleSpritePanel/RoleSprite',2},{'FrontSprite','FrontSprite',2},{'UsmVideo','UsmVideo',2},{'Btn_Touch','Btn_Touch',2},{'Btn_Skip','Btn_Skip',2},{'Img_Skip','Btn_Skip/Img_Skip',2},{'Img_Skip1','Btn_Skip/Img_Skip/Img_Skip1',2},{'Img_Quit','Img_Quit',2},
        -- Button 列表
        {'Btn_Skip01','Btn_Skip',4},
        -- TextMeshProUGUI 列表
        {'Text_Skip','Btn_Skip/Img_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Btn_Skip().gameObject:SetActive(false)
    self.QuitImg = self.Img_Quit().gameObject:GetComponent("CanvasGroup")
    --显示/隐藏跳过按钮
    UIEvent.LuaClick(self.Btn_Touch().gameObject,function()
        self.Btn_Skip().gameObject:SetActive(not self.Btn_Skip().gameObject.activeSelf)
    end)
    --跳过
    UIEvent.LuaClick(self.Btn_Skip().gameObject,function()
        self:QuitUI()
    end)
end

function M:OnShow()
    local tRoleID = SkinControl.GetOpenRoleID()
    local _skin = HeroControl.GetSkinDataByRoleID(tRoleID)
    ---@type SkinData
    local tSkinData = SkinControl.GetHomeSkinData(_skin.id)
    
    local tData = tSkinData[0]
    local tStr = string.split(tData.OpenAnim,',')
    --取消打开播放动画界面
    SkinControl.SetOpenAni(false)
    --记录皮肤动画播放时间
    SkinControl.SaveOpenAnime(_skin.id)
    if tStr[1] == "1" then
        --播放视频
        self.UsmVideo().gameObject:SetActive(true)
        local criUI = self.UsmVideo().transform:GetComponent("CriManaMovieControllerForUI")
        --给组件的player设置usm视频文件
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/Common/"..tStr[2]..".usm"))
        criUI.player.statusChangeCallback = function(state)
            if tostring(state) == "PlayEnd: 6" then    --播放完
                criUI.player.statusChangeCallback = nil
                self:QuitUI()
            end
        end
        criUI:Play()
    else
        --初始化皮肤功能需求
        SkinControl.InitSpineState(true,true,SkinControl.UIType.home,_skin.id)
        --创建皮肤
        --背景
        SkinControl.CreateRoleSpine(self.BgSprite().gameObject,PosterGirlViewModel.spineType.bottom)
        --前景
        SkinControl.CreateRoleSpine(self.FrontSprite().gameObject,PosterGirlViewModel.spineType.front)
        --角色皮肤
        SkinControl.CreateRoleSpine(self.RoleSprite().gameObject,PosterGirlViewModel.spineType.role)
        --播放Spine
        local tCount = 0
        local tAnimeList = string.split(tStr[2],'|')
        for i, v in ipairs(tAnimeList) do
            if v ~= "0" then
                tCount = tCount + 1
            end
        end
        MgrTimer.AddDelayNoName(0.1,function()
            SkinControl.PlaySpine(tAnimeList,function()
                tCount = tCount - 1
                if tCount == 0 then
                    self:QuitUI()
                end
            end)
        end, self.ObjRoot)
    end
end

function M:QuitUI()
    MgrTimer.AddRepeat("PlayAnimeClose",0.02,function()
        if self.QuitImg.alpha >= 1 then
            MgrUI.GoBack()
            MgrTimer.Cancel("PlayAnimeClose")
        end
        self.QuitImg.alpha = self.QuitImg.alpha + 0.2
    end)
end

function M:OnClose()
    SkinControl.ClearSpine()
end

return M