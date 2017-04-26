//
//  CMT_MyRechargrResultModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyRechargrResultModel : CMT_BaseModel
/** 银行后四位尾号 */
@property (nonatomic,copy)NSString *bankCardEndNo;
/** 金额 */
@property (nonatomic,copy)NSString *amount;

/** 数据源 */
@property (nonatomic,strong)NSArray *modelArr;

+ (CMT_MyRechargrResultModel *)myRechargeResultModelWithDic:(NSDictionary *)dic;

@end
