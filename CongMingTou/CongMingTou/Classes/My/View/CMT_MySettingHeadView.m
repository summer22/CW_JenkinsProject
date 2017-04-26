//
//  CMT_MySettingHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MySettingHeadView.h"

@implementation CMT_MySettingHeadView

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
//资产总额点击事件
- (IBAction)toLookZC:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toLookZC)]) {
        [self.delegate toLookZC];
    }
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MySettingHeadView" owner:self options:nil];
    self.MyView.backgroundColor = CommonBgColor;
    [self addSubview:self.MyView];
}
- (IBAction)RechargeBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toRechargeClick)]) {
        [self.delegate toRechargeClick];
    }
}
- (IBAction)ReflectBtnActiuon:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toReflectClick)]) {
        [self.delegate toReflectClick];
    }
}

- (void)setMyDataModel:(CMT_MyModel *)model{
    self.myModel = model;
    self.totalNumb.text = self.myModel.totalAssets;
    self.telLabel.text = self.myModel.userMobile;
    self.avilableNumb.text = self.myModel.balance;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
}

@end
