//
//  CMT_MakeSureListView.m
//  CongMingTou
//
//  Created by summer on 2016/10/27.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MakeSureListView.h"

@implementation CMT_MakeSureListView{
    NSString *btnTitleStr;
    NSString *btnTag;
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
    btnTag = @"1";
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MakeSureListView" owner:self options:nil];
    [self addSubview:self.MyView];
    self.backgroundColor = CMT_RGBACOLOR(1, 1, 1, 0.6);
    self.topBtn.selected = YES;
    [self topBtn:self.topBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
    self.oneLine.backgroundColor = CommonLineColor;
    self.twoLine.backgroundColor = CommonLineColor;
    self.oneLineH.constant = 0.5;
    self.twoLineH.constant = 0.5;
    self.topH.constant = self.topH.constant * CMT_6PERCENTY;
    
}

- (IBAction)hideMySelfBtnAction:(UIButton *)sender {
    if (self) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectBtnClick:withId:)]) {
            [self.delegate selectBtnClick:btnTitleStr withId:btnTag];
        }
        [self removeFromSuperview];
    }
}

- (IBAction)topBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    btnTitleStr = btn.titleLabel.text;
    btnTag = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectBtnClick:withId:)]) {
        [self.delegate selectBtnClick:btnTitleStr withId:btnTag];
    }
    [self removeFromSuperview];

}


@end
