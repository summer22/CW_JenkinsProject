//
//  CMT_MyModel.m
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyModel.h"

@implementation CMT_MyModel

+ (CMT_MyModel *)myModelWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (NSString *)planincomeOnce{
    
    if (!_planincomeOnce || _planincomeOnce.length == 0) {
        return @"0.00";
    }
    return _planincomeOnce;
}

- (NSString *)planincomeMonth{
    
    if (!_planincomeMonth || _planincomeMonth.length == 0) {
        return @"0.00";
    }
    return _planincomeMonth;
}

- (NSString *)alreadyincome{
    
    if (!_alreadyincome || _alreadyincome.length == 0) {
        return @"0.00";
    }
    return _alreadyincome;
}

- (NSString *)totalAssets{
    
    if (!_totalAssets || _totalAssets.length == 0) {
        return @"0.00";
    }
    return _totalAssets;
}
- (NSString *)financialAssetsOnce{
    
    if (!_financialAssetsOnce || _financialAssetsOnce.length == 0) {
        return @"0.00";
    }
    return _financialAssetsOnce;
}
- (NSString *)financialAssetsMonth{
    
    if (!_financialAssetsMonth || _financialAssetsMonth.length == 0) {
        return @"0.00";
    }
    return _financialAssetsMonth;
}
- (NSString *)balance{
    
    if (!_balance || _balance.length == 0) {
        return @"0.00";
    }
    return _balance;
}

@end
