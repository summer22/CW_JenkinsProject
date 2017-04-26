//
//  CMT_MyDealRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyDealRecordModel : CMT_BaseModel
/** 充值数据源 */
@property (nonatomic,strong)NSArray *dataSourceArr;

+ (CMT_MyDealRecordModel *)myModelWithDic:(NSDictionary *)dic;

@end
