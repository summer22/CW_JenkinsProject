//
//  CMT_BottomBtnView.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BottomBtnView.h"

@implementation CMT_BottomBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setUI];
    }
    return self;
}
- (IBAction)btnAction:(id)sender {
    
    NSLog(@"立即购买");
    if (self.delegate && [self.delegate respondsToSelector:@selector(toPayBtnAction)]) {
        [self.delegate toPayBtnAction];
    }
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_BottomBtnView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    [self.btn setTitleColor:CommonWhiteColor forState:UIControlStateNormal];
}


@end
