-- Code Auto Create Begin
local M = Class('Union_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.Union_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[Union_UI].prefab'
    self.Name = 'Form[Union_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'MyUnion','MyUnion',2},{'Img_BG1','MyUnion/Img_BG1',2},{'UpperLeftBtnPanel','MyUnion/UpperLeftBtnPanel',2},{'Btn_Back','MyUnion/UpperLeftBtnPanel/Btn_Back',2},{'Img_Fenggexian','MyUnion/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help','MyUnion/UpperLeftBtnPanel/Btn_Help',2},{'MemberPanel','MyUnion/MemberPanel',2},{'Aegies_icon','MyUnion/MemberPanel/MyUnionInfo/Aegies_icon',2},{'GonghuiIcon','MyUnion/MemberPanel/MyUnionInfo/GonghuiIcon',2},{'Paiming','MyUnion/MemberPanel/MyUnionInfo/Paiming',2},{'Icon','MyUnion/MemberPanel/MyUnionInfo/Paiming/Icon',2},{'President','MyUnion/MemberPanel/MyUnionInfo/President',2},{'IntakePolicy','MyUnion/MemberPanel/MyUnionInfo/IntakePolicy',2},{'JoinLevel','MyUnion/MemberPanel/MyUnionInfo/JoinLevel',2},{'Shuoming','MyUnion/MemberPanel/MyUnionInfo/Shuoming',2},{'OutGuild','MyUnion/MemberPanel/MyUnionInfo/OutGuild',2},{'Di','MyUnion/MemberPanel/Member/Di',2},{'xian1','MyUnion/MemberPanel/Member/Di/xian1',2},{'xian2','MyUnion/MemberPanel/Member/Di/xian2',2},{'content','MyUnion/MemberPanel/Member/MemberTeam/content',2},{'touxiangyuan2','MyUnion/MemberPanel/Member/MemberTeam/Member/Btn_Avatar/touxiangyuan2',2},{'touxiangyuan','MyUnion/MemberPanel/Member/MemberTeam/Member/Btn_Avatar/touxiangyuan',2},{'PlayerIcon','MyUnion/MemberPanel/Member/MemberTeam/Member/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang','MyUnion/MemberPanel/Member/MemberTeam/Member/Btn_Avatar/touxiangkuang',2},{'JobTag','MyUnion/MemberPanel/Member/MemberTeam/Member/JobTag',2},{'FenJieXian','MyUnion/MemberPanel/Member/MemberTeam/Member/FenJieXian',2},{'Profile','MyUnion/MemberPanel/Member/MemberTeam/Member/Profile',2},{'BlackBar','MyUnion/MemberPanel/Member/BlackBar',2},{'Btn_Apply','MyUnion/MemberPanel/Member/RightTop/Btn_Apply',2},{'Btn_UnionMgr','MyUnion/MemberPanel/Member/RightTop/Btn_UnionMgr',2},{'Btn_MemberMgr','MyUnion/MemberPanel/Member/RightTop/Btn_MemberMgr',2},{'SciencePanel','MyUnion/SciencePanel',2},{'Di01','MyUnion/SciencePanel/ScienceLeft/Di',2},{'xian201','MyUnion/SciencePanel/ScienceLeft/Di/xian2',2},{'xian101','MyUnion/SciencePanel/ScienceLeft/Di/xian1',2},{'ItemContent','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList/ItemContent',2},{'Scrollbar','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList/Scrollbar',2},{'Handle','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList/Scrollbar/Sliding Area/Handle',2},{'ScienceItem','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList/ScienceItem',2},{'ScienceRight','MyUnion/SciencePanel/ScienceRight',2},{'Img_Science','MyUnion/SciencePanel/ScienceRight/Img_Science',2},{'XiaoGuoZongLan','MyUnion/SciencePanel/ScienceRight/XiaoGuoZongLan',2},{'Image','MyUnion/SciencePanel/ScienceRight/XiaoGuoZongLan/Image',2},{'ShengJi','MyUnion/SciencePanel/ScienceRight/ShengJi',2},{'Img_Jiantou1','MyUnion/SciencePanel/ScienceRight/ShengJi/Img_Jiantou1',2},{'Max','MyUnion/SciencePanel/ScienceRight/Max',2},{'KeJiXiaoGuoHeiKuang','MyUnion/SciencePanel/ScienceRight/KeJiXiaoGuoHeiKuang',2},{'XiaoguoPrefab','MyUnion/SciencePanel/ScienceRight/Content/XiaoguoPrefab',2},{'Img_Jiantou2','MyUnion/SciencePanel/ScienceRight/Content/XiaoguoPrefab/Img_Jiantou2',2},{'FenGeXian','MyUnion/SciencePanel/ScienceRight/FenGeXian',2},{'JiaJuBiicon','MyUnion/SciencePanel/ScienceRight/Xiaohao/JiaJuBiicon',2},{'Btn_ShengJi','MyUnion/SciencePanel/ScienceRight/Btn_ShengJi',2},{'Btn_UnUpgrade','MyUnion/SciencePanel/ScienceRight/Btn_UnUpgrade',2},{'DonatePanel','MyUnion/DonatePanel',2},{'Spine','MyUnion/DonatePanel/Spine',2},{'DonatePrefab1','MyUnion/DonatePanel/DonatePrefab1',2},{'BlackBar01','MyUnion/DonatePanel/DonatePrefab1/BlackBar',2},{'Btn_Donate','MyUnion/DonatePanel/DonatePrefab1/Btn_Donate',2},{'Btn_UnDonate','MyUnion/DonatePanel/DonatePrefab1/Btn_UnDonate',2},{'CostIcon','MyUnion/DonatePanel/DonatePrefab1/Cost/CostIcon',2},{'FenGeXian01','MyUnion/DonatePanel/DonatePrefab1/FenGeXian',2},{'DonateAward','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward',2},{'wupin','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin',2},{'RewardRankImg','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/RewardRankImg',2},{'RewardIconImg','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/RewardIconImg',2},{'StarPanel','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/StarPanel',2},{'ItemStarRoot','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/StarPanel/ItemStarPrefab',2},{'HighLight','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/TimeCountDownPanel',2},{'shijian2','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/RedDotIcon',2},{'empty','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/empty',2},{'DonateAward1','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1',2},{'wupin01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin',2},{'RewardRankImg01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/RewardRankImg',2},{'RewardIconImg01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/RewardIconImg',2},{'StarPanel01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/StarPanel',2},{'ItemStarRoot01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/StarPanel/ItemStarPrefab',2},{'HighLight01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/TimeCountDownPanel',2},{'shijian201','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/RedDotIcon',2},{'empty01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/empty',2},{'DonateAward2','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2',2},{'wupin02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin',2},{'RewardRankImg02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/RewardRankImg',2},{'RewardIconImg02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/RewardIconImg',2},{'StarPanel02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/StarPanel',2},{'ItemStarRoot02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/StarPanel/ItemStarPrefab',2},{'HighLight02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/TimeCountDownPanel',2},{'shijian202','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/RedDotIcon',2},{'empty02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/empty',2},{'DonatePrefab2','MyUnion/DonatePanel/DonatePrefab2',2},{'BlackBar02','MyUnion/DonatePanel/DonatePrefab2/BlackBar',2},{'Btn_Donate01','MyUnion/DonatePanel/DonatePrefab2/Btn_Donate',2},{'Btn_UnDonate01','MyUnion/DonatePanel/DonatePrefab2/Btn_UnDonate',2},{'CostIcon01','MyUnion/DonatePanel/DonatePrefab2/Cost/CostIcon',2},{'FenGeXian02','MyUnion/DonatePanel/DonatePrefab2/FenGeXian',2},{'DonateAward01','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward',2},{'wupin03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin',2},{'RewardRankImg03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/RewardRankImg',2},{'RewardIconImg03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/RewardIconImg',2},{'StarPanel03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/StarPanel',2},{'ItemStarRoot03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/StarPanel/ItemStarPrefab',2},{'HighLight03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/TimeCountDownPanel',2},{'shijian203','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/RedDotIcon',2},{'empty03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/empty',2},{'DonateAward101','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1',2},{'wupin04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin',2},{'RewardRankImg04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/RewardRankImg',2},{'RewardIconImg04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/RewardIconImg',2},{'StarPanel04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/StarPanel',2},{'ItemStarRoot04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/StarPanel/ItemStarPrefab',2},{'HighLight04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/TimeCountDownPanel',2},{'shijian204','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/RedDotIcon',2},{'empty04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/empty',2},{'DonateAward201','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2',2},{'wupin05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin',2},{'RewardRankImg05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/RewardRankImg',2},{'RewardIconImg05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/RewardIconImg',2},{'StarPanel05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/StarPanel',2},{'ItemStarRoot05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/StarPanel/ItemStarRoot',2},{'ItemStarPrefab05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/StarPanel/ItemStarPrefab',2},{'HighLight05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/StarPanel/ItemStarPrefab/HighLight',2},{'Img_ItemCountBg05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/Img_ItemCountBg',2},{'TimeCountDownPanel05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/TimeCountDownPanel',2},{'shijian205','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/TimeCountDownPanel/shijian2',2},{'RedDotIcon05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/RedDotIcon',2},{'empty05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/empty',2},{'Bottom','MyUnion/Bottom',2},{'Chat','MyUnion/Bottom/Chat',2},{'Chat_icon','MyUnion/Bottom/Chat/Chat_icon',2},{'MemberList','MyUnion/Bottom/Switch/MemberList',2},{'Check','MyUnion/Bottom/Switch/MemberList/Check',2},{'MemberList_icon','MyUnion/Bottom/Switch/MemberList/Check/MemberList_icon',2},{'Uncheck','MyUnion/Bottom/Switch/MemberList/Uncheck',2},{'MemberList_icon01','MyUnion/Bottom/Switch/MemberList/Uncheck/MemberList_icon',2},{'ScienceFactory','MyUnion/Bottom/Switch/ScienceFactory',2},{'Check01','MyUnion/Bottom/Switch/ScienceFactory/Check',2},{'ScienceFactory_icon','MyUnion/Bottom/Switch/ScienceFactory/Check/ScienceFactory_icon',2},{'Uncheck01','MyUnion/Bottom/Switch/ScienceFactory/Uncheck',2},{'ScienceFactory_icon01','MyUnion/Bottom/Switch/ScienceFactory/Uncheck/ScienceFactory_icon',2},{'Donate','MyUnion/Bottom/Switch/Donate',2},{'Check02','MyUnion/Bottom/Switch/Donate/Check',2},{'Donate_icon','MyUnion/Bottom/Switch/Donate/Check/Donate_icon',2},{'Uncheck02','MyUnion/Bottom/Switch/Donate/Uncheck',2},{'Donate_icon01','MyUnion/Bottom/Switch/Donate/Uncheck/Donate_icon',2},{'RedDotIcon06','MyUnion/Bottom/Switch/Donate/RedDotIcon',2},{'UnionShop','MyUnion/Bottom/Switch/UnionShop',2},{'Check03','MyUnion/Bottom/Switch/UnionShop/Check',2},{'UnionShop_icon','MyUnion/Bottom/Switch/UnionShop/Check/UnionShop_icon',2},{'Uncheck03','MyUnion/Bottom/Switch/UnionShop/Uncheck',2},{'UnionShop_icon01','MyUnion/Bottom/Switch/UnionShop/Uncheck/UnionShop_icon',2},{'ChatPop','ChatPop',2},{'ChatMask','ChatPop/ChatMask',2},{'Img_Chatdi','ChatPop/Img_Chatdi',2},{'ShiJie','ChatPop/Img_Chatdi/Switch/ShiJie/ShiJie',2},{'ShiJie_H','ChatPop/Img_Chatdi/Switch/ShiJie/ShiJie_H',2},{'Gonghui','ChatPop/Img_Chatdi/Switch/Gonghui/Gonghui',2},{'Gonghui_H','ChatPop/Img_Chatdi/Switch/Gonghui/Gonghui_H',2},{'Chat_icon01','ChatPop/Img_Chatdi/Switch/Chat_icon',2},{'UserDailog','ChatPop/Img_Chatdi/MessageList/UserDailog',2},{'Bubble','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Bubble',2},{'Emoji','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Bubble/Emoji',2},{'touxiangyuan201','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Btn_Avatar/touxiangyuan2',2},{'touxiangyuan01','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Btn_Avatar/touxiangyuan',2},{'PlayerIcon01','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang01','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Btn_Avatar/touxiangkuang',2},{'Bubble01','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Bubble',2},{'Emoji01','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Bubble/Emoji',2},{'touxiangyuan202','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Btn_Avatar/touxiangyuan2',2},{'touxiangyuan02','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Btn_Avatar/touxiangyuan',2},{'PlayerIcon02','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Btn_Avatar/touxiangyuan/PlayerIcon',2},{'touxiangkuang02','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Btn_Avatar/touxiangkuang',2},{'ChatContent','ChatPop/Img_Chatdi/MessageList/ChatContent',2},{'Input_Dialog','ChatPop/Img_Chatdi/Input_Dialog',2},{'Btn_Send','ChatPop/Img_Chatdi/Btn_Send',2},{'Btn_Expression','ChatPop/Img_Chatdi/Btn_Expression',2},{'Btn_Close','ChatPop/Img_Chatdi/Btn_Close',2},{'Img_Close','ChatPop/Img_Chatdi/Btn_Close/Img_Close',2},{'ApplyListPop','ApplyListPop',2},{'ApplyMask','ApplyListPop/ApplyMask',2},{'Img_Xian2','ApplyListPop/Img_Xian2',2},{'Img_Xian1','ApplyListPop/Img_Xian1',2},{'Img_bg','ApplyListPop/Img_bg',2},{'Img_Biaotixian','ApplyListPop/Img_bg/Img_Biaotixian',2},{'content01','ApplyListPop/Img_bg/ApplyList/content',2},{'Img_Paimingdi','ApplyListPop/Img_bg/ApplyList/ApplyMember/Img_Paimingdi',2},{'Img_touxiangdi','ApplyListPop/Img_bg/ApplyList/ApplyMember/touxiang/Img_touxiangdi',2},{'Img_Head','ApplyListPop/Img_bg/ApplyList/ApplyMember/touxiang/Img_touxiangdi/Img_Head',2},{'Img_Touxiangkuang','ApplyListPop/Img_bg/ApplyList/ApplyMember/touxiang/Img_Touxiangkuang',2},{'Btn_TongYi','ApplyListPop/Img_bg/ApplyList/ApplyMember/Btn_TongYi',2},{'Btn_JuJue','ApplyListPop/Img_bg/ApplyList/ApplyMember/Btn_JuJue',2},{'ManagePop','ManagePop',2},{'ManageMask','ManagePop/ManageMask',2},{'Img_Xian201','ManagePop/Img_Xian2',2},{'Img_Xian101','ManagePop/Img_Xian1',2},{'Img_bg01','ManagePop/Img_bg',2},{'Img_Biaotixian01','ManagePop/Img_bg/Img_Biaotixian',2},{'Input_GuildName','ManagePop/Img_bg/Text_GongHuiMingChen/Input_GuildName',2},{'Btn_NameEdit','ManagePop/Img_bg/Text_GongHuiMingChen/Btn_NameEdit',2},{'Btn_Edit','ManagePop/Img_bg/Text_GongHuiMingChen/Btn_NameEdit/Btn_Edit',2},{'Img_BianjiIcon','ManagePop/Img_bg/Text_GongHuiMingChen/Btn_NameEdit/Img_BianjiIcon',2},{'Btn_SignEdit','ManagePop/Img_bg/Text_GongHuiGongGao/Btn_SignEdit',2},{'Btn_Edit2','ManagePop/Img_bg/Text_GongHuiGongGao/Btn_SignEdit/Btn_Edit2',2},{'Img_BianjiIcon2','ManagePop/Img_bg/Text_GongHuiGongGao/Btn_SignEdit/Img_BianjiIcon2',2},{'Input_GongGao','ManagePop/Img_bg/Text_GongHuiGongGao/Input_GongGao',2},{'Drop_LvLimit','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit',2},{'Arrow','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Arrow',2},{'Template','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template',2},{'Viewport','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template/Viewport',2},{'ItemBackground','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template/Viewport/Content/Item/ItemBackground',2},{'ItemCheckmark','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template/Viewport/Content/Item/ItemCheckmark',2},{'Drop_JoinMode','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode',2},{'Arrow01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Arrow',2},{'Template01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template',2},{'Viewport01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template/Viewport',2},{'ItemBackground01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template/Viewport/Content/Item/ItemBackground',2},{'ItemCheckmark01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template/Viewport/Content/Item/ItemCheckmark',2},{'Gonghuitouxiang','ManagePop/Img_bg/Gonghuitouxiang',2},{'GroupIconImg','ManagePop/Img_bg/Gonghuitouxiang/GroupIconImg',2},{'Btn_Xiugaitouxiang','ManagePop/Img_bg/Btn_Xiugaitouxiang',2},{'FenGeXian03','ManagePop/Img_bg/FenGeXian',2},{'Btn_QueDing','ManagePop/Img_bg/Btn_QueDing',2},{'Btn_QuXiao','ManagePop/Img_bg/Btn_QuXiao',2},{'LevelPreviewPop','LevelPreviewPop',2},{'BlueMask','LevelPreviewPop/BlueMask',2},{'Img_Xian202','LevelPreviewPop/Img_Xian2',2},{'Img_Xian102','LevelPreviewPop/Img_Xian1',2},{'Img_bg02','LevelPreviewPop/Img_bg',2},{'Img_Biaotixian02','LevelPreviewPop/Img_bg/Img_Biaotixian',2},{'Content','LevelPreviewPop/Img_bg/Content',2},{'SkilPreviewPop','SkilPreviewPop',2},{'BlueMask01','SkilPreviewPop/BlueMask',2},{'Img_Xian203','SkilPreviewPop/Img_Xian2',2},{'Img_Xian103','SkilPreviewPop/Img_Xian1',2},{'Img_bg03','SkilPreviewPop/Img_bg',2},{'Img_Biaotixian03','SkilPreviewPop/Img_bg/Img_Biaotixian',2},{'FuBenXiangGuan','SkilPreviewPop/Img_bg/FuBenXiangGuan',2},{'Content01','SkilPreviewPop/Img_bg/Content',2},{'ZhanDouXIangGuan','SkilPreviewPop/Img_bg/ZhanDouXIangGuan',2},{'Content02','SkilPreviewPop/Img_bg/Content',2},{'RankingList','RankingList',2},{'Img_BG','RankingList/Img_BG',2},{'UpperLeftBtnPanel01','RankingList/UpperLeftBtnPanel',2},{'Btn_GoBack','RankingList/UpperLeftBtnPanel/Btn_GoBack',2},{'Img_Fenggexian01','RankingList/UpperLeftBtnPanel/Img_Fenggexian',2},{'Btn_Help01','RankingList/UpperLeftBtnPanel/Btn_Help',2},{'UnionInfo','RankingList/UnionInfo',2},{'Aegies_icon01','RankingList/UnionInfo/Aegies_icon',2},{'GonghuiIcon01','RankingList/UnionInfo/GonghuiIcon',2},{'Paiming01','RankingList/UnionInfo/Paiming',2},{'Icon01','RankingList/UnionInfo/Paiming/Icon',2},{'President01','RankingList/UnionInfo/President',2},{'IntakePolicy01','RankingList/UnionInfo/IntakePolicy',2},{'JoinLevel01','RankingList/UnionInfo/JoinLevel',2},{'Shuoming01','RankingList/UnionInfo/Shuoming',2},{'Di02','RankingList/Right/Di',2},{'CutList','RankingList/Right/CutList',2},{'choose','RankingList/Right/CutList/YuePaiHangPrefab/choose',2},{'xian102','RankingList/Right/xian1',2},{'xian','RankingList/Right/UnionTeam/UnionPrefab/Uncheck/xian',2},{'Checkdi','RankingList/Right/UnionTeam/UnionPrefab/Check/Checkdi',2},{'xian202','RankingList/Right/MyUnion/xian2',2},{'heidi','RankingList/Right/MyUnion/heidi',2},{'Image01','RankingList/Right/MyUnion/Image',2},{'MembersPop','MembersPop',2},{'MemberMask','MembersPop/MemberMask',2},{'Img_Xian204','MembersPop/Img_Xian2',2},{'Img_Xian104','MembersPop/Img_Xian1',2},{'Img_bg04','MembersPop/Img_bg',2},{'Img_Biaotixian04','MembersPop/Img_bg/Img_Biaotixian',2},{'content02','MembersPop/Img_bg/MgrMemberList/content',2},{'Img_Paimingdi01','MembersPop/Img_bg/MgrMemberList/MgrMember/Img_Paimingdi',2},{'Img_touxiangdi01','MembersPop/Img_bg/MgrMemberList/MgrMember/touxiang/Img_touxiangdi',2},{'Img_Head01','MembersPop/Img_bg/MgrMemberList/MgrMember/touxiang/Img_touxiangdi/Img_Head',2},{'Img_Touxiangkuang01','MembersPop/Img_bg/MgrMemberList/MgrMember/touxiang/Img_Touxiangkuang',2},{'MemberBtnMgr','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr',2},{'Btn_ZhuanRang','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_ZhuanRang',2},{'Btn_CheZhi','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_CheZhi',2},{'Btn_TiChu','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_TiChu',2},{'Btn_RenMing','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_RenMing',2},{'JobTag01','MembersPop/Img_bg/MgrMemberList/MgrMember/JobTag',2},
        -- Text 列表
        {'Text_Friend_CN','RankingList/UpperLeftBtnPanel/Text_Union/Text_Friend_CN',3},{'Text_Friend_EN','RankingList/UpperLeftBtnPanel/Text_Union/Text_Friend_EN',3},
        -- UITemplate 列表
        {'ScienceItem01','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList/ScienceItem',10},
        -- Toggle 列表
        {'Item','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template/Viewport/Content/Item',13},{'Item01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template/Viewport/Content/Item',13},
        -- RawImage 列表
        {'ScienceList','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList',15},
        -- LoopScrollRect 列表
        {'MemberTeam','MyUnion/MemberPanel/Member/MemberTeam',18},{'ScienceList01','MyUnion/SciencePanel/ScienceLeft/Di/ScienceList',18},{'MessageList','ChatPop/Img_Chatdi/MessageList',18},{'ApplyList','ApplyListPop/Img_bg/ApplyList',18},{'UnionTeam','RankingList/Right/UnionTeam',18},{'MgrMemberList','MembersPop/Img_bg/MgrMemberList',18},
        -- TextMeshProUGUI 列表
        {'Text_Friend_CN01','MyUnion/UpperLeftBtnPanel/Text_Union/Text_Friend_CN',20},{'Text_Friend_EN01','MyUnion/UpperLeftBtnPanel/Text_Union/Text_Friend_EN',20},{'Text_LV','MyUnion/MemberPanel/MyUnionInfo/Text_LV',20},{'Text_level','MyUnion/MemberPanel/MyUnionInfo/Text_level',20},{'Text_name','MyUnion/MemberPanel/MyUnionInfo/Text_name',20},{'Text_ID','MyUnion/MemberPanel/MyUnionInfo/Text_ID',20},{'Text_Rank_Month1','MyUnion/MemberPanel/MyUnionInfo/Paiming/Text_Rank_Month1',20},{'Text_Rank_Month2','MyUnion/MemberPanel/MyUnionInfo/Paiming/Text_Rank_Month2',20},{'Text_Rank_LastMonth1','MyUnion/MemberPanel/MyUnionInfo/Paiming/Text_Rank_LastMonth1',20},{'Text_Rank_LastMonth2','MyUnion/MemberPanel/MyUnionInfo/Paiming/Text_Rank_LastMonth2',20},{'Text_President1','MyUnion/MemberPanel/MyUnionInfo/President/Text_President1',20},{'Text_President2','MyUnion/MemberPanel/MyUnionInfo/President/Text_President2',20},{'Text_IntakePolicy1','MyUnion/MemberPanel/MyUnionInfo/IntakePolicy/Text_IntakePolicy1',20},{'Text_IntakePolicy2','MyUnion/MemberPanel/MyUnionInfo/IntakePolicy/Text_IntakePolicy2',20},{'Text_JoinLevel1','MyUnion/MemberPanel/MyUnionInfo/JoinLevel/Text_JoinLevel1',20},{'Text_JoinLevel2','MyUnion/MemberPanel/MyUnionInfo/JoinLevel/Text_JoinLevel2',20},{'Text_Shuoming','MyUnion/MemberPanel/MyUnionInfo/Shuoming/Text_Shuoming',20},{'Text_OutGuild','MyUnion/MemberPanel/MyUnionInfo/OutGuild/Text_OutGuild',20},{'Text_ItemLevel','MyUnion/MemberPanel/Member/MemberTeam/Member/Text_ItemLevel',20},{'Text_ItemName','MyUnion/MemberPanel/Member/MemberTeam/Member/Text_ItemName',20},{'Text_ItemJob','MyUnion/MemberPanel/Member/MemberTeam/Member/JobTag/Text_ItemJob',20},{'Text_GongXian','MyUnion/MemberPanel/Member/MemberTeam/Member/Text_GongXian',20},{'Text_Online','MyUnion/MemberPanel/Member/MemberTeam/Member/Text_Online',20},{'Text_GongHuiChengYuan','MyUnion/MemberPanel/Member/BlackBar/Text_GongHuiChengYuan',20},{'Text_MemberNum','MyUnion/MemberPanel/Member/BlackBar/Text_GongHuiChengYuan/Text_MemberNum',20},{'Text_ZhiWu','MyUnion/MemberPanel/Member/BlackBar/Text_ZhiWu',20},{'Text_GongXian01','MyUnion/MemberPanel/Member/BlackBar/Text_GongXian',20},{'Text_GongHuiPaiMing','MyUnion/MemberPanel/Member/BlackBar/Text_GongHuiPaiMing',20},{'Text_OnlineNum','MyUnion/MemberPanel/Member/BlackBar/Text_GongHuiPaiMing/Text_OnlineNum',20},{'Text_Apply','MyUnion/MemberPanel/Member/RightTop/Btn_Apply/Text_Apply',20},{'Text_Union','MyUnion/MemberPanel/Member/RightTop/Btn_UnionMgr/Text_Union',20},{'Text_Member','MyUnion/MemberPanel/Member/RightTop/Btn_MemberMgr/Text_Member',20},{'Text_XiaoGuoZongLan','MyUnion/SciencePanel/ScienceRight/XiaoGuoZongLan/Text_XiaoGuoZongLan',20},{'Text_ScienceName','MyUnion/SciencePanel/ScienceRight/Text_ScienceName',20},{'Text_LV2','MyUnion/SciencePanel/ScienceRight/ShengJi/Text_LV2',20},{'Text_NextLv','MyUnion/SciencePanel/ScienceRight/ShengJi/Text_NextLv',20},{'Text_LV1','MyUnion/SciencePanel/ScienceRight/ShengJi/Text_LV1',20},{'Text_CurLv','MyUnion/SciencePanel/ScienceRight/ShengJi/Text_CurLv',20},{'Text_Max','MyUnion/SciencePanel/ScienceRight/Max/Text_Max',20},{'Text','MyUnion/SciencePanel/ScienceRight/KeJiXiaoGuoHeiKuang/Text',20},{'Text_Xiaohao','MyUnion/SciencePanel/ScienceRight/Content/XiaoguoPrefab/Text_Xiaohao',20},{'Text_Zuo1','MyUnion/SciencePanel/ScienceRight/Content/XiaoguoPrefab/Text_Zuo1',20},{'Text_You1','MyUnion/SciencePanel/ScienceRight/Content/XiaoguoPrefab/Text_You1',20},{'XuQiu','MyUnion/SciencePanel/ScienceRight/XuQiu',20},{'Text_NeedLv','MyUnion/SciencePanel/ScienceRight/XuQiu/Text_NeedLv',20},{'Xiaohao','MyUnion/SciencePanel/ScienceRight/Xiaohao',20},{'Text_NeedCoin','MyUnion/SciencePanel/ScienceRight/Xiaohao/Text_NeedCoin',20},{'Text_ShengJi','MyUnion/SciencePanel/ScienceRight/Btn_ShengJi/Text_ShengJi',20},{'Text_ShengJi01','MyUnion/SciencePanel/ScienceRight/Btn_UnUpgrade/Text_ShengJi',20},{'Text_QuanXianTiShi','MyUnion/SciencePanel/ScienceRight/Text_QuanXianTiShi',20},{'Text_Name','MyUnion/DonatePanel/DonatePrefab1/Text_Name',20},{'Text_GongXianJiangLi','MyUnion/DonatePanel/DonatePrefab1/Text_GongXianJiangLi',20},{'Text_JuanXian','MyUnion/DonatePanel/DonatePrefab1/Btn_Donate/Text_JuanXian',20},{'Text_JuanXian01','MyUnion/DonatePanel/DonatePrefab1/Btn_UnDonate/Text_JuanXian',20},{'Cost','MyUnion/DonatePanel/DonatePrefab1/Cost',20},{'Text_NeedCoin01','MyUnion/DonatePanel/DonatePrefab1/Cost/Text_NeedCoin',20},{'ItemCountText','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward/wupin/TimeCountDownPanel/CountDownText',20},{'ItemCountText01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText01','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward1/wupin/TimeCountDownPanel/CountDownText',20},{'ItemCountText02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText02','MyUnion/DonatePanel/DonatePrefab1/Content/DonateAward2/wupin/TimeCountDownPanel/CountDownText',20},{'Text_DonateCount','MyUnion/DonatePanel/DonatePrefab1/Text_DonateCount',20},{'Text_Name01','MyUnion/DonatePanel/DonatePrefab2/Text_Name',20},{'Text_GongXianJiangLi01','MyUnion/DonatePanel/DonatePrefab2/Text_GongXianJiangLi',20},{'Text_JuanXian02','MyUnion/DonatePanel/DonatePrefab2/Btn_Donate/Text_JuanXian',20},{'Text_JuanXian03','MyUnion/DonatePanel/DonatePrefab2/Btn_UnDonate/Text_JuanXian',20},{'Cost01','MyUnion/DonatePanel/DonatePrefab2/Cost',20},{'Text_NeedCoin02','MyUnion/DonatePanel/DonatePrefab2/Cost/Text_NeedCoin',20},{'ItemCountText03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText03','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward/wupin/TimeCountDownPanel/CountDownText',20},{'ItemCountText04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText04','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward1/wupin/TimeCountDownPanel/CountDownText',20},{'ItemCountText05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/Img_ItemCountBg/ItemCountText',20},{'CountDownText05','MyUnion/DonatePanel/DonatePrefab2/Content/DonateAward2/wupin/TimeCountDownPanel/CountDownText',20},{'Text_DonateCount01','MyUnion/DonatePanel/DonatePrefab2/Text_DonateCount',20},{'Text_liaotian','MyUnion/Bottom/Chat/Text_liaotian',20},{'Text_ChengYuanLieBiao','MyUnion/Bottom/Switch/MemberList/Text_ChengYuanLieBiao',20},{'Text_KeJiGongChang','MyUnion/Bottom/Switch/ScienceFactory/Text_KeJiGongChang',20},{'Text_ZiYuanJuanXian','MyUnion/Bottom/Switch/Donate/Text_ZiYuanJuanXian',20},{'Text_GongHuiShangDian','MyUnion/Bottom/Switch/UnionShop/Text_GongHuiShangDian',20},{'Text_ShiJie','ChatPop/Img_Chatdi/Switch/ShiJie/ShiJie/Text_ShiJie',20},{'Text_ShiJie01','ChatPop/Img_Chatdi/Switch/ShiJie/ShiJie_H/Text_ShiJie',20},{'Text_GongHui','ChatPop/Img_Chatdi/Switch/Gonghui/Gonghui/Text_GongHui',20},{'Text_GongHui01','ChatPop/Img_Chatdi/Switch/Gonghui/Gonghui_H/Text_GongHui',20},{'Text_Liaotian','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Bubble/Text_Liaotian',20},{'Text_mingzi','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Text_mingzi',20},{'Text_time','ChatPop/Img_Chatdi/MessageList/UserDailog/OtherDailog/Text_mingzi/Text_time',20},{'Text_Liaotian01','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Bubble/Text_Liaotian',20},{'Text_time01','ChatPop/Img_Chatdi/MessageList/UserDailog/SelfDailog/Text_time',20},{'Placeholder','ChatPop/Img_Chatdi/Input_Dialog/Text Area/Placeholder',20},{'Text01','ChatPop/Img_Chatdi/Input_Dialog/Text Area/Text',20},{'Text_FaSong','ChatPop/Img_Chatdi/Btn_Send/Text_FaSong',20},{'Text_Title','ApplyListPop/Img_bg/Text_Title',20},{'Text_ChengYuanShuLiang','ApplyListPop/Img_bg/Text_ChengYuanShuLiang',20},{'Text_DengJi','ApplyListPop/Img_bg/ApplyList/ApplyMember/Text_DengJi',20},{'Text_MingZi','ApplyListPop/Img_bg/ApplyList/ApplyMember/Text_MingZi',20},{'Text_ShuaXin','ApplyListPop/Img_bg/ApplyList/ApplyMember/Btn_TongYi/Text_ShuaXin',20},{'Text_ShuaXin01','ApplyListPop/Img_bg/ApplyList/ApplyMember/Btn_JuJue/Text_ShuaXin',20},{'Text_Title01','ManagePop/Img_bg/Text_Title',20},{'Text_GongHuiMingChen','ManagePop/Img_bg/Text_GongHuiMingChen',20},{'Placeholder01','ManagePop/Img_bg/Text_GongHuiMingChen/Input_GuildName/Text Area/Placeholder',20},{'Text02','ManagePop/Img_bg/Text_GongHuiMingChen/Input_GuildName/Text Area/Text',20},{'Text_DengJi01','ManagePop/Img_bg/Text_DengJi',20},{'Text_DengJi1','ManagePop/Img_bg/Text_DengJi/Text_DengJi1',20},{'Text_GongHuiID','ManagePop/Img_bg/Text_GongHuiID',20},{'Text_GongHuiID1','ManagePop/Img_bg/Text_GongHuiID/Text_GongHuiID1',20},{'Text_HuiZhang','ManagePop/Img_bg/Text_HuiZhang',20},{'Text_HuiZhang1','ManagePop/Img_bg/Text_HuiZhang/Text_HuiZhang1',20},{'Text_GongHuiGongGao','ManagePop/Img_bg/Text_GongHuiGongGao',20},{'Placeholder02','ManagePop/Img_bg/Text_GongHuiGongGao/Input_GongGao/Text Area/Placeholder',20},{'Text03','ManagePop/Img_bg/Text_GongHuiGongGao/Input_GongGao/Text Area/Text',20},{'Text_JiaRuDengJi','ManagePop/Img_bg/Text_JiaRuDengJi',20},{'Label','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Label',20},{'ItemLabel','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit/Template/Viewport/Content/Item/ItemLabel',20},{'Text_ShouRenFangZhen','ManagePop/Img_bg/Text_ShouRenFangZhen',20},{'Label01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Label',20},{'ItemLabel01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode/Template/Viewport/Content/Item/ItemLabel',20},{'Text_ShuaXin02','ManagePop/Img_bg/Btn_Xiugaitouxiang/Text_ShuaXin',20},{'Text_Join','ManagePop/Img_bg/Btn_QueDing/Text_Join',20},{'Text_ShuaXin03','ManagePop/Img_bg/Btn_QuXiao/Text_ShuaXin',20},{'Text_Title02','LevelPreviewPop/Img_bg/Text_Title',20},{'Text_science','LevelPreviewPop/Img_bg/Text_science',20},{'Text_member','LevelPreviewPop/Img_bg/Text_member',20},{'Text_exp','LevelPreviewPop/Img_bg/Text_exp',20},{'Text_lv','LevelPreviewPop/Img_bg/Text_lv',20},{'Text_DengJi02','LevelPreviewPop/Img_bg/Content/DengjiPrefab/Text_DengJi',20},{'Text_suxujingyan','LevelPreviewPop/Img_bg/Content/DengjiPrefab/Text_suxujingyan',20},{'Text_zuidachengyuan','LevelPreviewPop/Img_bg/Content/DengjiPrefab/Text_zuidachengyuan',20},{'Text_kejidengji','LevelPreviewPop/Img_bg/Content/DengjiPrefab/Text_kejidengji',20},{'Text_Title03','SkilPreviewPop/Img_bg/Text_Title',20},{'Text_FuBenXiangGuan','SkilPreviewPop/Img_bg/Text_FuBenXiangGuan',20},{'Text_XiaoGuo1','SkilPreviewPop/Img_bg/Content/XiaoGuoPrefab/Text_XiaoGuo1',20},{'Text_XiaoGuo2','SkilPreviewPop/Img_bg/Content/XiaoGuoPrefab/Text_XiaoGuo2',20},{'Text_ZhandouXiangGuan','SkilPreviewPop/Img_bg/Text_ZhandouXiangGuan',20},{'Text_XiaoGuo101','SkilPreviewPop/Img_bg/Content/XiaoGuoPrefab/Text_XiaoGuo1',20},{'Text_XiaoGuo201','SkilPreviewPop/Img_bg/Content/XiaoGuoPrefab/Text_XiaoGuo2',20},{'Text_LV01','RankingList/UnionInfo/Text_LV',20},{'Text_level01','RankingList/UnionInfo/Text_level',20},{'Text_name01','RankingList/UnionInfo/Text_name',20},{'Text_ID01','RankingList/UnionInfo/Text_ID',20},{'Text_Rank_Month101','RankingList/UnionInfo/Paiming/Text_Rank_Month1',20},{'Text_Rank_Month201','RankingList/UnionInfo/Paiming/Text_Rank_Month2',20},{'Text_Rank_LastMonth101','RankingList/UnionInfo/Paiming/Text_Rank_LastMonth1',20},{'Text_Rank_LastMonth201','RankingList/UnionInfo/Paiming/Text_Rank_LastMonth2',20},{'Text_President101','RankingList/UnionInfo/President/Text_President1',20},{'Text_President201','RankingList/UnionInfo/President/Text_President2',20},{'Text_IntakePolicy101','RankingList/UnionInfo/IntakePolicy/Text_IntakePolicy1',20},{'Text_IntakePolicy201','RankingList/UnionInfo/IntakePolicy/Text_IntakePolicy2',20},{'Text_JoinLevel101','RankingList/UnionInfo/JoinLevel/Text_JoinLevel1',20},{'Text_JoinLevel201','RankingList/UnionInfo/JoinLevel/Text_JoinLevel2',20},{'Text_Shuoming01','RankingList/UnionInfo/Shuoming/Text_Shuoming',20},{'Text_BenYuePaiHang','RankingList/Right/CutList/YuePaiHangPrefab/choose/Text_BenYuePaiHang',20},{'Text_BenYuePaiHang01','RankingList/Right/CutList/YuePaiHangPrefab/unchoose/Text_BenYuePaiHang',20},{'Text_MingZi01','RankingList/Right/Text_MingZi',20},{'Text_ZhaoHuanYaoQiu','RankingList/Right/Text_ZhaoHuanYaoQiu',20},{'Text_RenShu','RankingList/Right/Text_RenShu',20},{'Text_DengJi03','RankingList/Right/UnionTeam/UnionPrefab/Uncheck/Text_DengJi',20},{'Text_MingZi02','RankingList/Right/UnionTeam/UnionPrefab/Uncheck/Text_MingZi',20},{'Text_ZiYouJiaRu','RankingList/Right/UnionTeam/UnionPrefab/Uncheck/Text_ZiYouJiaRu',20},{'Text_RenShu01','RankingList/Right/UnionTeam/UnionPrefab/Uncheck/Text_RenShu',20},{'Text_DengJi04','RankingList/Right/UnionTeam/UnionPrefab/Check/Text_DengJi',20},{'Text_MingZi03','RankingList/Right/UnionTeam/UnionPrefab/Check/Text_MingZi',20},{'Text_ZiYouJiaRu01','RankingList/Right/UnionTeam/UnionPrefab/Check/Text_ZiYouJiaRu',20},{'Text_RenShu02','RankingList/Right/UnionTeam/UnionPrefab/Check/Text_RenShu',20},{'Text_DengJi05','RankingList/Right/MyUnion/Text_DengJi',20},{'Text_MingZi04','RankingList/Right/MyUnion/Text_MingZi',20},{'Text_ZiYouJiaRu02','RankingList/Right/MyUnion/Text_ZiYouJiaRu',20},{'Text_RenShu03','RankingList/Right/MyUnion/Text_RenShu',20},{'Text_Title04','MembersPop/Img_bg/Text_Title',20},{'Text_MemberNum01','MembersPop/Img_bg/Text_MemberNum',20},{'Text_DengJi06','MembersPop/Img_bg/MgrMemberList/MgrMember/Text_DengJi',20},{'Text_MingZi05','MembersPop/Img_bg/MgrMemberList/MgrMember/Text_MingZi',20},{'Text_ZhuanRang','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_ZhuanRang/Text_ZhuanRang',20},{'Text_CheLi','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_CheZhi/Text_CheLi',20},{'Text_TiChu','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_TiChu/Text_TiChu',20},{'Text_RenMing','MembersPop/Img_bg/MgrMemberList/MgrMember/MemberBtnMgr/Btn_RenMing/Text_RenMing',20},{'Text_ItemJob01','MembersPop/Img_bg/MgrMemberList/MgrMember/JobTag/Text_ItemJob',20},
        -- TMP_InputField 列表
        {'Input_Dialog01','ChatPop/Img_Chatdi/Input_Dialog',21},{'Input_GuildName01','ManagePop/Img_bg/Text_GongHuiMingChen/Input_GuildName',21},{'Input_GongGao01','ManagePop/Img_bg/Text_GongHuiGongGao/Input_GongGao',21},
        -- TMP_Dropdown 列表
        {'Drop_LvLimit01','ManagePop/Img_bg/Text_JiaRuDengJi/Drop_LvLimit',22},{'Drop_JoinMode01','ManagePop/Img_bg/Text_ShouRenFangZhen/Drop_JoinMode',22},
    }
