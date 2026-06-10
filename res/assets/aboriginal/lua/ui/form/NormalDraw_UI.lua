-- Code Auto Create Begin
local M = Class('NormalDraw_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.NormalDraw_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[NormalDraw_UI].prefab'
    self.Name = 'Form[NormalDraw_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 2
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'BgPanel','Ani/BgPanel',2},{'CardPoolPanel','Ani/CardPoolPanel',2},{'CardPoolItem','Ani/CardPoolPanel/CardPoolItem',2},{'RolePoolPanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel',2},{'BackGroundImg','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg',2},{'Btn_Chakan','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Chakan',2},{'InfoIcon','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Chakan/InfoIcon',2},{'Btn_Info','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Info',2},{'InfoIcon01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Info/InfoIcon',2},{'DuihuanPanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel',2},{'Img_Xiangqingdi','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel/Img_Xiangqingdi',2},{'Xiangqingicon','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel/Img_Xiangqingdi/Xiangqingicon',2},{'Btn_Duihuan','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel/Btn_Duihuan',2},{'BtnNormalDraw','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnNormalDraw',2},{'ImgNormalIcon','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnNormalDraw/ImgNormalIcon',2},{'BtnTenNormalDraw','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnTenNormalDraw',2},{'ImgTenNormalIcon','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnTenNormalDraw/ImgTenNormalIcon',2},{'ProRecruitPanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProRecruitPanel',2},{'Btn_ProRecruit','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProRecruitPanel/Btn_ProRecruit',2},{'NeedIcon','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProRecruitPanel/NeedIcon',2},{'ProTenRecruitPanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProTenRecruitPanel',2},{'Btn_ProTenRecruit','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProTenRecruitPanel/Btn_ProTenRecruit',2},{'NeedIcon01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProTenRecruitPanel/NeedIcon',2},{'NovicePanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/NovicePanel',2},{'Btn_ProTenRecruit01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/NovicePanel/Btn_ProTenRecruit',2},{'NeedIcon02','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/NovicePanel/NeedIcon',2},{'CardDrawBtnPanel','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/CardDrawBtnPanel',2},{'GearVoidPanel','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel',2},{'Img_VoidBg','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Img_VoidBg',2},{'Btn_TenGearVoid','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenGearVoid',2},{'Img_Bujidi(Gongmingshi)1','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenGearVoid/Img_Bujidi(Gongmingshi)1',2},{'Gongmingshiicon1','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenGearVoid/Gongmingshiicon1',2},{'Btn_GearVoid','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_GearVoid',2},{'Img_Bujidi(Gongmingshi)2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_GearVoid/Img_Bujidi(Gongmingshi)2',2},{'Gongmingshiicon2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_GearVoid/Gongmingshiicon2',2},{'Btn_TenCoin','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenCoin',2},{'Img_Bujidi(Dunbi)1','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenCoin/Img_Bujidi(Dunbi)1',2},{'Dunbiicon1','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenCoin/Dunbiicon1',2},{'Btn_Coin','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Coin',2},{'Img_Bujidi(Dunbi)2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Coin/Img_Bujidi(Dunbi)2',2},{'Dunbiicon2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Coin/Dunbiicon2',2},{'Btn_VoidInfo','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_VoidInfo',2},{'InfoIcon02','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_VoidInfo/InfoIcon',2},{'Btn_Qiehuan','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Qiehuan',2},{'Img_Qiehuandi','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Qiehuan/Img_Qiehuandi',2},{'QiehuanIcon','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Qiehuan/Img_Qiehuandi/QiehuanIcon',2},{'PrizeDrawPanel','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel',2},{'BackGroundImg_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize',2},{'Btn_Chakan_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Chakan_Prize',2},{'InfoIcon_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Chakan_Prize/InfoIcon_Prize',2},{'Btn_Info_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Info_Prize',2},{'InfoIcon_Prize01','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Info_Prize/InfoIcon_Prize',2},{'CardDrawBtnPanel_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize',2},{'PrizeDrawBtnPanel','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/PrizeDrawBtnPanel',2},{'Btn_ProTenRecruit_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/PrizeDrawBtnPanel/Btn_ProTenRecruit_Prize',2},{'NeedIcon_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/PrizeDrawBtnPanel/NeedIcon_Prize',2},{'Dangqianjieduan_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/Dangqianjieduan_Prize',2},{'LightDarkPanel','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel',2},{'LightDarkBg','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg',2},{'Btn_Chakan4','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Chakan4',2},{'InfoIcon03','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Chakan4/InfoIcon',2},{'Btn_Info4','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Info4',2},{'InfoIcon04','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Info4/InfoIcon',2},{'Btn_SkinShop','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_SkinShop',2},{'CardDrawBtnPanel01','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel',2},{'Shengyucishu','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Shengyucishu',2},{'BtnNormalDrawSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnNormalDrawSP',2},{'ImgNormalIconSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnNormalDrawSP/ImgNormalIconSP',2},{'BtnTenNormalDrawSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnTenNormalDrawSP',2},{'ImgTenNormalIconSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnTenNormalDrawSP/ImgTenNormalIconSP',2},{'Btn_SpecialDraw','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw',2},{'Img_ProRecruit','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/Img_ProRecruit',2},{'NeedIcon03','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/NeedIcon',2},{'FreeRedDotIcon','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/FreeRedDotIcon',2},{'Btn_SpecialDrawFive','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive',2},{'Img_ProTenRecruit','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/Img_ProTenRecruit',2},{'NeedIcon04','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/NeedIcon',2},{'FreeRedDotIcon01','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/FreeRedDotIcon',2},{'Btn_Tips','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_Tips',2},{'Img_Tips','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_Tips/Img_Tips',2},{'FreePoolPanel','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel',2},{'FreePool_Bg','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg',2},{'Btn_FreeChakan','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeChakan',2},{'InfoIcon05','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeChakan/InfoIcon',2},{'Btn_FreeInfo','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeInfo',2},{'InfoIcon06','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeInfo/InfoIcon',2},{'SRPanel1','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1',2},{'Img_Zixuandi1_sr','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr',2},{'Img_Jia','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr/Img_Jia',2},{'Free_RoleLihuiImg','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr/Free_RoleLihuiImg',2},{'NamePanel','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel',2},{'Free_ProTypeImg','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel/Free_ProTypeImg',2},{'Img_Jiaobiao_sr','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Jiaobiao_sr',2},{'Img_SR','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_SR',2},{'SRPanel2','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2',2},{'Img_Zixuandi1_sr01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr',2},{'Img_Jia01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr/Img_Jia',2},{'Free_RoleLihuiImg01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr/Free_RoleLihuiImg',2},{'NamePanel01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel',2},{'Free_ProTypeImg01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel/Free_ProTypeImg',2},{'Img_Jiaobiao_sr01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Jiaobiao_sr',2},{'Img_SR01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_SR',2},{'SSRPanel1','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1',2},{'Img_Zixuandi1_ssr','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr',2},{'Img_Jia02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr/Img_Jia',2},{'Free_RoleLihuiImg02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr/Free_RoleLihuiImg',2},{'NamePanel02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel',2},{'Free_ProTypeImg02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel/Free_ProTypeImg',2},{'Img_Jiaobiao_ssr','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Jiaobiao_ssr',2},{'Img_SSR','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_SSR',2},{'SSRPanel2','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2',2},{'Img_Zixuandi1_ssr01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr',2},{'Img_Jia03','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr/Img_Jia',2},{'Free_RoleLihuiImg03','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr/Free_RoleLihuiImg',2},{'NamePanel03','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel',2},{'Free_ProTypeImg03','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel/Free_ProTypeImg',2},{'Img_Jiaobiao_ssr01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Jiaobiao_ssr',2},{'Img_SSR01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_SSR',2},{'Img_SRxian','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Img_SRxian',2},{'Img_SSRxian','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Img_SSRxian',2},{'Duihuan_Free','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free',2},{'Img_Xiangqingdi01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free/Img_Xiangqingdi',2},{'Xiangqingicon01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free/Img_Xiangqingdi/Xiangqingicon',2},{'Btn_Duihuan01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free/Btn_Duihuan',2},{'CardDrawBtnPanel02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel',2},{'Btn_FreeRecruit','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeRecruit',2},{'Img_ProRecruit01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeRecruit/Img_ProRecruit',2},{'NeedIcon05','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeRecruit/NeedIcon',2},{'Btn_FreeTenRecruit','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeTenRecruit',2},{'Img_ProTenRecruit01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeTenRecruit/Img_ProTenRecruit',2},{'NeedIcon06','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeTenRecruit/NeedIcon',2},{'TypeContent','Ani/SwtichBtnPanel/TypeContent',2},{'SwitchLeixing','Ani/SwtichBtnPanel/SwitchLeixing',2},{'CardPoolTitle','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle',2},{'highLight','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle/highLight',2},{'grey','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle/grey',2},{'AllRedDotIcon','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle/AllRedDotIcon',2},{'Yeqiantu','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/CardPoolPrefab/Yeqiantu',2},{'Biaoqian','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/CardPoolPrefab/Biaoqian',2},{'itemMask','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/CardPoolPrefab/itemMask',2},{'Content','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/Content',2},{'ItemRoot','Ani/ItemRoot',2},{'GongmingItem','Ani/ItemRoot/GongmingItem',2},{'Btn_Add','Ani/ItemRoot/GongmingItem/Btn_Add',2},{'Img_Icon','Ani/ItemRoot/GongmingItem/Img_Icon',2},{'DunBiItem','Ani/ItemRoot/DunBiItem',2},{'Btn_Add01','Ani/ItemRoot/DunBiItem/Btn_Add',2},{'Img_Icon01','Ani/ItemRoot/DunBiItem/Img_Icon',2},{'NomalItem','Ani/ItemRoot/NomalItem',2},{'Btn_Add02','Ani/ItemRoot/NomalItem/Btn_Add',2},{'Img_Icon02','Ani/ItemRoot/NomalItem/Img_Icon',2},{'JingYinItem','Ani/ItemRoot/JingYinItem',2},{'Btn_Add03','Ani/ItemRoot/JingYinItem/Btn_Add',2},{'Img_Icon03','Ani/ItemRoot/JingYinItem/Img_Icon',2},{'lightDarkItem','Ani/ItemRoot/lightDarkItem',2},{'Btn_Add04','Ani/ItemRoot/lightDarkItem/Btn_Add',2},{'Img_Icon04','Ani/ItemRoot/lightDarkItem/Img_Icon',2},{'SelectItem','Ani/ItemRoot/SelectItem',2},{'Btn_Add05','Ani/ItemRoot/SelectItem/Btn_Add',2},{'Img_AddDiamonds','Ani/ItemRoot/SelectItem/Btn_Add/Img_AddDiamonds',2},{'Img_Icon05','Ani/ItemRoot/SelectItem/Img_Icon',2},{'ZuanshiItem','Ani/ItemRoot/ZuanshiItem',2},{'Btn_Add06','Ani/ItemRoot/ZuanshiItem/Btn_Add',2},{'Img_AddDiamonds01','Ani/ItemRoot/ZuanshiItem/Btn_Add/Img_AddDiamonds',2},{'Img_Icon06','Ani/ItemRoot/ZuanshiItem/Img_Icon',2},{'ZuanshiItem2','Ani/ItemRoot/ZuanshiItem2',2},{'Btn_Add07','Ani/ItemRoot/ZuanshiItem2/Btn_Add',2},{'Img_AddDiamonds02','Ani/ItemRoot/ZuanshiItem2/Btn_Add/Img_AddDiamonds',2},{'Img_Icon07','Ani/ItemRoot/ZuanshiItem2/Img_Icon',2},{'ItemRootEx','Ani/ItemRootEx',2},{'NormalItemEx1','Ani/ItemRootEx/NormalItemEx1',2},{'Btn_Add08','Ani/ItemRootEx/NormalItemEx1/Btn_Add',2},{'Img_Icon08','Ani/ItemRootEx/NormalItemEx1/Img_Icon',2},{'NormalItemEx2','Ani/ItemRootEx/NormalItemEx2',2},{'Btn_Add09','Ani/ItemRootEx/NormalItemEx2/Btn_Add',2},{'Img_Icon09','Ani/ItemRootEx/NormalItemEx2/Img_Icon',2},{'LightDarkItemEx1','Ani/ItemRootEx/LightDarkItemEx1',2},{'Btn_Add10','Ani/ItemRootEx/LightDarkItemEx1/Btn_Add',2},{'Img_Icon10','Ani/ItemRootEx/LightDarkItemEx1/Img_Icon',2},{'LightDarkItemEx2','Ani/ItemRootEx/LightDarkItemEx2',2},{'Btn_Add11','Ani/ItemRootEx/LightDarkItemEx2/Btn_Add',2},{'Img_Icon11','Ani/ItemRootEx/LightDarkItemEx2/Img_Icon',2},{'UpperBtnPanel','Ani/UpperBtnPanel',2},{'Btn_GoBackMenu','Ani/UpperBtnPanel/Btn_GoBackMenu',2},{'Img_Fenggexian','Ani/UpperBtnPanel/Img_Fenggexian',2},{'i','Ani/UpperBtnPanel/i',2},{'beijing','Ani/beijing',2},{'CardDrawVideoRT','Ani/CardDrawVideoRT',2},{'Btn_Goahead','Ani/CardDrawVideoRT/Btn_Goahead',2},{'ChouKaVFXObj','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj',2},{'di','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di',2},{'di2','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/di2',2},{'locked','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/locked',2},{'Image','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/Image',2},{'quan','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan',2},{'quan2','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/quan2',2},{'shizi','Ani/CardDrawVideoRT/Btn_Goahead/ChouKaVFXObj/UIvfx/shizi',2},{'CardDrawBadgeVideoRT','Ani/CardDrawBadgeVideoRT',2},{'RoleUpPanel','Ani/RoleUpPanel',2},{'Panel','Ani/RoleUpPanel/Panel',2},{'Img_Xian2','Ani/RoleUpPanel/Img_Xian2',2},{'Img_Xian1','Ani/RoleUpPanel/Img_Xian1',2},{'Img_bg','Ani/RoleUpPanel/Img_bg',2},{'RoleContent','Ani/RoleUpPanel/Img_bg/PlayerRoleScroll/RoleContent',2},{'Btn_UnGenghuan','Ani/RoleUpPanel/Img_bg/Btn_UnGenghuan',2},{'Btn_Genghuan(hui)','Ani/RoleUpPanel/Img_bg/Btn_UnGenghuan/Btn_Genghuan(hui)',2},{'Btn_Genghuan','Ani/RoleUpPanel/Img_bg/Btn_Genghuan',2},{'Btn_Genghuan01','Ani/RoleUpPanel/Img_bg/Btn_Genghuan/Btn_Genghuan',2},{'Img_Biaotixian','Ani/RoleUpPanel/Text_Title/Img_Biaotixian',2},{'UnClickBg','Ani/UnClickBg',2},{'Btn_SkipPanel','Ani/Btn_SkipPanel',2},{'Btn_Skip','Ani/Btn_SkipPanel/Btn_Skip',2},{'Img_Skip_Icon','Ani/Btn_SkipPanel/Btn_Skip/Img_Skip_Icon',2},
        -- Button 列表
        {'SelectItem01','Ani/ItemRoot/SelectItem',4},{'ZuanshiItem01','Ani/ItemRoot/ZuanshiItem',4},{'ZuanshiItem201','Ani/ItemRoot/ZuanshiItem2',4},
        -- UITemplate 列表
        {'PoolUpRoleItem','Ani/RoleUpPanel/Img_bg/PlayerRoleScroll/PoolUpRoleItem',10},
        -- Toggle 列表
        {'CardPoolPrefab','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/CardPoolPrefab',13},
        -- RawImage 列表
        {'SwtichBtnPanel','Ani/SwtichBtnPanel',15},{'SwitchYeqian','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian',15},{'PlayerRoleScroll','Ani/RoleUpPanel/Img_bg/PlayerRoleScroll',15},
        -- LoopScrollRect 列表
        {'SwtichBtnPanel01','Ani/SwtichBtnPanel',18},{'SwitchYeqian01','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian',18},{'PlayerRoleScroll01','Ani/RoleUpPanel/Img_bg/PlayerRoleScroll',18},
        -- TextMeshProUGUI 列表
        {'Text_Xiangqing','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Chakan/Text_Xiangqing',20},{'Text_Xiangqing01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Btn_Info/Text_Xiangqing',20},{'Text_Time','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/Text_Time',20},{'Text_Dianshu','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel/Text_Dianshu',20},{'Text_Duihuan','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BackGroundImg/DuihuanPanel/Btn_Duihuan/Text_Duihuan',20},{'TextNormalCount','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnNormalDraw/TextNormalCount',20},{'TextNormal','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnNormalDraw/TextNormal',20},{'TextTenNormalCount','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnTenNormalDraw/TextTenNormalCount',20},{'TextTenNormal','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/BtnTenNormalDraw/TextTenNormal',20},{'ProRecruitText','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProRecruitPanel/ProRecruitText',20},{'Btn_Text','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProRecruitPanel/Btn_Text',20},{'ProRecruitText01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProTenRecruitPanel/ProRecruitText',20},{'Btn_Text01','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/ProTenRecruitPanel/Btn_Text',20},{'ProRecruitText02','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/NovicePanel/ProRecruitText',20},{'Btn_Text02','Ani/CardPoolPanel/CardPoolItem/RolePoolPanel/NovicePanel/Btn_Text',20},{'Text_Time2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Text_Time2',20},{'Text_Dunbishu2','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenGearVoid/Text_Dunbishu2',20},{'Text_TenGearVoid','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenGearVoid/Text_TenGearVoid',20},{'Text_Dunbishu201','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_GearVoid/Text_Dunbishu2',20},{'Text_GearVoid','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_GearVoid/Text_GearVoid',20},{'Text_Dunbishu202','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenCoin/Text_Dunbishu2',20},{'Text_TenCoin','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_TenCoin/Text_TenCoin',20},{'Text_Dunbishu203','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Coin/Text_Dunbishu2',20},{'Text_Coin','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Coin/Text_Coin',20},{'Text_Xiangqing02','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_VoidInfo/Text_Xiangqing',20},{'Text_Qiehuan','Ani/CardPoolPanel/CardPoolItem/GearVoidPanel/Btn_Qiehuan/Text_Qiehuan',20},{'Text_Xiangqing_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Chakan_Prize/Text_Xiangqing_Prize',20},{'Text_Xiangqing_Prize01','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Btn_Info_Prize/Text_Xiangqing_Prize',20},{'Text_Time_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/BackGroundImg_Prize/Text_Time_Prize',20},{'ProRecruitText_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/PrizeDrawBtnPanel/ProRecruitText_Prize',20},{'Btn_Text_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/PrizeDrawBtnPanel/Btn_Text_Prize',20},{'Text_Jieduan_Prize','Ani/CardPoolPanel/CardPoolItem/PrizeDrawPanel/CardDrawBtnPanel_Prize/Dangqianjieduan_Prize/Text_Jieduan_Prize',20},{'Text_Xiangqing03','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Chakan4/Text_Xiangqing',20},{'Text_Xiangqing04','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_Info4/Text_Xiangqing',20},{'Text_Time4','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Text_Time4',20},{'Text_Zhekouzhong','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_SkinShop/Text_Zhekouzhong',20},{'Text_SkinShop','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/LightDarkBg/Btn_SkinShop/Text_SkinShop',20},{'Text_Shengyucishu','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Shengyucishu/Text_Shengyucishu',20},{'TextNormalCountSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnNormalDrawSP/TextNormalCountSP',20},{'TextNormalSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnNormalDrawSP/TextNormalSP',20},{'TextTenNormalCountSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnTenNormalDrawSP/TextTenNormalCountSP',20},{'TextTenNormalSP','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/BtnTenNormalDrawSP/TextTenNormalSP',20},{'ProRecruitText03','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/ProRecruitText',20},{'FreeText','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/FreeText',20},{'Btn_Text03','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDraw/Btn_Text',20},{'ProRecruitText04','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/ProRecruitText',20},{'FreeText01','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/FreeText',20},{'Btn_Text04','Ani/CardPoolPanel/CardPoolItem/LightDarkPanel/CardDrawBtnPanel/Btn_SpecialDrawFive/Btn_Text',20},{'Text_Xiangqing05','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeChakan/Text_Xiangqing',20},{'Text_Xiangqing06','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Btn_FreeInfo/Text_Xiangqing',20},{'Text_FreeTime','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Text_FreeTime',20},{'Text_FreeName','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel1/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel/Text_FreeName',20},{'Text_FreeName01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SRPanel2/Img_Zixuandi1_sr/Free_RoleLihuiImg/NamePanel/Text_FreeName',20},{'Text_FreeName02','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel1/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel/Text_FreeName',20},{'Text_FreeName03','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/SSRPanel2/Img_Zixuandi1_ssr/Free_RoleLihuiImg/NamePanel/Text_FreeName',20},{'Text_SR','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Img_SRxian/Text_SR',20},{'Text_SSR','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Img_SSRxian/Text_SSR',20},{'Text_Dianshu01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free/Text_Dianshu',20},{'Text_Duihuan01','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/FreePool_Bg/Duihuan_Free/Btn_Duihuan/Text_Duihuan',20},{'ProRecruitText05','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeRecruit/ProRecruitText',20},{'Btn_Text05','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeRecruit/Btn_Text',20},{'ProRecruitText06','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeTenRecruit/ProRecruitText',20},{'Btn_Text06','Ani/CardPoolPanel/CardPoolItem/FreePoolPanel/CardDrawBtnPanel/Btn_FreeTenRecruit/Btn_Text',20},{'Text_Name','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle/highLight/Text_Name',20},{'Text_Name01','Ani/SwtichBtnPanel/SwitchLeixing/CardPoolTitle/grey/Text_Name',20},{'Text_Biaoqian','Ani/SwtichBtnPanel/SwitchLeixing/SwitchYeqian/CardPoolPrefab/Biaoqian/Text_Biaoqian',20},{'Text_Count','Ani/ItemRoot/GongmingItem/Text_Count',20},{'Text_Count01','Ani/ItemRoot/DunBiItem/Text_Count',20},{'Text_Count02','Ani/ItemRoot/NomalItem/Text_Count',20},{'Text_Count03','Ani/ItemRoot/JingYinItem/Text_Count',20},{'Text_Count04','Ani/ItemRoot/lightDarkItem/Text_Count',20},{'Text_Count05','Ani/ItemRoot/SelectItem/Text_Count',20},{'Text_Count06','Ani/ItemRoot/ZuanshiItem/Text_Count',20},{'Text_Count07','Ani/ItemRoot/ZuanshiItem2/Text_Count',20},{'Text_Count08','Ani/ItemRootEx/NormalItemEx1/Text_Count',20},{'Text_Count09','Ani/ItemRootEx/NormalItemEx2/Text_Count',20},{'Text_Count10','Ani/ItemRootEx/LightDarkItemEx1/Text_Count',20},{'Text_Count11','Ani/ItemRootEx/LightDarkItemEx2/Text_Count',20},{'Text_Title_CN','Ani/UpperBtnPanel/Text_Title/Text_Title_CN',20},{'Text_Title_EN','Ani/UpperBtnPanel/Text_Title/Text_Title_EN',20},{'Text_Genghuan(hui)','Ani/RoleUpPanel/Img_bg/Btn_UnGenghuan/Text_Genghuan(hui)',20},{'Text_Genghuan','Ani/RoleUpPanel/Img_bg/Btn_Genghuan/Text_Genghuan',20},{'Text_Title','Ani/RoleUpPanel/Text_Title',20},{'Text_Skip','Ani/Btn_SkipPanel/Btn_Skip/Text_Skip',20},
    }
