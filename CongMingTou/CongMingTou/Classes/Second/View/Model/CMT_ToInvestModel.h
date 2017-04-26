//
//  CMT_ToInvestModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_ToInvestModel : CMT_BaseModel

/** 理财计划name */
@property (nonatomic,copy)NSString *planName;
/** 投资金额 */
@property (nonatomic,copy)NSString *investAmount;
/** 投资ID */
@property (nonatomic,copy)NSString *investId;
/** 投资结果数据组 */
@property (nonatomic,strong)NSArray *detailListArr;
/** 送福利金提示 */
@property (nonatomic,copy)NSString *welfareAmountDesc;

+ (CMT_ToInvestModel *)myModelWithDic:(NSDictionary *)dic;


@end