end
-- Code Auto Create End
require("LocalData/PlayheadframeLocalData")
function M:OnInit()    
    self.SciencePanel().gameObject:SetActive(false)
    self.DonatePanel().gameObject:SetActive(false)
    self.ApplyListPop().gameObject:SetActive(false)
    self.ManagePop().gameObject:SetActive(false)
    self.MembersPop().gameObject:SetActive(false)
    self.Paiming().gameObject:SetActive(false)
    self.ChatPop().gameObject:SetActive(false)
    
    self.GuildInfo = nil            ---公会基础信息
    self.GuildMember = nil          ---公会成员信息
    self.CurPanel = nil             ---当前界面
    self.CurPanelData = nil         ---当前点击的界面按钮信息
    self.ApplyListData = nil        ---申请列表
    self.IsLeader = false           ---是否为会长

    self.IsGuildMgr = false
    self.DismissTime = GuildControl.GetDismissTime()        ---公会解散冷静期
    self.DeputyLeaderNum = 0        ---副会长数量
    self.GuildLvData = nil
    self.NeedRefresh = false        ---是否需要刷新公会信息
    self.TalkList = {}              ---聊天列表
    self.MsgSize = Vector2(384,24)              ---文字大小
    ---界面的切换按钮
    self.SwitchBtn = {
        [1] = { btn = self.MemberList().gameObject, check = self.MemberList().transform:Find("Check"), uncheck = self.MemberList().transform:Find("Uncheck"), panel = self:MemberPanel() },
        [2] = { btn = self.ScienceFactory().gameObject, check = self.ScienceFactory().transform:Find("Check"), uncheck = self.ScienceFactory().transform:Find("Uncheck"), panel = self:SciencePanel() },
        [3] = { btn = self.Donate().gameObject, check = self.Donate().transform:Find("Check"), uncheck = self.Donate().transform:Find("Uncheck"), panel = self:DonatePanel() , redDot = self.Donate().transform:Find("RedDotIcon") }
    }
    ---成员列表的切换按钮
    self.SwitchBtn_Member = {
        [1] = { btn = self.Btn_UnionMgr(), mask = self.ManageMask(), pop = self.ManagePop() },
        [2] = { btn = self.Btn_MemberMgr(), mask = self.MemberMask(), pop = self.MembersPop() },
        [3] = { btn = self.Btn_Apply(), mask = self.ApplyMask(), pop = self.ApplyListPop() }
    }
    ---注册滑块
    self.MemberTeam():SetLuaCellEvent(Handle(self, self.CellData))
    self.ApplyList():SetLuaCellEvent(Handle(self, self.ApplyCellData))
    self.MgrMemberList():SetLuaCellEvent(Handle(self, self.MgrCellData))
    self.ScienceList01():SetLuaCellEvent(Handle(self,self.ScienceCell))
    self.MessageList():SetLuaCellEvent(Handle(self,self.DailogCell))
    
    self:InitGuildMgrUI()
    self:InitButton()
    self:AddEvent()
