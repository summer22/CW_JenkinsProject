//
//  AdvertiseViewController.m
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "AdvertiseViewController.h"

@implementation AdvertiseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:@"LINEKURL"]]]];
    [self.view addSubview:self.webView];
}

- (void)back
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
