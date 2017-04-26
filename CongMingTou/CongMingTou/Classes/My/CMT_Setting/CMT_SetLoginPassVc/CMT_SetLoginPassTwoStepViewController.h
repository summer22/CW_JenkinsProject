//
//  CMT_SetLoginPassTwoStepViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_TextField.h"

@interface CMT_SetLoginPassTwoStepViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UIButton *makeSureBtn;
/** 设置或者忘记类别判断*/
@property (nonatomic,assign)CMT_SETLOGINPwd diffType;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTF;
/** 手机号 */
@property (nonatomic,copy)NSString *telNum;

@end
