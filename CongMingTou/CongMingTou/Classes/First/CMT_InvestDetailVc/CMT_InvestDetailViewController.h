//
//  CMT_InvestDetailViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
@class CMT_InvestDetailModelData;

@interface CMT_InvestDetailViewController : CMT_BaseVIewController
/** 标计划的id */
@property (nonatomic,copy)NSString *planId;
/** 类型识别*/
@property (nonatomic,assign)CMTBidPlanType bidPlanType;
/** 计划名称 */
@property (nonatomic,copy)NSString *bidPlanName;

@property (nonatomic,assign)CMTEnterRealNameShareResultType fromType;

@end
