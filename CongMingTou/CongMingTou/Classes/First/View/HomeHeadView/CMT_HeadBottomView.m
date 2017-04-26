//
//  CMT_HeadBottomView.m
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HeadBottomView.h"

@implementation CMT_HeadBottomView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_HeadBottomView" owner:self options:nil];
    [self addSubview:self.MyView];
    self.leftRightLabel.layer.shadowColor = [CMT_Tools colorWithHexString:@"#000000"].CGColor;
    self.leftRightLabel.layer.shadowOpacity = 0.1;
    self.leftRightLabel.layer.shadowOffset = CGSizeMake(1, 2);
    
    self.leftBottomLabel.layer.shadowColor = [CMT_Tools colorWithHexString:@"#000000"].CGColor;
    self.leftBottomLabel.layer.shadowOpacity = 0.1;
    self.leftBottomLabel.layer.shadowOffset = CGSizeMake(1, 2);
    
    self.rightTopLabel.layer.shadowColor = [CMT_Tools colorWithHexString:@"#000000"].CGColor;
    self.rightTopLabel.layer.shadowOpacity = 0.1;
    self.rightTopLabel.layer.shadowOffset = CGSizeMake(1, 2);
    
    self.rightBottomLabel.layer.shadowColor = [CMT_Tools colorWithHexString:@"#000000"].CGColor;
    self.rightBottomLabel.layer.shadowOpacity = 0.1;
    self.rightBottomLabel.layer.shadowOffset = CGSizeMake(1, 2);
}

- (void)setHadSignDay:(NSString *)dataStr{
    self.hadSignDays.text = dataStr;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}


- (IBAction)signBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toSignBtnClick)]) {
        [self.delegate toSignBtnClick];
    }
}

- (IBAction)safeAgreementBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toSafeAgreementBtnClick)]) {
        [self.delegate toSafeAgreementBtnClick];
    }
}
@end
