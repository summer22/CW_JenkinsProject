//
//  CMT_Macro.h
//  CongMingTou
//
//  Created by wzh on 16/5/6.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#ifndef CMT_Macro_h
#define CMT_Macro_h
#import "CMT_BaseModel.h"
#import "CMT_Tools.h"
#import "CMT_AFNetWorking.h"
#import "CMT_HttpTool.h"
#import "CMT_BaseVIewController.h"
#import "CMT_AccountTool.h"
#import "CMT_AccountModel.h"
#import "CMT_BaseTableViewCell.h"
#import "CMT_ProcessTheDataTool.h"
#import "CMT_BaseModel.h"
#import "CMT_ControllerTool.h"
#import "CMT_TabBarController.h"
#import "CMT_GesturesPasswordTool.h"
#import "CMT_FingerprintManagerTool.h"
#import "CMT_ShareTool.h"
#import "ZHSandBoxPath.h"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "NSMutableAttributedString+SubAttributedString.h"
#import "UIBarButtonItem+Extension.h"
#import "UIViewController+HUD.h"
#import "UIView+LayerStyle.h"
#import "UIView+HUD.h"
#import "CALayer+Animation.h"
#import "CMT_NavigationController.h"
#import "CMT_SinglePointLoginTool.h"
#import "UMSocialSnsPlatformManager.h"
//ZHLog打印开关，打开即可打印
#define TARGET_IPHONE_DEBUG
#define CMT_Log(s, ...)  [CMT_Tools file:__FILE__ function: (char *)__FUNCTION__ lineNumber:__LINE__ format:(s),##__VA_ARGS__]


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define SystemV [[UIDevice currentDevice].systemVersion doubleValue]

//赋值
#define MySetObjectForKey(object,key) [[NSUserDefaults standardUserDefaults]setObject:object forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize];
//取值
#define MyObjectForKey(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]

#define CMT_RootVC ((CMT_TabBarController *)[[[UIApplication sharedApplication].delegate window] rootViewController])
/** 判断版本号码 */
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] //判断版本号码
//屏幕的宽度
#define CMT_ScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕的高度
#define CMT_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define CMT_PercenX    (CMT_ScreenWidth / 320.0)

#define CMT_PercenY    (CMT_ScreenHeight / 568.0)

//相对6的比例
#define CMT_5PERCENTY  (CMT_ScreenWidth / 320)

#define CMT_6PERCENTY  (CMT_ScreenWidth / 375)

#define CMT_6plusPERCENTY  (CMT_ScreenWidth / 414)


// rgb颜色转换（16进制->10进制）
#define CMT_COLORFROMRGB(rgbValue) [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define CMT_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define CMT_NAV_Height 64
#define CMT_TAB_Height 49

//创建btn的normal状态
#define CMT_BTN_NORMAL(a,b) [a setImage:[UIImage imageNamed:b] forState:UIControlStateNormal];
//创建btn的select状态
#define CMT_BTN_SELECT(a,b) [a setImage:[UIImage imageNamed:b] forState:UIControlStateSelected];

//导航返回根控制器
#define CMT_NAV_BACKTO_ROOT  [self.navigationController popToRootViewControllerAnimated:YES]
//导航push到某一个控制器
#define CMT_NAV_PUSHTO_VC(VC)  [self.navigationController pushViewController:VC animated:YES]
//导航返回上一级
#define CMT_NAV_BACK [self.navigationController popViewControllerAnimated:YES]

//处理userId
#define CMT_SETDEFAULTUSERID(USERID) [CMT_Tools userId:USERID]

#define kLineTag 1000
#define kDotTag 3000
#define kPasswordLength  6

////以多大宽为基准
#define CMT_StandardWidth 375
#define CMT_StandardHeight 667
#define CMT_ScreenLeftMid 15
#define CMT_ScreenRightMid 15
#define CMT_ScreenCellLeftMid 7
#define CMT_ScreenCellRightMid 7
#define CMT_ProportionX CMT_ScreenWidth / CMT_StandardWidth
#define CMT_ProportionY CMT_ScreenHeight / CMT_StandardHeight
#define CMT_6pAnd6ps CMT_ScreenWidth > CMT_StandardWidth

#define JPUSHKEY @"e04f8457c253352945f5ebb7"
#define CHANNEL  @"Publish channel"
#endif



