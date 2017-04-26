//
//  CMT_FingerDealPwdConfirmViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_FingerDealPwdConfirmViewController : CMT_BaseVIewController
//交易密码验证回调
@property (nonatomic, copy) void(^backBlock)();

@end
