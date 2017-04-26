//
//  CMT_ProcessTheDataTool.h
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_homeModel.h"
#import "CMT_SignInDayItemModel.h"
#import "CMT_InvestModel.h"
#import "CMT_InvestDetailModel.h"
#import "CMT_InvestRecordModel.h"
#import "CMT_MyModel.h"
#import "CMT_BankCardAndAccountModel.h"
#import "CMT_MakeSureModel.h"
#import "CMT_InvestConfirmPwdModel.h"
#import "CMT_ToInvestModel.h"
#import "CMT_RealNameModel.h"
#import "CMT_InvestmentPreBankModel.h"
#import "CMT_AccountModel.h"
#import "CMT_MyRechargeModel.h"
#import "CMT_MyRechargrResultModel.h"
#import "CMT_MyRechargrResultModel.h"
#import "CMT_ReflectBankAndAccountInfoModel.h"
#import "CMT_UserFuLiJInModel.h"
#import "CMT_MyRedOrCouponModel.h"
#import "CMT_MyFuLiInvestRecordModel.h"
#import "CMT_AccountSafeModel.h"
#import "CMT_MyFLIncomeRecordModel.h"
#import "CMT_MySuOrYueModel.h"
#import "CMT_MyInvestRecordDetailModel.h"
#import "CMT_GetMyMoneyPlanModel.h"
#import "CMT_GetShareContentModel.h"
#import "CMT_AmountCodInfeModel.h"
#import "CMT_MyDealRecordModel.h"
#import "CMT_DealRecordDetailModel.h"
#import "CMT_AdverModel.h"
#import "CMT_MyHowToGetFLJModel.h"
#import "CMT_EveryDayOneSayModel.h"
#import "CMT_NewInvesterToDetailModel.h"
#import "CMT_MyUpVersionModel.h"
#import "CMT_ActivityShareContentModel.h"
#import "CMT_HomeAlertModel.h"

@interface CMT_ProcessTheDataTool : NSObject

/**
 首页接口
 @param block 返回首页数据
 */
+ (void)getFirstDateBlock:(void(^)(CMT_homeModel *homeModel, NSError *error))block;

/**
 查看签到信息接口
 */
+ (void)getSignData:(NSString *)userId withBlock:(void(^)(CMT_SignInDayItemModel *signInDayItemModel, NSError *error))block;


/**
 去签到后的信息
 */
+ (void)getHadSignData:(NSString *)userId withBlock:(void(^)(CMT_SignInDayItemModel *signInDayItemModel, NSError *error))block;


/**
 投资模块 -- 理财计划列表
 @param type type 速速赚：1；月月息：2
 */
+ (void)getInvestData:(NSString *)type withBlock:(void(^)(CMT_InvestModel *investModel, NSError *error))block;


/**
 投资理财计划详情

 @param userID 用户id
 @param bid 标id
 */
+ (void)getInvestDetailData:(NSString *)userID withBid:(NSString *)bid withBlock:(void(^)(CMT_InvestDetailModel *investDetailModel, NSError *error))block;


/**
 投资记录页

 @param planId 标计划id
 @param startNum 页数
 @param size 每页的size
 */
+ (void)getInvestRecordData:(NSString *)planId withStartNum:(NSString *)startNum pageSize:(NSString *)size withBlock:(void(^)(CMT_InvestRecordModel *investRecordModel, NSError *error))block;


/**
 投资确认页

 @param planId 标计划id
 @param userId 用户id
 */
+ (void)getInvestMakeSureData:(NSString *)planId uId:(NSString *)userId withBlock:(void(^)(CMT_MakeSureModel *makeSureModel, NSError *error))block;

//福利金120000投资确认
+ (void)getFuliInvestMakeSureData:(NSString *)planId uId:(NSString *)userId withBlock:(void(^)(CMT_MakeSureModel *makeSureModel, NSError *error))block;

/**
 我的页面的主页

 @param userId userId
 */
+ (void)getMyDataUid:(NSString *)userId withBlock:(void(^)(CMT_MyModel *myModel, NSError *error))block;


/**
 充值查询银行卡和账户信息

 @param userId 用户id
 */
+ (void)getUserBankCardAndAccountInfo:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_BankCardAndAccountModel *myModel, NSError *error))block;


/**
 投资支付密码验证

 @param telPhone 手机号
 @param pwd 密码
 */
+ (void)getInvestConfirmPassword:(NSString *)telPhone password:(NSString *)pwd withBlock:(void(^)(CMT_InvestConfirmPwdModel *myModel, NSError *error))block;

