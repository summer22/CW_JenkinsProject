//
//  CMT_MyInvestRecordDetailModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyInvestRecordDetailModel : CMT_BaseModel
/** 成功投资描述 */
@property (nonatomic,copy)NSString *oneDescription;
/** 福利金金额 */
@property (nonatomic,copy)NSString *oneWelfareAmount;
/** 成功投资日期 */
@property (nonatomic,copy)NSString *oneDate;
/** 投资的总金额 */
@property (nonatomic,copy)NSString *oneTotalAmount;
/** 计息描述 */
@property (nonatomic,copy)NSString *twoDescription;
/** 计息时间 */
@property (nonatomic,copy)NSString *twoDate;
/** 总利率 */
@property (nonatomic,copy)NSString *twoTotalApr;
/** 利率详情 */
@property (nonatomic,copy)NSString *twoAprDetail;
/** 投资到期描述 */
@property (nonatomic,copy)NSString *threeDescription;
/** 投资到期日期 */
@property (nonatomic,copy)NSString *threeDate;
/** 资金到账描述 */
@property (nonatomic,copy)NSString *fourDescription;
/** 资金到账时间 */
@property (nonatomic,copy)NSString *fourDate;
/** 资金到账金额 */
@property (nonatomic,copy)NSString *fourBalanceAndInterest;
/** 交易编号 */
@property (nonatomic,copy)NSString *businessOrder;
/** 标期限 */
@property (nonatomic,copy)NSString *period;
/** 操作方式 */
@property (nonatomic,copy)NSString *reInvestDes;
/** 标的编号（用于债权信息的查询） */
@property (nonatomic,copy)NSString *bidNo;

@end
