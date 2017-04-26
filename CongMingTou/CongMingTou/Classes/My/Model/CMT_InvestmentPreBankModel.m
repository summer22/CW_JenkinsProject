//
//  CMT_InvestmentPreBankModel.m
//  CongMingTou
//
//  Created by wzh on 16/7/6.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestmentPreBankModel.h"

@implementation CMT_InvestmentPreBankModel
+ (CMT_InvestmentPreBankModel *)investmentPreBankModelWithDic:(NSDictionary *)dic{
    return  [[self alloc]initWithDic:dic];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"recordList"]){
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_InvestmentPreBankListModel *model = [CMT_InvestmentPreBankListModel investmentPreBankListModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.bankModelList = [NSArray arrayWithArray:dataArray];
    }
}
@end
