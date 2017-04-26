//
//  CMT_Macro_URL.h
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#ifndef CMT_Macro_URL_h
#define CMT_Macro_URL_h

//神策数据统计模式
//   SensorsAnalyticsDebugOff - 关闭 Debug 模式
//   SensorsAnalyticsDebugOnly - 打开 Debug 模式，校验数据，但不进行数据导入
//   SensorsAnalyticsDebugAndTrack - 打开 Debug 模式，校验数据，并将数据导入到 Sensors Analytics
//域名
//http://api.cmt.yourp2p.com/
//主机
//#define CMT_SERVER_URL  @"https://192.168.4.49:7777/service/"

// 1:开发环境；2:本地测试环境 3:正式环境；
#define CMT_CREATE_URL(a, b)     [NSString stringWithFormat:@"%@%@", a, b]

/********** 1:开发环境（测试环境）2:本地测试环境 3.预发布环境 4:正式环境  **********/
#define kCWNetEnvVar  4

/************* 1.开发环境（测试环境）************/
#if (kCWNetEnvVar == 1)

#define CMT_SERVER_URL  @"https://cmtapi.zhaoniwaner.com/"
//所有静态页的域名
#define CMT_H5SERVEr_URL @"https://cmth5.zhaoniwaner.com/"
//神策数据统计模式
#define CMT_SENSORANALYTICS SensorsAnalyticsDebugOnly
//极光推送的环境（开发环境：FALSE 生产环境：TRUE）
#define isModleProduction FALSE
//资产互通

#define CMT_PRODUCTINTERFACE @"http://192.168.6.112:7777/service/"
            
/************* 2.本地测试环境 ************/
#elif (kCWNetEnvVar == 2)
#define CMT_SERVER_URL  @"http://192.168.5.223:7778/service/"
//所有静态页的域名 －－测试
#define CMT_H5SERVEr_URL @"https://cmth5.zhaoniwaner.com/"
//#define CMT_H5SERVEr_URL @"http://192.168.5.248:8081/"

//神策数据统计模式
#define CMT_SENSORANALYTICS SensorsAnalyticsDebugOnly
//极光推送的环境（开发环境：FALSE 生产环境：TRUE）
#define isModleProduction FALSE
//资产互通
#define CMT_PRODUCTINTERFACE @"http://192.168.6.112:7777/service/"

/************* 3.预发布环境 ************/
#elif (kCWNetEnvVar == 3)

#define CMT_SERVER_URL  @"https://preapi.cmtouzi.com/service/"
//所有静态页的域名 －－测试
#define CMT_H5SERVEr_URL @"https://preh5.cmtouzi.com/"
//神策数据统计模式
#define CMT_SENSORANALYTICS SensorsAnalyticsDebugOnly
//极光推送的环境（开发环境：FALSE 生产环境：TRUE）
#define isModleProduction FALSE
//资产互通
#define CMT_PRODUCTINTERFACE @"http://101.200.202.140:7777/service/"

/************* 4.正式环境 ************/
#elif (kCWNetEnvVar == 4)

#define CMT_SERVER_URL  @"https://newapi.cmtouzi.com/service/"
//所有静态页的域名
#define CMT_H5SERVEr_URL @"https://newh5.cmtouzi.com/"
//神策数据统计模式
#define CMT_SENSORANALYTICS SensorsAnalyticsDebugOff
//极光推送的环境（开发环境：FALSE 生产环境：TRUE）
#define isModleProduction TRUE
//资产互通
#define CMT_PRODUCTINTERFACE @"http://101.200.162.32:7777/service/"

#endif

//首页
#define FIRSTlIST CMT_CREATE_URL(CMT_SERVER_URL,@"index/indexInfo/")

//签到信息
#define SIGNINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"sign/checkSign/")

//签到以后的信息
#define HADSIGNINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"sign/userSign/")

//投资模块理财计划列表
#define INVESTINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"financialPlan/financialPlanList/")

//理财计划详情
#define INVESTDETAILINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"financialPlan/financialPlanDetail/")

//投资记录
#define INVESTRECORDLINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"financialPlan/investRecordList/")

//发现页面地址
#define FOUNDPAGEINTERFACE CMT_CREATE_URL(CMT_H5SERVEr_URL,@"findMain/findPage.htm")

//投资确认
#define INVESTMAKESUREINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"invest/investComfirm/")

//120000投资确认
#define FULIINVESTMAKESUREINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"invest/investConfirmWelfareBid/")

//我的主页
#define MYINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"user/myInfo/")

//充值时查询银行卡和账户余额
#define USERBANKINFOINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"pay/userRechargeInfo/")

//投资支付密码验证
#define INVESTCONFIRMPWDINFOINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"invest/confirmPassword/")

