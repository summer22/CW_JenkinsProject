//
//  CMT_BaseVIewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_BaseVIewController()

@end

@implementation CMT_BaseVIewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = CommonBgColor;
    if(self.navigationController.viewControllers.count > 1){
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTitle:@"返回" WithImageName:@"CMT_BackImg" target:self action:@selector(back) blackOrWhite:YES];
    }
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
