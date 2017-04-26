//
//  CMT_FingerprintManagerModel.h
//  CongMingTou
//
//  Created by wzh on 16/5/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_FingerprintManagerModel : NSObject<NSCoding>
/**
 *   指纹开锁验证开启状态 0 为关闭 1 开启
 */
@property (nonatomic, assign) NSInteger fingerprintOpenState;
/** 指纹支付*/
@property (nonatomic,assign) NSInteger fingerPayOpenState;

@end
