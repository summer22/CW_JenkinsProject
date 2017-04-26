//
//  CMT_ForgetDealPassTwoStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ForgetDealPassTwoStepViewController.h"
#import "CMT_PayTextFiled.h"
#import "CMT_ForgetDealPassWThreeStepViewController.h"

@interface CMT_ForgetDealPassTwoStepViewController ()<UITextFieldDelegate>
{
    CMT_PayTextFiled *_textFiled;
    NSString * subTextFeildStr;
}
@end

@implementation CMT_ForgetDealPassTwoStepViewController

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

        CMT_ForgetDealPassWThreeStepViewController *nextVc = [[CMT_ForgetDealPassWThreeStepViewController alloc] init];
        nextVc.diffType = self.diffType;
        nextVc.pwdStr = subTextFeildStr;
        nextVc.comeFromType = self.comeFromType;
        [self.navigationController pushViewController:nextVc animated:YES];
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
