//
//  CMT_AccountSafeModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_AccountSafeModel : CMT_BaseModel
/** 银行卡名称及尾号（用户没绑卡返回“去绑卡”）*/
@property (nonatomic,copy)NSString *bankInfo;
/** 用户手机号 */
@property (nonatomic,copy)NSString *phone;
/** 支付密码是否设置（没有设置返回“设置”否则返回“修改”） */
@property (nonatomic,copy)NSString *paypwd;
/** 登录密码是否设置（没有设置返回“设置”否则返回“修改”） */
@property (nonatomic,copy)NSString *loginpwd;
/** 实名信息（返回已实名/未实名） */
@property (nonatomic,copy)NSString *realName;

@end
