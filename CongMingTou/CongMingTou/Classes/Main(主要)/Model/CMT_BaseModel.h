//
//  CMT_BaseModel.h
//  CongMingTou
//
//  Created by wzh on 16/5/19.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_BaseModel.h"
@interface CMT_BaseModel : NSObject

@property (nonatomic ,copy) NSString *status;
@property (nonatomic ,copy) NSString *msg;
@property (nonatomic ,copy) NSString *message;
@property (nonatomic,copy)NSString *right;

/** code*/
@property (nonatomic,strong)NSNumber *code;

- (id)initWithDic:(NSDictionary *)dic;

@end
