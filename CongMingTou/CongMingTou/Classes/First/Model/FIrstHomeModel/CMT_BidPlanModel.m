//
//  CMT_BidPlanModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BidPlanModel.h"

@implementation CMT_BidPlanModel

+ (CMT_BidPlanModel *)myBidPlanListModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
