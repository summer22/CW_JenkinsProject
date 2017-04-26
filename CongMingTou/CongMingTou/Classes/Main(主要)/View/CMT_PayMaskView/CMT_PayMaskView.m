//
//  CMT_PayMaskView.m
//  CongMingTou
//
//  Created by summer on 16/5/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_PayMaskView.h"
#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "CMT_PayTextFiled.h"

@interface CMT_PayMaskView()<UITextFieldDelegate>
/** 支付密码输入框 */
@property (nonatomic,strong) CMT_PayTextFiled *payText;
@property (nonatomic, strong) UIButton *fingerprintBtn;
@end

@implementation CMT_PayMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatSubView];
        self.backgroundColor = CMT_RGBACOLOR(0.2392, 0.1333, 0.1294, 0.5);
    }
    return self;
}

- (void)creatSubView
{
    UIView *bgView = [CMT_Tools getUiviewWithFrame:CGRectMake(0, CMT_ScreenHeight - 160, CMT_ScreenWidth, 160) BackGroudColor:CommonWhiteColor];
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, CMT_ScreenWidth,CMT_ScreenHeight - 160);
    [button addTarget:self action:@selector(hideBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    // 中间标题
    CGSize topLableSize = [CMT_Tools getStrSize:@"输入密码" fontSize:14];
    UILabel *topLable  = [CMT_Tools getLabel:@"输入密码" textFont:14 viewFrame:CGRectMake((CMT_ScreenWidth - topLableSize.width)/2, 17.5, topLableSize.width, topLableSize.height) textAlignments:NSTextAlignmentCenter textColors:[UIColor blackColor]];
    [bgView addSubview:topLable];

    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, 0, 30,30);
    CMT_BTN_NORMAL(backBtn, @"CMT_PayMaskClose");
    backBtn.centerY = topLable.centerY;
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backBtn];
    
    CMT_PayTextFiled *payText = [[CMT_PayTextFiled alloc] initWithFrame:CGRectMake(28.5, topLable.bottom + 25, CMT_ScreenWidth - 57, 50)];
    payText.delegate = self;
    payText.font = [UIFont systemFontOfSize:30];
    [payText addTarget:self action:@selector(textFiledEdingChanged) forControlEvents:UIControlEventEditingChanged];
    self.payText = payText;
    [bgView addSubview:payText];
    
    //忘记密码按钮
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(CMT_ScreenWidth - 60 - 15, payText.bottom + 15, 60,20);
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:ThemeBackgroundColor forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:forgetBtn];
    
    UIView *bottomLineView = [CMT_Tools getUiviewWithFrame:CGRectMake(0 , 159, CMT_ScreenWidth, 0.5) BackGroudColor:CommonLineColor];
    [bgView addSubview:bottomLineView];
    //键盘监听
    [self registerForKeyboardNotifications];
}

//移除自己
- (void)hideBtnClick:(UIButton *)sender
{
    [self removeSelf];
}

//忘记密码
- (void)forgetBtnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(payMaskViewForgetPassBtnClick)]) {
        [self.delegate payMaskViewForgetPassBtnClick];
    }
    [self removeSelf];
}

//返回点击事件
- (void)backBtnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(payMaskViewBackClick)]) {
        [self.delegate payMaskViewBackClick];
    }
    [self removeSelf];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardChangeFrame:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardChangeFrame:(NSNotification *)note
{
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.frame.size.height;
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
    
}

#pragma mark -- 密码输入框的监听
-(void)textFiledEdingChanged
{
    NSInteger length = self.payText.text.length;
    
    if(length==kPasswordLength){
        
        NSString *subTextFeildStr = [self.payText.text substringToIndex:6];;
        if (self.delegate && [self.delegate respondsToSelector:@selector(payMaskViewPassTextField:)]) {
            [self.delegate payMaskViewPassTextField:subTextFeildStr];
        }
    }
    for(NSInteger i=0;i<kPasswordLength;i++){
        
        UILabel *dotLabel = (UILabel *)[self.payText viewWithTag:kDotTag + i];
        
        if(dotLabel){
            
            dotLabel.hidden = length <= i;
        }
    }
    [self.payText sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)show
{
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDel.window addSubview:self];
    [self.payText becomeFirstResponder];
}

//显示出来
+ (void)showWithDelegateOwer:(nullable id) target
{
    CMT_PayMaskView *payMaskView = [[CMT_PayMaskView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight)];
    payMaskView.delegate = target;
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDel.window addSubview:payMaskView];
    [payMaskView.payText becomeFirstResponder];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
//移除
- (void)removeSelf
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [self.superview resignFirstResponder];
    [self.payText resignFirstResponder];
    [self removeFromSuperview];
}

+ (void)removeSelf
{
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    for (UIView *subView in appDel.window.subviews) {
        if([subView isKindOfClass:[CMT_PayMaskView class]]){
            [[NSNotificationCenter defaultCenter]  removeObserver:subView name:UIKeyboardWillChangeFrameNotification object:nil];
            CMT_PayMaskView * payMaskView = (CMT_PayMaskView *) subView;
            [payMaskView.superview resignFirstResponder];
            [payMaskView.payText resignFirstResponder];
            [payMaskView removeFromSuperview];
        }
    }
    
}

@end
