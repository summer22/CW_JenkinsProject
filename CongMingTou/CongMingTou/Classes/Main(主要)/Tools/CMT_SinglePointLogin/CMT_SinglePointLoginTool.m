//
//  CMT_SinglePointLoginTool.m
//  CongMingTou
//
//  Created by wzh on 16/6/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_SinglePointLoginTool.h"
#import "CMT_LoginViewController.h"
#import "CMT_Tools.h"
#import "CMT_GestureUnlockViewController.h"
#import "AppDelegate.h"

#define AfterDelay 3
#define YOffset -100
@implementation CMT_SinglePointLoginTool

+ (void)addSinglePointLoginWithSelfVC:(UIViewController *)selfVC{
    
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].keyWindow;
    if ([del.window isKindOfClass:[CMT_GestureUnlockViewController class]]) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:GesturesAndLoginPasswordPresentVCKey object:nil];
    }
    
    if([CMT_Tools LoginOutToDealWithAccountAndGesturePassword]){
        
        [selfVC showHint:CMT_ErrorOtherEquipmentLogin yOffset:YOffset andAfterDelay:AfterDelay];
        
        CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc]init];
        loginVc.enterLoginType = CMTEnterLoginTypeSingleLoginOut;
        loginVc.diffType = CMT_LOGINTYPE;
        loginVc.preVc = selfVC;
        CMT_NavigationController *loginNav = [[CMT_NavigationController alloc]initWithRootViewController:loginVc];
        [selfVC presentViewController:loginNav animated:YES completion:nil];
    }
}

@end
