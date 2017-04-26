//
//  CMT_MakeSureModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MakeSureModel.h"

@implementation CMT_MakeSureModel

+ (CMT_MakeSureModel *)investMakeSureModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"confirmMap"]){
        
        NSDictionary *dict = (NSDictionary *)value;
        
        CMT_MakeSureModelData *model = [[CMT_MakeSureModelData alloc] initWithDic:dict];
        self.plans = model;
    }
}

@end

@implementation CMT_MakeSureModelData

@end
