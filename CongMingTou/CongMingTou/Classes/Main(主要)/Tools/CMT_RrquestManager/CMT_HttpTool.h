//
//  CMT_HttpTool.h
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CMT_HttpTool : NSObject


#pragma mark -- 注册登录
//注册验证
+ (NSString *)registerConfirm:(NSString *)phone;

//注册
+ (NSString *)getRegister:(NSString *)phone captch:(NSString *)codeStr pwd:(NSString *)pwdStr invitationCode:(NSString *)inviteStr channelNumber:(NSString *)channelNumberStr;

//密码登录
+ (NSString *)getPwdLogin:(NSString *)param phone:(NSString *)phoneStr pwd:(NSString *)pwdStr;

//验证码登录
+ (NSString *)getCodeLogin:(NSString *)param phone:(NSString *)phoneStr captch:(NSString *)captchStr;


#pragma mark -- 首页和投资模块
//首页地址
+ (NSString *)getFirstListData;

//签到
+ (NSString *)getSignData:(NSString *)userID;

//去签到后的信息
+ (NSString *)getHadSignData:(NSString *)userID;

//投资
+ (NSString *)getInvestData:(NSString *)type;

//理财计划详情
+ (NSString *)getInvestPlanDetailData:(NSString *)userID withBid:(NSString *)bid;

//投资记录
+ (NSString *)getInvestRecordData:(NSString *)planId stNum:(NSString *)startNum pageSize:(NSString *)size;

//投资确认
+ (NSString *)getInvestMakeSureData:(NSString *)planId uId:(NSString *)userId;

//福利金投资确认
+ (NSString *)getFuliInvestMakeSureData:(NSString *)planId uId:(NSString *)userId;

//验证支付密码
+ (NSString *)getInvestConfirmPassword:(NSString *)telPhone password:(NSString *)pwd;

//投资
+ (NSString *)getInvest:(NSString *)bidId uId:(NSString *)userId investAm:(NSString *)investAmount fringeBenefitAm:(NSString *)fringeBenefitAmount jxIdStr:(NSString *)jxId completeOperation:(NSString *)completeOperation investToken:(NSString *)investToken;

//福利金
+ (NSString *)getFuliJInInfo:(NSString *)userId investAmount:(NSString *)investAmountStr bidId:(NSString *)bidIdStr;

//收益计算器
+ (NSString *)getCalculatorInfo;

#pragma mark -- 我的模块
//我的主页
+ (NSString *)getMyData:(NSString *)userId;

//查询银行卡和账户信息
+ (NSString *)getUserBankCardAndAccountInfo:(NSString *)userId phone:(NSString *)phoneStr;

//实名认证
+ (NSString *)getRealNameBindCardInfo:(NSString *)uid userIdentify:(NSString *)userIdentifyStr userName:(NSString *)userNameStr cardNo:(NSString *)cardNoStr userMobile:(NSString *)userMobileStr mobileSmsCode:(NSString *)mobileSmsCodeStr bankid:(NSString *)bankIdStr;

//获取验证码
+ (NSString *)getYzNumb:(NSString *)tel withType:(NSString *)type;

//获取银行卡列表
+ (NSString *)getBankList;

//充值申请
+ (NSString *)getRecharge:(NSString *)userId amount:(NSString *)amountStr;

//充值申请验证
+ (NSString *)getRechargeConfirm:(NSString *)userId amount:(NSString *)amountStr orderNoThird:(NSString *)orderNoThirdStr payToken:(NSString *)payTokenStr orderNo:(NSString *)orderNoStr captch:(NSString *)captchStr;

//提现获取银行卡和账户信息
+ (NSString *)getReflectUserBankCardAndAccountInfo:(NSString *)userId;

//提现申请
+ (NSString *)getReflect:(NSString *)userId amount:(NSString *)amountStr bankId:(NSString *)bankIdStr payPassword:(NSString *)payPasswordStr;

//设置交易密码第一步
+ (NSString *)getSetDealPwdLogin:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr idNumber:(NSString *)idNumberStr;

//设置交易密码第二步
+ (NSString *)getSetDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd;

//忘记交易密码
+ (NSString *)getForgotDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd;

