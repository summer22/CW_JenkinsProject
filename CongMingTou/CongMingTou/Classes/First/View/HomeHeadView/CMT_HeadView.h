//
//  CMT_HeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_homeModel.h"
#import "CMT_LunBoModel.h"
#import "CMT_MyGongGModel.h"
#import "CMT_QiandaoView.h"

@protocol CMT_HeadViewDelegate <NSObject>
//轮播图点击事件
- (void)cycleScrollViewSelectBtnClick:(CMT_LunBoModel *)model;
//公告轮播点击事件
- (void)cycleTitleScrollSelectClick:(CMT_MyGongGModel *)model;
//公告图片点击事件
- (void)gongGaoImgTapClick;
//去签到点击事件
- (void)toSignBtnClick;
//安全保障计划点击事件
- (void)toSafeAgreementBtnClick;
@end

@interface CMT_HeadView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_HeadViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setModel:(CMT_homeModel *)model;

@end
