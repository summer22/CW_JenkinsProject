//
//  CMT_MySuOrYueModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MySuOrYueModel : CMT_BaseModel
/** 速速赚已收收益 */
@property (nonatomic,copy)NSString * fastAlreadyIncome;
/** 速速赚待收收益 */
@property (nonatomic,copy)NSString *fastPlanIncome;
/** 速速赚在投金额 */
@property (nonatomic,copy)NSString *fastAssetsAmount;
/** 月月息已收收益 */
@property (nonatomic,copy)NSString *monthAlreadyIncome;
/** 月月息待收收益 */
@property (nonatomic,copy)NSString *monthPlanIncome;
/** 月月息在投金额 */
@property (nonatomic,copy)NSString *monthAssetsAmount;


/** 数据源 */
@property (nonatomic,strong)NSArray *dataSource;
+ (CMT_MySuOrYueModel *)myModelWithDic:(NSDictionary *)dic;
@end
