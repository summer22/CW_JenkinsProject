//
//  CMT_ReflectOrReChargeResultViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_MyRechargrResultModel.h"

@interface CMT_ReflectOrReChargeResultViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *resultState;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *oneStepLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UIView *blueLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blueLineH;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
/** 数据源 */
@property (nonatomic,strong)CMT_MyRechargrResultModel *model;

/** 枚举类别显示充值或者提现不同的UI*/
@property (nonatomic,assign)CMT_ReflectOrRecharge whereType;
/** 枚举类别是否来自确认购买*/
@property (nonatomic,assign)CMT_EnterRechargeResultType fromClassType;

@end
