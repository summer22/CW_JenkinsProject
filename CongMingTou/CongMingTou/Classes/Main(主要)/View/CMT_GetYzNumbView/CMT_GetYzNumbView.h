//
//  CMT_GetYzNumbView.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"
@protocol CMT_GetYzNumbViewDelegate <NSObject>
//验证码点击事件
- (void)getYzNumbClick;
//输入框监听代理
- (void)getTextFieldNotification:(NSString *)textStr;
@end
@interface CMT_GetYzNumbView : UIView
@property (nonatomic,assign)id <CMT_GetYzNumbViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *yzBtn;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet CMT_TextField *yzTextFiled;
@property (nonatomic,assign) NSTimeInterval late;
//倒计时方法
- (void)startTime;

-(void)destroyTimer;

@end
