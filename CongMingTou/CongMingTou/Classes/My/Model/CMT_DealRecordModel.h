//
//  CMT_DealRecordModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_DealRecordModel : NSObject
/** 金额 */
@property (nonatomic,copy)NSString *amount;
/** 描述 */
@property (nonatomic,copy)NSString *myDescription;
/** 时间 */
@property (nonatomic,copy)NSString *recordTime;
/** 状态0：失败 1：成功 2：处理中 */
@property (nonatomic,copy)NSString *stateFlag;
/** 充值ID 投资ID 提现*/
@property (nonatomic,copy)NSString *recordId;

+ (CMT_DealRecordModel *)myModelWithDic:(NSDictionary *)dic;

@end
