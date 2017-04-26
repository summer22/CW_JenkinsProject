//
//  CMT_MyGongGModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyGongGModel : CMT_BaseModel
/** 公告id */
@property (nonatomic,copy)NSString *platFormNewsId;
/** 公告标题 */
@property (nonatomic,copy)NSString *platFormNewsTitle;

+ (CMT_MyGongGModel *)myGongGModelWithDic:(NSDictionary *)dic;

@end
