//
//  CMT_InvestModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestModel.h"

@implementation CMT_InvestModel

+ (CMT_InvestModel *)myHomeModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"planListOnce"]){
        NSMutableArray *bidPlanDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_BidPlanModel *model = [CMT_BidPlanModel myBidPlanListModelWithDic:subDic];
            [bidPlanDataArray addObject:model];
        }
        self.suBidPlanArr = [NSArray arrayWithArray:bidPlanDataArray];
    }
    if([key isEqualToString:@"planListMonth"]){
        NSMutableArray *bidPlanDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_BidPlanModel *model = [CMT_BidPlanModel myBidPlanListModelWithDic:subDic];
            [bidPlanDataArray addObject:model];
        }
        self.yueBidPlanArr = [NSArray arrayWithArray:bidPlanDataArray];
    }

}


@end
