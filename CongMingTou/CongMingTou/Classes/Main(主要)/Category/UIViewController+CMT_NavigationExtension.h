//
//  UIViewController+CMT_NavigationExtension.h
//  CongMingTou
//
//  Created by summer on 17/1/4.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_NavigationController.h"

@interface UIViewController (CMT_NavigationExtension)

@property (nonatomic, weak)CMT_NavigationController *jt_navigationController;

@property (nonatomic, assign) BOOL jt_fullScreenPopGestureEnabled;

@end
