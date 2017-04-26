//
//  CMT_MyRechargeModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_RechargeModel.h"

@interface CMT_MyRechargeModel : CMT_BaseModel
/** 数据源 */
@property (nonatomic,strong)CMT_RechargeModel *model;

+ (CMT_MyRechargeModel *)myRechargeModelWithDic:(NSDictionary *)dic;

@end
