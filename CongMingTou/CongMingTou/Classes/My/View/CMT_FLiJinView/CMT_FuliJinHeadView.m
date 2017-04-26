//
//  CMT_FuliJinHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FuliJinHeadView.h"

@implementation CMT_FuliJinHeadView

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

- (IBAction)getFuLiBtn:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(howToGetFuLiJInBtnAction)]) {
        [self.delegate howToGetFuLiJInBtnAction];
    }
}

- (void)setFuLiModel:(CMT_MyFuLiInvestRecordModel *)myModel{
    self.fuLMoney.text = myModel.welfareAmount;
    self.atTimeIncome.text  = myModel.welfareInvest;
    self.willGetIncome.text = myModel.welfareInvestPlanIncome;
    self.totalIncome.text = myModel.welfareInvestAlreadyIncome;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_FuliJinHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = CommonBgColor;
}

@end
