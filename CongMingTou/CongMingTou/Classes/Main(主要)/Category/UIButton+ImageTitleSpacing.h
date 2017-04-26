//
//  UIButton+ImageTitleSpacing.h
//  button
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageTitleSpacing)

typedef NS_ENUM(NSUInteger, CMT_ButtonEdgeInsetsStyle) {
    CMT_ButtonEdgeInsetsStyleTop, // image在上，label在下
    CMT_ButtonEdgeInsetsStyleLeft, // image在左，label在右
    CMT_ButtonEdgeInsetsStyleBottom, // image在下，label在上
    CMT_ButtonEdgeInsetsStyleRight // image在右，label在左
};

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(CMT_ButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

- (void)layoutButtonWithEdgeInsetsStyle:(CMT_ButtonEdgeInsetsStyle)style;

@end
