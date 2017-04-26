//
//  CMT_RegisterSucessAlertView.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RegisterSucessAlertView.h"
#import "AppDelegate.h"

@implementation CMT_RegisterSucessAlertView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_RegisterSucessAlertView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

//移除
- (void)removeSelf{
    [self.superview removeFromSuperview];
    [self removeFromSuperview];
}

- (IBAction)fastToOpenBtn:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toOpenBtnClick)]) {
        [self.delegate toOpenBtnClick];
    }
    [self removeSelf];
}

//显示出来
+ (void)showWithDelegateOwer:(nullable id) target
{
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    CMT_RegisterSucessAlertView *maskAlertView = [[CMT_RegisterSucessAlertView alloc] initWithFrame:CGRectMake(0, 0, 303, 298)];
    UIView *bgView = [[UIView alloc] initWithFrame:appDel.window.bounds];
    bgView.backgroundColor = CMT_RGBACOLOR(1, 1, 1, 0.6);
    [bgView addSubview:maskAlertView];
    [appDel.window addSubview:bgView];
    maskAlertView.center = appDel.window.center;
    maskAlertView.delegate = target;
}


@end