end

function M:OnShow()
    self.GuildInfo = GuildControl.GetGuildInfo()
    if self.GuildInfo == nil then
        return
    end
    ---刷新公会信息
    self:RefreshGuildData(self.GuildInfo)
    self:RefreshDonate()
    ---刷新公会科技
    self.CurScience = nil
    self:ReloadScienceData(0)
    self:RefreshScienceDetail(self.CurScience.id)
    ---聊天列表
    self.TalkList = self.GuildInfo.note
end
---公会成员列表
function M:CellData(trans, idx)
    self:CellUI(trans.gameObject, self.GuildMember[idx])
end
---公会成员管理列表
function M:MgrCellData(trans, idx)
    self:MgrCellUI(trans.gameObject, self.GuildMember[idx])
end
---公会申请列表
function M:ApplyCellData(trans, idx)
    self:ApplyCellUI(trans.gameObject, self.ApplyListData[idx])
end
---公会科技列表
function M:ScienceCell(trans, idx)
    trans:GetComponent("UITemplate"):SetData({self.ScienceData[idx],self})
end
---聊天列表
function M:DailogCell(trans, idx)
    self:ChatList(trans.gameObject, self.TalkList[idx], idx)
end

function M:InitButton()
    Event.Add("BackKey", Handle(self, self.OnBackKey))
    ---返回
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, function()
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBackTo(UID.Home_UI)
    end))
    ---公会商店
    UIEvent.LuaClick(self.UnionShop().gameObject, Handle(self, function()
        MgrLink.LinkStart("tz_sc_114003_304")
    end))
    ---公会聊天
    UIEvent.LuaClick(self.Chat().gameObject, Handle(self, function()
        GuildControl.JoinClubChat(function()
            self.ChatPop().gameObject:SetActive(true)
        end)
    end))
    UIEvent.LuaClick(self.ChatMask().gameObject, Handle(self, function()
        self.ChatPop().gameObject:SetActive(false)
    end))
    UIEvent.LuaClick(self.Btn_Close().gameObject, Handle(self, function()
        self.ChatPop().gameObject:SetActive(false)
    end))
    
    UIEvent.LuaClick(self.Btn_Send().gameObject, Handle(self, function()
        local tMsg = self.Input_Dialog01().text
        if Tools.ContainSpecialChar(tMsg) then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
            return
        end
        GuildControl.SendChat(tMsg)
    end))
    ---公会管理按钮
    UIEvent.LuaClick(self.Btn_QueDing().gameObject, Handle(self, function()
        local tLvLimit = string.split(SteamLocalData.tab[115008][2],',')
        local tLv = tLvLimit[self.Drop_LvLimit01().value+1]
        
        local tGuildName = self.Input_GuildName01().text ~= self.GuildInfo.name and self.Input_GuildName01().text or nil
        local tNotice = self.Input_GongGao01().text ~= self.GuildInfo.notice and self.Input_GongGao01().text or nil
        local tJoinMode = self.Drop_JoinMode01().value ~= self.GuildInfo.recruitType and self.Drop_JoinMode01().value or nil
        local tJoinLv = tonumber(tLv) ~= self.GuildInfo.recruitLevelLimit and tonumber(tLv) or nil
        if tGuildName or tNotice or tJoinMode or tJoinLv then
            if (tGuildName and not self:CheckGuildName(tGuildName)) or (tNotice and not self:CheckGuildNotice(tNotice)) then
                return
            end
            ---如果有变动
            GuildControl.SendGuildManage(tGuildName,tNotice,tJoinMode,tJoinLv,function(info)
                self:RefreshMemberData(info)
            end)
        end
        self.ManagePop().gameObject:SetActive(false)
    end))
    ---退出公会
    UIEvent.LuaClick(self.OutGuild().gameObject, Handle(self, function()
        if self.IsLeader then
            if self.DismissTime > 0 then
                GuildControl.SendMemberManage(nil, 0, function()
                    self.DismissTime = GuildControl.GetDismissTime()
                    self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text51")
                end)
            else
                MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text46"),function()
                    GuildControl.SendMemberManage(nil, GuildControl.OutGuild, function()
                        self.DismissTime = GuildControl.GetDismissTime()
                        self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text53")
                    end)
                end,nil,2,nil,nil,MgrLanguageData.GetLanguageByKey("ui_guild_text47")})
            end
        else
            local tStr = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text42"), math.modf(tonumber(SteamLocalData.tab[115010][2])/3600))
            MgrUI.Pop(UID.ConfirmPop_UI,{tStr,function()
                ---成员管理
                GuildControl.SendMemberManage(PlayerControl.GetPlayerData().UID,GuildControl.OutGuild,function()
                    GuildControl.OpenGuildUI()
                end)
            end,nil,2,nil,nil,MgrLanguageData.GetLanguageByKey("ui_guild_text45")})
        end
    end))
    
    ---公会界面切换(成员列表,科技工厂,资源捐献)
    for i = 1, #self.SwitchBtn do
        UIEvent.LuaClick(self.SwitchBtn[i].btn, Handle(self, function()
            if self.CurPanelData == self.SwitchBtn[i] then
                return
            end
            self.CurPanelData.check.gameObject:SetActive(false)
            self.CurPanelData.uncheck.gameObject:SetActive(true)
            self.CurPanelData = self.SwitchBtn[i]
            self.CurPanelData.check.gameObject:SetActive(true)
            self.CurPanelData.uncheck.gameObject:SetActive(false)
            
            self:SwitchPanel(self.CurPanelData.panel)
            ---如果是捐献
            if i == 3 then
                if GuildControl.GetDonateState() == false then
                    GuildControl.SetDonateState()
                    self.SwitchBtn[3].redDot.gameObject:SetActive(GuildControl.GetDonateState() == false)
                end
            end

            if i == 1 and self.NeedRefresh then
                self.NeedRefresh = false
                GuildControl.GetGuildData(function(guildInfo)
                    self:RefreshGuildData(guildInfo)
                end)
            end
        end))
        if i == 1 then
            self.CurPanelData = self.SwitchBtn[i]
            self.CurPanelData.check.gameObject:SetActive(true)
            self.CurPanelData.uncheck.gameObject:SetActive(false)
            self:SwitchPanel(self.CurPanelData.panel)
        end
    end
    ---成员列表的弹窗按钮
    for i = 1, #self.SwitchBtn_Member do
        UIEvent.LuaClick(self.SwitchBtn_Member[i].btn.gameObject.gameObject, Handle(self, function()
            if self.SwitchBtn_Member[i].btn == self.Btn_UnionMgr() then
                self:GuildMgrUI(self.GuildInfo)
            end
            self.SwitchBtn_Member[i].pop.gameObject:SetActive(true)
        end))
        UIEvent.LuaClick(self.SwitchBtn_Member[i].mask.gameObject.gameObject, Handle(self, function()
            self.SwitchBtn_Member[i].pop.gameObject:SetActive(false)
        end))
    end
    ---升级科技
    UIEvent.LuaClick(self.Btn_ShengJi().gameObject,Handle(self,function(...)
        local nextData = GuildControl.GetNextSkillData(self.CurScience.id)
        if nextData == nil then
            return
        end
        ---如果是成员
        for i, v in pairs(self.GuildInfo.user) do
            if v.job == GuildControl.Job.member and v.id == PlayerControl.GetPlayerData().UID then
                return
            end
        end
        ---货币是否满足升级条件
        if self.CanUpgradeSci == false then
            return
        end
        GuildControl.ClubSkillReq(nextData.id,function()
            self.CurScience = nextData
            self:RefreshScience()
        end)
    end))
