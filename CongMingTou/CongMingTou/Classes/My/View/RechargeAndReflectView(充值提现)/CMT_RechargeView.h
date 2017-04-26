//
//  CMT_RechargeView.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"

@protocol CMT_RechargeViewDelegate <NSObject>

@optional
//充值点击事件
- (void)rechargeBtnClick:(NSString *)inputStr;
//获取验证码点击事件
- (void)getYzBtnClick;
@end

@interface CMT_RechargeView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_RechargeViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *yzBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic,assign) NSTimeInterval late;

//倒计时方法
- (void)startTime;

-(void)destroyTimer;

@end
