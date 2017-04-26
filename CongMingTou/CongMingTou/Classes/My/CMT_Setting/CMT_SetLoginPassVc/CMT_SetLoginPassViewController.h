//
//  CMT_SetLoginPassViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_GetYzNumbView.h"

@interface CMT_SetLoginPassViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet CMT_GetYzNumbView *yzNumbView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
/** 设置或者忘记类别判断*/
@property (nonatomic,assign)CMT_SETLOGINPwd diffType;
/** 手机号 */
@property (nonatomic,copy)NSString *telNumb;

@end