end
---刷新公会信息
function M:RefreshGuildData(_guildInfo)
    self.GuildMember = _guildInfo.user
    self.DeputyLeaderNum = 0
    local tOnlineNum = 0
    for i, v in pairs(self.GuildMember) do
        if v.job == GuildControl.Job.deputyLeader then
            self.DeputyLeaderNum = self.DeputyLeaderNum + 1
        end
        if v.isOnline == 1 then
            tOnlineNum = tOnlineNum + 1
        end
    end
    ---公会人数/公会人数上限
    local tLvData = GuildControl.GetLvData(_guildInfo.level)
    if tLvData then
        self.Text_MemberNum().text = #_guildInfo.user.."/"..tLvData.membernum
    else
        self.Text_MemberNum().text = #_guildInfo.user.."/-"
    end
    ---在线人数
    self.Text_OnlineNum().text = tOnlineNum
    ---公会成员列表
    self.MemberTeam().totalCount = #self.GuildMember
    self.MemberTeam():RefillCells()
    ---公会成员管理列表
    self.MgrMemberList().totalCount = #self.GuildMember
    self.MgrMemberList():RefillCells()
    ---公会申请列表
    if _guildInfo.audit then
        self.ApplyListData = _guildInfo.audit
        self.ApplyList().totalCount = #self.ApplyListData
        self.ApplyList():RefillCells()
    elseif self.ApplyList().totalCount > 0 then
        self.ApplyList().totalCount = 0
        self.ApplyList():RefillCells()
    end

    self:GuildDataInfo(_guildInfo)
