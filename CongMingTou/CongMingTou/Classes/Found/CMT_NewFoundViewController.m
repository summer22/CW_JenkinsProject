//
//  CMT_NewFoundViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_NewFoundViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface CMT_NewFoundViewController ()
@end

@implementation CMT_NewFoundViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(self.webView.canGoBack){
        self.tabBarController.tabBar.hidden = YES;
    }else{
        self.tabBarController.tabBar.hidden = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:FOUNDPAGEINTERFACE]]];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, CMT_TAB_Height, 0);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hiddenOrShowUIDidFinishOrFailLoadState:1];
    [self hideHud];
    
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *navtitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (navtitle) {
        self.navigationItem.title  = navtitle;
    }

    context[@"h5JumpToApp"] = ^() {
        NSArray *args = [JSContext currentArguments];
        int type = [args.firstObject toInt32];
        NSString *planId;
        NSString *planType;
        if ([args objectAtIndex:1]) {
            planId = [[args objectAtIndex:1] toString];
        }
        if ([args objectAtIndex:2]) {
            planType = [[args objectAtIndex:2] toString];
        }
        switch (type) {
                //注册页
            case 1: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRegister];
                });
                break;
            }
                //登录页
            case 2: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toLogin];
                });
                break;
            }
                //理财计划详情页
            case 3: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toInvestDetailWithType:planType planId:planId];
                });
                break;
            }
                //实名绑卡页
            case 4: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRealNameBindCard];
                });
                break;
            }
                //如何获取福利金页
            case 5: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toHowGetFuLiJin];
                });
                break;
            }
                //充值页
            case 6: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRecharge];
                });
                break;
            }
            default:
                break;
        }
    };

    if(webView.canGoBack){
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTitle:@"返回" WithImageName:@"CMT_BackImg" target:self action:@selector(back) blackOrWhite:YES];
        self.tabBarController.tabBar.hidden = YES;
    }else{
        self.navigationItem.leftBarButtonItem = nil;
        self.tabBarController.tabBar.hidden = NO;
    }
}


- (void)noNetWorkbtnClicked:(UIButton *)button{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:FOUNDPAGEINTERFACE]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
