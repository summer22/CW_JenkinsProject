//
//  CMT_Const.m
//  CongMingTou
//
//  Created by wzh on 16/6/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_Const.h"
/**
 *  充值验证码长度
 */
const NSUInteger CMT_RechargeCodeLenght = 4;
/**
 *  验证码长度
 */
const NSUInteger CMT_VerificationCodeLenght = 6;
/**
 *  手机号限制长度
 */
const NSUInteger CMT_PhoneNumLenght = 11;
/**
 *  邀请码长度
 */
const NSUInteger CMT_InviteCodeLenght = 8;
/**
 *  银行卡长度限制 最大位数
 */
const NSUInteger CMT_BankNumMaxLenght = 20;
/**
 *  银行卡长度限制  最小位数
 */
const NSUInteger CMT_BankNumMinLenght = 10;
/**
 *  支付密码长度
 */
const NSUInteger CMT_PayPwdLenght = 6;
/**
 *  提现最低限额
 */
const NSUInteger CMT_WithdrawalMaxLowLimit = 100;
/**
 *  充值最低限额
 */
const NSUInteger CMT_TopUpMaxLowLimit = 50;
/**
 *  密码最短长度
 */
const NSUInteger CMT_RegistePwdLowLimit = 8;
/**
 *  密码最长长度
 */
const NSUInteger CMT_RegistePwdMaxLimit = 16;

/**
 *   单点登录code
 */
NSString *const CMT_SinglePointCode = @"-999";
/**
 *   单点登录 顶登录  你的账号已在另一设备登录
 */
NSString *const CMT_ErrorOtherEquipmentLogin = @"你的账号已在另一设备登录";
/**
 *   底部银行描述 -- 招商银行战略合作
 */
NSString *const CMT_BottomBankInfor = @"燕赵财险战略合作";
/**
 *   银行卡信息错误  暂不支持该银行卡或银行卡号输入错误
 */
NSString *const CMT_BankNumError = @"暂不支持该银行卡或银行卡号输入错误";
/**
 *   银行卡信息错误  兴业银行 单笔限额5万元，单日限额5万元
 */
NSString *const CMT_BankNumAlertInfor = @"兴业银行 单笔限额5万元，单日限额5万元";



/**
 *  网络等待: 正在加载。。。
 */
NSString *const CMT_LoadDataWaiting = @"正在加载...";
/**
 *   正在登录： 正在登录
 */
NSString *const CMT_LoadDataWaitingLoging = @"正在登录...";
/**
 * 网络等待: 正在支付密码是否正确
 */
NSString *const CMT_LoadDataWaitingPwdOK = @"正在验证密码...";
/**
 * 网络等待: 正在修改支付密码
 */
NSString *const CMT_LoadDataWaitingModifyPwd = @"正在修改支付密码...";
/**
 *  实名认证邦卡：正在实名认证及设置密码。。。
 */
NSString *const CMT_LoadDataRealNameAuthenticate = @"正在实名认证及设置密码...";
/**
 *  正在生成订单号：正在生成订单号
 */
NSString *const CMT_LoadDataGenerateOrderNumber = @"正在生成充值订单号...";
/**
 *  正在申请支付； 正在申请支付
 */
NSString *const CMT_LoadDataApplyForTopUp = @"正在申请充值...";
/**
 *  正在申请提现；正在申请提现
 */
NSString *const CMT_LoadDataWithdrawalIng = @"正在申请提现...";
/**
 *  正在支付； 正在支付
 */
NSString *const CMT_LoadDataPaying = @"正在充值...";



/**
 *  登录成功
 */
NSString *const CMT_LoadDataLoginSuccessful = @"登录成功";
/**
 *  充值 ：充值成功
 */
NSString *const CMT_LoadDataPaySuccessful = @"充值成功";
/**
 *  指纹验证成功体式：指纹验证成功
 */
NSString *const CMT_FingerprintValidationSuccessful = @"指纹验证成功";
/**
 *  获取验证码 ： 验证码已发送，请注意查收
 */
NSString *const CMT_LoadDataGetCodeSuccessful = @"验证码已发送,请注意查收";
/**
 *   注册 :注册成功
 */
NSString *const CMT_LoadDataRegisteredSuccessful = @"注册成功";
/**
 *  修改秘密啊 ：修改密码成功
 */
NSString *const CMT_LoadDataModifyPayPwdSuccessful = @"修改密码成功";
/**
 *  验证验证码成功 ：验证验证码成功
 */
NSString *const CMT_LoadDataValidationCodeSuccessful = @"验证验证码成功";
/**
 *  提现成功 :提现成功
 */
NSString *const CMT_LoadDataWithdrawalSuccessful = @"提现成功";
/**
 *  取消预约成功:取消预约成功
 */
NSString *const CMT_LoadDataWithCanccelYuYueSuccessful = @"取消预约成功";
/**
 *  分享成功
 */
NSString *const CMT_LoadDataShareSuccessful = @"分享成功";
/**
 *  分享失败
 */