end
-- Code Auto Create End
require("LocalData/RolerecruitLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/CharactercoordinatesLocalData")
require("LocalData/EquipmentsupplyLocalData")
function M:OnInit()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    self.isBack = false  ---是否返回此节面
    ---视频延迟时间
    self.beforeTime = 0
    ---是否开始点击抽卡
    self.isBeganClick = false

    self.CurPoolIndex = 0
    self.ChangePoolId = 0
    self.CurRoleItem = nil
    self.CurIndex = 0  ---当前卡池索引

    self.RepeatCount = 0 -- 请求抽奖通知补发次数
    
    self.RoleAni = self.RolePoolPanel().gameObject:GetComponent("Animator")
    self.GearAni = self.GearVoidPanel().gameObject:GetComponent("Animator")
    
    self.VfxObj = {}        ---抽卡界面特效集
    self.CurVfx = nil        ---当前抽卡界面特效

    self.isPlayTween = false --是否在播动画
    self.CurPage = nil

    ---自选角色按钮及图片
    self.SelectRole = {
        [1] = { btn = self.SSRPanel1().gameObject, roleImg = self.Free_RoleLihuiImg02(), Name = self.Text_FreeName02(), Job = self.Free_ProTypeImg02() },
        [2] = { btn = self.SSRPanel2().gameObject, roleImg = self.Free_RoleLihuiImg03(), Name = self.Text_FreeName03(), Job = self.Free_ProTypeImg03() },
        [3] = { btn = self.SRPanel1().gameObject, roleImg = self.Free_RoleLihuiImg(), Name = self.Text_FreeName(), Job = self.Free_ProTypeImg() },
        [4] = { btn = self.SRPanel2().gameObject, roleImg = self.Free_RoleLihuiImg01(), Name = self.Text_FreeName01(), Job = self.Free_ProTypeImg01() },
    }
    
    self.beijing().gameObject:SetActive(false)
    self.Btn_UnGenghuan().gameObject:SetActive(true)
    self.Btn_Genghuan().gameObject:SetActive(false)
    self.RoleUpPanel().gameObject:SetActive(false)
    self.UnClickBg().gameObject:SetActive(false)
    self.Btn_Goahead().gameObject:SetActive(false)---隐藏点击特效
    self.Btn_SkipPanel().gameObject:SetActive(false)
    ---注册滑块
    self:RegisterLoopScroll()
    ---初始化玩家招募券
    self:InitUpperBtnPanel()
    ---初始化按钮
    self:InitButton()
    self:InitScroll()
    self:InitTypeUI()
    Event.Clear("NoviceGearTen")
    Event.Add("NoviceGearTen",function ()
        self:OnClickVoidCard(1,11,0,tonumber(string.split(EquipmentsupplyLocalData.tab[tonumber(SteamLocalData.tab[113037][2])][7],"_")[2]),tonumber(string.split(EquipmentsupplyLocalData.tab[tonumber(SteamLocalData.tab[113037][2])][7],"_")[3]),tonumber(SteamLocalData.tab[113037][2]))
        NormalCardDrawViewModel.CountType = 1
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        MgrUI.PopHide(UID.NoviceFrame_UI)
    end)
    Event.Clear("NoviceGearBack")
    Event.Add("NoviceGearBack",function()
        MgrUI.GoBack(function ()
            NoviceViewModel.DoNext()
        end)
    end)
    Event.Add("NormalDraw_FreePool",Handle(self,self.UpDataSelectRole))
    ---注册帮助按钮
    UIEvent.LuaClick(self.i().gameObject,Handle(self,function()
        HelpViewModel.Go(86)
    end))

    ---注册钻石
    UIEvent.LuaClick(self.ZuanshiItem().gameObject, Handle(self, function ()
        if self.isPlayTween then
            MgrTimer.AddDelay("DrawToStore", 1, function()
                MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" })
            end)
        else
            MgrUI.Pop(UID.ExchangePop_UI,{ tonumber(SteamLocalData.tab[113042][2]), 0, "shop" })
        end
    end))
    ---注册钻石
    UIEvent.LuaClick(self.ZuanshiItem2().gameObject, Handle(self, function ()
        if self.isPlayTween then
            MgrTimer.AddDelay("DrawToStore", 1, function()
                MgrLink.LinkStart("tz_sc_cz_01")
            end)
        else
            MgrLink.LinkStart("tz_sc_cz_01")
        end
    end))

    Event.Add("ReconnetSucc", Handle(self,self.ReconnetEvent))
    Event.Add("RefreshCoinCount",Handle(self,self.InitUpperBtnPanel))

    ---解析所有角色
    -- for i,v in pairs(HeroControl.GetAllHero()) do
    --     MgrHot.RolePackage(v.id)
    -- end
