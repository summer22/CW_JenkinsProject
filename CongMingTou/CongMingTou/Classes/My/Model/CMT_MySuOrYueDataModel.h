//
//  CMT_MySuOrYueDataModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_MySuOrYueDataModel : NSObject

/** 理财计划名称 */
@property (nonatomic,copy)NSString *financialPlanName;
/** 总加息率 */
@property (nonatomic,copy)NSString *totalApr;
/** 待收本金(或已收本金) */
@property (nonatomic,copy)NSString *investAmountBalance;
/** 待获收益（或已收收益） */
@property (nonatomic,copy)NSString *planIncomeOrAlreadyIncome;
/** 到期时间或者已赎回的状态的文字 */
@property (nonatomic,copy)NSString *stateDescriptionOrEndDate;
/** 理财计划类型，同首页列表 */
@property (nonatomic,copy)NSString *planType;
/** 投资id */
@property (nonatomic,copy)NSString *investId;

+ (CMT_MySuOrYueDataModel *)myModelWithDic:(NSDictionary *)dic;

@end
