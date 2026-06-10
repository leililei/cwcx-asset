-- Code Auto Create Begin
local M = Class('BackRub_UI', UIBase)
function M:ctor()
    M.super.ctor(self)
    self.Uid = UID.BackRub_UI
    self.PathPrefab = 'ABOriginal/Prefab/Form/Form[BackRub_UI].prefab'
    self.Name = 'Form[BackRub_UI]'
    self.Layer = UILayerLv.Normal
    self.Depth = 1
    -- 没有使用组建缓存列表
    self.CC = {
        -- Image 列表
        {'Img_BG','Img_BG',2},{'Img_Fenti','Img_BG/Img_Fenti',2},{'Ui_cuozao_001','Img_BG/Ui_cuozao_001',2},{'Ui_cuozao_002','Img_BG/Ui_cuozao_002',2},{'Ui_cuozao_004','Img_BG/Ui_cuozao_004',2},{'Img_Zhezhao(shang)','Img_Zhezhao(shang)',2},{'Btn_GoMenu','UpperLeftPanel/Btn_GoMenu',2},{'Btn_Back','UpperLeftPanel/Btn_Back',2},{'Img_Fenggexian','UpperLeftPanel/Img_Fenggexian',2},{'Btn_Help','UpperLeftPanel/Btn_Help',2},{'Img_Duiwudi','Yichangdian/Img_Duiwudi',2},{'TouchBtnGroup','TouchBtnGroup',2},{'Img_Task1','Img_Task1',2},{'taskEffect','Img_Task1/taskEffect',2},{'Img_Task2','Img_Task2',2},{'taskEffect01','Img_Task2/taskEffect',2},{'Img_Task3','Img_Task3',2},{'taskEffect02','Img_Task3/taskEffect',2},{'LinghangMove','LinghangMove',2},{'Img_Linghang','LinghangMove/Img_Linghang',2},{'Xiaoyouxi','Xiaoyouxi',2},{'Img_Mask1','Xiaoyouxi/Img_Mask1',2},{'Img_Xiaoyouxi1','Xiaoyouxi/Img_Xiaoyouxi1',2},{'Img_XiaoyouxiBG','Xiaoyouxi/Img_Xiaoyouxi1/Img_XiaoyouxiBG',2},{'Img_Rousezhezhao1','Xiaoyouxi/Img_Xiaoyouxi1/Img_XiaoyouxiBG/Img_Rousezhezhao1',2},{'Img_Rousezhezhao2','Xiaoyouxi/Img_Xiaoyouxi1/Img_XiaoyouxiBG/Img_Rousezhezhao2',2},{'Img_Rousezhezhao3','Xiaoyouxi/Img_Xiaoyouxi1/Img_XiaoyouxiBG/Img_Rousezhezhao3',2},{'Img_Rousezhezhao4','Xiaoyouxi/Img_Xiaoyouxi1/Img_XiaoyouxiBG/Img_Rousezhezhao4',2},{'Img_Wangge','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge',2},{'11','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/11',2},{'12','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/12',2},{'13','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/13',2},{'14','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/14',2},{'15','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/15',2},{'16','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/16',2},{'17','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/17',2},{'18','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/18',2},{'19','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/19',2},{'21','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/21',2},{'22','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/22',2},{'23','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/23',2},{'24','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/24',2},{'25','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/25',2},{'26','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/26',2},{'27','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/27',2},{'28','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/28',2},{'29','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/29',2},{'31','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/31',2},{'32','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/32',2},{'33','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/33',2},{'34','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/34',2},{'35','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/35',2},{'36','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/36',2},{'37','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/37',2},{'38','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/38',2},{'39','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/39',2},{'41','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/41',2},{'42','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/42',2},{'43','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/43',2},{'44','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/44',2},{'45','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/45',2},{'46','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/46',2},{'47','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/47',2},{'48','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/48',2},{'49','Xiaoyouxi/Img_Xiaoyouxi1/Img_Wangge/49',2},{'Img_Feizao','Xiaoyouxi/Img_Xiaoyouxi1/Img_Feizao',2},{'Btn_Zanting','Xiaoyouxi/Img_Xiaoyouxi1/Btn_Zanting',2},{'Youxibiaoti','Xiaoyouxi/Img_Xiaoyouxi1/Youxibiaoti',2},{'Daojishi','Xiaoyouxi/Img_Xiaoyouxi1/Daojishi',2},{'Img_Daojishiquan(hei)','Xiaoyouxi/Img_Xiaoyouxi1/Daojishi/Img_Daojishiquan(hei)',2},{'Img_Daojishiquan(liang)','Xiaoyouxi/Img_Xiaoyouxi1/Daojishi/Img_Daojishiquan(liang)',2},{'Img_Paomo1','Xiaoyouxi/Img_Xiaoyouxi1/Img_Paomo1',2},{'Img_Paomo2','Xiaoyouxi/Img_Xiaoyouxi1/Img_Paomo2',2},{'Img_Paomo3','Xiaoyouxi/Img_Xiaoyouxi1/Img_Paomo3',2},{'Img_Xiaoyouxi2','Xiaoyouxi/Img_Xiaoyouxi2',2},{'Img_XiaoyouxiBG01','Xiaoyouxi/Img_Xiaoyouxi2/Img_XiaoyouxiBG',2},{'Img_Rousezhezhao101','Xiaoyouxi/Img_Xiaoyouxi2/Img_XiaoyouxiBG/Img_Rousezhezhao1',2},{'Img_Rousezhezhao201','Xiaoyouxi/Img_Xiaoyouxi2/Img_XiaoyouxiBG/Img_Rousezhezhao2',2},{'Img_Rousezhezhao301','Xiaoyouxi/Img_Xiaoyouxi2/Img_XiaoyouxiBG/Img_Rousezhezhao3',2},{'Img_Rousezhezhao401','Xiaoyouxi/Img_Xiaoyouxi2/Img_XiaoyouxiBG/Img_Rousezhezhao4',2},{'Img_Haiyangshengwu','Xiaoyouxi/Img_Xiaoyouxi2/Img_Haiyangshengwu',2},{'Btn_Zanting01','Xiaoyouxi/Img_Xiaoyouxi2/Btn_Zanting',2},{'Youxibiaoti01','Xiaoyouxi/Img_Xiaoyouxi2/Youxibiaoti',2},{'Pingfenkuang','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang',2},{'Img_Chengtiao','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Chengtiao',2},{'Img_Biaohaodi1','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi1',2},{'Img_Biaohaodi2','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi2',2},{'Img_Biaohaodi3','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi3',2},{'Img_Biaohaodi4','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi4',2},{'Img_Biaohaodi5','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi5',2},{'Img_Miss','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Miss',2},{'Img_Good','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Good',2},{'Img_Perfect','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Perfect',2},{'Background','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Background',2},{'Img_Shouicon','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Img_Shouicon',2},{'Slider_Good','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Slider_Good',2},{'Slider_Perfect','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Slider_Perfect',2},{'BackRub_Slider','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/BackRub_Slider',2},{'Handle','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Handle Slide Area/Handle',2},{'HandleAction','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao/Handle Slide Area/Handle/HandleAction',2},{'Btn_Zhuaququan','Xiaoyouxi/Img_Xiaoyouxi2/Btn_Zhuaququan',2},{'Img_Shou','Xiaoyouxi/Img_Xiaoyouxi2/Btn_Zhuaququan/Img_Shou',2},{'Img_Cishu1','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu1',2},{'Img_light1','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu1/Img_light1',2},{'Img_Cishu2','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu2',2},{'Img_light2','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu2/Img_light2',2},{'Img_Cishu3','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu3',2},{'Img_light3','Xiaoyouxi/Img_Xiaoyouxi2/Img_Cishu3/Img_light3',2},{'Img_Xianyu','Xiaoyouxi/Img_Xiaoyouxi2/Img_Xianyu',2},{'Img_Zhangyu','Xiaoyouxi/Img_Xiaoyouxi2/Img_Zhangyu',2},{'Img_Xianyu(1)','Xiaoyouxi/Img_Xiaoyouxi2/Img_Xianyu (1)',2},{'Img_Xiaoyouxi3','Xiaoyouxi/Img_Xiaoyouxi3',2},{'Img_XiaoyouxiBG02','Xiaoyouxi/Img_Xiaoyouxi3/Img_XiaoyouxiBG',2},{'Img_Rousezhezhao102','Xiaoyouxi/Img_Xiaoyouxi3/Img_XiaoyouxiBG/Img_Rousezhezhao1',2},{'Img_Rousezhezhao202','Xiaoyouxi/Img_Xiaoyouxi3/Img_XiaoyouxiBG/Img_Rousezhezhao2',2},{'Img_Rousezhezhao302','Xiaoyouxi/Img_Xiaoyouxi3/Img_XiaoyouxiBG/Img_Rousezhezhao3',2},{'Img_Rousezhezhao402','Xiaoyouxi/Img_Xiaoyouxi3/Img_XiaoyouxiBG/Img_Rousezhezhao4',2},{'Btn_Zanting02','Xiaoyouxi/Img_Xiaoyouxi3/Btn_Zanting',2},{'Youxibiaoti02','Xiaoyouxi/Img_Xiaoyouxi3/Youxibiaoti',2},{'Daojishi01','Xiaoyouxi/Img_Xiaoyouxi3/Daojishi',2},{'Img_Daojishiquan(hei)01','Xiaoyouxi/Img_Xiaoyouxi3/Daojishi/Img_Daojishiquan(hei)',2},{'Img_Daojishiquan(liang)01','Xiaoyouxi/Img_Xiaoyouxi3/Daojishi/Img_Daojishiquan(liang)',2},{'Img_Questionqipao','Xiaoyouxi/Img_Xiaoyouxi3/Img_Questionqipao',2},{'Img_Questiondi','Xiaoyouxi/Img_Xiaoyouxi3/Img_Questionqipao/Img_Questiondi',2},{'Img_Linghang(sikao)','Xiaoyouxi/Img_Xiaoyouxi3/Img_Linghang(sikao)',2},{'Img_Wenhao1','Xiaoyouxi/Img_Xiaoyouxi3/Img_Linghang(sikao)/Img_Wenhao1',2},{'Img_Wenhao2','Xiaoyouxi/Img_Xiaoyouxi3/Img_Linghang(sikao)/Img_Wenhao2',2},{'Img_Wenhao3','Xiaoyouxi/Img_Xiaoyouxi3/Img_Linghang(sikao)/Img_Wenhao3',2},{'Img_Xuanxiangqipao1','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1',2},{'Img_Selected','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Selected',2},{'Img_Xuanxiangdi','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Xuanxiangdi',2},{'Img_Xuanxiangtu','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Xuanxiangtu',2},{'Img_Cha','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Cha',2},{'Img_Gou','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Gou',2},{'Img_Xuanxiangqipao2','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2',2},{'Img_Selected01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Selected',2},{'Img_Xuanxiangdi01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Xuanxiangdi',2},{'Img_Xuanxiangtu01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Xuanxiangtu',2},{'Img_Cha01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Cha',2},{'Img_Gou01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Gou',2},{'Img_Xuanxiangqipao3','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3',2},{'Img_Selected02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Selected',2},{'Img_Xuanxiangdi02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Xuanxiangdi',2},{'Img_Xuanxiangtu02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Xuanxiangtu',2},{'Img_Cha02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Cha',2},{'Img_Gou02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Gou',2},{'Img_Xuanxiangqipao4','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4',2},{'Img_Selected03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Selected',2},{'Img_Xuanxiangdi03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Xuanxiangdi',2},{'Img_Xuanxiangtu03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Xuanxiangtu',2},{'Img_Cha03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Cha',2},{'Img_Gou03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Gou',2},{'Img_Huazhuangpin','Xiaoyouxi/Img_Xiaoyouxi3/Img_Huazhuangpin',2},{'Jiesuan','Jiesuan',2},{'Img_Mask2','Jiesuan/Img_Mask2',2},{'Img_Xiaoyouxi101','Jiesuan/Img_Xiaoyouxi1',2},{'Img_XiaoyouxiBG03','Jiesuan/Img_Xiaoyouxi1/Img_XiaoyouxiBG',2},{'Pingjiajiesuan','Jiesuan/Pingjiajiesuan',2},{'Img_S','Jiesuan/Pingjiajiesuan/Img_S',2},{'Xiaohaoshijian','Jiesuan/Xiaohaoshijian',2},{'Caijuese','Caijuese',2},{'Img_Mask3','Caijuese/Img_Mask3',2},{'Img_Lihui1','Caijuese/Img_Lihui1',2},{'Img_Lihui','Caijuese/Img_Lihui1/Img_Lihui',2},{'Img_Lihuizhezhao','Caijuese/Img_Lihui1/Img_Lihuizhezhao',2},{'Img_Juesemingdi','Caijuese/Img_Lihui1/Img_Juesemingdi',2},{'Img_Lihui2','Caijuese/Img_Lihui2',2},{'Img_Lihui01','Caijuese/Img_Lihui2/Img_Lihui',2},{'Img_Lihuizhezhao01','Caijuese/Img_Lihui2/Img_Lihuizhezhao',2},{'Img_Juesemingdi01','Caijuese/Img_Lihui2/Img_Juesemingdi',2},{'Img_Lihui3','Caijuese/Img_Lihui3',2},{'Img_Lihui02','Caijuese/Img_Lihui3/Img_Lihui',2},{'Img_Lihuizhezhao02','Caijuese/Img_Lihui3/Img_Lihuizhezhao',2},{'Img_Juesemingdi02','Caijuese/Img_Lihui3/Img_Juesemingdi',2},{'Img_Lihui4','Caijuese/Img_Lihui4',2},{'Img_Lihui03','Caijuese/Img_Lihui4/Img_Lihui',2},{'Img_Lihuizhezhao03','Caijuese/Img_Lihui4/Img_Lihuizhezhao',2},{'Img_Juesemingdi03','Caijuese/Img_Lihui4/Img_Juesemingdi',2},{'Wenti','Caijuese/Wenti',2},{'Img_Wentikuang','Caijuese/Wenti/Img_Wentikuang',2},{'Img_Sanjiao','Caijuese/Wenti/Img_Sanjiao',2},{'HeadIcon','Caijuese/Wenti/HeadIcon',2},{'Touxiangkuang','Caijuese/Wenti/HeadIcon/Touxiangkuang',2},{'linghang','Caijuese/Wenti/HeadIcon/linghang',2},{'Haogan','Haogan',2},{'Img_Mask4','Haogan/Img_Mask4',2},{'HaoganGroup','Haogan/HaoganGroup',2},{'Haoganzenjia','Haogan/HaoganGroup/Haoganzenjia',2},{'Haogandudi','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Haogandudi',2},{'Favorability','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Favorability',2},{'FavorabilitySlider','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Favorability/FavorabilitySlider',2},{'haogandudi','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Favorability/haogandudi',2},{'CenterFavorSlider','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Favorability/haogandudi/CenterFavorSlider',2},{'HaoGanItem','Haogan/HaoGanItem',2},{'Img_Shuxingicondi','Haogan/HaoGanItem/Img_Shuxingicondi',2},{'Icon','Haogan/HaoGanItem/Icon',2},{'Help','Help',2},{'Img_Mask5','Help/Img_Mask5',2},{'Img_Help','Help/Img_Help',2},{'Btn_Left','Help/Img_Help/Btn_Left',2},{'Btn_Right','Help/Img_Help/Btn_Right',2},{'Page_One','Help/PageGroup/Page_One',2},{'Image','Help/PageGroup/Page_One/Image',2},{'Page_Two','Help/PageGroup/Page_Two',2},{'Image01','Help/PageGroup/Page_Two/Image',2},{'HelpBtn_Back','Help/HelpBtn_Back',2},{'TouchBtn','TouchBtn',2},
        -- Text 列表
        {'Text_Title_EN','UpperLeftPanel/Text_Title/Text_Title_EN',3},{'Text_Duiwushu','Yichangdian/Text_Duiwushu',3},{'Text_Time','Xiaoyouxi/Img_Xiaoyouxi1/Daojishi/Text_Time',3},{'Text_Shijian','Xiaoyouxi/Img_Xiaoyouxi1/Daojishi/Text_Shijian',3},{'Text_Biaohao','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi1/Text_Biaohao',3},{'Text_Biaohao01','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi2/Text_Biaohao',3},{'Text_Biaohao02','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi3/Text_Biaohao',3},{'Text_Biaohao03','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi4/Text_Biaohao',3},{'Text_Biaohao04','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Img_Biaohaodi5/Text_Biaohao',3},{'Text_Time01','Xiaoyouxi/Img_Xiaoyouxi3/Daojishi/Text_Time',3},{'Text_Shijian01','Xiaoyouxi/Img_Xiaoyouxi3/Daojishi/Text_Shijian',3},{'Text_A','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Img_Xuanxiangdi/Text_A',3},{'Text_A01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Img_Xuanxiangdi/Text_A',3},{'Text_A02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Img_Xuanxiangdi/Text_A',3},{'Text_A03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Img_Xuanxiangdi/Text_A',3},{'Text_Xuanxiang','Caijuese/Img_Lihui1/Img_Juesemingdi/Text_Xuanxiang',3},{'Text_Xuanxiang01','Caijuese/Img_Lihui2/Img_Juesemingdi/Text_Xuanxiang',3},{'Text_Xuanxiang02','Caijuese/Img_Lihui3/Img_Juesemingdi/Text_Xuanxiang',3},{'Text_Xuanxiang03','Caijuese/Img_Lihui4/Img_Juesemingdi/Text_Xuanxiang',3},{'CurRoleFavorabilityText','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Favorability/haogandudi/CurRoleFavorabilityText',3},{'Text_Zenjiashuzhi','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Text_Zenjiashuzhi',3},{'TargetHpText','Haogan/HaoGanItem/TargetHpText',3},{'Text_MiaoShu','Help/Text_MiaoShu',3},
        -- Slider 列表
        {'Jindutiao','Xiaoyouxi/Img_Xiaoyouxi2/Jindutiao',5},
        -- Toggle 列表
        {'TouchBtn01','TouchBtn',13},
        -- TextMeshProUGUI 列表
        {'Text_Title_CN','UpperLeftPanel/Text_Title/Text_Title_CN',20},{'Text_Duiwu','Yichangdian/Text_Duiwu',20},{'Text_Biaoti','Xiaoyouxi/Img_Xiaoyouxi1/Youxibiaoti/Text_Biaoti',20},{'Text_Biaoti01','Xiaoyouxi/Img_Xiaoyouxi2/Youxibiaoti/Text_Biaoti',20},{'Text_Pingfenjilu','Xiaoyouxi/Img_Xiaoyouxi2/Pingfenkuang/Text_Pingfenjilu',20},{'Text_Biaoti02','Xiaoyouxi/Img_Xiaoyouxi3/Youxibiaoti/Text_Biaoti',20},{'Text_Timu','Xiaoyouxi/Img_Xiaoyouxi3/Img_Questionqipao/Text_Timu',20},{'Text_Answer','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao1/Text_Answer',20},{'Text_Answer01','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao2/Text_Answer',20},{'Text_Answer02','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao3/Text_Answer',20},{'Text_Answer03','Xiaoyouxi/Img_Xiaoyouxi3/Img_Xuanxiangqipao4/Text_Answer',20},{'Text_Pingjiajiesuan','Jiesuan/Pingjiajiesuan/Text_Pingjiajiesuan',20},{'Text_Xiaohaoshijian','Jiesuan/Xiaohaoshijian/Text_Xiaohaoshijian',20},{'Text_chengji','Jiesuan/Xiaohaoshijian/Text_chengji',20},{'Text_Jueseming','Caijuese/Img_Lihui1/Img_Juesemingdi/Text_Jueseming',20},{'Text_Jueseming01','Caijuese/Img_Lihui2/Img_Juesemingdi/Text_Jueseming',20},{'Text_Jueseming02','Caijuese/Img_Lihui3/Img_Juesemingdi/Text_Jueseming',20},{'Text_Jueseming03','Caijuese/Img_Lihui4/Img_Juesemingdi/Text_Jueseming',20},{'Text_Wenti','Caijuese/Wenti/Text_Wenti',20},{'Text_Duicuo','Haogan/HaoganGroup/Haoganzenjia/Text_Duicuo',20},{'Text_Haogandu','Haogan/HaoganGroup/Haoganzenjia/Haogandu/Haogandudi/Text_Haogandu',20},{'HpNameText','Haogan/HaoGanItem/HpNameText',20},
    }
