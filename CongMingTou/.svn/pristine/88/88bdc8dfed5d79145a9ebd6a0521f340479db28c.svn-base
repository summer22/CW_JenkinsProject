//
//  CMT_TabBar.h
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, HNTabBarType) {
    HNTabBarTypeCustom = 0,
    HNTabBarTypePlus
};

@class CMT_TabBar;

@protocol HNTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(CMT_TabBar *)tabBar;
@end

@interface CMT_TabBar : UITabBar
@property (nonatomic, weak) id<HNTabBarDelegate> tabBarDelegate;
@property (nonatomic, assign) HNTabBarType tabbarType;

@end
