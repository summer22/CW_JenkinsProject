//
//  CMT_BidPlanModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_BidPlanModel : NSObject
/** 理财计划 */
@property (nonatomic,copy)NSString *planId;
/** 理财计划状态 */
@property (nonatomic,copy)NSString *status;
/** 理财计划名称 */
@property (nonatomic,copy)NSString *planTitle;
/** 理财计划天数 */
@property (nonatomic,copy)NSString *period;
/** 理财计划年利率 */
@property (nonatomic,copy)NSString *apr;
/** 距离下次可投时间 - 如果标的可投，或者下次标的未发布此值为 -1*/
@property (nonatomic,copy)NSString *nextInvestTime;
/** 置顶标识(0:未置顶；1：已置顶 */
@property (nonatomic,copy)NSString *topFlag;
/** 起投金额 */
@property (nonatomic,copy)NSString *minInvestAmount;
/** 计划标类型  (0:新手；1：速速赚 2.月月息（只是为了给前端一个标识）*/
@property (nonatomic,copy)NSString *planType;
/** 返息类型 */
@property (nonatomic,copy)NSString *planTypeDes;
/** 新手福利专享*/
@property (nonatomic,copy) NSString *enjoyWelfare;
/** indexDesc */
@property (nonatomic,copy)NSString *indexDesc;


+ (CMT_BidPlanModel *)myBidPlanListModelWithDic:(NSDictionary *)dic;

@end