end

---成员信息
function M:CellUI(_obj, _data)
    if _data.job == GuildControl.OutGuild then
        ---被踢出成员不显示
        _obj:SetActive(false)
        return
    end
    local _level = CJNUIMgr.GetSunUseName(_obj, "Text_ItemLevel"):GetComponent("TextMeshProUGUI")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_ItemName"):GetComponent("TextMeshProUGUI")
    local _job= CJNUIMgr.GetSunUseName(_obj, "Text_ItemJob"):GetComponent("TextMeshProUGUI")
    local _gongxian = CJNUIMgr.GetSunUseName(_obj, "Text_GongXian"):GetComponent("TextMeshProUGUI")
    local _online = CJNUIMgr.GetSunUseName(_obj, "Text_Online"):GetComponent("TextMeshProUGUI")
    local _jobTag = CJNUIMgr.GetSunUseName(_obj, "JobTag"):GetComponent("Image")
    local _headIcon = CJNUIMgr.GetSunUseName(_obj, "PlayerIcon"):GetComponent("Image")
    local _headFrame = CJNUIMgr.GetSunUseName(_obj, "touxiangkuang"):GetComponent("Image")
    local _profile = CJNUIMgr.GetSunUseName(_obj, "Profile")

    _level.text = MgrLanguageData.GetLanguageByKey("ui_guild_text8").." ".._data.level
    _name.text = _data.name
    _gongxian.text = _data.dedication
    _online.text = GuildControl.GetOnlineState(_data.isOnline)

    ---更新头像及头像框
    self:UpHeadUI(_data,_headIcon,_headFrame)
   
    ---根据职务不同,底色显示不同
    if _data.job == GuildControl.Job.member then
        _job.text = MgrLanguageData.GetLanguageByKey("ui_guild_text33")
        _job.color = Color(1,1,1,1)
        _jobTag.color = Color.clear
    else
        if _data.job == GuildControl.Job.deputyLeader then
            _job.text = MgrLanguageData.GetLanguageByKey("ui_guild_text32")
            _jobTag.color = Color(0.81,0.53,1,1)
        else
            _job.text = MgrLanguageData.GetLanguageByKey("ui_guild_text11")
            _jobTag.color = Color(1,0.78,0.25,1)
        end
        _job.color = Color(0,0,0.1)
    end
    ---根据自身权限，显示管理按钮
    if _data.id == PlayerControl.GetPlayerData().UID then
        self.IsLeader = false
        if _data.job == GuildControl.Job.member then
            for i = 1, #self.SwitchBtn_Member do
                self.SwitchBtn_Member[i].btn.gameObject:SetActive(false)
            end
            self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text41")
        elseif _data.job == GuildControl.Job.deputyLeader then
            self.Btn_MemberMgr().gameObject:SetActive(false)
            self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text41")
        elseif _data.job == GuildControl.Job.leader then
            if self.DismissTime > 0 then
                self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text53")
            else
                self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text51")
            end
            self.IsLeader = true
        end
    end
    ---查看玩家信息
    UIEvent.LuaClick(_profile.gameObject, Handle(self, function()
        FriendViewModel.FriendInfoREQ(_data.id)
    end))
