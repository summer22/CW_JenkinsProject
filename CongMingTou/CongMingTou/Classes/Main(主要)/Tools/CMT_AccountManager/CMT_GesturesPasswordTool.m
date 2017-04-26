//
//  CMT_GesturesPasswordTool.m
//  CongMingTou
//
//  Created by wzh on 16/5/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GesturesPasswordTool.h"
#define CMT_GesturesPasswordFilepath [[ZHSandBoxPath getDocumentDirectory]stringByAppendingPathComponent:@"gesturesPassword.data"]


@implementation CMT_GesturesPasswordTool

/**
 *  存储手势帐号
 */
+ (void)save:(CMT_GesturesPwdModel *)gesturesPwdModel{
    // 归档
    [NSKeyedArchiver archiveRootObject:gesturesPwdModel toFile:CMT_GesturesPasswordFilepath];
}

/**
 *  读取手势帐号
 */
+ (CMT_GesturesPwdModel *)gesturesPwdModel{
    // 读取帐号
    CMT_GesturesPwdModel *gesturesPwd = [NSKeyedUnarchiver unarchiveObjectWithFile:CMT_GesturesPasswordFilepath];
    return gesturesPwd;
}

+ (BOOL)removeEmptyGesturesPwdData{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:CMT_GesturesPasswordFilepath]) {
        NSError *err;
        return [fileMgr removeItemAtPath:CMT_GesturesPasswordFilepath error:&err];
    }else{
        return NO;
    }
}

@end
