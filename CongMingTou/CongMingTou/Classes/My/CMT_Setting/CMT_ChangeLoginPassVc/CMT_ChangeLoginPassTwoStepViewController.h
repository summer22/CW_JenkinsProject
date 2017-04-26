//
//  CMT_ChangeLoginPassTwoStepViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_TextField.h"

@interface CMT_ChangeLoginPassTwoStepViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet CMT_TextField *myTF;

@property (weak, nonatomic) IBOutlet UIButton *makeSureBtn;
/** 原密码 */
@property (nonatomic,copy)NSString *oldPwd;

@end
