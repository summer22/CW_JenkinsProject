//
//  CMT_FuLJInIncomeRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FuLJInIncomeRecordModel.h"

@implementation CMT_FuLJInIncomeRecordModel

+ (CMT_FuLJInIncomeRecordModel *)myModelWithDic:(NSDictionary *)dic{
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
