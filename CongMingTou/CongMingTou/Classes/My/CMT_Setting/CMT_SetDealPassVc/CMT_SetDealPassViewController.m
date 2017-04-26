//
//  CMT_SetDealPassViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_SetDealPassViewController.h"
#import "CMT_ForgetDealPassTwoStepViewController.h"

@interface CMT_SetDealPassViewController ()<CMT_GetYzNumbViewDelegate>
{
    NSString *codeStr;
}
@end

@implementation CMT_SetDealPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yzNumbView.delegate = self;
    if (self.diffType == CMT_SetDealPwd) {
        self.title = @"设置交易密码";
    }else{
        self.title = @"忘记交易密码";
    }
    [self getYzNumbClick];
    self.nextBtn.userInteractionEnabled = NO;
    self.contentLabel.text =  [NSString stringWithFormat:@"手机验证码将发送至手机%@",[CMT_Tools replacePhonewithStar:[CMT_AccountTool accountModel].mobileNo]];

}
- (IBAction)nextBtn:(id)sender {
    [self.view endEditing:YES];
    [self loadMyData];
}

- (BOOL)confirmInfoMsg{
    if (codeStr.length >= CMT_VerificationCodeLenght) {
        if (_myTextField.text.length >0) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

- (void)setBtnStatues{
    if ([self confirmInfoMsg] == YES) {
        self.nextBtn.userInteractionEnabled = YES;
        [self.nextBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailQIangG"] forState:UIControlStateNormal];
    }else{
        self.nextBtn.userInteractionEnabled = NO;
        [self.nextBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    }
}

- (void)viewDidLayoutSubviews{
    self.lineH.constant  = 0.5;
    self.line.backgroundColor = CommonLineColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载数据
- (void)loadMyData{

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getSetDealPwdLogin:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo captch:_yzNumbView.yzTextFiled.text idNumber:_myTextField.text withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [_yzNumbView destroyTimer];
                CMT_ForgetDealPassTwoStepViewController *next = [[CMT_ForgetDealPassTwoStepViewController alloc] init];
                next.diffType = self.diffType;
                next.comeFromType = self.comeFromType;
                [self.navigationController pushViewController:next animated:YES];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

- (IBAction)myTF:(id)sender {
    [self setBtnStatues];
}

#pragma mark -- CMT_GetYzNumbViewDelegate
//点击验证码
- (void)getYzNumbClick{
    
    [self getYzNumbData];
}

//输入框监听代理
- (void)getTextFieldNotification:(NSString *)textStr{
    codeStr = textStr;
    [self setBtnStatues];
}

//获取验证码
- (void)getYzNumbData{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:[CMT_AccountTool accountModel].mobileNo withType:@"3" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [self showHint:@"验证码发送成功"];
                [_yzNumbView startTime];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

- (void)dealloc{
    [self.view endEditing:YES];
    [_yzNumbView destroyTimer];
}


@end
