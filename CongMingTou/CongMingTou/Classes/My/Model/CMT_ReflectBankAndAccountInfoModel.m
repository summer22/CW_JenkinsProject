//
//  CMT_ReflectBankAndAccountInfoModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ReflectBankAndAccountInfoModel.h"

@implementation CMT_ReflectBankAndAccountInfoModel

+ (CMT_ReflectBankAndAccountInfoModel *)myModelWithDic:(NSDictionary *)dic{
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