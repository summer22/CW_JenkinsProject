//
//  CMT_RechargeResultModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_RechargeResultModel : NSObject
/** startDate */
@property (nonatomic,copy)NSString *startDate;
/** startDescription */
@property (nonatomic,copy)NSString *startDescription;
/** endDescription */
@property (nonatomic,copy)NSString *endDescription;
/** 覆盖startDate 和系统的冲突 */
@property (nonatomic,copy)NSString *startDateStr;


+ (CMT_RechargeResultModel *)myRechargeResultModelWithDic:(NSDictionary *)dic;


@end
