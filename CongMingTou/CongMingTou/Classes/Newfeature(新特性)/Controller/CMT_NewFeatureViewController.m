//
//  CMT_NewFeatureViewController.m
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_NewFeatureViewController.h"
#import "CMT_GuideScrollView.h"

@interface CMT_NewFeatureViewController ()<CMT_GuideScrollViewDelegate>

@end

@implementation CMT_NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getImg];
}

- (void)getImg{
    CMT_GuideScrollView *scrollView = [[CMT_GuideScrollView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight)];
    scrollView.myDelegate = self;
    [self.view addSubview:scrollView];
}

#pragma mark - CMT_GuideScrollViewDelegate

- (void)enterToHome{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 当前版本号 == 上次使用的版本：显示TabBarViewController
    [UIApplication sharedApplication].statusBarHidden = NO;
    window.rootViewController = [[CMT_TabBarController alloc] init];
}

@end
