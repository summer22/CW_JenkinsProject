//
//  UIFont+UIFontCategory.m
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.//

#import "UIFont+UIFontCategory.h"

@implementation UIFont (UIFontCategory)

+ (UIFont *)systemFontOfSizeCategroy:(CGFloat)fontSize{
    
    if(CMT_6plusPERCENTY)
    {
        return [self systemFontOfSize:fontSize*1.15];
    }
    if(CMT_6PERCENTY)
    {
        return [self systemFontOfSize:fontSize*1.1];
    }
    return [self systemFontOfSize:fontSize];
}
+ (UIFont *)boldsystemFontOfSizeCategroy:(CGFloat)fontSize
{
    if(CMT_6plusPERCENTY)
    {
        return [self boldSystemFontOfSize:fontSize*1.11];
    }
    if(CMT_6PERCENTY)
    {
        return [self boldSystemFontOfSize:fontSize*1.1];
    }
    return [self boldSystemFontOfSize:fontSize];
}
@end
