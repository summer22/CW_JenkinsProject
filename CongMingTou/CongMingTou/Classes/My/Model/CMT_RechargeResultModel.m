//
//  CMT_RechargeResultModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RechargeResultModel.h"

@implementation CMT_RechargeResultModel

+ (CMT_RechargeResultModel *)myRechargeResultModelWithDic:(NSDictionary *)dic{
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

- (NSString *)startDateStr{
    return self.startDate;
}

@end
