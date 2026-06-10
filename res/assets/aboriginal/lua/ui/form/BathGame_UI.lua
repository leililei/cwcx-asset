-- Code Auto Create Begin
local M = Class('BathGame_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BathGame_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BathGame_UI].prefab'
    self.Name = 'Form[BathGame_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'AniROOT','AniROOT',2},{'BackGround_Normal','AniROOT/BackGround_Normal',2},{'SpineRoot','AniROOT/SpineRoot',2},{'Game1','AniROOT/Game1',2},{'Img_Bg1','AniROOT/Game1/Img_Bg1',2},{'CellPanel','AniROOT/Game1/CellPanel',2},{'TouchItem','AniROOT/Game1/TouchItem',2},{'TouchCell','AniROOT/Game1/TouchItem/TouchCell',2},{'ProgressBar','AniROOT/Game1/ProgressBar',2},{'FillArea','AniROOT/Game1/ProgressBar/FillArea',2},{'FillImg','AniROOT/Game1/ProgressBar/FillArea/FillImg',2},{'Vfx','AniROOT/Game1/ProgressBar/FillArea/FillImg/Vfx',2},{'Text_Jindu','AniROOT/Game1/ProgressBar/FillArea/Text_Jindu',2},{'Game2','AniROOT/Game2',2},{'Img_Bg2','AniROOT/Game2/Img_Bg2',2},{'DragCellPanel','AniROOT/Game2/DragCellPanel',2},{'DragCell','AniROOT/Game2/DragCell',2},{'BathItem','AniROOT/Game2/BathItem',2},{'lipstick','AniROOT/Game2/lipstick',2},{'bathItem4','AniROOT/Game2/lipstick/bathItem4',2},{'BathItemPanel','AniROOT/Game2/BathItemPanel',2},{'Qipao3','AniROOT/Game2/BathItemPanel/Qipao3',2},{'bathItem3','AniROOT/Game2/BathItemPanel/Qipao3/bathItem3',2},{'Qipao2','AniROOT/Game2/BathItemPanel/Qipao2',2},{'bathItem2','AniROOT/Game2/BathItemPanel/Qipao2/bathItem2',2},{'Qipao1','AniROOT/Game2/BathItemPanel/Qipao1',2},{'bathItem1','AniROOT/Game2/BathItemPanel/Qipao1/bathItem1',2},{'Life','AniROOT/Game2/Life',2},{'Life_N','AniROOT/Game2/Life/Life_N',2},{'Life_H','AniROOT/Game2/Life/Life_N/Life_H',2},{'Life_N(1)','AniROOT/Game2/Life/Life_N (1)',2},{'Life_H01','AniROOT/Game2/Life/Life_N (1)/Life_H',2},{'Life_N(2)','AniROOT/Game2/Life/Life_N (2)',2},{'Life_H02','AniROOT/Game2/Life/Life_N (2)/Life_H',2},{'ProgressBar01','AniROOT/Game2/ProgressBar',2},{'FillArea01','AniROOT/Game2/ProgressBar/FillArea',2},{'FillImg01','AniROOT/Game2/ProgressBar/FillArea/FillImg',2},{'Text_Jindu01','AniROOT/Game2/ProgressBar/FillArea/Text_Jindu',2},{'Game4','AniROOT/Game4',2},{'Img_Bg4','AniROOT/Game4/Img_Bg4',2},{'Btn_Left','AniROOT/Game4/Btn_Left',2},{'Shadow','AniROOT/Game4/Btn_Left/Shadow',2},{'LeftUp','AniROOT/Game4/Btn_Left/LeftUp',2},{'LeftDown','AniROOT/Game4/Btn_Left/LeftDown',2},{'Btn_Right','AniROOT/Game4/Btn_Right',2},{'Shadow01','AniROOT/Game4/Btn_Right/Shadow',2},{'RightUp','AniROOT/Game4/Btn_Right/RightUp',2},{'RightDown','AniROOT/Game4/Btn_Right/RightDown',2},{'TouchCell01','AniROOT/Game4/TouchCell',2},{'CellPanel01','AniROOT/Game4/CellPanel',2},{'Img_HuodongTiaodi','AniROOT/Game4/Img_HuodongTiaodi',2},{'LeftHitItem','AniROOT/Game4/Img_HuodongTiaodi/LeftHitItem',2},{'Dajidian1','AniROOT/Game4/Img_HuodongTiaodi/Dajidian1',2},{'Img_HuodongTiaodi2','AniROOT/Game4/Img_HuodongTiaodi2',2},{'RightHitItem','AniROOT/Game4/Img_HuodongTiaodi2/RightHitItem',2},{'Dajidian2','AniROOT/Game4/Img_HuodongTiaodi2/Dajidian2',2},{'Img_Miss','AniROOT/Game4/HuadongtiaoPanel/Img_Miss',2},{'Img_Nice','AniROOT/Game4/HuadongtiaoPanel/Img_Nice',2},{'Img_HuodongTiaodi01','AniROOT/Game4/HuadongtiaoPanel/Img_HuodongTiaodi',2},{'Img_zhizhen','AniROOT/Game4/HuadongtiaoPanel/Img_HuodongTiaodi/Img_zhizhen',2},{'BeatCell','AniROOT/Game4/HuadongtiaoPanel/Img_HuodongTiaodi/BeatCell',2},{'ProgressBar02','AniROOT/Game4/ProgressBar',2},{'FillArea02','AniROOT/Game4/ProgressBar/FillArea',2},{'FillImg4','AniROOT/Game4/ProgressBar/FillArea/FillImg4',2},{'Vfx01','AniROOT/Game4/ProgressBar/FillArea/FillImg4/Vfx',2},{'Img_Fillmg3','AniROOT/Game4/ProgressBar/FillArea/FillImg4/Img_Fillmg3',2},{'Text_Jindu02','AniROOT/Game4/ProgressBar/FillArea/Text_Jindu',2},{'Game5','AniROOT/Game5',2},{'BubbleLauncher1','AniROOT/Game5/BubbleLauncher1',2},{'BubbleLauncher2','AniROOT/Game5/BubbleLauncher2',2},{'BubbleLauncher3','AniROOT/Game5/BubbleLauncher3',2},{'BubbleLauncher4','AniROOT/Game5/BubbleLauncher4',2},{'BubbleLauncher5','AniROOT/Game5/BubbleLauncher5',2},{'BubbleLauncher6','AniROOT/Game5/BubbleLauncher6',2},{'HeadSpine','AniROOT/HeadSpine',2},{'Spine_Box','AniROOT/HeadSpine/Spine_Box',2},{'RightExpression','AniROOT/RightExpression',2},{'Image_1','AniROOT/RightExpression/Image_1',2},{'Combo','AniROOT/Combo',2},{'ComboCount3','AniROOT/Combo/ComboCount3',2},{'ComboCount2','AniROOT/Combo/ComboCount2',2},{'ComboCount1','AniROOT/Combo/ComboCount1',2},{'Img_Combo','AniROOT/Combo/Img_Combo',2},{'Countdown','AniROOT/Countdown',2},{'Img_Daojishiquan(hei)','AniROOT/Countdown/Img_Daojishiquan(hei)',2},{'Img_Daojishiquan(liang)','AniROOT/Countdown/Img_Daojishiquan(liang)',2},{'Img_s','AniROOT/Start/Img_s',2},{'Img_t1','AniROOT/Start/Img_t1',2},{'Img_a','AniROOT/Start/Img_a',2},{'Img_r','AniROOT/Start/Img_r',2},{'Img_t2','AniROOT/Start/Img_t2',2},{'Img_1','AniROOT/Start/Img_1',2},{'Img_2','AniROOT/Start/Img_2',2},{'Img_3','AniROOT/Start/Img_3',2},{'GameMask','AniROOT/GameMask',2},
        -- Text 列表
        {'Text_Time','AniROOT/Countdown/Text_Time',3},{'Text_Shijian','AniROOT/Countdown/Text_Shijian',3},
    }
