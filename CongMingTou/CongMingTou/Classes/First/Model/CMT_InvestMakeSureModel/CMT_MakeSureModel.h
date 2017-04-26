//
//  CMT_MakeSureModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMT_MakeSureModelData;

@interface CMT_MakeSureModel : NSObject

@property (nonatomic ,copy) NSString *status;

@property (nonatomic ,copy) NSString *msg;
/** key */
@property (nonatomic,strong)CMT_MakeSureModelData *plans;

+ (CMT_MakeSureModelData *)investMakeSureModelWithDic:(NSDictionary *)dic;

- (id)initWithDic:(NSDictionary *)dic;

@end

@interface CMT_MakeSureModelData : CMT_BaseModel

/** 标的Id */
@property (nonatomic,copy)NSString *bidId;
/** 投资金额 */
@property (nonatomic,copy)NSString *investMoney;
/** 预期年化收益率 */
@property (nonatomic,copy)NSString *apr;
/** 投资期限 */
@property (nonatomic,copy)NSString *period;
/** 收益返还方式 */
@property (nonatomic,copy)NSString *repaymentType;
/** 加息券数量 */
@property (nonatomic,copy)NSString *myInterestCount;
/** 刚进入页面是福利金的描述（如果用户有可用福利金：“使用福利金”如果用户没有可用福利金:”无可用福利金”*/
@property (nonatomic,copy)NSString *welfareDescription;
/** 福利金比例 */
@property (nonatomic,copy)NSString *ratio;
/** 防止重复提交的token */
@property (nonatomic,copy)NSString *investToken;
/** 账户剩余金额 */
@property (nonatomic,copy)NSString *balance;
/** 剩余可投金额 */
@property (nonatomic,copy)NSString *leftAmount;
/** 起投金额的倍数 */
@property (nonatomic,copy)NSString *minInvestAmount;
/** 月月息投资月数 */
@property (nonatomic,copy)NSString *investPeriod;
/** 新手最大投资金额 */
@property (nonatomic,copy) NSString *maxNewInvestAmount;
/** 福利金约 */
@property (nonatomic,copy)NSString *welfareBalance;
/** 收益以红包形式发放*/
@property (nonatomic,copy)NSString *profitDesc;
/** 福利金1200000 */
@property (nonatomic,copy)NSString *investWelfareAmount;
/** 福利金1200000投资收益 */
@property (nonatomic,copy)NSString *planIncome;
@end
