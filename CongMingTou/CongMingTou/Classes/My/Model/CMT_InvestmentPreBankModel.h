//
//  CMT_InvestmentPreBankModel.h
//  CongMingTou
//
//  Created by wzh on 16/7/6.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_InvestmentPreBankListModel.h"
@interface CMT_InvestmentPreBankModel : CMT_BaseModel

@property (nonatomic, strong) NSArray *bankModelList;
+ (CMT_InvestmentPreBankModel *)investmentPreBankModelWithDic:(NSDictionary *)dic;

@end
