//
//  CMT_ChangeDealPwThreeStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ChangeDealPwThreeStepViewController.h"
#import "CMT_PayTextFiled.h"
#import "CMT_AccountSafeViewController.h"

@interface CMT_ChangeDealPwThreeStepViewController ()<UITextFieldDelegate>
{
    CMT_PayTextFiled *_textFiled;
    NSString *subTextFeildStr;
}
@end

@implementation CMT_ChangeDealPwThreeStepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改交易密码";
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

#pragma mark -- 修改交易密码
- (void)setUpdateDealPwd{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getUpDateDealPwdThreeStep:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo newPayPwd:subTextFeildStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                //回到账户安全
                [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
                [self showHint:@"修改成功"];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}


#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged
{
    NSInteger length = _textFiled.text.length;
    
    if(length==kPasswordLength){
        
        subTextFeildStr = [_textFiled.text substringToIndex:6];
        [self.view endEditing:YES];
        if ([self lastTextPwd:subTextFeildStr] == YES) {
            [self setUpdateDealPwd];
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
    if ([textStr isEqualToString:self.myNewPassWord]) {
        return YES;
    }
    [self showHint:@"两次密码输入不一致"];
    return NO;
}
@end
