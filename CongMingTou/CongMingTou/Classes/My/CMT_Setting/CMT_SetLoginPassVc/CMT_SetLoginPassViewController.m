//
//  CMT_SetLoginPassViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_SetLoginPassViewController.h"
#import "CMT_SetLoginPassTwoStepViewController.h"

@interface CMT_SetLoginPassViewController ()<CMT_GetYzNumbViewDelegate>
{
    NSString *codeStr;
}
@end

@implementation CMT_SetLoginPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.diffType == CMT_SetLoginPwd) {
        self.title = @"设置登录密码";
        self.contentLabel.text =  [NSString stringWithFormat:@"手机验证码将发送至手机%@",[CMT_Tools replacePhonewithStar:[CMT_AccountTool accountModel].mobileNo]];

    }else{
        self.title = @"忘记登录密码";
        self.contentLabel.text =  [NSString stringWithFormat:@"手机验证码将发送至手机%@",[CMT_Tools replacePhonewithStar:self.telNumb]];

    }
    self.yzNumbView.delegate = self;
    [self getYzNumbClick];
    self.nextBtn.userInteractionEnabled = NO;
    
}

#pragma mark - 下一步
- (IBAction)nextBtnAction:(id)sender {
    
    [self.view endEditing:YES];
    [self loadConfirmCode];
}

- (BOOL)confirmInfoMsg{
    if (codeStr.length >= CMT_VerificationCodeLenght) {
            return YES;
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

#pragma mark -- 验证验证码
- (void)loadConfirmCode{
    
    NSString *mobilNo;
    if (self.diffType == CMT_SetLoginPwd) {
        mobilNo = [CMT_AccountTool accountModel].mobileNo;
    }else{
        mobilNo = self.telNumb;
    }    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getCodeConfirm:[CMT_AccountTool accountModel].userId phone:mobilNo captch:codeStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_SetLoginPassTwoStepViewController *setLoginPwdVc = [[CMT_SetLoginPassTwoStepViewController alloc] init];
                setLoginPwdVc.diffType = self.diffType;
                setLoginPwdVc.telNum = self.telNumb;
                [self.navigationController pushViewController:setLoginPwdVc animated:YES];
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
    NSString *mobilNo;
    if (self.diffType == CMT_SetLoginPwd) {
        mobilNo = [CMT_AccountTool accountModel].mobileNo;
    }else{
        mobilNo = self.telNumb;
    }

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:mobilNo withType:@"3" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
