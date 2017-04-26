//
//  CMT_RegisterView.h
//  CongMingTou
//
//  Created by summer on 2016/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"
@protocol CMT_RegisterViewDelegate <NSObject>
//协议按钮点击
- (void)agreementBtnClick;
//注册点击
- (void)registerBtnClick:(NSString *)telNumb pwd:(NSString *)pwdStr;
@end

@interface CMT_RegisterView : UIView
@property (nonatomic,assign)id<CMT_RegisterViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneLineH;
@property (weak, nonatomic) IBOutlet CMT_TextField *telTF;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoLineH;
@property (weak, nonatomic) IBOutlet CMT_TextField *pwdTF;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

