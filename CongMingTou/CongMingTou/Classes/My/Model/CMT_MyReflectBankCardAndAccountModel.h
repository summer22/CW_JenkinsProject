//
//  CMT_MyReflectBankCardAndAccountModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/10.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_ReflectBankAndAccountInfoModel.h"

@interface CMT_MyReflectBankCardAndAccountModel : NSObject
/** 账户数据源 */
@property (nonatomic,strong)CMT_ReflectBankAndAccountInfoModel *myModel;

+ (CMT_MyReflectBankCardAndAccountModel *)myReflectAccountModelWithDic:(NSDictionary *)dic;

@end