/**
 去投资和投资结果

 @param bidId 标id
 @param userId 用户id
 @param investAmount 投资金额
 @param fringeBenefitAmount 福利金金额
 @param jxId 加息券id
 @param completeOperation 操作方式
 @param investToken 投资token
 */
+ (void)getInvest:(NSString *)bidId uId:(NSString *)userId investAm:(NSString *)investAmount fringeBenefitAm:(NSString *)fringeBenefitAmount jxIdStr:(NSString *)jxId completeOperation:(NSString *)completeOperation investToken:(NSString *)investToken withBlock:(void(^)(CMT_ToInvestModel *myModel, NSError *error))block;


/**
 实名认证

 @param uid 用户id
 @param userIdentifyStr 身份证号
 @param userNameStr 用户名字
 @param cardNoStr 卡号
 @param userMobileStr 手机号
 @param mobileSmsCodeStr 验证码
 */
+ (void)getRealNameBindCardInfo:(NSString *)uid userIdentify:(NSString *)userIdentifyStr userName:(NSString *)userNameStr cardNo:(NSString *)cardNoStr userMobile:(NSString *)userMobileStr mobileSmsCode:(NSString *)mobileSmsCodeStr bankid:(NSString *)bankIdStr withBlock:(void(^)(CMT_RealNameModel *myModel, NSError *error))block;


/**
 获取验证码
 @param type (0:注册，1：找回支付密码，2：登录3：设置密码，4:实名认证，5：其他 6:重置手势密码)
 @param tel 手机号
 */
+ (void)getYzNumb:(NSString *)tel withType:(NSString *)type withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;


/**
 获取银行卡列表
 */
+ (void)getBanklistBlock:(void(^)(CMT_InvestmentPreBankModel *model, NSError *error))block;


/**
 用户注册验证是否存在接口

 @param phone 手机号
 @param block
 */
+ (void)registerConfirm:(NSString *)phone withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;

/**
 注册接口

 @param phone 手机号
 @param codeStr 验证码
 @param pwdStr 密码
 @param inviteStr 邀请码  默认 000000
 @param channelNumberStr 渠道编码  默认 000000
 */
+ (void)getRegister:(NSString *)phone captch:(NSString *)codeStr pwd:(NSString *)pwdStr invitationCode:(NSString *)inviteStr channelNumber:(NSString *)channelNumberStr  withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block;


/**
 密码登录

 @param param 加密串
 @param phoneStr 手机号
 @param pwdStr 密码
 */
+ (void)getPwdLogin:(NSString *)param phone:(NSString *)phoneStr pwd:(NSString *)pwdStr withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block;


/**
 验证码登录

 @param param 加密串
 @param phoneStr 手机号
 @param captchStr 验证码
*/
+ (void)getCodeLogin:(NSString *)param phone:(NSString *)phoneStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block;


/**
 充值申请

 @param userId 用户id
 @param amountStr 金额
 */
+ (void)getRecharge:(NSString *)userId amount:(NSString *)amountStr withBlock:(void(^)(CMT_MyRechargeModel *myModel, NSError *error))block;


/**
 充值申请验证

 @param userId 用户id
 @param amountStr 充值金额
 @param orderNoThirdStr 第三方订单号
 @param payTokenStr paytoken
 @param orderNoStr 聪明投订单号
 @param captchStr 验证码
 */
+ (void)getRechargeConfirm:(NSString *)userId amount:(NSString *)amountStr orderNoThird:(NSString *)orderNoThirdStr payToken:(NSString *)payTokenStr orderNo:(NSString *)orderNoStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_MyRechargrResultModel *myModel, NSError *error))block;


/**
 提现查询银行卡和账户信息

 @param userId 用户id
 */
+ (void)getReflectUserBankCardAndAccountInfo:(NSString *)userId  withBlock:(void(^)(CMT_ReflectBankAndAccountInfoModel *myModel, NSError *error))block;


/**
 提现申请

 @param userId 用户id
 @param amountStr 金额
 @param bankIdStr 银行id
 @param payPasswordStr 支付密码验证方式
 
 */
+ (void)getReflectRequest:(NSString *)userId amount:(NSString *)amountStr bankId:(NSString *)bankIdStr payPassword:(NSString *)payPasswordStr withBlock:(void(^)(CMT_MyRechargrResultModel *myModel, NSError *error))block;


/**
 设置交易密码第一步

 @param userId 用户id
 @param phoneStr 手机号
 @param captchStr 验证码
 @param idNumberStr 身份证号
 */
