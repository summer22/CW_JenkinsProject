//
//  CMT_MyFuLiInvestRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyFuLiInvestRecordModel.h"

@implementation CMT_MyFuLiInvestRecordModel

+ (CMT_MyFuLiInvestRecordModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"recordList"]){
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_FuLiInvestRecordModel *model = [CMT_FuLiInvestRecordModel myFuLiModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.dataSourceArr = [NSArray arrayWithArray:dataArray];
    }
}

@end
