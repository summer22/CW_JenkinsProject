//
//  CMT_CycleTitleView.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_CycleTitleViewDelegate <NSObject>
//点击某个公告事件
- (void)cycleTitleScrolSelectBtnClick:(int)index;
@end

@interface CMT_CycleTitleView : UIView

@property (nonatomic,assign)id <CMT_CycleTitleViewDelegate> delegate;

- (void)setViewWithUpDownArray:(NSArray *)upDownArray;

@end
