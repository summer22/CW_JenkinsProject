//
//  CMT_MyRechargeModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyRechargeModel.h"

@implementation CMT_MyRechargeModel

+ (CMT_MyRechargeModel *)myRechargeModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"payInfo"]){
        CMT_RechargeModel *model = [CMT_RechargeModel myRechargeModelWithDic:(NSDictionary *)value];
        self.model = model;
    }
}


@end
