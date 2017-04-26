//
//  CMT_MyFLIncomeRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyFLIncomeRecordModel : CMT_BaseModel
/** 数据源 */
@property (nonatomic,strong)NSArray *dataSource;
+ (CMT_MyFLIncomeRecordModel *)myModelWithDic:(NSDictionary *)dic;

@end
