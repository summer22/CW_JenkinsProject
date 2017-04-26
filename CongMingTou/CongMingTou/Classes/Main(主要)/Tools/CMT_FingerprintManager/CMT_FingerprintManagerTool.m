//
//  CMT_FingerprintManagerTool.m
//  CongMingTou
//
//  Created by wzh on 16/5/30.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FingerprintManagerTool.h"
#define CMT_FingerprintManagerFilepath [[ZHSandBoxPath getDocumentDirectory]stringByAppendingPathComponent:@"FingerprintManager.data"]

@implementation CMT_FingerprintManagerTool

+ (void)save:(CMT_FingerprintManagerModel *)fingerprintManagerModel
{
    // 归档
    BOOL status =  [NSKeyedArchiver archiveRootObject:fingerprintManagerModel toFile:CMT_FingerprintManagerFilepath];
    CMT_Log(@"归档状态%ld",status);
    
    CMT_FingerprintManagerModel *fingerprintModel = [NSKeyedUnarchiver unarchiveObjectWithFile:CMT_FingerprintManagerFilepath];
    
    // 判断帐号是否已经过期
    //    NSDate *now = [NSDate date];
    
    //    if ([now compare:account.expires_time] != NSOrderedAscending) { // 过期
    //        account = nil;
    //    }
    CMT_Log(@"存储值状态%ld",fingerprintModel.fingerprintOpenState);
}

+ (CMT_FingerprintManagerModel *)fingerprintManagerModel
{
    // 读取帐号
    CMT_FingerprintManagerModel *fingerprintModel = [NSKeyedUnarchiver unarchiveObjectWithFile:CMT_FingerprintManagerFilepath];
    
    // 判断帐号是否已经过期
    //    NSDate *now = [NSDate date];
    
    //    if ([now compare:account.expires_time] != NSOrderedAscending) { // 过期
    //        account = nil;
    //    }
    CMT_Log(@"支付手势打开状态%ld",fingerprintModel.fingerprintOpenState);

    return fingerprintModel;
}

+ (BOOL)removeEmptyFingerprintManagerData{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:CMT_FingerprintManagerFilepath]) {
        NSError *err;
        return [fileMgr removeItemAtPath:CMT_FingerprintManagerFilepath error:&err];
    }else{
        return NO;
    }
}

+ (void)fingerprintValidationWithTitle:(NSString *)title Block:(void(^)(BOOL success, NSError *error, NSError *deviceError))block{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:title reply:^(BOOL success, NSError *error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (success) {
//                    CMT_Log(@"指纹验证成功");
                    if(block){
                        block(YES,nil,nil);
                    }
                }else{
                    block(NO,error,nil);
//                    CMT_Log(@"指纹验证失败");
                }
            }];
        }];
    }else{
//        CMT_Log(@"设备不支持指纹");
        block(NO,nil,authError);
    }
}

@end
