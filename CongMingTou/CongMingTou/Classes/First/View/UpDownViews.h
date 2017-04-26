//
//  UpDownViews.h
//  XXxfs
//
//  Created by 刘永杰 on 16/9/29.
//  Copyright © 2016年 xjk. All rights reserved.
//
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)


#import <UIKit/UIKit.h>

@interface UpDownViews : UIView


//赋值数据方法
- (void)setViewWithHeaderTitle:(NSString *)title;

@end
