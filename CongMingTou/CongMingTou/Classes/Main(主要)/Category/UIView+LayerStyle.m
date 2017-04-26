//
//  UIView+LayerStyle.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.//

#import "UIView+LayerStyle.h"

@implementation UIView (LayerStyle)

- (void)styleWithDefaut{
    self.layer.masksToBounds = YES;
    if(![self isKindOfClass:[UILabel class]]){
        self.clipsToBounds = NO;
    }
    self.layer.borderColor = nil;
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.shadowColor = nil;//阴影颜色
    self.layer.shadowOpacity = 0;//不透明度
    self.layer.shadowRadius = 0;//半径
    self.layer.shadowOffset = CGSizeMake(0, -3);//偏移距离

}
- (void)styleWithCornerRadius:(CGFloat)cornerRadius{
    
    [self styteWithCornerRadius:cornerRadius borderColor:nil borderWidth:0 shadowColor:0 shadowOffset:CGSizeMake(0, 3) shadowOpacity:0 shadowRadius:0];
    
}

- (void)styleWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{

    [self styteWithCornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth shadowColor:0 shadowOffset:CGSizeMake(0, 3) shadowOpacity:0 shadowRadius:0];

}
- (void)styteWithCornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius{

    [self styteWithCornerRadius:cornerRadius borderColor:nil borderWidth:0 shadowColor:shadowColor shadowOffset:shadowOffset shadowOpacity:shadowOpacity shadowRadius:shadowRadius];
}

- (void)styteWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius{
    self.layer.masksToBounds = YES;
    if(![self isKindOfClass:[UILabel class]]){
        self.clipsToBounds = NO;
    }
    if(borderColor){
        self.layer.borderColor = borderColor.CGColor;
    }
    if(borderWidth != 0){
        self.layer.borderWidth = borderWidth;
    }
    if(cornerRadius != 0){
        self.layer.cornerRadius = cornerRadius;
    }
    
    if(shadowColor){
        self.layer.shadowColor = shadowColor.CGColor;//阴影颜色
    }
    
    if(shadowOpacity != 0){
        self.layer.shadowOpacity = shadowOpacity;//不透明度
    }
    if(shadowRadius != 0){
        self.layer.shadowRadius = shadowRadius;//半径
    }
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    if(!(shadowOffset.width == 0 && shadowOffset.height == 3)){
        self.layer.shadowOffset = shadowOffset;//偏移距离
    }
}
@end
