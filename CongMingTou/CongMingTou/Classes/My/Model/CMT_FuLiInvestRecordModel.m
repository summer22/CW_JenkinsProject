//
//  CMT_FuLiInvestRecordModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/11.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FuLiInvestRecordModel.h"

@implementation CMT_FuLiInvestRecordModel

+ (CMT_FuLiInvestRecordModel *)myFuLiModelWithDic:(NSDictionary *)dic{
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
