-- Code Auto Create Begin
local M = Class('BlueprintItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'InnerNode','InnerNode',2},{'ImgUnActive','InnerNode/ImgUnActive',2},{'ImgActive','InnerNode/ImgUnActive/ImgActive',2},{'LineNode','InnerNode/LineNode',2},{'ImgLineNormal','InnerNode/LineNode/ImgLineNormal',2},{'ImgLineHigh','InnerNode/LineNode/ImgLineHigh',2},{'ImgBgNormal','InnerNode/ImgBgNormal',2},{'ImgIconNormal','InnerNode/ImgBgNormal/ImgIconNormal',2},{'ImgBgHigh','InnerNode/ImgBgHigh',2},{'ImgIconHigh','InnerNode/ImgBgHigh/ImgIconHigh',2},{'ImgSelect','InnerNode/ImgSelect',2},{'PanelActive','InnerNode/PanelActive',2},
        -- UITemplate 列表
        {'BlueprintItem','/',10},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ImgBgNormal().gameObject, Handle(self, self.OnBtnClicked));
    UIEvent.LuaClick(self.ImgBgHigh().gameObject, Handle(self, self.OnBtnClicked));
end
function M:OnUpdateUI(pData)
    local rot = pData[1];
    local order = pData[3];
    self.m_conf = BlueprintViewModel.GetConfByOrder(order);
    if nil == self.m_conf then
        --UnityEngine.DebugEx.LogError("BlueprintItem.OnUpdateUI. cant find config of order " .. order);
        self.InnerNode().gameObject:SetActive(false);
        return;
    end
    self.InnerNode().gameObject:SetActive(true);
    -- 线角度
    self.LineNode().transform.rotation = Quaternion.Euler(0, 0, rot);
    self.ImgLineHigh().gameObject:SetActive(false);
    self.ImgLineNormal().gameObject:SetActive(true);
    self.ImgBgHigh().gameObject:SetActive(false);
    self.ImgBgNormal().gameObject:SetActive(true);
    self.m_data = BlueprintViewModel.GetDataByOrder(order);
    
    MgrRes.LoadSprite(self.ImgIconNormal(), "Blueprint/icon/" .. self.m_conf.icon);
    MgrRes.LoadSprite(self.ImgIconHigh(), "Blueprint/icon/" .. self.m_conf.icon .. "_active");
    if nil == self.m_data or self.m_data.level < 1 then
        -- 未激活
        self.PanelActive().gameObject:SetActive(false);
        self.ImgLineHigh().gameObject:SetActive(false);
        self.ImgLineNormal().gameObject:SetActive(true);
        if true == BlueprintViewModel.CanActive(self.m_conf) then
            -- 可激活
            self.ImgBgHigh().gameObject:SetActive(true);
            self.ImgBgNormal().gameObject:SetActive(false);
        else
            -- 不可激活
            self.ImgBgHigh().gameObject:SetActive(false);
            self.ImgBgNormal().gameObject:SetActive(true);
        end
    else
        -- 已激活
        self.PanelActive().gameObject:SetActive(true);
        self.ImgLineHigh().gameObject:SetActive(true);
        self.ImgLineNormal().gameObject:SetActive(false);
        self.ImgBgHigh().gameObject:SetActive(true);
        self.ImgBgNormal().gameObject:SetActive(false);
        -- 等级点点
        Tools.ClearAllChild(self.PanelActive().gameObject);
        for i = 1, self.m_conf.max do
            local obj = GameObject.Instantiate(self.ImgUnActive(), self.PanelActive().transform, false)
            obj.gameObject:SetActive(true);
            if i <= self.m_data.level then
                obj.transform:Find("ImgActive").gameObject:SetActive(true);
            else
                obj.transform:Find("ImgActive").gameObject:SetActive(false);
            end
        end
    end
end
function M:OnBtnClicked()
    if nil == self.m_conf then
        return;
    end
    Event.Go("BlueprintOpenDetail", self.m_conf, self.m_data);
end
return M