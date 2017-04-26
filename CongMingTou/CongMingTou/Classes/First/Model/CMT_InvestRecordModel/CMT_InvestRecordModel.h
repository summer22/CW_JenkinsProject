//
//  CMT_InvestRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_InvestRecordModel : CMT_BaseModel

/** 手机号 */
@property (nonatomic,copy)NSString *iMobile;
/** 投资时间 */
@property (nonatomic,copy)NSString * iTime;
/** 投资金额 */
@property (nonatomic,copy)NSString * iAmount;
/** 数据源list */
@property (nonatomic,strong)NSArray *recordArr;

+ (CMT_InvestRecordModel *)myInvestRecordWithDic:(NSDictionary *)dic;

@end
