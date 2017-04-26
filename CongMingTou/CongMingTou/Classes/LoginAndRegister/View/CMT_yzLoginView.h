//
//  CMT_yzLoginView.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"

@protocol CMT_yzLoginViewDelegate <NSObject>
//获取验证码
- (void)getsmsCodeBtnClick:(NSString *)telStr;
//密码登录
- (void)pwdLoginBtnClick;
//登录按钮
- (void)loginBtnClick:(NSString *)telNumb code:(NSString *)codeStr;
@end

@interface CMT_yzLoginView : UIView
@property (nonatomic,assign)id<CMT_yzLoginViewDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet CMT_TextField *telTF;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneLineH;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoLineH;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *pwLoginBtn;
@property (weak, nonatomic) IBOutlet CMT_TextField *yzTF;
@property (weak, nonatomic) IBOutlet UIButton *yzBtn;
@property (nonatomic,assign) NSTimeInterval late;

//倒计时方法
- (void)startTime;

-(void)destroyTimer;

@end
