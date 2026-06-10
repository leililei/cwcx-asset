-- Code Auto Create Begin
local M = Class('BlueprintCareerItemS', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/BlueprintCareerItemS.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'ImgCareer','ImgCareer',2},
        -- UITemplate 列表
        {'BlueprintCareerItemS','/',10},
        -- TextMeshProUGUI 列表
        {'TextActive','ImgCareer/TextActive',20},{'TextTotal','ImgCareer/TextTotal',20},
    }
end
-- Code Auto Create End
function M:OnInit()
    UIEvent.LuaClick(self.ImgCareer().gameObject, function()
        BlueprintViewModel.SetCurType(1);
        BlueprintViewModel.SetCurCareer(self.m_career);
        Event.Go("BlueprintRefresh");
    end);
end
function M:OnUpdateUI(pData)
    self.m_career = pData[1];
    self:Refresh();
end
function M:Refresh()
    local bgPaths = {
        [1] = "Blueprint/btn_blueprint_fangwei_m",
        [2] = "Blueprint/btn_blueprint_gongji_m",
        [3] = "Blueprint/btn_blueprint_huoli_m",
        [4] = "Blueprint/btn_blueprint_zhiyuan_m",
        [11] = "Blueprint/btn_blueprint_chaoyue_m",
    }
    MgrRes.LoadSprite(self.ImgCareer(), bgPaths[self.m_career]);
    local textColors = {
        [1] = 0x3695D5,
        [2] = 0xD33628,
        [3] = 0x6938CC,
        [4] = 0x38CCBB,
        [11] = 0xD52D89,
    }
    self.TextTotal().color = Tool.Hex2Color(textColors[self.m_career]);
    self.TextTotal().text = BlueprintViewModel.GetCareerTotalPoint(self.m_career);
    self.TextActive().text = BlueprintViewModel.GetCareerPoint(self.m_career);
end
return M