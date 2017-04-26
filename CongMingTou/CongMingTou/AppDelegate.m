 //
//  AppDelegate.m
//  CongMingTou
//
//  Created by wzh on 16/5/10.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "AppDelegate.h"
#import "CMT_AccountModel.h"
#import "CMT_NavigationController.h"
#import "IQKeyboardManager.h"
#import "JPUSHService.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialAlipayShareHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWhatsappHandler.h"
#import <AdSupport/AdSupport.h>
#import "UMSocialWechatHandler.h"
#import "UMSocialWhatsappHandler.h"
#import "UMSocialQQHandler.h"
#import <UserNotifications/UserNotifications.h>
#import "CMT_HomeViewController.h"

@interface AppDelegate ()<JPUSHRegisterDelegate>
/** 首页 */
@property (nonatomic,strong)CMT_HomeViewController *homeVc;
@end

@implementation AppDelegate

- (CMT_HomeViewController *)homeVc
{
    if (!_homeVc) {
        _homeVc = [[CMT_HomeViewController alloc] init];
    }
    return _homeVc;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    IQKeyboardManager *manager =  [IQKeyboardManager sharedManager];//第三方键盘管理
    [manager setEnable:YES];
    manager.shouldResignOnTouchOutside = YES;
    
    [self createUM];//创建UM分享
    
    [self reachableNetStatue];//网络监听
    
    [self JPushMethod:launchOptions]; //极光
    
    [CMT_ControllerTool chooseRootViewController]; //选择控制器
    
    [CMT_Tools showAdvertisingYesOrNo:537.0f * CMT_6PERCENTY]; // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
    
    [CMT_Tools getAdvertisingImage];// 2.无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
    
    
    return YES;
}
#pragma mark --- 极光推送注册
- (void)JPushMethod:(NSDictionary *)launchOptions{
    
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
        
    } else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:JPUSHKEY
                          channel:CHANNEL
                 apsForProduction:isModleProduction
            advertisingIdentifier:advertisingId];
    
    //JPush 监听登陆成功
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkDidLogin:)
                                                 name:kJPFNetworkDidLoginNotification
                                               object:nil];

}
- (void)networkDidLogin:(NSNotification *)notification {
    if ([CMT_AccountTool accountModel]) {
        [JPUSHService setAlias:[CMT_AccountTool accountModel].mobileNo callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
    }else{
//        [JPUSHService setAlias:@"" callbackSelector:nil object:nil];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kJPFNetworkDidLoginNotification
                                                  object:nil];
}
- (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias {
    if (iResCode != 0) {
        [JPUSHService setAlias: [CMT_AccountTool accountModel].mobileNo
              callbackSelector:nil
                        object:self];
    }
//    CMT_Log(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
}
//设置网络监听
- (void)reachableNetStatue
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    NSLog(@"未识别的网络");
                    self.isReachable = NO;
                    break;
                    
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"不可达的网络(未连接)");
                    self.isReachable = NO;
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"2G,3G,4G...的网络");
                    self.isReachable = YES;
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"wifi的网络");
                    self.isReachable = YES;
                    break;
                default:
                    break;
            }
        }];
        
//        3.开始监听
        [manager startMonitoring];
    
}

- (void)createUM{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:CMT_UmengAppkey];
    [UMSocialWechatHandler setWXAppId:CMT_UMWXAPPID appSecret:UMWXAppSecret url:@""];
    [UMSocialQQHandler setQQWithAppId:CMT_QQ_AppId appKey:CMT_QQ_AppKey url:@""];
    [UMSocialConfig setFinishToastIsHidden:YES position:UMSocialiToastPositionBottom];
}
/**
这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
*/
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
     return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
      [JPUSHService registerDeviceToken:deviceToken];
}
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    CMT_Log(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
}
#pragma mark- JPUSHRegisterDelegate
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
//数据处理
- (void)applicationDidEnterBackground:(UIApplication *)application {
     [JPUSHService setBadge:0];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [JPUSHService setBadge:0];
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
    [self.homeVc updateVersion];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    CMT_Log(@"内存警告了");
}

@end
