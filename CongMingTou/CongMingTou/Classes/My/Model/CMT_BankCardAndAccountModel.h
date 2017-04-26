//
//  CMT_BankCardAndAccountModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_BankCardAndAccountModel : CMT_BaseModel
/** 账户余额（不是银行卡的余额） */
@property (nonatomic,copy)NSString *userBalance;
/** 账户持有人姓名 */
@property (nonatomic,copy)NSString *accountName;
/** 限额提示 */
@property (nonatomic,copy)NSString *limitStr;
/** 银行卡名称 */
@property (nonatomic,copy)NSString *bankName;
/** 身份证号码 */
@property (nonatomic,copy)NSString *idNumber;
/** 银行ID */
@property (nonatomic,copy)NSString *bankId;
/** 银行卡尾号 */
@property (nonatomic,copy)NSString *endNumber;
/** 银行卡账号 */
@property (nonatomic,copy)NSString *accountFull;
/** 银行卡图标地址 */
@property (nonatomic,copy)NSString *bankIconAdress;
/** 每笔限额 */
@property (nonatomic,copy)NSString *onePen;
/** 充值单笔限额 */
@property (nonatomic,copy)NSString *danE;
/** 单日限额 */
@property (nonatomic,copy)NSString *dayE;
/** balance */
@property (nonatomic,copy)NSString *balance;
/** 银行卡名字 */
@property (nonatomic,copy)NSString *bankStr;
/** 第三方支付名字 */
@property (nonatomic,copy)NSString *payname;
/** 银行卡姓名 */
@property (nonatomic,copy)NSString *name;
/** 温馨提示 */
@property (nonatomic,copy)NSString *reminder;
/** 经过处理的银行卡账号 */
@property (nonatomic,copy)NSString *dealAccount;


+ (CMT_BankCardAndAccountModel *)myModelWithDic:(NSDictionary *)dic;

@end
