//
//  CMT_GetMoneyPlanModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_GetMoneyPlanModel : NSObject
/** 金额 */
@property (nonatomic,copy)NSString *amount;
/** 序号（从1开始，list本身的顺序也是按照序号排序的，即按照时间正序） */
@property (nonatomic,copy)NSString *index;
/** 描述 */
@property (nonatomic,copy)NSString *timeAndDes;
/** 状态（0,：未收 1 ：已收） */
@property (nonatomic,copy)NSString *state;

+ (CMT_GetMoneyPlanModel *)myModelWithDic:(NSDictionary *)dic;

@end
