//
//  CMT_ChangeLoginPassTwoStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ChangeLoginPassTwoStepViewController.h"

@interface CMT_ChangeLoginPassTwoStepViewController ()

@end

@implementation CMT_ChangeLoginPassTwoStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改登录密码";
    self.makeSureBtn.userInteractionEnabled = NO;
    self.myTF.secureTextEntry = YES;
}
- (IBAction)makeSureBtn:(id)sender {
    [self.view endEditing:YES];
    
    if (![self.oldPwd isEqualToString:_myTF.text]) {
        [self loadUpdateLoginPwd];
    }else{
        [self showHint:@"新密码不能和原密码一样"];
    }
}
- (IBAction)eyeBtnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    self.myTF.secureTextEntry =  !btn.selected;
}

- (IBAction)textFieldChangeValue:(id)sender {
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

#pragma mark -- 修改登录密码
- (void)loadUpdateLoginPwd{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getUpdateLoginPwddate:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo newPwd:_myTF.text withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf showHint:@"修改成功"];
                [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
