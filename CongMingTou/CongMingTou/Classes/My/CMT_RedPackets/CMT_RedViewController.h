//
//  CMT_RedViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_RedOrCouponModel.h"

@interface CMT_RedViewController : CMT_BaseVIewController

/** 红包和加息券的类别*/
@property (nonatomic,assign) CMT_REDTICKITORCOUPON diffType;
/**  可用 、 已用、 过期 类别枚举
*/
@property (nonatomic,assign)CMT_TICKETSTAUE stateType;
/** 是否回调*/
@property (nonatomic,assign)CMT_COMEFROMTYPE comeFromType;
/** 标的期限 */
@property (nonatomic,copy) NSString *period;

@property (nonatomic, copy) void(^backBlock)(CMT_RedOrCouponModel *userRateModel);

@end
