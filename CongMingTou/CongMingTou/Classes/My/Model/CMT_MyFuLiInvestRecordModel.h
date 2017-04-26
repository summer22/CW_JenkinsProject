//
//  CMT_MyFuLiInvestRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_FuLiInvestRecordModel.h"

@interface CMT_MyFuLiInvestRecordModel : CMT_BaseModel
/** 福利金余额 */
@property (nonatomic,copy)NSString *welfareAmount;
/** 在投福利金 */
@property (nonatomic,copy)NSString *welfareInvest;
/** 福利金待收收益 */
@property (nonatomic,copy)NSString *welfareInvestPlanIncome;
/** 福利金已收收益 */
@property (nonatomic,copy)NSString *welfareInvestAlreadyIncome;
/** 数据源 */
@property (nonatomic,strong)NSArray *dataSourceArr;

+ (CMT_MyFuLiInvestRecordModel *)myModelWithDic:(NSDictionary *)dic;

@end
