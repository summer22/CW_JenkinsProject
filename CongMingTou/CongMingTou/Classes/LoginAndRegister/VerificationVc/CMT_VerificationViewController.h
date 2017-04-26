//
//  CMT_VerificationViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_GetYzNumbView.h"
#import "CMT_GestureUnlockViewController.h"

@interface CMT_VerificationViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet CMT_GetYzNumbView *yzNumbView;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
/** 手机号 */
@property (nonatomic,copy)NSString *telNumbStr;
/** 密码 */
@property (nonatomic,copy)NSString *pwdStr;
/** 来源*/
@property (nonatomic,assign)CMT_COMEFROMYZVC comeFromType;
//手势类型
@property (nonatomic, assign) GestureViewControllerType type;

@property (nonatomic,assign)CMTEnterLoginType enterLoginType;

@property (nonatomic, strong) UIViewController *preVc;

@end
