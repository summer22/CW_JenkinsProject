//
//  CMT_BankCardAndAccountModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BankCardAndAccountModel.h"

@implementation CMT_BankCardAndAccountModel

+ (CMT_BankCardAndAccountModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
