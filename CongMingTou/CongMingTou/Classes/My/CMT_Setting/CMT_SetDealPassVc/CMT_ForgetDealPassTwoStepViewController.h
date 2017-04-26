//
//  CMT_ForgetDealPassTwoStepViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_ForgetDealPassTwoStepViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
/** 设置或者忘记类别判断*/
@property (nonatomic,assign)CMT_SetDealPwdOrForgotDealPwd diffType;
/** 来自哪里 */
@property (nonatomic,assign)CMT_DEALPWDALERTFROMTYPE comeFromType;
@end