end

function M:OnBackKey()
    local isbeijing = self.beijing().gameObject.activeSelf
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        if isbeijing then
            return
        end
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        NormalCardDrawViewModel.Close()
    end
end

function M:ReconnetEvent()
    self.UnClickBg().gameObject:SetActive(false)
    -- if MgrNet.DrawRepeat then
    --     if self.RepeatCount >= 3 then
    --         MgrNet.DrawRepeat = false
    --         MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
    --             MgrSdk.BackToLogin()
    --         end},true)
    --         return
    --     end
    --     self.RepeatCount = self.RepeatCount + 1
    --     local table = {}
    --     local buffer = assert(pb.encode('PBClient.ClientRecruitRepeatREQ',table))
    --     MgrNet.SendReq(MID.CLIENT_RECRUIT_REPEAT_REQ, buffer, 0, nil, Handle(self, self.RecruitRepeatACK), nil)
    -- end
end

function M:OnShowFinish()
    ---新手招募引导
    NoviceViewModel.CheckCurID(52405,function()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            MessageEvent.Go(EID.NoviceCheck)
        end)
    end)
    ---装备补给引导
    NoviceViewModel.CheckCurID(20403,function()
        NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true,function()
            MessageEvent.Go(EID.NoviceCheck)
        end)
    end)

    ---如果外部要跳转到指定卡池
    if NoviceViewModel.CurTaskId == 20405 or NoviceViewModel.CurTaskId == 20408 or NoviceViewModel.CurTaskId == 20409 then
        --装备引导
        self:ScrollTarget(nil,nil,CardDrawControl.GetEquipDrawData()[(#CardDrawControl.GetEquipDrawData())].id)
    elseif NoviceViewModel.CurTaskId == 52406 then
        --抽卡引导
        self:ScrollTarget(nil,nil,CardDrawControl.GetNoviceDrawData()[1].id)
    else
        if NormalCardDrawViewModel.LinkType ~= nil then
            ---如果要跳转的角色卡池
            if NormalCardDrawViewModel.LinkType == NormalCardDrawViewModel.PageType.normal then
                self:ScrollTarget(1)
                ---如果要跳转的装备卡池
            elseif NormalCardDrawViewModel.LinkType == NormalCardDrawViewModel.PageType.equip then
                self:ScrollTarget(2)
            else
                --刷新上一次的卡池列表
                self:ScrollTarget(self.CurTypeIndex,self.CurCardPoolIndex)
            end
        end
    end
end

function M:OnUpdateUI()
    ---播放bgm
    MgrSound.PlayBGM(SteamLocalData.tab[113022][2],0.2)
end

---初始化玩家招募券
function M:InitUpperBtnPanel()
    local itemIdList =
    {
        [1] = 100000,
        [2] = 110031,
        [3] = 110032,
        [4] = 100001,
        [5] = 110020,
        [6] = 100008,
        [7] = 110034,
        [8] = 110030,
        [9] = 210030,
        [10] = 210031,
        [11] = 210032,
        [12] = 210033,
    }
    local itemObj =
    {
        [1] = self.ZuanshiItem().gameObject,
        [2] = self.JingYinItem().gameObject,
        [3] = self.NomalItem().gameObject,
        [4] = self.DunBiItem().gameObject,
        [5] = self.GongmingItem().gameObject,
        [6] = self.ZuanshiItem2().gameObject,
        [7] = self.lightDarkItem().gameObject,
        [8] = self.SelectItem().gameObject,
        [9] = self.NormalItemEx1().gameObject,
        [10] = self.NormalItemEx2().gameObject,
        [11] = self.LightDarkItemEx1().gameObject,
        [12] = self.LightDarkItemEx2().gameObject,
    }
    for i, v in pairs(itemIdList) do
        ---@type ItemData
        local item = ItemControl.GetItemByID(v)
        local CostCount = itemObj[i].transform:Find("Text_Count"):GetComponent("TextMeshProUGUI")
        local icon = itemObj[i].transform:Find("Img_Icon"):GetComponent("Image")
        if item.count then
            CostCount.text = JNStrTool.numberAbbr(item.count)
        else
            CostCount.text = 0
        end
        MgrRes.LoadSprite(icon,item.icon)
        ItemControl.AddItemNotify(item.id,1,"CardGoods",Handle(self, function()
            CostCount.text = JNStrTool.numberAbbr(item.count)
        end))
    end
end
---注册滑块
function M:RegisterLoopScroll()
    self.PlayerRoleScroll01():SetLuaCellEvent(Handle(self,self.UpCellItem))
end
---回调
function M:CellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurLoopList[idx],self,idx})
end
function M:UpCellItem(trans,idx)
    trans:GetComponent("UITemplate"):SetData({self.CurRoleUpList[idx],self})
end

---设置滑动数据
function M:ResetItem(id)
    local data = CardDrawControl.GetDataById(id)

    if self.VfxObj[data.cardvfx] == nil then
        --加载动态模型
        MgrRes.GetPrefab("ABOriginal/VFX/Prefab/chouka/"..data.cardvfx..".prefab",function(Obj)
            if Obj == nil then
                return
            end
            self.VfxObj[data.cardvfx] = Obj
            Obj.transform:SetParent(self.CardPoolItem().gameObject.transform,false)
            --Obj.transform.localPosition = Vector3.zero
            --Obj.transform.localScale = Vector3(20,20,20)
            Tools.SetLayer(Obj,5)
            if self.CurVfx then
                self.CurVfx.gameObject:SetActive(false)
            end
            self.CurVfx = Obj
        end)
    elseif not self.VfxObj[data.cardvfx].gameObject.activeSelf then
        self.CurVfx.gameObject:SetActive(false)
        self.CurVfx = self.VfxObj[data.cardvfx]
        self.CurVfx.gameObject:SetActive(true)
    end
    self.Btn_Tips().gameObject:SetActive(false)
    
    local CurPage = nil
    local bLeftBtnShow = false  -- 左侧按钮会遮挡详情按钮等内容
    if data.cardType == 1 then --角色招募
        ---@type RoleDrawData
        local drawData = data  --卡池数据
        --根据类型显示UI
        CurPage = self.RolePoolPanel()
        
        ---背景图
        MgrRes.LoadSprite(self.BackGroundImg(),"Poolicon/"..drawData.showRole)
        local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(drawData.singleDrawPrice,"_")[1])) --抽卡消耗的物品
        local singleCost = tonumber(string.split(drawData.singleDrawPrice,"_")[3])  --石头单抽价格
        local tenCost = tonumber(string.split(drawData.tenDrawPrice,"_")[3])        --石头十连抽价格
        ---单抽文本
        self.ProRecruitPanel().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..singleCost
        local _itemSingle = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(data.singleDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.ProRecruitPanel().transform:Find("NeedIcon"):GetComponent("Image"),_itemSingle.icon)
        ---十连文本
        self.ProTenRecruitPanel().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..tenCost
        local _itemTen = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.tenDrawPrice,"_")[2]),tonumber(string.split(drawData.tenDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.ProTenRecruitPanel().transform:Find("NeedIcon"):GetComponent("Image"),_itemTen.icon)
        ---重置动效
        if not Global.IsNil(self.RoleAni) then
            self.RoleAni:Play("Ani_NormalDraw_UI_RolePoolPanel", 0, 0)
        end
        
        if "0" ~= drawData.normalBtn then
            MgrRes.LoadSprite(self.BtnNormalDraw(), "Common/Button/" .. drawData.normalBtn);
            MgrRes.LoadSprite(self.BtnTenNormalDraw(), "Common/Button/" .. drawData.normalBtn);
        else
            MgrRes.LoadSprite(self.BtnNormalDraw(), "Common/Button/choujiang_putongqianyue");
            MgrRes.LoadSprite(self.BtnTenNormalDraw(), "Common/Button/choujiang_putongqianyue");
        end
        if "0" ~= drawData.eliteBtn then
            MgrRes.LoadSprite(self.Btn_ProRecruit(), "Common/Button/" .. drawData.eliteBtn);
            MgrRes.LoadSprite(self.Btn_ProTenRecruit(), "Common/Button/" .. drawData.eliteBtn);
        else
            MgrRes.LoadSprite(self.Btn_ProRecruit(), "Common/Button/choujiang_jingyingqianyue");
            MgrRes.LoadSprite(self.Btn_ProTenRecruit(), "Common/Button/choujiang_jingyingqianyue");
        end
        
        ---左侧抽卡按钮
        if "0" ~= drawData.normalDrawPrice and (0 == tonumber(drawData.cardbuytype) or 2 == tonumber(drawData.cardbuytype)) then
            bLeftBtnShow = true
            self.BtnNormalDraw().gameObject:SetActive(true);
            local priceInfo = ItemControl.ParsePriceString(drawData.normalDrawPrice);
            self.TextNormalCount().text = "X " .. priceInfo.price;
            MgrRes.LoadSprite(self.ImgNormalIcon(), priceInfo.item.icon);
            UIEvent.LuaClick(self.BtnNormalDraw().gameObject, Handle(self, function()
                if self:CheckCount(drawData) then
                    NormalCardDrawViewModel.CountType = 0;
                    self:OnClickDrawalCard(drawData.id, priceInfo.item.id,1,0,1, priceInfo.price, nil, nil, 2);
                end
            end))
        else 
            self.BtnNormalDraw().gameObject:SetActive(false);
        end
        if "0" ~= drawData.tenNormalDrawPrice and 2 ~= tonumber(drawData.cardbuytype) then
            bLeftBtnShow = true
            self.BtnTenNormalDraw().gameObject:SetActive(true);
            local priceInfo = ItemControl.ParsePriceString(drawData.tenNormalDrawPrice);
            self.TextTenNormalCount().text = "X " .. priceInfo.price;
            MgrRes.LoadSprite(self.ImgTenNormalIcon(), priceInfo.item.icon);
            UIEvent.LuaClick(self.BtnTenNormalDraw().gameObject, Handle(self, function()
                if self:CheckCount(drawData) then
                    NormalCardDrawViewModel.CountType = 1;
                    NormalCardDrawViewModel.RoleDataBefore = HeroControl.GetHaveHero();
                    NormalCardDrawViewModel.limitCount = drawData.limit;
                    self:OnClickDrawalCard(drawData.id, priceInfo.item.id,10,0,1, priceInfo.price, nil, nil, 2);
                end
            end))
        else
            self.BtnTenNormalDraw().gameObject:SetActive(false);
        end

        ---左侧详情按钮等内容位置调整
        self:SetDrawRelativeWidgetsPosition(bLeftBtnShow)
        
        ---刷新卡池积分道具数量
        self:ExchangeItem(self.DuihuanPanel().gameObject, drawData)
        ---刷新卡池开放时间
        local openTime = string.split(drawData.timeOpen,'-')
        local endTime =  string.split(drawData.timeEnd,'-')
        self.Text_Time().gameObject:SetActive(drawData.timeType == 1)  --是否是限时开放
        self.Text_Time2().gameObject:SetActive(false)  --隐藏装备卡池的时间文本
        self.Text_Time().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]
        
        ---右侧抽卡按钮
        ---cardbuytype 0:显示单抽和10连 1：显示10连
        if tonumber(drawData.cardbuytype) == 0 then
            self.ProRecruitPanel().gameObject:SetActive(true)
            self.ProTenRecruitPanel().gameObject:SetActive(true)
        elseif tonumber(drawData.cardbuytype) == 1 then
            self.ProRecruitPanel().gameObject:SetActive(false)
            self.ProTenRecruitPanel().gameObject:SetActive(true)
        elseif tonumber(drawData.cardbuytype) == 2 then
            self.ProRecruitPanel().gameObject:SetActive(true)
            self.ProTenRecruitPanel().gameObject:SetActive(false)
        else
            self.ProRecruitPanel().gameObject:SetActive(false)
            self.ProTenRecruitPanel().gameObject:SetActive(true)
        end

        ---点击查看按钮
        UIEvent.LuaClick(self.Btn_Chakan().gameObject,function()
            local roleIds = string.split(drawData.roleatlas,",")
            local roleIds2 = {}
            for i = 1, #roleIds do
                table.insert(roleIds2,tonumber(roleIds[i]))
            end
            IllustrationViewModel.OpenRoleXiangqing(tonumber(roleIds[1]),roleIds2,true)
        end)
        ---查看角色信息
        UIEvent.LuaClick(self.Btn_Info().gameObject,Handle(self, function()
            NormalCardDrawViewModel.ClientDropInfoREQ(drawData.cardPool,{drawData})
            --MgrUI.Pop(UID.CardPoolTip_UI,{drawData.cardPool,drawData.desc,true,drawData},true)
        end))

        ---角色单抽
        UIEvent.LuaClick(self.ProRecruitPanel().gameObject,Handle(self, function()
            if self:CheckCount(drawData) then
                NormalCardDrawViewModel.CountType = 0
                self:OnClickDrawalCard(drawData.id,costItem.id,1,0,1,singleCost)
            end
        end))
        -- local isSingle = tonumber(string.split(drawData.singleDrawPrice,'_')[3]) ~= 0 --单抽按钮是否隐藏
        -- self.ProRecruitPanel().gameObject:SetActive(isSingle)

        ---角色十连
        UIEvent.LuaClick(self.ProTenRecruitPanel().gameObject,Handle(self, function()
            --if self:CheckCount(self.StoneTenCost) then
            if self:CheckCount(drawData) then
                NormalCardDrawViewModel.RoleDataBefore = HeroControl.GetHaveHero()
                NormalCardDrawViewModel.CountType = 1
                NormalCardDrawViewModel.limitCount = drawData.limit
                self:OnClickDrawalCard(drawData.id,costItem.id,10,0,1,tenCost)
            end
        end))
        -- local isTen = tonumber(string.split(drawData.tenDrawPrice,'_')[3]) ~= 0 --十连按钮是否隐藏
        -- self.ProTenRecruitPanel().gameObject:SetActive(isTen)
        ---新手抽
        UIEvent.LuaClick(self.NovicePanel().gameObject,Handle(self, function()
            NormalCardDrawViewModel.CountType = 1
            NormalCardDrawViewModel.limitCount = self.limitCount
            self:OnClickDrawalCard(drawData.id,1,10,0,1)
        end))
    elseif data.cardType == 2 then  --装备补给
        ---@type EquipDrawData
        local drawData = data  --卡池数据
        local coinItem = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawGoldPrice,"_")[2]),tonumber(string.split(drawData.singleDrawGoldPrice,"_")[1]))   --金币物品数据
        local stoneItem = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(drawData.singleDrawPrice,"_")[1]))      --共鸣石物品数据
        local coinCost = tonumber(string.split(drawData.singleDrawGoldPrice,"_")[3])    --金币单抽价格
        local coinTenCost = tonumber(string.split(drawData.tenDrawGoldPrice,"_")[3])    --金币十连抽价格
        local coinHundredCost = tonumber(string.split(drawData.HundredDrawGoldPrice,"_")[3])    --金币百连抽价格
        local stoneCost = tonumber(string.split(drawData.singleDrawPrice,"_")[3])       --石头单抽价格
        local stoneTenCost = tonumber(string.split(drawData.tenDrawPrice,"_")[3])       --石头十连抽价格
        local stoneHundredCost = tonumber(string.split(drawData.HundredDrawPrice,"_")[3])       --石头十连抽价格
        --十连
        if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
            --消耗显示
            self.Btn_Coin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinCost
            self.Btn_TenCoin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinTenCost
            self.Btn_GearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneCost
            self.Btn_TenGearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneTenCost
            --文本描述
            self.Btn_Coin().transform:Find("Text_Coin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),1)
            self.Btn_TenCoin().transform:Find("Text_TenCoin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),11)
            self.Btn_GearVoid().transform:Find("Text_GearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),1)
            self.Btn_TenGearVoid().transform:Find("Text_TenGearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),11)
            --百连
        elseif CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.TenToHundred then
            self.Btn_Coin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinTenCost
            self.Btn_TenCoin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinHundredCost
            self.Btn_GearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneTenCost
            self.Btn_TenGearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneHundredCost
            --文本描述
            self.Btn_Coin().transform:Find("Text_Coin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),11)
            self.Btn_TenCoin().transform:Find("Text_TenCoin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),110)
            self.Btn_GearVoid().transform:Find("Text_GearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),11)
            self.Btn_TenGearVoid().transform:Find("Text_TenGearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),110)
        end
        --根据类型显示UI
        CurPage = self.GearVoidPanel()
        
        MgrRes.LoadSprite(self.Dunbiicon2(),coinItem.icon)  --金币图标
        MgrRes.LoadSprite(self.Dunbiicon1(),coinItem.icon)
        MgrRes.LoadSprite(self.Gongmingshiicon1(),stoneItem.icon)  --共鸣石图标
        MgrRes.LoadSprite(self.Gongmingshiicon2(),stoneItem.icon)
        ---重置动效
        if not Global.IsNil(self.GearAni) then
            self.GearAni:Play("Ani_NormalDraw_UI_GearVoidPanel", 0, 0)
        end
        --背景图
        MgrRes.LoadSprite(self.Img_VoidBg(),"Poolicon/"..drawData.showRole)
        ---价格为0时按钮隐藏
        self.Btn_Coin().gameObject:SetActive(coinCost ~= 0)
        self.Btn_TenCoin().gameObject:SetActive(coinTenCost ~= 0)
        ---刷新卡池开放时间
        local openTime = string.split(drawData.timeOpen,'-')
        local endTime =  string.split(drawData.timeEnd,'-')
        self.Text_Time().gameObject:SetActive(false)
        self.Text_Time2().gameObject:SetActive(drawData.timeType == 1)
        self.Text_Time2().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]
        ---点击查看武器卡池详情
        UIEvent.LuaClick(self.Btn_VoidInfo().gameObject,Handle(self, function()
            --MgrUI.Pop(UID.CardPoolTip_UI,{drawData.cardPool,drawData.desc,false,drawData},true)
            NormalCardDrawViewModel.ClientDropInfoREQ(drawData.cardPool,{drawData})
        end))
        ---金币单抽
        UIEvent.LuaClick(self.Btn_Coin().gameObject,Handle(self, function()
            if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
                --单抽
                NormalCardDrawViewModel.CountType = 0
                self:OnClickVoidCard(0,1,1,coinItem.id,coinCost,drawData.id)
            else
                --十抽
                NormalCardDrawViewModel.CountType = 1
                self:OnClickVoidCard(0,11,1,coinItem.id,coinTenCost,drawData.id)
            end
        end))
        ---金币十连抽
        UIEvent.LuaClick(self.Btn_TenCoin().gameObject,Handle(self, function()
            if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
                --十抽
                NormalCardDrawViewModel.CountType = 1
                self:OnClickVoidCard(0,11,1,coinItem.id,coinTenCost,drawData.id)
            else
                --百抽
                NormalCardDrawViewModel.CountType = 2
                self:OnClickVoidCard(0,110,1,coinItem.id,coinHundredCost,drawData.id)
            end
        end))
        ---共鸣石单抽
        UIEvent.LuaClick(self.Btn_GearVoid().gameObject,Handle(self, function()
            if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
                --单抽
                NormalCardDrawViewModel.CountType = 0
                self:OnClickVoidCard(1,1,1,stoneItem.id,stoneCost,drawData.id)
            else
                --十抽
                NormalCardDrawViewModel.CountType  = 1
                self:OnClickVoidCard(1,11,1,stoneItem.id,stoneTenCost,drawData.id)
            end
        end))
        ---共鸣石十连
        UIEvent.LuaClick(self.Btn_TenGearVoid().gameObject,Handle(self, function()
            if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
                NormalCardDrawViewModel.CountType  = 1
                self:OnClickVoidCard(1,11,1,stoneItem.id,stoneTenCost,drawData.id)
            else
                NormalCardDrawViewModel.CountType = 2
                self:OnClickVoidCard(1,110,1,stoneItem.id,stoneHundredCost,drawData.id)
            end
        end))
        ---切换按钮
        UIEvent.LuaClick(self.Btn_Qiehuan().gameObject,function()
            if CardDrawControl.CurEquipDrawType == CardDrawControl.EquipDrawType.OneToTen then
                --修改当前类型
                CardDrawControl.CurEquipDrawType = CardDrawControl.EquipDrawType.TenToHundred
                --消耗显示
                self.Btn_Coin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinTenCost
                self.Btn_TenCoin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinHundredCost
                self.Btn_GearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneTenCost
                self.Btn_TenGearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneHundredCost
                --文本描述
                self.Btn_Coin().transform:Find("Text_Coin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),11)
                self.Btn_TenCoin().transform:Find("Text_TenCoin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),110)
                self.Btn_GearVoid().transform:Find("Text_GearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),11)
                self.Btn_TenGearVoid().transform:Find("Text_TenGearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),110)
            else
                --修改当前类型
                CardDrawControl.CurEquipDrawType = CardDrawControl.EquipDrawType.OneToTen
                --消耗显示
                self.Btn_Coin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinCost
                self.Btn_TenCoin().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..coinTenCost
                self.Btn_GearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneCost
                self.Btn_TenGearVoid().transform:Find("Text_Dunbishu2"):GetComponent("TextMeshProUGUI").text = "X "..stoneTenCost
                --文本描述
                self.Btn_Coin().transform:Find("Text_Coin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),1)
                self.Btn_TenCoin().transform:Find("Text_TenCoin"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text1"),11)
                self.Btn_GearVoid().transform:Find("Text_GearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),1)
                self.Btn_TenGearVoid().transform:Find("Text_TenGearVoid"):GetComponent("TextMeshProUGUI").text = string.format(MgrLanguageData.GetLanguageByKey("ui_supplysystem_text2"),11)
            end
        end)
    elseif data.cardType == 3 then
        ---@type RoleDrawData
        local drawData = data  --卡池数据
        --解析阶段奖励
        local awards = {}
        local s = string.split(drawData.stepupuse,';')
        for i, v in ipairs(s) do
            local str = string.split(v,',')
            awards[tonumber(str[1])] = str[2]
        end

        local currentLv = math.ceil(drawData.count / 10) + 1 --当前阶段

        if currentLv > #awards then
            currentLv = #awards
        end
        self.Text_Jieduan_Prize().text = string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips8"),currentLv)
        local currentAward = awards[currentLv]
        --根据类型显示UI
        CurPage = self.PrizeDrawPanel()
        
        ---背景图
        MgrRes.LoadSprite(self.BackGroundImg_Prize(),"Poolicon/"..drawData.showRole)
        local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(currentAward,"_")[2]),tonumber(string.split(currentAward,"_")[1])) --抽卡消耗的物品
        local tenCost = tonumber(string.split(currentAward,"_")[3])        --石头十连抽价格
        ---十连文本
        self.PrizeDrawBtnPanel().transform:Find("ProRecruitText_Prize"):GetComponent("TextMeshProUGUI").text = "X "..tenCost
        local _itemTen = ItemControl.GetItemByIdAndType(tonumber(string.split(currentAward,"_")[2]),tonumber(string.split(currentAward,"_")[1]))
        MgrRes.LoadSprite(self.PrizeDrawBtnPanel().transform:Find("NeedIcon_Prize"):GetComponent("Image"),_itemTen.icon)
        ---重置动效
        if not Global.IsNil(self.RoleAni) then
            self.RoleAni:Play("Ani_NormalDraw_UI_RolePoolPanel", 0, 0)
        end

        ---刷新卡池开放时间
        local openTime = string.split(drawData.timeOpen,'-')
        local endTime =  string.split(drawData.timeEnd,'-')
        self.Text_Time().gameObject:SetActive(false)
        self.Text_Time2().gameObject:SetActive(false)
        self.Text_Time_Prize().gameObject:SetActive(true)
        self.Text_Time_Prize().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]

        ---点击查看按钮
        UIEvent.LuaClick(self.Btn_Chakan_Prize().gameObject,function()
            local roleIds = string.split(drawData.roleatlas,",")
            local roleIds2 ={}
            for i = 1, #roleIds do
                table.insert(roleIds2,tonumber(roleIds[i]))
            end
            IllustrationViewModel.OpenRoleXiangqing(tonumber(roleIds[1]),roleIds2,true)
        end)
        ---查看角色信息
        UIEvent.LuaClick(self.Btn_Info_Prize().gameObject,Handle(self, function()
            NormalCardDrawViewModel.ClientDropInfoREQ(drawData.cardPool,{drawData})
        end))

        ---角色十连
        UIEvent.LuaClick(self.PrizeDrawBtnPanel().gameObject,Handle(self, function()
            --if self:CheckCount(self.StoneTenCost) then
            if self:CheckCount(drawData) then
                NormalCardDrawViewModel.RoleDataBefore = HeroControl.GetHaveHero()
                NormalCardDrawViewModel.CountType = 1
                NormalCardDrawViewModel.limitCount = drawData.limit
                self:OnClickDrawalCard(drawData.id,costItem.id,10,0,1,tenCost)
            end
        end))

    elseif data.cardType == 4 then
        ---@type SpecialDrawData
        local drawData = data
        --根据类型显示UI
        CurPage = self.LightDarkPanel()
        --背景底图
        MgrRes.LoadSprite(self.LightDarkBg(),"Poolicon/"..drawData.showRole)
        --保底次数文本
        self.Text_Shengyucishu().text = string.format(MgrLanguageData.GetLanguageByKey("ui_qita_text163"),drawData:GetRemainCount())
        --卡池时间文本
        local openTime = string.split(drawData.timeOpen,'-')
        local endTime =  string.split(drawData.timeEnd,'-')
        self.Text_Time4().text = openTime[1].."/"..openTime[2].."/"..openTime[3].." "..openTime[4]..":"..openTime[5].."~"..endTime[1].."/"..endTime[2].."/"..endTime[3].." "..endTime[4]..":"..endTime[5]
        self.Btn_Tips().gameObject:SetActive(true)

        --点击提示
        UIEvent.LuaClick(self.Btn_Tips().gameObject,function()
            MgrUI.Pop(UID.DrawTipsPop)
        end)

        --点击前往皮肤商店
        UIEvent.LuaClick(self.Btn_SkinShop().gameObject,function()
            MgrLink.LinkStart("tz_sc_zbsd_01")
        end)
        --点击查看按钮
        UIEvent.LuaClick(self.Btn_Chakan4().gameObject,function()
            local roleIds = string.split(drawData.roleatlas,",")
            local roleIds2 ={}
            for i = 1, #roleIds do
                table.insert(roleIds2,tonumber(roleIds[i]))
            end
            IllustrationViewModel.OpenRoleXiangqing(tonumber(roleIds[1]),roleIds2,true)
        end)
        --点击详情
        UIEvent.LuaClick(self.Btn_Info4().gameObject,function()
            CardDrawControl.OpenPoolTips(drawData)
        end)

        --价格文本
        local singlePriceInfo = ItemControl.ParsePriceString(drawData.singleDrawPrice);
        local multiPriceInfo = ItemControl.ParsePriceString(drawData.fiveDrawPrice);
        CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"ProRecruitText").transform:GetComponent("TextMeshProUGUI").text = "X ".. singlePriceInfo.price;
        CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"ProRecruitText").transform:GetComponent("TextMeshProUGUI").text = "X ".. multiPriceInfo.price;
        --价格图标
        MgrRes.LoadSprite(CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"NeedIcon").transform:GetComponent("Image"), singlePriceInfo.item.icon)
        MgrRes.LoadSprite(CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"NeedIcon").transform:GetComponent("Image"), multiPriceInfo.item.icon)
        --检查是否有免费抽取
        local freeData = drawData:GetFreeState()
        local icon = CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"NeedIcon")
        local priceTxt = CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"ProRecruitText")
        local freeTxt = CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"FreeText")
        local redDot = CJNUIMgr.GetSunUseName(self.Btn_SpecialDraw().gameObject,"FreeRedDotIcon")
        local icon_2 = CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"NeedIcon")
        local priceTxt_2 = CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"ProRecruitText")
        local freeTxt_2 = CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"FreeText")
        local redDot_2 = CJNUIMgr.GetSunUseName(self.Btn_SpecialDrawFive().gameObject,"FreeRedDotIcon")

        --单抽免费
        if freeData[1] == 1 then
            icon_2:SetActive(true)
            priceTxt_2:SetActive(true)
            freeTxt_2:SetActive(false)
            redDot_2:SetActive(false)
            if freeData[2] == true then
                icon:SetActive(false)
                priceTxt:SetActive(false)
                freeTxt:SetActive(true)
                redDot:SetActive(true)
            else
                icon:SetActive(true)
                priceTxt:SetActive(true)
                freeTxt:SetActive(false)
                redDot:SetActive(false)
            end
        else
            icon:SetActive(true)
            priceTxt:SetActive(true)
            freeTxt:SetActive(false)
            redDot:SetActive(false)
            if freeData[2] == true then
                icon_2:SetActive(false)
                priceTxt_2:SetActive(false)
                freeTxt_2:SetActive(true)
                redDot_2:SetActive(true)
            else
                icon_2:SetActive(true)
                priceTxt_2:SetActive(true)
                freeTxt_2:SetActive(false)
                redDot_2:SetActive(false)
            end
        end

        if "0" ~= drawData.normalBtn then
            MgrRes.LoadSprite(self.BtnNormalDrawSP(), "Common/Button/" .. drawData.normalBtn);
            MgrRes.LoadSprite(self.BtnTenNormalDrawSP(), "Common/Button/" .. drawData.normalBtn);
        else
            MgrRes.LoadSprite(self.BtnNormalDrawSP(), "Common/Button/choujiang_putongqianyue");
            MgrRes.LoadSprite(self.BtnTenNormalDrawSP(), "Common/Button/choujiang_putongqianyue");
        end
        if "0" ~= drawData.eliteBtn then
            MgrRes.LoadSprite(self.Img_ProRecruit(), "Common/Button/" .. drawData.eliteBtn);
            MgrRes.LoadSprite(self.Img_ProTenRecruit(), "Common/Button/" .. drawData.eliteBtn);
        else
            MgrRes.LoadSprite(self.Img_ProRecruit(), "Common/Button/choujiang_jingyingqianyue");
            MgrRes.LoadSprite(self.Img_ProTenRecruit(), "Common/Button/choujiang_jingyingqianyue");
        end
        if "0" ~= drawData.normalDrawPrice then
            self.BtnNormalDrawSP().gameObject:SetActive(true);
            local priceInfo = ItemControl.ParsePriceString(drawData.normalDrawPrice);
            self.TextNormalCountSP().text = "X " .. priceInfo.price;
            MgrRes.LoadSprite(self.ImgNormalIconSP(), priceInfo.item.icon);
            UIEvent.LuaClick(self.BtnNormalDrawSP().gameObject, Handle(self, function()
                NormalCardDrawViewModel.CountType = 0;
                self:DrawLighDarkImp(drawData.id, priceInfo, 1, 2);
            end))
        else
            self.BtnNormalDrawSP().gameObject:SetActive(false);
        end
        if "0" ~= drawData.tenNormalDrawPrice then
            self.BtnTenNormalDrawSP().gameObject:SetActive(true);
            local priceInfo = ItemControl.ParsePriceString(drawData.tenNormalDrawPrice);
            self.TextTenNormalCountSP().text = "X " .. priceInfo.price;
            MgrRes.LoadSprite(self.ImgTenNormalIconSP(), priceInfo.item.icon);
            UIEvent.LuaClick(self.BtnTenNormalDrawSP().gameObject, Handle(self, function()
                NormalCardDrawViewModel.CountType = 1;
                self:DrawLighDarkImp(drawData.id, priceInfo, 5, 2);
            end))
        else
            self.BtnTenNormalDrawSP().gameObject:SetActive(false);
        end
        --点击单抽
        UIEvent.LuaClick(self.Btn_SpecialDraw().gameObject,function()
            if freeData[1] == 1 and freeData[2] == true then
                --免费抽取
                NormalCardDrawViewModel.CountType = 0
                CardDrawControl.LightDarkRecruitREQ(drawData.id,1,true,Handle(self,self.LightDarkRecruitNTF), 1)
            else
                --正常抽取
                NormalCardDrawViewModel.CountType = 0
                local priceInfo = ItemControl.ParsePriceString(drawData.singleDrawPrice);
                self:DrawLighDarkImp(drawData.id, priceInfo, 1, 1);
            end
        end)
        --点击多次抽取
        UIEvent.LuaClick(self.Btn_SpecialDrawFive().gameObject,function()
            if freeData[1] == 2 and freeData[2] == true then
                --免费抽取
                NormalCardDrawViewModel.CountType = 1
                CardDrawControl.LightDarkRecruitREQ(drawData.id,5,true,Handle(self,self.LightDarkRecruitNTF), 1)
            else
                --正常抽取
                NormalCardDrawViewModel.CountType = 1
                local priceInfo = ItemControl.ParsePriceString(drawData.fiveDrawPrice);
                self:DrawLighDarkImp(drawData.id, priceInfo, 5, 1);
            end
        end)
    elseif data.cardType == 5 then
        ---@type RoleDrawData
        local drawData = data  --卡池数据
        --根据类型显示UI
        CurPage = self.FreePoolPanel()
        local curData = CardDrawControl.GetSelectData(drawData.id)

        ---背景图
        MgrRes.LoadSprite(self.BackGroundImg(),"Poolicon/"..drawData.showRole)
        local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(drawData.singleDrawPrice,"_")[1])) --抽卡消耗的物品
        local singleCost = tonumber(string.split(drawData.singleDrawPrice,"_")[3])  --石头单抽价格
        local tenCost = tonumber(string.split(drawData.tenDrawPrice,"_")[3])        --石头十连抽价格
        --背景底图
        MgrRes.LoadSprite(self.FreePool_Bg(),"Poolicon/"..drawData.showRole)
        ---单抽文本
        self.Btn_FreeRecruit().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..singleCost
        local _itemSingle = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.singleDrawPrice,"_")[2]),tonumber(string.split(drawData.singleDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.Btn_FreeRecruit().transform:Find("NeedIcon"):GetComponent("Image"),_itemSingle.icon)
        ---十连文本
        self.Btn_FreeTenRecruit().transform:Find("ProRecruitText"):GetComponent("TextMeshProUGUI").text = "X "..tenCost
        local _itemTen = ItemControl.GetItemByIdAndType(tonumber(string.split(drawData.tenDrawPrice,"_")[2]),tonumber(string.split(drawData.tenDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.Btn_FreeTenRecruit().transform:Find("NeedIcon"):GetComponent("Image"),_itemTen.icon)
        ---判断当期卡池是否结束
        if curData.endTime < Global.GetCurTime() then
            ---获取自选卡池所有角色数据
            CardDrawControl.GetSelectPoolData(drawData.id,nil,function()
                ---更新自选卡池所选角色
                self:UpDataSelectRole(drawData.id)
                curData = CardDrawControl.GetSelectData(drawData.id)
            end)
        else
            ---更新自选卡池所选角色
            self:UpDataSelectRole(drawData.id)
        end
        ---更新自选卡池所选角色
        self:UpDataSelectRole(drawData.id)
        ---刷新卡池积分道具数量
        self:ExchangeItem(self.Duihuan_Free().gameObject, drawData)
        ---剩余时间
        local str = math.modf(curData.countdown/86400)..MgrLanguageData.GetLanguageByKey("dailysign_ui_sky")
        if curData.countdown < 86400 then
            str = math.modf(curData.countdown/3600)..MgrLanguageData.GetLanguageByKey("arkbuilddata_tips1")
            if curData.countdown < 3600 then
                str = MgrLanguageData.GetLanguageByKey("ui_qita_text176")
            end
        end
        self.Text_FreeTime().text = MgrLanguageData.GetLanguageByKey("passes_ui_pass_remainder_time")..str
        
        ---点击查看按钮
        UIEvent.LuaClick(self.Btn_FreeChakan().gameObject,function()
            local roleIds = {}
            local curData = CardDrawControl.GetSelectData(drawData.id)
            for i, v in ipairs(curData.selectedUp) do
                if v.rank == 4 then
                    table.insert(roleIds, v.roleID)
                end
            end
            IllustrationViewModel.OpenRoleXiangqing(roleIds[1],roleIds,true)
        end)
        ---查看角色信息
        UIEvent.LuaClick(self.Btn_FreeInfo().gameObject,Handle(self, function()
            CardDrawControl.OpenSelectPool(drawData.id,CardDrawControl.SelPopType.DetailPop)
        end))

        ---自选弹窗
        for i, v in ipairs(self.SelectRole) do
            UIEvent.LuaClick(v.btn,function()
                CardDrawControl.OpenSelectPool(drawData.id,CardDrawControl.SelPopType.SelectPop)
            end)
        end
        
        ---检测当期是否超时
        local function CheckTimeOut(_time)
            if _time < Global.GetCurTime() then
                MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_gachahistory_17"),2},true)
                return false
            end
            return true
        end
        ---角色单抽
        UIEvent.LuaClick(self.Btn_FreeRecruit().gameObject,Handle(self, function()
            if self:CheckCount(drawData) and CheckTimeOut(curData.endTime) then
                NormalCardDrawViewModel.CountType = 0
                self:OnClickDrawalCard(drawData.id,costItem.id,singleCost,0,1,singleCost)
            end
        end))

        ---角色十连
        UIEvent.LuaClick(self.Btn_FreeTenRecruit().gameObject,Handle(self, function()
            if self:CheckCount(drawData) and CheckTimeOut(curData.endTime) then
                NormalCardDrawViewModel.RoleDataBefore = HeroControl.GetHaveHero()
                NormalCardDrawViewModel.CountType = 1
                NormalCardDrawViewModel.limitCount = drawData.limit
                self:OnClickDrawalCard(drawData.id,costItem.id,tenCost,0,1,tenCost)
            end
        end))
    end
    
    if CurPage ~= self.CurPage then
        if self.CurPage ~= nil then
            self.CurPage.gameObject:SetActive(false)
        end
        self.CurPage = CurPage
        self.CurPage.gameObject:SetActive(true)
    end

    ---如果是新手池
    if id == 999999 then
        local item = ItemControl.GetItemByIdAndType(tonumber(string.split(data.singleDrawPrice,"_")[2]),tonumber(string.split(data.singleDrawPrice,"_")[1]))
        MgrRes.LoadSprite(self.NovicePanel().transform:Find("NeedIcon"):GetComponent("Image"),item.icon)
        self.ProRecruitPanel().gameObject:SetActive(false)
        self.ProTenRecruitPanel().gameObject:SetActive(false)
        self.NovicePanel().gameObject:SetActive(true)
        self.Btn_Info().gameObject:SetActive(false)
    else
        -- self.ProRecruitPanel().gameObject:SetActive(true)
        -- self.ProTenRecruitPanel().gameObject:SetActive(true)
        self.NovicePanel().gameObject:SetActive(false)
        self.Btn_Info().gameObject:SetActive(true)
    end
end

function M:DrawLighDarkImp(id, priceInfo, count, drawType)
    if priceInfo.item.count >= priceInfo.price then
        CardDrawControl.LightDarkRecruitREQ(id, count,false, Handle(self, self.LightDarkRecruitNTF), drawType);
    else
        NormalCardDrawViewModel.ActionOnLackTicket(priceInfo.item, count, function()
            CardDrawControl.LightDarkRecruitREQ(id, count,false, Handle(self, self.LightDarkRecruitNTF), drawType);
        end)
    end
end

---@param data RoleDrawData 判断剩余抽卡次数
function M:CheckCount(data)
    if data.limit ~= 0 then
        if data.id == 999999 then
            return true
        end
        if data.count >= data.limit then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("drawtenthresult_ui_gashapon_tips5")..0,1},true)
            return false
        end
    end
    return true
end

---设置Up角色滑动数据
function M:ResetUpRoleItem(offset,list)
    ---获取当前loop数据
    self.CurRoleUpList = list

    self.PlayerRoleScroll01().totalCount = #self.CurRoleUpList
    if offset then
        self.PlayerRoleScroll01():RefillCells(offset)          ---将LoopScroll跳转到指定index并刷新数据
    else
        self.PlayerRoleScroll01():RefreshCells()               ---只刷新数据
    end
end

--如果在播放动画起家打开商城界面就延迟打开
function M:Wait()
    self.isPlayTween = true
    MgrTimer.AddDelay("DrawToStoreWait", 1.5, function() self.isPlayTween = false end)
end

---初始化按钮
function M:InitButton()
    ---返回主界面
    UIEvent.LuaClick(self.Btn_GoBackMenu().gameObject, Handle(self, NormalCardDrawViewModel.Close))
    ---点击抽卡
    UIEvent.LuaClick(self.Btn_Goahead().gameObject,Handle(self, function()
        if self.isBeganClick  then
            local animaitor = self.ChouKaVFXObj().gameObject.transform:GetComponent("Animator")
            local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
            animaitor:SetBool("END",true)
            criUI:Pause(false)
            self.isBeganClick = false
            MgrSound.PlayEffect("draw_character_2",nil,nil,false)
        end
    end))
    ---点击跳过
    UIEvent.LuaClick(self.Btn_SkipPanel().gameObject, Handle(self, function()
        MgrTimer.Reset()
        self:StopCardDrawVideo()
        -- 角色卡池要先弹出徽章
        if NormalCardDrawViewModel.IsRoleCardDraw() then
            NormalCardDrawViewModel.PopAllBadges(function() 
                NormalCardDrawViewModel.SkipToDrawResultUI()
            end)
        else
            NormalCardDrawViewModel.SkipToDrawResultUI()
        end
    end))

    ---更换Up角色
    UIEvent.LuaClick(self.Btn_Genghuan().gameObject,Handle(self, function()
        NormalCardDrawViewModel.CurPoolRoleUpList[self.ChangePoolId] = self.CurRoleItem.id
        UnityEngine.PlayerPrefs.SetString(string.format("%s",self.ChangePoolId),self.CurRoleItem.id)
        self.RoleUpPanel().gameObject:SetActive(false)
        NormalCardDrawViewModel.Qban.gameObject:SetActive(true)
        self:ResetItem(self.CurPoolIndex)
        self.CurRoleItem = nil
        self.Btn_UnGenghuan().gameObject:SetActive(true)
        self.Btn_Genghuan().gameObject:SetActive(false)
    end))
    ---取消Up弹窗
    UIEvent.LuaClick(self.RoleUpPanel().gameObject,Handle(self, function()
        self.RoleUpPanel().gameObject:SetActive(false)
        NormalCardDrawViewModel.Qban.gameObject:SetActive(true)
        self.CurRoleItem = nil
        self.Btn_UnGenghuan().gameObject:SetActive(true)
        self.Btn_Genghuan().gameObject:SetActive(false)
    end))
end

---注册滑条
function M:InitScroll()
    self.SwtichBtnPanel01():SetLuaCellEvent(Handle(self, self.TypeEvent))
end

---滑动到指定的卡池
function M:ScrollTarget(Type,Index,NovicePoolId)
    if Type then
        self.CurTypeIndex = Type
    else
        self.CurTypeIndex = CardDrawControl.TypeIndex
        self.CurCardPoolIndex = CardDrawControl.CardPoolIndex
    end
    if Index then
        self.CurCardPoolIndex = Index
    else
        self.CurCardPoolIndex = CardDrawControl.CardPoolIndex
    end
    --如果引导卡池直接显示卡池不刷新列表
    if NovicePoolId then
        self.SwtichBtnPanel01().gameObject:SetActive(false)
        self:ResetItem(NovicePoolId)
    else
        self.SwtichBtnPanel01().gameObject:SetActive(true)
        --刷新卡池类型滑动列表
        self.SwtichBtnPanel01().totalCount = #self.TypeList
        if Type then
            self.SwtichBtnPanel01():RefillCells(Type - 1 < 0 and 1 or Type - 1)
        else
            self.SwtichBtnPanel01():RefillCells()
        end
        --隐藏卡池类型模板
        self.SwitchLeixing().gameObject:SetActive(false)
    end
end

function M:InitTypeUI()
    --当前选择的卡池类型
    self.CurTypeIndex = nil
    --当前选择的卡池
    self.CurCardPoolIndex = nil
    --卡池类型是否完成初始化
    self.TypeInitOver = false
    --获取所有卡池类型数据
    ---@type CardtypeLocalData
    self.TypeList = CardDrawControl.GetCardTypeData()
end
---@param data CardtypeLocalData
---点击卡池类型页签
function M:OnClickType(obj,scroll,data,idx,isInit)
    local high = CJNUIMgr.GetSunUseName(obj,"highLight")
    local grey = CJNUIMgr.GetSunUseName(obj,"grey")
    local redDot = CJNUIMgr.GetSunUseName(obj,"AllRedDotIcon")
    --点击显示高亮UI
    high:SetActive(true)
    grey:SetActive(false)
    scroll.gameObject:SetActive(true)

    --刷新具体卡池页签数据
    self.cardPoolList = CardDrawControl.GetCardPoolDataByTypeTab(data.cardtype)
    scroll.totalCount = #self.cardPoolList
    --类型变化时重置卡池索引
    if self.CurTypeIndex ~= idx then
        self.CurCardPoolIndex = nil
    end
    --列表长度大于0才去刷新滑块
    if #self.cardPoolList > 0 then
        if self.CurCardPoolIndex then
            scroll:ScrollToCell(self.CurCardPoolIndex,1000)
            scroll:RefreshCells()
        else
            scroll:RefillCells(0)
        end
    end

    --记住当前点击的index
    self.CurTypeIndex = idx
    if isInit == nil or isInit == false then
        self.SwtichBtnPanel01():RefreshCells()
    end
    --刷新自适应组件
    Tools.ReSize(self.SwtichBtnPanel01().gameObject)
    --红点
    CardDrawControl.PushPlayerPrefs(data.cardtype)
    redDot:SetActive(CardDrawControl.GetRedDotByTypeTab(self.TypeList[idx].cardtype))
end

function M:TypeEvent(trans,idx)
    local Btn = CJNUIMgr.GetSunUseName(trans.gameObject,"CardPoolTitle")
    local highTxt = CJNUIMgr.GetSunUseName(trans.gameObject,"highLight").transform:Find("Text_Name").transform:GetComponent("TextMeshProUGUI")
    local greyTxt = CJNUIMgr.GetSunUseName(trans.gameObject,"grey").transform:Find("Text_Name").transform:GetComponent("TextMeshProUGUI")
    local scroll = CJNUIMgr.GetSunUseName(trans.gameObject,"SwitchYeqian").transform:GetComponent("LoopScrollRect")
    local scrollPrefab = CJNUIMgr.GetSunUseName(scroll.gameObject,"CardPoolPrefab")
    local redDot = CJNUIMgr.GetSunUseName(trans.gameObject,"AllRedDotIcon")

    --卡池类型文本
    highTxt.text = self.TypeList[idx].name
    greyTxt.text = self.TypeList[idx].name
    --默认展示UI
    highTxt.transform.parent.gameObject:SetActive(false)
    greyTxt.transform.parent.gameObject:SetActive(true)
    scroll.gameObject:SetActive(false)
    scrollPrefab:SetActive(false)
    --红点
    redDot:SetActive(CardDrawControl.GetRedDotByTypeTab(self.TypeList[idx].cardtype))
    --注册滑块
    scroll:SetLuaCellEvent(Handle(self, self.ToggleEvent))
    --点击卡池类型
    UIEvent.LuaClick(Btn.gameObject,function()
        self:OnClickType(trans.gameObject,scroll,self.TypeList[idx],idx)
    end)

    --初始化
    if self.TypeInitOver == false then
        --跳转相关
        if self.CurTypeIndex == nil then
            --默认显示第一个
            if idx == 1 then
                self:OnClickType(trans.gameObject,scroll,self.TypeList[idx],idx,true)
                self.TypeInitOver = true
            end
        else
            if self.CurTypeIndex > #self.TypeList then
                self.CurTypeIndex = 1
            end
            --跳转到对应类型
            if idx == self.CurTypeIndex then
                self:OnClickType(trans.gameObject,scroll,self.TypeList[idx],idx,true)
                self.TypeInitOver = true
            end
        end
    else
        if self.CurTypeIndex then
            if self.CurTypeIndex > #self.TypeList then
                self.CurTypeIndex = 1
            end
            if idx == self.CurTypeIndex then
                highTxt.transform.parent.gameObject:SetActive(true)
                greyTxt.transform.parent.gameObject:SetActive(false)
                scroll.gameObject:SetActive(true)
            else
                highTxt.transform.parent.gameObject:SetActive(false)
                greyTxt.transform.parent.gameObject:SetActive(true)
                scroll.gameObject:SetActive(false)
            end
        end
    end

end



---页签切换按钮监听
function M:ToggleEvent(trans,idx)
    local toggle = trans.transform:GetComponent("Toggle")
    toggle.group = trans.parent.gameObject:GetComponent("ToggleGroup")
    local biaoqian = trans.transform:Find("Biaoqian").transform:GetComponent("Image")
    local Icon = trans.transform:Find("Yeqiantu").transform:GetComponent("Image")
    local itemMask = trans.transform:Find("itemMask").transform:GetComponent("Image")
    local Text_Biaoqian = trans.transform:Find("Biaoqian/Text_Biaoqian").transform:GetComponent("TextMeshProUGUI")
    local data = self.cardPoolList[idx]
    MgrRes.LoadSprite(Icon,"Poolicon/"..data.Icon)
    ---如果卡池标签不为空
    if data.tag ~= "0" then
        MgrRes.LoadSprite(itemMask,"Lottery/Img_Yeqianzhezhao")
        MgrRes.LoadSprite(biaoqian,data.tag[1])
        Text_Biaoqian.text = MgrLanguageData.GetLanguageByKey(data.tag[2])
        Text_Biaoqian.gameObject.transform.parent.gameObject:SetActive(true)
    else
        MgrRes.LoadSprite(itemMask,"Lottery/Img_Yeqianzhezhao2")
        Text_Biaoqian.gameObject.transform.parent.gameObject:SetActive(false)
    end
    ---渐显效果
    if data.cardType == 2 then
        self.Img_VoidBg().color = Color(1,1,1,0)
        Tools.DoPFade(self.Img_VoidBg(),1,0.5,0,1,false,0,0,nil)
    else
        self.BackGroundImg().color = Color(1,1,1,0)
        Tools.DoPFade(self.BackGroundImg(),1,0.5,0,1,false,0,0,nil)
    end

    Tools.ToggleValueChange(toggle,function(isOn)
        ---如果装备未解锁
        if data.cardType == 2 and SysLockControl.CheckSysLock(1302) == false and isOn == true then
            MgrUI.Pop(UID.PopTip_UI,{SysLockControl.GetSystemLockTips(1302),1})
            return
        end
        if isOn then
            self.CurCardPoolIndex = idx
            self:ResetItem(data.id)
            ---根据卡池类型变化上方货币显示
            self:CheckAsset(idx)
        end
        itemMask.gameObject:SetActive(not isOn)

    end,toggle)
    if self.CurCardPoolIndex == nil then
        ---默认选中第一个
        if idx == 1 then
            toggle.isOn = false
            toggle.isOn = true
        else
            toggle.isOn = false
        end
    else
        if self.CurCardPoolIndex > #self.cardPoolList then
            self.CurCardPoolIndex = idx
        end
        if idx == self.CurCardPoolIndex then
            toggle.isOn = false
            toggle.isOn = true
        else
            toggle.isOn = false
        end
    end
end

---根据卡池类型变化上方货币显示
function M:CheckAsset(idx)
    self.NomalItem().gameObject:SetActive(false)
    self.NormalItemEx1().gameObject:SetActive(false);
    self.NormalItemEx2().gameObject:SetActive(false);
    self.LightDarkItemEx1().gameObject:SetActive(false);
    self.LightDarkItemEx2().gameObject:SetActive(false);
    if self.cardPoolList[idx].cardType == 1 then
        self.GongmingItem().gameObject:SetActive(false)
        self.DunBiItem().gameObject:SetActive(false)
        self.JingYinItem().gameObject:SetActive(true)
        self.lightDarkItem().gameObject:SetActive(false)
        self.SelectItem().gameObject:SetActive(true)
        self.NormalItemEx1().gameObject:SetActive(true);
        self.NormalItemEx2().gameObject:SetActive(true);
    elseif self.cardPoolList[idx].cardType == 2 then
        self.GongmingItem().gameObject:SetActive(true)
        self.DunBiItem().gameObject:SetActive(true)
        self.JingYinItem().gameObject:SetActive(false)
        self.lightDarkItem().gameObject:SetActive(false)
        self.SelectItem().gameObject:SetActive(false)
    elseif self.cardPoolList[idx].cardType == 3 then
        self.GongmingItem().gameObject:SetActive(false)
        self.DunBiItem().gameObject:SetActive(false)
        self.JingYinItem().gameObject:SetActive(true)
        self.lightDarkItem().gameObject:SetActive(false)
        self.SelectItem().gameObject:SetActive(false)
    elseif self.cardPoolList[idx].cardType == 4 then
        self.GongmingItem().gameObject:SetActive(false)
        self.DunBiItem().gameObject:SetActive(false)
        self.JingYinItem().gameObject:SetActive(false)
        self.lightDarkItem().gameObject:SetActive(true)
        self.SelectItem().gameObject:SetActive(false)
        self.LightDarkItemEx1().gameObject:SetActive(true);
        self.LightDarkItemEx2().gameObject:SetActive(true);
    elseif self.cardPoolList[idx].cardType == 5 then
        self.GongmingItem().gameObject:SetActive(false)
        self.DunBiItem().gameObject:SetActive(false)
        self.JingYinItem().gameObject:SetActive(true)
        self.lightDarkItem().gameObject:SetActive(false)
        self.SelectItem().gameObject:SetActive(true)
    end
end
---打开更换Up角色弹窗点击
function M:ChangeUpClick(PoolId,idx)
    self.CurPoolIndex = idx
    local heroList = {}
    for i, v in pairs(NormalCardDrawViewModel.RoleUpList[PoolId]) do
        table.insert(heroList,RoleData.New(v))
    end
    self.ChangePoolId = PoolId
    MgrSound.PlayEffect("yx_ui_tankuang_01",1,nil,false)
    self.RoleUpPanel().gameObject:SetActive(true)
    NormalCardDrawViewModel.Qban.gameObject:SetActive(false)
    self:ResetUpRoleItem(0,heroList)
end
---选择up点击事件
---@param hero RoleData
function M:RoleItemOnClick(hero)
    if self.CurRoleItem then
        self.CurRoleItem.isSelect = false
        self.CurRoleItem.isSelect = nil
    end
    hero.isSelect = true
    self.CurRoleItem = hero
    if self.CurRoleItem then
        self.Btn_UnGenghuan().gameObject:SetActive(false)
        self.Btn_Genghuan().gameObject:SetActive(true)
    else
        self.Btn_UnGenghuan().gameObject:SetActive(true)
        self.Btn_Genghuan().gameObject:SetActive(false)
    end
    self.PlayerRoleScroll01():RefreshCells()           ---只刷新数据
end

---角色抽卡                  卡池ID  新锐/精英 数量  UP角色 卡池idx
function M:OnClickDrawalCard(recruitID,id,count,upRole,idx,costCount,confirmCallback,cancelCallback, drawType)
    if nil == drawType then
        drawType = 1;
    end
    NormalCardDrawViewModel.SetDrawType(drawType);
    ---@type ItemData
    local item = ItemControl.GetItemByID(id)
    if item == nil then
        print("抽取错误，抽取消耗道具是空")
        return
    end
    NormalCardDrawViewModel.CurCostType = 1
    self.recruitID = recruitID
    if self.recruitID == 999999 then
        if NoviceViewModel.CurTaskId == 52406 then
            NoviceControl.PushSingleData(NoviceViewModel.CurTaskId,true)
        end
        self:RecruitNoviceClick()       ---新手池
    else
        local curPoolData = CardDrawControl.GetDataById(recruitID)
        ---不在卡池开启时间内
        if curPoolData == nil or curPoolData:WhetherIsOpen() == false then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text134"),1},true)
            return
        end
        if item.count and item.count>=costCount then            ---如果招募券足够
            MgrUI.Pop(UID.ConfirmPop_UI,{string.format(MgrLanguageData.GetLanguageByKey("cardbuypop_tips7"),item.name,costCount),function()
                if curPoolData.cardType == 5 then
                    self:FreeRecruitClick(recruitID,count)
                else
                    self:RecruitClick(recruitID,drawType,count,upRole)
                end
                if confirmCallback ~= nil then
                    confirmCallback()
                end
            end,nil,2 },true)
            --self:RecruitClick(recruitID,1,count,upRole)
            -- if confirmCallback ~= nil then
            --     confirmCallback()
            -- end
        else
            NormalCardDrawViewModel.ActionOnLackTicket(item, costCount, 
                function()
                    if confirmCallback ~= nil then
                        confirmCallback()
                    end
                    if curPoolData.cardType == 5 then
                        self:FreeRecruitClick(recruitID,count)
                    else
                        self:RecruitClick(recruitID,drawType,count,upRole)
                    end
                end, cancelCallback)
        end
    end
end
---抽卡返回ACK
function M:ReceiveRecruitACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientRecruitACK',buffer))
    if tag ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("servererror_tips9") .. "ERROR NUMBER : ".. tab.errNo,1},true)
        return
    end
    if tab.errNo ~= 0 then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetErrorByKey(tab.errNo),1},true)
    end
