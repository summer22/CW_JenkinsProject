//
//  CMT_AmountCodInfeModel.m
//  CongMingTou
//
//  Created by kk on 16/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_AmountCodInfeModel.h"

@implementation CMT_AmountCodInfeModel
+ (id)myModelWithDic:(NSDictionary *)dic{
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
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_AmountCodInfeModel *model = [CMT_AmountCodInfeModel myModelWithDic:subDic];
            [dataArray addObject:model];
        }
        self.dataSource = [NSArray arrayWithArray:dataArray];
    }
}
@end
