//
//  CMT_GetShareContentModel.h
//  CongMingTou
//
//  Created by wzh on 16/6/8.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_GetShareContentModel : CMT_BaseModel
/**
 *  icon地址
 */
@property (nonatomic, copy) NSString *imgUrl;
/**
 *   标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  内容描述
 */
@property (nonatomic, copy) NSString *desc;
/**
 *  连接地址
 */
@property (nonatomic, copy) NSString *link;

+ (CMT_GetShareContentModel *)getShareContentModelWithDic:(NSDictionary *)dic;
@end
