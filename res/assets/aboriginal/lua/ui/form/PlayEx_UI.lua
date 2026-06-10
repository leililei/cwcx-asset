-- Code Auto Create Begin
local M = Class('PlayEx_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.PlayEx_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[PlayEx_UI].prefab'
    self.Name = 'Form[PlayEx_UI]'
    self.Layer = UILayerLv.Pop
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'UsmVideo','UsmVideo',2},{'Btn_Touch','Btn_Touch',2},{'Btn_Skip','Btn_Skip',2},{'Img_Skip','Btn_Skip/Img_Skip',2},{'Img_Skip1','Btn_Skip/Img_Skip/Img_Skip1',2},
        -- Button 列表
        {'Btn_Skip01','Btn_Skip',4},
        -- TextMeshProUGUI 列表
        {'Text_Skip','Btn_Skip/Img_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Btn_Skip().gameObject:SetActive(false)
    self.callBack = nil
    self.CriUI = self.UsmVideo().transform:GetComponent("CriManaMovieControllerForUI")
    MgrSound.Pause(1,"Normal")
    
    --显示/隐藏跳过按钮
    UIEvent.LuaClick(self.Btn_Touch().gameObject, function()
        self.CriUI:Pause(true)
        self.isPause = true
        MgrSound.Pause(4,"exBgm")
        MgrSound.Pause(2,"exEff")
        MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("ui_yangcheng_text159")),function()
            self:OnBack()
        end,nil,2,function()
            self.CriUI:Pause(false)
            self.isPause = false
            MgrSound.Pause(4,"exBgm")
            MgrSound.Pause(2,"exEff")
        end})
    end)
end

function M:OnShow(pData)
    --进入后停止所以声音
    MgrSound.StopAll()
    ---@type RoleData 角色数据
    self.roleData = pData[1]
    self.callBack = pData[2]
    self.isPause = HeroControl.GetExPause()
    
    --local voiceData = PostMailViewModel.ActorLine[self.roleData.skin]
    local voiceData = CommonViewModel.GetActorLinesByGroup(self.roleData.skin)
    --EX声音
    local voice = nil
    for i, v in pairs(voiceData) do
        if v[3] == 25 then
            voice = v[13]
            break
        end
    end
    --EX音效
    local ExEffctID = string.split(SkillLocalData.tab[self.roleData.ExSkillID][5],'_')[1]
    local voiceEffect = Special_effectLocalData.tab[tonumber(ExEffctID)][9]
    
    --播放声音
    MgrSound.PlayFight(voice,nil,nil,false,nil,nil,"exBgm")    
    --播放音效
    MgrSound.PlayEffect(voiceEffect,nil,nil,false,nil,nil,"exEff")
    
    if self.isPause then
        MgrSound.Pause(2,"exEff")
    end
    --给组件的player设置usm视频文件
    self.CriUI.player:SetFile(nil, MgrRes.GetABPath("usm/role/" .. self.roleData.id .. ".usm"))
    self.CriUI.player.statusChangeCallback = function(state)
        if tostring(state) == "PlayEnd: 6" then
            --播放完
            self:OnBack()
        end
    end
    self.CriUI:Play()
end

function M:OnBack()
    MgrSound.ClearFight()
    MgrSound.Stop(2,"exEff",false)
    self.CriUI.player.statusChangeCallback = nil
    HeroControl.SetExPause(self.isPause)
    if self.callBack then
        self.callBack()
    end

    --播放背景音
    MgrSound.Pause(1,"Normal")
    MgrUI.ClosePop(ConfirmPop_UI)
    MgrUI.ClosePop(self.Uid)
end

return M