+ (void)getSetDealPwdLogin:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr idNumber:(NSString *)idNumberStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;


/**
 设置交易密码

 @param userId 用户id
 @param phoneStr 手机号
 @param payPwd 第一次输入的密码
 @param rePayPwd 再次输入的密码
 
 */
+ (void)getSetDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 忘记交易密码

 @param userId 用户id
 @param phoneStr 手机号
 @param payPwd 第一次输入的密码
 @param rePayPwd 再次输入的密码
 */
+ (void)getForgotDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 对比原交易密码

 @param userId 用户
 @param phoneStr 手机号
 @param payPwd 老密码
 */
+ (void)getCompareDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr oldPayPwd:(NSString *)payPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 修改交易密码

 @param userId 用户id
 @param phoneStr 手机号
 @param payPwd 密码
 */
+ (void)getUpDateDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr newPayPwd:(NSString *)payPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;


/**
 使用福利金

 @param userId 用户id
 @param investAmountStr 投资金额
 @param bidIdStr 标记化id
 */
+ (void)getFuliJInInfo:(NSString *)userId investAmount:(NSString *)investAmountStr bidId:(NSString *)bidIdStr withBlock:(void(^)(CMT_UserFuLiJInModel *myModel, NSError *error))block;


/**
 收益计算器

 */
+ (void)getCalculatorInfoWithBlock:(void(^)(CMT_homeModel *myModel, NSError *error))block;


/**
 我的加息券

 @param userId 用户id
 @param typeStr 类型
 @param investAmountStr 投资额度
 */
+ (void)getTicket:(NSString *)userId type:(NSString *)typeStr investAmount:(NSString *)investAmountStr period:(NSString *)period WithBlock:(void(^)(CMT_MyRedOrCouponModel *myModel, NSError *error))block;


/**
 我的红包

 @param userId 用户id
 @param typeStr 类型
 */
+ (void)getRedTicket:(NSString *)userId type:(NSString *)typeStr WithBlock:(void(^)(CMT_MyRedOrCouponModel *myModel, NSError *error))block;


/**
 福利金投资记录

 @param userId 用户id
 @param start 起步index
 @param size 每页个数
 */
+ (void)getWelfareInvestRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size WithBlock:(void(^)(CMT_MyFuLiInvestRecordModel *myModel, NSError *error))block;



/**
 福利金收支记录

 @param userId 用户id
 @param start 起步index
 @param size 每页个数
 */
+ (void)getWelfareRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size WithBlock:(void(^)(CMT_MyFLIncomeRecordModel *myModel, NSError *error))block;


/**
 账户安全

 @param userId userId
 @param phoneStr 手机号
 */
+ (void)getAccountSafe:(NSString *)userId phone:(NSString *)phoneStr WithBlock:(void(^)(CMT_AccountSafeModel *myModel, NSError *error))block;



/**
 验证码验证

 @param userId 用户id
 @param phoneStr 手机号
 @param captchStr 验证码
 */
+ (void)getCodeConfirm:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 设置登录密码

 @param userId 用户id
 @param phoneStr 手机号
 @param pwdStr 密码
 */
+ (void)getSetLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 忘记登录密码

 @param userId 用户id
 @param phoneStr 手机号
 @param pwdStr 密码
 */
+ (void)getForgotLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;


/**
 修改登录密码

 @param userId 用户id
 @param phoneStr 手机号
 @param pwdStr 密码
 */
+ (void)getUpdateLoginPwddate:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 对比原登录密码是否正确

 @param userId 用户id
 @param phoneStr 手机号
 @param pwdStr 密码
 */
+ (void)getConfirmOldLoginPwd:(NSString *)userId phone:(NSString *)phoneStr oldPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;


/**
 我的速速赚或者月月息

 @param userId 用户id
 @param startStr 当前页数
 @param sizeStr 每页个数
 @param statuStr 1:持有中；2：已赎回
 @param type 1:速速赚  2:月月盈
 */
+ (void)getMySusuOrYueYueInfo:(NSString *)userId start:(NSString *)startStr size:(NSString *)sizeStr status:(NSString *)statuStr type:(NSString *)type withBlock:(void(^)(CMT_MySuOrYueModel *myModel, NSError *error))block;



/**
 投资记录详情

 @param userId 用户id
 @param investIdStr 投资id
 */
+ (void)getMyInvestRecordDetailInfo:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_MyInvestRecordDetailModel *myModel, NSError *error))block;


