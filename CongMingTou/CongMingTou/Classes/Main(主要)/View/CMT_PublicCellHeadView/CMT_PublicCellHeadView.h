//
//  CMT_PublicCellHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_PublicCellHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *leftbtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImagView;
@property (weak, nonatomic) IBOutlet UILabel *homeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *investMidLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeMidLabel;

@property (strong, nonatomic) IBOutlet UIView *MyView;

- (void)setStrData:(NSString *)bidType statusType:(NSString *)type backProfitStr:(NSString *)profitStr withPlanTitle:(NSString *)planTitle homeMidTitle:(NSString *)str;
@end
