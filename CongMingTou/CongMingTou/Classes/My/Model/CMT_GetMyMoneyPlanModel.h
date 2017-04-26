//
//  CMT_GetMyMoneyPlanModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_GetMyMoneyPlanModel : CMT_BaseModel
/** 数据源 */
@property (nonatomic,strong)NSArray *dataSource;
/** 计划收益 */
@property (nonatomic,copy)NSString *planIncome;
/** 已收收益 */
@property (nonatomic,copy)NSString *alreadyIncome;

+ (CMT_GetMyMoneyPlanModel *)myModelWithDic:(NSDictionary *)dic;

@end
