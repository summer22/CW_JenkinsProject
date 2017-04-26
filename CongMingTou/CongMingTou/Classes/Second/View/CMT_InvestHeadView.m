//
//  CMT_InvestHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestHeadView.h"
#import "CountDown.h"

@implementation CMT_InvestHeadView{
    NSTimer *myTimer;
    NSString *nextInvestTime;
    NSString *bid;
    CountDown *countDown;
}

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


- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_InvestHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
    
    countDown = [[CountDown alloc] init];
    __weak __typeof(self) weakSelf= self;
    ///每秒回调一次
    [countDown countDownWithPER_SECBlock:^{
        [weakSelf setDownTimer];
    }];

}

- (IBAction)investBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toInvestClick:)]) {
        [self.delegate toInvestClick:bid];
    }
}

//数据调试
- (void)setBidPlanData:(CMT_BidPlanModel *)model{
    [self setContent:model];
    [self setBidPlanType:model.period];
    [self setBtnStatus:model.status];
    bid = model.planId;
    nextInvestTime = model.nextInvestTime;
    [self setDownTimer];
}

- (void)setDownTimer{
    
    NSString *downTime = [CMT_Tools getNowTimeWithString:nextInvestTime];
    if ([nextInvestTime isEqualToString:@"-1"]  || [downTime isEqualToString:@"-1"]) {
        self.downTimeLabel.hidden = YES;
    }else{
         self.downTimeLabel.hidden = NO;
         self.downTimeLabel.text = downTime;
    }
}

//设置按钮的状态
- (void)setBtnStatus:(NSString *)btnStatus{
    
    if ([btnStatus isEqualToString:@"1"]) {
        [self.investBtn setTitle:@"立即抢购" forState:UIControlStateNormal];
        [self.investBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailQIangG"] forState:UIControlStateNormal];
    }else{
        [self.investBtn setTitle:@"抢光了~" forState:UIControlStateNormal];
        [self.investBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    }
}

//文字的显示
- (void)setContent:(CMT_BidPlanModel *)model{
    self.bidType.text = model.planTitle;
    self.expectedReturn.attributedText = [CMT_Tools HeadAttributedString:model.apr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:40 NSbackFontAttributeName:24];
    self.period.attributedText = [CMT_Tools HeadAttributedString:model.period backAttributedString:@"天" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:15 NSbackFontAttributeName:15];
    self.startInvestNum.attributedText = [CMT_Tools HeadAttributedString:model.minInvestAmount backAttributedString:@"元" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:15 NSbackFontAttributeName:15];
}

//右上角计划的类型图片
- (void)setBidPlanType:(NSString *)bidType{
    if ([bidType isEqualToString:@"18"]) {
        self.iconImg.image = [UIImage imageNamed:@"CMT_Xin"];
    }else if([bidType isEqualToString:@"30"] || [bidType isEqualToString:@"45"]){
        self.iconImg.image = [UIImage imageNamed:@"CMT_Su"];
    }else{
        self.iconImg.image = [UIImage imageNamed:@"CMT_Yue"];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}


@end
