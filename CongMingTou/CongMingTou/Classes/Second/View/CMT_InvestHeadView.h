//
//  CMT_InvestHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_BidPlanModel.h"

@protocol CMT_InvestHeadViewDelegate <NSObject>
//立即投资按钮点击
- (void)toInvestClick:(NSString *)bid;
@end

@interface CMT_InvestHeadView : UIView

@property (nonatomic,assign)id <CMT_InvestHeadViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *expectedReturn;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UILabel *startInvestNum;
@property (weak, nonatomic) IBOutlet UIImageView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIButton *investBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *bidType;
@property (weak, nonatomic) IBOutlet UILabel *downTimeLabel;

- (void)setBidPlanData:(CMT_BidPlanModel *)model;

@end
