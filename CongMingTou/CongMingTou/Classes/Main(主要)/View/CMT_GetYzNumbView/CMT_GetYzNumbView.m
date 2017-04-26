//
//  CMT_GetYzNumbView.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetYzNumbView.h"

@implementation CMT_GetYzNumbView{
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

- (IBAction)textFieldChange:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getTextFieldNotification:)]) {
        [self.delegate getTextFieldNotification:self.yzTextFiled.text];
    }
}

- (void)setUI{
    
    [[NSBundle mainBundle] loadNibNamed:@"CMT_GetYzNumbView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
}
//点击获取验证码
- (IBAction)yzBtnAction:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getYzNumbClick)]) {
        [self.delegate getYzNumbClick];
    }
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
