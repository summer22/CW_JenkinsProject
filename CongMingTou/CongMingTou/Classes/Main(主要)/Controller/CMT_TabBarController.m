//
//  CMT_TabBarController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_TabBarController.h"
#import "CMT_NavigationController.h"
#import "ZHTabBar.h"
#import "CMT_TabBar.h"
#import "UIApplication+ActivityViewController.h"
#import "CMT_NoSetGesturesSwitchTool.h"
#import "CMT_LoginViewController.h"
#import "CMT_GestureUnlockViewController.h"
#import "CMT_NewMyViewController.h"
#import "CMT_HomeViewController.h"
#import "CMT_NewFoundViewController.h"
#import "CMT_InvestViewController.h"
#import "AppDelegate.h"

@interface CMT_TabBarController ()<HNTabBarDelegate,UITabBarControllerDelegate>
{
    CMT_GestureUnlockViewController *ges;
}
@end

@implementation CMT_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);//清空分享进入后台的标识

    // 添加所有的子控制器
    [self addAllChildVcs];
    
    // 创建自定义tabbar
    [self addCustomTabBar];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideGesOrFingerVc) name:GesturesAndLoginPasswordPresentVCKey object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gesturesPasswordPresentVC) name:UIApplicationDidFinishLaunchingNotification object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gesturesPasswordPresentVC) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationDidFinishLaunchingNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:GesturesAndLoginPasswordPresentVCKey object:nil];
}

/**
 *  创建自定义tabbar
 */
- (void)addCustomTabBar
{
    CMT_TabBar *customTabBar = [[CMT_TabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    customTabBar.tabbarType = HNTabBarTypeCustom;
    [self setValue:customTabBar forKeyPath:@"tabBar"]; //更换系统自带的tabbar
    self.tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    self.delegate = self;
    self.tabBarController.tabBar.opaque = YES;
    [self.tabBarController.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.tabBarController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(10, -10)];
}
/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    CMT_HomeViewController *financialVC = [[CMT_HomeViewController alloc] init];
    [self addOneChlildVc:financialVC title:@"首页" imageName:@"TabBar_One_Normal" selectedImageName:@"TabBar_One_Select"];
    CMT_InvestViewController *securityVC = [[CMT_InvestViewController alloc] init];
    [self addOneChlildVc:securityVC title:@"投资" imageName:@"TabBar_Two_Normal" selectedImageName:@"TabBar_Two_Selected"];
    CMT_NewFoundViewController *foundVC = [[CMT_NewFoundViewController alloc] init];
    [self addOneChlildVc:foundVC title:@"发现" imageName:@"CMT_Third_Normal" selectedImageName:@"CMT_Third_Selected"];
    CMT_NewMyViewController *MyVC = [[CMT_NewMyViewController alloc] init];
    [self addOneChlildVc:MyVC title:@"我的" imageName:@"CMT_Four_Normal" selectedImageName:@"CMT_Four_Selected"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = CommonGrayColor;
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = ThemeBackgroundColor;
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    CMT_NavigationController *nav = [[CMT_NavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    if(tabBarController.selectedIndex == 3){
    
        if(![CMT_AccountTool accountModel]){
            CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc]init];
            loginVc.diffType = CMT_LOGINTYPE;
            loginVc.enterLoginType = CMTEnterLoginTypeTabbarMy;
            CMT_NavigationController *loginNav = [[CMT_NavigationController alloc]initWithRootViewController:loginVc];
            [self presentViewController:loginNav animated:YES completion:nil];
        }
    }
}

#pragma mark - HMTabBarDelegate
- (void)tabBarDidClickedPlusButton:(CMT_TabBar *)tabBar{
    CMT_Log(@"点击了中间按钮");
}

- (void)gesturesPasswordPresentVC{
    
    UIViewController *activityVc = [UIApplication sharedApplication].activityViewController;
        NSNumber *number = MyObjectForKey(CMT_Share_key);
        CMT_Log(@"分享标识%@",number);
        if([number intValue] == 0){//点击分享进入后台
            if ([CMT_Tools isPresentGestOrFingerToConfirm] == YES) {
                if ([CMT_Tools presentFingerOrGest] == YES) {
                    [self presentFingerConfirm];
                    if (![activityVc isKindOfClass:[CMT_GestureUnlockViewController class]]) {
                        [self jumpGesVc];
                    }
                }else{
                    if (![activityVc isKindOfClass:[CMT_GestureUnlockViewController class]]) {
                        [self jumpGesVc];
                    }
                }
            }else if([CMT_AccountTool accountModel]){
                ges = [[CMT_GestureUnlockViewController alloc] init];
                ges.type = GestureViewControllerTypeSetting;
                CMT_NavigationController *nav = [[CMT_NavigationController alloc] initWithRootViewController:ges];
                [self presentViewController:nav animated:YES completion:nil];
            }
        }else{
            MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);//清空分享进入后台的标识
        }
}

- (void)jumpGesVc{
    ges = [[CMT_GestureUnlockViewController alloc] init];
    ges.type = GestureViewControllerTypeLogin;
    CMT_NavigationController *nav = [[CMT_NavigationController alloc] initWithRootViewController:ges];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)presentFingerConfirm{
    
    [CMT_FingerprintManagerTool  fingerprintValidationWithTitle:@"请输入指纹验证登录" Block:^(BOOL success, NSError *error, NSError *deviceError) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //用户选择输入密码，切换主线程处理
            if(success == YES && !error && !deviceError){//验证成功
//                [self showHint:CMT_FingerprintValidationSuccessful];
                [ges jumpBtnClick];
            }else if (success == NO && error){//指纹验证失败，请重新验证
                if(error.code == LAErrorSystemCancel || error.code == LAErrorUserCancel ||error.code == LAErrorUserFallback){
//                    [self showHint:CMT_FingerprintValidationCancel];
                }else{
                    [self showHint:CMT_Error_FingerprintValidation];
                }
            }else{
                if(deviceError.code == LAErrorTouchIDNotEnrolled){////设备Touch ID不可用，用户未录入
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorTouchIDNotAvailable){ //设备Touch ID不可用，例如未打开
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorPasscodeNotSet){//系统未设置密码
                    [self showHint:CMT_Error_DeviceErrorNOSetFingerprint];
                }else if (deviceError.code == LAErrorAuthenticationFailed){//授权失败
                    [self showHint:CMT_Error_DeviceErrorAuthorizationError];
                }else{
                    [self showHint:CMT_Error_DeviceErrorFingerprintValidation];//设备不支持
                }
            }
        }];
    }];
}

#pragma mark -- 单点手势和指纹
- (void)hideGesOrFingerVc{
    if (ges) {
        [ges jumpBtnClick];
    }
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}


@end
