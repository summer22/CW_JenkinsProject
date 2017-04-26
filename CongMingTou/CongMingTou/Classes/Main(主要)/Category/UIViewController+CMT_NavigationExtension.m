//
//  UIViewController+CMT_NavigationExtension.m
//  CongMingTou
//
//  Created by summer on 17/1/4.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "UIViewController+CMT_NavigationExtension.h"
#import <objc/runtime.h>

@implementation UIViewController (CMT_NavigationExtension)

- (BOOL)jt_fullScreenPopGestureEnabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setJt_fullScreenPopGestureEnabled:(BOOL)fullScreenPopGestureEnabled {
    objc_setAssociatedObject(self, @selector(jt_fullScreenPopGestureEnabled), @(fullScreenPopGestureEnabled), OBJC_ASSOCIATION_RETAIN);
}

- (CMT_NavigationController *)jt_navigationController {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setJt_navigationController:(CMT_NavigationController *)navigationController {
    objc_setAssociatedObject(self, @selector(jt_navigationController), navigationController, OBJC_ASSOCIATION_ASSIGN);
}

@end
