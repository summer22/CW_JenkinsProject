//
//  CMT_MakeSureBottomViewTwo.m
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MakeSureBottomViewTwo.h"
#import "AppDelegate.h"

@implementation CMT_MakeSureBottomViewTwo

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MakeSureBottomViewTwo" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

- (IBAction)btnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [self addSelectView];
    }
}

- (void)addSelectView{
    
    CMT_MakeSureListView *listView = [[CMT_MakeSureListView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight)];
    listView.delegate = self;
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDel.window addSubview:listView];
}

- (void)selectBtnClick:(NSString *)nameStr withId:(NSString *)typeId{
    [self.mybtn setTitle:nameStr forState:UIControlStateNormal];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectBtnClick:)]) {
        [self.delegate selectBtnClick:typeId];
    }
    [self btnAction:self.mybtn];
}


@end
