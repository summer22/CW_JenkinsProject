//
//  CMT_HeadlinesViewController.m
//  CongMingTou
//
//  Created by kk on 16/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HeadlinesViewController.h"

@interface CMT_HeadlinesViewController ()

@end

@implementation CMT_HeadlinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_requestUrlstr]]];
}
- (void)back
{
    if ([self.webView canGoBack]) {
    [self.webView goBack];
    }else{
     [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)noNetWorkbtnClicked:(UIButton *)button{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_requestUrlstr]]];
}


@end
