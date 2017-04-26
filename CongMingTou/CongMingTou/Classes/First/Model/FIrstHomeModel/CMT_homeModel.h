//
//  CMT_homeModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_LunBoModel.h"
#import "CMT_MyGongGModel.h"
#import "CMT_BidPlanModel.h"

@interface CMT_homeModel : CMT_BaseModel
/** 未读消息数量，未登录为0 */
@property (nonatomic,assign)NSInteger unReadCounts;
/** 总投资金额 */
@property (nonatomic,copy)NSString *totalInvestAmount;
/** 总投资用户数量 */
@property (nonatomic,copy)NSString *totalInvestPerson;
/** 签到状态 -（0：未签到；1：已签到）*/
@property (nonatomic,copy)NSString *signState;
/** 公告跳转页面url */
@property (nonatomic,copy)NSString *platformNewsUrl;
/** 轮播数据源 */
@property (nonatomic,strong)NSArray *lunBoArr;
/** 公告数据源 */
@property (nonatomic,strong)NSArray *gongGaoArr;
/** 标计划数据源 */
@property (nonatomic,strong)NSArray *bidPlanArr;
/** 签到天数 */
@property (nonatomic,copy)NSString *signDays;
/** 注册福利 */
@property (nonatomic,copy)NSString *registerDescription;

/** 注册送福利信息 */
//@property (nonatomic,copy)NSString *welfareAmount;

+ (CMT_homeModel *)myHomeModelWithDic:(NSDictionary *)dic;

@end
