//
//  CMT_GuideScrollView.h
//  CongMingTou
//
//  Created by summer on 16/6/21.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_GuideScrollViewDelegate <NSObject>
//进入主页
- (void)enterToHome;
@end

@interface CMT_GuideScrollView : UIScrollView

@property (nonatomic,assign)id <CMT_GuideScrollViewDelegate> myDelegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
