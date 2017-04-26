//
//  CMT_InvestResultViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
@class CMT_ToInvestModel;

@interface CMT_InvestResultViewController : CMT_BaseVIewController
@property (nonatomic,copy)NSString *bidId;
@property (nonatomic,strong)CMT_ToInvestModel *myModel;
@property (nonatomic,assign)CMTBidPlanType bidPlanType;
@end
