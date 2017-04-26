//
//  CMT_HomeAlertModel.h
//  CongMingTou
//
//  Created by summer on 17/1/12.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_HomeAlertModel : CMT_BaseModel
/** imgUrl */
@property (nonatomic,copy)NSString *imgUrl;
/** serviceUrl */
@property (nonatomic,copy)NSString *serviceUrl;
/** amount */
@property (nonatomic,copy)NSString *amount;
/** type */
@property (nonatomic,copy)NSString *type;
/** 当前日期 */
@property (nonatomic,assign)double nowTime;
@end
