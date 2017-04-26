//
//  CMT_RechargeViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_RechargeViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UIImageView *bankIconImg;
@property (weak, nonatomic) IBOutlet UILabel *topMoneyNumb;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *cardLastFourNumb;
@property (weak, nonatomic) IBOutlet UILabel *lastMoneyCount;
@property (weak, nonatomic) IBOutlet UIView *topView;
/** 枚举类别是否来自确认购买*/
@property (nonatomic,assign)CMT_EnterRechargeResultType fromClassType;

@end
