-- Code Auto Create Begin
local M = Class('BlueprintTotalPropItem', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintTotalPropItem.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgBg','ImgBg',2},
        -- UITemplate 列表
        {'BlueprintTotalPropItem','/',10},
        -- TextMeshProUGUI 列表
        {'TextTitle','TextTitle',20},{'TextName','TextName',20},{'TextValue','TextValue',20},
    }
end
-- Code Auto Create End
function M:OnInit()
end
function M:OnUpdateUI(pData)
    local data = pData[1];
    if 1 == data.type then
        self.ImgBg().gameObject:SetActive(false);
        self.TextTitle().gameObject:SetActive(true);
        self.TextTitle().text = data.name;
        self.TextName().gameObject:SetActive(false);
        self.TextValue().gameObject:SetActive(false);
        return;
    elseif 3 == data.type then
        self.ImgBg().gameObject:SetActive(false);
        self.TextTitle().gameObject:SetActive(false);
        self.TextName().gameObject:SetActive(false);
        self.TextValue().gameObject:SetActive(false);
        return;
    end

    self.ImgBg().gameObject:SetActive(data.showBg);
    self.TextTitle().gameObject:SetActive(false);
    self.TextName().gameObject:SetActive(true);
    -- key 对应的是蓝图表配置的属性类型
    local propNames = {
        -- base
        [0] = "ui_yangcheng_text14",
        [1] = "ui_yangcheng_text14",
        [2] = "ui_yangcheng_text13",
        [3] = "ui_yangcheng_text13",
        [4] = "ui_yangcheng_text16",
        [5] = "ui_yangcheng_text17",
        [6] = "ui_yangcheng_text18",
        [7] = "ui_yangcheng_text19",
        [8] = "ui_yangcheng_text15",
        -- ex
        [9] = "ui_Blueprint_text_08",
        [10] = "ui_Blueprint_text_14",
        [11] = "ui_Blueprint_text_15",
        [12] = "ui_Blueprint_text_16",
        [13] = "ui_Blueprint_text_17",
        [14] = "ui_Blueprint_text_18",
        [15] = "ui_Blueprint_text_19",
        [16] = "ui_Blueprint_text_20",
        [17] = "ui_Blueprint_text_21",
        [18] = "ui_Blueprint_text_22",
        [20] = "ui_Blueprint_text_23",
        [21] = "ui_Blueprint_text_24",
        [22] = "ui_Blueprint_text_25",
        [23] = "ui_Blueprint_text_26",
        [24] = "ui_Blueprint_text_27",
        [25] = "ui_Blueprint_text_28",
        [26] = "ui_Blueprint_text_29",
        [27] = "ui_Blueprint_text_30",
        [28] = "ui_Blueprint_text_32",
        [29] = "ui_Blueprint_text_33",
        [30] = "ui_Blueprint_text_34",
        [31] = "ui_Blueprint_text_35",
        [32] = "ui_Blueprint_text_36",
        [34] = "ui_Blueprint_text_38",
        [36] = "ui_Blueprint_text_40",
        [38] = "ui_Blueprint_text_42",
        [40] = "ui_Blueprint_text_44",
        [41] = "ui_Blueprint_text_45", -- 真伤抵抗
    }
    if nil ~= propNames[data.propType] then
        self.TextName().text = MgrLanguageData.GetLanguageByKey(propNames[data.propType]);
    else
        self.TextName().text = data.propType;
    end
    self.TextValue().gameObject:SetActive(true);
    self.TextValue().text = data.propValue;
end
return M
