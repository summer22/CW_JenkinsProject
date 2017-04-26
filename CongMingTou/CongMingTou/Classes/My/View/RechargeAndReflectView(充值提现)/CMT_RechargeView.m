//
//  CMT_RechargeView.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RechargeView.h"

@implementation CMT_RechargeView{
    NSString *textFieldStr;
    dispatch_source_t myTimer;
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

- (IBAction)textFieldChangeVALUE:(id)sender {
    textFieldStr = self.myTextField.text;
}

- (IBAction)getYzBtn:(id)sender {
    CMT_Log(@"获取验证码");
    if (self.delegate && [self.delegate respondsToSelector:@selector(getYzBtnClick)]) {
        [self.delegate getYzBtnClick];
    }

}
- (IBAction)nextBtnAction:(id)sender {
    
    CMT_Log(@"充值");
    [self endEditing:YES];
    if (textFieldStr.length >= CMT_RechargeCodeLenght) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(rechargeBtnClick:)]) {
            [self.delegate rechargeBtnClick:textFieldStr];
        }
    }else{
        [self showHint:@"验证码输入错误"];
    }
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_RechargeView" owner:self options:nil];
    self.MyView.backgroundColor = CommonBgColor;
    [self addSubview:self.MyView];
    self.contentLabel.text = [NSString stringWithFormat:@"已经发送短信至您的银行卡绑定手机号%@上，请注意查收", [CMT_Tools replacePhonewithStar:[CMT_AccountTool accountModel].bankMobile]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}

//记录开始倒计时的时间
- (void)setTimerStr{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval late = [dat timeIntervalSince1970]*1;
    self.late = late;
}

#pragma mark - 验证码倒计时
-(void)startTime{
    
    [self setTimerStr];//开始记录当前时间
    __weak typeof(self) weakself = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    myTimer = _timer;
    dispatch_source_set_timer(myTimer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(myTimer, ^{
        NSInteger timeout = [CMT_Tools returnUploadTime:weakself.late];
        if(timeout<=0){
            dispatch_source_cancel(myTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.yzBtn setTitle:@"点击获取" forState:UIControlStateNormal];
                weakself.yzBtn.alpha = 1;
                weakself.yzBtn.userInteractionEnabled = YES;
            });
        }else{
            NSInteger seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%lds", (long)seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.yzBtn setTitle:strTime forState:UIControlStateNormal];
                weakself.yzBtn.userInteractionEnabled = NO;
            });
        }
    });
    dispatch_resume(myTimer);
}

- (void)destroyTimer{
    if (myTimer) {
        dispatch_source_cancel(myTimer);
        myTimer = nil;
        [self.yzBtn setTitle:@"点击获取" forState:UIControlStateNormal];
        self.yzBtn.userInteractionEnabled = YES;
    }
}

- (void)dealloc{
    [self destroyTimer];
}


@end
