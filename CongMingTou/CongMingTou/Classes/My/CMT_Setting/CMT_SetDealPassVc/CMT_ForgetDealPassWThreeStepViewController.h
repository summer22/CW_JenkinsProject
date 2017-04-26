//
//  CMT_ForgetDealPassWThreeStepViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_ForgetDealPassWThreeStepViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
/** 交易密码 */
@property (nonatomic,copy)NSString *pwdStr;
/** 来自哪里 */
@property (nonatomic,assign)CMT_DEALPWDALERTFROMTYPE comeFromType;
/** 设置或者忘记类别判断*/
@property (nonatomic,assign)CMT_SetDealPwdOrForgotDealPwd diffType;
@end