end
-- Code Auto Create End
require("LocalData/TouchLocalData")
require("LocalData/ChooseitemLocalData")
require("LocalData/NewshowerscoreLocalData")
require("LocalData/BeattouchLocalData")
require("LocalData/ShoweranimeLocalData")


function M:OnInit()
    self:InitCommon()
    --选择要开始的游戏
    if BathControl.GameType == 1 then
        self:InitGame1()
    elseif BathControl.GameType == 2 then
        self:InitGame2()
    elseif BathControl.GameType == 3 then
        self:InitGame3()
    elseif BathControl.GameType == 4 then
        self:InitGame4()
    end
end

function M:OnShow()
    --播放开场bgm
    MgrSound.PlayBGM("BathGameStart",0.2,nil,false)
end

function M:InitCommon()
    self.SpineObj = nil
    --策划需求修改主摄像机hdr
    self.ca = GameObject.Find("UIMainCamera"):GetComponent("Camera")
    self.ca.allowHDR = false

    self.Game1().gameObject:SetActive(false)
    self.Game2().gameObject:SetActive(false)
    self.Game4().gameObject:SetActive(false)
    self.Combo().gameObject:SetActive(false)
    self.Countdown().gameObject:SetActive(false)
    --引导是否结束
    self.GuideFinish = false
end

function M:SetUV(root,path,pos)
    ----加载背景预制体
    --MgrRes.GetPrefab(path,function(Obj)
    --    if Obj == nil then
    --        return
    --    end
    --    Obj.transform:SetParent(root.gameObject.transform)
    --    Obj.transform.localPosition = Vector3(tonumber(pos[1]),tonumber(pos[2]),tonumber(pos[3]))
    --end)
end

