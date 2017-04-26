//
//  CMT_Const.h
//  CongMingTou
//
//  Created by wzh on 16/6/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  产品详情 返回是保存信息的Key (CMT_productDetViewController) 值 ：1 产品详情pop回来的  0 不是
 */
#define CMT_ProductDetVCPopKey @"productDetVCPopKey"

/**
 *  注册成功或登录跳出手势密码key
 */
#define GesturesAndLoginPasswordPresentVCKey @"GesturesPasswordPresentVC"

/**
 *  点击立即投资弹出登陆登录成功后发送通知的Key
 */
#define CMT_ImmediateInvestmentLogingSuccessfulPresentKey @"CMT_LogingSuccessfulPresentKey"

/**
 *  持有中立即预约成功后回调通知名字
 */
#define CMT_NotifReloadKey @"CMT_NotifReload"
/**
 *   设置手势密码成功
 *
 */
#define CMT_SetGesturesPasswordSuccessfulKey @"CMT_IsJumpSetGesturesPasswordSuccessfulKey"
/**
 *  分享保存的key  1点击了分享
 */
#define CMT_Share_key @"share"

/**
 *  充值验证码长度
 */
extern const NSUInteger CMT_RechargeCodeLenght;

/**
 *  验证码长度
 */
extern const NSUInteger CMT_VerificationCodeLenght;
/**
 *  手机号限制长度
 */
extern const NSUInteger CMT_PhoneNumLenght;
/**
 *  邀请码长度
 */
extern const NSUInteger CMT_InviteCodeLenght;
/**
 *  银行卡长度限制 最大位数
 */
extern const NSUInteger CMT_BankNumMaxLenght;
/**
 *  银行卡长度限制  最小位数
 */
extern const NSUInteger CMT_BankNumMinLenght;
/**
 *  支付密码长度
 */
extern const NSUInteger CMT_PayPwdLenght;
/**
 *  提现最低限额
 */
extern const NSUInteger CMT_WithdrawalMaxLowLimit;
/**
 *  充值最低限额
 */
extern const NSUInteger CMT_TopUpMaxLowLimit;

/**
 *  密码最短长度
 */
extern const NSUInteger CMT_RegistePwdLowLimit;
/**
 *  密码最长长度
 */
extern const NSUInteger CMT_RegistePwdMaxLimit;


/**
 *   单点登录code
 */
extern NSString *const CMT_SinglePointCode;
/**
 *   单点登录 顶登录  你的账号已在另一设备登录
 */
extern NSString *const CMT_ErrorOtherEquipmentLogin;
/**
 *   底部银行描述  -- 招商银行战略合作
 */
extern NSString *const CMT_BottomBankInfor;
/**
 *   银行卡信息错误  暂不支持该银行卡或银行卡号输入错误
 */
extern NSString *const CMT_BankNumError;
/**
 *   银行卡信息错误  兴业银行 单笔限额5万元，单日限额5万元
 */
extern NSString *const CMT_BankNumAlertInfor;


/**
 *  网络等待: 正在加载。。。
 */
extern NSString *const CMT_LoadDataWaiting;
/**
 *   正在登录： 正在登录
 */
extern NSString *const CMT_LoadDataWaitingLoging;
/**
 * 网络等待: 正在支付密码是否正确
 */
extern NSString *const CMT_LoadDataWaitingPwdOK;
/**
 * 网络等待: 正在修改支付密码
 */
extern NSString *const CMT_LoadDataWaitingModifyPwd;
/**
 *  实名认证邦卡：正在实名认证及设置密码。。。
 */
extern NSString *const CMT_LoadDataRealNameAuthenticate;
/**
 *  正在生成订单号：正在生成订单号
 */
extern NSString *const CMT_LoadDataGenerateOrderNumber;
/**
 *  正在申请支付； 正在申请支付
 */
extern NSString *const CMT_LoadDataApplyForTopUp;
/**
 *  正在申请提现；正在申请提现
 */
extern NSString *const CMT_LoadDataWithdrawalIng;
/**
 *  正在支付； 正在支付
 */
extern NSString *const CMT_LoadDataPaying;





/**
 *  登录成功
 */
extern NSString *const CMT_LoadDataLoginSuccessful;
/**
 *  充值 ：充值成功
 */
extern NSString *const CMT_LoadDataPaySuccessful;
/**
 *  指纹验证成功体式：指纹验证成功
 */
extern NSString *const CMT_FingerprintValidationSuccessful;
/**
 *  获取验证码 ：验证码已发送，请注意查收
 */
extern NSString *const CMT_LoadDataGetCodeSuccessful;
/**
 *   注册 :注册成功
 */
extern NSString *const CMT_LoadDataRegisteredSuccessful;
/**
 *  修改秘密啊 ：修改密码成功
 */
