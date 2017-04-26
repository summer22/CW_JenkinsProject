//
//  CMT_MyYueyueInvestDetailBottomView.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyYueyueInvestDetailBottomView.h"

@implementation CMT_MyYueyueInvestDetailBottomView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MyYueyueInvestDetailBottomView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

- (void)setMyModel:(CMT_MyInvestRecordDetailModel *)myModel{
    self.numbLabel.text = myModel.businessOrder;
    [self.getMoneyBtn setTitle:myModel.reInvestDes forState:UIControlStateNormal];
}

- (IBAction)getMoneyBtnAction:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(toGetMoneyClick)]) {
        [self.delegate toGetMoneyClick];
    }
}

@end
