//
//  CMT_ReflectView.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_TextField.h"
#import "CMT_ReflectBankAndAccountInfoModel.h"

@protocol CMT_ReflectViewDelegate <NSObject>

@optional
//提现点击事件
- (void)reflectBtnClick:(NSString *)inputStr;
//提现输入金额
- (void)reflectInputMoneyNumb:(NSString *)inputNumb;

@end

@interface CMT_ReflectView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_ReflectViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *tsLabel;

- (void)setModel:(CMT_ReflectBankAndAccountInfoModel *)model;
@end