end
---抽卡返回NTF
function M:ReceiveRecruitNTF(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local tab = assert(pb.decode('PBClient.ClientRecruitNTF',buffer))
    if tag ~= 0 then
        return
    end
    --异常检测
    local success, err = pcall(function()
        self:ReceiveShow(tab, 1)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
---抽卡展示 --type: 1:普通 2:自选
function M:ReceiveShow(tab, type)
    self.UnClickBg().gameObject:SetActive(true)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    self.beforeTime = 3.2
    local heroarr = {}
    local goodarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    print("role???????",v.hero.heroID)
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    if RoleCardViewModel.CacheRoleDataArr == nil then
        RoleCardViewModel.ReloadCacheRoleData()
    end
    local bb = NormalCardDrawViewModel.RoleDataBefore
    local hh = HeroControl.GetHaveHero()

    print("isSSR",isSSR)
    print("isSR",isSR)
    self:SetDrawVideoSubWidgetsActive(true)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    if(tab.goods) then
        ---更新物品奖励
        ItemControl.PushGroupItemData(tab.goods,ItemControl.PushEnum.add)
    end

    NormalCardDrawViewModel.UpdataLotteryInfo(self.recruitID,tab.count,tab.up)
    CardDrawControl.PushSinglePoolData(tab.recruitId,tab.count)
    --重载卡池数据
    CardDrawControl.ReloadCacheList()
    CardDrawControl.SetRecruitIndex(self.recruitID, tab.recruitIndex);
    NormalCardDrawViewModel.CurRecruit = self.recruitID
    criUI:Play()
    MgrSound.PlayEffect("draw_character_1",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "Playing: 5" then
            MgrTimer.AddDelayNoName(self.beforeTime,Handle(self, function()
                criUI:Pause(true)
                self.isBeganClick = true
                self.UnClickBg().gameObject:SetActive(false)
                self.Btn_Goahead().gameObject:SetActive(true)
            end),nil)
        end
        if tostring(state) == "PlayEnd: 6" then
            --判断卡池第一个是否为SSR
            local firstIsSSR = RoleattributeLocalData.tab[heroarr[1][1]][6] >= 4
            local isNew =  NormalCardDrawViewModel.GetIsNewSSR(heroarr[1][1])
            local isGoods = heroarr[1][2] --是否为商品
            CardDrawControl.HeroCount = #heroarr
            if #heroarr == 1 then --单抽
                if firstIsSSR then--单抽出金
                    local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                    self:SetDrawVideoSubWidgetsActive(false)
                    MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
                    MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                    MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                        NormalCardDrawViewModel.OpenCardDrawResultUI()
                        criUI.player.statusChangeCallback = nil
                    end),nil)
                else--单抽没出金
                    NormalCardDrawViewModel.OpenCardDrawResultUI()
                    criUI.player.statusChangeCallback = nil
                    --self.beijing().gameObject:SetActive(false)
                end
            else--十连
                --if firstIsSSR and not isNew and isGoods == 0 then --改为所有情况都播放徽章动画
                if firstIsSSR then
                    local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                    self:SetDrawVideoSubWidgetsActive(false)
                    MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/".. badgeName})
                    MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                    MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                        NormalCardDrawViewModel.OpenCardDrawResultUI()
                        criUI.player.statusChangeCallback = nil
                    end),nil)
                else
                    self:SetDrawVideoSubWidgetsActive(false)
                    NormalCardDrawViewModel.OpenCardDrawResultUI()
                    criUI.player.statusChangeCallback = nil
                end
            end
        end
    end

    ---销毁抽卡面板小人
    GameObject.Destroy(NormalCardDrawViewModel.Qban)
    NormalCardDrawViewModel.Qban = nil
