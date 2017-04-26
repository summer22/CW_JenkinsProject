//
//  CMT_MyDealRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyDealRecordModel.h"
#import "CMT_DealRecordModel.h"

@implementation CMT_MyDealRecordModel

+ (CMT_MyDealRecordModel *)myModelWithDic:(NSDictionary *)dic{

    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"recordList"]){
        NSMutableArray *rechargeArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_DealRecordModel *model = [CMT_DealRecordModel myModelWithDic:subDic];
            [rechargeArray addObject:model];
        }
        self.dataSourceArr = [NSArray arrayWithArray:rechargeArray];
    }
}

@end
