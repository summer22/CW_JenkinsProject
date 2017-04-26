//
//  CMT_DefaultView.m
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_DefaultView.h"

@implementation CMT_DefaultView

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

- (void)setData:(NSString *)myImg labelText:(NSString *)text{
    self.myLabel.text = text;
    self.myImg.image = [UIImage imageNamed:myImg];
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_DefaultView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
}

//0：红包 1：加息券 2：速速赚 、月月息

- (void)setImgAndLabelContent:(NSString *)type{
    if ([type isEqualToString:@"1"]) {
        self.myImg.image = [UIImage imageNamed:@"CMT_CouponDefault"];
        self.myLabel.text = @"暂时没有加息券哦!";
    }else if([type isEqualToString:@"0"]){
        self.myImg.image = [UIImage imageNamed:@"CMT_RedDefault"];
        self.myLabel.text = @"暂时没有红包哦!";
    }else if([type isEqualToString:@"2"]){
        self.myImg.image = [UIImage imageNamed:@"CMT_YYorFDefault"];
        self.myLabel.text = @"当前暂无持有资产";
    }else if([type isEqualToString:@"3"]){
        self.myImg.image = [UIImage imageNamed:@"CMT_YYorFDefault"];
        self.myLabel.text = @"暂无数据";
    }
}

//156 102
@end
