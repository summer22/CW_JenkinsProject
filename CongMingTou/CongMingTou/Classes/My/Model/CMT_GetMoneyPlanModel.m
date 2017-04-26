//
//  CMT_GetMoneyPlanModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetMoneyPlanModel.h"

@implementation CMT_GetMoneyPlanModel

+ (CMT_GetMoneyPlanModel *)myModelWithDic:(NSDictionary *)dic{
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
