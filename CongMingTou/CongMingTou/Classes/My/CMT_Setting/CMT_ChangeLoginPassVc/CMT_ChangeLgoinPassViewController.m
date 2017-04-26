//
//  CMT_ChangeLgoinPassViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ChangeLgoinPassViewController.h"
#import "CMT_ChangeLoginPassTwoStepViewController.h"

@interface CMT_ChangeLgoinPassViewController ()

@end

@implementation CMT_ChangeLgoinPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改登录密码";
    self.nextBtn.userInteractionEnabled = NO;
}
//下一步
- (IBAction)nextBtn:(id)sender {
    [self.view endEditing:YES];
    [self confirmOldPwd];
}

- (void)confirmOldPwd{

    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getConfirmOldLoginPwd:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo oldPwd:_myTf.text withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([myModel.right isEqualToString:@"1"]) {
                    CMT_ChangeLoginPassTwoStepViewController *nextVc = [[CMT_ChangeLoginPassTwoStepViewController alloc] init];
                    nextVc.oldPwd = _myTf.text;
                    [self.navigationController pushViewController:nextVc animated:YES];
                }
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

- (IBAction)textFieldValueChange:(id)sender {
    self.nextBtn.userInteractionEnabled = [self myRegisterBtnStatus];
}

- (BOOL)myRegisterBtnStatus{
    
    if ([CMT_Tools isRightPwdStrRule:_myTf.text] == YES) {
        
        [ self.nextBtn setBackgroundImage:[UIImage imageNamed:@"CMT_BlueLoneBtnImg"] forState:UIControlStateNormal];
        
        return YES;
    }
    [ self.nextBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
