//
//  UIBarButtonItem+Extension.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "CWLeftBtn.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:highImage] forState:UIControlStateHighlighted];
    btn.size = btn.currentBackgroundImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
//    button.showsTouchWhenHighlighted = YES;
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 65, 20);
    button.titleLabel.font = UIFont30;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:CommonBlackColor forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, -20)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemFinishWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 65, 20);
    button.titleLabel.font = UIFont30;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:CommonBlackColor forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -45)];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIBarButtonItem *)itemWithTitle:(NSString *)title WithImageName:(NSString *)imageName buttonContentType:(CMT_ButtonEdgeInsetsStyle )type itemBtnDerictor:(NSString *)direction target:(id)target action:(SEL)action{
   
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 0, 40, 50);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitle:title forState:UIControlStateNormal];
    [button layoutButtonWithEdgeInsetsStyle:type];
    if ([direction isEqualToString:@"left"]) {
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    }else if([direction isEqualToString:@"right"]){
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)LeftItemWithTitle:(NSString *)title WithImageName:(NSString *)imageName target:(id)target action:(SEL)action blackOrWhite:(BOOL)status{
    //导航条返回
    CWLeftBtn *notLivebtn = [[CWLeftBtn alloc] initWithFrame:CGRectMake(0, 15, 50, 15)];
    notLivebtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    if (status == YES) {
        [notLivebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [notLivebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [notLivebtn setTitle:title forState:UIControlStateNormal];
    notLivebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [notLivebtn sizeToFit];
    // 设置尺寸
    [notLivebtn setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    // 监听按钮点击
    [notLivebtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:notLivebtn];
}



@end
