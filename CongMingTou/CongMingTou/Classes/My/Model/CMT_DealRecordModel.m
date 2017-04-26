//
//  CMT_DealRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_DealRecordModel.h"

@implementation CMT_DealRecordModel

+ (CMT_DealRecordModel *)myModelWithDic:(NSDictionary *)dic{
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
