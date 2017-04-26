//
//  CMT_QiandaoView.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_QiandaoView.h"

@implementation CMT_QiandaoView

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
- (void)setModel:(CMT_homeModel *)model{
    self.signDayLabel.text = [NSString stringWithFormat:@"连续签到%@天（%@/7)",model.signDays,model.signDays];
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_QiandaoView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = CommonWhiteColor;
    self.signDayLabel.textColor = CommonWhiteColor;
    self.signBtn.titleLabel.textColor = [CMT_Tools colorWithHexString:@"#ffcc00"];
    self.titleLabel.textColor = CommonWhiteColor;
    self.titleLabel.font = [UIFont systemFontOfSize:18 * CMT_6PERCENTY];
    self.signDayLabel.font = [UIFont systemFontOfSize:12 * CMT_6PERCENTY];
    self.btnH.constant =  self.btnH.constant * CMT_6PERCENTY;
    self.Btnw.constant =  self.Btnw.constant * CMT_6PERCENTY;
    self.titileJ.constant =  self.titileJ.constant * CMT_6PERCENTY;
    self.titleHJ.constant =  self.titleHJ.constant * CMT_6PERCENTY;
    self.signDayJ.constant = self.signDayJ.constant * CMT_6PERCENTY;
}

- (IBAction)signBtnAction:(id)sender {
    CMT_Log(@"我要签到");
    if (self.delegate && [self.delegate respondsToSelector:@selector(qianDaoClick)]) {
        [self.delegate qianDaoClick];
    }
}

@end