//投资
#define INVESTNFOINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"invest/investBid/")

//用户实名认证
#define REALNAMEINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"realname/authenticate/")

//获取验证码
#define GETYZNUMBINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"sms/verificationCode/")

//实名认证-获取银行卡列表
#define GETBANKLISTINTOINTERF @"realname/getTDictBankQuotas"

//注册验证
#define REGISTERCONFIRM  CMT_CREATE_URL(CMT_SERVER_URL,@"register/checkPhone/")

//注册
#define REGISTERINTOINTERF CMT_CREATE_URL(CMT_SERVER_URL,@"register/app/")

//密码登录
#define PWDLOGININTOINTERF CMT_CREATE_URL(CMT_SERVER_URL,@"login/loginPwd/")

//验证码登录
#define CODELOGININTOINTERF CMT_CREATE_URL(CMT_SERVER_URL,@"login/loginCaptch/")

//充值申请
#define RECHARGRINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"pay/rechargeGo/")

//充值申请验证
#define RECHARGRCONFIRMINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"pay/rechargeGoCaptch/")

//提现时查询银行卡和账户余额
#define REFLECTUSERBANKINFOINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"withdrawal/toWidthdraw/")

//提现申请
#define REFLECTINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"withdrawal/widthdraw/")

//设置交易密码第一步
#define SETDEALINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/checkCaptchIdNumber/")

//设置交易密码第三步
#define SETDEALPWDTHREEINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/setUserPayPwd/")

//忘记交易密码
#define FORGOTDEALPWDTHREEINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/resetUserPayPwd/")

//对比原交易密码
#define COMPAREOLDDEALPWDINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/checkPayOldPassword/")

//修改交易密码
#define CHANGEDEALPWDINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/resetUserPayPwdNew/")

//投资-获取福利金信息
#define MyWelfareINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"welfare/getMyWelfareWhenInvest/")

//收益计算器
#define CALCULATORINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"financialPlan/calculator/")

//我的加息券
#define MYTICKETSINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/getMyTickets/")

//我的红包
#define MYREDTICKETINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/findUserRedPacket/")

//福利金投资记录
#define WELFAREINVESTINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"welfare/getMyWelfareInvestRecord/")

//福利金收支记录
#define WELFARERECORDINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"welfare/getMyWelfareRecord/")

//账户安全
#define ACCOUNTSAFEINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"user/userInfo/")

//短信验证码检测验证
#define CODECONFIRMINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/checkCaptch/")

//修改登录密码
#define RESETLOGININTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/resetUserLoginPwdNew/")

//设置登录密码
#define SETLOGININTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/setUserLoginPwd/")

//忘记登录密码
#define FORGOTLOGININTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/reSetUserLoginPwd/")

//对比原登录密码是否正确
#define CONFIRMOLDLOGINPWD CMT_CREATE_URL(CMT_SERVER_URL,@"userPassword/checkLoginOldPassword/")

//我的月月息和速速赚
#define MYYUEYUEANDSUSUINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/getUserInvestRecord/")

//投资记录详情
#define MYINVESTRECORDDETAILINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/getUserInvestRecordDetail/")

//投资计划
#define GETMONEYPLANINTERFACE CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/getInvestCollectionPlan/")

//分享加息
#define INVESTSHAREADDRATEINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"invest/investShareAddRates/")

//获取发现活动分享内容接口
#define GETSHAREINFOINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"invest/investShareInfo/")
//资产组合

#define RPCASSSEDAEJDSGS  CMT_CREATE_URL(CMT_PRODUCTINTERFACE,@"rpcAssetDebtService/httpGetDebtCombination/")

//如何获取福利金 -- 即新手任务
#define HOWTOGETFULIJININTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTask/getUserTaskList/")

//新手任务-投资标的状态查询
#define NEWINVESTERPLANSTATUS  CMT_CREATE_URL(CMT_SERVER_URL,@"userTask/getJumpBidDetail/")

//********交易记录********//

//充值
#define RECHARGRDEALRECORDINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordRecharge/")

//提现
#define REFLECTDEALRECORDINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordWithdrawal/")

//理财
#define INVESTDEALRECORDINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordInvest/")

//回款
#define BACKMONEYDEALRECORDINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordBackMoney/")

//红包
#define REDDEALRECORDINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordRedPacket/")

//充值详情
#define RECHAGEDEALDETAILINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordRechargeDetail/")

//理财详情
#define INVESTDEALLDETAILINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordInvestDetail/")

//提现详情
#define REFLECTDEALLDETAILINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"userTransInfo/transRecordWithdrawalDetail/")

