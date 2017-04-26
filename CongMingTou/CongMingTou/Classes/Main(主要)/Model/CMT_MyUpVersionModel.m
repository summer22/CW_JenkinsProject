//
//  CMT_MyUpVersionModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/22.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyUpVersionModel.h"

@implementation CMT_MyUpVersionModel

+ (CMT_MyUpVersionModel *)getUpdateVersionContentModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"appInfo"]){
        NSDictionary *dict = (NSDictionary *)value;
        self.discoveryUrl = dict[@"discoveryUrl"];
    }
    if([key isEqualToString:@"version"]){
        CMT_UpVersionModel *model = [CMT_UpVersionModel getUpdateVersionContentModelWithDic:(NSDictionary *)value];
        self.versionDataModel = model;
    }
}


@end
