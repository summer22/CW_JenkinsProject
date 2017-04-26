//
//  CMT_AccountTool.h
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_AccountModel.h"
@interface CMT_AccountTool : NSObject
/**
 *  存储帐号
 */
+ (void)save:(CMT_AccountModel *)accountModel;
/**
 *  读取帐号
 */
+ (CMT_AccountModel *)accountModel;

+ (BOOL)removeEmptyAccountData;

@end
