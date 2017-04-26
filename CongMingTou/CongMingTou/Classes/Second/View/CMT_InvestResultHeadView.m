//
//  CMT_InvestResultHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestResultHeadView.h"

@implementation CMT_InvestResultHeadView

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

- (void)setModel:(CMT_ToInvestModel *)model{
    self.moneyLabel.text = [model.investAmount stringByAppendingString:@"元"];
    self.productName.text = model.planName;
    
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_InvestResultHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
}

@end
