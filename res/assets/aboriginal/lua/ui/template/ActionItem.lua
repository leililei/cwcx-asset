-- Code Auto Create Begin
local M = Class('ActionItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/ActionItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ActionItem','/',2},{'StatePanel','StatePanel',2},{'ImgBg','StatePanel/ImgBg',2},{'Img_Arrow','StatePanel/Img_Arrow',2},{'Img_suo','StatePanel/Img_suo',2},{'ActionBg','ActionBg',2},{'Action','ActionBg/Action',2},{'Img_Play','ActionBg/Action/Img_Play',2},
        -- UITemplate 列表
        {'ActionItem01','/',10},
        -- TextMeshProUGUI 列表
        {'Text_ActionState','StatePanel/Text_ActionState',20},{'Text_ActionName','ActionBg/Action/Text_ActionName',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    self.Img_suo().gameObject:SetActive(false)
    self.Action().gameObject:SetActive(false)

    self.ActionItem = {}
    self.CurTouchId = nil
    self.StateUnlock = true
    --状态切换
    UIEvent.LuaClick(self.StatePanel().gameObject, function()
        if not self.StateUnlock then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_personalstory_tips4"),1},true)
            return
        end
        self:PlayAction(self.CurTouchId, false)
        self:PlayAction(1, true)
        Event.Go("ActionState",self.StateId)
    end)
end

function M:OnUpdateUI(pData)
    ---@type RoleuiskintipsLocalData[]
    self.ActionData = pData[1]
    local tCurActionStateId = pData[2]
    self.StateId = self.ActionData[1].stateid
    --状态名
    self.Text_ActionState().text = MgrLanguageData.GetLanguageByKey("ui_skinaction_1")..self.StateId
    Global.Sort(self.ActionData, { "id", "range" })
    --动作名
    local tIdx = 0
    for i, v in ipairs(self.ActionData) do
        if i > #self.ActionItem then
            self.ActionItem[i] = GameObject.Instantiate(self.Action().gameObject,self.ActionBg().transform)
        end
        self.ActionItem[i].gameObject:SetActive(true)
        local ImgPlay = self.ActionItem[i].transform:Find("Img_Play"):GetComponent("Image")
        local ImgSuo = self.ActionItem[i].transform:Find("Img_suo")
        local ActionUnlock = true
        --判断解锁状态
        local tData = string.split(v.action, ',')
        local unlockItem = string.split(tData[4],'_')
        if tData[4] ~= "0" then
            local BagItemData = ItemControl.GetItemByIdAndType(tonumber(unlockItem[2]),tonumber(unlockItem[1]))
            if BagItemData and BagItemData.count < tonumber(unlockItem[3]) then
                if i == 1 then
                    --节点解锁状态,节点未解锁跳出循环
                    self.Img_suo().gameObject:SetActive(true)
                    self.Img_Arrow().gameObject:SetActive(false)
                    self.ActionBg().gameObject:SetActive(false)
                    self.StateUnlock = false

                    self.CurTouchId = i
                    return
                else
                    --动作解锁状态
                    self.ActionBg().gameObject:SetActive(true)
                    ImgSuo.gameObject:SetActive(true)
                    ImgPlay.gameObject:SetActive(false)
                    ActionUnlock = false
                end
            else
                if i == 1 then
                    --节点解锁状态
                    self.Img_suo().gameObject:SetActive(false)
                    self.Img_Arrow().gameObject:SetActive(true)
                end
                --动作解锁状态
                ImgSuo.gameObject:SetActive(false)
                ImgPlay.gameObject:SetActive(true)
            end
        else
            ImgSuo.gameObject:SetActive(false)
            ImgPlay.gameObject:SetActive(true)
        end
        
        local ActionName = self.ActionItem[i].transform:Find("Text_ActionName"):GetComponent("TextMeshProUGUI")
        ActionName.text = MgrLanguageData.GetLanguageByKey(v.nameid)
        tIdx = i+1

        local ImgAction = self.ActionItem[i].transform:GetComponent("Image")
        if i == 1 then
            self.CurTouchId = i
            MgrRes.LoadSprite(ImgPlay, "UIMusk/icon_bofang_h")
            MgrRes.LoadSprite(ImgAction, "UIMusk/img_zhuangtai_s_l")
        else
            MgrRes.LoadSprite(ImgPlay, "UIMusk/icon_bofang_n")
            MgrRes.LoadSprite(ImgAction, "UIMusk/img_zhuangtai_s_n")
        end
        --动作按钮
        UIEvent.LuaClick(self.ActionItem[i].gameObject, function()
            if not ActionUnlock then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_personalstory_tips4"),1},true)
                return
            end
            if self.CurTouchId ~= i then
                self:PlayAction(self.CurTouchId, false)
                self:PlayAction(i, true)
            end
        end)
    end
    for i = tIdx, #self.ActionItem do
        self.ActionItem[i].gameObject:SetActive(false)
    end
    --刷新状态
    self:RefreshState(self.StateId == tCurActionStateId)
end
---刷新状态
function M:RefreshState(_isOpen)
    self.ActionBg().gameObject:SetActive(_isOpen)
    if _isOpen then
        self.Img_Arrow().transform.localRotation = Quaternion.Euler(0,0,0)
    else
        self.Img_Arrow().transform.localRotation = Quaternion.Euler(0,0,180)
    end
    self:PlayAction(self.CurTouchId, false)
    self:PlayAction(1,_isOpen)
end

function M:ItemUpdate(pData)
    --刷新状态
    self:RefreshState(pData[1])
end
---播放动画
function M:PlayAction(_id,_isPlay)
    local ImgAction = self.ActionItem[_id].transform:GetComponent("Image")
    local ImgPlay = self.ActionItem[_id].transform:Find("Img_Play"):GetComponent("Image")
    if _isPlay then
        self.CurTouchId = _id
        MgrRes.LoadSprite(ImgPlay, "UIMusk/icon_bofang_h")
        MgrRes.LoadSprite(ImgAction, "UIMusk/img_zhuangtai_s_l")
        --播动作
        Event.Go("ActionPlay",self.ActionData[_id])
    else
        MgrRes.LoadSprite(ImgPlay, "UIMusk/icon_bofang_n")
        MgrRes.LoadSprite(ImgAction, "UIMusk/img_zhuangtai_s_n")
    end
end

return M