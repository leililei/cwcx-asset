-- Code Auto Create Begin
local M = Class('BathGameEnd_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BathGameEnd_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BathGameEnd_UI].prefab'
    self.Name = 'Form[BathGameEnd_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AniROOT','AniROOT',2},{'BackGround','AniROOT/BackGround',2},{'SpineRoot','AniROOT/SpineRoot',2},{'Jiesuan','AniROOT/Jiesuan',2},{'Img_mask','AniROOT/Jiesuan/Img_mask',2},{'Combo','AniROOT/Jiesuan/Combo',2},{'Youxijieduan','AniROOT/Jiesuan/Youxijieduan',2},{'Fenshujiesuan','AniROOT/Jiesuan/Fenshujiesuan',2},{'Pingjiajiesuan','AniROOT/Jiesuan/Pingjiajiesuan',2},{'Img_S','AniROOT/Jiesuan/Pingjiajiesuan/Img_S',2},{'evaluationPanel','AniROOT/Jiesuan/evaluationPanel',2},{'Img_mask01','AniROOT/Jiesuan/evaluationPanel/Img_mask',2},{'Img_Light','AniROOT/Jiesuan/evaluationPanel/Img_mask/Img_Light',2},{'Img_Navigator','AniROOT/Jiesuan/evaluationPanel/Img_Navigator',2},{'Img_Navigator_Qipao','AniROOT/Jiesuan/evaluationPanel/Img_Navigator/Img_Navigator_Qipao',2},{'Stars_H','AniROOT/Jiesuan/evaluationPanel/Stars_H',2},{'Img_Velocity_Evaluation','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/Img_Velocity_Evaluation',2},{'StarBg','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg',2},{'Stars_N','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg/Stars_N',2},{'Stars_N(1)','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg/Stars_N (1)',2},{'Stars_N(2)','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg/Stars_N (2)',2},{'Stars_N(3)','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg/Stars_N (3)',2},{'Stars_N(4)','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/StarBg/Stars_N (4)',2},{'SpeedStar','AniROOT/Jiesuan/evaluationPanel/Velocity_Evaluation/SpeedStar',2},{'Img_Velocity_Evaluation01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/Img_Velocity_Evaluation',2},{'StarBg01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg',2},{'Stars_N01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg/Stars_N',2},{'Stars_N(1)01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg/Stars_N (1)',2},{'Stars_N(2)01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg/Stars_N (2)',2},{'Stars_N(3)01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg/Stars_N (3)',2},{'Stars_N(4)01','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/StarBg/Stars_N (4)',2},{'PowerStar','AniROOT/Jiesuan/evaluationPanel/Intensity_Evaluation/PowerStar',2},{'Img_Velocity_Evaluation02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/Img_Velocity_Evaluation',2},{'StarBg02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg',2},{'Stars_N02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg/Stars_N',2},{'Stars_N(1)02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg/Stars_N (1)',2},{'Stars_N(2)02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg/Stars_N (2)',2},{'Stars_N(3)02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg/Stars_N (3)',2},{'Stars_N(4)02','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/StarBg/Stars_N (4)',2},{'SkillStar','AniROOT/Jiesuan/evaluationPanel/Skill_Evaluation/SkillStar',2},{'Img_Overall_Rating','AniROOT/Jiesuan/evaluationPanel/Overall_Rating/Img_Overall_Rating',2},{'Img_Rating_BG','AniROOT/Jiesuan/evaluationPanel/Overall_Rating/Img_Rating_BG',2},{'Img_Rating','AniROOT/Jiesuan/evaluationPanel/Overall_Rating/Img_Rating_BG/Img_Rating',2},{'Img_white_bg','AniROOT/Jiesuan/evaluationPanel/Img_white_bg',2},
        -- TextMeshProUGUI 列表
        {'Text_Combo','AniROOT/Jiesuan/Combo/Text_Combo',20},{'Text_Comboshu','AniROOT/Jiesuan/Combo/Text_Comboshu',20},{'Text_Youxijieduan','AniROOT/Jiesuan/Youxijieduan/Text_Youxijieduan',20},{'Text_Jieduan','AniROOT/Jiesuan/Youxijieduan/Text_Jieduan',20},{'Text_Pingjiajiesuan','AniROOT/Jiesuan/Fenshujiesuan/Text_Pingjiajiesuan',20},{'Text_Score','AniROOT/Jiesuan/Fenshujiesuan/Text_Score',20},{'Text_Pingjiajiesuan01','AniROOT/Jiesuan/Pingjiajiesuan/Text_Pingjiajiesuan',20},{'Text_Navigator_End','AniROOT/Jiesuan/evaluationPanel/Img_Navigator/Img_Navigator_Qipao/Text_Navigator_End',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    local score = BathControl.score
    ---@type NewshowerscoreLocalData
    local data = nil
    for k,v in pairs(NewshowerscoreLocalData.tab) do
        if v.sortid == BathControl.GameType then
            data = v
        end
    end
    local index = 0
    --存在数据
    if data then
        local str = string.split(data.assess,",")
        local iconStr = string.split(data.probability,",")
        if score < tonumber(str[1]) then
            --播放音效
            MgrSound.PlayEffect("BathScoreC",1,0,false,0,0,"bathScore")
            MgrRes.LoadSprite(self.Img_Rating(),"BackRub/"..iconStr[1])
            index = 1
        elseif score >= tonumber(str[1]) and score < tonumber(str[2]) then
            --播放音效
            MgrSound.PlayEffect("BathScoreB",1,0,false,0,0,"bathScore")
            MgrRes.LoadSprite(self.Img_Rating(),"BackRub/"..iconStr[2])
            index = 2
        elseif score >= tonumber(str[2]) and score < tonumber(str[3]) then
            --播放音效
            MgrSound.PlayEffect("BathScoreA",1,0,false,0,0,"bathScore")
            MgrRes.LoadSprite(self.Img_Rating(),"BackRub/"..iconStr[3])
            index = 3
        else
            --播放音效
            MgrSound.PlayEffect("BathScoreS",1,0,false,0,0,"bathScore")
            MgrRes.LoadSprite(self.Img_Rating(),"BackRub/"..iconStr[4])
            index = 4
        end
    end
    --结算台词
    local textStr = string.split(data.txt_probability,",")
    self.Text_Navigator_End().text = textStr[index]

    --星星
    self.Stars_H().gameObject:SetActive(false)
    local starStr = string.split(string.split(data.star_probability,";")[index],",")
    local speedStar = math.random(tonumber(string.split(starStr[1],"_")[1]),tonumber(string.split(starStr[1],"_")[2]))
    local powerStar = math.random(tonumber(string.split(starStr[2],"_")[1]),tonumber(string.split(starStr[2],"_")[2]))
    local skillStar = math.random(tonumber(string.split(starStr[3],"_")[1]),tonumber(string.split(starStr[3],"_")[2]))
    for i=1,speedStar do
        local obj = GameObject.Instantiate(self.Stars_H().gameObject,self.SpeedStar().gameObject.transform, false)
        obj:SetActive(true)
    end
    for i=1,powerStar do
        local obj = GameObject.Instantiate(self.Stars_H().gameObject,self.PowerStar().gameObject.transform, false)
        obj:SetActive(true)
    end
    for i=1,skillStar do
        local obj = GameObject.Instantiate(self.Stars_H().gameObject,self.SkillStar().gameObject.transform, false)
        obj:SetActive(true)
    end

    --点击游戏结束
    UIEvent.LuaClick(self.Jiesuan().gameObject,function()
        local aniData = ShoweranimeLocalData.tab[BathControl.GameId]
        local ani = self.AniROOT().gameObject.transform:GetComponent("AniComplete")
        ani:PlayAni("Ani_BathGameEnd_UI_Out")
        self:PlayAni(aniData.gameend_spinetouch,false,nil,nil)
        MgrTimer.AddDelayNoName(2,function()
            --如果有剧情播放剧情
            if BathControl.PlotAfter and BathControl.GameData:CheckPassGameId(BathControl.GameId) == false then
                PlotViewModel.OpenPlotUI(BathControl.PlotAfter,function ()
                    BathControl.PlotAfter = nil
                    self:CloseUI()
                end,true)
            else
                self:CloseUI()
            end
        end,self.ObjRoot)
    end)
end

function M:OnShow()
    --播放bgm
    MgrSound.PlayBGM("BathGameFinish",0.2,nil,false)
    local ani = self.AniROOT().gameObject.transform:GetComponent("AniComplete")
    --获取当前动画数据
    local aniData = ShoweranimeLocalData.tab[BathControl.GameId]
    --获取当前game数据
    local data = nil
    if BathControl.GameType == 1 then
        data = TouchLocalData.tab[BathControl.GameId]
    elseif BathControl.GameType == 2 then
        data = ChooseitemLocalData.tab[BathControl.GameId]
        self.evaluationPanel().gameObject:SetActive(false)
    elseif BathControl.GameType == 3 then

    elseif BathControl.GameType == 4 then
        data = BeattouchLocalData.tab[BathControl.GameId]
    end
    --创建spine
    self:CreatSpine(self.SpineRoot(),aniData.gameend_spinefile,aniData.gameend_coordinate,"game1_finish2",1)
    --播放spine结束动画
    self:PlayAni(aniData.gameend_spinefirst,false,aniData.gameend_spinesecond,aniData.gameend_voice)
    --播放animation动画
    ani:PlayAni(aniData.animeplay_end)
end

---关闭UI
function M:CloseUI()
    if BathControl.GameData.curPhase + 1 <= 3 and BathControl.GameData:CheckPassGameId(BathControl.GameId) == false then
        local phase = BathControl.GameData.curPhase + 1
        BathControl.GameUpREQ(BathControl.GameData.roleId,phase,BathControl.GameId,function()
            MgrUI.GoBackTo(UID.BathHome_UI)
        end)
    else
        MgrUI.GoBackTo(UID.BathHome_UI)
    end
end

---播放动画及语音
function M:PlayAni(aniName,isLoop,backAni,audioName,isTouch,isChangeFace)
    if isTouch then
        local str = string.split(aniName,";")
        for k,v in pairs(str) do
            local aniData = string.split(v,":")
            local indexArr = string.split(aniData[1],",")
            if Global.Contains(indexArr,isTouch) then
                CMgrSpine.Instance:SetSpineAnimation(self.SpineObj,aniData[2],isLoop,nil,backAni)
            end
        end
    else
        CMgrSpine.Instance:SetSpineAnimation(self.SpineObj,aniName,isLoop,nil,backAni)
    end
    if isChangeFace and self.HeadAniPlay == 1 then
        self.HeadKuang().gameObject.transform:GetComponent("Animation"):Play()
    end
    if audioName then
        local str = string.split(audioName,";")
        --如果存在多个随机一个下标播放
        if #str > 1 then
            local index = math.random(1,#str)
            MgrSound.PlayRole(str[index],nil,nil,false,0,0,tostring(BathControl.GameData.roleId))
        else
            MgrSound.PlayRole(audioName,nil,nil,false,0,0,tostring(BathControl.GameData.roleId))
        end

    end
end

---创建spine
function M:CreatSpine(root,id,posStr,ani,type)
    if self.SpineObj then
        GameObject.Destroy(self.SpineObj)
    end
    --加载spine
    if type == 1 then
        local _tempPosTab1 = JNStrTool.strSplit(";", posStr)
        local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
        MgrRes.LoadFightSpine(root, id,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), ani, function(obj)
            self.SpineObj = obj
        end)
    else
        --加载live2d
        --MgrRes.LoadWatchAuto(self.Img_Bg1().gameObject,90000,0,0,1,nil,function(_ReturnObj)
        --    --_ReturnObj.transform:GetComponent("SkeletonAnimation"):SetOrderLayer(-1,"Default")
        --    --_ReturnObj.layer = 5
        --    --local _CurRoleID = 90000
        --    --local _ActorLinesType
        --    --if _CurRoleID >= 90000 and _CurRoleID < 200000 then     ---看板娘
        --    --_ActorLinesType = tonumber(Live2dLocalData.tab[_CurRoleID][3])
        --    --else
        --    --    local curRoleSkin = HeroControl.GetRoleDataByID(PlayerControl.GetPlayerData().curRoleID).skin
        --    --    _ActorLinesType = tonumber(RoleuiskinLocalData.tab[curRoleSkin].interaction)SetSpineAnimation
        --    --end
        --    --local _FinalActorLineID=0
        --    --for key, value in pairs(ActorLinesLocalData.tab) do
        --    --    if value[2] == _ActorLinesType and value[4] == 2 then
        --    --        _FinalActorLineID=value[1]
        --    --    end
        --    --end
        --end)
    end
end

return M