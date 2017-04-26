//
//  CMT_pwLoginView.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"

@protocol CMT_pwLoginViewDelegate <NSObject>
//忘记密码
- (void)forgotBtnClick:(NSString *)telStr;
//短信登录
- (void)smsLoginBtnClick;
//登录按钮
- (void)loginBtnClick:(NSString *)telNumb pwd:(NSString *)pwdStr;
@end

@interface CMT_pwLoginView : UIView
//delegate
@property (nonatomic,assign)id<CMT_pwLoginViewDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet CMT_TextField *telTF;
@property (weak, nonatomic) IBOutlet CMT_TextField *pwTF;
@property (weak, nonatomic) IBOutlet UIButton *eyeBtn;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneLineH;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoLineH;
@end
