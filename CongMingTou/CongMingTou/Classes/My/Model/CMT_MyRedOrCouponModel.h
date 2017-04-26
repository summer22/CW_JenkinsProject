//
//  CMT_MyRedOrCouponModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_RedOrCouponModel.h"

@interface CMT_MyRedOrCouponModel : CMT_BaseModel

/** 数据源 */
@property (nonatomic,strong)NSArray *dataSourceArr;

+ (CMT_MyRedOrCouponModel *)myRedOrCouponModelWithDic:(NSDictionary *)dic;

@end
