//
//  CMT_UserFuLiJInModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_UserFuLiJInModel : CMT_BaseModel

/** 本次投资用户可以使用的福利金上限 */
@property (nonatomic,copy)NSString *timeWelfareLimit;
/** 用户所有的福利金 */
@property (nonatomic,copy)NSString *WelfareAmountTotal;


+ (CMT_UserFuLiJInModel *)myUserFuLiJInModelWithDic:(NSDictionary *)dic;

@end
