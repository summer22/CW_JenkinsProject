//
//  CMT_HowToGetFLJModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_HowToGetFLJModel : NSObject
/** 福利金描述 */
@property (nonatomic,copy)NSString *taskDesc;
/** 任务状态（0：已完成 1：未完成） */
@property (nonatomic,copy)NSString *taskStaus;
/** 任务名称 */
@property (nonatomic,copy)NSString *taskName;
/** 期限 */
@property (nonatomic,copy)NSString *bidPeriod;
/** 姓名 */
@property (nonatomic,copy)NSString *realName;
/** 身份证号 */
@property (nonatomic,copy)NSString *idNumber;
/** 标计划类型 */
@property (nonatomic,copy)NSString *planType;



+ (CMT_HowToGetFLJModel *)myModelWithDic:(NSDictionary *)dic;

@end