//更改复投模式
#define CHANGEOPERATIONINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"invest/changeCompleteOper/")

//启动广告
#define ADVERINTERFACE  CMT_CREATE_URL(CMT_SERVER_URL,@"startAdvert/getStartAdvert")

//登录广告显示开关
#define LOGINADVERSWITCH  CMT_CREATE_URL(CMT_SERVER_URL,@"setting/iosAdvertisement")

//实名认证分享
#define SHAREREALNAME  CMT_CREATE_URL(CMT_SERVER_URL,@"realname/shareRealName/")

//每日一句
#define EVERYDAYONESAY   CMT_CREATE_URL(CMT_SERVER_URL,@"everydaySentence/getEverydaySentence/")

//版本更新
#define CMT_UpdateVersion         CMT_CREATE_URL(CMT_SERVER_URL,@"setting/version/")

//活动期间展示对应的广告
#define CMT_ShowActivity         CMT_CREATE_URL(CMT_SERVER_URL,@"userTask/getShowActivity")


/*****--添加H5*****/
#define LJH_RESHLJH_URLH5(a, b, c)     [NSString stringWithFormat:@"%@%@-%@.htm", a, b, c]

//APP首页列表点公告进入公告列表
#define FINDMANIPLATFORMLISTC     CMT_CREATE_URL(CMT_H5SERVEr_URL,@"findMain/platformList.htm?type=1")

//APP首页列表点公告内容进入公告详情
#define FINDMAINPLATFORMDETAIL    CMT_CREATE_URL(CMT_H5SERVEr_URL,@"findMain/platformDetail/")

//APP首页列表右上角点消息进入消息列表
#define FINDMAGETMSGLISHT         CMT_CREATE_URL(CMT_H5SERVEr_URL,@"usersMsgs/getMsgsList/")

//注册协议
#define USERAGREEMENTREGISERS     CMT_CREATE_URL(CMT_H5SERVEr_URL,@"userAgreement/registerAgreement.htm")

//投资前理财协议
#define USERAGREINVRSTAGEEMENT    CMT_CREATE_URL(CMT_H5SERVEr_URL,@"userAgreement/investAgreement/")

//投资后查看易保全同
#define USERAGRELECTPURCHCODE     CMT_CREATE_URL(CMT_H5SERVEr_URL,@"userAgreement/userElectPurchase/")

//标的详情资产组合页面
#define ASSETSTATISTICSGROUP      CMT_CREATE_URL(CMT_H5SERVEr_URL,@"assetStatistics/assetGroup/")

//红包,福利金使用规则页面
#define USERREDRULE               CMT_CREATE_URL(CMT_H5SERVEr_URL,@"findMain/useRule/")

//获取活动分享的分享内容
#define CMT_ActivityShareContent  CMT_CREATE_URL(CMT_SERVER_URL,@"hotActivityShare/getActivityShareInfo/")

//安全保障
#define SAFERULE                  CMT_CREATE_URL(CMT_H5SERVEr_URL,@"findMain/security")

//速速赚产品详情 1
//月月息产品详情页面 2
//新手福利详情 3
#define SUSUPRODUCTDETAIL         CMT_CREATE_URL(CMT_H5SERVEr_URL,@"product/productDetail/")

//我的资产组合
#define MYZICHAN                  CMT_CREATE_URL(CMT_H5SERVEr_URL,@"assetStatistics/assetStatisticsDetail/")

//---------------------
//神策数据统计接收地址
#define sensorsAnalyticsUrl @"http://101.200.228.12:8006/sa"

//配置分发数据接受地址
#define sensorsAnalyticUrl @"http://101.200.228.12:8007/api/vtrack/config"

/**
 *  广告位  链接
 */
#define CMT_AdvertisingUrl @"http://www.ccb.com/cn/home/indexv3.html"

#define CMT_AdvertisingOpenState @"register/iosAdvertisement/"

/**
 *  应用雷达
 */
#define CMT_LiveMobileIdfi @"register/iosAdvertisementActivate/"


/**
 *  友盟key
 */
//聪明投
#define CMT_UmengAppkey @"575e470967e58ee24d000e04"
/**
 *  友盟微信AppleID
 */
//聪明投
#define CMT_UMWXAPPID @"wxea21c7ba8cd2be7c"
/**
 *  友盟微信Secret
 */
// 聪明投
#define UMWXAppSecret @"98bdd81707a06c3d846c29be3257a159"
/**
 *  qq的AppleID
 */
#define CMT_QQ_AppId @"1105556502"
/**
 *  qq的AppKey
 *
 */
#define CMT_QQ_AppKey @"wZs2RePQoPqpEFib"

/**
 *  分享落地页url
 */
#define UMWXUrl @"app/invitRegister/"


#endif /* CMT_Macro_URL_h */