function M:InitGame1()
    --打开hdr
    self.ca.allowHDR = true
    self.Game1().gameObject:SetActive(true)
    self.ComboCount = 0  --连击次数
    self.TouchItem().gameObject:SetActive(false) --隐藏模板
    self.Combo().gameObject:SetActive(false)  --隐藏连击分数
    local stage1 = false   --阶段1
    local stage2 = false   --阶段2
    local stage3 = false   --阶段3
    ---@type TouchLocalData 获取当前游戏数据
    local data = nil
    for k,v in pairs(TouchLocalData.tab) do
        if v.sortid == BathControl.GameId then
            data = v
            break
        end
    end
    if data == nil then
        return
    end
    ---是否播放头像框动画
    self.HeadAniPlay = data.cameracontrol
    ---动画数据
    local aniData = ShoweranimeLocalData.tab[BathControl.GameId]
    ---按钮角度
    local btnAngle = string.split(data.btnangle,",")
    ---创建背景
    self:SetUV(self.BackGround_Normal().gameObject,data.background,string.split(data.bgcoordinate,","))
    ---创建spine
    self:CreatSpine(self.SpineRoot(),data.charspine,data.coordinate,aniData.level1_idle,data.resourcetype)
    ---设置头像框spine
    self:SetCamera(data.headkuangspine,data.camcoordinate)
    ---获取当前数据要显示的棋盘坐标
    local str = string.split(data.location,",")
    CJNUIMgr.GetSunUseName(self.Game1().gameObject,"CellPanel").transform.localPosition = Vector3(tonumber(str[1]),tonumber(str[2]),0)
    local pos1 = math.random(1,24)
    self.pos1 = pos1
    ---目标combo
    local targetScore = string.split(data.scoretotal,",")
    ---隐藏进度条
    local progress = CJNUIMgr.GetSunUseName(self.Game1().gameObject,"FillArea")
    progress:SetActive(false)
    --是否已经满分
    self.isMax = false

    --初始化引导
    self:InitGuide(1000,function()
        --播放开场动画
        local ani = self.AniROOT().gameObject.transform:GetComponent("AniComplete")
        ani:PlayAni(aniData.animeplay_start,function()
            ani:PlayAni("Ani_BathGame_UI_Start",function()
                --开始倒计时
                self:SetCountdown(data.time,function()
                    self:SetGameOver(data.score * self.ComboCount)
                end,data.countdowndisplay)
                --播放循环抖动动画
                ani:PlayAni(aniData.animeplay_gaming)
                --关闭触碰遮罩
                self.GameMask().gameObject:SetActive(false)
                ani:CallBackCompleted()
                --播放游戏bgm
                MgrSound.PlayBGM(data.music,0.2)
                ---显示进度条
                progress:SetActive(true)
                ---生成格子
                self.touchCell = {}
                for i = 1,24 do
                    local obj = GameObject.Instantiate(self.TouchItem().gameObject, self.CellPanel().gameObject.transform, false).transform:Find("TouchCell").gameObject
                    local index = math.random(1,#btnAngle)
                    obj.transform.parent.transform.localRotation = Quaternion.Euler(0,0,tonumber(btnAngle[index]))
                    obj.transform.name = i
                    self.touchCell[#self.touchCell + 1] = obj
                    ---点击格子
                    UIEvent.LuaClick(obj,function()
                        self.ComboCount = self.ComboCount + 1   --连击
                        --随机下一个格子
                        self:RandomCellPos(obj,self.pos1)
                        --进度条变化
                        self.FillImg().transform:GetComponent("Image").fillAmount = self.ComboCount / tonumber(string.split(data.scoretotal,",")[3])
                        --进度条特效
                        local vfx = CJNUIMgr.GetSunUseName(self.FillImg().gameObject,"cuozao_jindutiao").transform:GetComponent("ParticleSystem")
                        local vfxPos = (self.ComboCount / tonumber(string.split(data.scoretotal,",")[3])) * 580
                        local MaxVfx = CJNUIMgr.GetSunUseName(self.FillImg().gameObject,"cuozao_jindutiao_finish").transform:GetComponent("ParticleSystem")
                        if self.ComboCount / tonumber(string.split(data.scoretotal,",")[3]) >= 1 then
                            if self.isMax == false then
                                MaxVfx:Play(true)
                                self.isMax = true
                            end
                        else
                            vfx.gameObject.transform.parent.transform.anchoredPosition = Vector2(vfxPos,0)
                            vfx:Play(true)
                        end
                        --音效
                        MgrSound.PlayEffect("BathGame1Touch",1,0,false,0,0,"bathGame1Touch")
                        --图片特效
                        local iconVfx = CJNUIMgr.GetSunUseName(obj,"cuozao_dishu_hit").transform:GetComponent("ParticleSystem")
                        iconVfx:Play(true)
                        --分数赋值
                        self:SetCombo(self.ComboCount)
                        self.Combo().gameObject:SetActive(true)
                        if self.ComboCount >= tonumber(targetScore[1]) and self.ComboCount < tonumber(targetScore[2]) and stage1 == false then
                            stage1 = true   --阶段1完成
                            --播放动画
                            self:PlayAni(aniData.level1_changeface,false,aniData.level2_idle,aniData.level1_upvoice,nil,string.split(aniData.headpng,";")[1])
                        elseif self.ComboCount >= tonumber(targetScore[2]) and self.ComboCount < tonumber(targetScore[3]) and stage2 == false then
                            stage2 = true   --阶段2完成
                            --播放动画
                            self:PlayAni(aniData.level2_changeface,false,aniData.level3_idle,aniData.level2_upvoice,nil,string.split(aniData.headpng,";")[2])
                        elseif self.ComboCount >= tonumber(targetScore[3]) and stage3 == false then
                            stage3 = true   --阶段3完成
                        else
                            if stage1 == false and stage2 == false and stage3 == false then
                                self:PlayAni(aniData.level1_touch,false,aniData.level1_idle,aniData.level1_touchvoice,obj.name)
                            elseif stage1 and stage2 == false and stage3 == false then
                                self:PlayAni(aniData.level2_touch,false,aniData.level2_idle,aniData.level2_touchvoice,obj.name)
                            else
                                self:PlayAni(aniData.level3_touch1,false,aniData.level3_idle,aniData.level3_touchvoice,obj.name)
                            end
                        end
                    end)
                    ---如果是目标格则显示反之隐藏
                    if i == pos1 then
                        obj.transform:GetComponent("Image").enabled = true
                    else
                        obj.transform:GetComponent("Image").enabled = false
                    end
                    obj.transform.parent.gameObject:SetActive(true)
                end
            end)
        end)
    end)
end

function M:RandomCellPos(curObj,pos1)
    local pos = math.random(1,24)
    --避免随机到当前的坐标
    while pos == pos1 do
        pos = math.random(1,24)
    end
    self.pos1 = pos

    curObj.transform:GetComponent("Animator"):Play("Ani_BathGame_UI_Game3_TouchCell", 0, 0)
    curObj.transform:GetComponent("Image").raycastTarget = false
    --随机图片
    local index = math.random(1,3)
    local icon = self.touchCell[pos].transform:GetComponent("Image")
    icon.enabled = true
    icon.raycastTarget = true
    MgrRes.LoadSprite(icon,"BackRub/icon_game1touch"..index)
    self.touchCell[pos].transform:GetComponent("Animator"):Play("Ani_BathGame_UI_Game1_TouchCell", 0, 0)
end

---选择道具2
function M:InitGame2()
    self.Game2().gameObject:SetActive(true)
    self.ComboCount = 0  --清零
    self.finishCount1 = 0  --已完成阶段一的次数
    self.finishCount2 = 0  --已完成阶段二的次数
    self.finishCount3 = 0  --已完成阶段三的次数
    self.DragCell().gameObject:SetActive(false)  --隐藏模板
    self.BathItem().gameObject:SetActive(false)  --隐藏模板
    self.lipstick().gameObject:SetActive(false)
    self.Game2Music = false  --是否播放了泡泡音效
    self.Game2Lock = false
    --搓澡道具
    self.bathItems = {
        self.bathItem1().gameObject,
        self.bathItem2().gameObject,
        self.bathItem3().gameObject,
        self.bathItem4().gameObject,
    }
    ---随机当前游戏id
    local weights = {}
    for k,v in pairs(ChooseitemLocalData.tab) do
        table.insert(weights,v.probability)
    end
    ---@type ChooseitemLocalData
    local data = ChooseitemLocalData.tab[BathControl.GameId]
    ---是否播放头像框动画
    self.HeadAniPlay = data.cameracontrol
    ---动画数据
    self.aniData = ShoweranimeLocalData.tab[BathControl.GameId]
    ---创建背景
    self:SetUV(self.BackGround_Normal().gameObject,data.background,string.split(data.bgcoordinate,","))
    ---创建spine
    self:CreatSpine(self.SpineRoot(),data.charspine,data.coordinate,self.aniData.level1_idle,data.resourcetype)
    ---设置头像框spine
    self:SetCamera(data.headkuangspine,data.camcoordinate)
    ---获取当前数据要显示的格子坐标
    local str = string.split(data.location,";")
    local pos1 = math.floor(tonumber(string.split(str[1],",")[1]) + tonumber((string.split(str[1],",")[2] - 1) * 8))
    local pos2 = math.floor(tonumber(string.split(str[2],",")[1]) + tonumber((string.split(str[2],",")[2] - 1) * 8))
    local pos3 = data.lipstick == "0" and "0" or math.floor(tonumber(string.split(data.lipstick,",")[1])  + tonumber((string.split(data.lipstick,",")[2] - 1) * 8))
    ---滑动加分
     self.scoreStr = string.split(data.score,";")
    self.scoreArr = {}
    for j,data in pairs(str) do
        local arr = {}
        for k,v in pairs(self.scoreStr) do
            table.insert(arr,{
                item = string.split(v,"_")[1],
                score = tonumber(string.split(v,"_")[2]),
                target = tonumber(string.split(v,"_")[3]),
                curScore = 0,
                prev = string.split(v,"_")[4],
                next = string.split(v,"_")[5],
            })
            if #arr == k then
                self.scoreArr[math.floor(tonumber(string.split(data,",")[1]) + tonumber((string.split(data,",")[2] - 1) * 8))] = arr
            end
        end
    end
    ---滑动数据
    self.fillData = string.split(data.scoretotal,";")
    ---隐藏高亮
    for i = 0,self.Life().transform.childCount - 1 do
        self.Life().gameObject.transform:GetChild(i).transform:Find("Life_H").gameObject:SetActive(false)
    end
    ---效果数据
    local stainStr = string.split(data.effsort,";")
    ---生成格子
    for i = 1,40 do
        local obj = GameObject.Instantiate(self.DragCell().gameObject, self.DragCellPanel().gameObject.transform, false)
        obj.transform.name = i
        obj:SetActive(true)
        if i == pos1 or i == pos2 then  --是否显示
            obj:GetComponent("CanvasGroup").alpha = 1
            --加载第一次污渍图片
            MgrRes.LoadSprite(obj.transform:GetComponent("Image"),string.split(stainStr[1],",")[2])
        else
            obj:GetComponent("CanvasGroup").alpha = 0
        end
    end
    CMgrCamera.Instance:SetSmallGameMouseRange(self.Img_Bg2().gameObject)  --设置游戏边界
    ---搓澡道具
    local curHit = nil  --当前记忆的格子
    local IconStr = string.split(data.itemsort,";")
    ---延迟保护时间
    self.Game2Delay = string.split(data.phaseup_delay,";")
    ---分数
    self.Bath2Score = 0
    for i = 1,#IconStr do
        local obj = self.bathItems[i]
        local icon = obj.transform:GetComponent("Image")
        local vfx = obj.transform:Find("Ui_cuozao_tuowei").gameObject.transform:GetComponent("ParticleSystem")
        obj:SetActive(true)
        obj.transform.name = string.split(IconStr[i],",")[1]    --name就是道具id
        MgrRes.LoadSprite(icon,string.split(IconStr[i],",")[2])    --加载道具图标
        obj:GetComponent("ItemDrag"):Reset()
        obj:GetComponent("ItemDrag"):BindHit(function(_obj)
            if self.Game2Lock == true then
                return
            end
            if curHit == nil then
                curHit = _obj
            else
                if curHit.transform.name == tostring(pos1) and _obj ~= curHit then
                    self:SetState(obj.transform.name,pos1,stainStr,curHit)
                elseif curHit.transform.name == tostring(pos2) and _obj ~= curHit then
                    self:SetState(obj.transform.name,pos2,stainStr,curHit)
                end
                if self.finishCount3 == 2 and pos3 ~= "0" and curHit.transform.name == tostring(pos3) and _obj ~= curHit then
                    self:SetState(obj.transform.name,pos3,stainStr,curHit)
                end
                curHit = _obj
            end
        end)
        obj:GetComponent("ItemDrag"):DragCall(function(_isDrag)
            self.isDrag = _isDrag
            if vfx.isPlaying == false then
                --播放特效
                vfx:Play(true)
            end
            if _isDrag == false then
                self.Game2Music = false
                obj:GetComponent("ItemDrag"):ResetPosition() --回到初始坐标
                --停止特效
                vfx:Stop(true)
            else
                if self.Game2Music == false then
                    MgrSound.PlayEffect("BathGame3Touch",1,0,false,0,0,"bathGame3Touch")
                    self.Game2Music = true
                end
            end
        end)
    end
    --隐藏UI
    self.DragCellPanel().gameObject:SetActive(false)
    self.BathItemPanel().gameObject:SetActive(false)
    self.Life().gameObject:SetActive(false)

    --初始化引导
    self:InitGuide(1001,function()
        --播放开场动画
        local ani = self.AniROOT().gameObject.transform:GetComponent("AniComplete")
        ani:PlayAni(self.aniData.animeplay_start,function()
            --播放开始动画
            ani:PlayAni("Ani_BathGame_UI_Start",function()
                --开始倒计时
                self:SetCountdown(data.time,function()
                    self:SetGameOver(self.Bath2Score)
                end,data.countdowndisplay)
                --播放循环抖动动画
                ani:PlayAni(self.aniData.animeplay_gaming)
                --关闭触碰遮罩
                self.GameMask().gameObject:SetActive(false)
                ani:CallBackCompleted()
                --显示UI
                self.DragCellPanel().gameObject:SetActive(true)
                self.BathItemPanel().gameObject:SetActive(true)
                self.Life().gameObject:SetActive(true)
                --播放游戏bgm
                MgrSound.PlayBGM(data.music,0.2)
            end)
        end)
    end)

end

---选择道具拖拽状态
function M:SetState(id,index,data,hitObj)
    if self.isDrag == false then
        return
    end
    --记录当前分数
    local num = self.ComboCount
    local icon = hitObj.transform:GetComponent("Image")
    ---@type ChooseitemLocalData
    local BathData = ChooseitemLocalData.tab[BathControl.GameId]
    for k,v in pairs(self.scoreStr) do
        --找到对应滑动道具数据
        if id == string.split(v,"_")[1] then
            --第一阶段
            if string.split(v,"_")[4] == "0" then
                if self.scoreArr[index][k].curScore < tonumber(string.split(v,"_")[3]) then  --未满足次数
                    self.scoreArr[index][k].curScore = self.scoreArr[index][k].curScore + 1
                    --总积分
                    self.Bath2Score = self.Bath2Score + tonumber(self.scoreArr[index][k].score)
                    --互动次数
                    self.ComboCount = self.ComboCount + 1
                    --互动效果
                    self:PlayAni(self.aniData.level1_touch,false,self.aniData.level1_idle,self.aniData.level1_touchvoice,hitObj.name)
                    --第一阶段已完成
                    if self.scoreArr[index][k].curScore == tonumber(string.split(v,"_")[3]) then
                        Tools.DoPFade(icon, 0, 0.5, 0, 1, false, 0, 0, function()
                            MgrRes.LoadSprite(icon,string.split(data[2],",")[2],function()
                                Tools.DoPFade(icon, 1, 0.5, 0, 1, false, 0, 0, nil)
                            end)
                        end)
                        --判断阶段一是否完成
                        self.finishCount1 = self.finishCount1 + 1
                    end
                end
            elseif string.split(v,"_")[1] == "004" and string.split(v,"_")[5] == "0" and self.scoreArr[index][k].curScore == tonumber(string.split(v,"_")[3]) then
                --禁止拖动
                self.Game2Lock = true
                --结束游戏
                self:SetGameOver(self.Bath2Score)
            else
                --上一阶段已完成
                if self.scoreArr[index][k - 1].curScore >= self.scoreArr[index][k - 1].target then
                    if self.scoreArr[index][k].curScore < tonumber(string.split(v,"_")[3]) then  --未满足次数
                        self.scoreArr[index][k].curScore = self.scoreArr[index][k].curScore + 1
                        --总积分
                        self.Bath2Score = self.Bath2Score + tonumber(self.scoreArr[index][k].score)
                        --互动次数
                        self.ComboCount = self.ComboCount + 1
                        --互动效果
                        if self.scoreArr[index][k].next == "003" then
                            --第二阶段
                            self:PlayAni(self.aniData.level2_touch,false,self.aniData.level2_idle,self.aniData.level2_touchvoice,hitObj.name)
                        elseif self.scoreArr[index][k].next == "004" then
                            --第三阶段
                            self:PlayAni(self.aniData.level3_touch,false,self.aniData.level3_idle,self.aniData.level3_touchvoice,hitObj.name)
                        end
                        --第二阶段已完成
                        if self.scoreArr[index][k].item == "002" and self.scoreArr[index][k].curScore == tonumber(string.split(v,"_")[3]) then
                            Tools.DoPFade(icon, 0, 0.5, 0, 1, false, 0, 0, function()
                                MgrRes.LoadSprite(icon,string.split(data[3],",")[2],function()
                                    Tools.DoPFade(icon, 1, 0.5, 0, 1, false, 0, 0, nil)
                                end)
                            end)
                            --阶段二是否完成
                            self.finishCount2 = self.finishCount2 + 1
                        end
                        --阶段三是否完成
                        if self.scoreArr[index][k].item == "003" and self.scoreArr[index][k].curScore >= tonumber(string.split(v,"_")[3]) then
                            self.finishCount3 = self.finishCount3 + 1
                            --两个污渍全部完成，游戏结束
                            if self.finishCount3 == 2 then
                                --没有口红
                                if BathData.lipstick == "0" then
                                    --禁止拖动
                                    self.Game2Lock = true
                                    --结束游戏
                                    self:SetGameOver(self.Bath2Score)
                                else
                                    Tools.DoPFade(icon, 0, 0.5, 0, 1, false, 0, 0, function()
                                        self.BathItemPanel().gameObject:SetActive(false)
                                        self.lipstick().gameObject:SetActive(true)
                                    end)
                                end
                            else
                                Tools.DoPFade(icon, 0, 0.5, 0, 1, false, 0, 0, nil)
                            end
                        end
                    end
                end
            end
            break
        end
    end

    --分数到达不同阶段
    if num ~= self.ComboCount then
        if self.ComboCount == tonumber(self.fillData[1]) then
            self:PlayAni(self.aniData.level1_changeface,false,self.aniData.level2_idle,self.aniData.level1_upvoice,nil,string.split(self.aniData.headpng,";")[1])
            self.Life().gameObject.transform:GetChild(0).transform:Find("Life_H").gameObject:SetActive(true)
            --游戏锁
            self.Game2Lock = true
            MgrTimer.AddDelayNoName(self.Game2Delay[1],function()
                self.Game2Lock = false
            end,self.ObjRoot)
        elseif self.ComboCount == tonumber(self.fillData[2]) then
            self:PlayAni(self.aniData.level2_changeface,false,self.aniData.level3_idle,self.aniData.level2_upvoice,nil,string.split(self.aniData.headpng,";")[2])
            self.Life().gameObject.transform:GetChild(1).transform:Find("Life_H").gameObject:SetActive(true)
            --游戏锁
            self.Game2Lock = true
            MgrTimer.AddDelayNoName(self.Game2Delay[2],function()
                self.Game2Lock = false
            end,self.ObjRoot)
        elseif self.ComboCount == tonumber(self.fillData[3]) then
            self:PlayAni("p3_finish",false,"p4_dj",BathData.endvoice,nil,string.split(self.aniData.headpng,";")[2])
            self.Life().gameObject.transform:GetChild(2).transform:Find("Life_H").gameObject:SetActive(true)
            --游戏锁
            self.Game2Lock = true
            MgrTimer.AddDelayNoName(self.Game2Delay[3],function()
                self.Game2Lock = false
            end,self.ObjRoot)
        end
    else
        --使用了错误的道具
        if self.finishCount1 < 2 then
            if string.split(self.scoreStr[1],"_")[1] ~= id then
                --阶段一错误
                self:PlayAni(string.split(self.aniData.failspine,";")[1],false,self.aniData.level1_idle,string.split(self.aniData.failvoice,";")[1])
            end
        elseif self.finishCount1 == 2 and self.finishCount2 < 2 then
            if string.split(self.scoreStr[2],"_")[1] ~= id then
                --阶段二错误
                self:PlayAni(string.split(self.aniData.failspine,";")[2],false,self.aniData.level2_idle,string.split(self.aniData.failvoice,";")[2])
            end
        elseif self.finishCount1 == 2 and self.finishCount2 == 2 and self.finishCount3 < 2 then
            if string.split(self.scoreStr[3],"_")[1] ~= id then
                --阶段三错误
                self:PlayAni(string.split(self.aniData.failspine,";")[3],false,self.aniData.level3_idle,string.split(self.aniData.failvoice,";")[3])
            end
        end
    end
end

---节奏点击
function M:InitGame4()
    --策划需求修改主摄像机hdr
    self.ca.allowHDR = true
    self.Game4().gameObject:SetActive(true)
    self.ComboCount = 0  --连击次数
    self.showComboCount = 0
    self.Combo().gameObject:SetActive(false)  --隐藏连击分数
    self.Img_Nice().gameObject:SetActive(false)
    self.Img_Miss().gameObject:SetActive(false)
    self.Img_HuodongTiaodi().gameObject:SetActive(false)
    self.Img_HuodongTiaodi2().gameObject:SetActive(false)
    local stage1 = false   --阶段1
    local stage2 = false   --阶段2
    local stage3 = false   --阶段3
    ---@type BeattouchLocalData
    local data = nil
    for k,v in pairs(BeattouchLocalData.tab) do
        if v.sortid == BathControl.GameId then
            data = v
            break
        end
    end
    if data == nil then
        return
    end
    --动画数据
    local aniData = ShoweranimeLocalData.tab[BathControl.GameId]
    --是否播放头像框动画
    self.HeadAniPlay = data.cameracontrol
    --创建背景
    self:SetUV(self.BackGround_Normal().gameObject,data.background,string.split(data.bgcoordinate,","))
    --创建spine
    self:CreatSpine(self.SpineRoot(),data.charspine,data.coordinate,aniData.level1_idle,data.resourcetype)
    --设置头像框spine
    self:SetCamera(data.headkuangspine,data.camcoordinate)
    --目标combo
    local targetScore = string.split(data.scoretotal,",")
    self.CurTargetBeat = nil
    --隐藏音符预制
    self.LeftHitItem().gameObject:SetActive(false)
    self.RightHitItem().gameObject:SetActive(false)
    --设置音轨和打击点位置
    local wayStr = string.split(data.waylocation,";")
    local hitStr = string.split(data.location,";")
    --轨道位置
    self.Img_HuodongTiaodi().gameObject.transform.localPosition = Vector3(tonumber(string.split(wayStr[1],",")[1]),tonumber(string.split(wayStr[1],",")[2]),0)
    self.Img_HuodongTiaodi2().gameObject.transform.localPosition = Vector3(tonumber(string.split(wayStr[2],",")[1]),tonumber(string.split(wayStr[2],",")[2]),0)
    --轨道旋转角度
    self.Img_HuodongTiaodi().gameObject.transform.localRotation = Quaternion.Euler(0,0,tonumber(string.split(wayStr[1],",")[3]))
    self.Img_HuodongTiaodi2().gameObject.transform.localRotation = Quaternion.Euler(0,0,tonumber(string.split(wayStr[2],",")[3]))
    --判断点位置
    self.Dajidian1().gameObject.transform.localPosition = Vector3(tonumber(string.split(hitStr[1],",")[1]),tonumber(string.split(hitStr[1],",")[2]),0)
    self.Dajidian2().gameObject.transform.localPosition = Vector3(tonumber(string.split(hitStr[2],",")[1]),tonumber(string.split(hitStr[2],",")[2]),0)
    --是否已经满分
    self.isMax = false
    --左音轨
    self.BeatSpawnTime1 = 0
    --当前生成的第n个音符
    self.SpawnIndex1 = 1
    MgrTimer.AddRepeat("BeatSpawn",data.timer,function()
        if self.GuideFinish == false then
            return
        end
        --累积时间
        self.BeatSpawnTime1 = self.BeatSpawnTime1 + data.timer
        --超出索引上限
        if self.SpawnIndex1 > #string.split(data.musicalleft,",") then
            return
        end
        --满足时间条件开始生成
        if self.BeatSpawnTime1 >= tonumber(string.split(data.musicalleft,",")[self.SpawnIndex1]) then
            --索引累加
            self.SpawnIndex1 = self.SpawnIndex1 + 1
            --生成音符预制
            local obj = GameObject.Instantiate(self.LeftHitItem().gameObject, self.Img_HuodongTiaodi().gameObject.transform, false)
            local icon = obj.transform:GetComponent("Image")
            local hammerVfx = CJNUIMgr.GetSunUseName(obj,"cuozao_left_chui").transform:GetComponent("ParticleSystem")
            local fistVfx = CJNUIMgr.GetSunUseName(obj,"cuozao_left_quan").transform:GetComponent("ParticleSystem")
            obj.transform.localPosition = Vector3(0,500,0)
            --随机生成图标
            if math.random(1,2) == 1 then
                --MgrRes.LoadSprite(icon,"BackRub/icon_game_L_1")
                hammerVfx.gameObject:SetActive(true)
                fistVfx.gameObject:SetActive(false)
                obj.name = 1
            else
                --MgrRes.LoadSprite(icon,"BackRub/icon_game_L_2")
                hammerVfx.gameObject:SetActive(false)
                fistVfx.gameObject:SetActive(true)
                obj.name = 2
            end
            obj:SetActive(true)
            Tools.TweenDoLocalMoveY(obj, -500, data.speed, 1,function()
                if obj ~= nil then
                    GameObject.Destroy(obj)
                    --做miss处理
                    self.showComboCount = 0
                    self:SetCombo(self.showComboCount)
                    --播放miss音效
                    MgrSound.PlayEffect("BeatGameMiss",1,0,false,0,0,"bathMiss")
                end
            end)
        end
    end,-1,self.ObjRoot)

    --右音轨
    self.BeatSpawnTime2 = 0
    --当前生成的第n个音符
    self.SpawnIndex2 = 1
    MgrTimer.AddRepeat("BeatSpawn2",data.timer,function()
        if self.GuideFinish == false then
            return
        end
        --累积时间
        self.BeatSpawnTime2 = self.BeatSpawnTime2 + data.timer
        --超出索引上限
        if self.SpawnIndex2 > #string.split(data.musicalright,",") then
            return
        end
        --满足时间条件开始生成
        if self.BeatSpawnTime2 >= tonumber(string.split(data.musicalright,",")[self.SpawnIndex2]) then
            --索引累加
            self.SpawnIndex2 = self.SpawnIndex2 + 1
            --生成音符预制
            local obj = GameObject.Instantiate(self.RightHitItem().gameObject, self.Img_HuodongTiaodi2().gameObject.transform, false)
            local icon = obj.transform:GetComponent("Image")
            local hammerVfx = CJNUIMgr.GetSunUseName(obj,"cuozao_right_chui").transform:GetComponent("ParticleSystem")
            local fistVfx = CJNUIMgr.GetSunUseName(obj,"cuozao_right_quan").transform:GetComponent("ParticleSystem")
            obj.transform.localPosition = Vector3(0,500,0)
            --随机生成图标
            if math.random(1,2) == 1 then
                --MgrRes.LoadSprite(icon,"BackRub/icon_game_R_1")
                hammerVfx.gameObject:SetActive(true)
                fistVfx.gameObject:SetActive(false)
                obj.name = 1
            else
                --MgrRes.LoadSprite(icon,"BackRub/icon_game_R_2")
                hammerVfx.gameObject:SetActive(false)
                fistVfx.gameObject:SetActive(true)
                obj.name = 2
            end
            obj:SetActive(true)
            Tools.TweenDoLocalMoveY(obj, -500, data.speed, 1,function()
                if obj ~= nil then
                    GameObject.Destroy(obj)
                    --做miss处理
                    self.showComboCount = 0
                    self:SetCombo(self.showComboCount)
                    --播放miss音效
                    MgrSound.PlayEffect("BeatGameMiss",1,0,false,0,0,"bathMiss")
                end
            end)
        end
    end,-1,self.ObjRoot)

    --按钮初始化
    CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftUp"):SetActive(true)
    CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftDown"):SetActive(false)
    CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightUp"):SetActive(true)
    CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightDown"):SetActive(false)
    local trigger = self.Dajidian1().gameObject.transform:GetComponent("UITrigger")
    local triggerVfx = CJNUIMgr.GetSunUseName(self.Dajidian1().gameObject,"cuozao_left_hit").transform:GetComponent("ParticleSystem")
    local trigger2 = self.Dajidian2().gameObject.transform:GetComponent("UITrigger")
    local triggerVfx2 = CJNUIMgr.GetSunUseName(self.Dajidian2().gameObject,"cuozao_right_hit").transform:GetComponent("ParticleSystem")
    --点击左按钮
    UIEvent.LuaClick(self.Btn_Left().gameObject,function()
        local obj = trigger:GetHitObj()
        --正确点击
        if obj ~= nil then
            self.ComboCount = self.ComboCount + 1
            GameObject.Destroy(obj)
            --播放命中音效
            MgrSound.PlayEffect("BeatGameTouch",1,0,false,0,0,"bathBeatTouch")
            --播放特效
            triggerVfx:Play(true)
            --播放动画
            if self.ComboCount >= tonumber(targetScore[1]) and self.ComboCount < tonumber(targetScore[2]) and stage1 == false then
                stage1 = true   --阶段1完成
                --播放动画
                self:PlayAni(aniData.level1_changeface,false,aniData.level2_idle,aniData.level1_upvoice,nil,string.split(aniData.headpng,";")[1])
            elseif self.ComboCount >= tonumber(targetScore[2]) and self.ComboCount < tonumber(targetScore[3]) and stage2 == false then
                stage2 = true   --阶段2完成
                --播放动画
                self:PlayAni(aniData.level2_changeface,false,aniData.level3_idle,aniData.level2_upvoice,nil,string.split(aniData.headpng,";")[2])
            elseif self.ComboCount >= tonumber(targetScore[3]) and stage3 == false then
                stage3 = true   --阶段3完成
                --倒计时结束
                MgrTimer.Cancel("countdown")
                --结束
                self:SetGameOver(data.score * self.ComboCount)
            else
                if stage1 == false and stage2 == false and stage3 == false then
                    self:PlayAni(string.split(aniData.level1_touch,";")[1],false,aniData.level1_idle,aniData.level1_touchvoice)
                elseif stage1 and stage2 == false and stage3 == false then
                    self:PlayAni(string.split(aniData.level2_touch,";")[1],false,aniData.level2_idle,aniData.level2_touchvoice)
                else
                    self:PlayAni(string.split(aniData.level3_touch1,";")[1],false,aniData.level3_idle,aniData.level3_touchvoice)
                end
            end
        end
        self:SetCombo(self.showComboCount)
        --滑动条
        self.FillImg4().transform:GetComponent("Image").fillAmount = self.ComboCount / tonumber(string.split(data.scoretotal,",")[3])
        local vfx = CJNUIMgr.GetSunUseName(self.FillImg4().gameObject,"cuozao_jindutiao").transform:GetComponent("ParticleSystem")
        local MaxVfx = CJNUIMgr.GetSunUseName(self.FillImg4().gameObject,"cuozao_jindutiao_finish").transform:GetComponent("ParticleSystem")
        local vfxPos = 580*(self.ComboCount / tonumber(string.split(data.scoretotal,",")[3]))
        if self.ComboCount / tonumber(string.split(data.scoretotal,",")[3]) >= 1 then
            if self.isMax == false then
                MaxVfx:Play(true)
                self.isMax = true
            end
        else
            vfx.gameObject.transform.parent.transform.anchoredPosition = Vector2(vfxPos,0)
            vfx:Play(true)
        end
    end)

    --点击右按钮
    UIEvent.LuaClick(self.Btn_Right().gameObject,function()
        local obj = trigger2:GetHitObj()
        --正确点击
        if obj ~= nil then
            self.ComboCount = self.ComboCount + 1
            GameObject.Destroy(obj)
            --播放命中音效
            MgrSound.PlayEffect("BeatGameTouch",1,0,false,0,0,"bathBeatTouch")
            --播放特效
            triggerVfx2:Play(true)
            --播放动画
            if self.ComboCount >= tonumber(targetScore[1]) and self.ComboCount < tonumber(targetScore[2]) and stage1 == false then
                stage1 = true   --阶段1完成
                --播放动画
                self:PlayAni(aniData.level1_changeface,false,aniData.level2_idle,aniData.level1_upvoice,nil,string.split(aniData.headpng,";")[1])
            elseif self.ComboCount >= tonumber(targetScore[2]) and self.ComboCount < tonumber(targetScore[3]) and stage2 == false then
                stage2 = true   --阶段2完成
                --播放动画
                self:PlayAni(aniData.level2_changeface,false,aniData.level3_idle,aniData.level2_upvoice,nil,string.split(aniData.headpng,";")[2])
            elseif self.ComboCount >= tonumber(targetScore[3]) and stage3 == false then
                stage3 = true   --阶段3完成
                --倒计时结束
                MgrTimer.Cancel("countdown")
                --结束
                self:SetGameOver(data.score * self.ComboCount)
            else
                if stage1 == false and stage2 == false and stage3 == false then
                    self:PlayAni(string.split(aniData.level1_touch,";")[2],false,aniData.level1_idle,aniData.level1_touchvoice)
                elseif stage1 and stage2 == false and stage3 == false then
                    self:PlayAni(string.split(aniData.level2_touch,";")[2],false,aniData.level2_idle,aniData.level2_touchvoice)
                else
                    self:PlayAni(string.split(aniData.level3_touch,";")[2],false,aniData.level3_idle,aniData.level3_touchvoice)
                end
            end
        end
        self:SetCombo(self.showComboCount)
        --滑动条
        self.FillImg4().transform:GetComponent("Image").fillAmount = self.ComboCount / tonumber(string.split(data.scoretotal,",")[3])
        local vfx = CJNUIMgr.GetSunUseName(self.FillImg4().gameObject,"cuozao_jindutiao").transform:GetComponent("ParticleSystem")
        local vfxPos = 580*(self.ComboCount / tonumber(string.split(data.scoretotal,",")[3]))
        local MaxVfx = CJNUIMgr.GetSunUseName(self.FillImg4().gameObject,"cuozao_jindutiao_finish").transform:GetComponent("ParticleSystem")
        if self.ComboCount / tonumber(string.split(data.scoretotal,",")[3]) >= 1 then
            if self.isMax == false then
                MaxVfx:Play(true)
                self.isMax = true
            end
        else
            vfx.gameObject.transform.parent.transform.anchoredPosition = Vector2(vfxPos,0)
            vfx:Play(true)
        end
    end)
    
    --左按钮点击与抬起
    UIEvent.LuaPressClick(self.Btn_Left().gameObject,function()
        CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftUp"):SetActive(false)
        CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftDown"):SetActive(true)
        MgrTimer.AddDelayNoName(0.05,function()
            if UIEvent.GetButton_Downing() == false then
                CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftUp"):SetActive(true)
                CJNUIMgr.GetSunUseName(self.Btn_Left().gameObject,"LeftDown"):SetActive(false)
            end
        end,self.ObjRoot)
    end)

    --右按钮点击与抬起
    UIEvent.LuaPressClick(self.Btn_Right().gameObject,function()
        CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightUp"):SetActive(false)
        CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightDown"):SetActive(true)
        MgrTimer.AddDelayNoName(0.05,function()
            if UIEvent.GetButton_Downing() == false then
                CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightUp"):SetActive(true)
                CJNUIMgr.GetSunUseName(self.Btn_Right().gameObject,"RightDown"):SetActive(false)
            end
        end,self.ObjRoot)
    end)

    --隐藏UI
    self.Btn_Left().gameObject:SetActive(false)
    self.Btn_Right().gameObject:SetActive(false)
    local progress = CJNUIMgr.GetSunUseName(self.Game4().gameObject,"FillArea")
    progress:SetActive(false)

    self:InitGuide(1002,function()
        --播放动画
        local ani = self.AniROOT().gameObject.transform:GetComponent("AniComplete")
        ani:PlayAni(aniData.animeplay_start,function()
            --播放开始动画
            ani:PlayAni("Ani_BathGame_UI_Start",function()
                self.GuideFinish = true
                --显示UI
                progress:SetActive(true)
                self.Btn_Left().gameObject:SetActive(true)
                self.Btn_Right().gameObject:SetActive(true)
                self.Img_HuodongTiaodi().gameObject:SetActive(true)
                self.Img_HuodongTiaodi2().gameObject:SetActive(true)
                --开始倒计时
                self:SetCountdown(data.time,function()
                    self:SetGameOver(data.score * self.ComboCount)
                    MgrTimer.Cancel("BeatSpawn")
                    MgrTimer.Cancel("BeatSpawn2")
                end,data.countdowndisplay)
                --播放循环抖动动画
                ani:PlayAni(aniData.animeplay_gaming)
                --关闭触碰遮罩
                self.GameMask().gameObject:SetActive(false)
                ani:CallBackCompleted()
                --播放游戏bgm
                MgrSound.PlayBGM(data.music,0.2)
            end)
        end)
    end)
end

---设置倒计时
function M:SetCountdown(time,callBack,NotShow)
    if NotShow == nil or NotShow == 0 then
        self.Countdown().gameObject:SetActive(false)
    else
        self.Countdown().gameObject:SetActive(true)
    end
    self.Text_Shijian().text = time
    local curTime = time
    MgrTimer.Cancel("countdown")
    MgrTimer.AddRepeat("countdown",1,function()
        curTime = curTime - 1
        if curTime < 10 then
            self.Text_Shijian().text = "0"..curTime
        else
            self.Text_Shijian().text = curTime
        end
        if curTime <= 0 then
            if callBack then
                callBack()
            end
            MgrTimer.Cancel("countdown")
        end
    end,time,self.ObjRoot)
end

---设置得分
function M:SetCombo(count)
    self.Combo().gameObject:SetActive(true)
    if count >= 999 then
        MgrRes.LoadSprite(self.ComboCount3(),"shower/Img_9")
        MgrRes.LoadSprite(self.ComboCount2(),"shower/Img_9")
        MgrRes.LoadSprite(self.ComboCount1(),"shower/Img_9")
        self.ComboCount1().gameObject:SetActive(true)
        self.ComboCount2().gameObject:SetActive(true)
        self.ComboCount3().gameObject:SetActive(true)
    elseif count >= 100 and count < 999 then
        local x = math.floor((count / 100) % 10)
        local y = math.floor((count / 10)%10)
        local z = count % 10
        MgrRes.LoadSprite(self.ComboCount3(),"shower/Img_"..x)
        MgrRes.LoadSprite(self.ComboCount2(),"shower/Img_"..y)
        MgrRes.LoadSprite(self.ComboCount1(),"shower/Img_"..z)
        self.ComboCount1().gameObject:SetActive(true)
        self.ComboCount2().gameObject:SetActive(true)
        self.ComboCount3().gameObject:SetActive(true)
    elseif count >= 10 and count < 100 then
        local x = math.floor((count / 10)%10)
        local y = count % 10
        MgrRes.LoadSprite(self.ComboCount2(),"shower/Img_"..x)
        MgrRes.LoadSprite(self.ComboCount1(),"shower/Img_"..y)
        self.ComboCount1().gameObject:SetActive(true)
        self.ComboCount2().gameObject:SetActive(true)
        self.ComboCount3().gameObject:SetActive(false)
    else
        MgrRes.LoadSprite(self.ComboCount2(),"shower/Img_"..count)
        self.ComboCount1().gameObject:SetActive(false)
        self.ComboCount2().gameObject:SetActive(true)
        self.ComboCount3().gameObject:SetActive(false)
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
        local icon = CJNUIMgr.GetSunUseName(self.RightExpression().gameObject,"Image_1").transform:GetComponent("Image")
        MgrRes.LoadSprite(icon,isChangeFace)
        self.RightExpression().gameObject.transform:GetComponent("Animator"):Play("Ani_BathGame_UI_Right_expression", 0, 0)
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

---设置头像框spine
function M:SetCamera(id,str)
--    if self.HeadSpineObj then
--        GameObject.Destroy(self.HeadSpineObj)
--    end
--    if self.HeadAniPlay == 0 or self.HeadAniPlay == nil then
--        return
--    end
--    local _tempPosTab1 = JNStrTool.strSplit(";", str)
--    local _tempPosTab2 = JNStrTool.strSplit(",", _tempPosTab1[1])
--    MgrRes.LoadWatch3DSpineInUI(self.Spine_Box().gameObject, id,tonumber(_tempPosTab2[1]), tonumber(_tempPosTab2[2]), tonumber(_tempPosTab1[2]), "idle", function(obj)
--        self.HeadSpineObj = obj
--    end)
end

---游戏结束
function M:SetGameOver(score)
    MgrTimer.Cancel("countdown")
    --当前分数
    BathControl.score = score
    BathControl.OpenBathGameEnd()
end

---弹出评分
function M:PopGrade(grade)
    self.Img_Miss().gameObject:SetActive(false)
    self.Img_Nice().gameObject:SetActive(false)
    if grade == 1 then
        self.Img_Miss().gameObject:SetActive(false)
        self.Img_Nice().gameObject:SetActive(true)
        MgrTimer.AddDelay("ClosePopGrade",5,function()
            self.Img_Nice().gameObject:SetActive(false)
        end,self.ObjRoot)
        self.showComboCount = self.showComboCount + 1
        self.ComboCount = self.ComboCount + 1
    else
        self.Img_Miss().gameObject:SetActive(true)
        self.Img_Nice().gameObject:SetActive(false)
        MgrTimer.AddDelay("ClosePopGrade",5,function()
            self.Img_Miss().gameObject:SetActive(false)
        end,self.ObjRoot)
        self.showComboCount = 0
    end
end

function M:InitGuide(id,callBack)
    --如果当前关卡已通关
    if ActiveTutorialControl.GetPopState(id) then
        callBack()
    else
        ActiveTutorialControl.ForcePopGuide(id,function()
            callBack()
        end)
    end
end

function M:OnClose()
    --倒计时结束
    MgrTimer.Cancel("countdown")
    --音游结束
    MgrTimer.Cancel("VideoGameOver")
    --弹出评分结束
    MgrTimer.Cancel("ClosePopGrade")
    MgrTimer.Cancel("BeatSpawn")
    MgrTimer.Cancel("BeatSpawn2")
    --策划需求修改主摄像机hdr
    self.ca.allowHDR = true
end

return M