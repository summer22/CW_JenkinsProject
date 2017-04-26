//
//  CMT_DealPwdMidViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_DealPwdMidViewController.h"
#import "CMT_SetDealPassViewController.h"
#import "CMT_ChangeDealPwOneStepViewController.h"

@interface CMT_DealPwdMidViewController ()

@end

@implementation CMT_DealPwdMidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"修改交易密码";
}
- (IBAction)upDateBtn:(id)sender {
    CMT_ChangeDealPwOneStepViewController *changeDealPwOneStep = [[CMT_ChangeDealPwOneStepViewController alloc] init];
    [self.navigationController pushViewController:changeDealPwOneStep animated:YES];
}
- (IBAction)forgotBtn:(id)sender {
    CMT_SetDealPassViewController *reflectVc = [[CMT_SetDealPassViewController alloc] init];
    reflectVc.diffType = CMT_ForgotDealPwd;
    reflectVc.comeFromType = CMT_ChangeMidPwdClass;
    [self.navigationController pushViewController:reflectVc animated:YES];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.line.backgroundColor = CommonLineColor;
    self.lingH.constant = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
