//
//  CMT_GetMoneyPlanHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetMoneyPlanHeadView.h"

@implementation CMT_GetMoneyPlanHeadView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_GetMoneyPlanHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)setMyModel:(CMT_GetMyMoneyPlanModel *)myModel{
    self.waitGetProfit.text = myModel.planIncome;
    self.gotProfit.text = myModel.alreadyIncome;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}

@end