end
---公会基础信息
function M:GuildDataInfo(_guildData)
    self.Text_name().text = _guildData.name
    self.Text_ID().text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text58"), _guildData.id)
    self.Text_level().text = _guildData.level

    for i, v in pairs(_guildData.user) do
        if v.job == GuildControl.Job.leader then
            self.Text_President2().text = v.name
            break
        end
    end
    ---收人模式
    self.Text_IntakePolicy2().text = GuildControl.GetModeByID(_guildData.recruitType)
    ---加入等级
    self.Text_JoinLevel2().text = _guildData.recruitLevelLimit
    ---公会公告
    self.Text_Shuoming().text = _guildData.notice
end
---刷新公会部分信息
function M:RefreshMemberData(_info)
    if _info.name then
        ---公会名称
        self.Text_name().text = _info.name
        self.GuildInfo.name = _info.name
    end
    if _info.recruitType then
        ---收人模式
        self.Text_IntakePolicy2().text = GuildControl.GetModeByID(_info.recruitType)
        self.GuildInfo.recruitType = _info.recruitType
    end
    if _info.recruitLevelLimit then
        ---加入等级
        self.Text_JoinLevel2().text = _info.recruitLevelLimit
        self.GuildInfo.recruitLevelLimit = _info.recruitLevelLimit
    end
    if _info.notice then
        ---公会公告
        self.Text_Shuoming().text = _info.notice
        self.GuildInfo.notice = _info.notice
    end
end
---初始化公会管理界面
function M:InitGuildMgrUI()
    local tMode = GuildControl.GetAllMode()
    local tLvLimit = string.split(SteamLocalData.tab[115008][2],',')
    
    ---添加加入条件描述
    Tools.SetDropdown(self.Drop_JoinMode01().gameObject,tMode)
    ---添加等级限制描述
    Tools.SetDropdown(self.Drop_LvLimit01().gameObject,tLvLimit)
end
---公会管理界面
function M:GuildMgrUI(_guildData)
    local tLvLimit = string.split(SteamLocalData.tab[115008][2],',')
    local tLimitID = 0
    for i = 1, #tLvLimit do
        if tLvLimit[i] == self.Text_JoinLevel2().text then
            tLimitID = i-1
            break
        end
    end
    
    ---更新默认显示
    self.Drop_JoinMode01().value = _guildData.recruitType
    ---更新默认显示
    self.Drop_LvLimit01().value = tLimitID
    
    self.Input_GuildName01().text = self.Text_name().text
    self.Text_DengJi1().text = self.Text_level().text
    self.Text_GongHuiID1().text = _guildData.id
    self.Text_HuiZhang1().text = self.Text_President2().text
    self.Input_GongGao01().text = self.Text_Shuoming().text
