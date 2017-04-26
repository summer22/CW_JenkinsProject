//
//  CMT_QiandaoView.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_homeModel.h"

@protocol CMT_QiandaoViewDelegate <NSObject>
//签到点击
- (void)qianDaoClick;
@end

@interface CMT_QiandaoView : UIView

@property (nonatomic,assign)id <CMT_QiandaoViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *myImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *signDayLabel;
@property (weak, nonatomic) IBOutlet UIButton *signBtn;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Btnw;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *signDayJ;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titileJ;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHJ;

- (void)setModel:(CMT_homeModel *)model;

@end
