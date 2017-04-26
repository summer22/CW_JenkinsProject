//
//  CMT_RechargeModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_RechargeModel : NSObject
/** 用户身份证号码 */
@property (nonatomic,copy)NSString *idNumber;
/** 用户姓名 */
@property (nonatomic,copy)NSString *accountName;
/** 用户银行卡号码 */
@property (nonatomic,copy)NSString *account;
/** 银行名称 */
@property (nonatomic,copy)NSString *bankName;
/** 第三方商户号Id */
@property (nonatomic,copy)NSString *merchantId;
/** 支付后台回调地址 */
@property (nonatomic,copy)NSString *backResponseUrl;
/** 第三方平台的交易ID */
@property (nonatomic,copy)NSString *orderNoThird;
//* 聪明投的交易ID 
@property (nonatomic,copy)NSString *orderNo;
/** 支付令牌 */
@property (nonatomic,copy)NSString *payToken;

+ (CMT_RechargeModel *)myRechargeModelWithDic:(NSDictionary *)dic;

@end
