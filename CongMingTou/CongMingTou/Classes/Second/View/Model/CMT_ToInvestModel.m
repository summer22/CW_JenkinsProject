//
//  CMT_ToInvestModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ToInvestModel.h"
#import "CMT_ResultModel.h"

@implementation CMT_ToInvestModel

+ (CMT_ToInvestModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"detailList"]){
        NSMutableArray *resultArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_ResultModel *model = [CMT_ResultModel myResultModelWithDic:subDic];
            [resultArray addObject:model];
        }
        self.detailListArr = [NSArray arrayWithArray:resultArray];
    }
}


@end
