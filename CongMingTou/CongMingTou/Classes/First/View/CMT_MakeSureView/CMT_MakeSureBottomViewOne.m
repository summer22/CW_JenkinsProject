//
//  CMT_MakeSureBottomViewOne.m
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MakeSureBottomViewOne.h"

@implementation CMT_MakeSureBottomViewOne

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

- (void)setExpectMoney:(NSString *)expectStr{
    self.moneyLabel.text = expectStr;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MakeSureBottomViewOne" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds ; //填一下自动布局的坑！
}

@end