//对比原交易密码
+ (NSString *)getCompareDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr oldPayPwd:(NSString *)payPwd;

//修改交易密码
+ (NSString *)getUpDateDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr newPayPwd:(NSString *)payPwd;

//我的加息券
+ (NSString *)getTicket:(NSString *)userId type:(NSString *)typeStr investAmount:(NSString *)investAmountStr period:(NSString *)periodStr;

//我的红包
+ (NSString *)getRedTicket:(NSString *)userId type:(NSString *)typeStr;

//福利金投资记录
+ (NSString *)getWelfareInvestRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size;

//福利金收支记录
+ (NSString *)getWelfareRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size;

//账户与安全信息
+ (NSString *)getAccountSafe:(NSString *)userId phone:(NSString *)phoneStr;

//短信验证码验证
+ (NSString *)getCodeConfirm:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr;

//设置登录密码
+ (NSString *)getSetLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr;

//忘记登录密码
+ (NSString *)getForgotLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr;

//修改登录密码
+ (NSString *)getUpdateLoginPwddate:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr;

//对你原登录密码是否正确
+ (NSString *)getConfirmOldLoginPwd:(NSString *)userId phone:(NSString *)phoneStr oldPwd:(NSString *)pwdStr;

//我的银行卡
+ (NSString *)getRealNameBankInfo:(NSString *)userId phone:(NSString *)phoneStr;

//我的速速赚和月月息
+ (NSString *)getMySusuOrYueYueInfo:(NSString *)userId start:(NSString *)startStr size:(NSString *)sizeStr status:(NSString *)statuStr type:(NSString *)type;

//投资记录详情
+ (NSString *)getMyInvestRecordDetailInfo:(NSString *)userId investId:(NSString *)investIdStr;

//收款计划
+ (NSString *)getMoneyPlanInfo:(NSString *)userId investId:(NSString *)investIdStr;

//投资分享后回调接口
+ (NSString *)getInvestShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr bidId:(NSString *)bidIdStr investId:(NSString *)investIdStr amount:(NSString *)amountStr;

//获取发现活动分享内容
+ (NSString *)getShareContentInfo:(NSString *)userId phone:(NSString *)phoneStr;

//交易记录  diffType 1: 充值 2：理财 3：回款 4：提现 5: 红包
+ (NSString *)getDealRecordInfo:(NSString *)userId phone:(NSString *)phoneStr start:(NSString *)startStr size:(NSString *)sizeStr withType:(NSString *)diffType;

//交易记录详情-充值
+ (NSString *)getRechargeDealDetail:(NSString *)userId rechargeId:(NSString *)rechargeIdStr;

//资产组合
+ (NSString *)rpcAssetDebtServiceDetailInfoinvestId:(NSString *)creditId;

//交易记录详情-理财
+ (NSString *)getInvestDealDetail:(NSString *)userId investId:(NSString *)investIdStr;

//交易记录详情-提现
+ (NSString *)getReflectDealDetail:(NSString *)userId withdrawalId:(NSString *)withdrawalIdStr;

//更改操作方式
+ (NSString *)getChangeOperation:(NSString *)userId investId:(NSString *)investIdStr operType:(NSString *)operTypeStr;

//实名认证分享
+ (NSString *)getRealNameResultShare:(NSString *)userId phone:(NSString *)phoneStr;

//如何获取福利金
+ (NSString *)getHowtoFulijin:(NSString *)userId phone:(NSString *)phoneStr;

//每日一句
+ (NSString *)getEveryOneSay:(NSString *)userId;

//新手任务 - 去投资详情
+ (NSString *)getNewInvesterToInvestDetail:(NSString *)userId tel:(NSString *)mobileStr period:(NSString *)period;

//版本更新
+ (NSString *)getUpDateVersion;

//易保全合同
+ (NSString *)getContractInforWithInvestId:(NSString *)investId period:(NSString *)period;

//应用雷达
+ (NSString *)liveModelIdfi;

//发现或者轮播活动分享
+ (NSString *)getActivityShareContentWithActivityId:(NSString *)activityId userId:(NSString *)userId;

//登录底部广告显示开关
+ (NSString *)loginBottomAdverSwitch;
@end