end
-- Code Auto Create End
require("LocalData/ShowergamescoreLocalData")
require("LocalData/SoapLocalData")
require("LocalData/SeaanimalLocalData")
require("LocalData/SkincareLocalData")
require("LocalData/RoleattributeLocalData")
require("LocalData/TeamdexLocalData")
require("LocalData/EventgroupLocalData")
require("LocalData/SteamLocalData")
require("LocalData/RolefavorabilityLocalData")
require("LocalData/ShowerLocalData")
require("LocalData/BackparameterLocalData")
function M:OnInit()
    self.mCharacterID = 10000
    self.mGameEvents = {}
    self.mMaxCount = 0
    self.mPlayCount = 0
    self.curHeroData = nil
    self.mCaiJuese = false
    self.mGameFinish = false
    self.mTaskGroup = {}
    self.mUpdateTimer = "BackRubUpdate" --搓背更新数据计时器
    self.mAudioTimer = "BackRubAudio"   --搓背音频计时器
    self.LingHangObj = nil  --领航员Obj
    self.LingHangObjZ = nil  --领航员Obj
    ---小游戏ID
    self.mGameID = 0
    ---结算界面评价图片(1.S 2.A 3.B 4.C)
    self.ImgPingjia = {
        "BackRub/Img_Pingjias",
        "BackRub/Img_Pingjiaa",
        "BackRub/Img_Pingjiab",
        "BackRub/Img_Pingjiac",
    }
    self.GameMgr = {
        self.Img_Xiaoyouxi1(),
        self.Img_Xiaoyouxi2(),
        self.Img_Xiaoyouxi3()
    }
    self.EnterGame = {
        self.Img_Task1(), self.Img_Task2(), self.Img_Task3(),
    }
    self.mAssess = {}
    for i = 1, #ShowergamescoreLocalData.tab do
        local tCurSoreTab = ShowergamescoreLocalData.tab[i]
        self.mAssess[i] = {
            GameTabName = tCurSoreTab[2],
            Assess = string.split(tCurSoreTab[3], '|'),
            ImgAssess = string.split(tCurSoreTab[4], '|'),
            PointAssess = string.split(tCurSoreTab[5], '|')
        }
    end
    self.mAttribute = {
        [1] = { name = MgrLanguageData.GetLanguageByKey("coreattrdata_attack"), icon = "GearInfoIcon_3", value = "0" },
        [2] = { name = MgrLanguageData.GetLanguageByKey("coreattrdata_health"), icon = "GearInfoIcon_1", value = "0" },
        [3] = { name = MgrLanguageData.GetLanguageByKey("coreattrdata_support"), icon = "GearInfoIcon_8", value = "0" },
        [4] = { name = MgrLanguageData.GetLanguageByKey("backrub_ui_armor"), icon = "GearInfoIcon_4", value = "0" },
        [5] = { name = MgrLanguageData.GetLanguageByKey("coreattrdata_critical"), icon = "GearInfoIcon_5", value = "0" },
        [6] = { name = MgrLanguageData.GetLanguageByKey("backrub_ui_sidestep"), icon = "GearInfoIcon_7", value = "0" },
        [7] = { name = MgrLanguageData.GetLanguageByKey("coreattrdata_criticaldamage"), icon = "GearInfoIcon_6", value = "0" }
    }
    self.mMiaoShu = {
        [1] = { MgrLanguageData.GetLanguageByKey("backrub_ui_tips1"),
        MgrLanguageData.GetLanguageByKey("backrub_ui_tips2")},
        [2] = { MgrLanguageData.GetLanguageByKey("backrub_ui_tips3"),
        MgrLanguageData.GetLanguageByKey("backrub_ui_tips7") },
        [3] = { MgrLanguageData.GetLanguageByKey("backrub_ui_tips4"),
        MgrLanguageData.GetLanguageByKey("backrub_ui_tips5") }
    }
    self.mHelpImg = {
        [1] = 997,
        [2] = 998,
        [3] = 999
    }
    self.mJieSuanImg = {
        [1] = {"Img_JsCuoBei1", "Img_JsCuoBei2"},
        [2] = {"Img_JsHaiXian1", "Img_JsHaiXian2"},
        [3] = {"Img_JsHuFu1", "Img_JsHuFu2"}
    }
    self.mTaskEff = {
        self.taskEffect(),self.taskEffect01(),self.taskEffect02()
    }

    ---添加搓澡音频
    MgrSound.AddCue("Audio/common/shower.acb")

    MgrSound.PlayBGM("home_showerBGM_1",1,nil,true)

    CMgrCamera.Instance:SetSmallGameMouseRange(self.Img_Xiaoyouxi1().gameObject)

    ---初始化搓背变量
    self:InitTakeBathData()
    ---初始化海鲜变量
    self:InitSeafoodData()
    ---初始化护肤品变量
    self:InitSkincare()

    self:InitGuessRole()
    ---点击事件
    self:OnClick()
    ---隐藏UI
    self:OnHideUI()
    -----初始化帮助界面
    --self:InitHelpUI()
    ---领航员动画    
    self:CreateLingHang()
    self:CreateLingHangZ()
    self.LingHangObj.gameObject:SetActive(false)
    self.LinghangMove().gameObject:GetComponent("FindPath"):RoleMove(Handle(self, self.RoleMoveBack))
    self.LinghangMove().gameObject:GetComponent("FindPath"):ChangeSpine(Handle(self, self.ChangeSpineBack))
    ---序列化请求
    local bytes = assert(pb.encode('PBClient.ClientGetGameInfoREQ', { rev = "" }))
    MgrNet.SendReq(MID.CLIENT_GET_GAME_INFO_REQ, bytes, 0, nil, Handle(self, self.GameInfoAck), Handle(self, self.GameInfoNTF))
    
    Event.Add("LinghangVisible",function()
        self:SetLinghangVisible(true)
    end)
    ---修改点击特效
    self:RegisterClickEffect()
    Event.Add("BackRubClickEffect",Handle(self,self.RegisterClickEffect))
    Event.Add("BackKey", Handle(self, self.OnBackKey))
