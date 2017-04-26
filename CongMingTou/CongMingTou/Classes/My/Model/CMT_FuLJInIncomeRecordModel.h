//
//  CMT_FuLJInIncomeRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_FuLJInIncomeRecordModel : NSObject
/** 金额 */
@property (nonatomic,copy)NSString *amount;
/** 操作 */
@property (nonatomic,copy)NSString *operation;
/** 时间 */
@property (nonatomic,copy)NSString *time;
/** 状态 （1：增加  2：减少）*/
@property (nonatomic,copy)NSString *state;
/** 投资id */
@property (nonatomic,copy)NSString *investId;

+ (CMT_FuLJInIncomeRecordModel *)myModelWithDic:(NSDictionary *)dic;

@end
