//
//  CMT_RedOrCouponModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_RedOrCouponModel : NSObject

/** 加息状态；1可用加息券    2，已用加息券  3 过期加息券 */
@property (nonatomic,copy)NSString *type;
/** 加息券ID */
@property (nonatomic,copy)NSString *id;
/** 加息券收益率 */
@property (nonatomic,copy)NSString *rate;
/** 加息券描述说明 */
@property (nonatomic,copy)NSString *details;
/** 加息券状态0：未使用，1：已使用 -1：已过期 */
@property (nonatomic,strong)NSNumber *status;
/** 加息券到期时间 */
@property (nonatomic,copy)NSString *endDate;
/** 加息券过期时间剩余的天数 */
@property (nonatomic,copy)NSString *expireDays;
/** 加息券名称 */
@property (nonatomic,copy)NSString *ticketName;


+ (CMT_RedOrCouponModel *)myRedOrCouponWithDic:(NSDictionary *)dic;


@end
