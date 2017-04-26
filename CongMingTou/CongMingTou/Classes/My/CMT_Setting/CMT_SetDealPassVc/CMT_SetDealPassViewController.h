//
//  CMT_SetDealPassViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_GetYzNumbView.h"
#import "CMT_TextField.h"

@interface CMT_SetDealPassViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet CMT_GetYzNumbView *yzNumbView;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
/** 设置或者忘记类别判断*/
@property (nonatomic,assign)CMT_SetDealPwdOrForgotDealPwd diffType;
/** 来自哪里 */
@property (nonatomic,assign)CMT_DEALPWDALERTFROMTYPE comeFromType;

@end
