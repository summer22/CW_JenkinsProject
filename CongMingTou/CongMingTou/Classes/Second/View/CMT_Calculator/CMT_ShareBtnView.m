//
//  CMT_ShareBtnView.m
//  CongMingTou
//
//  Created by summer on 17/1/11.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "CMT_ShareBtnView.h"

@implementation CMT_ShareBtnView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_ShareBtnView" owner:self options:nil];
    [self addSubview:self.myView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.myView];
    self.myView.frame = self.bounds; //填一下自动布局的坑！
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

- (IBAction)shareBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(myShareBtnAction)]) {
        [self.delegate myShareBtnAction];
    }
}

@end
