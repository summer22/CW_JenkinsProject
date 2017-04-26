//
//  CMT_FingerprintManagerTool.h
//  CongMingTou
//
//  Created by wzh on 16/5/30.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "CMT_FingerprintManagerModel.h"
@interface CMT_FingerprintManagerTool : NSObject

/**
 *  存储指纹信息
 */
+ (void)save:(CMT_FingerprintManagerModel *)fingerprintManagerModel;

/**
 *  读取指纹信息
 */
+ (CMT_FingerprintManagerModel *)fingerprintManagerModel;
/**
 *  清除指纹缓存信息
*/
+ (BOOL)removeEmptyFingerprintManagerData;

+ (void)fingerprintValidationWithTitle:(NSString *)title Block:(void(^)(BOOL success, NSError *error, NSError *deviceError))block;
@end
