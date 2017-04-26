//
//  CALayer+Animation.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Animation)
- (void)addTransform_ScaleWithDuration:(int)duration;

#pragma mark --调动动画
- (void)addBeatingAnimationWithDuration:(int)duration;
- (void)addBeatingAnimationWithDuration2:(int)duration;

-(void)addsShakeAnimationWithDuration:(int)duration;
@end
