//
//  CMT_UpVersionModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/22.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_UpVersionModel.h"

@implementation CMT_UpVersionModel

+ (CMT_UpVersionModel *)getUpdateVersionContentModelWithDic:(NSDictionary *)dic{
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
