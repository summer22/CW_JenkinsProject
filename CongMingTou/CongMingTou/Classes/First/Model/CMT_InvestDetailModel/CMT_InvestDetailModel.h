//
//  CMT_InvestDetailModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMT_InvestDetailModelData;

@interface CMT_InvestDetailModel : NSObject

@property (nonatomic ,copy) NSString *status;

@property (nonatomic ,copy) NSString *msg;
/** key */
@property (nonatomic,strong)CMT_InvestDetailModelData *plans;

+ (CMT_InvestDetailModel *)myInvestDetailModelWithDic:(NSDictionary *)dic;

- (id)initWithDic:(NSDictionary *)dic;

@end


@interface CMT_InvestDetailModelData : CMT_BaseModel

/** 标名称 */
@property (nonatomic,copy)NSString *planTitle;
/** 期限 */
@property (nonatomic,copy)NSString *period;
/** 标的ID */
@property (nonatomic,copy)NSString *bidId;
/** 理财计划类型 */
@property (nonatomic,copy)NSString *planType;
/** 年利率 */
@property (nonatomic,copy)NSString *apr;
/** 还款方式 */
@property (nonatomic,copy)NSString *repayType;
/** 起投金额 */
@property (nonatomic,copy)NSString *minInvestAmount;
/** 剩余金额(可投金额) */
@property (nonatomic,copy)NSString *leftAmount;
/** 借款进度比例 */
@property (nonatomic,copy)NSString *loanSchedule;
/** 到期时间 */
@property (nonatomic,copy)NSString *startDate;
/** 结束时间 */
@property (nonatomic,copy)NSString *endDate;
/** 本息到账时间 */
@property (nonatomic,copy)NSString *backDate;
/**  购买人次 */
@property (nonatomic,copy)NSString *hadInvestNumber;
/** 体验金（限新手） */
@property (nonatomic,copy)NSString *cashInvestAmount;
/** 最低可投实际金额 */
@property (nonatomic,copy)NSString *minNewInvestAmount;
/** 最高可投实际金额（限新手） */
@property (nonatomic,copy)NSString *maxNewInvestAmount;
/** 是否可以投资新手标的标识 0：不可投 1： 可投（只有新手标才有这个标识）*/
@property (nonatomic,copy)NSString *couldInvestFlag;

@end
