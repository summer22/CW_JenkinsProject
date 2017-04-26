//
//  CMT_FuliMakeSureViewController.h
//  CongMingTou
//
//  Created by summer on 17/1/11.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_FuliMakeSureViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *myBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *investAmount;
@property (weak, nonatomic) IBOutlet UILabel *expectLabel;
@property (weak, nonatomic) IBOutlet UILabel *tsLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (nonatomic,copy)NSString *planId;
@property (nonatomic,copy)NSString *bidId;
@end
