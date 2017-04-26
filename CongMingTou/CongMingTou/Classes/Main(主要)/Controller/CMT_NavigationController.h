//
//  CMT_NavigationController.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_WrapViewController : CMT_BaseVIewController

@property (nonatomic, strong, readonly) UIViewController *rootViewController;

+ (CMT_WrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end

@interface CMT_NavigationController : UINavigationController

@property (nonatomic, assign) BOOL fullScreenPopGestureEnabled;

@property (nonatomic, copy, readonly) NSArray *jt_viewControllers;

@end

