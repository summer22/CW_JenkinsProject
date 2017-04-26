//
//  CMT_MyRechargrResultModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyRechargrResultModel.h"
#import "CMT_RechargeResultModel.h"

@implementation CMT_MyRechargrResultModel
+ (CMT_MyRechargrResultModel *)myRechargeResultModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"detailList"]){
        NSMutableArray *rechageResultArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_RechargeResultModel *model = [CMT_RechargeResultModel myRechargeResultModelWithDic:subDic];
            [rechageResultArray addObject:model];
        }
        self.modelArr = [NSArray arrayWithArray:rechageResultArray];
    }
}

@end
