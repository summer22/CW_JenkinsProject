//
//  CMT_ThreeBtnHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ThreeBtnHeadView.h"

@implementation CMT_ThreeBtnHeadView

- (instancetype)initWithFrame:(CGRect)frame  withTitleArr:(NSArray *)titleArr{
    if(self = [super initWithFrame:frame]){
        [self setUI:titleArr];
    }
    return self;
}

- (void)setUI:(NSArray *)titleArr{

    CGFloat btnWidth = CMT_ScreenWidth / titleArr.count;
    UIButton *btn;
    for (int i = 0; i < titleArr.count; i++) {
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, 36);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:ThemeBlueColor forState:UIControlStateSelected];
        [btn setTitleColor:CommonGrayColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.userInteractionEnabled = YES;
        btn.tag = 300 + i;
        
        [self addSubview:btn];
        if (i > 0) {
            UIView *midline = [[UIView alloc] initWithFrame:CGRectMake(i * btnWidth, 8.5, 1, 22)];
            midline.backgroundColor = CommonLineColor;
            [self insertSubview:midline aboveSubview:btn];
        }
        
        if (i == 0) {
            [self btnAction:btn];
        }
    }
    self.bottomLine = [[UIView alloc] init];
    self.bottomLine.frame = CGRectMake(0, btn.bottom, btnWidth, 3);
    self.bottomLine.backgroundColor = ThemeBlueColor;
    [self addSubview:self.bottomLine];

}

#pragma mark -- 项目详情处 几个按钮的点击事件
- (void)btnAction:(UIButton *)sender
{
    self.selectBtn.selected = NO;
    sender.selected = YES;
    self.selectBtn = sender;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomLine.centerX = sender.centerX;
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topBtnClick:)]) {
        [self.delegate topBtnClick:sender.tag];
    }

}

@end
