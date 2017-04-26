//
//  UIView+LayerStyle.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (LayerStyle)
- (void)styleWithDefaut;
- (void)styleWithCornerRadius:(CGFloat)cornerRadius;
/**
 *  <#Description#>
 *
 *  @param cornerRadius 圆角半径
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框宽度
 */
- (void)styleWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
/**
 *  <#Description#>
 *
 *  @param cornerRadius 圆角半径
 *  @param borderColor  边框颜色
 *  @param borderWidth  边框宽度
 *  @param shadowColor   阴影颜色
 *  @param shadowOffset  阴影偏移量
 *  @param shadowOpacity 阴影透明度
 *  @param shadowRadius  阴影半径
 */
- (void)styteWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;
- (void)styteWithCornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;
@end
