//
//  CMT_MyModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyModel : CMT_BaseModel

/** 用户ID */
@property (nonatomic,copy)NSString *userId;
/** 用户手机号 */
@property (nonatomic,copy)NSString *userMobile;
/** 速速赚预期收益 */
@property (nonatomic,copy)NSString *planincomeOnce;
/** 月月息预期收益 */
@property (nonatomic,copy)NSString *planincomeMonth;
/** 累计收益 */
@property (nonatomic,copy)NSString *alreadyincome;
/** 总资产 */
@property (nonatomic,copy)NSString *totalAssets;
/** 福利金 */
@property (nonatomic,copy)NSString *fringeBenefit;
/** 福利金预期收益 */
@property (nonatomic,copy)NSString *fringeBenefitPlanincome;
/** 加息券数量 */
@property (nonatomic,copy)NSString *countJX;
/** 未读消息数量 */
@property (nonatomic,assign)NSInteger unReadCounts;
/** 速速赚在投金额 */
@property (nonatomic,copy)NSString *financialAssetsOnce;
/** 月月息在投金额 */
@property (nonatomic,copy)NSString *financialAssetsMonth;
/** 可用余额 */
@property (nonatomic,copy)NSString *balance;

+ (CMT_MyModel *)myModelWithDic:(NSDictionary *)dic;

@end
