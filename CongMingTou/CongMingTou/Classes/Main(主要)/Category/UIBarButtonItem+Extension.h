//
//  UIBarButtonItem+Extension.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"

@interface UIBarButtonItem (Extension)
/**
 *  通过图片创建item
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param action    点击后调用的方法
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title WithImageName:(NSString *)imageName buttonContentType:(CMT_ButtonEdgeInsetsStyle)type itemBtnDerictor:(NSString *)direction target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)LeftItemWithTitle:(NSString *)title WithImageName:(NSString *)imageName target:(id)target action:(SEL)action blackOrWhite:(BOOL)status;
+ (UIBarButtonItem *)itemFinishWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
