//
//  CMT_MyReflectBankCardAndAccountModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyReflectBankCardAndAccountModel.h"

@implementation CMT_MyReflectBankCardAndAccountModel

+ (CMT_MyReflectBankCardAndAccountModel *)myReflectAccountModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"data"]){
        CMT_ReflectBankAndAccountInfoModel *model = [CMT_ReflectBankAndAccountInfoModel myModelWithDic:(NSDictionary *)value[@"userBank"]];
        self.myModel = model;    }
}

@end
