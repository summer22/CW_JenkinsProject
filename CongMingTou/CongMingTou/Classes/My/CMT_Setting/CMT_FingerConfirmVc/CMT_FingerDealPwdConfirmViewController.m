//
//  CMT_FingerDealPwdConfirmViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FingerDealPwdConfirmViewController.h"
#import "CMT_PayTextFiled.h"
#import "IQKeyboardManager.h"

@interface CMT_FingerDealPwdConfirmViewController ()
{
    CMT_PayTextFiled *_textFiled;
    NSString *subTextFeildStr;
}
@end

@implementation CMT_FingerDealPwdConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开启指纹支付";
    IQKeyboardManager *manager =  [IQKeyboardManager sharedManager];
    [manager setEnableAutoToolbar:NO];
    _textFiled = [[CMT_PayTextFiled alloc]initWithFrame:CGRectMake(25 * CMT_6PERCENTY, 55, CMT_ScreenWidth - 50 * CMT_6PERCENTY, 40)];
    _textFiled.font = [UIFont systemFontOfSize:30];
    [_textFiled addTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_textFiled];
    [self performSelector:@selector(registerKeyBord) withObject:nil afterDelay:1];
}

- (void)registerKeyBord{
    [_textFiled becomeFirstResponder];
}

#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged
{
    NSInteger length = _textFiled.text.length;
    
    if(length==kPasswordLength){
        subTextFeildStr = [_textFiled.text substringToIndex:6];
        [self.view endEditing:YES];
        [self confirmDealPassword:subTextFeildStr];
    }
    for(NSInteger i=0;i<kPasswordLength;i++){
        
        UILabel *dotLabel = (UILabel *)[_textFiled viewWithTag:kDotTag + i];
        
        if(dotLabel){
            
            dotLabel.hidden = length <= i;
        }
    }
    [_textFiled sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark -- 验证原交易密码
- (void)confirmDealPassword:(NSString *)pwds{
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getCompareDealPwdThreeStep:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo oldPayPwd:pwds withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([myModel.right isEqualToString:@"1"]) {
                    weakSelf.backBlock();
                    CMT_NAV_BACK;
                }else{
                    [weakSelf showHint:myModel.msg];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
