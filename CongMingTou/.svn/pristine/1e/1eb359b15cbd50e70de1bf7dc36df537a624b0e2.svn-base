//
//  CMT_CodeBaseModel.m
//  CongMingTou
//
//  Created by wzh on 16/5/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_CodeBaseModel.h"

@implementation CMT_CodeBaseModel
- (id)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"status"]){
        self.code = value;
    }
    if([key isEqualToString:@"msg"]){
        self.message = value;
    }
}
@end
