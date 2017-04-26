//
//  CMT_pwLoginView.m
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_pwLoginView.h"

@implementation CMT_pwLoginView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_pwLoginView" owner:self options:nil];
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
    self.pwTF.secureTextEntry = YES;
    self.loginBtn.userInteractionEnabled = NO;
}
- (IBAction)textFieldChangeValue:(id)sender {
      self.loginBtn.userInteractionEnabled = [self myRegisterBtnStatus];
}

- (BOOL)myRegisterBtnStatus{

    if (_telTF.text.length >= CMT_PhoneNumLenght && [CMT_Tools isRightPwdStrRule:_pwTF.text] == YES) {
        
        [ self.loginBtn setBackgroundImage:[UIImage imageNamed:@"CMT_BlueLoneBtnImg"] forState:UIControlStateNormal];
        
        return YES;
    }
    
    [ self.loginBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    return NO;
}


//忘记密码
- (IBAction)forgotBtn:(id)sender {
    
    [self endEditing:YES];
    if (_telTF.text.length >= CMT_PhoneNumLenght) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(forgotBtnClick:)]) {
            [self.delegate forgotBtnClick:_telTF.text];
        }
    }else{
        [self showHint:@"请输入正确的手机号"];
    }
    
}
//眼睛
- (IBAction)eyeBtn:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    self.pwTF.secureTextEntry =  !btn.selected;
}
//短信登录
- (IBAction)smsBtn:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(smsLoginBtnClick)]) {
        [self.delegate smsLoginBtnClick];
    }
}
//登录
- (IBAction)Login:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginBtnClick:pwd:)]) {
        [self.delegate loginBtnClick:_telTF.text pwd:_pwTF.text];
    }
}
@end
