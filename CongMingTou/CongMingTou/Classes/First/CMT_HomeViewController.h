//
//  CMT_HomeViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_HomeViewController : CMT_BaseVIewController

/** 类型识别*/
@property (nonatomic,assign)CMTBidPlanType bidPlanType;

/** 版本更新 */
- (void)updateVersion;
//福利金红包
- (void)getHomeAlertData;

@end