end

function M:LightDarkRecruitNTF(buffer,tag)
    local tab = assert(pb.decode('PBClient.ClientLightDarkRecruitNTF',buffer))
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0

    if tag ~= 0 then
        return
    end
    --异常检测
    local success, err = pcall(function()
        self:LightDarkDrwa(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:LightDarkDrwa(tab)
    self.UnClickBg().gameObject:SetActive(true)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    self.beforeTime = 3.2
    local heroarr = {}
    local equiparr = {}
    local itemarr = {}
    local goodarr = {}
    local isSSR = false
    local isSR = false
    local topPrize = false

    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
        if v.equip then
            local arr = {}
            table.insert(arr,v.equip.equipID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                EquipControl.PushSingleEquipData(v.equip)
                table.insert(arr,0)
            end
            table.insert(equiparr,arr)
        end
        if v.goods and v.hero == nil and v.equip == nil then
            local str = string.split(SteamLocalData.tab[126103][2],"_")
            --检查是否抽到大奖
            if v.goods[1].goodsID == tonumber(str[1]) and v.goods[1].goodsNum == tonumber(str[2]) then
                topPrize = true
            end
            table.insert(itemarr,v.goods[1])
        end
    end
    if RoleCardViewModel.CacheRoleDataArr == nil then
        RoleCardViewModel.ReloadCacheRoleData()
    end

    self:SetDrawVideoSubWidgetsActive(true)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = {}
    NormalCardDrawViewModel.HeroList = heroarr
    NormalCardDrawViewModel.EquipList = {}
    NormalCardDrawViewModel.EquipList = equiparr
    CardDrawControl.SetRecruitIndex(tab.recruitId, tab.recruitIndex);
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗
    CardDrawControl.LightDarkItemDrawResult = {}
    if(#itemarr ~= 0) then
        CardDrawControl.LightDarkItemDrawResult = itemarr
        ---更新物品奖励
        ItemControl.PushGroupItemData(itemarr,ItemControl.PushEnum.add)
    end
    --推送卡池抽取次数
    CardDrawControl.PushSinglePoolData(tab.recruitId,nil,tab.LightDarkFreeTime)
    --重载卡池数据
    CardDrawControl.ReloadCacheList()
    --当前卡池id
    NormalCardDrawViewModel.CurRecruit = tab.recruitId
    criUI:Play()
    MgrSound.PlayEffect("draw_character_1",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "Playing: 5" then
            MgrTimer.AddDelayNoName(self.beforeTime,Handle(self, function()
                criUI:Pause(true)
                self.isBeganClick = true
                self.UnClickBg().gameObject:SetActive(false)
                self.Btn_Goahead().gameObject:SetActive(true)
            end),nil)
        end
        if tostring(state) == "PlayEnd: 6" then
            --抽到了特等奖
            if topPrize then
                MgrUI.GoClose(UID.DrawItemResult_UI)
            else
                --如果抽到了角色
                if #heroarr ~= 0 then
                    --判断卡池第一个是否为SSR
                    local firstIsSSR = RoleattributeLocalData.tab[heroarr[1][1]][6] >= 4
                    --当前结果角色数量
                    CardDrawControl.HeroCount = #heroarr
                    if #heroarr == 1 then --单抽
                        if firstIsSSR then--单抽出金
                            local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                            self:SetDrawVideoSubWidgetsActive(false)
                            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/"..badgeName})
                            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                            MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                                NormalCardDrawViewModel.OpenCardDrawResultUI()
                                criUI.player.statusChangeCallback = nil
                            end),nil)
                        else--单抽没出金
                            NormalCardDrawViewModel.OpenCardDrawResultUI()
                            criUI.player.statusChangeCallback = nil
                        end
                    else--十连
                        if firstIsSSR then
                            local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                            self:SetDrawVideoSubWidgetsActive(false)
                            MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/".. badgeName})
                            MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                            MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                                NormalCardDrawViewModel.OpenCardDrawResultUI()
                                criUI.player.statusChangeCallback = nil
                            end),nil)
                        else
                            self:SetDrawVideoSubWidgetsActive(false)
                            NormalCardDrawViewModel.OpenCardDrawResultUI()
                            criUI.player.statusChangeCallback = nil
                        end
                    end
                else
                    --只有物品
                    NormalCardDrawViewModel.OpenLightDarkResultUI()
                end
            end
        end
    end

    ---销毁抽卡面板小人
    GameObject.Destroy(NormalCardDrawViewModel.Qban)
    NormalCardDrawViewModel.Qban = nil
end

---抽卡请求
function M:RecruitClick(recruitID,type,count,target)
    local RecruitREQ  =
    {
        recruitID =recruitID,
        type = type,
        count = count,
        target = target,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientRecruitREQ',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_RECRUIT_REQ,bytes,0,nil,Handle(self,self.ReceiveRecruitACK),Handle(self,self.ReceiveRecruitNTF))
end

function M:RecruitRepeatACK(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local info = assert(pb.decode('PBClient.ClientRecruitRepeatACK',buffer))
    if tag ~= 0 then
        return
    end
    if info.errNo ~= 0 then
        return
    end
    local tab = info.ntf
    --异常检测
    local success, err = pcall(function()
        self:ReconnetRecruit(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:ReconnetRecruit(tab)
    self.UnClickBg().gameObject:SetActive(true)
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    self.beforeTime = 3.2
    local heroarr = {}
    local goodarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                HeroControl.PushSingleHeroData(v.hero)
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    print("role???????",v.hero.heroID)
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    print("isSSR",isSSR)
    print("isSR",isSR)
    self:SetDrawVideoSubWidgetsActive(true)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)    ---物品消耗
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)    ---物品消耗

    NormalCardDrawViewModel.UpdataLotteryInfo(self.recruitID,tab.count,tab.up)
    NormalCardDrawViewModel.CurRecruit = self.recruitID
    criUI:Play()
    MgrSound.PlayEffect("draw_character_1",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "Playing: 5" then
            MgrTimer.AddDelayNoName(self.beforeTime,Handle(self, function()
                criUI:Pause(true)
                self.isBeganClick = true
                self.UnClickBg().gameObject:SetActive(false)
                self.Btn_Goahead().gameObject:SetActive(true)
            end),nil)
        end
        if tostring(state) == "PlayEnd: 6" then
            self:SetDrawVideoSubWidgetsActive(false)
            NormalCardDrawViewModel.OpenCardDrawResultUI()
            criUI.player.statusChangeCallback = nil
        end
    end
    ---销毁抽卡面板小人
    GameObject.Destroy(NormalCardDrawViewModel.Qban)
    NormalCardDrawViewModel.Qban = nil
end

---装备抽卡点击事件
function M:OnClickVoidCard(type,count,idx,id,price,recruitID)
    ---@type ItemData
    local item = nil
    local str = ""
    local cost = 0
    if type==0 then
        item = ItemControl.GetItemByID(id)
        NormalCardDrawViewModel.CurCostType = 2
        str = item.name
        cost = price
    elseif type==1 then
        item = ItemControl.GetItemByID(id)
        NormalCardDrawViewModel.CurCostType = 3
        str = item.name
        cost = price
    end
    self.recruitID = recruitID
    if CardDrawControl.GetDataById(recruitID):WhetherIsOpen() == false then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text134"),1},true)
        return
    end
    if item.count and item.count>=cost then
        self:EquipSupplyClick(recruitID,type,count)
    else
        if type==1 then
            MgrUI.Pop(UID.CardBuyPop,{MgrLanguageData.GetLanguageByKey("geardrawresult_ui_stone_exchange"),item,cost,false,Handle(self,Handle(self, function()
                self:EquipSupplyClick(recruitID,type,count)
            end))},true)
        else
            MgrUI.Pop(UID.PopTip_UI,{str..MgrLanguageData.GetLanguageByKey("geardrawresult_ui_stone_notenough"),1},true)
        end
        return
    end

end
---抽卡返回ACK
function M:ReceiveEquipSupplyACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipSupplyACK',buffer))
    if tag ~= 0 then
        return
    end
    if tab.errNo~=0 then

        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("geardrawresult_ui_tips1"),2},true)
    end
    print(tab.errNo)
end
---抽卡返回NTF
function M:ReceiveEquipSupplyNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientEquipSupplyNTF',buffer))
    if tag ~= 0 then
        return
    end

    --异常检测
    local success, err = pcall(function()
        self:EquipSupply(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:EquipSupply(tab)
    self.UnClickBg().gameObject:SetActive(true)
    NormalCardDrawViewModel.CurRecruit = self.recruitID
    ---统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
    --print(tab)
    ---共鸣id list
    local equiparr = {}
    ---重复共鸣替换的物品
    local goodarr = {}
    ---是否有ssr
    local isSSR = false
    ---是否有sr
    local isSR = false
    for i, v in pairs(tab.equips) do
        if v.equip then
            local arr = {}
            table.insert(arr,v.equip.equipID)
            if v.goods then
                table.insert(goodarr,v.goods[1])
                table.insert(arr,1)
            else
                EquipControl.PushSingleEquipData(v.equip)
                table.insert(arr,0)
            end
            table.insert(equiparr,arr)
            if not isSSR then
                if RoleequipmentLocalData.tab[v.equip.equipID][6] == 4 then
                    isSSR = true
                end
            end
            if not isSR then
                if RoleequipmentLocalData.tab[v.equip.equipID][6] ==3 then
                    isSR = true
                end
            end
        end
    end
    self:SetDrawVideoSubWidgetsActive(true)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/CoreAward/VoidGearDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.EquipList = equiparr
    CardDrawControl.SetRecruitIndex(self.recruitID, tab.recruitIndex);
    ItemControl.PushGroupItemData(goodarr,ItemControl.PushEnum.add)
    ItemControl.PushGroupItemData(tab.cost,ItemControl.PushEnum.consume)
    criUI:Play()
    MgrSound.PlayEffect("draw_equipment",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "PlayEnd: 6" then
            NormalCardDrawViewModel.OpenVoidGearDrawResultUI()
            --self.UnClickBg().gameObject:SetActive(false)
            --self.beijing().gameObject:SetActive(true)
            criUI.player.statusChangeCallback = nil
        end
    end
end
---抽卡请求
function M:EquipSupplyClick(recruitID,type,count)
    local EquipSupplyREQ  =
    {
        recruitID =recruitID,
        type = type,
        count = count,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientEquipSupplyREQ',EquipSupplyREQ))
    ItemControl.AckError = true
    ItemControl.EquipAckError = true
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_EQUIP_SUPPLY_REQ,bytes,0,nil,Handle(self,self.ReceiveEquipSupplyACK),Handle(self,self.ReceiveEquipSupplyNTF))
    print("抽取了十连".."  "..count)
end

---抽卡返回ACK
function M:ReceiveNoviceACK(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitACK',buffer))
    if tag ~= 0 then
        return
    end
    print(tab.errNo)
    ---如果抽卡已抽过了
    if tab.errNo == 508 then

    else
        if tab.errNo ~= 0 then
            MgrSdk.BackToLogin()
        end
    end
end
---抽卡返回NTF
function M:ReceiveNoviceNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientNewRecruitNTF',buffer))
    if tag ~= 0 then
        return
    end

    --异常检测
    local success, err = pcall(function()
        self:NewRecruit(tab)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
function M:NewRecruit(tab)
    MessageEvent.Go(EID.NoviceCheck)
    NormalCardDrawViewModel.CurRecruit = 999999
    local ssrCount = 0
    self.beforeTime = 3.2
    local heroarr = {}
    local isSSR = false
    local isSR = false
    for i, v in pairs(tab.heros) do
        if v.hero then
            local arr = {}
            table.insert(arr,v.hero.heroID)
            if v.goods then
                table.insert(arr,1)
            else
                table.insert(arr,0)
            end
            table.insert(heroarr,arr)
            if not isSSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 4 then
                    print("role???????",v.hero.heroID)
                    isSSR = true
                end
            end
            if not isSR then
                if RoleattributeLocalData.tab[v.hero.heroID][6] >= 3 then
                    isSR = true
                end
            end
        end
    end
    self:SetDrawVideoSubWidgetsActive(true, true)
    local criUI = self.CardDrawVideoRT().gameObject.transform:GetComponent("CriManaMovieControllerForUI")
    if isSSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SSR.usm"))
    elseif isSR then
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_SR.usm"))
    else
        criUI.player:SetFile(nil,MgrRes.GetABPath("USM/Common/RoleAward/CardDrawClip_R.usm"))
    end
    NormalCardDrawViewModel.HeroList = heroarr
    CardDrawControl.HeroCount = #heroarr
    self.UnClickBg().gameObject:SetActive(true)
    criUI:Play()
    MgrSound.PlayEffect("draw_character_1",nil,nil,false)
    criUI.player.statusChangeCallback = function(state)
        if tostring(state) == "Playing: 5" then
            MgrTimer.AddDelayNoName(self.beforeTime,Handle(self, function()
                criUI:Pause(true)
                self.isBeganClick = true
                self.UnClickBg().gameObject:SetActive(false)
                self.Btn_Goahead().gameObject:SetActive(true)
            end),nil)
        end
        if tostring(state) == "PlayEnd: 6" then
            local firstIsSSR = RoleattributeLocalData.tab[heroarr[1][1]][6] >= 4
            local isNew =  NormalCardDrawViewModel.GetIsNewSSR(heroarr[1][1])
            local isGoods = heroarr[1][2] --是否为商品

            if firstIsSSR then
                local badgeName = RoleattributeLocalData.tab[heroarr[1][1]][86]
                --self.beijing().gameObject:SetActive(false)
                MgrUI.Pop(UID.UsmBadgePlay,{"Common/SSRDraw/".. badgeName})
                MgrSound.PlayEffect("yx_ui_huizhang_01",nil,nil,false) --展示勋章动画时播放音乐
                MgrTimer.AddDelayNoName(1.6,Handle(self, function()
                    self:SetDrawVideoSubWidgetsActive(true)
                    NormalCardDrawViewModel.OpenCardDrawResultUI()
                    criUI.player.statusChangeCallback = nil
                end),nil)
            else
                self:SetDrawVideoSubWidgetsActive(true)
                NormalCardDrawViewModel.OpenCardDrawResultUI()
                criUI.player.statusChangeCallback = nil
            end
        end
    end
    ---关闭引导界面防止抽卡中无法点击按钮
    MgrUI.PopHide(UID.NoviceFrame_UI)
end
---抽卡请求
function M:RecruitNoviceClick()
    local RecruitREQ  =
    {
        recruitID = 999999,
        type = 1,
        count = 10,
        target = 0
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientNewRecruitREQ',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_NEW_RECRUIT_REQ,bytes,0,Handle(self,self.NoviceREQ),Handle(self,self.ReceiveNoviceACK),Handle(self,self.ReceiveNoviceNTF))
end

---自选抽卡请求
function M:FreeRecruitClick(recruitID,count)
    local RecruitREQ  =
    {
        lotteryID =recruitID,
        count = count,
        clientRecruitIndex = CardDrawControl.GetRecruitIndex(recruitID),
    }
    ---序列化
    local bytes = assert(pb.encode('PBClient.ClientSelectUpGachaReq',RecruitREQ))
    ItemControl.AckError = true
    HeroControl.AckError = true 
    TaskControl.AckError = true
    ---发送数据
    MgrNet.SendReq(MID.CLIENT_SELECT_UP_GACHA_REQ,bytes,0,nil,function()  end,Handle(self,self.FreeRecruitNTF))
end
function M:FreeRecruitNTF(buffer, tag)
    MgrNet.DrawRepeat = false
    self.RepeatCount = 0
    local tab = assert(pb.decode('PBClient.ClientSelectUpGachaNtf',buffer))
    if tag ~= 0 then
        return
    end
    --异常检测
    local success, err = pcall(function()
        self:ReceiveShow(tab, 2)
    end)
    if not success then
        --弹框提示，弹回主界面
        MgrUI.Pop(UID.ClosePop_UI,{MgrLanguageData.GetLanguageByKey("mgrnet_tips6"), function ()
            ---重启游戏
            MgrSdk.BackToLogin()
        end},true)
    end
end
---更新自选卡池所选角色
function M:UpDataSelectRole(_poolID)
    local data = CardDrawControl.GetSelectData(_poolID)
    for i, v in ipairs(self.SelectRole) do
        if data.selectedUp[i] then
            MgrRes.LoadLongIcon(v.roleImg, data.selectedUp[i].roleID)
            MgrRes.LoadSprite(v.Job, data.selectedUp[i].roleData.iconCareer)
            v.Name.text = data.selectedUp[i].roleData.name
            
            v.roleImg.gameObject:SetActive(true)
        else
            v.roleImg.gameObject:SetActive(false)
        end
    end
    
    self.Btn_FreeChakan().gameObject:SetActive(#data.selectedUp > 0)
    self.Btn_FreeRecruit().gameObject:SetActive(#data.selectedUp > 0)
    self.Btn_FreeTenRecruit().gameObject:SetActive(#data.selectedUp > 0)
end

function M:NoviceREQ(err,msgId)
    if not err then
        MgrSdk.BackToLogin()
    end
end

---兑换
function M:ExchangeItem(_obj,_data)
    if _data.item ~= "0" then
        local ticketImg = CJNUIMgr.GetSunUseName(_obj,"Xiangqingicon"):GetComponent("Image")
        local ticketNum = CJNUIMgr.GetSunUseName(_obj,"Text_Dianshu"):GetComponent("TextMeshProUGUI")
        local ExchangeProp = ItemControl.GetItemByIdAndType(tonumber(string.split(_data.item,"_")[2]),tonumber(string.split(_data.item,"_")[1]))
        MgrRes.LoadSprite(ticketImg,ExchangeProp.icon)
        ticketNum.text = ExchangeProp.count   --道具数量
        _obj:SetActive(true)

        ---点击兑换积分道具
        UIEvent.LuaClick(_obj,function()
            local list = ShopControl.GetCertainTypeShopData(tonumber(_data.shopType))
            local arr = {}
            for k,v in pairs(list) do
                arr[#arr + 1] = v
            end
            Global.Sort(arr,{"id"},false)
            MgrUI.Pop(UID.OptionalPop_UI,{arr,function()
                local ExchangeProp = ItemControl.GetItemByIdAndType(tonumber(string.split(_data.item,"_")[2]),tonumber(string.split(_data.item,"_")[1]))
                self.Text_Dianshu().text = ExchangeProp.count
                self:ResetItem(_data.id)
            end ,2},true,1)
        end)
    else
        _obj:SetActive(false)
    end
end

function M:OnHide()
    --MgrTimer.Cancel("CardType")
end
function M:OnClose()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel("CardType")
    MgrTimer.Cancel("RefreshTag")
    Event.Remove("ReconnetSucc", Handle(self,self.ReconnetEvent))
    Event.CheckClear("RefreshCoinCount")
    Event.Remove("NormalDraw_FreePool")

    CardDrawControl.TypeIndex = self.CurTypeIndex
    CardDrawControl.CardPoolIndex = self.CurCardPoolIndex
    --清空索引
    self.CurTypeIndex = nil
    self.CurCardPoolIndex = nil
end

--region 控件操作
--- 抽卡展示的附属控件激活
---@param bActive boolean
---@param bNovice boolean @ 新手引导抽卡不支持跳过
function M:SetDrawVideoSubWidgetsActive(bActive, bNovice)
    if self.beijing() then
        self.beijing().gameObject:SetActive(bActive)
    end
    if self.Btn_SkipPanel() then
        self.Btn_SkipPanel().gameObject:SetActive(not bNovice and bActive)
    end
end

--- 停止抽卡视频播放
function M:StopCardDrawVideo()
    ---@type UnityEngine.UI.Image
    local imageComp = self.CardDrawVideoRT()
    if not imageComp or Global.IsNil(imageComp) then
        return
    end
    ---@type CriWare.CriManaMovieControllerForUI
    local videoComp = imageComp.transform:GetComponent("CriManaMovieControllerForUI")
    if not videoComp or Global.IsNil(videoComp) then
        return
    end
    videoComp:Stop()
end

--- 设置抽卡相关控件(详情等)位置
---@param bAvoidLeftBtn boolean @ 避开左侧按钮
function M:SetDrawRelativeWidgetsPosition(bAvoidLeftBtn)
    ---@param comp UnityEngine.MonoBehaviour
    ---@param y number
    local _SetWidgetLocalY = function(comp, y)
        if not comp or Global.IsNil(comp) then
            return
        end
        comp.gameObject.transform.localPosition = Vector3(comp.gameObject.transform.localPosition.x, y, 0)
    end

    local baseY = -494
    if bAvoidLeftBtn then
        baseY = baseY + 136 -- -358
    --    _SetWidgetLocalY(self.Btn_Chakan(), -358)
    --    _SetWidgetLocalY(self.Btn_Info(), -358)
    --    _SetWidgetLocalY(self.Text_Time(), -354)
    --    _SetWidgetLocalY(self.DuihuanPanel(), -266)
    --else
    --    _SetWidgetLocalY(self.Btn_Chakan(), -462)
    --    _SetWidgetLocalY(self.Btn_Info(), -462)
    --    _SetWidgetLocalY(self.Text_Time(), -459)
    --    _SetWidgetLocalY(self.DuihuanPanel(), -355)
    end
    _SetWidgetLocalY(self.Btn_Chakan(), baseY)
    _SetWidgetLocalY(self.Btn_Info(), baseY)
    _SetWidgetLocalY(self.Text_Time(), baseY + 2)
    _SetWidgetLocalY(self.DuihuanPanel(), baseY + 97)
end
--endregion

return M