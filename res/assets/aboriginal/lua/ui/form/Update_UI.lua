-- Code Auto Create Begin
local M = Class('Update_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Update_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Update_UI].prefab'
    self.Name = 'Form[Update_UI]'
    self.Layer = UILayerLv.Lock
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Mask','Mask',2},{'Info','Info',2},{'InternetBG','Info/InternetBG',2},{'TitleEdge','Info/Text_Content/Text_Title/TitleEdge',2},{'Img_MaskTop','Img_MaskTop',2},{'Img_MaskBottom','Img_MaskBottom',2},{'Background','Img_MaskBottom/Slider_loading/Background',2},{'Fill','Img_MaskBottom/Slider_loading/Fill Area/Fill',2},{'Img_loading','Img_MaskBottom/Img_loading',2},
        -- Slider 列表
        {'Slider_loading','Img_MaskBottom/Slider_loading',5},
        -- TextMeshProUGUI 列表
        {'Text_Content','Info/Text_Content',20},{'Text_Title','Info/Text_Content/Text_Title',20},{'VerText','Img_MaskTop/VerText',20},{'PointText','Img_MaskBottom/PointText',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.slider = self.Background().transform.parent:GetComponent("Slider")
    self.Img_loading = self.Img_loading()
    self.InternetBG = self.InternetBG()
    self.Text_Title = self.Text_Title()
    self.Text_Content = self.Text_Content()
    ---获取内容group
    self.InfoGroup = self.Info().gameObject:GetComponent("CanvasGroup")
    self.info = self.PointText()
    self.curKb = 0
    self.lastKb = 0
    self.speed = 0
    self.HideState = true
    self.bgUrl = {
        "downloadimg/1",
        "downloadimg/2",
        "downloadimg/3",
        "downloadimg/4",
        "downloadimg/5",
    }
    self.TextIdList = {}
    for id, info in pairs(LoadingtextLocalData.tab) do
        self.TextIdList[#self.TextIdList + 1] = id
    end
    ---下载速度计算
    MgrTimer.AddRepeat("DownloadSpeed",1,function ()
        if self.HideState == false then
            return
        end
        self.speed = self.curKb - self.lastKb
        if self.speed < 0 then
            self.speed = 0
        end
        self.lastKb = self.curKb
    end,-1,nil)
    ---背景切换
    self.ChangeBgRandom = 1
    self.ChangeTxRandom = self.TextIdList[1]
    MgrTimer.AddRepeat("UpdateChangeBackground",11,function ()
        if self.HideState == false then
            return
        end
        Tools.DoGroupFade(self.InfoGroup,0,1,0,2,false,0,0)
        local bgRandom = 1
        while true do
            bgRandom = math.random(1,5)
            if self.ChangeRandom ~= bgRandom then
                self.ChangeRandom = bgRandom
                break
            end
        end
        local txRandom = 1
        while true do
            txRandom = math.random(1,#self.TextIdList)
            if self.ChangeTxRandom ~= self.TextIdList[txRandom] then
                self.ChangeTxRandom = self.TextIdList[txRandom]
                break
            end
        end
        MgrTimer.AddDelayNoName(1, function ()
            MgrRes.LoadResourceSprite(self.InternetBG,self.bgUrl[self.ChangeRandom],function(obj)
                Tools.DoGroupFade(self.InfoGroup,1,1,0,5,false,0,0)
                self.InternetBG.transform.localScale = Vector3.one
                local textConfig = LoadingtextLocalData.tab[self.ChangeTxRandom]
                if textConfig ~= nil then
                    self.Text_Title.text = textConfig.title
                    self.Text_Content.text = textConfig.text
                end
            end)
        end)
    end,-1,nil)
    ---界面动画
    self.UpdateAnimSpeed = 0.01
    self.UpdateAnimScale = 1
    self.UpdateAnimBgSpeed = 0.00002
    MgrTimer.AddRepeat("UpdateViewAnim",0,function ()
        if self.HideState == false then
            return
        end
        self.Img_loading.fillAmount = self.Img_loading.fillAmount + self.UpdateAnimSpeed
        if self.Img_loading.fillAmount == 1 then
            self.UpdateAnimSpeed = -0.01
            self.Img_loading.fillClockwise = false
        elseif self.Img_loading.fillAmount == 0 then
            self.UpdateAnimSpeed = 0.01
            self.Img_loading.fillClockwise = true
        end

        if self.InternetBG.transform.localScale.x < 1.2 then
            self.UpdateAnimScale = self.UpdateAnimScale + self.UpdateAnimBgSpeed
            self.InternetBG.transform.localScale = Vector3(self.UpdateAnimScale,self.UpdateAnimScale,1)
        end
    end,-1,nil)

    self.VerText().text = "Ver"..MgrHot.CS:GetAppVer()
end

function M:OnShow(args)
    self.HideState = true
    self.ObjRoot:SetActive(true)
    local progress = args[1] and args[1] or 0
    local name = args[2]
    local size = args[3]
    local type = 1
    if args[4] ~= nil then
        type = args[4]
    end

    self.curKb = (MgrHot.curSize + (size * progress))

    local curMB = self.curKb/1024
    local allMB = MgrHot.allSize/1024

    self.slider.value = progress
    if type == 1 then
        self.info.text = string.format(MgrLanguageData.GetLanguageByKey("update_ui_resources_download"),curMB,allMB,self.speed)
    else
        self.info.text = string.format(MgrLanguageData.GetLanguageByKey("update_ui_resources_unzip"))
    end
end

function M:OnHide()
    self.HideState = false
    self.ObjRoot:SetActive(false)
end

return M