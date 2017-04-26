//
//  CMT_DealRecordDetailModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_DealRecordDetailModel : CMT_BaseModel
/** 开始时间 */
@property (nonatomic,copy)NSString *startTime;
/** 手续费 */
@property (nonatomic,copy)NSString *fee;
/** 金额 */
@property (nonatomic,copy)NSString * amount;
/** 交易类型 */
@property (nonatomic,copy)NSString *tradeType;
/** 订单号 */
@property (nonatomic,copy)NSString *orderNo;
/** 描述 */
@property (nonatomic,copy)NSString *myDescription;
// 状态 0:失败 1:成功 2:处理中
@property (nonatomic,copy)NSString *stateFlag;
/** 结束时间 */
@property (nonatomic,copy)NSString *endTime;

@end
