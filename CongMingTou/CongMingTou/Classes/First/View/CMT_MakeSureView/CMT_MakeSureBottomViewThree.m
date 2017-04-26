//
//  CMT_MakeSureBottomViewThree.m
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MakeSureBottomViewThree.h"

@implementation CMT_MakeSureBottomViewThree

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MakeSureBottomViewThree" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
    self.oneLine.backgroundColor = CommonLineColor;
    self.twoLine.backgroundColor = CommonLineColor;
    self.oneLineH.constant = 0.5;
    self.twoLineH.constant = 0.5;
}

- (void)setMyModel:(CMT_MakeSureModelData *)model{
    self.FLabel.text = [model.period stringByAppendingString:@"个月"];
}

@end
