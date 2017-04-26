//
//  CMT_NoSetGesturesSwitchTool.m
//  CongMingTou
//
//  Created by wzh on 16/7/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_NoSetGesturesSwitchTool.h"
#define CMT_NoSetGesturesSwitchFilepath [[ZHSandBoxPath getDocumentDirectory]stringByAppendingPathComponent:@"noSetGesturesSwitch.data"]

@implementation CMT_NoSetGesturesSwitchTool


/**
 *  存储手势帐号
 */
+ (void)save:(CMT_NoSetGesturesSwitchModel *)noSetGesturesSwitchModel{
    // 归档
    [NSKeyedArchiver archiveRootObject:noSetGesturesSwitchModel toFile:CMT_NoSetGesturesSwitchFilepath];
}

/**
 *  读取手势帐号
 */
+ (CMT_NoSetGesturesSwitchModel *)noSetGesturesSwitchModel{
    // 读取帐号
    CMT_NoSetGesturesSwitchModel *gesturesSwitchModel = [NSKeyedUnarchiver unarchiveObjectWithFile:CMT_NoSetGesturesSwitchFilepath];
    return gesturesSwitchModel;
}

+ (BOOL)removeEmptyGesturesPwdData{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:CMT_NoSetGesturesSwitchFilepath]) {
        NSError *err;
        return [fileMgr removeItemAtPath:CMT_NoSetGesturesSwitchFilepath error:&err];
    }else{
        return NO;
    }
}

@end
