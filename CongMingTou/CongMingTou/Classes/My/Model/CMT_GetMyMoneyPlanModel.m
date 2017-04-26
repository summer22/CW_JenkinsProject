//
//  CMT_GetMyMoneyPlanModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetMyMoneyPlanModel.h"
#import "CMT_GetMoneyPlanModel.h"

@implementation CMT_GetMyMoneyPlanModel

+ (CMT_GetMyMoneyPlanModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"planList"]){
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_GetMoneyPlanModel *model = [CMT_GetMoneyPlanModel myModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.dataSource = [NSArray arrayWithArray:dataArray];
    }
}

@end
