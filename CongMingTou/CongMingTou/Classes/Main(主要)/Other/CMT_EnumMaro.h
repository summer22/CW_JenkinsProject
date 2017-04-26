
//
//  CMT_EnumMaro.h
//  CongMingTou
//
//  Created by wzh on 16/5/13.
//  Copyright © 2016年 wzh. All rights reserved.
//

#ifndef CMT_EnumMaro_h
#define CMT_EnumMaro_h
/**
 *  itemBtn左右设置识别枚举
 */
typedef NS_ENUM(NSInteger, CMTItemBtnDirctorType) {
   
    CMTItemBtnDirctorLeft = 0,
   
    CMTItemBtnDirctorRight
};


/**
 标计划类型
 */
typedef NS_ENUM(NSInteger, CMTBidPlanType) {
   
    CMTNewBidPlan = 0,
   
    CMTSusuBidPlan,
 
    CMTYyBidPlan
};

/**
 *  充值或者提现
 */
typedef NS_ENUM(NSInteger, CMT_ReflectOrRecharge) {
   
    CMT_Reflect = 0,
   
    CMT_Recharge
};

/**
 *  设置交易密码和忘记交易密码类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_SetDealPwdOrForgotDealPwd) {
    
    CMT_SetDealPwd = 0,
   
    CMT_ForgotDealPwd
};

/**
 *  交易密码弹框忘记密码
 *  我的、投资详情、如何获取福利金、确认投资、提现、账户安全、修改交易密码类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_DEALPWDALERTFROMTYPE) {
    //确认投资忘记交易密码
    CMT_MakeSureInvestClass = 0,
    //提现忘记交易密码
    CMT_ReflectClass,
    //中间过度页
    CMT_ChangeMidPwdClass,
    //账户安全
    CMT_SafeAccountClass,
    //如何获取福利金
    CMT_HowGetFuLiJinClass,
    //我的 - 充值、提现
    CMT_MyClass,
};


/**
 红包和加息券的类别枚举
 */
typedef NS_ENUM(NSInteger, CMT_REDTICKITORCOUPON) {
    
    REDTICKIT = 0,
    
    COUPON
};

/**
 可用 、 已用、 过期 类别枚举
 */
typedef NS_ENUM(NSInteger, CMT_TICKETSTAUE) {
    
    TOUSER = 0,
    
    HADUSER,
    
    PASSDATE
};

/**
 可用 、 已用、 过期 类别枚举
 */
typedef NS_ENUM(NSInteger, CMT_COMEFROMTYPE) {
    
    MAKESUREINVESTVC = 0,
    
    OTHERDETAULT,
};


/**
 *  设置登录密码和忘记登录密码类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_SETLOGINPwd) {
    
    CMT_SetLoginPwd = 0,
    
    CMT_ForgotLoginPwd
};


/**
 *  登录注册类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_LOGINORREGISTERTYPE) {
    
    CMT_LOGINTYPE = 0,
    
    CMT_REGISTERTYPE
};

/**
 *  月月息和速速赚类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_YUEANDSUSUTYPE) {
    
    CMT_YUETYPE = 0,
    
    CMT_SUSUTYPE
};


/**
 *  月月息和速速赚,福利金类型枚举
 */
typedef NS_ENUM(NSInteger, CMT_YUEANDSUSUANDFULIJINTYPE) {
    
    CMT_YUEDETAILTYPE = 0,
    
    CMT_SUSUDETTAILTYPE,
    
    CMT_FULIJINDETAILTYPE
};

/**
 *  进入登陆的类型
 */
typedef NS_ENUM(NSInteger, CMTEnterLoginType) {
    /**
     *  未登陆点击 我的tabbar
     */
    CMTEnterLoginTypeTabbarMy = 0,
    /**
     *  被登出 － 另一设备登陆
     */
    CMTEnterLoginTypeSingleLoginOut,
    /**
     *    默认
     */
    CMTEnterLoginTypeDefaut
};

/**
 *  手势密码进入验证页面来源类型判断
 */
typedef NS_ENUM(NSInteger, CMT_COMEFROMYZVC) {
    /**
     *  忘记手势密码
     */
    CMT_ForgotGestPwd = 0,
    /**
     *  注册
     */
    CMT_ComeRegister,
    /**
     *    账户安全
     */
    CMT_AccountSafe,
    /**
     *   登录
     */
    CMT_LoginClass,
    /**
     *   没有手势-登录
     */
    CMT_LoginClassNoGes
    
    
};

/**
 * 手势设置类型
 */
typedef  NS_ENUM(NSInteger, GestureViewControllerType){
    /**
     *  设置、忘记
     */
    GestureViewControllerTypeSetting = 1,
    /**
     *  登陆
     */
    GestureViewControllerTypeLogin,
    /**
     *  修改
     */
    GestureViewControllerTypeChange
    
};

/**
 * 进入投资前准备界面类型
 */
typedef NS_ENUM(NSInteger, CMTEnterRealNameShareResultType) {
    /**
     *  从我的 -充值、提现 进入
     */
    CMTEnterRealNameShareResultTypeMy = 0,
    /**
     * 从如何获取福利金进入
     */
    CMTEnterRealNameShareResultTypeHowGetFuLi,
    /**
     *  投资入口
     */
    CMTEnterRealNameShareResultTypeInvest,
    /**
     *  从账户安全设置
     */
    CMTEnterRealNameShareResultTypeSafeAccount,
    /**
     *  首页
     */
    CMTEnterRealNameShareResultTypeHome
};


/**
 * 进入充值或者提现界面类型判断
 */
typedef  NS_ENUM(NSInteger, CMT_EnterRechargeResultType){
    /**
     *  购买确认
     */
    CMT_EnterFromMakeSureClass = 1,
    /**
     *  我的,如何获取福利金。。。
     */
    CMT_EnterFromOtherClass
};



#endif /* CMT_EnumMaro_h */
