//
//  CMT_RechargeOneStep.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RechargeOneStep.h"

@implementation CMT_RechargeOneStep{
    NSString *inputNumb;
    NSString *oneLimit;
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

- (IBAction)textFieldChange:(id)sender {
    inputNumb = self.textField.text;
    if (self.delegate && [self.delegate respondsToSelector:@selector(rechargeInputMoneyNumb:)]) {
        [self.delegate rechargeInputMoneyNumb:self.textField.text];
    }
}

- (IBAction)nextBtnAction:(id)sender {
    [self endEditing:YES];
    if (self.textField.text.length > 0) {
        if ([self.textField.text integerValue] >=  CMT_TopUpMaxLowLimit) {
            if ([self.textField.text integerValue] <= [oneLimit integerValue]) {
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(rechargeOneStepBtnClick:)]) {
                    [self.delegate rechargeOneStepBtnClick:inputNumb];
                }
            }else{
                [self showHint:@"超过单笔充值限额"];
            }
        }else{
            [self showHint:@"低于最小充值金额"];
        }
    }else{
        [self showHint:@"请输入充值金额"];
    }
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_RechargeOneStep" owner:self options:nil];
    self.MyView.backgroundColor = CommonBgColor;
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}

- (void)setModel:(CMT_BankCardAndAccountModel *)model{
    self.contentLabel.text = model.limitStr;
    oneLimit = model.onePen;
}

@end
