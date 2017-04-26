//
//  CMT_MySuOrYueModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/15.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MySuOrYueModel.h"
#import "CMT_MySuOrYueDataModel.h"

@implementation CMT_MySuOrYueModel
+ (CMT_MySuOrYueModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"datas"]){
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_MySuOrYueDataModel *model = [CMT_MySuOrYueDataModel myModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.dataSource = [NSArray arrayWithArray:dataArray];
    }
}

@end
