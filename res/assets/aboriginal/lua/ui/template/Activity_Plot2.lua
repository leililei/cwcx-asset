-- Code Auto Create Begin
local M = Class('Activity_Plot2', UIItemBase)
function M:ctor()
    M.super.ctor(self)
    self.PathPrefab = 'ABOriginal/UI/Prefab/Template/Activity_Plot2.prefab'
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Activity_Plot2','/',2},{'Img_Btndi4','LeftButton/Gallery/Img_Btndi4',2},{'btn_gallery','LeftButton/Gallery/btn_gallery',2},{'Img_Btndi2','LeftButton/Shop/Img_Btndi2',2},{'btn_shop','LeftButton/Shop/btn_shop',2},{'Img_Btndi1','LeftButton/Story/Img_Btndi1',2},{'btn_story','LeftButton/Story/btn_story',2},{'Img_Btndi3','LeftButton/Mission/Img_Btndi3',2},{'btn_mission','LeftButton/Mission/btn_mission',2},{'MissionRedDotIcon','LeftButton/Mission/btn_mission/MissionRedDotIcon',2},{'Img_ShengYuTian','HuoDongShiJian/Img_ShengYuTian',2},{'RaidBg','RaidBtn/RaidBg',2},{'Raiddi','RaidBtn/Raiddi',2},{'Img_Xian','RaidBtn/Img_Xian',2},{'Img_Huodongguanka','RaidBtn/Img_Huodongguanka',2},{'Img_Raid','RaidBtn/Img_Raid',2},{'Btn_Easy','BossGroup/Btn_Easy',2},{'Btn_Normal','BossGroup/Btn_Normal',2},
        -- Text 列表
        {'Text_Gallery','LeftButton/Gallery/Text_Gallery',3},{'Text_Shop','LeftButton/Shop/Text_Shop',3},{'Text_Story','LeftButton/Story/Text_Story',3},{'Text_Mission','LeftButton/Mission/Text_Mission',3},{'NowLevel','RaidBtn/RaidLevel_Text/NowLevel',3},{'LevelNumber','RaidBtn/RaidLevel_Text/LevelNumber',3},{'Text_Easyrecommend','BossGroup/Btn_Easy/Text_Easyrecommend',3},{'Text_Easyrank','BossGroup/Btn_Easy/Text_Easyrank',3},{'Text_Easyshadow','BossGroup/Btn_Easy/Text_Easyshadow',3},{'Text_Easyuse','BossGroup/Btn_Easy/Text_Easyuse',3},{'Text_Easy','BossGroup/Btn_Easy/Text_Easy',3},{'Text_Normalrecommend','BossGroup/Btn_Normal/Text_Normalrecommend',3},{'Text_Normalrank','BossGroup/Btn_Normal/Text_Normalrank',3},{'Text_Normalshadow','BossGroup/Btn_Normal/Text_Normalshadow',3},{'Text_Normaluse','BossGroup/Btn_Normal/Text_Normaluse',3},{'Text_Normal','BossGroup/Btn_Normal/Text_Normal',3},
        -- Button 列表
        {'btn_gallery01','LeftButton/Gallery/btn_gallery',4},{'btn_shop01','LeftButton/Shop/btn_shop',4},{'btn_story01','LeftButton/Story/btn_story',4},{'btn_mission01','LeftButton/Mission/btn_mission',4},{'RaidBg01','RaidBtn/RaidBg',4},{'Btn_Easy01','BossGroup/Btn_Easy',4},{'Btn_Normal01','BossGroup/Btn_Normal',4},
        -- UITemplate 列表
        {'Activity_Plot201','/',10},
        -- TextMeshProUGUI 列表
        {'Text_JuTiShiJian','HuoDongShiJian/Text_JuTiShiJian',20},{'Text_ShengYuTian','HuoDongShiJian/Img_ShengYuTian/Text_ShengYuTian',20},{'Text_XiaoShi','HuoDongShiJian/Text_XiaoShi',20},
    }
end
-- Code Auto Create End
return M