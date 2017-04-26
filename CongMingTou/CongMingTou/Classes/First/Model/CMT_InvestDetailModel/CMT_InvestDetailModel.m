//
//  CMT_InvestDetailModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/7.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestDetailModel.h"

@implementation CMT_InvestDetailModel

+ (CMT_InvestDetailModel *)myInvestDetailModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"plan"]){
        
        NSDictionary *dict = (NSDictionary *)value;
        
        CMT_InvestDetailModelData *model = [[CMT_InvestDetailModelData alloc] initWithDic:dict];
        self.plans = model;
    }
}


@end


@implementation CMT_InvestDetailModelData

@end
