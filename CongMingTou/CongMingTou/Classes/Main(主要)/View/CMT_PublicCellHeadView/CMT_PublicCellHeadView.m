//
//  CMT_PublicCellHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_PublicCellHeadView.h"

@implementation CMT_PublicCellHeadView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setUI];
    }
    return self;
}

//CMT_HomeSecurityBgImg
- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_PublicCellHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
    self.leftbtn.hidden = YES;
    self.leftImagView.hidden = YES;
    self.line.hidden = YES;
    self.homeLeftLabel.hidden = YES;
    self.leftLabel.hidden = YES;
}
//type 0:隐藏小图片 1:隐藏大图片
- (void)setStrData:(NSString *)bidType statusType:(NSString *)type backProfitStr:(NSString *)profitStr withPlanTitle:(NSString *)planTitle homeMidTitle:(NSString *)str {
    self.rightLabel.text = profitStr;
    self.investMidLabel.text = str;
    self.homeMidLabel.text = str;
    if ([type isEqualToString:@"0"]) {
        self.leftImagView.hidden = NO;
        self.homeLeftLabel.hidden = NO;
        self.leftbtn.hidden = YES;
        self.leftLabel.hidden = YES;
        self.line.hidden = YES;
        self.investMidLabel.hidden = YES;
        self.homeMidLabel.hidden = NO;
    }else{
        self.leftImagView.hidden = YES;
        self.homeLeftLabel.hidden = YES;
        self.leftbtn.hidden = NO;
        self.leftLabel.hidden = NO;
        self.line.hidden = NO;
        self.investMidLabel.hidden = NO;
        self.homeMidLabel.hidden = YES;
    }
    [self setBidPlanType:bidType];
}

//右上角计划的类型图片
- (void)setBidPlanType:(NSString *)bidType{
  
    if ([bidType isEqualToString:@"0"]) {
        [self.leftbtn setBackgroundImage: [UIImage imageNamed:@"CMT_InvestSectionOneIcon"] forState:UIControlStateNormal];
        [self.leftbtn setTitle:@"短期" forState:UIControlStateNormal];
        self.leftLabel.text = @"速速赚";
        self.leftLabel.textColor = CommonRedColor;
        self.homeLeftLabel.textColor = CommonRedColor;
        self.homeMidLabel.textColor = CommonRedColor;
        self.homeLeftLabel.text = @"新手福利";
        self.leftImagView.image = [UIImage imageNamed:@"CMT_HomeFire"];
    }else if([bidType isEqualToString:@"1"] ){
        [self.leftbtn setBackgroundImage: [UIImage imageNamed:@"CMT_InvestSectionOneIcon"] forState:UIControlStateNormal];
        [self.leftbtn setTitle:@"短期" forState:UIControlStateNormal];
        self.leftLabel.text = @"速速赚";
        self.leftLabel.textColor = CommonRedColor;
        self.homeLeftLabel.text = @"精品推荐";
        self.homeLeftLabel.textColor = ThemeBlueColor;
        self.investMidLabel.textColor = ThemeBlueColor;
        self.homeMidLabel.textColor = ThemeBlueColor;
        self.leftImagView.image = [UIImage imageNamed:@"CMT_HomeStar"];
    }else{
        [self.leftbtn setBackgroundImage: [UIImage imageNamed:@"CMT_InvestSectionTwoIcon"] forState:UIControlStateNormal];
        [self.leftbtn setTitle:@"长期" forState:UIControlStateNormal];
        self.leftLabel.text = @"月月息";
        self.leftLabel.textColor = ThemeBlueColor;
        self.homeLeftLabel.textColor = ThemeBlueColor;
        self.investMidLabel.textColor = ThemeBlueColor;
        self.homeMidLabel.textColor = ThemeBlueColor;
        self.homeLeftLabel.text = @"精品推荐";
        self.leftImagView.image = [UIImage imageNamed:@"CMT_HomeStar"];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

@end
