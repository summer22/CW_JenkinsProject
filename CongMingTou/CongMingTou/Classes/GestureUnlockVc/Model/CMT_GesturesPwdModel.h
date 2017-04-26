//
//  CMT_GesturesPwdModel.h
//  CongMingTou
//
//  Created by wzh on 16/5/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_GesturesPwdModel : NSObject<NSCoding>


/**
 *  手势密码
 */
@property (nonatomic, copy) NSString *gesturePwd;
/**
 *  手势密码开启状态 0 为关闭 1 开启
 */
@property (nonatomic, assign) int openState;

@end