end

function M:RegisterClickEffect()
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/Ui_cuozao_dj.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end

function M:OnBackKey()
    local isXiaoyouxi = self.Xiaoyouxi().gameObject.activeSelf
    local isImg_Xiaoyouxi1 = self.Img_Xiaoyouxi1().gameObject.activeSelf
    local isImg_Xiaoyouxi2 = self.Img_Xiaoyouxi2().gameObject.activeSelf
    local isImg_Xiaoyouxi3 = self.Img_Xiaoyouxi3().gameObject.activeSelf
    --local isHelp = self.Help().gameObject.activeSelf
    local isJiesuan = self.Jiesuan().gameObject.activeSelf
    if not MgrUI.IsPopOpenOutSelf(self.Uid.Name)then
        --Event.Remove("BackKey", Handle(self, self.OnBackKey))
        if isJiesuan then
            if self.mGameFinish then
                self:CreateHDRole()
                self.Caijuese().gameObject:SetActive(true)
                for i = 1, #self.EnterGame do
                    self.EnterGame[i].gameObject:SetActive(false)
                end
            else
                self:SetLinghangVisible(true)
            end
            self.Jiesuan().gameObject:SetActive(false)
            return
        end
        if isXiaoyouxi then
            if isImg_Xiaoyouxi1 then
                MgrTimer.Cancel(self.mUpdateTimer)
                self:OnHideGame(false)
                self:SetLinghangVisible(true)
                return
            end

            if isImg_Xiaoyouxi2 then
                self:OnHideGame(false)
                self:SetLinghangVisible(true)
                return
            end

            if isImg_Xiaoyouxi3 then
                self:OnHideGame(false)
                self:SetLinghangVisible(true)
                return
            end
            return
        end

        if isHelp then
            --self.Help().gameObject:SetActive(false)
            local tStr = string.format("BR_Help_%d_%d", PlayerControl.GetPlayerData().UID, self.mGameID)
            UnityEngine.PlayerPrefs.SetInt(tStr, 1)

            self:OnClickGameID()
            return
        end
        self:OnBackClick()
    end
end

function M:OnShowFinish()

end

function M:GameInfoAck(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetGameInfoACK', buffer))
    if tab.errNo ~= 0 then
        print(tab)
    end
end

function M:GameInfoNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientGetGameInfoNTF', buffer))
    self.mMaxCount = tab.maxCount
    self.mPlayCount = tab.count
    self.mCharacterID = tab.roleID
    self.mGameEvents = tab.events
    self.mCaiJuese = tab.answer == 1
    
    local tGameGroup = {}
    if self.mGameEvents ~= nil then
        for i = 1, #self.mGameEvents do
            tGameGroup[i] = EventgroupLocalData.tab[self.mGameEvents[i]][3]
        end
    end
    RoleCardViewModel.GetRoleByID(self.mCharacterID)
    self.curHeroData = RoleCardViewModel.CurrentHero

    self.Text_Duiwushu().text = string.format("<color=#ffcb18>%d</color> / %d", self.mMaxCount - tab.count, self.mMaxCount)
    self:CreateTaskBtn(tGameGroup)
    ---创建搓背动画
    self:CreateRoleSpin()
    ---人物好感数据
    self:RoleFavorList()
    ---初始化人物音频
    self:InitRoleAudio()
    ---初始特效切换
    if self.mMaxCount == tab.count then
        self.Ui_cuozao_001().gameObject:SetActive(false)
        self.Ui_cuozao_002().gameObject:SetActive(false)
        self.Ui_cuozao_004().gameObject:SetActive(true)
    else
        self.Ui_cuozao_001().gameObject:SetActive(true)
        self.Ui_cuozao_002().gameObject:SetActive(true)
        self.Ui_cuozao_004().gameObject:SetActive(false)
    end
    ---进入搓背界面音频
    MgrTimer.AddDelay("BackRubAudioDelay", 0.5, function()
        MgrSound.PlayRole(self.mEnterAudio,nil,nil,false,0,0,"BackRubAucio")
    end, nil
    )
end

function M:ChangeSpineBack (isBack)
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"walk",true)
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObjZ,"walk",true)
        ---肥皂滑动的音效
        MgrSound.PlayEffect("home_shower_8",1,0,true,0,0,"showerLoop")
        if isBack then
           self.LingHangObj.gameObject:SetActive(isBack)
           self.LingHangObjZ.gameObject:SetActive(not isBack)
        else
            self.LingHangObj.gameObject:SetActive(isBack)
            self.LingHangObjZ.gameObject:SetActive(not isBack)
        end
end

function M:RoleMoveBack(_isMove)
    if _isMove then
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"walk",true)
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObjZ,"walk",true)
        ---肥皂滑动的音效
        MgrSound.PlayEffect("home_shower_8",1,0,true,0,0,"showerLoop")
    else
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"idle",true)
        CMgrSpine.Instance:SetSpineAnimation(self.LingHangObjZ,"idle",true)
        MgrSound.Stop(2,"showerLoop",true)
    end
end
---搓背小游戏
---初始化搓背变量
function M:InitTakeBathData()
    self.mRoad = {}
    self.mWeight = 0
    self.mWanggeImg = {}
    self.mRoadData = {}

    self.mHitID = 1
    self:Img_Feizao().gameObject:GetComponent("ItemDrag"):BindHit(Handle(self, self.HitCallBack))
    self:Img_Feizao().gameObject:GetComponent("ItemDrag"):DragCall(Handle(self, self.DragCallBack))

    local tWangge = self.Img_Wangge().transform
    for i = 0, tWangge.childCount - 1 do
        self.mWanggeImg[tonumber(tWangge:GetChild(i).name)] = tWangge:GetChild(i).gameObject:GetComponent("CanvasGroup")
    end

    --self:ResetTakeBGame()
    --MgrTimer.Cancel(self.mUpdateTimer)
    --self:OnHideGame(false)
end
function M:HitCallBack(_hitObj)
    if tonumber(_hitObj.name) == self.mRoad[self.mHitID] then
        if self.mHitID == #self.mRoad then
            local takeTime = self.mRoadData[3] - tonumber(self.clock.text)
            local tPingjia = self.mAssess[1].ImgAssess[4]
            local tPoint = self.mAssess[1].PointAssess[4]
            local tWinState = 1
            for i = 1, #self.mAssess[1].Assess do
                if takeTime <= tonumber(self.mAssess[1].Assess[i]) then
                    takeTime = tonumber(self.mAssess[1].Assess[i])
                    tPingjia = self.mAssess[1].ImgAssess[i]
                    tPoint = self.mAssess[1].PointAssess[i]
                    if i ~= 1 then
                        tWinState = 2
                    end
                    break
                end
            end
            local tStr =  string.format(MgrLanguageData.GetLanguageByKey("backrub_ui_tips6"), takeTime)
            self:JiesuanEvent(tStr, tPingjia, tPoint, tWinState)
        end
        self.mHitID = self.mHitID + 1
    else
        self:JiesuanEvent(MgrLanguageData.GetLanguageByKey("backrub_ui_shower_tips1"), self.mAssess[1].ImgAssess[4], self.mAssess[1].PointAssess[4], 2)
    end
