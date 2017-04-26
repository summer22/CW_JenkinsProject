//
//  CMT_ResultModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_ResultModel : NSObject
/** 时间 */
@property (nonatomic,copy)NSString *time;
/** 事件 */
@property (nonatomic,copy)NSString *event;
/** 状态 */
@property (nonatomic,copy)NSNumber *state;

+ (CMT_ResultModel *)myResultModelWithDic:(NSDictionary *)dic;

@end
