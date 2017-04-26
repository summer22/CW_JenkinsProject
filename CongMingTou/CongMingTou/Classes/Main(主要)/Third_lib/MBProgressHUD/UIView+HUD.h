//
//  UIView+HUD.h
//  CongMingTou
//
//  Created by summer on 16/5/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint;
@end