end
function M:DragCallBack(_isDrag)
    if _isDrag then
        ---肥皂滑动的音效
        MgrSound.PlayEffect("home_shower_4",1,0,true,0,0,"showerLoop")
    else
        MgrSound.Stop(2,"showerLoop",true)
    end
end
function M:CreateRoad()
    self.mRoad = {}
    self.mRoadData = {}
    if self.mWeight == 0 then
        for k, v in pairs(SoapLocalData.tab) do
            self.mWeight = self.mWeight + v[4]
        end
    end
    local tRandN = math.random(1, self.mWeight)
    local temp = 0
    for k, v in pairs(SoapLocalData.tab) do
        temp = temp + v[4]
        if tRandN <= temp then
            self.mRoadData = v
            break
        end
    end
    local tNodeGroup = string.split(self.mRoadData[2], '|')
    for i = 1, #tNodeGroup - 1 do
        self:RoadLine(tonumber(tNodeGroup[i]), tonumber(tNodeGroup[i + 1]))
    end
    self.clock.text = self.mRoadData[3]
    self.clock.gameObject:GetComponent("TextCountDown").RemainingTime = self.mRoadData[3]
end
---从右开始,逆时针计算最短路径
function M:RoadLine(_pos1, _pos2)
    if #self.mRoad == 0 then
        self.mRoad[1] = _pos1
    end

    local tPos1X = _pos1 % 10
    local tPos1Y = math.floor(_pos1 / 10)
    local tPos2X = _pos2 % 10
    local tPos2Y = math.floor(_pos2 / 10)
    local tLenth = 0
    local tCurDir = 1
    for i = 1, 4 do
        if i == 1 and tPos1X < 9 then
            tLenth = math.abs(tPos1X + 1 - tPos2X) + math.abs(tPos1Y - tPos2Y)
        elseif i == 2 and tPos1Y > 1 then
            if tLenth > math.abs(tPos1X - tPos2X) + math.abs(tPos1Y - 1 - tPos2Y) then
                tLenth = math.abs(tPos1X - tPos2X) + math.abs(tPos1Y - 1 - tPos2Y)
                tCurDir = i
            end
        elseif i == 3 and tPos1X > 1 then
            if tLenth > math.abs(tPos1X - 1 - tPos2X) + math.abs(tPos1Y - tPos2Y) then
                tLenth = math.abs(tPos1X - 1 - tPos2X) + math.abs(tPos1Y - tPos2Y)
                tCurDir = i
            end
        elseif i == 4 and tPos1Y < 4 then
            if tLenth > math.abs(tPos1X - tPos2X) + math.abs(tPos1Y + 1 - tPos2Y) then
                tLenth = math.abs(tPos1X - tPos2X) + math.abs(tPos1Y + 1 - tPos2Y)
                tCurDir = i
            end
        end
    end
    local tpos = _pos1
    while tpos ~= _pos2 do
        if tCurDir == 1 then
            if tPos1X ~= tPos2X then
                tPos1X = tPos1X + 1
            elseif tPos1Y > tPos2Y then
                tPos1Y = tPos1Y - 1
            elseif tPos1Y < tPos2Y then
                tPos1Y = tPos1Y + 1
            end
        elseif tCurDir == 2 then
            if tPos1Y ~= tPos2Y then
                tPos1Y = tPos1Y - 1
            elseif tPos1X > tPos2X then
                tPos1X = tPos1X - 1
            elseif tPos1X < tPos2X then
                tPos1X = tPos1X + 1
            end
        elseif tCurDir == 3 then
            if tPos1X ~= tPos2X then
                tPos1X = tPos1X - 1
            elseif tPos1Y > tPos2Y then
                tPos1Y = tPos1Y - 1
            elseif tPos1Y < tPos2Y then
                tPos1Y = tPos1Y + 1
            end
        else
            if tPos1Y ~= tPos2Y then
                tPos1Y = tPos1Y + 1
            elseif tPos1X > tPos2X then
                tPos1X = tPos1X - 1
            elseif tPos1X < tPos2X then
                tPos1X = tPos1X + 1
            end
        end
        tpos = tPos1Y * 10 + tPos1X
        self.mRoad[#self.mRoad + 1] = tpos
    end
end
function M:ResetTakeBGame()
    self:Img_Feizao().gameObject:GetComponent("ItemDrag"):Reset()
    self.clock = self.Text_Shijian()
    self.mRoad = {}
    self.mHitID = 1
    self:Img_Feizao().transform.localPosition = Vector3(-693, 969, 0)
    self.clock.gameObject:GetComponent("TextCountDown").StartCount = false
    for i, v in pairs(self.mWanggeImg) do
        v.alpha = 0
    end
    self:CreateRoad()
    local n = 1
    MgrTimer.AddRepeat(self.mUpdateTimer, 0.1, function()
        if self.mWanggeImg[self.mRoad[n]].alpha == 1 then
            n = n + 1
            if n > #self.mRoad then
                MgrTimer.Cancel(self.mUpdateTimer)
                ---将肥皂放到起始点
                self:Img_Feizao().transform.localPosition = self.mWanggeImg[self.mRoad[1]].transform.localPosition

                self.clock.gameObject:GetComponent("TextCountDown").StartCount = true
                return
            end
        end
        self.mWanggeImg[self.mRoad[n]].alpha = self.mWanggeImg[self.mRoad[n]].alpha + 0.25
    end, -1, nil)
end
---抓海洋生物小游戏
---初始化海鲜变量
function M:InitSeafoodData()
    ---控制指针左右移动
    self.mJindutiao = self.Jindutiao()
    self.mSliderMove = self.mJindutiao.gameObject:GetComponent("SliderMove")
    self.isLeft = false
    self.mSpeed = 0
    self.mSeafoodID = 0
    self.mHandleAction = self.HandleAction()
    self.mHandleAction.gameObject:GetComponent("CanvasGroup").alpha = 0
    self.isRefresh = false
    self.SpineObj = nil
    self.HeadSpinObj = nil
    ---控制抓取按鈕响应
    self.isCatched = false
    ---权重
    self.mTotleNum = 0
    ---判定范围的图片
    self.mSliderGroup = {}
    ---判定范围
    self.mRange = {}
    self.tNote = {}
    self.pingfen = {}
    ---记分板
    self.ImgNoteTab = {
        self.Text_Biaohao(),
        self.Text_Biaohao01(),
        self.Text_Biaohao02(),
        --self.Text_Biaohao03(),
        --self.Text_Biaohao04()
    }
    ---图片和分数
    self.ImgPingfen = {
        [1] = { self.Img_Miss(), 0, "BackRub/Img_Miss" },
        [2] = { self.Img_Good(), 1, "BackRub/Img_Good" },
        [3] = { self.Img_Perfect(), 2, "BackRub/Img_Perfect" },
    }
    self.ImgTimes = {
        Background = { self.Img_Cishu1(), self.Img_Cishu2(), self.Img_Cishu3() },
        LightPoint = { self.Img_light1(), self.Img_light2(), self.Img_light3() }
    }
    ---抓海鲜按钮
    UIEvent.LuaClick(self.Btn_Zhuaququan().gameObject, Handle(self, self.CatchSeafood))
end
---随机一个海鲜的ID
function M:RandomSeafood()
    if self.mTotleNum == 0 then
        for k, v in pairs(SeaanimalLocalData.tab) do
            self.mTotleNum = self.mTotleNum + v[6]
        end
    end
    local tRandN = math.random(1, self.mTotleNum)
    local temp = 0
    for k, v in pairs(SeaanimalLocalData.tab) do
        temp = temp + v[6]
        if tRandN <= temp then
            self.mSeafoodID = k
            break
        end
    end

    for i = 1, #self.ImgTimes.Background do
        if SeaanimalLocalData.tab[self.mSeafoodID][2 + i] == "0" then
            self.ImgTimes.Background[i].gameObject:SetActive(false)
        else
            self.ImgTimes.Background[i].gameObject:SetActive(true)
            self.ImgTimes.LightPoint[i].gameObject:SetActive(true)
        end
    end
    ---海洋生物spine
    if self.SpineObj ~= nil then
        GameObject.Destroy(self.SpineObj)
    end
    if self.HeadSpinObj ~= nil then
        GameObject.Destroy(self.HeadSpinObj)
    end
    local tSpinName = "idle_b"
    if self.mSeafoodID ~= 1000 then
        tSpinName = "idle_r"
    end
    MgrRes.LoadWatchAuto(self.Img_Haiyangshengwu().gameObject, SeaanimalLocalData.tab[self.mSeafoodID][2], 0, -100, 1, tSpinName, function(obj)
        self.SpineObj = obj
    end)
end
---生成抓取范围
function M:CreateJDT()
    self.mRange = {}
    self.mSpeed = SeaanimalLocalData.tab[self.mSeafoodID][7]
    self.mSliderMove:SetSpeed(self.mSpeed)
    local tBaseLen = self.BackRub_Slider().transform.rect.width
    for i = 1, #self.ImgTimes.Background do
        if SeaanimalLocalData.tab[self.mSeafoodID][2 + i] == "0" then
            if #self.mSliderGroup >= i then
                self.mSliderGroup[i].GoodObj.gameObject:SetActive(false)
            end
        else
            local tStr = string.split(SeaanimalLocalData.tab[self.mSeafoodID][2 + i], '|')
            local tLen = string.split(tStr[1], ',')
            local tPos = string.split(tStr[2], ',')
            local tPos = math.random(tPos[1], tPos[2])
            if #self.mSliderGroup < i then
                local tGood = GameObject.Instantiate(self.Slider_Good().gameObject, self.BackRub_Slider().gameObject.transform, false)
                tGood.transform.sizeDelta = Vector2(tBaseLen * tonumber(tLen[2]) / 100, self.BackRub_Slider().transform.rect.height)
                tGood.transform.localPosition = Vector3(tBaseLen * tonumber(tPos) / 100, 0, 0)

                local tPerfect = GameObject.Instantiate(self.Slider_Perfect().gameObject, tGood.gameObject.transform, false)
                tPerfect.transform.sizeDelta = Vector2(tBaseLen * tonumber(tLen[1]) / 100, self.BackRub_Slider().transform.rect.height)
                tPerfect.transform.localPosition = Vector3(tGood.transform.rect.center.x, 0, 0)

                tGood.gameObject:SetActive(true)
                tPerfect.gameObject:SetActive(true)
                table.insert(self.mSliderGroup, { GoodObj = tGood, PerfectObj = tPerfect })
            else
                self.mSliderGroup[i].GoodObj.gameObject:SetActive(true)
                self.mSliderGroup[i].PerfectObj.gameObject:SetActive(true)
                self.mSliderGroup[i].GoodObj.transform.sizeDelta = Vector2(tBaseLen * tonumber(tLen[2]) / 100, self.BackRub_Slider().transform.rect.height)
                self.mSliderGroup[i].GoodObj.transform.localPosition = Vector3(tBaseLen * tonumber(tPos) / 100, 0, 0)

                self.mSliderGroup[i].PerfectObj.transform.sizeDelta = Vector2(tBaseLen * tonumber(tLen[1]) / 100, self.BackRub_Slider().transform.rect.height)
            end
            table.insert(self.mRange, { GoodMin = tPos, GoodMax = tPos + tonumber(tLen[2]), PerfectMin = tPos + (tonumber(tLen[2]) - tonumber(tLen[1])) * 0.5, PerfectMax = tPos + (tonumber(tLen[2]) + tonumber(tLen[1])) * 0.5 })
        end
    end
end
---抓海鲜
function M:CatchSeafood()
    if self.isCatched then
        return
    end
    local isJinru = false
    for i = 1, #self.mRange do
        --UnityEngine.Debug.Log("self.mRange["..i.."].PerfectMin："..self.mRange[i].PerfectMin)
        --UnityEngine.Debug.Log("self.mRange["..i.."].PerfectMax："..self.mRange[i].PerfectMax)
        --UnityEngine.Debug.Log("self.mRange["..i.."].GoodMin："..self.mRange[i].GoodMin)
        --UnityEngine.Debug.Log("self.mRange["..i.."].GoodMax："..self.mRange[i].GoodMax)

        if self.mJindutiao.value >= self.mRange[i].PerfectMin and self.mJindutiao.value <= self.mRange[i].PerfectMax then
            ---Perfect区间
            self.tNote[#self.tNote + 1] = 4
            isJinru = true
            ---Perfect判定音效
            MgrSound.PlayEffect("home_shower_5",1,0,false,0,0,"shower")
            break
        elseif self.mJindutiao.value >= self.mRange[i].GoodMin and self.mJindutiao.value <= self.mRange[i].GoodMax then
            ---Good区间
            self.tNote[#self.tNote + 1] = 2
            isJinru = true
            ---Good判定音效
            MgrSound.PlayEffect("home_shower_6",1,0,false,0,0,"shower")
            break
        end
    end
    if not isJinru then
        ---Miss区间
        self.tNote[#self.tNote + 1] = 1
        ---Miss判定音效
        MgrSound.PlayEffect("home_shower_7",1,0,false,0,0,"shower")
    end
    self.ImgTimes.LightPoint[#self.mRange + 1 - #self.tNote].gameObject:SetActive(false)
    --UnityEngine.Debug.Log("self.mJindutiao.value："..self.mJindutiao.value)
    UnityEngine.Debug.Log("点击获得：" .. self.tNote[#self.tNote] .. "点")
    ---总结一把的成绩
    if #self.tNote >= #self.mRange then
        local tNum = 0
        for i = 1, #self.tNote do
            tNum = bit2._or(tNum, self.tNote[i])
        end
        if bit2._or(tNum, 1) == tNum then
            self.pingfen[#self.pingfen + 1] = 1
        elseif bit2._or(tNum, 2) == tNum then
            self.pingfen[#self.pingfen + 1] = 2
        else
            self.pingfen[#self.pingfen + 1] = 3
        end
        self:RefreshNote()
        --if #self.pingfen >= #self.ImgNoteTab then
        --    ---总结抓海鲜成绩
        --    self:SeafoodCheckOut()
        --else
        --    ---刷新海鲜
        --    self:RefreshSeafoodData()
        --end
        self.isRefresh = true
        --else
        --    ---点击后立刻刷新进度条的位置
        --    ---生成抓取范围和指针速度
        --    self:CreateJDT()
        MgrRes.LoadWatchAuto(self.Img_Haiyangshengwu().gameObject, 1000006, 0, -100, 1, "grab2", function(obj)
            self.HeadSpinObj = obj
        end)
    end

    self.isCatched = true
    self.mSliderMove:SetStop(true)
    ---点击后延时处理
    MgrTimer.AddDelay("BackRubRefresh", 1, function()
        UnityEngine.Debug.Log("点击刷新")
        self.isCatched = false
        self.mJindutiao.value = 0
        self.mSliderMove:SetStop(false)
        if not self.isRefresh then
            ---点击后延时刷新进度条的位置
            ---生成抓取范围和指针速度
            self:CreateJDT()
        else
            if #self.pingfen >= #self.ImgNoteTab then
                ---总结抓海鲜成绩
                self:SeafoodCheckOut()
            else
                ---刷新海鲜
                self:RefreshSeafoodData()
            end
        end
        self.isRefresh = false
    end, nil)

    local tHandleAni = self.mHandleAction.gameObject:GetComponent("CanvasGroup")
    tHandleAni.alpha = 1
    self.mHandleAction.transform.localScale = Vector3.one
    MgrTimer.AddRepeat(self.mUpdateTimer, 0, function()
        tHandleAni.alpha = tHandleAni.alpha - 0.02
        self.mHandleAction.transform.localScale = Vector3(self.mHandleAction.transform.localScale.x + 0.02, self.mHandleAction.transform.localScale.y + 0.02, self.mHandleAction.transform.localScale.z)
        if tHandleAni.alpha == 0 then
            MgrTimer.Cancel(self.mUpdateTimer)
        end
    end, -1, nil)
end
---刷新记分板
function M:RefreshNote()
    local tNoteId = #self.pingfen
    local tImgId = self.pingfen[tNoteId]
    local tImgNoteTab = self.ImgNoteTab[tNoteId]
    if tNoteId > #self.ImgNoteTab or tImgId > #self.ImgPingfen then
        return
    end
    if tImgNoteTab.transform.childCount ~= 0 then
        local tpingjia = tImgNoteTab.transform:GetChild(0).gameObject
        MgrRes.LoadSprite(tpingjia:GetComponent("Image"), self.ImgPingfen[tImgId][3])
        tpingjia:GetComponent("Image"):SetNativeSize()
        tpingjia:SetActive(true)
    else
        local tImg = GameObject.Instantiate(self.ImgPingfen[tImgId][1].gameObject, tImgNoteTab.gameObject.transform, false)
        tImg.transform.localPosition = Vector3(-50, 0, 0)
        tImg.gameObject:SetActive(true)
    end
end
---刷新海鲜
function M:RefreshSeafoodData()
    self.tNote = {}
    ---随机一个海鲜的ID
    self:RandomSeafood()
    ---生成抓取范围和指针速度
    self:CreateJDT()
end
function M:ResetSeafoodGame()
    self.mJindutiao.value = 0
    self.pingfen = {}
    for i = 1, #self.ImgNoteTab do
        if self.ImgNoteTab[i].transform.childCount ~= 0 then
            self.ImgNoteTab[i].transform:GetChild(0).gameObject:SetActive(false)
        end
    end
    self:RefreshSeafoodData()
end
---总结抓海鲜成绩
function M:SeafoodCheckOut()
    local tPingfen = 0
    for i = 1, #self.pingfen do
        local tPingfenId = self.pingfen[i]
        tPingfen = tPingfen + self.ImgPingfen[tPingfenId][2]
    end

    local tPingjia = self.mAssess[2].ImgAssess[4]
    local tPoint = self.mAssess[2].PointAssess[4]
    local tWinState = 1
    for i = 1, #self.mAssess[2].Assess do
        if tPingfen <= tonumber(self.mAssess[2].Assess[i]) then
            tPingjia = self.mAssess[2].ImgAssess[i]
            tPoint = self.mAssess[2].PointAssess[i]
            if i ~= 4 then
                tWinState = 2
            end
            break
        end
    end
    self:JiesuanEvent(tPingfen, tPingjia, tPoint, tWinState)
end
---挑选护肤品小游戏
---初始化护肤品变量
function M:InitSkincare()
    self.Btn_Answers = {
        self.Img_Xuanxiangqipao1(),
        self.Img_Xuanxiangqipao2(),
        self.Img_Xuanxiangqipao3(),
        self.Img_Xuanxiangqipao4()
    }
    self.Img_Answers = {
        self.Img_Xuanxiangtu(),
        self.Img_Xuanxiangtu01(),
        self.Img_Xuanxiangtu02(),
        self.Img_Xuanxiangtu03(),
    }
    self.Str_Answers = {
        self.Text_Answer(),
        self.Text_Answer01(),
        self.Text_Answer02(),
        self.Text_Answer03(),
    }
    self.Img_Selecteds = {
        self.Img_Selected(),
        self.Img_Selected01(),
        self.Img_Selected02(),
        self.Img_Selected03(),
    }
    self.Img_Chas = {
        self.Img_Cha(),
        self.Img_Cha01(),
        self.Img_Cha02(),
        self.Img_Cha03(),
    }
    self.Img_Gous = {
        self.Img_Gou(),
        self.Img_Gou01(),
        self.Img_Gou02(),
        self.Img_Gou03(),
    }
    self.currAnswerNum = 1
    self.mRealAnswer = {}
    self.mAnswerGroup = {}
    self.mSuccessNum = 0    --成功的次数
    self.mSearhAnswerID = 0 --正确答案的ID
    self.IsSelect = false
    
    ---护肤品按钮(答题)
    for i = 1, #self.Btn_Answers do
        local tSelectID = i
        UIEvent.LuaClick(self.Btn_Answers[i].gameObject, function()
            if self.IsSelect then
                return  
            end
            self.IsSelect = true
            if self.mAnswerGroup[tSelectID][self.mSearhAnswerID] == self.mRealAnswer then
                self.mSuccessNum = self.mSuccessNum + 1
            end
            self:SelectedRefresh(tSelectID)
            ---点击冒泡音效
            MgrSound.PlayEffect("home_shower_3",1,0,false,0,0,"shower")
            --更新当前到第几题
            self.currAnswerNum = self.currAnswerNum + 1
            if self.currAnswerNum > 3 then
                local tWinState = 1
                if self.mSuccessNum < 3 then
                    tWinState = 2
                end
                MgrTimer.AddDelay("JiesuanEvent", 1, function()
                    self:JiesuanEvent(self.mSuccessNum, self.mAssess[3].ImgAssess[self.mSuccessNum + 1], self.mAssess[3].PointAssess[self.mSuccessNum + 1], tWinState)
                end, nil)
                return
            end
            ---刷新问题
            MgrTimer.AddDelay("RefreshQA", 1, function()
                self:RefreshQA()
                self.IsSelect = false
            end, nil)
        end)
    end
end
---选择答案时显示选中和问题对错
function M:SelectedRefresh(index)
    self.Img_Selecteds[index].gameObject:SetActive(true)
    for i = 1, #self.Img_Selecteds do
        if self.mAnswerGroup[i][self.mSearhAnswerID] == self.mRealAnswer then
            self.Img_Gous[i].gameObject:SetActive(true)
        else
            self.Img_Chas[i].gameObject:SetActive(true)
        end
    end
end
---刷新问题
function M:RefreshQA()
    local tSkincareTab = SkincareLocalData.tab[self.mCharacterID]
    local tRoleAttTab = RoleattributeLocalData.tab[self.mCharacterID]
    local tQuestion = tSkincareTab[2]
    if self.currAnswerNum == 1 then
        self.mSearhAnswerID = tonumber(tSkincareTab[5])
        self.mAnswerGroup = self:RandomSelect(self.mCharacterID)
        self.mRealAnswer = tRoleAttTab[self.mSearhAnswerID]
        ---刷新选项
        for i = 1, #self.Img_Answers do
            self.Img_Answers[i].gameObject:SetActive(false)
            self.Str_Answers[i].gameObject:SetActive(true)
            self.Str_Answers[i].text = self.mAnswerGroup[i][self.mSearhAnswerID]
        end
    elseif self.currAnswerNum == 2 then
        tQuestion = tSkincareTab[3]

        self.mSearhAnswerID = tonumber(tSkincareTab[6])
        self.mAnswerGroup = self:RandomSelect(self.mCharacterID)
        self.mRealAnswer = tRoleAttTab[self.mSearhAnswerID]
        for i = 1, #self.Img_Answers do
            self.Img_Answers[i].gameObject:SetActive(true)
            self.Str_Answers[i].gameObject:SetActive(false)
            MgrRes.LoadSprite(self.Img_Answers[i], "Attribute/" .. self.mAnswerGroup[i][self.mSearhAnswerID])
        end
    else
        tQuestion = tSkincareTab[4]
        local tCurCharacter = self.mCharacterID
        --for i = 1, #TeamdexLocalData.tab do
        --    if tonumber(tRoleAttTab[56]) == TeamdexLocalData.tab[i][2] then
        --        local tTeamdex = TeamdexLocalData.tab[i]
        --        local tSplit = string.split(tTeamdex[4], ',')
        --        local tId = math.random(1, #tSplit)
        --        tCurCharacter = tonumber(tSplit[tId])
        --        break
        --    end
        --end

        self.mSearhAnswerID = tonumber(tSkincareTab[7])
        self.mAnswerGroup = self:RandomSelect(tCurCharacter)
        self.mRealAnswer = RoleattributeLocalData.tab[tCurCharacter][self.mSearhAnswerID]
        for i = 1, #self.Img_Answers do
            self.Img_Answers[i].gameObject:SetActive(false)
            self.Str_Answers[i].gameObject:SetActive(true)
            self.Str_Answers[i].text = self.mAnswerGroup[i][self.mSearhAnswerID]
        end
    end
    for i = 1, #self.Img_Chas do
        self.Img_Chas[i].gameObject:SetActive(false)
        self.Img_Gous[i].gameObject:SetActive(false)
        self.Img_Selecteds[i].gameObject:SetActive(false)
    end
    self.Text_Timu().text = tQuestion
    self.clock.gameObject:GetComponent("TextCountDown"):SetRemainingTime(tonumber(tSkincareTab[8]))
end
---随机生成选项
function M:RandomSelect(_realTargetID)
    local tRealTarget = RoleattributeLocalData.tab[_realTargetID]
    local tCharecterGroup = {}
    local temp = {}
    local tTeam = {}
    -- local sum = 0

    -- for k,v in pairs(RoleattributeLocalData.tab) do
    --     sum = sum + 1
    -- end
    --之前的筛选方法
     while #tCharecterGroup < 3 do
        -- local tRand = math.random(1, #RoleattributeLocalData.tab)
         local data = Tool.RandomList(RoleattributeLocalData.tab) --,sum
         local tTeamdex = RoleattributeLocalData.tab[data[1]]
         ---检查阵营是否与正确选项相同
        if data[56] ~= tRealTarget[56] then
        --      local tSplit = string.split(tTeamdex[4], ',')
        --      local tId = math.random(1, #tSplit)
             ---检查角色ID是否已存在、检查阵营是否已存在
            if temp[data[1]] ~= 1 and tTeam[data[56]] ~= 1 then
                  tCharecterGroup[#tCharecterGroup + 1] = tTeamdex
                  temp[data[1]] = 1
                  tTeam[data[56]] = 1
            end
        end
     end
    tCharecterGroup[4] = tRealTarget
    --洗牌
    self:shuffle(tCharecterGroup)
    return tCharecterGroup
end

function M:isSelect(role,roleList)
    local isSlt = false
    for key, value in pairs(roleList) do
        if value[56] == role[56] then
            isSlt = true
            break
        end
    end
    return isSlt
end


--随机方法
function M:RandomList(pList,sum)
    if pList then
        local sum = sum
        local idx = math.random(1, sum)
        return pList[idx]
    end
    return nil
end

--洗牌
function M:shuffle(_table)
    local len = #_table
    while len > 0 do
        local idx = math.random(len)
        _table[len], _table[idx] = _table[idx], _table[len]
        len = len - 1
    end

    return _table
end
function M:ResetSkinGame()
    self.clock = self.Text_Shijian01()
    self.currAnswerNum = 1
    self.mSuccessNum = 0
    self.IsSelect = false
    ---刷新问题
    self:RefreshQA()
end

---结算界面
function M:JiesuanEvent(_chengji, _pingjia, _point, _winstate)
    --替换图片(1.S 2.A 3.B 4.C)
    MgrRes.LoadSprite(self.Img_S(), "BackRub/" .. _pingjia)
    if self.mGameID == 1 then
        self.Text_chengji().text = _chengji
        ---停止播放泡泡滑动音效
        MgrSound.Stop(2,"showerLoop",true)
        self.Text_Xiaohaoshijian().text = MgrLanguageData.GetLanguageByKey("ui_zhihuishi_text44")
    elseif self.mGameID == 2 then
        self.Text_Xiaohaoshijian().text = MgrLanguageData.GetLanguageByKey("backrub_ui_shower_score")
        self.Text_chengji().text = string.format(MgrLanguageData.GetLanguageByKey("backrub_ui_shower_minute_1"),"<color=#32ffed>" .. _chengji .. "</color>") 
    elseif self.mGameID == 3 then
        self.Text_Xiaohaoshijian().text = MgrLanguageData.GetLanguageByKey("backrub_ui_shower_answer")
        self.Text_chengji().text = "<color=#32ffed>" .. _chengji .. "</color>" .. MgrLanguageData.GetLanguageByKey("backrub_ui_shower_subject")
    end

    ---图片切换
    MgrRes.LoadSprite(self.Img_XiaoyouxiBG03(), "BackRub/" .. self.mJieSuanImg[self.mGameID][_winstate])
    
    self.Jiesuan().gameObject:SetActive(true)
    self.mGameID = 0
    ---结算后隐藏小游戏界面
    self:OnHideGame(false)

    local GameDataREQ = {
        eventID = self.mGameEvents[1],
        score = tonumber(_point)
    }
    local bytes = assert(pb.encode('PBClient.ClientReportGameInfoREQ', GameDataREQ))
    TaskControl.AckError = true
    MgrNet.SendReq(MID.CLIENT_REPORT_GAME_INFO_REQ, bytes, 0, nil, Handle(self, self.GameCheckOutAck), Handle(self, self.GameCheckOutNTF))
end

function M:GameCheckOutAck(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientReportGameInfoACK', buffer))
    if tab.errNo ~= 0 then
        print(tab)
    end
end

function M:GameCheckOutNTF(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientReportGameInfoNTF', buffer))
    self.mPlayCount = tab.count
    for i, v in ipairs(self.mGameEvents) do
        if v == tab.eventID then
            table.remove(self.mGameEvents, i)
            break
        end
    end
    if tab.events ~= nil then
        for i = 1, #tab.events do
            table.insert(self.mGameEvents, tab.events[i])
        end
    end

    local tGameGroup = {}
    for i = 1, #self.mGameEvents do
        tGameGroup[i] = EventgroupLocalData.tab[self.mGameEvents[i]][3]
    end
    self:CreateTaskBtn(tGameGroup)
    ArkViewModel.CurBackRubCount = tab.count
    self.Text_Duiwushu().text = string.format("<color=#ffcb18>%d</color> / 3", self.mMaxCount - tab.count)
    ---更新数据统计
    TaskControl.ChangeStatistics(tab.day,tab.week,tab.month,tab.glory)
end

---猜角色变量初始化
function M:InitGuessRole()
    self.Btn_GuessRole = {
        self.Img_Lihui1(),
        self.Img_Lihui2(),
        self.Img_Lihui3(),
        self.Img_Lihui4()
    }
    self.mImg_lihui = {
        self.Img_Lihui(),
        self.Img_Lihui01(),
        self.Img_Lihui02(),
        self.Img_Lihui03()
    }
    self.mText_RoleName = {
        self.Text_Jueseming(),
        self.Text_Jueseming01(),
        self.Text_Jueseming02(),
        self.Text_Jueseming03(),
    }
    self.mRealSelect = 0
    self.mSelectGroup = {}

    for i = 1, #self.Btn_GuessRole do
        local tSelectID = i
        UIEvent.LuaClick(self.Btn_GuessRole[i].gameObject, Handle(self, function()
            --if self.mRealSelect == self.mSelectGroup[tSelectID][1] then
            --    
            --else
            --    
            --end 
            local bytes = assert(pb.encode('PBClient.ClientAnswerGameInfoREQ', { roleID = self.mSelectGroup[tSelectID][1] }))
            MgrNet.SendReq(MID.CLIENT_ANSWER_GAME_INFO_REQ, bytes, 0, nil, Handle(self, self.ffectionAck), Handle(self, self.AddAffection))
            self.Caijuese().gameObject:SetActive(false)
        end))
    end
end
function M:ffectionAck(buffer, tag)
    local tab = assert(pb.decode('PBClient.ClientAnswerGameInfoACK', buffer))
    if tab.errNo ~= 0 then
        print(tab)
    end
end
---增加好感度
function M:AddAffection(buffer, tag)
    self.Haogan().gameObject:SetActive(true)
    
    local tab = assert(pb.decode('PBClient.ClientAnswerGameInfoNTF', buffer))
    local tAddVelue = tab.heroFavor - self.curHeroData.favor
    HeroControl.SetRoleFavorByID(self.curHeroData.id,tab.heroFavor)
    if tab.result == 0 then
        self.Text_Duicuo().text = MgrLanguageData.GetLanguageByKey("backrub_ui_shower_tips2")
        ---猜错音频
        MgrSound.PlayRole(self.mWrongAudio,nil,nil,false,0,0,"BackRubAucio")
    else
        self.Text_Duicuo().text = MgrLanguageData.GetLanguageByKey("backrub_ui_shower_tips3")
        ---猜对音频
        MgrSound.PlayRole(self.mRightAudio,nil,nil,false,0,0,"BackRubAucio")
        ---更新好感
        HeroControl.GetRoleDataByID(tab.heroID):PushHeroFavor(tab.heroFavor)
    end
    local tOldFavorLv, tOldExpRatio = Global.CheckFavorLv(self.curHeroData.favor)
    local tCurFavorLv, tExpRatio, tLvLimit = Global.CheckFavorLv(tab.heroFavor)

    ---经验增长音效
    MgrSound.PlayEffect("home_shower_9",1,0,true,0,0,"showerLoop")
    ---原本经验值和等级
    self.FavorabilitySlider().fillAmount = tOldExpRatio
    self.CurRoleFavorabilityText().text = tOldFavorLv
    ---判断是否升级
    if tOldFavorLv < tCurFavorLv then
        if self.mRoleFavorList[tCurFavorLv - 1] ~= nil then
            local tItemList = {}
            for i = 1, #self.mRoleFavorList[tCurFavorLv - 1] do
                local tItem = GameObject.Instantiate(self.HaoGanItem().gameObject, self.HaoganGroup().gameObject.transform, false)
                MgrRes.LoadSprite(tItem.transform:Find("Icon"):GetComponent("Image"), "Attribute/" .. self.mRoleFavorList[tCurFavorLv - 1][i].icon)
                tItem.transform:Find("HpNameText"):GetComponent("TextMeshProUGUI").text = self.mRoleFavorList[tCurFavorLv - 1][i].name
                tItem.transform:Find("TargetHpText"):GetComponent("TextMeshProUGUI").text = "+" .. self.mRoleFavorList[tCurFavorLv - 1][i].value

                tItemList[#tItemList + 1] = tItem.gameObject:GetComponent("CanvasGroup")
            end
            local n = 1
            local tLv = tOldFavorLv
            tItemList[n].gameObject:SetActive(true)
            MgrTimer.AddRepeat(self.mUpdateTimer, 0.1, function()
                if tItemList[n].alpha == 1 then
                    if #tItemList > n then
                        n = n + 1
                        tItemList[n].gameObject:SetActive(true)
                    end
                end
                if self.FavorabilitySlider().fillAmount >= 1 and tLv < tCurFavorLv then
                    tLv = tLv + 1
                    self.FavorabilitySlider().fillAmount = 0
                    self.CurRoleFavorabilityText().text = tLv
                    ---经验增长音效
                    MgrSound.PlayEffect("home_shower_10",1,0,false,0,0,"shower")
                end
                if #tItemList <= n and self.FavorabilitySlider().fillAmount >= tExpRatio and tLv >= tCurFavorLv then
                    MgrTimer.Cancel(self.mUpdateTimer)
                    MgrSound.Stop(2,"showerLoop",true)
                    return
                end
                tItemList[n].alpha = tItemList[n].alpha + 0.1
                self.FavorabilitySlider().fillAmount = self.FavorabilitySlider().fillAmount + 0.02
            end, -1, nil)
        end
        self.Text_Zenjiashuzhi().text = "up !"
    else
        self.HaoGanItem().gameObject:SetActive(false)
        self.Text_Zenjiashuzhi().text = "+" .. tAddVelue
        
        MgrTimer.AddRepeat(self.mUpdateTimer, 0.1, function()
            if self.FavorabilitySlider().fillAmount >= tExpRatio then
                self.FavorabilitySlider().fillAmount = tExpRatio
                MgrTimer.Cancel(self.mUpdateTimer)
                MgrSound.Stop(2,"showerLoop",true)
                return
            end
            self.FavorabilitySlider().fillAmount = self.FavorabilitySlider().fillAmount + 0.02
        end, -1, nil)
    end

    --好感等级
    --self.CurRoleFavorabilityText().text = tCurFavorLv
    self.CenterFavorSlider().fillAmount = tCurFavorLv / tLvLimit
    --self.FavorabilitySlider().fillAmount = tExpRatio
end
--[[function M:testAddAffection(result)
    local tAddVelue = 40
    if result == 0 then
        self.Text_Duicuo().text = "很遗憾猜错了~"
    else
        self.Text_Duicuo().text = "恭喜你猜对了~"
    end
    local tOldFavorLv, tOldExpRatio, tOldLvLimit = self:CheckFavorLv(20)
    local tCurFavorLv, tExpRatio, tLvLimit = self:CheckFavorLv(tAddVelue)
    ---经验增长音效
    MgrSound.PlayEffect("home_shower_9",1,0,true,0,0,"shower1")
    
    self.CurRoleFavorabilityText().text = tOldFavorLv
    self.FavorabilitySlider().fillAmount = tOldExpRatio
    if tOldFavorLv < tCurFavorLv then
        if self.mRoleFavorList[tCurFavorLv - 1] ~= nil then
            local tItemList = {}
            for i = 1, #self.mRoleFavorList[tCurFavorLv - 1] do
                local tItem = GameObject.Instantiate(self.HaoGanItem().gameObject, self.HaoganGroup().gameObject.transform, false)
                MgrRes.LoadSprite(tItem.transform:Find("Icon"):GetComponent("Image"), "Attribute/" .. self.mRoleFavorList[tCurFavorLv - 1][i].icon)
                tItem.transform:Find("HpNameText"):GetComponent("TextMeshProUGUI").text = self.mRoleFavorList[tCurFavorLv - 1][i].name
                tItem.transform:Find("TargetHpText"):GetComponent("TextMeshProUGUI").text = "+" .. self.mRoleFavorList[tCurFavorLv - 1][i].value

                tItemList[#tItemList + 1] = tItem.gameObject:GetComponent("CanvasGroup")
            end
            local n = 1
            local tLv = tOldFavorLv
            tItemList[n].gameObject:SetActive(true)
            
            MgrTimer.AddRepeat(self.mUpdateTimer, 0.1, function()
                if tItemList[n].alpha == 1 then
                    if #tItemList > n then
                        n = n + 1
                        tItemList[n].gameObject:SetActive(true)
                    end
                end
                if self.FavorabilitySlider().fillAmount >= 1 and tLv < tCurFavorLv then
                    tLv = tLv + 1
                    self.FavorabilitySlider().fillAmount = 0
                    self.CurRoleFavorabilityText().text = tLv
                    ---经验增长音效
                    MgrSound.PlayEffect("home_shower_10",1,0,false,0,0,"shower")
                end
                if #tItemList <= n and self.FavorabilitySlider().fillAmount >= tExpRatio and tLv >= tCurFavorLv then
                    MgrTimer.Cancel(self.mUpdateTimer)
                    MgrSound.Stop(2,"shower1",true)
                    return
                end
                tItemList[n].alpha = tItemList[n].alpha + 0.1
                self.FavorabilitySlider().fillAmount = self.FavorabilitySlider().fillAmount + 0.02
            end, -1, nil)
        end
        self.Text_Zenjiashuzhi().text = "up !"
    else
        self.HaoGanItem().gameObject:SetActive(false)
        self.Text_Zenjiashuzhi().text = "+" .. tAddVelue
        MgrTimer.AddRepeat(self.mUpdateTimer, 0.1, function()
            if self.FavorabilitySlider().fillAmount >= tExpRatio then
                MgrTimer.Cancel(self.mUpdateTimer)
                MgrSound.Stop(2,"shower1",true)
                return
            end
            self.FavorabilitySlider().fillAmount = self.FavorabilitySlider().fillAmount + 0.02
        end, -1, nil)
    end

    --self.CurRoleFavorabilityText().text = tCurFavorLv
    self.CenterFavorSlider().fillAmount = tCurFavorLv / tLvLimit
    --self.FavorabilitySlider().fillAmount = tExpRatio

    self.Haogan().gameObject:SetActive(true)
end]]
---猜角色界面人物创建
function M:CreateHDRole()
    --local tQuestion = SkincareLocalData.tab[self.mCharacterID][2]
    self.mRealSelect = RoleattributeLocalData.tab[self.mCharacterID][1]
    self.mSelectGroup = self:RandomSelect(self.mCharacterID)
    
    for i = 1, #self.mImg_lihui do
        local tImgwidth = self.mImg_lihui[i].rectTransform.sizeDelta.x
        local tImgHeight = self.mImg_lihui[i].rectTransform.sizeDelta.y
        local tId = i
        MgrRes.LoadLongIcon_CallBack(self.mImg_lihui[i], self.mSelectGroup[i][1], Handle(self, function()
            tImgHeight = tImgwidth / self.mImg_lihui[tId].rectTransform.sizeDelta.x * self.mImg_lihui[tId].rectTransform.sizeDelta.y
            self.mImg_lihui[tId].rectTransform.sizeDelta = Vector2(tImgwidth, tImgHeight)
        end), true)
        ---角色名
        self.mText_RoleName[i].text = self.mSelectGroup[i][2]
    end
    ---最后猜人时候的音频
    MgrSound.PlayRole(self.mGuessAudio,nil,nil,false,0,0,"BackRubAucio")
end

function M:CreateTaskBtn(_taskGroup)
    if self.mPlayCount >= self.mMaxCount then
        self.mGameFinish = true
        
        if not self.mCaiJuese then
            self:CreateHDRole()
            self.Caijuese().gameObject:SetActive(true)
        end
        self.Jiesuan().gameObject:SetActive(false)
        for i = 1, 3 do
            self.EnterGame[i].gameObject:SetActive(false)
        end
    else
        self.mTaskGroup = _taskGroup
        for i = 1, 3 do
            if i <= #_taskGroup then
                self.EnterGame[i].gameObject:SetActive(true)
            else
                self.EnterGame[i].gameObject:SetActive(false)
            end
        end
    end
end
---人物好感数据
function M:RoleFavorList()
    self.mRoleFavorList = {}
    for i, v in pairs(RolefavorabilityLocalData.tab) do
        if v[2] == self.mCharacterID then
            local tLvUpData = {}
            for i = 4, #v do
                if v[i] ~= "0" then
                    if i > 5 then
                        self.mAttribute[i - 3].value = self:GetInfoCorrect(v[i])
                    else
                        self.mAttribute[i - 3].value = v[i]
                    end
                    tLvUpData[#tLvUpData + 1] = self.mAttribute[i - 3]
                end
            end
            table.insert(self.mRoleFavorList, tLvUpData)
            if #self.mRoleFavorList >= 4 then
                break
            end
        end
    end
end
---初始化帮助界面
function M:InitHelpUI()
    self.mCurPage = nil
    self.mPageGroup = {
        self.Page_One().transform:GetChild(0), self.Page_Two().transform:GetChild(0)
    }
    for i = 1, #self.mPageGroup do
        self.mPageGroup[i].gameObject:SetActive(false)
    end
    UIEvent.LuaClick(self.Btn_Right().gameObject, function()
        self:ChangePage(self.mPage + 1)
    end)
    UIEvent.LuaClick(self.Btn_Left().gameObject, function()
        self:ChangePage(self.mPage - 1)
    end)

    --UIEvent.LuaClick(self.HelpBtn_Back().gameObject, function()
    --    self.Help().gameObject:SetActive(false)
    --    local tStr = string.format("BR_Help_%d_%d", PlayerControl.GetPlayerData().UID, self.mGameID)
    --    UnityEngine.PlayerPrefs.SetInt(tStr, 1)
    --
    --    self:OnClickGameID()
    --end)
end
function M:ChangePage(_changeID)
    ---首次进入弹出引导
    ActiveTutorialControl.ForcePopGuide(self.mHelpImg[self.mGameID],Handle(self,self.OnClickGameID))
end
function M:OpenHelp()
    self:ChangePage(1)

    --self.Help().gameObject:SetActive(true)
end

---隐藏UI,打开对应小游戏
function M:OnHideGame(_isVisible)
    --Event.Remove("BackKey", Handle(self, self.OnBackKey))
    if _isVisible then
        for i = 1, #self.GameMgr do
            if self.mGameID == i then
                self.GameMgr[i].gameObject:SetActive(true)
            else
                self.GameMgr[i].gameObject:SetActive(false)
            end
        end
    end
    if _isVisible ~= self:Xiaoyouxi().gameObject.activeSelf then
        self:Xiaoyouxi().gameObject:SetActive(_isVisible)
    end
end
function M:OnHideUI()
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    self:OnHideGame(false)
    self.Jiesuan().gameObject:SetActive(false)
    self.Caijuese().gameObject:SetActive(false)
    self.Haogan().gameObject:SetActive(false)
    self.HaoGanItem().gameObject:SetActive(false)

    self.Slider_Good().gameObject:SetActive(false)
    self.Slider_Perfect().gameObject:SetActive(false)
    for i = 1, #self.ImgPingfen do
        self.ImgPingfen[i][1].gameObject:SetActive(false)
    end
    --self.Help().gameObject:SetActive(false)
end

---点击事件
function M:OnClick()
    UIEvent.LuaClick(self.Btn_Back().gameObject, Handle(self, self.OnBackClick))
    UIEvent.LuaClick(self.Btn_GoMenu().gameObject, Handle(self, self.OnBackHome))
    ---小游戏返回按钮
    UIEvent.LuaClick(self.Btn_Zanting().gameObject, function()
        MgrTimer.Cancel(self.mUpdateTimer)
        self:OnHideGame(false)

        self:SetLinghangVisible(true)
    end)
    UIEvent.LuaClick(self.Btn_Zanting01().gameObject, function()
        self:OnHideGame(false)

        self:SetLinghangVisible(true)
    end)
    UIEvent.LuaClick(self.Btn_Zanting02().gameObject, function()
        self:OnHideGame(false)

        self:SetLinghangVisible(true)
    end)

    UIEvent.LuaClick(self.Img_Mask2().gameObject, function()
        if self.mGameFinish then
            self:CreateHDRole()
            self.Caijuese().gameObject:SetActive(true)

            for i = 1, #self.EnterGame do
                self.EnterGame[i].gameObject:SetActive(false)
            end
        else
            self:SetLinghangVisible(true)
        end
        self.Jiesuan().gameObject:SetActive(false)
    end)
    ---关闭好感界面
    UIEvent.LuaClick(self.Img_Mask4().gameObject, function()
        self.Haogan().gameObject:SetActive(false)
        self:SetLinghangVisible(true)
        MgrTimer.Cancel(self.mUpdateTimer)
        MgrSound.Stop(2,"shower",true)
    end)
    --帮助界面按钮
    UIEvent.LuaClick(self.Btn_Help().gameObject, function()
        HelpViewModel.Go(102)
        self:SetLinghangVisible(false)
        --self:testAddAffection(1)
    end)
    ---问号按钮
    for i = 1, 3 do
        local tID = i
        self.EnterGame[i].gameObject:SetActive(false)
        UIEvent.LuaClick(self.EnterGame[i].gameObject, function()

            CMgrSpine.Instance:SetSpineAnimation(self.LingHangObj,"idle",true)
            CMgrSpine.Instance:SetSpineAnimation(self.LingHangObjZ,"idle",true)
            MgrSound.Stop(2,"showerLoop",true)

            self.mGameID = self.mTaskGroup[tID]
            --self.mGameID = tID
            --local tStr = string.format("BR_Help_%d_%d", PlayerControl.GetPlayerData().UID, self.mGameID)
            local isNotFirst = ActiveTutorialControl.GetPopState(self.mHelpImg[self.mGameID])
            if isNotFirst then
                self:OnClickGameID()
                --self:testAddAffection(tGameID-1)
            else
                self:OpenHelp()
            end
            ---任务点击音效
            MgrSound.PlayEffect("home_shower_1",1,0,false,0,0,"shower")
            self:SetLinghangVisible(false)
        end)
    end
end

function M:SetLinghangVisible(_isVisible)
    if self.LinghangMove().gameObject.activeSelf ~= _isVisible then
        self.LinghangMove().gameObject:SetActive(_isVisible)
        self:RoleMoveBack(false)
        if self.mGameFinish then
            self.Ui_cuozao_004().gameObject:SetActive(_isVisible)
        else
            self.Ui_cuozao_001().gameObject:SetActive(_isVisible)
            self.Ui_cuozao_002().gameObject:SetActive(_isVisible)
        end
        for i = 1, #self.mTaskEff do
            self.mTaskEff[i].gameObject:SetActive(_isVisible)
        end
    end

    if not _isVisible then
        MgrSound.Stop(2,"showerLoop",true)
    else
        ---继续音频计时器
        MgrTimer.Resume(self.mAudioTimer)
    end
end
---领航员动画 TODO1
function M:CreateLingHang()
    self.Img_Linghang().gameObject:SetActive(false)
    MgrRes.LoadWatchAuto(self.LinghangMove().gameObject, 1000010, 0, 0, 0.1, nil, function(obj)
        self.LingHangObj = obj
    end)
end

---领航员动画 TODO1
function M:CreateLingHangZ()
    self.Img_Linghang().gameObject:SetActive(false)
    MgrRes.LoadWatchAuto(self.LinghangMove().gameObject, 1000011, 0, 0, 0.1, nil, function(obj)
        self.LingHangObjZ = obj
    end)
end
---倒计时
function M:OnClock()
    if self.mGameID == 1 then
        self:JiesuanEvent(MgrLanguageData.GetLanguageByKey("backrub_ui_shower_tips4"), self.mAssess[1].ImgAssess[4], self.mAssess[1].PointAssess[4], 2)
    elseif self.mGameID == 3 and self.currAnswerNum <= 3 then
        --更新当前到第几题
        self.currAnswerNum = self.currAnswerNum + 1
        if self.currAnswerNum > 3 then
            self:JiesuanEvent(self.mSuccessNum, self.mAssess[3].ImgAssess[self.mSuccessNum + 1], self.mAssess[3].PointAssess[self.mSuccessNum + 1], 2)
            return
        end
        ---刷新问题
        self:RefreshQA()
    end
end
---初始化人物音频
function M:InitRoleAudio()
    MgrRes.LoadCriAcb(self.mCharacterID)
    for key, value in pairs(ActorLinesLocalData.tab) do
        if value[2] == self.mCharacterID then
            if value[3] == 27 then
                ---进入搓背界面音频
                self.mEnterAudio = value[13]
            elseif value[3] == 28 then
                ---打开小游戏音频
                self.mOpenGameAudio = value[13]
            elseif value[3] == 29 then
                ---每隔个10秒左右播放
                self.mSpeakAudio = value[13]
            elseif value[3] == 31 then
                ---最后猜人时候的音频
                self.mGuessAudio = value[13]
            elseif value[3] == 32 then
                ---猜对音频
                self.mRightAudio = value[13]
            elseif value[3] == 33 then
                ---猜错音频
                self.mWrongAudio = value[13]
            end
        end
    end
end
---取整人物信息
function M:GetInfoCorrect(_Data)
    -- statements
    local tempInt1 = 0
    local tempInt2 = 0
    local tempData = 0
    tempInt1, tempInt2 = math.modf((_Data * 10000) / 1)
    tempData = tempInt1 / 100
    return tempData .. "%"
end
---点击打开小游戏入口
function M:OnClickGameID()
    self.clock = nil
    if self.mGameID == 1 then
        self:ResetTakeBGame()
    elseif self.mGameID == 2 then
        self:ResetSeafoodGame()
    elseif self.mGameID == 3 then
        ---冒泡音效
        MgrSound.PlayEffect("home_shower_2",1,0,false,0,0,"shower")
        self:ResetSkinGame()
    end
    ---暂停音频计时器
    MgrTimer.Pause(self.mAudioTimer)

    if self.clock ~= nil then
        self.clock.gameObject:GetComponent("TextCountDown"):BindFinish(Handle(self, self.OnClock))
    end
    ---隐藏UI,打开对应小游戏
    self:OnHideGame(true)
end
---创建搓背动画
function M:CreateRoleSpin()
    local tSpinID = ShowerLocalData.tab[self.mCharacterID][9] == 0 and 20001 or ShowerLocalData.tab[self.mCharacterID][9]
    self.mSpinData = BackparameterLocalData.tab[tSpinID]
    local tPos = string.split(self.mSpinData[4],',')
    MgrRes.LoadFightSpine(self.Img_Fenti().gameObject, self.mSpinData[2], tonumber(tPos[1]), tonumber(tPos[2]), tonumber(self.mSpinData[3]), "idle", function(obj)
        self.mRoleSpineObj = obj
        ---添加触控区域和响应
        self:OnRoleSpinClick()
    end,self.mSpinData[6])
    ---创建毛巾垫
    MgrRes.LoadSprite(self.Img_BG(), "BackRub/" .. self.mSpinData[7])
end
---添加触控区域和响应
function M:OnRoleSpinClick()
    local tTouchData = string.split(self.mSpinData[5], ';')
    for i = 1, #tTouchData do
        local tBtnData = string.split(tTouchData[i], ',')
        local tBtn = GameObject.Instantiate(self.TouchBtn().gameObject, self.TouchBtnGroup().transform, false)
        tBtn.transform.anchoredPosition = Vector2(tonumber(tBtnData[1]),tonumber(tBtnData[2]))
        tBtn.transform.sizeDelta = Vector2(tonumber(tBtnData[3]),tonumber(tBtnData[4]))
        ---
        local tTouchMsg = tBtnData[5]
        local toggle = tBtn.gameObject:GetComponent("Toggle")
        Tools.ToggleValueChange(toggle, function()
            CMgrSpine.Instance:SetSpineAnimation(self.mRoleSpineObj,tTouchMsg,false)
            local tRandN = math.random(1, 2)
            if tRandN == 1 then
                MgrSound.PlayRole(self.mSpeakAudio,nil,nil,false,0,0,"BackRubAucio")
            else
                MgrSound.PlayRole(self.mOpenGameAudio,nil,nil,false,0,0,"BackRubAucio")
            end
        end)
    end
end

---返回事件
function M:OnBackClick()
    MgrUI.GoBack()
end

function M:OnClose()
    Event.Remove("BackRubClickEffect",Handle(self,self.RegisterClickEffect))
    Event.Remove("BackKey", Handle(self, self.OnBackKey))
    MgrTimer.Cancel(self.mUpdateTimer)
    MgrTimer.Cancel(self.mAudioTimer)
    MgrSound.Stop(2,"showerLoop",true)
    MgrSound.Stop(3,"BackRubAucio",true)
    self.SpineObj = nil
    self.HeadSpinObj = nil
    self.LingHangObj = nil

    Event.CheckClear("LinghangVisible")
    MgrSound.PlayBGM(SteamLocalData.tab[113014][2],0.2)
    ---修改点击特效
    CMgrUI.Instance:CleanClickAllChild()
    MgrRes.GetPrefab('ABOriginal/VFX/Prefab/UI_Prefab/llx_dianji.prefab',function(clickeff)
        CMgrUI.Instance:SetClickEffect(clickeff)
    end)
end

function M:OnBackHome()
    MgrUI.GoBackToFirst()
end
return M