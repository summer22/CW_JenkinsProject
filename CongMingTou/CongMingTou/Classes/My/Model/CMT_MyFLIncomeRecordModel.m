//
//  CMT_MyFLIncomeRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyFLIncomeRecordModel.h"
#import "CMT_FuLJInIncomeRecordModel.h"

@implementation CMT_MyFLIncomeRecordModel

+ (CMT_MyFLIncomeRecordModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"recordList"]){
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_FuLJInIncomeRecordModel *model = [CMT_FuLJInIncomeRecordModel myModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.dataSource = [NSArray arrayWithArray:dataArray];
    }
}

@end
