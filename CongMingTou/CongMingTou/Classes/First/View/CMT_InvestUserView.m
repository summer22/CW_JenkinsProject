//
//  CMT_InvestUserView.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestUserView.h"

@implementation CMT_InvestUserView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_InvestUserView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)setModel:(CMT_homeModel *)model{
    self.userCount.text = [NSString stringWithFormat:@"有%@位用户累计投资:",model.totalInvestPerson];
    self.moneyCount.text = [NSString stringWithFormat:@"%@元",model.totalInvestAmount];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
    self.line.backgroundColor = CommonLineColor;
    self.Lineheight.constant = 0.5;
}


@end
