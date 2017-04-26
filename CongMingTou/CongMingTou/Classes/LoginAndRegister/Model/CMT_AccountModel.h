//
//  CMT_AccountModel.h
//  COngMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_BaseModel.h"
@interface CMT_AccountModel : CMT_BaseModel <NSCoding>

@property (nonatomic, copy) NSString *userId;
/**
 *  手机号
 */
@property (nonatomic, copy) NSString *mobileNo;
/**
 *  是否实名认证0:未实名1:已实名
 */
@property (nonatomic, copy) NSString  *realNameState;
/**
 *  邀请码
 */
@property (nonatomic, copy) NSString  *inviteCode;

/**
 *  真实姓名
 */
@property (nonatomic, copy) NSString  *realName;
/**
 *  身份证号
 */
@property (nonatomic, copy) NSString  *idCardNumber;
/**
 *  银行卡名字
 */
@property (nonatomic, copy) NSString  *bankCardName;
/**
 *  银行卡图标 待定
 */
@property (nonatomic, copy) NSString  *bankCardIcon;
/**
 *  卡的类型   待定
 */
@property (nonatomic, copy) NSString  *bankCardType;
/**
 *  银行卡预留手机号
 */
@property (nonatomic, copy) NSString *bankReservedPhoneNum;

/** 是否设置交易密码 0:未设置 1:已设置*/
@property (nonatomic,copy)NSString *payPasswordState;

/** 实名绑卡手机号 */
@property (nonatomic,copy)NSString *bankMobile;


+ (CMT_AccountModel *)accountModelWithDict:(NSDictionary *)dic;

@end
