//
//  CMT_SignInDayItemModel.h
//  button
//
//  Created by wzh on 16/10/26.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_SignInDayItemModel : CMT_BaseModel
// 1没签到 2 签到 3 没到－签到
@property (nonatomic, assign) NSInteger isSignIn;
// 1 灰色 2 红色 0 没有
@property (nonatomic , assign) NSInteger midState;
@property (nonatomic, assign) NSString *day;
@property (nonatomic, assign) NSString *des;
// 1没签到 2 签到 3 没到－签到
@property (nonatomic, copy) NSString *isSign;
//连续签到天数
@property (nonatomic, copy) NSString *CWDays;
/** 签到一天的福利金 */
@property (nonatomic,copy)NSString *welfareAmt;
/** 签到加福利金额度 */
@property (nonatomic,copy)NSString *continuitySignAmt;
/** 签到获取福利金 */
@property (nonatomic,copy)NSString *getWelfare;


+ (CMT_SignInDayItemModel *)mySignInDayModelWithDic:(NSDictionary *)dic;
@end
