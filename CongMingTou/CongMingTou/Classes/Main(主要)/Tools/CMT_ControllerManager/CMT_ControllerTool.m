//
//  CMT_ControllerTool.m
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_ControllerTool.h"
#import "CMT_NewFeatureViewController.h"
#import "CMT_TabBarController.h"

@interface CMT_ControllerTool ()

@end

@implementation CMT_ControllerTool
+ (void)chooseRootViewController
{
    // 如何知道第一次使用这个版本？比较上次的使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
    NSString *lastVersion = MyObjectForKey(versionKey);
    // 获得当前打开软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if ([currentVersion isEqualToString:lastVersion]) {
        // 当前版本号 == 上次使用的版本：显示HMTabBarViewController
        [UIApplication sharedApplication].statusBarHidden = NO;
        window.rootViewController = [[CMT_TabBarController alloc] init];
    } else { // 当前版本号 != 上次使用的版本：显示版本新特性
//        [CMT_ControllerTool liveMobileIdfi];//激活应用雷达
        window.rootViewController = [[CMT_NewFeatureViewController alloc] init];
    }
}

//激活应用雷达
+ (void)liveMobileIdfi
{
    [CMT_ProcessTheDataTool liveModelIdfiAndBlock:^(id jsonObject, NSError *error) {
//        CMT_Log(@"激活应用雷达 == %@",jsonObject);
    }];
}


@end
