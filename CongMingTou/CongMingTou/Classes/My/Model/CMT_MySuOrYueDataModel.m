//
//  CMT_MySuOrYueDataModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MySuOrYueDataModel.h"

@implementation CMT_MySuOrYueDataModel

+ (CMT_MySuOrYueDataModel *)myModelWithDic:(NSDictionary *)dic{
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
