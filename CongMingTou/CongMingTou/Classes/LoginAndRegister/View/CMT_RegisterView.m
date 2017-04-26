//
//  CMT_RegisterView.m
//  CongMingTou
//
//  Created by summer on 2016/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RegisterView.h"

@implementation CMT_RegisterView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_RegisterView" owner:self options:nil];
    [self addSubview:self.MyView];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.oneLine.backgroundColor = CommonLineColor;
    self.oneLineH.constant = 0.5;
    self.twoLine.backgroundColor = CommonLineColor;
    self.twoLineH.constant = 0.5;
    self.pwdTF.secureTextEntry = YES;
    self.registerBtn.userInteractionEnabled = NO;
}

//输入监听
- (IBAction)telAndPwdTextFieldValueChange:(id)sender {
    self.registerBtn.userInteractionEnabled = [self myRegisterBtnStatus];
}

//眼睛点击
- (IBAction)eyeBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    self.pwdTF.secureTextEntry =  !btn.selected;
}

//协议按钮点击
- (IBAction)agreementBtn:(id)sender {
    [self endEditing:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(agreementBtnClick)]) {
        [self.delegate agreementBtnClick];
    }
}

//注册按钮点击
- (IBAction)registerBtn:(id)sender {
    [self endEditing:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(registerBtnClick:pwd:)]) {
        [self.delegate registerBtnClick:_telTF.text pwd:_pwdTF.text];
    }
}

- (BOOL)myRegisterBtnStatus{
    
    if (_telTF.text.length >= CMT_PhoneNumLenght && [CMT_Tools isRightPwdStrRule:_pwdTF.text] == YES) {
        
        [ self.registerBtn setBackgroundImage:[UIImage imageNamed:@"CMT_BlueLoneBtnImg"] forState:UIControlStateNormal];
        
        return YES;
    }
    [ self.registerBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    
    return NO;
}

@end