end
---成员管理
function M:MgrCellUI(_obj, _data)
    if _data.id == PlayerControl.GetPlayerData().UID or _data.job == GuildControl.OutGuild then
        _obj:SetActive(false)
        return
    elseif not _obj.activeSelf then
        _obj:SetActive(true)
    end
    local _level = CJNUIMgr.GetSunUseName(_obj, "Text_DengJi"):GetComponent("TextMeshProUGUI")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_MingZi"):GetComponent("TextMeshProUGUI")
    local _job= CJNUIMgr.GetSunUseName(_obj, "Text_ItemJob"):GetComponent("TextMeshProUGUI")
    local _jobTag = CJNUIMgr.GetSunUseName(_obj, "JobTag"):GetComponent("Image")
    local _headIcon = CJNUIMgr.GetSunUseName(_obj, "Img_Head"):GetComponent("Image")
    local _headFrame = CJNUIMgr.GetSunUseName(_obj, "Img_Touxiangkuang"):GetComponent("Image")
    local _btnMgr = CJNUIMgr.GetSunUseName(_obj, "MemberBtnMgr")
    local _zhuanRang = CJNUIMgr.GetSunUseName(_obj, "Btn_ZhuanRang")
    local _cheZhi = CJNUIMgr.GetSunUseName(_obj, "Btn_CheZhi")
    local _tiChu = CJNUIMgr.GetSunUseName(_obj, "Btn_TiChu")
    local _renMing = CJNUIMgr.GetSunUseName(_obj, "Btn_RenMing")

    _level.text = MgrLanguageData.GetLanguageByKey("ui_guild_text8").." ".._data.level
    _name.text = _data.name
    ---更新头像及头像框
    self:UpHeadUI(_data,_headIcon,_headFrame)
    if _data.job == GuildControl.Job.member then
        _job.text = MgrLanguageData.GetLanguageByKey("ui_guild_text33")
        _jobTag.color = Color.clear

        _renMing.gameObject:SetActive(true)
        _cheZhi.gameObject:SetActive(false)
    elseif _data.job == GuildControl.Job.deputyLeader then
        _job.text = MgrLanguageData.GetLanguageByKey("ui_guild_text32")
        _jobTag.color = Color(0.81,0.53,1,1)

        _renMing.gameObject:SetActive(false)
        _cheZhi.gameObject:SetActive(true)
    end
    ---转让会长0会员 1副会长 2会长  (除了这三个传其它退出工会)
    UIEvent.LuaClick(_zhuanRang.gameObject,Handle(self, function()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text56"),function()
            GuildControl.SendMemberManage(_data.id,2, Handle(self,self.RefreshMemberList))
        end,nil,2,nil,nil,MgrLanguageData.GetLanguageByKey("ui_guild_text57")})
    end))
    ---撤职
    UIEvent.LuaClick(_cheZhi.gameObject,Handle(self, function()
        MgrUI.Pop(UID.ConfirmPop_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text61"),function()
            GuildControl.SendMemberManage(_data.id,0, Handle(self,self.RefreshMemberList))
        end,nil,2,nil,nil,MgrLanguageData.GetLanguageByKey("ui_guild_text44")})
    end))
    ---踢出公会
    UIEvent.LuaClick(_tiChu.gameObject,Handle(self, function()
        MgrUI.Pop(UID.ConfirmPop_UI,{ MgrLanguageData.GetLanguageByKey("ui_guild_text43"),function()
            GuildControl.SendMemberManage(_data.id,GuildControl.OutGuild, Handle(self,self.RefreshMemberList))
        end,nil,2 })
    end))
    ---任命
    UIEvent.LuaClick(_renMing.gameObject,Handle(self, function()
        ---检查是否已达副会长数量上限
        local tLvData = GuildControl.GetLvData(self.GuildInfo.level)
        if tLvData and self.DeputyLeaderNum >= tLvData.vicepresidentnum then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text49"),2},true)
            return
        end
        ---任命
        MgrUI.Pop(UID.ConfirmPop_UI,{ MgrLanguageData.GetLanguageByKey("ui_guild_text62"),function()
            GuildControl.SendMemberManage(_data.id,1, Handle(self,self.RefreshMemberList))
        end,nil,2 })
    end))
end
function M:RefreshMemberList(_user)
    for i, v in ipairs(self.GuildMember) do
        if _user.job == GuildControl.Job.leader then
            if v.id == _user.id then
                v.job = _user.job
            elseif v.id == PlayerControl.GetPlayerData().UID then
                v.job = GuildControl.Job.member
            end
        else
            if v.id == _user.id then
                v.job = _user.job
                break
            end
        end
    end
    if _user.job == GuildControl.Job.deputyLeader then
        ---任命成功
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text48"),2},true)
        self.DeputyLeaderNum = self.DeputyLeaderNum + 1
    elseif _user.job == GuildControl.Job.member then
        self.DeputyLeaderNum = self.DeputyLeaderNum - 1
    elseif _user.job == GuildControl.Job.leader then
        ---转让会长后,关闭管理弹窗刷新按钮状态
        for i = 1, #self.SwitchBtn_Member do
            self.SwitchBtn_Member[i].btn.gameObject:SetActive(false)
        end
        self.MembersPop().gameObject:SetActive(false)
        self.Text_OutGuild().text = MgrLanguageData.GetLanguageByKey("ui_guild_text41")
    end
    self.MemberTeam():RefreshCells()
    self.MgrMemberList():RefreshCells()
end
---玩家申请列表
function M:ApplyCellUI(_obj, _data)
    local _level = CJNUIMgr.GetSunUseName(_obj, "Text_DengJi"):GetComponent("TextMeshProUGUI")
    local _name = CJNUIMgr.GetSunUseName(_obj, "Text_MingZi"):GetComponent("TextMeshProUGUI")
    local _agree = CJNUIMgr.GetSunUseName(_obj, "Btn_TongYi")
    local _reject = CJNUIMgr.GetSunUseName(_obj, "Btn_JuJue")
    local _headIcon = CJNUIMgr.GetSunUseName(_obj, "Img_Head"):GetComponent("Image")
    local _headFrame = CJNUIMgr.GetSunUseName(_obj, "Img_Touxiangkuang"):GetComponent("Image")

    _level.text = MgrLanguageData.GetLanguageByKey("ui_guild_text8").." ".._data.level
    _name.text = _data.name
    ---更新头像及头像框
    self:UpHeadUI(_data,_headIcon,_headFrame)
    ---申请同意按钮
    UIEvent.LuaClick(_agree.gameObject.gameObject, Handle(self, function()
        GuildControl.UserApproval(_data.id,1,self.GuildInfo.id)
    end))
    ---申请拒绝按钮
    UIEvent.LuaClick(_reject.gameObject.gameObject, Handle(self, function()
        GuildControl.UserApproval(_data.id,0,self.GuildInfo.id)
    end))
    ---查看玩家信息
    UIEvent.LuaClick(_headFrame.gameObject, Handle(self, function()
        FriendViewModel.FriendInfoREQ(_data.id)
    end))
end
---更新头像及头像框
function M:UpHeadUI(_data, _headIcon, _headFrame)
    ---如果有头像数据
    if PlayheadLocalData.tab[_data.head] then
        local typeStr = JNStrTool.strSplit("_",PlayheadLocalData.tab[_data.head].type)

        if typeStr[1] == "0" then
            if tonumber(typeStr[2]) ~= 19000 and tonumber(typeStr[2]) ~= 90000 then
                MgrRes.LoadNormalIcon(_headIcon,tonumber(typeStr[2]))

            else
                MgrRes.LoadNormalIcon(_headIcon,90000)
            end
        end
    else
        MgrRes.LoadNormalIcon(_headIcon,90000)
    end
    --加载玩家头像框
    if _data.headFrame == 0 or _data.headFrame == nil then
        MgrRes.LoadSprite(_headFrame,"Playheadicon/Touxiangkuang")
    else
        local frameName = PlayheadframeLocalData.tab[_data.headFrame][3]
        MgrRes.LoadSprite(_headFrame,"Playheadicon/" .. frameName)
    end
end

---检查公会名是否合规
function M:CheckGuildName(_name)
    if _name == "" then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text1"),1},true)
        return false
    elseif Tools.ContainSpecialChar(_name) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_qita_text94"),1},true)
        return false
    end
    
    local count = self:GetStrLen(_name)
    if count < tonumber(SteamLocalData.tab[115003][2]) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text3"),1},true)
        return false
    end
    if count > tonumber(SteamLocalData.tab[115004][2]) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text2"),1},true)
        return false
    end
    
    return true
end

---检查公会公告是否合规
function M:CheckGuildNotice(_name)
    local count = self:GetStrLen(_name)
    if count > tonumber(SteamLocalData.tab[115004][2]) then
        MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text74"),1},true)
        return false
    end
    
    return true
end

function M:GetStrLen(_str)
    local lenInByte = #_str
    local count = 0

    for i=1,lenInByte do
        local curByte = string.byte(_str, i)
        local byteCount = 0;
        if curByte>0 and curByte<=127 then
            byteCount = 1
        elseif curByte>=192 and curByte<223 then
            byteCount = 2
        elseif curByte>=224 and curByte<239 then
            byteCount = 3
        elseif curByte>=240 and curByte<=247 then
            byteCount = 4
        end

        if byteCount == 3 then
            count = count + 2
        elseif byteCount == 1 then
            count = count + 1
        end
    end
    
    return count
end

---切换界面
function M:SwitchPanel(_panel)
    if self.CurPanel == _panel then
        return
    end
    if self.CurPanel ~= nil then
        self.CurPanel.gameObject:SetActive(false)
    end
    self.CurPanel = _panel
    self.CurPanel.gameObject:SetActive(true)
end

---刷新捐献
function M:RefreshDonate()
    local arr = GuildControl.GetDonateData()
    self:RefreshDonateObj(arr[1],self.DonatePrefab1().gameObject)
    self:RefreshDonateObj(arr[2],self.DonatePrefab2().gameObject)
    ---捐献红点
    self.SwitchBtn[3].redDot.gameObject:SetActive(GuildControl.GetDonateState() == false)
end

