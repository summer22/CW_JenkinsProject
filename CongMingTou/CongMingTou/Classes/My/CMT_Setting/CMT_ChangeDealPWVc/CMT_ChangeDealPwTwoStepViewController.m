//
//  CMT_ChangeDealPwTwoStepViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ChangeDealPwTwoStepViewController.h"
#import "CMT_PayTextFiled.h"
#import "CMT_ChangeDealPwThreeStepViewController.h"

@interface CMT_ChangeDealPwTwoStepViewController ()<UITextFieldDelegate>
{
    CMT_PayTextFiled *_textFiled;
}
@end

@implementation CMT_ChangeDealPwTwoStepViewController

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

#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged
{
    NSInteger length = _textFiled.text.length;
    
    if(length==kPasswordLength){
        
        NSString *subTextFeildStr = [_textFiled.text substringToIndex:6];
        [self.view endEditing:YES];
        
        CMT_ChangeDealPwThreeStepViewController *threeStep = [[CMT_ChangeDealPwThreeStepViewController alloc] init];
        threeStep.myNewPassWord = subTextFeildStr;
        [self.navigationController pushViewController:threeStep animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
