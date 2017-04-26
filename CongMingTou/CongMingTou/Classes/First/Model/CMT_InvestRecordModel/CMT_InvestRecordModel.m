//
//  CMT_InvestRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestRecordModel.h"

@implementation CMT_InvestRecordModel

+ (CMT_InvestRecordModel *)myInvestRecordWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"investList"]){
        NSMutableArray *recordDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_InvestRecordModel *model = [CMT_InvestRecordModel myInvestRecordWithDic:subDic];
            [recordDataArray addObject:model];
        }
        self.recordArr = [NSArray arrayWithArray:recordDataArray];
    }
}

@end
