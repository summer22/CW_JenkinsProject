//
//  versionAlert.m
//  CongMingTou
//
//  Created by summer on 16/6/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "versionAlert.h"

@implementation versionAlert
/**
 *  更新状态标示：1、不需要更新 2、建议更新 3、强制更新
 */
+ (void)versionShow:(CMT_UpVersionModel *)myModel target:(id)target
{
    if ([myModel.versionStatus isEqualToString:@"1"]) {
        return;
    }else if ([myModel.versionStatus isEqualToString:@"2"]) {
        [versionAlert updateShowMessage:myModel.versionDesc target:target];
    }else if ([myModel.versionStatus isEqualToString:@"3"]) {
        [versionAlert toUpdateShowmessage:myModel.versionDesc target:target];
    }
}

//强制更新
+ (void)toUpdateShowmessage:(NSString *)message target:(id)target
{
    versionAlert *alert = [[versionAlert alloc] initWithTitle:@"版本更新提示" message:message delegate:target cancelButtonTitle:nil otherButtonTitles:@"版本更新", nil];
    [alert show];
}

//建议更新
+ (void)updateShowMessage:(NSString *)message target:(id)target{
    versionAlert *alert = [[versionAlert alloc] initWithTitle:@"版本更新提示" message:message delegate:target cancelButtonTitle:@"取消" otherButtonTitles:@"版本更新", nil];
    [alert show];
}


@end
