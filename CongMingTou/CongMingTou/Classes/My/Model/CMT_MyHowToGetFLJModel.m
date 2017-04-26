//
//  CMT_MyHowToGetFLJModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyHowToGetFLJModel.h"
#import "CMT_HowToGetFLJModel.h"

@implementation CMT_MyHowToGetFLJModel

+ (CMT_MyHowToGetFLJModel *)myModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initWithDic:dic];
}
    
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"resultList"]){
        NSMutableArray *rechargeArray = [NSMutableArray array];
        for (NSDictionary *subDic in (NSArray *)value) {
            CMT_HowToGetFLJModel *model = [CMT_HowToGetFLJModel myModelWithDic:subDic];
            [rechargeArray addObject:model];
        }
        self.dataSourceArr = [NSArray arrayWithArray:rechargeArray];
    }
}


@end
