//
//  CMT_AmountCodInfeModel.h
//  CongMingTou
//
//  Created by kk on 16/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_AmountCodInfeModel : CMT_BaseModel
/** 添加时间 */
@property (nonatomic,copy)NSString *add_time;
/** 金额 */
@property (nonatomic,copy)NSString *amount;
/** 债项编号 */
@property (nonatomic,copy)NSString *credit_no;
/** 止息日 */
@property (nonatomic,copy)NSString *endTime;
/** 债项 */
@property (nonatomic,copy)NSString *id;
/** 收益金额 */
@property (nonatomic,copy)NSString *incomeAmount;
/** 承诺收益计算公式 */
@property (nonatomic,copy)NSString *incomeFormula;
/** 机构用户id*/
@property (nonatomic,copy)NSString * institution_use_id;
/** 借款人姓名 */
@property (nonatomic,copy)NSString *loanName;
/** 身份证号 */
@property (nonatomic,copy)NSString *loanNumber;
/** 录入起始终止人id */
@property (nonatomic,copy)NSString *luru_id;
/** 渠道经理id */
@property (nonatomic,copy)NSString *manager_id;
/** 所属需求的订单号 */
@property (nonatomic,copy)NSString *orderNum;
/** 支付日 */
@property (nonatomic,copy)NSString *payTime;
/** 期限 */
@property (nonatomic,copy)NSString *period;
/** 服务利率 */
@property (nonatomic,copy)NSString *serveApr;
/**子需求账单id */
@property (nonatomic,copy)NSString * sonNeedId;
/** 计息开始时间 */
@property (nonatomic,copy)NSString *startTime;
/** 状态 */
//@property (nonatomic,copy)NSString *status;
/** 类型 */
@property (nonatomic,copy)NSString *type;
/** 债项介绍 */
@property (nonatomic,copy)NSString *debtInfo;
/** 还款来源 */


/** 数据源 */
@property (nonatomic,strong)NSArray *dataSource;


+ (id)myModelWithDic:(NSDictionary *)dic;
@end
