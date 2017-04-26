//
//  CMT_FuLiInvestRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_FuLiInvestRecordModel : NSObject
/** 待获收益 */
@property (nonatomic,copy)NSString *planIncome;
/** 总加息率 */
@property (nonatomic,copy)NSString *totalApr;
/** 福利金金额 */
@property (nonatomic,copy)NSString *welfareAmount;
/** 到期时间 */
@property (nonatomic,copy)NSString *receiveTime;
/** planType */
@property (nonatomic,copy)NSString *planType;
/** planTitle */
@property (nonatomic,copy)NSString *financialPlanName;
/** 投资id */
@property (nonatomic,copy)NSString *investId;


+ (CMT_FuLiInvestRecordModel *)myFuLiModelWithDic:(NSDictionary *)dic;


@end
