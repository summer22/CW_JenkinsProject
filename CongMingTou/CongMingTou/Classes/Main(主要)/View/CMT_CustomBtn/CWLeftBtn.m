//
//  CWLeftBtn.m
//  IZhuJia
//
//  Created by 买买提 on 15/5/15.
//  Copyright (c) 2015年 com.firstcare.product. All rights reserved.
//

#import "CWLeftBtn.h"

@implementation CWLeftBtn
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内部图标居中
        self.imageView.contentMode = UIViewContentModeLeft;
        // 文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        // 文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 字体
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

/**
 *  设置内部图标的frame
 */

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
//    CGFloat imageX = self.width;
    return CGRectMake(-5, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = self.height - 15;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX-10, titleY, titleW+35, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    // 1.计算文字的尺寸
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    // 2.计算按钮的宽度
    self.width = titleSize.width;
}

@end
