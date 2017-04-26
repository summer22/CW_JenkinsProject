//
//  CMT_VerificationViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_VerificationViewController.h"
#import "CMT_GestureUnlockViewController.h"
#import "JPUSHService.h"

@interface CMT_VerificationViewController ()<CMT_GetYzNumbViewDelegate>
{
    NSString *codeStr;
    NSString *loginTel;
}
@end

@implementation CMT_VerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证";
    self.finishBtn.userInteractionEnabled = NO;
    
    if (self.comeFromType == CMT_ComeRegister) {
        self.contentLabel.text = [NSString stringWithFormat:@"我们已将验证码短信发送到您的手机%@",[CMT_Tools replacePhonewithStar:self.telNumbStr]];
    }else{
        self.contentLabel.text = [NSString stringWithFormat:@"我们已将验证码短信发送到您的手机%@",[CMT_Tools replacePhonewithStar:[CMT_AccountTool accountModel].mobileNo]];
        self.telNumbStr = [CMT_AccountTool accountModel].mobileNo;
    }
    self.yzNumbView.delegate = self;
    [self getYzNumbClick];//主动获取验证码

}

#pragma mark -- 注册按钮点击事件
- (IBAction)finishBtnAction:(id)sender {
    [self.view endEditing:YES];
    if (self.comeFromType == CMT_ComeRegister) {
        [self toRegist];
    }else{
        [self loadConfirmCode];
    }
}

#pragma mark -- 验证验证码
- (void)loadConfirmCode{
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getCodeConfirm:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo captch:codeStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_GestureUnlockViewController *ges = [[CMT_GestureUnlockViewController alloc] init];
                ges.type = GestureViewControllerTypeSetting;
                ges.comeFromType = self.comeFromType;
                ges.enterLoginType = self.enterLoginType;
                ges.preVc = self.preVc;
                [ges againDisplayBtnClick];
                [weakSelf.navigationController pushViewController:ges animated:YES];
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

#pragma mark -- CMT_GetYzNumbViewDelegate
//点击验证码
- (void)getYzNumbClick{
    
    if (self.telNumbStr.length >= CMT_PhoneNumLenght) {
        [self getYzNumbData];
    }
}

//输入框监听代理
- (void)getTextFieldNotification:(NSString *)textStr{
    codeStr = textStr;
    if (textStr.length >= CMT_VerificationCodeLenght) {
        self.finishBtn.userInteractionEnabled = YES;
        [self.finishBtn setBackgroundImage:[UIImage imageNamed:@"CMT_BlueLoneBtnImg"] forState:UIControlStateNormal];
    }else{
        self.finishBtn.userInteractionEnabled = NO;
        [self.finishBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    }
}

//注册
- (void)toRegist{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getRegister:self.telNumbStr captch:codeStr pwd:self.pwdStr invitationCode:nil channelNumber:nil withBlock:^(CMT_AccountModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                loginTel = weakSelf.telNumbStr;
                [JPUSHService setAlias:weakSelf.telNumbStr
                      callbackSelector:@selector(tagsAliasCallback:tags:alias:)
                                object:self];
                [_yzNumbView destroyTimer];
                [CMT_AccountTool save:myModel];//设备已设置过手势
                if ([CMT_GesturesPasswordTool gesturesPwdModel].openState == 1) {
                    if(_enterLoginType == CMTEnterLoginTypeTabbarMy){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                    }else if(_enterLoginType == CMTEnterLoginTypeDefaut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [weakSelf.preVc.navigationController popToRootViewControllerAnimated:YES];
                    }else if(_enterLoginType == CMTEnterLoginTypeSingleLoginOut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [weakSelf.preVc.navigationController popToRootViewControllerAnimated:YES];
                    }
                    CMT_RootVC.selectedIndex = 0;
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"toRegisterAlert" object:nil];
                }else{
                    CMT_GestureUnlockViewController *ges = [[CMT_GestureUnlockViewController alloc] init];
                    ges.type = GestureViewControllerTypeSetting;
                    ges.comeFromType = weakSelf.comeFromType;
                    ges.enterLoginType = self.enterLoginType;
                    ges.preVc = self.preVc;
                    [weakSelf.navigationController pushViewController:ges animated:YES];
                }
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

//获取验证码
- (void)getYzNumbData{
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:self.telNumbStr withType:@"0" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf showHint:@"验证码发送成功"];
                [_yzNumbView startTime];
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

- (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias {
    if (iResCode != 0) {
        [JPUSHService setAlias: loginTel
              callbackSelector:nil
                        object:self];
    }
    CMT_Log(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
}



- (void)dealloc{
    [self.view endEditing:YES];
    [_yzNumbView destroyTimer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
