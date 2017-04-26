//
//  NSString+Category.m
//  IZhuJia
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+(NSString *)convertNull:(id)object
{
    if ([object isEqual:[NSNull null]]) {
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (object==nil){
        return @"";
    }
    return object;
}

@end
