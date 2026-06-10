-- Code Auto Create Begin
local M = Class('Activity_NoviceItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_NoviceItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'2','/',2},{'Jump','Jump',2},{'Img_Missiondi','Img_Missiondi',2},{'Kelingqu','Kelingqu',2},{'Img_Missiondi2','Kelingqu/Img_Missiondi2',2},{'Img_HuodongJindu','Img_HuodongJindu',2},{'Img_Jinduquan','Img_HuodongJindu/Img_Jinduquan',2},{'Img_Daojujiangli','Img_Daojujiangli',2},{'Lingqu','Lingqu',2},{'Img_Lingqudi','Lingqu/Img_Lingqudi',2},{'Yiwancheng','Yiwancheng',2},{'Img_Gou','Yiwancheng/Img_Gou',2},
        -- Button 列表
        {'Jump01','Jump',4},{'Kelingqu01','Kelingqu',4},{'Img_Daojujiangli01','Img_Daojujiangli',4},
        -- UITemplate 列表
        {'201','/',10},
        -- TextMeshProUGUI 列表
        {'Text_Mission','Img_Missiondi/Text_Mission',20},{'Text_Mission01','Kelingqu/Img_Missiondi2/Text_Mission',20},{'Text_Renwushuoming','Text_Renwushuoming',20},{'Text_Jindu','Img_HuodongJindu/Text_Jindu',20},{'Text_Daojuming','Text_Daojuming',20},{'Text_Lingqu','Lingqu/Img_Lingqudi/Text_Lingqu',20},
    }
end
-- Code Auto Create End
require("LocalData/ItemLocalData")
function M:OnInit()
    self.CurVfx = nil
    self.VfxObj = {}
end

function M:OnUpdateUI(pData)
    ---@type AchievementTaskData
    self.data = pData[1]
    self.parent = pData[2]
    ---任务说明
    self.Text_Renwushuoming().text = self.data.txt
    ---任务完成度
    local completeCondition = string.split(self.data.complete, "_")
    local rate
    local completeNum = TaskControl.gloryStatistics[tonumber(completeCondition[1])] --完成度
    if TaskControl.gloryStatistics[tonumber(completeCondition[1])] then
        rate = completeNum / tonumber(completeCondition[3])
    else
        rate = 0
        completeNum = 0
    end
    if rate > 1 then
        rate = 1
    end
    self.Img_Jinduquan().fillAmount = rate
    self.Text_Jindu().text = "<color=#FFBE02>" .. completeNum .. "</color>/" .. tonumber(completeCondition[3])
    ---奖励道具名
    if self.data.reward[1].goodsID ~= nil and self.data.reward[1].goodsNum ~= nil and self.data.reward[1].goodsType ~= nil then
        self.Text_Daojuming().text = ItemLocalData.tab[self.data.reward[1].goodsID].name .. " x" .. self.data.reward[1].goodsNum
    else
        self.Text_Daojuming().text = ""
    end
    ---奖励道具图片
    if self.data.reward[1].goodsID then
        MgrRes.LoadSprite(self.Img_Daojujiangli(), ItemControl.GetItemByID(self.data.reward[1].goodsID).icon, nil, false)
    else
        self.Img_Daojujiangli().gameObject:SetActive(false)
    end
    ---背景图
    if self.parent.CurCfg.btnBg ~= "0" then
        MgrRes.LoadSprite(self.Kelingqu(), self.parent.CurCfg.btnBg)
    end
    ---标题颜色
    if self.parent.CurCfg.btnColor ~= "0" then
        self.Img_Missiondi2().color = Color(tonumber(self.parent.CurCfg.btnColor[1]),tonumber(self.parent.CurCfg.btnColor[2]),tonumber(self.parent.CurCfg.btnColor[3]),1)
    end
    ---特效
    if self.parent.CurCfg.btnEffect ~= "0" and self.VfxObj[self.parent.CurCfg.btnEffect] == nil then
        --加载动态模型
        MgrRes.GetPrefab(self.parent.CurCfg.btnEffect..".prefab",function(Obj)
            if Obj == nil then
                return
            end
            self.VfxObj[self.parent.CurCfg.btnEffect] = Obj
            Obj.transform:SetParent(self.Kelingqu().gameObject.transform,false)
            
            if self.CurVfx then
                self.CurVfx.gameObject:SetActive(false)
            end
            self.CurVfx = Obj
        end)
    elseif not self.VfxObj[self.parent.CurCfg.btnEffect].gameObject.activeSelf then
        self.CurVfx.gameObject:SetActive(false)
        self.CurVfx = self.VfxObj[self.parent.CurCfg.btnEffect]
        self.CurVfx.gameObject:SetActive(true)
    end

    self.Kelingqu().gameObject:SetActive(false)
    self.Jump().gameObject:SetActive(false)
    self.Yiwancheng().gameObject:SetActive(false)
    ---可领取
    if self.data.isReceive == 1 then
        self.Kelingqu().gameObject:SetActive(true)
        self.Jump().gameObject:SetActive(false)
        self.Yiwancheng().gameObject:SetActive(false)
        self.Lingqu().gameObject:SetActive(true)
        self.Text_Jindu().text = "<color=#FFBE02>" .. tonumber(completeCondition[3]) .. "</color>/" .. tonumber(completeCondition[3])--MgrLanguageData.GetLanguageByKey("ui_tongyong_text14")
    else
        self.Kelingqu().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(true)
        self.Lingqu().gameObject:SetActive(false)
    end
    ---是否已完成
    if self.data.isComplete == 1 then
        self.Yiwancheng().gameObject:SetActive(true)
        self.Kelingqu().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(false)

        self.Text_Jindu().text = "-/-"
    else
        self.Yiwancheng().gameObject:SetActive(false)
        self.Jump().gameObject:SetActive(true)
    end

    UIEvent.LuaClick(self.Jump().gameObject, function()
        self:NoviceTaskJump(self.data)
    end)
    -- UIEvent.LuaClick(self.Kelingqu().gameObject, function()
    --     TaskControl.GetNoviceItemReward(self.data, self.parent)
    -- end)
    --Lingqu
    UIEvent.LuaClick(self.Lingqu().gameObject, function()
        TaskControl.GetNoviceItemReward(self.data, self.parent)
    end)
    UIEvent.LuaClick(self.Img_Daojujiangli().gameObject, function()
        if self.data.reward[1].goodsID then
            MgrUI.Pop(UID.ItemDetailPop_UI, { ItemControl.GetItemByID(self.data.reward[1].goodsID), false, function()
            end }, true)
        end
    end)
end

---新手任务跳转
function M:NoviceTaskJump(noviceData)
    local transformInfo = {}
    transformInfo = string.split(TaskControl.NoviceDataList[noviceData.id].gotoID, "_")
    --判断跳转关卡是否为简单
    local id = tonumber(transformInfo[4])
    local tab = ChapterLocalData.tab[id]
    if tab then
        local isNormal =  tab.type
        if isNormal and isNormal == 0 then
            StormViewModel.CurLevelType = StormViewModel.LevelType.Normal
        elseif isNormal and isNormal == 1 then
            StormViewModel.CurLevelType = StormViewModel.LevelType.Hard
        end
    end
    
    ---跳转到对应界面
    MgrLink.LinkStart(transformInfo)

    --MgrUI.ClosePop(UID.HuoDongPop_UI)
end

return M