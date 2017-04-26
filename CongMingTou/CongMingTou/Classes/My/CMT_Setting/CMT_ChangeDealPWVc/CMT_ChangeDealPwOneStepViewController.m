//
//  CMT_ChangeDealPwOneStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ChangeDealPwOneStepViewController.h"
#import "CMT_ChangeDealPwTwoStepViewController.h"
#import "CMT_PayTextFiled.h"

@interface CMT_ChangeDealPwOneStepViewController ()<UITextFieldDelegate>
{
    CMT_PayTextFiled *_textFiled;
    NSString *subTextFeildStr;
}
@end

@implementation CMT_ChangeDealPwOneStepViewController

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

#pragma mark -- 验证原交易密码
- (void)setDealPwd{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getCompareDealPwdThreeStep:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo oldPayPwd:subTextFeildStr withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([myModel.right isEqualToString:@"1"]) {
                    CMT_ChangeDealPwTwoStepViewController *changeDealTwoStep = [[CMT_ChangeDealPwTwoStepViewController alloc] init];
                    [weakSelf.navigationController pushViewController:changeDealTwoStep animated:YES];
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


#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged{
    
    NSInteger length = _textFiled.text.length;
    
    if(length==kPasswordLength){
        
        subTextFeildStr = [_textFiled.text substringToIndex:6];
        [self.view endEditing:YES];
        [self setDealPwd];
    }
    for(NSInteger i=0;i<kPasswordLength;i++){
        
        UILabel *dotLabel = (UILabel *)[_textFiled viewWithTag:kDotTag + i];
        
        if(dotLabel){
            
            dotLabel.hidden = length <= i;
        }
    }
    [_textFiled sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
