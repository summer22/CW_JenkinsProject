//
//  CMT_InvestModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_InvestModel : CMT_BaseModel
/** 速速赚数据源 */
@property (nonatomic,strong)NSArray *suBidPlanArr;
/** 月月息 */
@property (nonatomic,strong)NSArray *yueBidPlanArr;
/** 投资列表速速赚返息类型 */
@property (nonatomic,copy)NSString *planTypeDesOnce;
/** 投资列表月月息返息类型 */
@property (nonatomic,copy)NSString *planTypeDesMonth;
@property (nonatomic,copy)NSString *monthDesc;
@property (nonatomic,copy)NSString *onceDesc;

+ (CMT_InvestModel *)myHomeModelWithDic:(NSDictionary *)dic;

@end
