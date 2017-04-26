//
//  CMT_ForgetDealPassWThreeStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ForgetDealPassWThreeStepViewController.h"
#import "CMT_PayTextFiled.h"
#import "CMT_MakeSureViewController.h"
#import "CMT_DealPwdMidViewController.h"
#import "CMT_ReflectViewController.h"
#import "CMT_NewMyViewController.h"
#import "CMT_HowGetFuliJInViewController.h"
#import "CMT_AccountSafeViewController.h"

@interface CMT_ForgetDealPassWThreeStepViewController ()<UITextFieldDelegate>
{
    CMT_PayTextFiled *_textFiled;
    NSString *subTextFeildStr;
}
@end

@implementation CMT_ForgetDealPassWThreeStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.diffType == CMT_SetDealPwd) {
        self.title = @"设置交易密码";
    }else{
        self.title = @"忘记交易密码";
    }
    [self setDealPassW];
}

- (void)setDealPassW{
    
    _textFiled = [[CMT_PayTextFiled alloc]initWithFrame:CGRectMake(25 * CMT_6PERCENTY, self.bottomLabel.bottom + 30, CMT_ScreenWidth - 50 * CMT_6PERCENTY, 40)];
    _textFiled.delegate = self;
    _textFiled.font = [UIFont systemFontOfSize:30];
    [_textFiled addTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_textFiled];
    
    [_textFiled becomeFirstResponder];
}

#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged
{
    NSInteger length = _textFiled.text.length;
    
    if(length==kPasswordLength){
        
        subTextFeildStr = [_textFiled.text substringToIndex:6];
        [self.view endEditing:YES];
        if ([self lastTextPwd:subTextFeildStr] == YES) {
            
            if (self.diffType == CMT_SetDealPwd) {
                [self setDealPwd];
            }else{
                [self forgotDealPwd];
            }
        }
    }
    for(NSInteger i=0;i<kPasswordLength;i++){
        
        UILabel *dotLabel = (UILabel *)[_textFiled viewWithTag:kDotTag + i];
        
        if(dotLabel){
            
            dotLabel.hidden = length <= i;
        }
    }
    [_textFiled sendActionsForControlEvents:UIControlEventValueChanged];
}

- (BOOL)lastTextPwd:(NSString *)textStr{
    if ([textStr isEqualToString:self.pwdStr]) {
        return YES;
    }
    [self showHint:@"两次密码输入不一致"];
    return NO;
}

#pragma mark -- 设置交易密码
- (void)setDealPwd{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getSetDealPwdThreeStep:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo payPwd:self.pwdStr rePayPwd:subTextFeildStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_AccountModel *model = [CMT_AccountTool accountModel];
                model.payPasswordState = @"1";
                [CMT_AccountTool save:model];
                [self showHint:@"设置成功"];
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

#pragma mark -- 忘记交易密码
- (void)forgotDealPwd{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getForgotDealPwdThreeStep:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo payPwd:self.pwdStr rePayPwd:subTextFeildStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [self showHint:@"设置成功"];
                if (self.comeFromType == CMT_MakeSureInvestClass) {
                    [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[2] animated:YES];
                }else if(self.comeFromType == CMT_ChangeMidPwdClass){
                    [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
                }else if(self.comeFromType == CMT_ReflectClass){
                    [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
                }else if(self.comeFromType == CMT_HowGetFuLiJinClass){
                    [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[2] animated:YES];
                }else if(self.comeFromType == CMT_MyClass){
                    CMT_NAV_BACKTO_ROOT;
                }else if(self.comeFromType == CMT_SafeAccountClass){
                    CMT_NAV_BACKTO_ROOT;
                }else{
                    CMT_NAV_BACKTO_ROOT;
                }
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
