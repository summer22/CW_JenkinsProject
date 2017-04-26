//
//  CMT_SetLoginPassTwoStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_SetLoginPassTwoStepViewController.h"

@interface CMT_SetLoginPassTwoStepViewController ()

@end

@implementation CMT_SetLoginPassTwoStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.diffType == CMT_SetLoginPwd) {
        self.title = @"设置登录密码";
    }else{
        self.title = @"忘记登录密码";
    }
    self.makeSureBtn.userInteractionEnabled  = NO;
    self.myTF.secureTextEntry = YES;

}

#pragma mark -- 确认点击事件
- (IBAction)makeSureBtnAction:(id)sender {
    [self.view endEditing:YES];

    if (self.diffType == CMT_SetLoginPwd) {
        [self loadSetLoginPwd];
    }else{
        [self loadForgotLoginPwd];
    }
}
- (IBAction)eyeBtnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    self.myTF.secureTextEntry =  !btn.selected;
}

#pragma mark -- 设置登录密码
- (void)loadSetLoginPwd{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getSetLoginPwd:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo newPwd:_myTF.text withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_NAV_BACKTO_ROOT;
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

#pragma mark -- 忘记登录密码
- (void)loadForgotLoginPwd{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getForgotLoginPwd:[CMT_AccountTool accountModel].userId phone:self.telNum newPwd:_myTF.text withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_NAV_BACKTO_ROOT;
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


- (IBAction)textFieldChangeValueNotification:(id)sender {
    self.makeSureBtn.userInteractionEnabled = [self myRegisterBtnStatus];
}

- (BOOL)myRegisterBtnStatus{
    if ([CMT_Tools isRightPwdStrRule:_myTF.text] == YES) {
        [ self.makeSureBtn setBackgroundImage:[UIImage imageNamed:@"CMT_BlueLoneBtnImg"] forState:UIControlStateNormal];
        return YES;
    }
    [ self.makeSureBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
