//
//  ZHTabBar.h
//  Framework
//
//  Created by wzh on 16/5/6.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHTabBar;
@protocol ZHTabBarDelegate <NSObject>
@optional
- (void)tabBar:(ZHTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;
- (void)tabBarDidClickPlusButton:(ZHTabBar *)tabBar;
@end
@interface ZHTabBar : UIView

/**
 *  添加一个选项卡按钮
 *
 *  @param item 选项卡按钮对应的模型数据(标题\图标\选中的图标)
 */
- (void)addTabBarButton:(UITabBarItem *)item;

@property (nonatomic, weak) id<ZHTabBarDelegate> delegate;
@end
