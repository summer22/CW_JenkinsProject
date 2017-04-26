//
//  CMT_ReflectView.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ReflectView.h"

@implementation CMT_ReflectView{
    NSString *danE;
    NSString *inputStr;
}

- (IBAction)reflectBtn:(id)sender {
    [self endEditing:YES];
    if (inputStr.length > 0) {
        if ([inputStr integerValue] >= CMT_WithdrawalMaxLowLimit) {
            if ([inputStr integerValue] / 10000 <= [danE integerValue]) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(reflectBtnClick:)]) {
                    [self.delegate reflectBtnClick:inputStr];
                }
            }else{
                [self showHint:@"高于单笔提现限额"];
            }
        }else{
            [self showHint:@"低于最小提现金额"];
        }
    }else{
        [self showHint:@"请输入提现金额"];
    }
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

- (IBAction)textFiledValue:(id)sender {
    inputStr = self.myTextField.text;
    if (self.delegate && [self.delegate respondsToSelector:@selector(reflectInputMoneyNumb:)]) {
        [self.delegate reflectInputMoneyNumb:self.myTextField.text];
    }
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_ReflectView" owner:self options:nil];
    self.MyView.backgroundColor = CommonBgColor;
    [self addSubview:self.MyView];
}

- (void)setModel:(CMT_ReflectBankAndAccountInfoModel *)model{
    self.tsLabel.text = [NSString stringWithFormat:@"提现限额，单笔%@万，每日%@万 （限额是由发卡行决定）",model.danE,model.dayE];
    danE = model.danE;

}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}


@end