/**
 收款计划

 @param userId 用户id
 @param investIdStr 投资id
 */
+ (void)getMoneyPlanInfo:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_GetMyMoneyPlanModel *myModel, NSError *error))block;



/**
 投资分享后回调接口

 @param userId 用户id
 @param phoneStr 手机号
 @param bidIdStr 标id
 @param investIdStr 投资id
 @param amountStr 金额
 */
+ (void)getInvestShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr bidId:(NSString *)bidIdStr investId:(NSString *)investIdStr amount:(NSString *)amountStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;



/**
 获取分享内容

 @param userId 用户id
 @param phoneStr 手机号
 */
+ (void)getShareContentInfo:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_GetShareContentModel *myModel, NSError *error))block;


//+ (NSString *)getDealRecordInfo:(NSString *)userId phone:(NSString *)phoneStr start:(NSString *)startStr size:(NSString *)sizeStr withType:(NSString *)diffType
/**
 资产组合
 
 @param creditId 资产id

 */
/**
 交易记录

 @param userId 用户id
 @param phoneStr 手机号
 @param startStr 起始页
 @param sizeStr 每页个数
 @param diffType 类型
 */
+ (void)getDealRecordInfo:(NSString *)userId phone:(NSString *)phoneStr start:(NSString *)startStr size:(NSString *)sizeStr withType:(NSString *)diffType withBlock:(void(^)(CMT_MyDealRecordModel *myModel, NSError *error))block;


//投资详情里面的资产组合
+ (void)rpcAssetDebtServiceDetailInfoinvestId:(NSString *)creditId withBlock:(void(^)(CMT_AmountCodInfeModel *myModel, NSError *error))block;


/**
 充值交易详情

 @param userId 用户id
 @param rechargeIdStr 充值id
 */
+ (void)getRechargeDealDetail:(NSString *)userId rechargeId:(NSString *)rechargeIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block;


/**
 理财交易详情

 @param userId 用户id
 @param investId 投资id
 */
+ (void)getInvestDealDetail:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block;


/**
 提现交易详情
 
 @param userId 用户id
 @param withdrawalId 提现id
 */
+ (void)getReflectDealDetail:(NSString *)userId withdrawalId:(NSString *)withdrawalIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block;


/**
 复投操作

 @param userId 用户id
 @param investIdStr 投资id
 @param operTypeStr 投资完成后的操作方式 1:本金收益转入余额 2:本金复投 3:收益复投
 */
+ (void)getChangeOperation:(NSString *)userId investId:(NSString *)investIdStr operType:(NSString *)operTypeStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;

//启动广告
+ (void)getAdverDataWithBlock:(void(^)(CMT_AdverModel *myModel, NSError *error))block;

//实名认证后分享
+ (void)getRealNameResultShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr  withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;

/**
 *  获取合同信息
 *
 *  @param investId 投资id
 *  @param period   期限
 *
 *  @return
 */
+ (void)getContractInforWithInvestId:(NSString *)investId period:(NSString *)period block:(void(^)(id jsonObject, NSError *error))block;

/**
 如何获取福利金

 @param userId 用户id
 @param phoneStr 手机号
 */
+ (void)getHowtoFulijin:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_MyHowToGetFLJModel *myModel, NSError *error))block;


//每日一句
+ (void)getEveryOneSay:(NSString *)userId withBlock:(void(^)(CMT_EveryDayOneSayModel *myModel, NSError *error))block;


//新手任务 - 去投资
+ (void)getNewInvesterToInvestDetail:(NSString *)userId tel:(NSString *)mobileStr period:(NSString *)periodStr withBlock:(void(^)(CMT_NewInvesterToDetailModel *myModel, NSError *error))block;

//版本更新
+ (void)getUpdateVersion:(void(^)(CMT_MyUpVersionModel *myModel, NSError *error))block;

//应用雷达
+ (void)liveModelIdfiAndBlock:(void(^)(id jsonObject, NSError *error))block;

/**
 发现或者轮播获取分享内容

 @param activityId 活动id
 @param userId 用户id 没有默认传"0"
 */
+ (void)getActivityShareContentWithActivityId:(NSString *)activityId userId:(NSString *)userId andBlock:(void(^)(CMT_ActivityShareContentModel *model, NSError *error))block;

/**
 登录底部广告显示开关
 */
+ (void)loginBottomAdverSwitchWithBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block;

//首页开关
+ (void)showActivity:(NSString *)url withBlock:(void(^)(CMT_HomeAlertModel *myModel, NSError *error))block;


@end
