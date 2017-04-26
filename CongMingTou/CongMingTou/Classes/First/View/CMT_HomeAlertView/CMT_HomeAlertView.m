//
//  CMT_HomeAlertView.m
//  CongMingTou
//
//  Created by summer on 17/1/12.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "CMT_HomeAlertView.h"
#import "AppDelegate.h"

@implementation CMT_HomeAlertView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_HomeAlertView" owner:self options:nil];
    [self addSubview:self.myView];
}

//移除
- (void)removeSelf{
    [self.superview removeFromSuperview];
    [self removeFromSuperview];
}

//显示出来
+ (void)showWithDelegateOwer:(id)target typy:(NSString *)typeStr imageType:(NSString *)imageTypeStr amountMoney:(NSString *)amount;
{
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    CMT_HomeAlertView *maskAlertView = [[CMT_HomeAlertView alloc] initWithFrame:appDel.window.bounds];
    UIView *bgView = [[UIView alloc] initWithFrame:appDel.window.bounds];
    bgView.backgroundColor = CMT_RGBACOLOR(1, 1, 1, 0.6);
    [bgView addSubview:maskAlertView];
    maskAlertView.flagStr = typeStr;
    if ([typeStr isEqualToString:@"1"]) {
        maskAlertView.amountLabel.hidden =  YES;
        maskAlertView.closeBtn.hidden = NO;
        if ([imageTypeStr isEqualToString:@"1"]) {
            maskAlertView.bgImgView.image = [UIImage imageNamed:@"CMT_HomeAlertRedPackage"];
        }else{
            maskAlertView.bgImgView.image = [UIImage imageNamed:@"CMT_HomeAlertFu"];
        }
    }else{
        maskAlertView.bgImgView.image = [UIImage imageNamed:@"CMT_HomeGetF"];
        maskAlertView.amountLabel.hidden =  NO;
        maskAlertView.closeBtn.hidden = YES;
        if (amount) {
            maskAlertView.amountLabel.attributedText = [CMT_Tools HeadAttributedString:amount backAttributedString:@" 元" NSheadForegroundColorAttributeName:CommonHomeRedColor NSbackForegroundColorAttributeName:CommonHomeRedColor NSheadFontAttributeName:44 NSbackFontAttributeName:12];
        }
    }
    maskAlertView.center = appDel.window.center;
    maskAlertView.delegate = target;
    [appDel.window addSubview:bgView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.myView];
    self.myView.frame = self.bounds; //填一下自动布局的坑！
}

+ (void)removeSelf
{
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    for (UIView *subView in appDel.window.subviews) {
        if([subView isKindOfClass:[CMT_HomeAlertView class]]){
            CMT_HomeAlertView * alertView = (CMT_HomeAlertView *) subView;
            [alertView removeFromSuperview];
        }
    }
}

- (IBAction)closeBtnAction:(id)sender {
   
    [self removeSelf];
}

- (IBAction)btnAction:(id)sender {
    if ([self.flagStr isEqualToString:@"1"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(clickAlertAction)]) {
            [self.delegate clickAlertAction];
        }
    }
    [self removeSelf];
}

@end