extern NSString *const CMT_LoadDataModifyPayPwdSuccessful;
/**
 *  验证验证码成功 ：验证验证码成功
 */
extern NSString *const CMT_LoadDataValidationCodeSuccessful;
/**
 *  提现成功 :提现成功
 */
extern NSString *const CMT_LoadDataWithdrawalSuccessful;
/**
 *  取消预约成功:取消预约成功
 */
extern NSString *const CMT_LoadDataWithCanccelYuYueSuccessful;
/**
 *  分享成功
 */
extern NSString *const CMT_LoadDataShareSuccessful;
/**
 *  分享失败
 */
extern NSString *const CMT_LoadDataShareFaild;
/**
 *  分享取消
 */
extern NSString *const CMT_LoadDataShareCancel;

/**
 *  微信客服ID 复制成功
 */
extern NSString *const CMT_PasteboardSuccessful;
/**
 *  邀请码复制成功 邀请码复制成功
 */
extern NSString *const CMT_PasteboardInviteCodeSuccessful;
/**
 *  实名认证邦卡： 实名认证成功
 */
extern NSString *const CMT_LoadDataRealNameAuthenticateSuccessful;
/**
 *  微信客服ID 
 */
extern NSString *const CMT_PasteboardWXID;
/**
 *  客服热线
 */
extern NSString *const CMT_CustomerServicePhonNum;


/**
 *  没有更多数据提示 :没有更多数据了
 */
extern NSString *const CMT_LoadDataNoMoreData;
/**
 *  无网络：请检查网络连接
 */
extern NSString *const CMT_Error_NotNetWork;
/**
 *  手机号输入错误：请输入正确手机号
 */
extern NSString *const CMT_Error_PhoneNum;
/**
 *  短信验证码输入错误：验证码输入错误
 */
extern NSString *const CMT_Error_VerificationCode;
/**
 *  银行卡号输入错误：请输入正确银行卡号
 */
extern NSString *const CMT_Error_BankCrad;
/**
 *  身份证号输入错误：请输入正确身份证号码
 */
extern NSString *const CMT_Error_IDCrad;
/**
 *  姓名输入错误：请输入正确姓名
 */
extern NSString *const CMT_Error_Name;
/**
 * 充值：请输入正确金额 提现：请输入正确金额
 */
extern NSString *const CMT_Error_Money;
/**
 *  提现： 账户余额不足
 */
extern NSString *const CMT_Error_MoneyInsufficient;
/**
 * 邀请码： 请输入正确的邀请码
 */
extern NSString *const CMT_Error_InvitationCode;
/**
 *  协议三个：聪明投注册协议，聪明投投资协议，聪明投风险揭示书
 *           协议为勾选提示：请您勾选同意协议
 */
extern NSString *const CMT_Error_NoAgreement;

/**
 * 两次输入的密码不相同： 两次输入的密码不相同
 */
extern NSString *const CMT_Error_TwoPwdNoSame;
/**
 *  充值 ：充值取消
 */
extern NSString *const CMT_LoadDataPayCancel;
/**
 *  充值 ：充值失败
 */
extern NSString *const CMT_LoadDataPayError;
/**
 *  取消了指纹验证 :取消了指纹验证
 */
extern NSString *const CMT_FingerprintValidationCancel;
/**
 *  指纹验证失败，请重新验证: 指纹验证失败，请重新验证
 */
extern NSString *const CMT_Error_FingerprintValidation;
/**
 *  当前设备不支持指纹验证 :当前设备不支持指纹验证
 */
extern NSString *const CMT_Error_DeviceErrorFingerprintValidation;
/**
 *  未登录或没有打开手机指纹验证
 */
extern NSString *const CMT_Error_DeviceErrorNOOpenOrNoLogin;
/**
 *  没有设置指纹密码
 */
extern NSString *const CMT_Error_DeviceErrorNOSetFingerprint;
/**
 *  授权失败
 */
extern NSString *const CMT_Error_DeviceErrorAuthorizationError;
/**
 *  预约中的没有产品详情哦   提示
 */
extern NSString *const CMT_Error_YuYueNoDetail;
/**
 * 已经预约了哦   提示
 */
extern NSString *const CMT_Error_DidYuYue;
/**
 *  新手标不能预约 新手标不能预约哦
 */
extern NSString *const CMT_Error_NewBidType;
/**
 * 不能取消预约了哦   提示
 */
extern NSString *const CMT_Error_NoCancelYuYue;
/**
 * 请先开启手势密码   提示
 */
extern NSString *const CMT_Error_OpenGesturesSwitch;



/**
 *  注册－－－聪明投注册协议
 */
extern NSString *const CMT_Title_RegistrationAgreement;
/**
 *  投资前准备第二步（协议）－－－聪明投风险揭示书
 */
extern NSString *const CMT_Title_BeforeTheInvestmentSecond;

