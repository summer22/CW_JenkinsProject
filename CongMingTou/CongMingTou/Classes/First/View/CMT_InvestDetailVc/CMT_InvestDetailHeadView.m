//
//  CMT_InvestDetailHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestDetailHeadView.h"

@implementation CMT_InvestDetailHeadView{
    UIView *bgView;
    UIImageView *whiteLineImg;
    UILabel *percentLabel;
    UIImageView *iconImg;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setUI];
        self.backgroundColor = CommonBgColor;
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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_InvestDetailHeadView" owner:self options:nil];
    [self setMyProgressView];
    [self addSubview:self.MyView];
}

- (void)setModel:(CMT_InvestDetailModelData *)model withType:(CMTBidPlanType)bidPlanType{
    
    if (bidPlanType == CMTYyBidPlan) {
        self.yyTopLabel.hidden = NO;
        self.midTsLabel.text = @"本产品投资后计息，不支持提前赎回，按月付息，到期返还本金";
    }else{
        self.yyTopLabel.hidden = YES;
        self.midTsLabel.text = @"本产品投资后计息，不支持提前赎回，产品到期后一次性还本付息";
    }
    if (model.apr) {
        self.profitLabel.attributedText = [CMT_Tools HeadAttributedString:model.apr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonWhiteColor NSbackForegroundColorAttributeName:CommonWhiteColor NSheadFontAttributeName:40 NSbackFontAttributeName:24];
    }
    self.statInvestNumb.text = model.leftAmount;
    self.period.text = model.period;
    self.statDate.text = model.startDate;
    self.gotDate.text = model.endDate;
    self.gotAccountDate.text = model.backDate;
    
    [self setMyProgressValue:[model.loanSchedule floatValue]/100];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
    self.MyView.backgroundColor = CommonBgColor;
    self.bottomtTsView.backgroundColor = [CMT_Tools colorWithHexString:@"#ccebff"];
    self.bottomTitleLabel.textColor = ThemeBlueColor;
    self.bottomTitleLabel.font = [UIFont systemFontOfSize:10];
}

- (void)setMyProgressView{
    
    bgView = [[UIView alloc] init];
    bgView.backgroundColor = [CMT_Tools colorWithHexString:@"#0092eb"];
    [self addSubview:bgView];
    whiteLineImg = [[UIImageView alloc] init];
    whiteLineImg.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:whiteLineImg];
    
    percentLabel = [[UILabel alloc] init];
    percentLabel.textColor = [UIColor whiteColor];
    percentLabel.text = @"0%";
    percentLabel.font = [UIFont systemFontOfSize:12];
    percentLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:percentLabel];
    
    iconImg = [[UIImageView alloc] init];
    iconImg.backgroundColor = [UIColor clearColor];
    iconImg.image = [UIImage imageNamed:@"CMT_ProgressD"];
    [self addSubview:iconImg];
    
    bgView.frame = CGRectMake(0, 157, self.frame.size.width, 1);
    whiteLineImg.frame = CGRectMake(0, 0, 0, 1);
    iconImg.frame = CGRectMake(0, 153, 9, 9);
    percentLabel.frame = CGRectMake(3, 130, 40, 25);
}

- (void)setMyProgressValue:(float)progressValue{
    
    whiteLineImg.frame = CGRectMake(0, 0, progressValue * self.frame.size.width, 1);
    
    NSInteger edgeValue;
    NSInteger iconImgValue;
    if (progressValue == 1) {
        edgeValue = 30;
        iconImgValue = 6;
    }else if(progressValue == 0){
        edgeValue = -3;
        iconImgValue = 0;
    }else{
        edgeValue = 10 *progressValue;
        iconImgValue =3;
    }
    iconImg.frame = CGRectMake(progressValue * self.frame.size.width - iconImgValue, 153, 9, 9);
    
    percentLabel.frame = CGRectMake(progressValue * self.frame.size.width-edgeValue, 130, 40, 25);
    percentLabel.text = [[NSString stringWithFormat:@"%.0f",progressValue*100] stringByAppendingString:@"%"];
    
}

@end