NSString *const CMT_LoadDataShareFaild = @"分享失败";
/**
 *  分享取消
 */
NSString *const CMT_LoadDataShareCancel = @"取消了分享";


/**
 *  微信客服ID 复制成功
 */
NSString *const CMT_PasteboardSuccessful = @"复制微信客服ID成功";
/**
 *  邀请码复制成功 邀请码复制成功
 */
NSString *const CMT_PasteboardInviteCodeSuccessful = @"复制邀请码成功";
/**
 *  实名认证邦卡： 实名认证成功
 */
NSString *const CMT_LoadDataRealNameAuthenticateSuccessful = @"实名认证成功";
/**
 *  微信客服ID 
 */
NSString *const CMT_PasteboardWXID = @"congmingtou";
/**
 *  客服热线
 */
NSString *const CMT_CustomerServicePhonNum = @"400-080-7321";





/**
 *  没有更多数据提示 :没有更多数据了
 */
NSString *const CMT_LoadDataNoMoreData = @"没有更多数据了";
/**
 *  无网络：请检查网络连接
 */
NSString *const CMT_Error_NotNetWork = @"请检查网络连接";
/**
 *  手机号输入错误：请输入正确手机号
 */
NSString *const CMT_Error_PhoneNum = @"请输入正确手机号";
/**
 *  短信验证码输入错误：验证码输入错误
 */
NSString *const CMT_Error_VerificationCode = @"验证码输入错误";
/**
 *  银行卡号输入错误：请输入正确银行卡号
 */
NSString *const CMT_Error_BankCrad = @"请输入正确银行卡号";
/**
 *  身份证号输入错误：请输入正确身份证号码
 */
NSString *const CMT_Error_IDCrad = @"请输入正确身份证号码";
/**
 *  姓名输入错误：请输入正确姓名
 */
NSString *const CMT_Error_Name = @"请输入正确姓名";
/**
 * 充值：请输入正确金额 提现：请输入正确金额
 */
NSString *const CMT_Error_Money = @"请输入正确金额";
/**
 *  提现： 账户余额不足
 */
NSString *const CMT_Error_MoneyInsufficient = @"账户余额不足";
/**
 * 邀请码： 请输入正确的邀请码
 */
NSString *const CMT_Error_InvitationCode = @"请输入正确的邀请码";
/**
 *  协议三个：聪明投注册协议，聪明投投资协议，聪明投风险揭示书
 *           协议为勾选提示：请您勾选同意协议
 */
NSString *const CMT_Error_NoAgreement = @"请您勾选同意协议";

/**
 * 两次输入的密码不相同： 两次输入的密码不相同
 */
NSString *const CMT_Error_TwoPwdNoSame = @"两次输入的密码不相同";
/**
 *  充值 ：充值取消
 */
NSString *const CMT_LoadDataPayCancel = @"充值取消";
/**
 *  充值 ：充值失败
 */
NSString *const CMT_LoadDataPayError = @"充值失败";
/**
 *  取消了指纹验证 :取消了指纹验证
 */
NSString *const CMT_FingerprintValidationCancel = @"取消了指纹验证";
/**
 *  指纹验证失败，请重新验证: 指纹验证失败，请重新验证
 */
NSString *const CMT_Error_FingerprintValidation = @"指纹验证失败，请重新验证";
/**
 *  当前设备不支持指纹验证 :当前设备不支持指纹验证
 */
NSString *const CMT_Error_DeviceErrorFingerprintValidation = @"当前设备不支持指纹验证";
/**
 *  未登陆或没有打开手机指纹验证
 */
NSString *const CMT_Error_DeviceErrorNOOpenOrNoLogin = @"用户没有打开手机指纹验证";
/**
 *  没有设置指纹密码
 */
NSString *const CMT_Error_DeviceErrorNOSetFingerprint = @"没有设置指纹密码";
/**
 *  授权失败
 */
NSString *const CMT_Error_DeviceErrorAuthorizationError = @"授权失败";
/**
 *  预约中的没有产品详情哦   提示
 */
NSString *const CMT_Error_YuYueNoDetail = @"预约中的没有产品详情哦";
/**
 * 已经预约了哦   提示
 */
NSString *const CMT_Error_DidYuYue = @"已经预约了哦";
/**
 *  新手标不能预约 新手标不能预约哦
 */
NSString *const CMT_Error_NewBidType = @"新手标不能预约哦";
/**
 * 不能取消预约了哦   提示
 */
NSString *const CMT_Error_NoCancelYuYue = @"该预约不可以取消了哦";
/**
 * 请先开启手势密码   提示
 */
NSString *const CMT_Error_OpenGesturesSwitch = @"请先开启手势密码";



/**
 *  注册－－－聪明投注册协议
 */
NSString *const CMT_Title_RegistrationAgreement = @"聪明投注册协议";
/**
 *  投资前准备第二步（协议）－－－聪明投风险揭示书
 */
NSString *const CMT_Title_BeforeTheInvestmentSecond = @"聪明投风险揭示书";

