//
//  CMT_RechargeOneStep.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_BankCardAndAccountModel.h"
#import "CMT_TextField.h"

@protocol CMT_RechargeOneStepDelegate <NSObject>

@optional
//下一步点击事件
- (void)rechargeOneStepBtnClick:(NSString *)inputNumb;
//充值输入金额
- (void)rechargeInputMoneyNumb:(NSString *)inputNumb;
@end

@interface CMT_RechargeOneStep : UIView

/** delegate*/
@property (nonatomic,assign)id <CMT_RechargeOneStepDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet CMT_TextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

- (void)setModel:(CMT_BankCardAndAccountModel *)model;

@end