---@param data GuildDonateData
function M:RefreshDonateObj(data,obj)
    print(self.GuildInfo)
    local textName = obj.transform:Find("Text_Name").transform:GetComponent("TextMeshProUGUI")  --捐献物品名字
    local Icon = obj.transform:GetComponent("Image")     --捐献物品图片
    local textCoinNum = obj.transform:Find("Cost").transform:Find("Text_NeedCoin").transform:GetComponent("TextMeshProUGUI")  --消耗物品文本
    local IconCoin = obj.transform:Find("Cost").transform:Find("CostIcon").transform:GetComponent("Image")     --消耗物品图片
    local donateCount = obj.transform:Find("Text_DonateCount").transform:GetComponent("TextMeshProUGUI")   --捐献次数文本
    local Btn = obj.transform:Find("Btn_Donate").gameObject    --捐献按钮
    local UnBtn = obj.transform:Find("Btn_UnDonate").gameObject    --不可捐献按钮
    ---@type ItemData
    local costItem = ItemControl.GetItemByIdAndType(tonumber(string.split(data.cost,"_")[2]),tonumber(string.split(data.cost,"_")[1]))    --消耗物品数据
    MgrRes.LoadSprite(Icon,data.icon)
    MgrRes.LoadSprite(IconCoin,costItem.icon)
    ---判断货币是否充足
    if costItem.count >= tonumber(string.split(data.cost,"_")[3]) then
        textCoinNum.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),JNStrTool.numberAbbr(tonumber(string.split(data.cost,"_")[3])),JNStrTool.numberAbbr(costItem.count))
    else
        textCoinNum.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),JNStrTool.numberAbbr(tonumber(string.split(data.cost,"_")[3])),JNStrTool.numberAbbr(costItem.count))
    end
    --判断捐献次数
    donateCount.text = MgrLanguageData.GetLanguageByKey("ui_guild_text37")..(data.maxnumber - GuildControl.GetDonateCount(data.id)).."/"..data.maxnumber
    --点击捐献
    UIEvent.LuaClick(Btn,function()
        ---捐献数量不足
        if costItem.count < tonumber(string.split(data.cost,"_")[3]) then
            return
        end
        ---捐献数量到达上限
        if GuildControl.GetDonateCount(data.id) >= data.maxnumber then
            MgrUI.Pop(UID.PopTip_UI,{MgrLanguageData.GetLanguageByKey("ui_guild_text75"),2},true)
            return
        end
        GuildControl.ClubDonateReq(data.id,function()
            ---刷新UI
            self:RefreshDonateObj(data,obj)
            
            self.NeedRefresh = true
        end)
    end)
    --按钮样式修改
    Btn:SetActive(costItem.count >= tonumber(string.split(data.cost,"_")[3]))
    UnBtn:SetActive(costItem.count < tonumber(string.split(data.cost,"_")[3]))

    local Awards = {}   --捐献奖励数据
    local root = obj.transform:Find("Content").gameObject   --捐献奖励root
    --填充奖励数据
    for k,v in pairs(string.split(data.reward,",")) do
        table.insert(Awards,{item = ItemControl.GetItemByIdAndType(tonumber(string.split(v,"_")[2]),tonumber(string.split(v,"_")[1])), num = tonumber(string.split(v,"_")[3])})
    end
    --刷新奖励UI
    for i = 1,root.transform.childCount do
        local AwardObj = root.transform:GetChild(i - 1).gameObject.transform:Find("wupin").gameObject
        local emptyObj = root.transform:GetChild(i - 1).gameObject.transform:Find("empty").gameObject
        local Frame = AwardObj.transform:Find("RewardRankImg").gameObject.transform:GetComponent("Image")
        local awardIcon = AwardObj.transform:Find("RewardIconImg").gameObject.transform:GetComponent("Image")
        local awardCount = AwardObj.transform:Find("Img_ItemCountBg").gameObject.transform:Find("ItemCountText").transform:GetComponent("TextMeshProUGUI")
        local starRoot = AwardObj.transform:Find("StarPanel").gameObject.transform:Find("ItemStarRoot").gameObject
        local starPrefab = AwardObj.transform:Find("StarPanel").gameObject.transform:Find("ItemStarPrefab").gameObject
        local redDot = AwardObj.transform:Find("RedDotIcon").gameObject
        --判断是否有数据
        if Awards[i] then
            AwardObj:SetActive(true)
            emptyObj:SetActive(false)
            --UI逻辑
            starRoot.transform.parent.gameObject:SetActive(Awards[i].item.star > 0)   --如果有星级显示星星
            if Awards[i].item.star > 0 then
                starPrefab:SetActive(true)
                Tools.ClearAllChild(starRoot)
                for j = 1, Awards[i].item.star do
                    GameObject.Instantiate(starPrefab,self.starRoot().transform)
                end
                starPrefab:SetActive(false)
            end
            MgrRes.LoadSprite(Frame,Awards[i].item.iconFrame)  --加载奖励边框
            MgrRes.LoadSprite(awardIcon,Awards[i].item.icon)   --加载奖励图片
            awardCount.text = JNStrTool.numberAbbr(Awards[i].num)     --奖励物品数量文本
            redDot:SetActive(false)   --隐藏红点
        else
            AwardObj:SetActive(false)
            emptyObj:SetActive(true)
        end
        --点击弹出奖励详情
        UIEvent.LuaClick(AwardObj,function()
            MgrUI.Pop(UID.ItemDetailPop_UI, { Awards[i].item, false, function()
            end }, true)
        end)
    end
end


---刷新科技
function M:RefreshScience()
    self:ReloadScienceData()
    self:RefreshScienceDetail(self.CurScience.id)
end

---刷新科技详情
function M:RefreshScienceDetail(id)
    ---@type GuildSkillData
    local data = GuildControl.GetSingleSkillData(id)
    ---@type GuildSkillData
    local nextData = GuildControl.GetNextSkillData(id)
    MgrRes.LoadSprite(self.Img_Science(),data.icon)   --科技图片
    self.Text_ScienceName().text = data.name          --科技名字
    ---如果是满级科技
    if data:WhetherMaxLevel() then
        self.Max().gameObject:SetActive(true)
        self.ShengJi().gameObject:SetActive(false)
    else
        self.Max().gameObject:SetActive(false)
        self.ShengJi().gameObject:SetActive(true)
        self.Text_CurLv().text = data.level
        self.Text_NextLv().text = nextData.level
    end
    self.Text_Xiaohao().text = data.text             --效果描述
    self.Text_Zuo1().text = data:GetPercentage().."%"   --当前增幅百分比
    self.Text_You1().text = nextData:GetPercentage().."%"   --下一级增幅百分比
    self.Text_NeedLv().text = MgrLanguageData.GetLanguageByKey("ui_tips_1")..nextData.openlevel     --升级需要等级
    local str = string.split(nextData.cost,"_")
    local costItem = ItemControl.GetItemByIdAndType(tonumber(str[2]),tonumber(str[1]))
    MgrRes.LoadSprite(self.JiaJuBiicon(),costItem.icon)
    local costText = CJNUIMgr.GetSunUseName(self.Xiaohao().gameObject, "Text_NeedCoin"):GetComponent("TextMeshProUGUI")
    ---判断货币是否充足
    if costItem.count >= tonumber(str[3]) then
        costText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text39"),JNStrTool.numberAbbr(tonumber(str[3])),JNStrTool.numberAbbr(costItem.count))
        self.CanUpgradeSci = true  --货币是否满足升级
    else
        costText.text = string.format(MgrLanguageData.GetLanguageByKey("ui_guild_text40"),JNStrTool.numberAbbr(tonumber(str[3])),JNStrTool.numberAbbr(costItem.count))
        self.CanUpgradeSci = false
    end

    local isMember = false
    ---如果是成员
    for i, v in pairs(self.GuildInfo.user) do
        if v.job == GuildControl.Job.member and v.id == PlayerControl.GetPlayerData().UID then
            isMember = true
            break
        end
    end
    ---是否满足升级条件
    if self.CanUpgradeSci == false or nextData == nil or isMember == true or nextData:WhetherMaxLevel() then
        self.Btn_UnUpgrade().gameObject:SetActive(true)
        self.Btn_ShengJi().gameObject:SetActive(false)
    else
        self.Btn_UnUpgrade().gameObject:SetActive(false)
        self.Btn_ShengJi().gameObject:SetActive(true)
    end
end

---刷新科技Item
function M:ReloadScienceData(offset)
    self.ScienceData = GuildControl.GetPlayerSkillData()
    Global.Sort(self.ScienceData,{"id"},true)
    if self.CurScience == nil then
        self.CurScience = self.ScienceData[1]  --当前选中的科技
    end
    self.ScienceList01().totalCount = #self.ScienceData
    if offset then
        self.ScienceList01():RefillCells(offset)
    else
        self.ScienceList01():RefreshCells()
    end
end

function M:AddEvent()
    Event.Add("RefreshGuild", Handle(self, self.RefreshGuildData))
    Event.Add("GuildChatMsg", Handle(self, self.ChatMsg))
end

function M:ChatMsg(_msgData)
    if self.TalkList == nil then
        self.TalkList = {}
    end
    table.insert(self.TalkList, _msgData)
    self.MessageList().totalCount = #self.TalkList
    self.MessageList():RefillCells(#self.TalkList)
end

function M:ChatList(_obj, _data, idx)
    local _OtherMsg = CJNUIMgr.GetSunUseName(_obj, "OtherDailog")
    local _SelfMsg = CJNUIMgr.GetSunUseName(_obj, "SelfDailog")
    local CurMsg = nil
    if _data.userid ~= PlayerControl.GetPlayerData().UID then
        self:UpdateChatMsg(_OtherMsg.gameObject, _data, false)

        _OtherMsg.gameObject:SetActive(true)
        _SelfMsg.gameObject:SetActive(false)

        CurMsg = "other"
    else
        self:UpdateChatMsg(_SelfMsg.gameObject, _data, true)

        _OtherMsg.gameObject:SetActive(false)
        _SelfMsg.gameObject:SetActive(true)

        CurMsg = "self"
    end
    _obj.gameObject:GetComponent("ChatBound"):UpdateTextSize(CurMsg)
end

function M:UpdateChatMsg(_obj, _data, _isSelf)
    local _Msg = CJNUIMgr.GetSunUseName(_obj, "Text_Liaotian"):GetComponent("TextMeshProUGUI")
    local _MsgTime = CJNUIMgr.GetSunUseName(_obj, "Text_time"):GetComponent("TextMeshProUGUI")
    local _MsgName = nil
    if not _isSelf then
        _MsgName = CJNUIMgr.GetSunUseName(_obj, "Text_mingzi"):GetComponent("TextMeshProUGUI")
    end
    local _headIcon = CJNUIMgr.GetSunUseName(_obj, "PlayerIcon"):GetComponent("Image")
    local _headFrame = CJNUIMgr.GetSunUseName(_obj, "touxiangkuang"):GetComponent("Image")
    local _emoji = CJNUIMgr.GetSunUseName(_obj, "Emoji"):GetComponent("Image")

    ---更新头像及头像框
    self:UpHeadUI(_data,_headIcon,_headFrame)
    ---消息发送的时间
    _MsgTime.text = os.date("%H:%M:%S", _data.time + (tonumber(SteamLocalData.tab[112007][2]) - Global.GetClientTimeZone()) * 3600)
    ---消息发送者的昵称
    if _MsgName then
        _MsgName = _data.name
    end
    ---检测发的是文字还是图片
    --local tImgName = self:CheckImg(_data)
    --if tImgName ~= nil then
    --  MgrRes.LoadSprite(_emoji, "Emoji/"..tImgName,function(_sprite)
    --      _emoji.gameObject:SetActive(_sprite ~= nil)
    --  end,true)
    --  return
    --end
    _Msg.gameObject:GetComponent("RectTransform").sizeDelta = self.MsgSize
    _Msg.text = _data.text
end

function M:CheckImg(_str)
    local tImgName = string.match(_str,"{img=(%w+)}")
    
    return tImgName
end

function M:OnClose()
    Event.CheckClear("RefreshGuild")
    Event.CheckClear("GuildChatMsg")
end
function M:OnBackKey()
    if not MgrUI.IsPopOpen() and MgrUI.IsShow(self.Uid) then
        Event.Remove("BackKey", Handle(self, self.OnBackKey))
        MgrUI.GoBack()
    end
end
return M