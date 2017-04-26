//
//  CMT_homeModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_homeModel.h"

@implementation CMT_homeModel

+ (CMT_homeModel *)myHomeModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"plans"]){
        NSMutableArray *bidPlanDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_BidPlanModel *model = [CMT_BidPlanModel myBidPlanListModelWithDic:subDic];
            [bidPlanDataArray addObject:model];
        }
        self.bidPlanArr = [NSArray arrayWithArray:bidPlanDataArray];
    }
    if([key isEqualToString:@"lunboList"]){
        NSMutableArray *lunBoDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_LunBoModel *model = [CMT_LunBoModel myLunBoModelWithDic:subDic];
            [lunBoDataArray addObject:model];
        }
        self.lunBoArr = [NSArray arrayWithArray:lunBoDataArray];
    }
    if([key isEqualToString:@"platFormNewsList"]){
        NSMutableArray *gongGaoDataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_MyGongGModel *model = [CMT_MyGongGModel myGongGModelWithDic:subDic];
            [gongGaoDataArray addObject:model];
        }
        self.gongGaoArr = [NSArray arrayWithArray:gongGaoDataArray];
    }
}

@end
